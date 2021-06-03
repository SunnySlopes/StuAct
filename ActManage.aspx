<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ActManage.aspx.cs" Inherits="ActManage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>作业管理</title>
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
                            <h1 class="mb-0 site-logo"><a href="TeacherHome.aspx" class="mb-0">Web开发课程大作业</a></h1>
                        </div>

                        <div class="col-12 col-md-10 d-none d-lg-block">
                            <nav class="site-navigation position-relative text-right" role="navigation">

                                <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                                    <li><a href="TeacherHome.aspx" class="nav-link">主页</a></li>
                                    <li><a href="StuManage.aspx" class="nav-link">账号管理</a></li>
                                    <li><a href="ActManage.aspx" class="nav-link">作业管理</a></li>
                                    <li><a href="Score.aspx" class="nav-link">作业评分</a></li>
                                    <li><a href="Tongji.aspx" class="nav-link">统计信息</a></li>
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
                                        <h1 data-aos="fade-up" data-aos-delay="">作业管理</h1>
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
                            <h3>新建作业</h3>
                            <table class="table table-striped table-bordered table-hover">
                                <tr>
                                    <td>作业类型</td>
                                    <td>
                                        <input id="Text1" type="text" runat="server" style="width:80%" /></td>
                                </tr>
                                <tr>
                                    <td>作业名称</td>
                                    <td>
                                        <input id="Text2" type="text" runat="server" style="width:80%" /></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>
                                        <asp:Button ID="Button2" runat="server" OnClick="Button1_Click" Text="确认" />
                                        <input id="Reset1" type="reset" value="重置" /></td>
                                </tr>
                            </table>
                            <br />
                            <h3>现有作业列表</h3>
                            <br />
                            <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered table-hover" runat="server" AutoGenerateColumns="False" DataKeyNames="act_id" DataSourceID="SqlDataSource1" AutoGenerateDeleteButton="True" AutoGenerateEditButton="True">
                                <Columns>
                                    <asp:BoundField DataField="act_id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="act_id" />
                                    <asp:BoundField DataField="type" HeaderText="作业类型" SortExpression="type" />
                                    <asp:BoundField DataField="act_name" HeaderText="作业名称" SortExpression="act_name" />
                                    <asp:BoundField DataField="date" HeaderText="起始日期" SortExpression="date" />
                                </Columns>
                            </asp:GridView>
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ActManageConnectionString %>" SelectCommand="SELECT * FROM [Act]" DeleteCommand="DELETE FROM [Act] WHERE [act_id] = @act_id" InsertCommand="INSERT INTO [Act] ([type], [act_name], [date]) VALUES (@type, @act_name, @date)" UpdateCommand="UPDATE [Act] SET [type] = @type, [act_name] = @act_name, [date] = @date WHERE [act_id] = @act_id">
                                <DeleteParameters>
                                    <asp:Parameter Name="act_id" Type="Int32" />
                                </DeleteParameters>
                                <InsertParameters>
                                    <asp:Parameter Name="type" Type="String" />
                                    <asp:Parameter Name="act_name" Type="String" />
                                    <asp:Parameter Name="date" Type="DateTime" />
                                </InsertParameters>
                                <UpdateParameters>
                                    <asp:Parameter Name="type" Type="String" />
                                    <asp:Parameter Name="act_name" Type="String" />
                                    <asp:Parameter Name="date" Type="DateTime" />
                                    <asp:Parameter Name="act_id" Type="Int32" />
                                </UpdateParameters>
                            </asp:SqlDataSource>
                            <br />
                        </div>
                    </div>
                </div>


            </main>
            <footer class="footer" role="contentinfo">
                <div class="container">

                    <div class="row justify-content-center text-center">
                        <div class="col-md-7">
                            <p class="copyright">Copyright © 2021 SunnySlopes. All Rights Reserved.</p>
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
