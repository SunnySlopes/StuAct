<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StuHome.aspx.cs" Inherits="StuHome" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学生端首页</title>
    <!-- Favicons -->
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
                            <h1 class="mb-0 site-logo"><a href="StuHome.aspx" class="mb-0">Web开发技术</a></h1>
                        </div>

                        <div class="col-12 col-md-10 d-none d-lg-block">
                            <nav class="site-navigation position-relative text-right" role="navigation">

                                <ul class="site-menu main-menu js-clone-nav mr-auto d-none d-lg-block">
                                    <li><a href="StuHome.aspx" class="nav-link">主页</a></li>

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
                                        <h1 data-aos="fade-up" data-aos-delay="">学生端首页</h1>
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
                            <h3>友情提醒
                                

                            </h3>
                            <small>
                                <input type="button" value="隐藏" id="1" />
                                <input type="button" value="显示" id="2" />
                            </small>
                            <div id="tx">
                                <div>
                                    <span id="myTime">现在是20xx年x月x日</span>
                                    <span id="myClock">00:00:00</span>
                                    <span>，请注意合理安排作息哦！</span><br />
                                    <br />
                                </div>
                                <h5>今日上海天气</h5>
                                温度：<span id="no1">温度</span><br />
                                天气：<span id="no2">天气</span><br />
                                <span id="no3">提醒</span><br />
                            </div>
                            
                        </div>
                        <div>
                            <br />
                            <h3>提交作业</h3>
                            <br />
                            <table class='table table-bordered table-hover'>
                                <tr>
                                    <td>作业编号</td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="act_name" DataValueField="act_name"></asp:DropDownList><br />
                                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ActManageConnectionString %>" SelectCommand="SELECT * FROM [Act] WHERE ([type] = '作业')"></asp:SqlDataSource>
                                    </td>
                                </tr>
                                <tr>
                                    <td>选择文件</td>
                                    <td>
                                        <asp:FileUpload ID="FileUpload1" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td>
                                        <asp:Button ID="Button2" runat="server" Text="上传" OnClick="Button2_Click" />
                                        <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                                    </td>
                                </tr>
                            </table>
                           
                            
                        </div>
                        <br /><br />
                        <div>
                            <h3>我的成绩</h3>
                            <br />
                            <div id="TableStu" runat="server"></div>
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

        <script type="text/javascript">
            var IntervalID;
            function f_myClock() {
                var Today = new Date();
                var reg = /\w+:\w+:\w{2}/;
                //var myClock;
                myClock.innerHTML = Today.toTimeString().match(reg);
            }
            function timer() {
                IntervalID = setInterval('f_myClock()', 1000);
                return IntervalID;
            }

            function UpdateTime() {
                var Today = new Date();
                var nowDateTime = "现在是" + Today.getFullYear() + "年" +
                    (Today.getMonth() + 1) + "月" + Today.getDate() + "日";
                //var myTime;
                myTime.innerHTML = nowDateTime;
                timer();
            }
            window.onload = getWeather;
            function getWeather() {
                UpdateTime();
                if (window.XMLHttpRequest) {
                    xmlhttp = new XMLHttpRequest();
                }
                else if (window.ActiveXObject) {
                    xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                }
                else {
                    xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
                }
                xmlhttp.open("GET", "http://www.webxml.com.cn.zkllab.com/webservices/weatherwebservice.asmx/getWeatherbyCityName?theCityName=%E4%B8%8A%E6%B5%B7", true);
                xmlhttp.send(null);
                xmlhttp.onreadystatechange = stateChange;
                function stateChange() {
                    if (xmlhttp.readyState === 4) {
                        if (xmlhttp.status === 200 || xmlhttp.status === 0) {
                            var data = xmlhttp.responseXML;
                            document.getElementById("no1").innerText = data.getElementsByTagName("string")[5].firstChild.nodeValue;
                            document.getElementById("no2").innerText = data.getElementsByTagName("string")[6].firstChild.nodeValue;
                            document.getElementById("no3").innerText = data.getElementsByTagName("string")[11].firstChild.nodeValue;
                        }
                    }
                }
            }
        </script>
        <script type="text/javascript">
            $(document).ready(function () {
                $("#1").click(function () {
                    $("#tx").hide();
                });
                $("#2").click(function () {
                    $("#tx").show();
                })
            });
        </script>
    </form>
</body>
</html>
