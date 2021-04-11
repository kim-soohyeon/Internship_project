<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<link rel="icon" href="https://static.thenounproject.com/png/131805-200.png" type="image/x-icon">

<head>

    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Soohyeon’s Membership</title>

    <!-- Bootstrap Core CSS -->
    <link href="/resources/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand"><i class="fa fa-heart pr-2" aria-hidden="true"></i> Soohyeon’s Membership <i class="fa fa-heart pr-2" aria-hidden="true"></i></a>
            </div>
            <!-- /.navbar-header -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li>
                            <a><i class="fa fa-edit fa-fw"></i> 회원관련<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/user/register">회원가입</a>
                                </li>
                                <li>
                                    <a href="/user/search">회원조회</a>
                                </li>
                            </ul>
                            <!-- /.nav-1-level -->
                        </li>
                        <li>
                            <a><i class="fa fa-edit fa-fw"></i> 프로모션관련<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="/promotion/register">프로모션 등록</a>
                                </li>
                                <li>
                                    <a href="/promotion/searchEdit">프로모션 조회</a>
                                </li>
                            </ul>
                            <!-- /.nav-2-level -->
                        </li>
                        <li>
                            <a href="/user/paymentList"><i class="fa fa-edit fa-fw"></i> 거래이력</a>
                        </li>
                        <li>
                            <a href="/user/payment"><i class="fa fa-edit fa-fw"></i> 결제</a>
                        </li>
                    </ul>
<!--                     <div class="social">
					<a href="#" class="facebook"><i class="icon-facebook"></i></a>
					<a href="#" class="twitter"><i class="icon-twitter"></i></a>
					<a href="#" class="google"><i class="icon-google-plus"></i></a>
					<a href="#" class="linkedin"><i class="icon-linkedin"></i></a>
					</div> -->
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <div id="page-wrapper">

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>