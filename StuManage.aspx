<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StuManage.aspx.cs" Inherits="StuManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>账号管理</title>
    <link href="img/favicon.png" rel="icon" />
    <link href="img/apple-touch-icon.png" rel="apple-touch-icon" />

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,700|Roboto:300,400,700&display=swap"
        rel="stylesheet" />

    <!-- Bootstrap CSS File -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <!-- Vendor CSS Files -->
    <link href="vendor/icofont/icofont.min.css" rel="stylesheet" />
    <link href="vendor/line-awesome/css/line-awesome.min.css" rel="stylesheet" />
    <link href="vendor/aos/aos.css" rel="stylesheet" />
    <link href="vendor/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

    <!-- Template Main CSS File -->
    <link href="css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="site-wrap">

            <div class="site-mobile-menu site-navbar-target">
                <div class="site-mobile-menu-header">
                    <div class="site-mobile-menu-close mt-3">
                        <span class="icofont-close js-menu-toggle"></span>
                    </div>
                </div>
                <div class="site-mobile-menu-body"></div>
            </div>

            <header class="site-navbar js-sticky-header site-navbar-target" role="banner">

                <div class="container">
                    <div class="row align-items-center">

                        <div class="col-6 col-lg-2">
                            <h1 class="mb-0 site-logo"><a href="TeacherHome.aspx" class="mb-0">Web开发技术</a></h1>
                        </div>

                        <div class="col-12 col-md-10 d-none d-lg-block">
                            <nav class="site-navigation position-relative text-right" role="navigation">

                                <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                                    <li><a href="TeacherHome.aspx" class="nav-link">主页</a></li>
                                    <li><a href="StuManage.aspx" class="nav-link">账号管理</a></li>
                                    <li><a href="ActManage.aspx" class="nav-link">活动管理</a></li>
                                    <li><a href="Score.aspx" class="nav-link">活动评分</a></li>
                                    <li><a href="Tongji.aspx" class="nav-link">统计</a></li>
                                </ul>
                            </nav>
                        </div>


                        <div class="col-6 d-inline-block d-lg-none ml-md-0 py-3" style="position: relative; top: 3px;">

                            <a href="#" class="burger site-menu-toggle js-menu-toggle" data-toggle="collapse" data-target="#main-navbar">
                                <span></span>
                            </a>
                        </div>

                    </div>
                </div>

            </header>


            <main id="main">
                <div class="hero-section inner-page">
                    <div class="wave">

                        <svg width="1920px" height="265px" viewBox="0 0 1920 265" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                            <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                <g id="Apple-TV" transform="translate(0.000000, -402.000000)" fill="#FFFFFF">
                                    <path d="M0,439.134243 C175.04074,464.89273 327.944386,477.771974 458.710937,477.771974 C654.860765,477.771974 870.645295,442.632362 1205.9828,410.192501 C1429.54114,388.565926 1667.54687,411.092417 1920,477.771974 L1920,667 L1017.15166,667 L0,667 L0,439.134243 Z" id="Path"></path>
                                </g>
                            </g>
                        </svg>

                    </div>

                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-12">
                                <div class="row justify-content-center">
                                    <div class="col-md-7 text-center hero-text">
                                        <h1 data-aos="fade-up" data-aos-delay="">学生活动管理系统</h1>
                                        <p class="mb-5" data-aos="fade-up" data-aos-delay="100" id="TeaName" runat="server">欢迎您，123！</p>
                                        <asp:Button ID="Button1" runat="server" OnClick="Logout" Text="退出" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

                <div class="site-section">
                    <div class="container">
                        <div>
                            <h3>学生信息</h3>
                            <br />
                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" DataKeyNames="stu_id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <asp:BoundField DataField="stu_id" HeaderText="学号" ReadOnly="True" SortExpression="stu_id" />
                                    <asp:BoundField DataField="stu_name" HeaderText="姓名" SortExpression="stu_name" />
                                    <asp:BoundField DataField="password" HeaderText="密码" SortExpression="password" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ActManageConnectionString %>" DeleteCommand="DELETE FROM [Stu] WHERE [stu_id] = @stu_id" InsertCommand="INSERT INTO [Stu] ([stu_id], [stu_name], [password]) VALUES (@stu_id, @stu_name, @password)" SelectCommand="SELECT * FROM [Stu] ORDER BY [stu_id]" UpdateCommand="UPDATE [Stu] SET [stu_name] = @stu_name, [password] = @password WHERE [stu_id] = @stu_id">
                                <DeleteParameters>
                                    <asp:Parameter Name="stu_id" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="stu_id" Type="String" />
                                    <asp:Parameter Name="stu_name" Type="String" />
                                    <asp:Parameter Name="password" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="stu_name" Type="String" />
                                    <asp:Parameter Name="password" Type="String" />
                                    <asp:Parameter Name="stu_id" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <br />
                            <h5>添加学生</h5>
                            <asp:FormView ID="FormView1" runat="server" DataKeyNames="stu_id" DataSourceID="SqlDataSource1" DefaultMode="Insert">
                                <EditItemTemplate>
                                    stu_id:
                    <asp:Label ID="stu_idLabel1" runat="server" Text='<%# Eval("stu_id") %>' />
                                    <br />
                                    stu_name:
                    <asp:TextBox ID="stu_nameTextBox" runat="server" Text='<%# Bind("stu_name") %>' />
                                    <br />
                                    password:
                    <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                                    <br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    学号:
                    <asp:TextBox ID="stu_idTextBox" runat="server" Text='<%# Bind("stu_id") %>' />
                                    <br />
                                    姓名:
                    <asp:TextBox ID="stu_nameTextBox" runat="server" Text='<%# Bind("stu_name") %>' />
                                    <br />
                                    密码:
                    <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="添加学生" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    stu_id:
                    <asp:Label ID="stu_idLabel" runat="server" Text='<%# Eval("stu_id") %>' />
                                    <br />
                                    stu_name:
                    <asp:Label ID="stu_nameLabel" runat="server" Text='<%# Bind("stu_name") %>' />
                                    <br />
                                    password:
                    <asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />
                                    <br />
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" />
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新建" />
                                </ItemTemplate>
                            </asp:FormView>
                            <br />
                            <br />
                            <h3>教师信息</h3>
                            <br />
                            <asp:GridView ID="GridView3" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="teacher_id" DataSourceID="SqlDataSource2" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True">
                                <Columns>
                                    <asp:BoundField DataField="teacher_id" HeaderText="工号" ReadOnly="True" SortExpression="teacher_id" />
                                    <asp:BoundField DataField="teacher_name" HeaderText="姓名" SortExpression="teacher_name" />
                                    <asp:BoundField DataField="password" HeaderText="密码" SortExpression="password" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ActManageConnectionString %>" DeleteCommand="DELETE FROM [Teacher] WHERE [teacher_id] = @teacher_id" InsertCommand="INSERT INTO [Teacher] ([teacher_id], [teacher_name], [password]) VALUES (@teacher_id, @teacher_name, @password)" SelectCommand="SELECT * FROM [Teacher] ORDER BY [teacher_id]" UpdateCommand="UPDATE [Teacher] SET [teacher_name] = @teacher_name, [password] = @password WHERE [teacher_id] = @teacher_id">
                                <DeleteParameters>
                                    <asp:Parameter Name="teacher_id" Type="String" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="teacher_id" Type="String" />
                                    <asp:Parameter Name="teacher_name" Type="String" />
                                    <asp:Parameter Name="password" Type="String" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="teacher_name" Type="String" />
                                    <asp:Parameter Name="password" Type="String" />
                                    <asp:Parameter Name="teacher_id" Type="String" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <br />
                            <h5>添加教师</h5>
                            <asp:FormView ID="FormView2" runat="server" DataKeyNames="teacher_id" DataSourceID="SqlDataSource2" DefaultMode="Insert">
                                <EditItemTemplate>
                                    teacher_id:
                    <asp:Label ID="teacher_idLabel1" runat="server" Text='<%# Eval("teacher_id") %>' />
                                    <br />
                                    teacher_name:
                    <asp:TextBox ID="teacher_nameTextBox" runat="server" Text='<%# Bind("teacher_name") %>' />
                                    <br />
                                    password:
                    <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                                    <br />
                                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="更新" />
                                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    工号:
                    <asp:TextBox ID="teacher_idTextBox" runat="server" Text='<%# Bind("teacher_id") %>' />
                                    <br />
                                    姓名:
                    <asp:TextBox ID="teacher_nameTextBox" runat="server" Text='<%# Bind("teacher_name") %>' />
                                    <br />
                                    密码:
                    <asp:TextBox ID="passwordTextBox" runat="server" Text='<%# Bind("password") %>' />
                                    <br />
                                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="添加教师" />
                                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    teacher_id:
                    <asp:Label ID="teacher_idLabel" runat="server" Text='<%# Eval("teacher_id") %>' />
                                    <br />
                                    teacher_name:
                    <asp:Label ID="teacher_nameLabel" runat="server" Text='<%# Bind("teacher_name") %>' />
                                    <br />
                                    password:
                    <asp:Label ID="passwordLabel" runat="server" Text='<%# Bind("password") %>' />
                                    <br />
                                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="编辑" />
                                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="删除" />
                                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="新建" />
                                </ItemTemplate>
                            </asp:FormView>
                            <br />
                        </div>

                    </div>
                </div>


            </main>
            <footer class="footer" role="contentinfo">
                <div class="container">

                    <div class="row justify-content-center text-center">
                        <div class="col-md-7">
                            <p class="copyright">Copyright &copy; 2020. Zfz. All rights reserved.</p>
                            <div class="credits">
                            </div>
                        </div>
                    </div>

                </div>
            </footer>
        </div>
        <!-- .site-wrap -->

        <!-- Vendor JS Files -->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/jquery/jquery-migrate.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <script src="vendor/easing/easing.min.js"></script>

        <script src="vendor/sticky/sticky.js"></script>
        <script src="vendor/aos/aos.js"></script>
        <script src="vendor/owlcarousel/owl.carousel.min.js"></script>

        <!-- Template Main JS File -->
        <script src="js/main.js"></script>

    </form>
</body>
</html>
