<%@ Page Language="C#" MasterPageFile="~/Pages/Home.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="WebsiteCollegeLatest.Pages.Home1" %>

<%--this is common page--%>
<asp:Content ID="common" ContentPlaceHolderID="conHold" runat="server">

    <div class="row myStdWidth mytrans" style="padding: 1px; =">
        <div id="divUserControls" class="mytrans" style="height: auto;">

            <div class="col-sm-2" style="padding: inherit">
                <img id="imgProfile" class="thumbnail" runat="server" height="200" width="200" style="margin-bottom: 0px;" />

                <%--<asp:Label Font-Size="Small" ID="lblemail" Style="color: Black;" class="mylblstyle" runat="server" Text="" />--%>
            </div>

            <div class="col-sm-8" style="padding: 1%;">
                <asp:Label ID="lblName" Font-Size="XX-Large" Style="color: Black;" class="mylblstyle " runat="server" Text="" /><br />
            </div>
            <%--This is the glyphicon part--%>
            <div class="col-sm-1 pull-right ">
                <div class="mytext" style="position: relative; padding: 10%; left: 65%; width: 10px;">
                    <div class="myhidden">Heeeeellllo</div>
                    <a id="asearch" href="#" data-toggle="modal" data-target="#searchtoolbar" runat="server" class="myprofilebutton">
                        <span id="Span2" class="glyphicon glyphicon-search myprofileglyph "></span></a>
                </div>
                <div style="position: relative; padding: 10%; left: 65%; width: 10px;">
                    <a id="editprofile" href="profileEdit.aspx" runat="server" class="myprofilebutton">
                        <span id="glyphProfileEdit" class="glyphicon glyphicon-edit myprofileglyph "></span></a>
                </div>
                <%-- <div style="position: relative; padding: 10%; left: 65%; width: 10px;">
                    <a id="msg" href="#" data-toggle="modal" data-target="#myModal" runat="server" class="myprofilebutton">
                        <span id="Span1" class="glyphicon glyphicon-envelope myprofileglyph"></span></a>
                </div>--%>
            </div>

        </div>
    </div>
    <div id="divCommon" class="myStdWidth" runat="server">

        <%-- This is the search tab--%>
        <div id="divSearch" style="padding: 2%; margin-bottom: 10px;" runat="server" class="well mytransheader">

            <table style="width: 100%;">

                <tr>
                    <td>
                        <label>
                            Select a branch</label><br />
                        <asp:DropDownList ID="ddlBranch" AutoPostBack="true" runat="server" AppendDataBoundItems="true">
                            <asp:ListItem Value="-1">
            Select a branch
                            </asp:ListItem>
                        </asp:DropDownList>
                    </td>
                    <td>
                        <label>
                            Select semester</label><br />
                        <asp:DropDownList ID="ddlSem" AutoPostBack="true" runat="server" OnSelectedIndexChanged="ddlbranch_selectedindexchanged" AppendDataBoundItems="true">
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
                            Select a Subject</label><br />
                        <asp:DropDownList ID="ddlSubjects" runat="server">
                            <asp:ListItem>
            Select subject
                            </asp:ListItem>
                        </asp:DropDownList>

                    </td>
                    <td>
                        <label>
                            Enter Keyword</label>
                        <br />
                        <asp:TextBox ID="tbKeyWord" runat="server" class="form-control" placeholder="enter search key word" />

                    </td>
                    <td>
                        <br />
                        &nbsp<input type="submit" id="btnSearch" class=" btn btn-primary" runat="server" value="Look for Notes" onserverclick="btnSearch_onclick" /></td>

                </tr>



            </table>

        </div>


        <%-- This is the results for notes div--%>

        <div id="divResults" runat="server" class="mytrans col-sm-12" style="height: auto; padding: 2%; margin-bottom: 10px;" visible="false">

            <asp:Repeater ID="rptSearchRes" runat="server">
                <HeaderTemplate>
                    <asp:Label ID="lblInfo" runat="server"></asp:Label>
                </HeaderTemplate>
                <ItemTemplate>
                    <div class="col-sm-3" style="height: 150px; padding: 0px; margin-right: 8.2%;">
                        <div class="pull-left alert alert-danger" style="margin: 2px; color: #a94442; width: 24.2%; padding: 5px; height: 135px">
                            <table>
                                <tr>
                                    <td align="center" style="border-bottom: 1px solid; font-weight: bold"><%#Eval("scode") %></td>
                                </tr>
                                <tr>
                                    <td title="No. Of Downloads" align="center" style="font-weight: bolder; font-size: 45px;"><%#Eval("downloads")%></td>

                                </tr>
                            </table>

                        </div>
                        <div class="pull-right alert alert-info" style="margin: 2px; font-weight: bold; width: 73%; padding: 5px; height: 135px">


                            <%#Eval("topic")%>

                            <asp:Label ID="lblNotesid" runat="server" Text='<%#Eval("notesid") %>' Visible="false"></asp:Label>
                            <div style="position: absolute; top: 70%; left: 70%;">

                                <asp:Button href='<%#Eval("filename")%>' ID="lnkDwn" CommandName="dwnLink" OnCommand="rptUpdateDownloads" runat="server"
                                    CommandArgument='<%#Eval("notesid")+ ","+Eval("filename") %>'
                                    Style="text-decoration: underline; font-size: 15px;" Text="download" />
                                
                            </div>



                        </div>
                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>
        <div class="clearfix"></div>

        <%--This is the profiles results--%>
        <div id="divprofileresults" runat="server" class="mytrans col-sm-12" style="height: auto; padding: 2%; margin-bottom: 10px;" visible="false">
            <asp:Repeater ID="rptProfileResult" runat="server">

                <ItemTemplate>
                    <div class=" col-sm-2">
                        <div class="col-sm-8">
                            <asp:Image CssClass="thumbnail" src='<%#Eval("profilepicpath") %>' runat="server" Height="100" Width="100" />
                            <asp:Label runat="server" Style="font-size: 20px"> <%#Eval("name") %></asp:Label>
                        </div>
                        <div class="col-sm-4 " style="padding-top: 0px;">
                            <asp:LinkButton ID="lnkmessage" CommandName="msgclick" OnCommand="lnkmessage_Command" CommandArgument='<%#Eval("id") %>' runat="server" class="glyphicon glyphicon-envelope pull-left" Style="padding-left: 0px; color: black; font-size: 30px;"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton1" runat="server" class="glyphicon glyphicon-eye-open pull-left" Style="margin-bottom: 2px; color: black; font-size: 30px;"></asp:LinkButton>
                            <asp:LinkButton ID="LinkButton2" runat="server" class="glyphicon glyphicon-edit" Style="margin-left: 0px; color: black; font-size: 30px;"></asp:LinkButton>
                        </div>  
                    </div>

                </ItemTemplate>

            </asp:Repeater>

        </div>


        <div class="mytrans col-sm-9" style="height: 500px; z-index: 0;">
        </div>

        <div class=" well col-sm-3" style="height: 500px;">
        </div>
        <div id="divSendMessage" runat="server" class="col-sm-offset-3 col-sm-5 " style="position: absolute; top: 30%;">

            <div class="panel" style="z-index: 9999">
                <div class="panel-heading">
                    <span class="glyphicon glyphicon-message"></span>Send message
                                    <a class="pull-right">&times;</a>
                </div>
                <div class="panel-body" style="background-color: Gray;">
                    <%-- <form class="form-horizontal" role="form">--%>

                    <div class="form-group mymargin">

                        <div class="col-sm-8 ">
                            <asp:TextBox class="form-control" ID="tbmessage" runat="server"
                                placeholder="Type your message" TextMode="MultiLine" Width="375px" Height="150px" />
                        </div>
                    </div>

                    <div class="clearfix">
                    </div>
                    <div style="margin-top: 5%;">
                        <div class="col-sm-3 pull-right">

                            <asp:LinkButton ID="lnkSendMessage" runat="server" class="btn btn-success btn-group-justified"
                                Style="margin-bottom: 5px;" OnClick="lnkSendMessage_Click">
                                                Send</asp:LinkButton>

                        </div>
                        <div class="col-sm-3 pull-right">
                            <button type="reset" class="btn btn-danger btn-group-justified">
                                Clear</button>
                        </div>
                    </div>
                    <%--</form>--%>
                </div>

            </div>
        </div>
    </div>

    <div class="clearfix">
    </div>



    <%--This is the search tool bar--%>
    <div class="modal fade" id="searchtoolbar" tabindex="-1" data-backdrop="static" role="dialog" aria-labelledby="myModalLabel"
        aria-hidden="true" style="margin-top: 10%;">
        <div class=" col-sm-offset-5 col-sm-4" style="top: 50px">
            <div class="col-sm-8">
                <asp:TextBox ID="tbsearchpro" runat="server" class="form-control" placeholder="Search for" Width="100%"></asp:TextBox>

            </div>
            <div>
                <asp:LinkButton ID="lnksearchpro" runat="server" class="glyphicon glyphicon-search myprofileglyph" OnClick="lnksearchpro_Click" Style="padding-top: 5px;"></asp:LinkButton>
            </div>
        </div>
    </div>
    <%-- <script type="text/javascript">
        $("#lnkmessage").click(function () {
            $("#divSendMessage").attr({ "display": "block" });
        });

    </script>--%>
</asp:Content>



