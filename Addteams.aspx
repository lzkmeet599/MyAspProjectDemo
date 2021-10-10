<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Addteams.aspx.cs" Inherits="CompetitionManagement_Addteams" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="overflow-y: auto; overflow-x: auto;">
            <dx:ASPxButton ID="btnAdd" runat="server" ClientInstanceName="cl_btnAdd" Text="新增"
                EnableTheming="True" CausesValidation="False" Theme="Aqua" OnCommand="btnAdd_Command">
                <ClientSideEvents Click="function(s, e) {                                
                            }" />
            </dx:ASPxButton>
            <dx:ASPxGridView ID="gvTeam" runat="server" AutoGenerateColumns="False" ClientInstanceName="cl_gvTeam" DataSourceID="odsTeams" KeyFieldName="id"
                EnableTheming="True" Theme="Aqua" OnDetailRowExpandedChanged="gvTeam_DetailRowExpandedChanged">
                <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailButtons="True" ShowDetailRow="True" />
                <SettingsEditing Mode="PopupEditForm" />
                <Settings ShowTitlePanel="True" />
                <SettingsPopup>
                    <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" />
                </SettingsPopup>
                <SettingsText EmptyDataRow="暂无未提交的报名信息" PopupEditFormCaption="报名信息" Title="竞赛报名信息录入" />
                <Columns>
                    <dx:GridViewDataTextColumn Caption="操作" ShowInCustomizationForm="True" VisibleIndex="18">
                        <HeaderCaptionTemplate>
                            <label style="width: 120px; display: block; text-align: center; cursor: pointer;">操作</label>
                        </HeaderCaptionTemplate>
                        <DataItemTemplate>
                            <table>
                                <tr>
                                    <td>
                                        <dx:ASPxButton ID="btnSubmit" runat="server" ClientInstanceName="cl_btnSubmit" CommandArgument="<%# Container.VisibleIndex %>" OnCommand="btnSubmit_Command" Text="提交" Theme="Aqua">
                                            <ClientSideEvents Click="function(s, e) {
                                        if(confirm(&quot;确认提交吗？&quot;))
	                                        {
	                                                e.processOnServer=true;
	                                        }
	                                        else
	                                        {
                                                    e.processOnServer=false;
	                                        }	
                                        }" />
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnEdit" runat="server" ClientInstanceName="cl_btnEdit" CommandArgument="<%# Container.VisibleIndex %>" OnCommand="btnEdit_Command" Text="编辑" Theme="Aqua">
                                        </dx:ASPxButton>
                                    </td>
                                    <td>
                                        <dx:ASPxButton ID="btnDelete" runat="server" ClientInstanceName="cl_btnDelete" CommandArgument="<%# Container.VisibleIndex %>" Text="删除" Theme="Aqua" OnCommand="btnDelete_Command">
                                            <ClientSideEvents Click="function(s, e) {
	                                            if(confirm(&quot;确认删除吗？&quot;))
	                                            {
	                                                    e.processOnServer=true;
	                                            }
	                                            else
	                                            {
                                                        e.processOnServer=false;
	                                            }
                                            }" />
                                        </dx:ASPxButton>
                                    </td>
                                </tr>
                            </table>
                        </DataItemTemplate>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="false">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="单位编码" Visible="false" VisibleIndex="0">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="单位名称" VisibleIndex="19">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="组别编码" VisibleIndex="20">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="组别名称" VisibleIndex="21">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="团队名称" VisibleIndex="22">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="单位联系方式" VisibleIndex="23">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="指导老师姓名" VisibleIndex="24">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="指导老师职称" VisibleIndex="25">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="指导老师手机" VisibleIndex="26">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="指导老师邮箱" VisibleIndex="27">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="录入人编码" Visible="false" VisibleIndex="1">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="录入人姓名" Visible="false" VisibleIndex="2">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="录入时间" Visible="false" VisibleIndex="3">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="提交时间" Visible="false" VisibleIndex="4">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="审核人编码" Visible="false" VisibleIndex="5">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="审核人姓名" Visible="false" VisibleIndex="6">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="审核时间" VisibleIndex="28">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="审核意见" VisibleIndex="29">
                        <CellStyle Font-Bold="True" ForeColor="Red">
                        </CellStyle>
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="审核状态" VisibleIndex="30">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="是否启用" Visible="false" VisibleIndex="7">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="备用一" Visible="false" VisibleIndex="8">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="备用二" Visible="false" VisibleIndex="9">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="备用三" Visible="false" VisibleIndex="10">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="备用四" Visible="false" VisibleIndex="11">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="备用五" Visible="false" VisibleIndex="12">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="备用六" Visible="false" VisibleIndex="13">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataDateColumn FieldName="备用七" Visible="false" VisibleIndex="14">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataDateColumn FieldName="备用八" Visible="false" VisibleIndex="15">
                    </dx:GridViewDataDateColumn>
                    <dx:GridViewDataTextColumn FieldName="备用九" Visible="false" VisibleIndex="16">
                    </dx:GridViewDataTextColumn>
                    <dx:GridViewDataTextColumn FieldName="备用十" Visible="false" VisibleIndex="17">
                    </dx:GridViewDataTextColumn>
                </Columns>
                <Templates>
                    <EditForm>
                        <fieldset>
                            <legend>报名信息</legend>
                            <table width="800px" border="0">
                                <tr>
                                    <td class="table_label">
                                        <dx:ASPxLabel ID="lbOrganization" runat="server" Text="单位或学校名称："></dx:ASPxLabel>
                                    </td>
                                    <td class="table_input">
                                        <dx:ASPxTextBox ID="txtOrganization" runat="server" Text='<%# Bind("单位名称") %>'
                                            ClientInstanceName="cl_txtOrganization">
                                            <ValidationSettings ErrorText="">
                                                <RequiredField ErrorText="必填！" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="table_label">
                                        <dx:ASPxLabel ID="lbGrouptype" runat="server" Text="组别：" ClientInstanceName="cl_lbGrouptype">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td class="table_input">
                                        <dx:ASPxComboBox ID="cmbGrouptype" runat="server" ClientInstanceName="cl_cmbGrouptype"
                                            Text='<%# Bind("组别名称") %>' Value='<%# Bind("组别编码") %>'>
                                            <Items>
                                                <dx:ListEditItem Text="本科高等院校" Value="Z01" />
                                                <dx:ListEditItem Text="职业院校" Value="Z02" />
                                                <dx:ListEditItem Text="企事业单位" Value="Z03" />
                                                <dx:ListEditItem Text="网络安全企业(含技术爱好者)" Value="Z04" />
                                            </Items>
                                            <ValidationSettings ErrorText="">
                                                <RequiredField ErrorText="必填！" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxComboBox>

                                    </td>
                                </tr>
                                <tr>
                                    <td class="table_label">
                                        <dx:ASPxLabel ID="lbTeamname" runat="server" Text="团队名称："></dx:ASPxLabel>
                                    </td>
                                    <td class="table_input">
                                        <dx:ASPxTextBox ID="txtTeamname" runat="server" Text='<%# Bind("团队名称") %>'
                                            ClientInstanceName="cl_txtTeamname">
                                            <ValidationSettings ErrorText="">
                                                <RequiredField ErrorText="必填！" IsRequired="True" />
                                            </ValidationSettings>
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="table_label">
                                        <dx:ASPxLabel ID="lbContact" runat="server" Text="单位联系方式：">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td class="table_input">
                                        <dx:ASPxTextBox ID="txtContact" runat="server" Text='<%# Bind("单位联系方式") %>'
                                            ClientInstanceName="cl_txtContact">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table_label">
                                        <dx:ASPxLabel ID="lbAdvisorname" runat="server" Text="指导老师姓名："></dx:ASPxLabel>
                                    </td>
                                    <td class="table_input">
                                        <dx:ASPxTextBox ID="txtAdvisorname" runat="server" Text='<%# Bind("指导老师姓名") %>'
                                            ClientInstanceName="cl_txtAdvisorname">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="table_label">
                                        <dx:ASPxLabel ID="lbAdvisortitle" runat="server" Text="指导老师职称："></dx:ASPxLabel>
                                    </td>
                                    <td class="table_input">
                                        <dx:ASPxTextBox ID="txtAdvisortitle" runat="server" Text='<%# Bind("指导老师职称") %>'
                                            ClientInstanceName="cl_txtAdvisortitle">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="table_label">
                                        <dx:ASPxLabel ID="lbAdvisorphonenumber" runat="server" Text="指导老师手机："></dx:ASPxLabel>
                                    </td>
                                    <td class="table_input">
                                        <dx:ASPxTextBox ID="txtAdvisorphonenumber" runat="server" Text='<%# Bind("指导老师手机") %>'
                                            ClientInstanceName="cl_txtAdvisorphonenumber">
                                        </dx:ASPxTextBox>
                                    </td>
                                    <td class="table_label">
                                        <dx:ASPxLabel ID="lbAdvisoremail" runat="server" Text="指导老师邮箱："></dx:ASPxLabel>
                                    </td>
                                    <td class="table_input">
                                        <dx:ASPxTextBox ID="txtAdvisoremail" runat="server" Text='<%# Bind("指导老师邮箱") %>'
                                            ClientInstanceName="cl_txtAdvisoremail">
                                        </dx:ASPxTextBox>
                                    </td>
                                </tr>
                            </table>
                        </fieldset>
                        <table class="formsubmit">
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxButton ID="btnSave" runat="server" Text="保存" ClientInstanceName="cl_btnSave"
                                        CommandArgument='<%# Eval("id") %>' OnCommand="btnSave_Command">
                                    </dx:ASPxButton>
                                    <dx:ASPxButton ID="btnCancel" runat="server" Text="取消" AutoPostBack="False"
                                        CausesValidation="False" ClientInstanceName="cl_btnCancel">
                                        <ClientSideEvents Click="function(s, e) {
	                                            cl_gvTeam.CancelEdit();
                                            }" />
                                    </dx:ASPxButton>
                                </td>
                            </tr>
                        </table>
                    </EditForm>
                    <DetailRow>
                        <table style="margin: 0 auto">
                            <tr>
                                <td>
                                    <dx:ASPxButton ID="btnAddDetails" runat="server" ClientInstanceName="cl_btnAddDetails" Text="新增成员"
                                        EnableTheming="True" CausesValidation="False" Theme="Aqua" OnCommand="btnAddDetails_Command">
                                    </dx:ASPxButton>
                                    <dx:ASPxGridView ID="gvTeamdetails" runat="server" ClientInstanceName="cl_gvTeamdetails"
                                        DataSourceID="odsTeamdetails" KeyFieldName="id" OnBeforePerformDataSelect="gvTeamdetails_BeforePerformDataSelect">
                                        <SettingsEditing Mode="PopupEditForm"></SettingsEditing>
                                        <SettingsPopup>
                                            <EditForm AllowResize="True" HorizontalAlign="WindowCenter" Modal="True" VerticalAlign="WindowCenter" />
                                        </SettingsPopup>
                                        <SettingsText EmptyDataRow="暂无成员信息" PopupEditFormCaption="添加成员信息" />
                                        <Columns>
                                            <dx:GridViewDataTextColumn Caption="操作" ShowInCustomizationForm="True" VisibleIndex="0" CellStyle-HorizontalAlign="Center" Width="100px"
                                                HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Center">
                                                </CellStyle>
                                                <HeaderCaptionTemplate>
                                                    <label style="width: 120px; display: block; text-align: center; cursor: pointer;">操作</label>
                                                </HeaderCaptionTemplate>
                                                <DataItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <dx:ASPxButton ID="btnEditdetails" runat="server" ClientInstanceName="cl_btnEditdetails" CommandArgument="<%# Container.VisibleIndex %>"
                                                                    OnCommand="btnEditdetails_Command" Text="编辑" Theme="Aqua">
                                                                </dx:ASPxButton>
                                                            </td>
                                                            <td>
                                                                <dx:ASPxButton ID="btnDeletedetails" runat="server" ClientInstanceName="cl_btnDeletedetails"
                                                                    CommandArgument="<%# Container.VisibleIndex %>" Text="删除" Theme="Aqua" OnCommand="btnDeletedetails_Command">
                                                                    <ClientSideEvents Click="function(s, e) {
	                                                            if(confirm(&quot;确认删除吗？&quot;))
	                                                            {
	                                                                    e.processOnServer=true;
	                                                            }
	                                                            else
	                                                            {
                                                                        e.processOnServer=false;
	                                                            }
                                                            }" />
                                                                </dx:ASPxButton>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </DataItemTemplate>
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="false">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="成员姓名" VisibleIndex="2" CellStyle-HorizontalAlign="Center" Width="100px" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="所属部门" VisibleIndex="4" CellStyle-HorizontalAlign="Center" Width="100px" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="所属专业" VisibleIndex="6" CellStyle-HorizontalAlign="Center" Width="100px" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="所属年级" VisibleIndex="8" CellStyle-HorizontalAlign="Center" Width="100px" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="学历名称" VisibleIndex="10" CellStyle-HorizontalAlign="Center" Width="100px" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="手机号" VisibleIndex="12" CellStyle-HorizontalAlign="Center" Width="100px" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="电子邮箱" VisibleIndex="14" CellStyle-HorizontalAlign="Center" Width="100px" HeaderStyle-HorizontalAlign="Center">
                                                <HeaderStyle HorizontalAlign="Center" />
                                                <CellStyle HorizontalAlign="Center">
                                                </CellStyle>
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Templates>
                                            <EditForm>
                                                <fieldset>
                                                    <legend>成员信息</legend>
                                                    <table width="800px" border="0">
                                                        <tr>
                                                            <td class="table_label">
                                                                <dx:ASPxLabel ID="lbPlayername" runat="server" Text="成员姓名："></dx:ASPxLabel>
                                                            </td>
                                                            <td class="table_input">
                                                                <dx:ASPxTextBox ID="txtPlayername" runat="server" Text='<%# Bind("成员姓名") %>'
                                                                    Width="200px" ClientInstanceName="cl_txtPlayername">
                                                                    <ValidationSettings ErrorText="">
                                                                        <RequiredField ErrorText="必填！" IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td class="table_label">
                                                                <dx:ASPxLabel ID="lbDepartment" runat="server" Text="部门(在职人士必填)：">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td class="table_input">
                                                                <dx:ASPxTextBox ID="txtDepartment" runat="server" Text='<%# Bind("所属部门") %>'
                                                                    Width="200px" ClientInstanceName="cl_txtDepartment">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="table_label">
                                                                <dx:ASPxLabel ID="lbMajor" runat="server" Text="专业(学生必填)：">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td class="table_input">
                                                                <dx:ASPxTextBox ID="txtMajor" runat="server" Text='<%# Bind("所属专业") %>'
                                                                    Width="200px" ClientInstanceName="cl_txtMajor">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td class="table_label">
                                                                <dx:ASPxLabel ID="lbGrade" runat="server" Text="年级(学生必填)：">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td class="table_input">
                                                                <dx:ASPxTextBox ID="txtGrade" runat="server" Text='<%# Bind("所属年级") %>'
                                                                    Width="200px" ClientInstanceName="cl_txtGrade">
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="table_label">
                                                                <dx:ASPxLabel ID="lbEducationlevel" runat="server" Text="学历：">
                                                                </dx:ASPxLabel>
                                                            </td>
                                                            <td class="table_input">
                                                                <dx:ASPxComboBox ID="cmbEducationlevel" runat="server" ClientInstanceName="cl_cmbEducationlevel"
                                                                    Width="200px" DataSourceID="odsEducationlevel"
                                                                    Text='<%# Bind("学历名称") %>' Value='<%# Bind("学历编码") %>'
                                                                    TextField="学历名称" ValueField="学历编码">
                                                                    <ValidationSettings ErrorText="">
                                                                        <RequiredField ErrorText="必填！" IsRequired="True" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxComboBox>
                                                            </td>
                                                            <td class="table_label">
                                                                <dx:ASPxLabel ID="lbPhonenumber" runat="server" Text="手机号："></dx:ASPxLabel>
                                                            </td>
                                                            <td class="table_input">
                                                                <dx:ASPxTextBox ID="txtPhonenumber" runat="server" Text='<%# Bind("手机号") %>'
                                                                    Width="200px" ClientInstanceName="cl_txtPhonenumber">
                                                                    <ValidationSettings ErrorText="">
                                                                        <RequiredField ErrorText="必填！" IsRequired="True" />
                                                                        <RegularExpression ErrorText="手机号错误，前后不要有空格" 
                                                                            ValidationExpression="^1(3|4|5|7|8|9)\d{9}$" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="table_label">
                                                                <dx:ASPxLabel ID="lbEmail" runat="server" Text="邮箱："></dx:ASPxLabel>
                                                            </td>
                                                            <td class="table_input">
                                                                <dx:ASPxTextBox ID="txtEmail" runat="server" Text='<%# Bind("电子邮箱") %>'
                                                                    Width="200px" ClientInstanceName="cl_txtEmail">
                                                                    <ValidationSettings ErrorText="">
                                                                        <RequiredField ErrorText="必填！" IsRequired="True" />
                                                                        <RegularExpression ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*\s{0,}" ErrorText="邮箱格式错误" />
                                                                    </ValidationSettings>
                                                                </dx:ASPxTextBox>
                                                            </td>
                                                            <td>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </fieldset>
                                                <table>
                                                    <tr>
                                                        <td style="text-align: center">
                                                            <dx:ASPxButton ID="btnSavedetails" runat="server" Text="保存" ClientInstanceName="cl_btnSavedetails"
                                                                CommandArgument='<%# Eval("id") %>' OnCommand="btnSavedetails_Command">
                                                            </dx:ASPxButton>
                                                            <dx:ASPxButton ID="btnCanceldetails" runat="server" Text="取消" AutoPostBack="False"
                                                                CausesValidation="False" ClientInstanceName="cl_btnCanceldetails">
                                                                <ClientSideEvents Click="function(s, e) {
	                                            cl_gvTeamdetails.CancelEdit();
                                            }" />
                                                            </dx:ASPxButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EditForm>
                                        </Templates>
                                    </dx:ASPxGridView>
                                </td>
                            </tr>
                        </table>
                    </DetailRow>
                </Templates>
            </dx:ASPxGridView>
        </div>
        <br />
        <asp:ObjectDataSource ID="odsTeams" runat="server" DeleteMethod="DeleteQuery" InsertMethod="InsertQuery" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByStatesAndUsername" TypeName="AppManageDataSetTableAdapters.TA_团队报名信息TableAdapter" UpdateMethod="UpdateQuery">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="单位编码" Type="String" />
                <asp:Parameter Name="单位名称" Type="String" />
                <asp:Parameter Name="组别编码" Type="String" />
                <asp:Parameter Name="组别名称" Type="String" />
                <asp:Parameter Name="团队名称" Type="String" />
                <asp:Parameter Name="单位联系方式" Type="String" />
                <asp:Parameter Name="指导老师姓名" Type="String" />
                <asp:Parameter Name="指导老师职称" Type="String" />
                <asp:Parameter Name="指导老师手机" Type="String" />
                <asp:Parameter Name="指导老师邮箱" Type="String" />
                <asp:Parameter Name="录入人编码" Type="String" />
                <asp:Parameter Name="录入人姓名" Type="String" />
                <asp:Parameter Name="录入时间" Type="DateTime" />
                <asp:Parameter Name="提交时间" Type="DateTime" />
                <asp:Parameter Name="审核人编码" Type="String" />
                <asp:Parameter Name="审核人姓名" Type="String" />
                <asp:Parameter Name="审核时间" Type="DateTime" />
                <asp:Parameter Name="审核意见" Type="String" />
                <asp:Parameter Name="审核状态" Type="String" />
                <asp:Parameter Name="是否启用" Type="String" />
                <asp:Parameter Name="备用一" Type="String" />
                <asp:Parameter Name="备用二" Type="String" />
                <asp:Parameter Name="备用三" Type="String" />
                <asp:Parameter Name="备用四" Type="String" />
                <asp:Parameter Name="备用五" Type="String" />
                <asp:Parameter Name="备用六" Type="String" />
                <asp:Parameter Name="备用七" Type="DateTime" />
                <asp:Parameter Name="备用八" Type="DateTime" />
                <asp:Parameter Name="备用九" Type="Decimal" />
                <asp:Parameter Name="备用十" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="username" SessionField="username" Type="String" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="单位编码" Type="String" />
                <asp:Parameter Name="单位名称" Type="String" />
                <asp:Parameter Name="组别编码" Type="String" />
                <asp:Parameter Name="组别名称" Type="String" />
                <asp:Parameter Name="团队名称" Type="String" />
                <asp:Parameter Name="单位联系方式" Type="String" />
                <asp:Parameter Name="指导老师姓名" Type="String" />
                <asp:Parameter Name="指导老师职称" Type="String" />
                <asp:Parameter Name="指导老师手机" Type="String" />
                <asp:Parameter Name="指导老师邮箱" Type="String" />
                <asp:Parameter Name="录入人编码" Type="String" />
                <asp:Parameter Name="录入人姓名" Type="String" />
                <asp:Parameter Name="录入时间" Type="DateTime" />
                <asp:Parameter Name="提交时间" Type="DateTime" />
                <asp:Parameter Name="审核人编码" Type="String" />
                <asp:Parameter Name="审核人姓名" Type="String" />
                <asp:Parameter Name="审核时间" Type="DateTime" />
                <asp:Parameter Name="审核意见" Type="String" />
                <asp:Parameter Name="审核状态" Type="String" />
                <asp:Parameter Name="是否启用" Type="String" />
                <asp:Parameter Name="备用一" Type="String" />
                <asp:Parameter Name="备用二" Type="String" />
                <asp:Parameter Name="备用三" Type="String" />
                <asp:Parameter Name="备用四" Type="String" />
                <asp:Parameter Name="备用五" Type="String" />
                <asp:Parameter Name="备用六" Type="String" />
                <asp:Parameter Name="备用七" Type="DateTime" />
                <asp:Parameter Name="备用八" Type="DateTime" />
                <asp:Parameter Name="备用九" Type="Decimal" />
                <asp:Parameter Name="备用十" Type="Decimal" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>

        <br />
        <asp:ObjectDataSource ID="odsTeamdetails" runat="server" DeleteMethod="DeleteQuery" InsertMethod="InsertQuery" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByParentid" TypeName="AppManageDataSetTableAdapters.TA_团队成员信息TableAdapter" UpdateMethod="UpdateQuery">
            <DeleteParameters>
                <asp:Parameter Name="Original_id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="团队id" Type="Int32" />
                <asp:Parameter Name="成员编号" Type="String" />
                <asp:Parameter Name="成员姓名" Type="String" />
                <asp:Parameter Name="所属部门" Type="String" />
                <asp:Parameter Name="所属专业" Type="String" />
                <asp:Parameter Name="所属年级" Type="String" />
                <asp:Parameter Name="学历编码" Type="String" />
                <asp:Parameter Name="学历名称" Type="String" />
                <asp:Parameter Name="手机号" Type="String" />
                <asp:Parameter Name="电子邮箱" Type="String" />
                <asp:Parameter Name="是否启用" Type="String" />
                <asp:Parameter Name="备用一" Type="String" />
                <asp:Parameter Name="备用二" Type="String" />
                <asp:Parameter Name="备用三" Type="String" />
                <asp:Parameter Name="备用四" Type="String" />
                <asp:Parameter Name="备用五" Type="String" />
                <asp:Parameter Name="备用六" Type="String" />
                <asp:Parameter Name="备用七" Type="DateTime" />
                <asp:Parameter Name="备用八" Type="DateTime" />
                <asp:Parameter Name="备用九" Type="Decimal" />
                <asp:Parameter Name="备用十" Type="Decimal" />
            </InsertParameters>
            <SelectParameters>
                <asp:SessionParameter Name="parentid" SessionField="parentid" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="团队id" Type="Int32" />
                <asp:Parameter Name="成员编号" Type="String" />
                <asp:Parameter Name="成员姓名" Type="String" />
                <asp:Parameter Name="所属部门" Type="String" />
                <asp:Parameter Name="所属专业" Type="String" />
                <asp:Parameter Name="所属年级" Type="String" />
                <asp:Parameter Name="学历编码" Type="String" />
                <asp:Parameter Name="学历名称" Type="String" />
                <asp:Parameter Name="手机号" Type="String" />
                <asp:Parameter Name="电子邮箱" Type="String" />
                <asp:Parameter Name="是否启用" Type="String" />
                <asp:Parameter Name="备用一" Type="String" />
                <asp:Parameter Name="备用二" Type="String" />
                <asp:Parameter Name="备用三" Type="String" />
                <asp:Parameter Name="备用四" Type="String" />
                <asp:Parameter Name="备用五" Type="String" />
                <asp:Parameter Name="备用六" Type="String" />
                <asp:Parameter Name="备用七" Type="DateTime" />
                <asp:Parameter Name="备用八" Type="DateTime" />
                <asp:Parameter Name="备用九" Type="Decimal" />
                <asp:Parameter Name="备用十" Type="Decimal" />
                <asp:Parameter Name="Original_id" Type="Int32" />
            </UpdateParameters>
        </asp:ObjectDataSource>

        <br />
        <asp:ObjectDataSource ID="odsEducationlevel" runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="AppManageDataSetTableAdapters.DM_学历TableAdapter"></asp:ObjectDataSource>

    </form>
</body>
</html>
