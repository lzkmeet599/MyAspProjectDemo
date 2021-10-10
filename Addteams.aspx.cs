using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class CompetitionManagement_Addteams : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            string username = Context.User.Identity.Name;   //录入人姓名
            Session.Remove("username");
            Session["username"] = username;

            AppManageDataSetTableAdapters.TA_日志信息TableAdapter taLoginuser = new AppManageDataSetTableAdapters.TA_日志信息TableAdapter();
            //获取用户ip地址
            Class_IPAddress getIP = new Class_IPAddress();
            string ip = getIP.GetHostAddress();
            string userid = Class_Common.getUseridByName(username); //录入人编码
            taLoginuser.InsertQuery(username, "进入新增报名信息菜单", "普通用户，操作员ip地址：" + ip +  "，userid：" + userid, DateTime.Now);
        }
    }
    protected void btnAdd_Command(object sender, CommandEventArgs e)
    {
        gvTeam.AddNewRow();
    }

    /// <summary>
    /// 提交团队报名信息
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSubmit_Command(object sender, CommandEventArgs e)
    {
        string index = e.CommandArgument.ToString();
        int Visibleindex = Convert.ToInt32(index);
        string parentidstr = gvTeam.GetRowValues(Visibleindex, "id").ToString();
        int parentid = Convert.ToInt32(parentidstr);

        //1.检查当前用户是否已有报名信息提交了(审核状态为“未交纸质材料”和“审核通过”)，如果已经提交了就不可以再次提交
        AppManageDataSetTableAdapters.TA_团队报名信息TableAdapter taEnroll = new AppManageDataSetTableAdapters.TA_团队报名信息TableAdapter();
        string username = Context.User.Identity.Name;   //录入人姓名
        int submitednumber = (int)taEnroll.ScalarQueryCheckstate(username);

        if(submitednumber>=1)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('操作出错：您已提交过报名信息，每位用户只能提交一次！');", true);
            return;
        }
                
        //2.检查当前报名信息是否忘记添加成员
        AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter taPeople = new AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter();
        AppManageDataSet.TA_团队成员信息DataTable dtPeople=taPeople.GetDataByParentid(parentid);

        int currentnumber = dtPeople.Rows.Count;

        if (currentnumber == 0)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('未添加团队成员！');", true);
            return;
        }

        //3.检查报名成员是否参加了其他队伍
        foreach(AppManageDataSet.TA_团队成员信息Row drPeople in dtPeople.Rows)
        {
            string membername = drPeople.成员姓名.ToString();

            //检查当前成员的手机号是否重复
            if(!drPeople.Is手机号Null())
            {
                string phonenumber = drPeople.手机号.ToString();
                int Checkphonenumber=(int)taPeople.ScalarQueryPhonenumber(phonenumber);
                if(Checkphonenumber>=1)     //手机号重复
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('成员“" + membername + "”的手机号已被注册！');", true);
                    return;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('成员“" + membername + "”的手机号为空！');", true);
                return;
            }

            //检查当前成员的邮箱是否重复
            if (!drPeople.Is电子邮箱Null())
            {
                string email = drPeople.电子邮箱.ToString();
                int Checkemail = (int)taPeople.ScalarQueryEmail(email);
                if (Checkemail >= 1)     //电子邮箱重复
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('成员“" + membername + "”的邮箱已被注册！');", true);
                    return;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('成员“" + membername + "”的邮箱为空！');", true);
                return;
            }
        }

        //4.提交团队报名信息
        try
        {
            taEnroll.UpdateQueryEnrollstate(parentid);

            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('提交成功！');", true);
            gvTeam.DataBind();

            //录入日志信息
            AppManageDataSetTableAdapters.TA_日志信息TableAdapter taSubmitgroup = new AppManageDataSetTableAdapters.TA_日志信息TableAdapter();

            //获取用户ip地址
            Class_IPAddress getIP = new Class_IPAddress();
            string ip = getIP.GetHostAddress();
            
            string userid = Class_Common.getUseridByName(username); //录入人编码

            taSubmitgroup.InsertQuery(username, "提交团队报名信息", "普通用户，操作员ip地址：" + ip + "，提交的团队id：" + parentidstr + "，userid：" + userid, DateTime.Now);
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('提交操作出错！错误信息：" + ex.Message + "');", true);
        }
    }

    /// <summary>
    /// 编辑团队报名信息 编辑于2020年8月13日 张柏晨
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnEdit_Command(object sender, CommandEventArgs e)
    {
        string index = e.CommandArgument.ToString();
        int Visibleindex = Convert.ToInt32(index);                                  //获取主表的索引值
        Session["parentkey"] = gvTeam.GetRowValues(Visibleindex, "id").ToString();  //主表的id值
        //int parentid = Convert.ToInt32(parentidstr);                              //获取主表的行号
        gvTeam.StartEdit(Visibleindex);                                             //打开主表的EditForm
    }

    /// <summary>
    /// 删除团队报名信息 编辑于2020年8月13日 张柏晨
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnDelete_Command(object sender, CommandEventArgs e)
    {
        string index = e.CommandArgument.ToString();                                //获取主表的索引值
        int Visibleindex = Convert.ToInt32(index);
        string parentidstr = gvTeam.GetRowValues(Visibleindex, "id").ToString();    //主表的id值
        int parentid = Convert.ToInt32(parentidstr);                                //获取主表的行号

        AppManageDataSetTableAdapters.TA_团队报名信息TableAdapter taGroupdelete = new AppManageDataSetTableAdapters.TA_团队报名信息TableAdapter();
        taGroupdelete.DeleteQuery(parentid);
        gvTeam.DataBind();

        //录入日志信息----李智凯
        AppManageDataSetTableAdapters.TA_日志信息TableAdapter taDeletegroup = new AppManageDataSetTableAdapters.TA_日志信息TableAdapter();

        //获取用户ip地址
        Class_IPAddress getIP = new Class_IPAddress();
        string ip = getIP.GetHostAddress();

        string username = Context.User.Identity.Name;   //录入人姓名
        string userid = Class_Common.getUseridByName(username); //录入人编码

        taDeletegroup.InsertQuery(username, "删除团队报名信息", "普通用户，操作员ip地址：" + ip + "，删除的团队id：" + parentidstr + "，userid：" + userid, DateTime.Now);

    }

    /// <summary>
    /// 保存团队报名信息
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Command(object sender, CommandEventArgs e)
    {
        //单位名称
        ASPxTextBox txtOrganization = (ASPxTextBox)gvTeam.FindEditFormTemplateControl("txtOrganization");
        string organization = txtOrganization.Text.Trim();

        //组别
        ASPxComboBox cmbGrouptype = (ASPxComboBox)gvTeam.FindEditFormTemplateControl("cmbGrouptype");
        string grouptypeid = cmbGrouptype.Value.ToString().Trim();   //组别编码
        string grouptypename = cmbGrouptype.Text.ToString().Trim();  //组别名称

        //团队名称
        ASPxTextBox txtTeamname = (ASPxTextBox)gvTeam.FindEditFormTemplateControl("txtTeamname");
        string teamname = txtTeamname.Text.Trim();

        //单位联系方式
        ASPxTextBox txtContact = (ASPxTextBox)gvTeam.FindEditFormTemplateControl("txtContact");
        string contact = txtContact.Text.Trim();

        //指导老师姓名
        ASPxTextBox txtAdvisorname = (ASPxTextBox)gvTeam.FindEditFormTemplateControl("txtAdvisorname");
        string advisorname = txtAdvisorname.Text.Trim();

        //指导老师职称
        ASPxTextBox txtAdvisortitle = (ASPxTextBox)gvTeam.FindEditFormTemplateControl("txtAdvisortitle");
        string advisortitle = txtAdvisortitle.Text.Trim();

        //指导老师手机
        ASPxTextBox txtAdvisorphonenumber = (ASPxTextBox)gvTeam.FindEditFormTemplateControl("txtAdvisorphonenumber");
        string advisorphonenumber = txtAdvisorphonenumber.Text.Trim();

        //指导老师邮箱
        ASPxTextBox txtAdvisoremail = (ASPxTextBox)gvTeam.FindEditFormTemplateControl("txtAdvisoremail");
        string advisoremail = txtAdvisoremail.Text.Trim();

        string username = Context.User.Identity.Name;   //录入人姓名
        string userid = Class_Common.getUseridByName(username); //录入人编码

        //当前时间------李智凯
        DateTime timenow = DateTime.Now;

       

        if (gvTeam.IsNewRowEditing)//新增
        {
            try
            {
                AppManageDataSetTableAdapters.TA_团队报名信息TableAdapter taGroupenroll = new AppManageDataSetTableAdapters.TA_团队报名信息TableAdapter();
                taGroupenroll.InsertQuery(null, organization, grouptypeid, grouptypename, teamname, contact, advisorname,
                    advisortitle, advisorphonenumber, advisoremail, userid, username, timenow, null,
                    null, null, null, null, "未提交", "是", null, null,
                    null, null, null, null, null, null, null, null);
                
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('保存成功！');", true);
                gvTeam.CancelEdit();
                gvTeam.DataBind();

                //保存团队报名信息操作日志:用户类型  操作类型  操作数据的主键 ip地址 username userid------李智凯
                AppManageDataSetTableAdapters.TA_日志信息TableAdapter taSaveGroup = new AppManageDataSetTableAdapters.TA_日志信息TableAdapter();
                AppManageDataSetTableAdapters.TA_团队报名信息TableAdapter tagroupid = new AppManageDataSetTableAdapters.TA_团队报名信息TableAdapter();
                AppManageDataSet.TA_团队报名信息DataTable tbgroupid = tagroupid.GetDataByTime(timenow);
                string groupid = null;
                //通过录入时间获取团队id
                foreach (AppManageDataSet.TA_团队报名信息Row trgroupid in tbgroupid.Rows)
                {
                    groupid = trgroupid.id.ToString();
                }

                //获取用户ip地址
                Class_IPAddress getIP = new Class_IPAddress();
                string ip = getIP.GetHostAddress();

                //向数据库传入日志信息
                taSaveGroup.InsertQuery(username, "保存团队报名信息", "普通用户，操作员ip地址：" + ip + "，保存的团队id：" + groupid + "，userid：" + userid, DateTime.Now);
                 


            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('新增操作出错，详细信息如下：'" + ex.Message + "。);", true);
                return;
            }
        }
        else    //编辑 编辑于2020年8月13日 张柏晨
        {
            try
            {
                int parentid = Convert.ToInt32(Session["parentkey"]);  //获取主表的行号

                AppManageDataSetTableAdapters.TA_团队报名信息TableAdapter taGroupupdate = new AppManageDataSetTableAdapters.TA_团队报名信息TableAdapter();
                taGroupupdate.UpdateQuery(null, organization, grouptypeid, grouptypename, teamname, contact, advisorname,
                    advisortitle, advisorphonenumber, advisoremail, userid, username, timenow, null,
                    null, null, null, null, "未提交", "是", null, null, 
                    null, null, null, null, null, null, null, null, parentid);

                gvTeam.CancelEdit();
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('修改成功！');", true);
                gvTeam.DataBind();

                //保存团队报名信息操作日志:用户类型  操作类型  操作数据的主键 ip地址 username userid-----李智凯
                AppManageDataSetTableAdapters.TA_日志信息TableAdapter taEditgrop = new AppManageDataSetTableAdapters.TA_日志信息TableAdapter();
                AppManageDataSetTableAdapters.TA_团队报名信息TableAdapter tagroupid = new AppManageDataSetTableAdapters.TA_团队报名信息TableAdapter();
                AppManageDataSet.TA_团队报名信息DataTable tbgroupid = tagroupid.GetDataByTime(timenow);
                string groupid = null;
                //通过录入时间获取团队id
                foreach (AppManageDataSet.TA_团队报名信息Row trgroupid in tbgroupid.Rows)
                {
                    groupid = trgroupid.id.ToString();
                }

                //获取用户ip地址
                Class_IPAddress getIP = new Class_IPAddress();
                string ip = getIP.GetHostAddress();

                //向数据库传入日志信息
                taEditgrop.InsertQuery(username, "编辑团队报名信息", "普通用户，操作员ip地址：" + ip + "，编辑的团队id：" + groupid + "，userid：" + userid, DateTime.Now);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('修改操作出错，详细信息如下：'" + ex.Message + "。);", true);
                return;
            }
        }

    }

    /// <summary>
    /// 添加报名成员信息
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnAddDetails_Command(object sender, CommandEventArgs e)
    {
        string visibleindexstr = Session["visibleindex"].ToString();
        int visibleindex = Convert.ToInt32(visibleindexstr);    //主表的行号

        ASPxGridView gvTeamdetails = (ASPxGridView)gvTeam.FindDetailRowTemplateControl(visibleindex, "gvTeamdetails");

        gvTeamdetails.AddNewRow();
    }

    /// <summary>
    /// 修改成员信息 编辑于2020年8月16日 张柏晨
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnEditdetails_Command(object sender, CommandEventArgs e)
    {
        //主表的行号
        string visibleindexstr = Session["visibleindex"].ToString();
        int visibleindex = Convert.ToInt32(visibleindexstr);

        ASPxGridView gvTeamdetails = (ASPxGridView)gvTeam.FindDetailRowTemplateControl(visibleindex, "gvTeamdetails");
        string index = e.CommandArgument.ToString();
        int Visibleindex = Convert.ToInt32(index);
        Session["childkey"] = gvTeamdetails.GetRowValues(Visibleindex, "id").ToString();  //获取子表的id
        //int childid = Convert.ToInt32(childidstr);                   //获取子表的行号
        gvTeamdetails.StartEdit(Visibleindex);                         //打开子表的EditForm
    }

    /// <summary>
    /// 删除成员信息 编辑于2020年8月16日 张柏晨
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnDeletedetails_Command(object sender, CommandEventArgs e)
    {
        //主表的行号
        string visibleindexstr = Session["visibleindex"].ToString();
        int visibleindex = Convert.ToInt32(visibleindexstr);
        
        ASPxGridView gvTeamdetails = (ASPxGridView)gvTeam.FindDetailRowTemplateControl(visibleindex, "gvTeamdetails");


        string childindexstr = e.CommandArgument.ToString();    //子表的行号
        int childindex = Convert.ToInt32(childindexstr);
        string childidstr = gvTeamdetails.GetRowValues(childindex, "id").ToString();   //子表的主键id
        int childid = Convert.ToInt32(childidstr);                                     //获取子表表的行号

        AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter taGroupdelete = new AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter();
        taGroupdelete.DeleteQuery(childid);
        gvTeamdetails.DataBind();

        //保存操作日志:用户类型  操作类型  操作数据的主键 ip地址 username userid-----李智凯
        AppManageDataSetTableAdapters.TA_日志信息TableAdapter taEditMember = new AppManageDataSetTableAdapters.TA_日志信息TableAdapter();
        
        //获取录入人姓名
        string username = Context.User.Identity.Name;   //录入人姓名
        string userid = Class_Common.getUseridByName(username); //录入人编码

        //获取用户ip地址
        Class_IPAddress getIP = new Class_IPAddress();
        string ip = getIP.GetHostAddress();

        //向数据库传入日志信息
        taEditMember.InsertQuery(username, "删除团队成员信息", "普通用户，操作员ip地址：" + ip + "，删除的成员id：" + childidstr + "，userid：" + userid, DateTime.Now);
    }

    /// <summary>
    /// 保存成员信息
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSavedetails_Command(object sender, CommandEventArgs e)
    {
        //1.检查成员数量，不能超过限制数量，也不能为0人
        AppManageDataSetTableAdapters.TA_系统参数表TableAdapter taParemeters = new AppManageDataSetTableAdapters.TA_系统参数表TableAdapter();
        AppManageDataSet.TA_系统参数表DataTable dtParameters = taParemeters.GetDataByItemnumber();

        int peoplenumber = 0;
        foreach (AppManageDataSet.TA_系统参数表Row drPeoplenumber in dtParameters.Rows)
        {
            if (!drPeoplenumber.Is参数值Null())
            {
                string peoplenumbervalue = drPeoplenumber.参数值.ToString();
                peoplenumber = Convert.ToInt32(peoplenumbervalue);
            }
            break;
        }

        string parentidstr = Session["parentid"].ToString();
        int parentid = Convert.ToInt32(parentidstr);    //主表的主键，团队id

        AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter taDetails = new AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter();
        AppManageDataSet.TA_团队成员信息DataTable dtDetails = taDetails.GetDataByParentid(parentid);

        int currentnumber = dtDetails.Rows.Count;

        //if (currentnumber >= peoplenumber)
        //{
        //    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('团队成员不能超过 " + peoplenumber + " 人！');", true);
        //    return;
        //}

        //主表的行号
        string visibleindexstr = Session["visibleindex"].ToString();
        int visibleindex = Convert.ToInt32(visibleindexstr);    

        ASPxGridView gvTeamdetails = (ASPxGridView)gvTeam.FindDetailRowTemplateControl(visibleindex, "gvTeamdetails");

        //成员姓名
        ASPxTextBox txtPlayername = (ASPxTextBox)gvTeamdetails.FindEditFormTemplateControl("txtPlayername");
        string playername = txtPlayername.Text.Trim();

        //部门
        ASPxTextBox txtDepartment = (ASPxTextBox)gvTeamdetails.FindEditFormTemplateControl("txtDepartment");
        string department = txtDepartment.Text.Trim();

        //组别名称
        string groupname = Session["grouptypename"].ToString();

        if (groupname.Equals("企事业单位"))
        {
            if (department.Length <= 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('团队成员的“部门”不能为空！');", true);
                return;
            }
        }

        //专业
        ASPxTextBox txtMajor = (ASPxTextBox)gvTeamdetails.FindEditFormTemplateControl("txtMajor");
        string major = txtMajor.Text.Trim();

        if (groupname.Equals("本科高等院校") || groupname.Equals("职业院校"))
        {
            if (major.Length <= 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('团队成员的“专业”不能为空！');", true);
                return;
            }
        }

        //年级
        ASPxTextBox txtGrade = (ASPxTextBox)gvTeamdetails.FindEditFormTemplateControl("txtGrade");
        string grade = txtGrade.Text.Trim();

        if (groupname.Equals("本科高等院校") || groupname.Equals("职业院校"))
        {
            if (grade.Length <= 1)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('团队成员的“年级”不能为空！');", true);
                return;
            }
        }

        //学历
        ASPxComboBox cmbEducationlevel = (ASPxComboBox)gvTeamdetails.FindEditFormTemplateControl("cmbEducationlevel");
        string educationlevelid = cmbEducationlevel.Value.ToString().Trim();   //学历编码
        string educationlevelname = cmbEducationlevel.Text.ToString().Trim();  //学历名称

        //手机号
        ASPxTextBox txtPhonenumber = (ASPxTextBox)gvTeamdetails.FindEditFormTemplateControl("txtPhonenumber");
        string phonenumber = txtPhonenumber.Text.Trim();

        //2.检查报名成员是否参加了其他队伍
        AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter taPeople = new AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter();

       
        
        //邮箱
        ASPxTextBox txtEmail = (ASPxTextBox)gvTeamdetails.FindEditFormTemplateControl("txtEmail");
        string email = txtEmail.Text.Trim();
        


        AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter taTeamdetails = new AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter();

        if (gvTeamdetails.IsNewRowEditing)//新增
        {
            //新增的时候需要做的检查，编辑的时候不需要检查
            if (currentnumber >= peoplenumber)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('团队成员不能超过 " + peoplenumber + " 人！');", true);
                return;
            }

            //检查当前成员的邮箱是否重复
            int Checkemail = (int)taPeople.ScalarQueryByEmail(email);
            if (Checkemail >= 1)     //电子邮箱重复
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('当前成员的邮箱已被注册！');", true);
                return;
            }

            //检查当前成员的手机号是否重复
            if (phonenumber.Length == 11)
            {
                int Checkphonenumber = (int)taPeople.ScalarQueryByPhoneNumber(phonenumber);
                if (Checkphonenumber >= 1)     //手机号重复
                {
                    ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('当前成员的手机号已被注册！');", true);
                    return;
                }
            }
            else
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('当前成员的手机号格式错误！');", true);
                return;
            }

            try
            {
                taTeamdetails.InsertQuery(parentid, null, playername, department, major, grade, educationlevelid,
                    educationlevelname, phonenumber, email, "是", null, null, null, null, null,
                    null, null, null, null, null);

                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('保存成功！');", true);
                gvTeamdetails.CancelEdit();
                gvTeamdetails.DataBind();

                //保存操作日志:用户类型  操作类型  操作数据的主键 ip地址 username userid-----李智凯
                AppManageDataSetTableAdapters.TA_日志信息TableAdapter taAddMember = new AppManageDataSetTableAdapters.TA_日志信息TableAdapter();
                AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter tamemberid = new AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter();
                AppManageDataSet.TA_团队成员信息DataTable tbmemberid = tamemberid.GetDataByEmailandPhone(email, phonenumber);
                string memberid = null;
                //通过录入时间获取团队id
                foreach (AppManageDataSet.TA_团队成员信息Row trmemberid in tbmemberid.Rows)
                {
                    memberid = trmemberid.id.ToString();
                }

                //获取录入人姓名
                string username = Context.User.Identity.Name;   //录入人姓名
                string userid = Class_Common.getUseridByName(username); //录入人编码

                //获取用户ip地址
                Class_IPAddress getIP = new Class_IPAddress();
                string ip = getIP.GetHostAddress();

                //向数据库传入日志信息
                taAddMember.InsertQuery(username, "保存团队成员信息", "普通用户，操作员ip地址：" + ip + "，保存的成员id：" + memberid + "，userid：" + userid, DateTime.Now);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('新增成员出错，详细信息如下：'" + ex.Message + "。);", true);
                return;
            }
        }
        else    //编辑 编辑于2020年8月13日 张柏晨
        {
            try
            {
                //string childindexstr = e.CommandArgument.ToString();    //子表的行号
                //int childindex = Convert.ToInt32(childindexstr);
                //string childidstr = gvTeamdetails.GetRowValues(childindex, "id").ToString();   //子表的主键id
                //int childid = Convert.ToInt32(childidstr);                                     //获取子表表的行号
                int childid = Convert.ToInt32(Session["childkey"]);                              //子表的主键id
                taTeamdetails.UpdateQuery(parentid, null, playername, department, major, grade, educationlevelid,
                    educationlevelname, phonenumber, email, "是", null, null, null, null, null,
                    null, null, null, null, null, childid);

                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('修改成功！');", true);
                gvTeamdetails.CancelEdit();
                gvTeamdetails.DataBind();

                //保存操作日志:用户类型  操作类型  操作数据的主键 ip地址 username userid-----李智凯
                AppManageDataSetTableAdapters.TA_日志信息TableAdapter taEditMember = new AppManageDataSetTableAdapters.TA_日志信息TableAdapter();
                AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter tamemberid = new AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter();
                AppManageDataSet.TA_团队成员信息DataTable tbmemberid = tamemberid.GetDataByEmailandPhone(email, phonenumber);
                string memberid = null;
                //通过录入时间获取团队id
                foreach (AppManageDataSet.TA_团队成员信息Row trmemberid in tbmemberid.Rows)
                {
                    memberid = trmemberid.id.ToString();
                }

                //获取录入人姓名
                string username = Context.User.Identity.Name;   //录入人姓名
                string userid = Class_Common.getUseridByName(username); //录入人编码

                //获取用户ip地址
                Class_IPAddress getIP = new Class_IPAddress();
                string ip = getIP.GetHostAddress();

                //向数据库传入日志信息
                taEditMember.InsertQuery(username, "编辑团队成员信息", "普通用户，操作员ip地址：" + ip + "，编辑的成员id：" + memberid + "，userid：" + userid, DateTime.Now);
            }
            catch (Exception ex)
            {
                ScriptManager.RegisterStartupScript(this, GetType(), "", "alert('编辑操作出错，详细信息如下：'" + ex.Message + "。);", true);
                return;
            }
        }

    }

    /// <summary>
    /// 在子表显示时获取主表的主键和组别名称
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvTeamdetails_BeforePerformDataSelect(object sender, EventArgs e)
    {
        Session.Remove("parentid");
        Session["parentid"] = (sender as ASPxGridView).GetMasterRowKeyValue();
        
        Session.Remove("grouptypename");
        Session["grouptypename"] = (sender as ASPxGridView).GetMasterRowFieldValues("组别名称");

    }

    /// <summary>
    /// 在主表明细展开时获取主表的行号
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void gvTeam_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
    {
        if(e.Expanded)
        {
            Session.Remove("visibleindex");
            Session["visibleindex"] = e.VisibleIndex.ToString();
        }
        else
        {
            Session.Remove("visibleindex");
        }
    }
}