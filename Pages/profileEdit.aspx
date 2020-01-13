<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Pages/Home.Master"  CodeBehind="profileEdit.aspx.cs" Inherits="WebsiteCollegeLatest.Pages.profileEdit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="conProfile" ContentPlaceHolderID="conHold" runat="server">
    <%--<asp:ScriptManager ID="smEditPics" runat="server" ></asp:ScriptManager>
<asp:UpdatePanel ID="upEditPic" runat="server" >
<ContentTemplate>
    --%>
    <div id="divProfileEdit" class="myStdWidth mytrans" runat="server" style="margin-bottom:10px;">
        <br />
        <span style="font-size: 25px;">&nbsp &nbsp Edit Profile</span>
        <hr style="border: 1px solid Black; margin-bottom: 0px;" />
        <div class="col-sm-2" style="padding: 15px;">
            <img id="imgpropic" class="thumbnail" runat="server" height="200" width="200" style="margin-bottom: 0px;" />
        </div>
        <div class="col-sm-3" style="padding:15px;">
            <div class="input-group " style="margin-bottom: 15px;">
                <span class="input-group-addon"><span class="glyphicon glyphicon-user"></span></span>
                <asp:TextBox ID="tbName" placeholder="New user name" value="" runat="server" class="form-control" />
            </div>
            <div class="input-group " style="margin-bottom: 15px;">
                <span class="input-group-addon"><span class="glyphicon glyphicon-phone"></span></span>
                <asp:TextBox ID="tbPhone" value="" placeholder="New Phone Number" runat="server"
                    class="form-control" />
            </div>
            <div class="input-group " style="margin-bottom: 15px;">
                <span class="input-group-addon"><span class="glyphicon glyphicon-calendar"></span>
                </span>
                <asp:TextBox ID="tbBirthday" value="" placeholder="Birthday" runat="server" class="form-control" />
            </div>
        </div>
        <div class="clearfix">
        </div>
        <div class="col-sm-12" style="padding-bottom:20px;">
          
            <span class="myregbuttonmodal" style="height:40px; width: 175px;margin:2px;"
                id="spnUpload">Select New Image </span>
            <asp:FileUpload runat="server" ID="fuProfile" class="filestyle" Style="display: none;" />
            <asp:LinkButton ID="btnUpload" AutoPostBack="true" class="filestyle myregbuttonmodal "
                runat="server" OnClick="btnUpload_click" Style="height:40px; width:175px    ;">Upload </asp:LinkButton>
            <asp:Label ID="lblMsg" Text="Hello" ClientIDMode="Static" runat="server" style="padding-left:20px; font-size:20px; color:Red;"></asp:Label>
            
        </div>
        <div class="clearfix">
        </div>
        <div class="well" style="height:80px;">
            <asp:LinkButton type="button" runat="server" ID="btnSavechanges" Style="height: 40px;
                width:200px ; margin-left: 10px;" class="myregbuttonmodal pull-right" OnClick="btnSavechanges_click">Save Changes</asp:LinkButton>
                </div>
        
    </div>
    <%--</contenttemplate>
<Triggers>
<asp:AsyncPostBackTrigger ControlID="btnUpload" EventName="Click" />
</Triggers>
</asp:updatepanel>--%>
</asp:Content>

