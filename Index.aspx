<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Index.aspx.cs" Inherits="Index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport"
        content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
    <title>学生作业管理系统</title>
    <style>
        * {
            padding: 0;
            margin: 0;
            box-sizing: border-box;
        }

        ul,
        li {
            list-style: none;
        }

        html,
        body,
        .login-outter {
            height: 100%;
        }

        .clearfix:after {
            clear: both;
            display: block;
            content: "";
        }

        .layout-center {
            max-width: 1200px;
            margin: 0 auto;
            width: 100%;
        }

        .wrapper {
            height: 100%;
            position: relative;
        }

            .wrapper .topbar {
                position: absolute;
                top: 0;
                width: 100%;
                z-index: 9;
                background: url("img/images/headerbg.jpg") repeat-x;
                height: 95px;
            }

        @media screen and (max-width: 768px) {
            .wrapper .topbar {
                background: none;
            }

                .wrapper .topbar .layout-center {
                    margin: 10px auto;
                }
        }

        .wrapper .topbar .left-logo {
            height: 95px;
            background: url("img/images/logo-white.png") 0/170px no-repeat;
        }

        @media screen and (max-width: 768px) {
            .wrapper .topbar .left-logo {
                height: 125px;
                background: url("img/images/logo-m.png") center/250px no-repeat;
            }
        }

        .wrapper .footer {
            font-size: 10px;
            position: absolute;
            bottom: 0;
            width: 100%;
            background: url("img/images/footerbg.jpg") repeat-x;
            height: 78px;
            text-align: center;
            line-height: 1.4;
            color: #fff;
        }

        @media screen and (max-width: 768px) {
            .wrapper .footer {
                display: none;
            }
        }

        .wrapper .footer .layout-center {
            margin: 10px auto 0;
        }

        .wrapper .login-wrap {
            background: url("img/images/login-bg.jpg") center/cover repeat-x;
            background-color: #ccc;
            height: 100%;
            padding: 100px 0 80px;
        }

        @media screen and (max-width: 768px) {
            .wrapper .login-wrap {
                padding: 150px 0 0;
                background: #fff url("img/images/login-bg-m.jpg") bottom/cover no-repeat;
            }
        }

        .wrapper .login-wrap img {
            width: 100%;
            display: block;
        }

        @media screen and (min-width: 769px) {
            .wrapper .center-session {
                width: 100%;
                max-width: 350px;
                float: right;
                padding: 30px;
                text-align: center;
                display: block;
                background: rgba(255, 255, 255, 0.8);
                border-top: 4px solid #275085;
                min-height: 330px;
                max-height: 360px;
                margin-top: 8%;
            }

                .wrapper .center-session .header-title {
                    font-size: 22px;
                    color: #275085;
                    text-align: left;
                    display: block;
                }

                .wrapper .center-session form .input-item {
                    margin-top: 20px;
                }

                    .wrapper .center-session form .input-item input {
                        width: 100%;
                        display: block;
                        padding: 10px;
                        border: 1px solid #ddd;
                        color: #222;
                        background: #fff;
                        border-radius: 3px;
                        outline: none;
                    }
        }

        @media screen and (max-width: 768px) {
            .wrapper .center-session {
                width: 80%;
                margin: 0 auto;
            }

                .wrapper .center-session .header-title {
                    display: none;
                }

                .wrapper .center-session form .input-item {
                    position: relative;
                    margin-bottom: 20px;
                }

                    .wrapper .center-session form .input-item .login-icon {
                        position: absolute;
                        left: 10px;
                        top: 8px;
                        display: inline-block;
                        width: 20px;
                        height: 20px;
                        background: url("img/images/user.png") center/20px no-repeat;
                    }

                        .wrapper .center-session form .input-item .login-icon.loginpass-icon {
                            background: url("img/images/password.png") center/25px no-repeat;
                        }

                    .wrapper .center-session form .input-item input {
                        width: 100%;
                        padding: 10px;
                        border: none;
                        border-radius: 6px;
                        padding-left: 35px;
                        outline: none;
                    }
        }

        .wrapper .center-session #login-submit {
            outline: none;
            padding: 10px 0;
            background-color: #275085;
            border: none;
            color: #fff;
            width: 100%;
            border-radius: 6px;
        }

        .wrapper .center-session .other-link {
            text-align: right;
            margin: 15px 0 5px;
        }

            .wrapper .center-session .other-link a {
                font-size: 13px;
                color: #275085;
                text-decoration: underline;
            }

        .wrapper .center-session .showMessage {
            font-size: 12px;
            margin: 5px 0 10px;
            text-align: left;
            min-height: 20px;
            color: red;
        }
    </style>
</head>
<body>

    <div class="login-outter">
        <div class="web-wrap wrapper">
            <div class="topbar">
                <div class="layout-center clearfix">
                    <div class="left-logo"></div>
                </div>
            </div>
            <div class="login-wrap">
                <div class="layout-center">
                    <div class="center-session">
                        <label class="header-title">学生作业管理系统</label>
                        <form id="form1" runat="server">
                            <div class="input-item">
                                <i class="login-icon loginname-icon"></i>
                                <input id="Text1" type="text" runat="server" placeholder="请输入学号或工号" />
                            </div>
                            <div class="input-item">
                                <i class="login-icon loginpass-icon"></i>
                                <input id="Password1" type="password" runat="server" placeholder="请输入密码" />
                            </div>
                            <br />
                            <div>
                                <input id="Radio1" type="radio" name="sf" value="xs" runat="server" />学生
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <input id="Radio2" type="radio" name="sf" value="js" runat="server" />教师/管理员
                            </div>
                            <p class="showMessage" id="jieguo" runat="server">
                            </p>
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="登录" Height="30px" Width="255px" />
                        </form>
                        <div class="other-link clearfix">

                            <p></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="footer">
                <div class="layout-center">

                    <div class="footer-cp">Web开发课程大作业</div>
                    <div class="footer-cp">Copyright © 2021 SunnySlopes. All Rights Reserved.</div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
