<%@ Page Language="C#" AutoEventWireup="true" CodeFile="gridview.aspx.cs" Inherits="gridview" %>

<%@ Register assembly="DevExpress.Web.v17.1, Version=17.1.4.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 24px;
        }
        .auto-style3 {
            height: 73px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <dx:ASPxGridView ID="ASPxGridView_TDBBXX" runat="server" AutoGenerateColumns="False" ClientInstanceName="ASPxGridView_TDBBXX" DataSourceID="ObjectDataSource_TDBBXX" EnableTheming="True" KeyFieldName="id" Theme="Aqua" Width="100%" OnDetailRowExpandedChanged="gridview_tdbmxx_DetailRowExpandedChanged">
            <SettingsDetail AllowOnlyOneMasterRowExpanded="True" ShowDetailButtons="True" ShowDetailRow="True" />
            <Templates>
                <DetailRow>
                    <dx:ASPxButton ID="ASPxButton_addmember" runat="server" OnCommand="addmember" Text="新增成员">
                    </dx:ASPxButton>
                    <dx:ASPxGridView ID="ASPxGridView_TDCYXX" runat="server" AutoGenerateColumns="False" DataSourceID="ObjectDataSource_gvTUCYXX" KeyFieldName="id">
                        <Templates>
                            <EditForm>
                                <table class="auto-style1">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label_name" runat="server" Text="成员姓名"></asp:Label>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBox2" runat="server" Width="170px">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="专业"></asp:Label>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBox3" runat="server" Width="170px">
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="学历"></asp:Label>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBox4" runat="server" Width="170px">
                                            </dx:ASPxTextBox>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text="年级"></asp:Label>
                                        </td>
                                        <td>
                                            <dx:ASPxTextBox ID="ASPxTextBox5" runat="server" Width="170px">
                                            </dx:ASPxTextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;</td>
                                        <td>
                                            <dx:ASPxButton ID="ASPxButton1" runat="server" Text="保存">
                                            </dx:ASPxButton>
                                        </td>
                                        <td>&nbsp;</td>
                                        <td>
                                            <dx:ASPxButton ID="ASPxButton2" runat="server" Text="取消">
                                            </dx:ASPxButton>
                                        </td>
                                    </tr>
                                </table>
                            </EditForm>
                        </Templates>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" Visible="False" VisibleIndex="0">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="团队id" Visible="False" VisibleIndex="1">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="成员编号" Visible="False" VisibleIndex="2">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="成员姓名" VisibleIndex="3">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="所属部门" VisibleIndex="4">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="所属专业" VisibleIndex="5">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="所属年级" VisibleIndex="6">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="学历编码" Visible="False" VisibleIndex="7">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="学历名称" VisibleIndex="8">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="手机号" VisibleIndex="9">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="电子邮箱" VisibleIndex="10">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="是否启用" Visible="False" VisibleIndex="11">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="备用一" Visible="False" VisibleIndex="12">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="备用二" Visible="False" VisibleIndex="13">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="备用四" Visible="False" VisibleIndex="15">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="备用五" Visible="False" VisibleIndex="16">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="备用六" Visible="False" VisibleIndex="17">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="备用七" Visible="False" VisibleIndex="18">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataDateColumn FieldName="备用八" Visible="False" VisibleIndex="19">
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="备用九" Visible="False" VisibleIndex="20">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="备用十" Visible="False" VisibleIndex="21">
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="备用三" Visible="False" VisibleIndex="14">
                            </dx:GridViewDataTextColumn>
                        </Columns>
                    </dx:ASPxGridView>
                    <asp:ObjectDataSource ID="ObjectDataSource_gvTUCYXX" runat="server" DeleteMethod="Delete" InsertMethod="Insert" OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" TypeName="DataSet_DemoTableAdapters.TA_团队成员信息TableAdapter" UpdateMethod="Update">
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
                </DetailRow>
                <EditForm>
                    <table class="auto-style1">
                        <tr>
                            <td class="auto-style3">
                                <dx:ASPxLabel ID="ASPxLabel_DWMC" runat="server" Font-Size="Large" Text="单位名称：">
                                </dx:ASPxLabel>
                            </td>
                            <td class="auto-style3">
                                <dx:ASPxTextBox ID="ASPxTextBox_DWMC" runat="server" Width="170px" Text='<%# Bind("单位名称") %>'>
                                </dx:ASPxTextBox>
                            </td>
                            <td class="auto-style3">
                                <dx:ASPxLabel ID="ASPxLabel_ZB" runat="server" Font-Size="Large" Text="组别：">
                                </dx:ASPxLabel>
                            </td>
                            <td class="auto-style3">
                                <dx:ASPxComboBox ID="ASPxComboBox_ZB" runat="server" Text='<%# Bind("组别名称", "%") %>' Value='<%# Bind("组别编码") %>'>
                                    <Items>
                                        <dx:ListEditItem Text="高等院校" Value="Z01" />
                                        <dx:ListEditItem Text="企事业单位" Value="Z02" />
                                    </Items>
                                </dx:ASPxComboBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel_TDMC" runat="server" Font-Size="Large" Text="团队名称：">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="ASPxTextBox_TDMC" runat="server" Width="170px" Text='<%# Bind("团队名称") %>'>
                                </dx:ASPxTextBox>
                            </td>
                            <td>
                                <dx:ASPxLabel ID="ASPxLabel_tel" runat="server" Font-Size="Large" Text="单位联系方式：">
                                </dx:ASPxLabel>
                            </td>
                            <td>
                                <dx:ASPxTextBox ID="ASPxTextBox_tel" runat="server" Width="170px" Text='<%# Bind("单位联系方式") %>'>
                                </dx:ASPxTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2"></td>
                            <td class="auto-style2"></td>
                            <td class="auto-style2">
                                <dx:ASPxButton ID="ASPxButton_Submit" runat="server"  OnCommand="ASPxButton_Submit_Command" CommandArgument='<%# Eval("id") %>' Text="提交">
                                </dx:ASPxButton>
                            </td>
                            <td class="auto-style2">
                                <dx:ASPxButton ID="ASPxButton_Cancel" runat="server" OnCommand="ASPxButton_Cancel_Command" Text="取消">
                                </dx:ASPxButton>
                            </td>
                        </tr>
                    </table>
                </EditForm>
            </Templates>
            <Settings ShowTitlePanel="True" />
            <Columns>
                <dx:GridViewCommandColumn ShowDeleteButton="True" ShowEditButton="True" ShowNewButtonInHeader="True" VisibleIndex="0">
                </dx:GridViewCommandColumn>
                <dx:GridViewDataTextColumn FieldName="id" ReadOnly="True" ShowInCustomizationForm="True" VisibleIndex="1">
                    <EditFormSettings Visible="False" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="单位编码" ShowInCustomizationForm="True" VisibleIndex="2">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="单位名称" ShowInCustomizationForm="True" VisibleIndex="3">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="组别编码" ShowInCustomizationForm="True" VisibleIndex="4">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="组别名称" ShowInCustomizationForm="True" VisibleIndex="5">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="团队名称" ShowInCustomizationForm="True" VisibleIndex="6">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="单位联系方式" ShowInCustomizationForm="True" VisibleIndex="7">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="指导老师姓名" ShowInCustomizationForm="True" VisibleIndex="8">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="指导老师职称" ShowInCustomizationForm="True" VisibleIndex="9">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="指导老师手机" ShowInCustomizationForm="True" VisibleIndex="10">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="指导老师邮箱" ShowInCustomizationForm="True" VisibleIndex="11">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="录入人编码" ShowInCustomizationForm="True" VisibleIndex="12">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="录入人姓名" ShowInCustomizationForm="True" VisibleIndex="13">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="录入时间" ShowInCustomizationForm="True" VisibleIndex="14">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="提交时间" ShowInCustomizationForm="True" VisibleIndex="15">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="审核人编码" ShowInCustomizationForm="True" VisibleIndex="16">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="审核人姓名" ShowInCustomizationForm="True" VisibleIndex="17">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="审核时间" ShowInCustomizationForm="True" VisibleIndex="18">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="审核意见" ShowInCustomizationForm="True" VisibleIndex="19">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="审核状态" ShowInCustomizationForm="True" VisibleIndex="20">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="是否启用" ShowInCustomizationForm="True" VisibleIndex="21">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="备用一" ShowInCustomizationForm="True" Visible="False" VisibleIndex="22">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="备用二" ShowInCustomizationForm="True" Visible="False" VisibleIndex="23">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="备用三" ShowInCustomizationForm="True" Visible="False" VisibleIndex="24">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="备用四" ShowInCustomizationForm="True" Visible="False" VisibleIndex="25">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="备用五" ShowInCustomizationForm="True" Visible="False" VisibleIndex="26">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="备用六" ShowInCustomizationForm="True" Visible="False" VisibleIndex="27">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataDateColumn FieldName="备用七" ShowInCustomizationForm="True" Visible="False" VisibleIndex="28">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="备用八" ShowInCustomizationForm="True" Visible="False" VisibleIndex="29">
                </dx:GridViewDataDateColumn>
                <dx:GridViewDataTextColumn FieldName="备用九" ShowInCustomizationForm="True" Visible="False" VisibleIndex="30">
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataTextColumn FieldName="备用十" ShowInCustomizationForm="True" Visible="False" VisibleIndex="31">
                </dx:GridViewDataTextColumn>
            </Columns>
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="ObjectDataSource_TDBBXX" runat="server" DeleteMethod="Delete" InsertMethod="InsertQuery" OldValuesParameterFormatString="original_{0}" SelectMethod="GetDataByBZ" TypeName="DataSet_DemoTableAdapters.TA_团队报名信息TableAdapter" UpdateMethod="Update">
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
        <dx:ASPxTextBox ID="ASPxTextBox1" runat="server" Width="170px">
        </dx:ASPxTextBox>
    </form>
</body>
</html>
