<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="notesUploads.aspx.cs" MasterPageFile="~/Pages/Home.Master" Inherits="WebsiteCollegeLatest.Pages.notesUploads" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="conNotes" ContentPlaceHolderID="conHold" runat="server">
    <%--<asp:ScriptManager ID="smUploadNotes" runat="server" ></asp:ScriptManager>
<asp:UpdatePanel ID="upUploadNotes" runat="server" >


<ContentTemplate>--%>
    <%--<ajaxToolkit:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </ajaxToolkit:ToolkitScriptManager>--%>
    <div id="divUpload" class="myStdWidth mytrans" runat="server"  style="margin-bottom: 10px;height:auto;">
        <br />
        <span style="font-size: 25px;">&nbsp &nbsp Upload Notes</span>
        <hr style="border: 1px solid Black; margin-bottom: 0px;" />
        <div id="Div1" style="padding: 2%; margin-bottom: 10px; height: 100px;" runat="server">
            <table style="width: 100%;">
                <tr>
                    <td>
                        <label>
                            Select a branch</label><br />
                        <asp:DropDownList ID="ddlBranch" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlbranch_selectedindexchanged"
                            AppendDataBoundItems="true">
                            <asp:ListItem Value="-1">
            Select a branch
                            </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <label>
                            Select semester</label><br />
                        <asp:DropDownList ID="ddlSem" runat="server" AppendDataBoundItems="true" AutoPostBack="true"
                            OnSelectedIndexChanged="ddlsem_selectedindexchanged">
                            <asp:ListItem Value="-1">select</asp:ListItem>
                            <asp:ListItem Value="1"> 1 </asp:ListItem>
                            <asp:ListItem Value="2"> 2 </asp:ListItem>
                            <asp:ListItem Value="3"> 3 </asp:ListItem>
                            <asp:ListItem Value="4"> 4 </asp:ListItem>
                            <asp:ListItem Value="5"> 5 </asp:ListItem>
                            <asp:ListItem Value="6"> 6 </asp:ListItem>
                            <asp:ListItem Value="7"> 7 </asp:ListItem>
                            <asp:ListItem Value="8"> 8 </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <label>
                            Select a branch</label><br />
                        <asp:DropDownList ID="ddlSubjects" runat="server">
                            <asp:ListItem>
            Select subject
                            </asp:ListItem>
                        </asp:DropDownList>
                        <%-- <ajaxToolkit:CascadingDropDown ID="cdlSubjects" TargetControlID="ddlSubjects" PromptText="Select Subject"
                PromptValue="" ServicePath="~/ServiceCS.asmx" ServiceMethod="GetSubjects" runat="server"
                Category="subjectid" ParentControlID="ddlBranch" LoadingText="Loading..." />--%>
                    </td>
                    <td>
                        <label>
                            Author Name</label>
                        <br />
                        <asp:TextBox ID="tbAuthor" placeholder="Enter author name" runat="server" class="form-control" />
                    </td>
                </tr>
                <%--</ContentTemplate>
          </asp:UpdatePanel>--%>
            </table>
        </div>
        <div id="Div2" style="padding: 2%; margin-bottom: 10px; height: auto;" runat="server"
            class="col-sm-4">
            <label>
                Description (Keywords/topics)</label>
            <br />
            <asp:TextBox ID="tbDescription" Width="375px" Height="150px" TextMode="MultiLine"
                placeholder="Description" runat="server" class="form-control" />
        </div>
        <div id="Div3" style="padding-top:12.3%; margin-bottom: 10px; height: auto;" runat="server"
            class=" col-sm-4">
            <span class="myregbuttonmodal" style="width: 120px; padding-top: 10px; margin-left:0px;"
                id="spnUploadfile">Select file </span>
            <asp:FileUpload runat="server" ID="fuNotes" class="filestyle" Style="display: none;" />
            <asp:Label ID="lblMsg" runat="server"></asp:Label>
        </div>
        <div class="clearfix">
        </div>
        <%--<asp:Button ID="btnUploadfile" class="myregbutton pull-right" runat="server" Text="Upload Notes" OnClick="btnUpload_click" />--%>
        <div class="well" style="height:80px;">
        <asp:LinkButton ID="btnUploadfile" type="button" AutoPostBack="true" class="myregbuttonmodal pull-right"
            runat="server" Style="width: 120px;" OnClick="btnUpload_click">Upload Notes </asp:LinkButton>
            </div>
        <%--   <asp:LinkButton ID="btnCancelUpload" type="button" AutoPostBack="true" class="myregbuttonmodal pull-left" runat="server"
                            Style="width: 120px;" OnClick="btnCancelUpload_click" >Cancel</asp:LinkButton>
        --%>
    </div>
    <%--  
</contenttemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="ddlBranch" EventName="SelectedIndexChanged" />
</Triggers>
</asp:updatepanel>--%>
</asp:Content>
