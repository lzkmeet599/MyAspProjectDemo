using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web;

public partial class gridview : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }
    protected void ASPxButton_Submit_Command(object sender, CommandEventArgs e)
    {
        //张柏晨 20200923 新增、编辑团队报名信息
        //string text = ASPxTextBox1.Text.Trim();
        //string value = ASPxTextBox1.Value.ToString();
        
        //单位名称
        ASPxTextBox textDWMC = (ASPxTextBox)ASPxGridView_TDBBXX.FindEditFormTemplateControl("ASPxTextBox_DWMC");
        string DWMC = textDWMC.Text.Trim();
        
        //组别编码
        ASPxComboBox textZB = (ASPxComboBox)ASPxGridView_TDBBXX.FindEditFormTemplateControl("ASPxComboBox_ZB");
        string ZBBM = textZB.Value.ToString();
        
        //组别名称
        string ZBMC = textZB.Text.Trim();
       
        //团队名称
        ASPxTextBox textTDMC = (ASPxTextBox)ASPxGridView_TDBBXX.FindEditFormTemplateControl("ASPxTextBox_TDMC");
        string TDMC = textTDMC.Text.Trim();
        
        //单位联系方式
        ASPxTextBox texttel = (ASPxTextBox)ASPxGridView_TDBBXX.FindEditFormTemplateControl("ASPxTextBox_tel");
        string tel = texttel.Text.Trim();
       
        //录入时间
        DateTime LRSJ = System.DateTime.Now;

        if (ASPxGridView_TDBBXX.IsNewRowEditing)
        {
            DataSet_DemoTableAdapters.TA_团队报名信息TableAdapter Insert = new DataSet_DemoTableAdapters.TA_团队报名信息TableAdapter();
            Insert.InsertQuery(DWMC, ZBBM, ZBMC, TDMC, tel, LRSJ);

            ASPxGridView_TDBBXX.CancelEdit(); //取消编辑状态
            ASPxGridView_TDBBXX.DataBind();  //刷新数据
        }
        else //编辑
        {
            //获取当前行的id值
            int id = Convert.ToInt32(e.CommandArgument.ToString());
            //int id = Convert.ToInt32(ASPxGridView_TDBBXX.GetRowValues(visibleindex, "id").ToString());
            DataSet_DemoTableAdapters.TA_团队报名信息TableAdapter Update = new DataSet_DemoTableAdapters.TA_团队报名信息TableAdapter();
            Update.UpdateQuery(DWMC, ZBBM, ZBMC, TDMC, tel, LRSJ, id);

            ASPxGridView_TDBBXX.CancelEdit(); //取消编辑状态
            ASPxGridView_TDBBXX.DataBind();  //刷新数据
        }





    }
    protected void ASPxButton_Cancel_Command(object sender, CommandEventArgs e)
    {
        ASPxGridView_TDBBXX.CancelEdit();
    }
    /// <summary>
    /// 新增成员信息
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void addmember(object sender, CommandEventArgs e)
    {
        int index =Convert.ToInt32( Session["visibleindex"].ToString());//获取主表的行号
        ASPxGridView gvdetails = (ASPxGridView)ASPxGridView_TDBBXX.FindDetailRowTemplateControl(index, "ASPxGridView_TDCYXX");
        gvdetails.AddNewRow();
    }

    protected void _DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
    {

    }
    protected void gridview_tdbmxx_DetailRowExpandedChanged(object sender, ASPxGridViewDetailRowEventArgs e)
    {
        if (e.Expanded)
        {
            Session.Remove("visibleindex");
            Session["visibleindex"] = e.VisibleIndex.ToString();
        }
        else {
            Session.Remove("visibleindex");
        }
    }
}