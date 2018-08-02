<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegistrationList.aspx.cs" Inherits="RegistrationList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html lang="en-US">
<head>
<style type="text/css">
    .modal
    {
        position: fixed;
        top: 0;
        left: 0;
        background-color: black;
        z-index: 99;
        opacity: 0.8;
        filter: alpha(opacity=80);
        -moz-opacity: 0.8;
        min-height: 100%;
        width: 100%;
    }
    .loading
    {
        font-family: Arial;
        font-size: 10pt;
        border: 5px solid #67CFF5;
        width: 200px;
        height: 100px;
        display: none;
        position: fixed;
        background-color: White;
        z-index: 999;
    }
</style>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>  

<script type="text/javascript">

    $(document).ready(function () {
        $("#test_delete").click(function () {
            message();
        });
        $("#cancel").click(function () {
            hide();
        });
    });

    function message() {

        $("#delete_message").slideDown();
    }

    function hide() {
        $("#delete_message").slideUp();
    }
</script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
    $(document).ready(function () {
        // LoginAccess();
    });
</script>
 <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>  

<script type="text/javascript">
    var g_ref_no = '';
    var fileName = '';
    function DeleteBtn(n, filename) {

        fileName = filename;
        g_ref_no = n;
        var x = document.getElementById('delete_message');
        if (x.style.display === 'none') {
            $('html, body').animate({ scrollTop: 0 }, 'slow');

            $("#delete_message").slideDown();
        } else {
            x.style.display = 'none';
        }


        //  alert(n);
    }

    function UpdateBtn(p_ref) {

        window.location = "ServiceAdd.html?p_ref=" + p_ref + "";
    }
    function GotoGallery(p_ref) {

        window.location = "ServiceGallery.html?p_ref=" + p_ref + "";
    }
    function LoginAccess() {









        var Messege = "";


        if (Messege.length == 0) {
            $.ajax({

                type: "POST",
                dataType: "json",
                contentType: "application/json; charset=utf-8",
                url: "Default.aspx/LoginAccess",
                data: "{}",

                success: function (Record) {

                    if (Record.d == 'success') {



                    }
                    else {
                        alert('Please Login first');
                        window.location = "login.html";
                    }
                },
                Error: function (textMsg) {

                    alert(textMsg);
                }
            });
        }



    }
   </script> 

   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>  

<script type="text/javascript">


    function GetApproval(ref_no,emailid) {

        var d = confirm('Do You Want to Approval?');
        if (d == true) {

            var ID = ref_no;

            var Messege = "";

            if (ID == '') {
                Messege = "Can not Blank Name";
                $("div.warning").fadeIn(300).delay(1500).fadeOut(400);
            }


            if (Messege.length == 0) {
                $.ajax({

                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",
                    url: "Default.aspx/Approval",
                    data: "{'ID':'" + ID + "','EmailID':'" + emailid + "'}",

                    success: function (Record) {

                        if (Record.d == 'success') {
                            $("div.success").fadeIn(300).delay(1500).fadeOut(400);
                            window.location = "RegistrationList.aspx";
                            //                        alert("Submit");

                            //  window.close();
                        }
                        else {
                            $("div.failure").fadeIn(300).delay(1500).fadeOut(400);
                            // alert(Record.d);
                        }
                    },
                    Error: function (textMsg) {

                        alert(textMsg);
                    }
                });
            }

        }

    }
   </script> 

<!-- Basic Page Head -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>HAJJ E-WALLET SYSTEM</title>
<meta name="description" content="">
<meta name="author" content="">
<meta name="keywords" content="">

<!-- Mobile Meta -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no">

<!-- Favicons -->
<link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.ico">

<!-- Css -->
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/bxslider.css">
<link rel="stylesheet" type="text/css" href="assets/css/font.awesome.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/magnific.popup.css">
<link rel="stylesheet" type="text/css" href="assets/css/owl.carousel.css">
<link rel="stylesheet" type="text/css" href="assets/css/owl.theme.css">
<link rel="stylesheet" type="text/css" href="assets/css/style.css">
<link rel="stylesheet" type="text/css" href="assets/css/responsive.css">

<!-- Google Fonts -->
<link href="http://fonts.googleapis.com/css?family=Roboto:300,400,500,700&amp;subset=latin,latin-ext" rel="stylesheet" type="text/css">
<link href="http://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
  <style>

.alert-box {
	padding: 15px;
    margin-bottom: 20px;
    border: 1px solid transparent;
    border-radius: 4px;  
}

.success {
    color: #3c763d;
    background-color: #dff0d8;
    border-color: #d6e9c6;
    display: none;
}

.failure {
    color: #a94442;
    background-color: #f2dede;
    border-color: #ebccd1;
    display: none;
}

.warning {
    color: #8a6d3b;
    background-color: #fcf8e3;
    border-color: #faebcc;
    display: none;
}
.errorClass { border:  1px solid red; }
</style>  
<script>
    (function (i, s, o, g, r, a, m) {
        i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
            (i[r].q = i[r].q || []).push(arguments)
        }, i[r].l = 1 * new Date(); a = s.createElement(o),
  m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
    })(window, document, 'script', '../../../www.google-analytics.com/analytics.js', 'ga');

    ga('create', 'UA-52754132-6', 'auto');
    ga('send', 'pageview');

</script>

<script src="http://code.jquery.com/jquery-1.10.2.js" type="text/javascript"></script>

<script type="text/javascript">

    $(function () {
        $('#btnSave').click(function () {

            var Messege = "";
            var fname = $.trim($("#txtFname").val());
            var mname = $.trim($("#txtMname").val());
            var lname = $.trim($("#txtLname").val());

            var nationality = $.trim($("#ddlNation").val());
            var email = $.trim($("#txtEmail").val());

            var mob = $.trim($("#txtMob").val());

            var cardtype = $.trim($("#ddlCardType").val());

            var cardno = $.trim($("#txtCardNo").val());

            var cvv = $.trim($("#txtCVV").val());


            if (fname == '') {

                Messege = "Can not Blank Name";
                document.getElementById("txtFname").style.border = "1px solid red";
            }
            if (lname == '') {
                Messege = "Can not Blank Name";
                document.getElementById("txtLname").style.border = "1px solid red";
            }

            if (nationality == 0) {
                Messege = "Can not Blank Name";
                document.getElementById("ddlNation").style.border = "1px solid red";
            }
            if (email == 0) {
                Messege = "Can not Blank Name";
                document.getElementById("txtEmail").style.border = "1px solid red";
            }
            if (mob == 0) {
                Messege = "Can not Blank Name";
                document.getElementById("txtMob").style.border = "1px solid red";
            }




            if (Messege.length == 0) {
                $.ajax({

                    type: "POST",
                    dataType: "json",
                    contentType: "application/json; charset=utf-8",

                    url: "Default.aspx/SaveReg",
                    data: "{'fname':'" + fname + "','mname':'" + mname + "', 'lname':'" + lname + "', 'nationality':'" + nationality + "', 'email':'" + email + "', 'mobile_no':'" + mob + "', 'card_type':'" + cardtype + "', 'card_no':'" + cardno + "'}",



                    success: function (Record) {

                        if (Record.d == 'success') {
                            HideProgress();
                            $('#btnSave').css('display', 'block');
                            $("div.success").fadeIn(300).delay(1500).fadeOut(400);
                            //                        alert("Submit");
                        }
                        else {
                            $("div.failure").fadeIn(300).delay(1500).fadeOut(400);
                            // alert(Record.d);
                        }
                    },
                    Error: function (textMsg) {

                        alert(textMsg);
                    }


                });
            }
        });

    })
    
</script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>  

 


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

   
</head>
<body>
<div class="loading" align="center">
    Saving.. Please wait.<br />
    <br />
    <img src="assets/img/loader1.gif" alt="" />
</div>
<!-- Site Loader -->
<div class="site-loader">
	<img src="assets/img/loader.gif" alt="Loading">
</div>
<!-- Site Loader End -->

<!-- Site Back Top -->
<div class="site-back-top" title="Back to top">
	<i class="fa fa-angle-up"></i>
</div>
<!-- Site Back Top End -->

<!-- Site Header -->
<header>
	<div class="site-wrapper">
        <div class="site-header">
              <!-- Header Top -->
            <div class="header-top">
                <ul class="clearfix">
                    <li class="ht-phone">92000 00011</li>
                   
                    <li class="ht-search">
                        <form>
                            <input type="text" placeholder="SEARCH" required>
                            <button type="submit"><i class="fa fa-search"></i></button>
                        </form>
                    </li>
                </ul>
            </div>
            <!-- Header Top End -->
            
            <!-- Header Bottom -->
            <div class="header-bottom">
                <div class="hb-toggle"><i class="fa fa-bars"></i></div>
                <div class="hb-logo"><a href="#"><img src="assets/img/rsz_hajjlogo.png" alt="#"></a></div>
                <div class="hb-menu">
                    <nav>
                        <ul class="clearfix">
                            <li><a href="#">Home</a></li>
                            <li><a href="#">NEW</a></li>
                           
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- Header Bottom End -->
        </div>
    </div>
    <div class="site-banner">
	<div class="banner-image">
    	<img src="assets/img/REALHAJJIMG.jpg" alt="Banner">
    </div>
    <div class="banner-caption shadow">
    	<div class="caption-wrapper">
            <h1>E-WALLET REGISTRATION LIST</h1>
            
        </div>
    </div>
</div>
</header>
<!-- Site Header End -->

<!-- Site Main -->
<main>
    <div class="site-wrapper">
       



        <!-- Section Contact -->
        <section class="site-block white" id="section-contact">
            
                    <div class="data-form">
                        <form action="#" id="contact-form" method="post" enctype="multipart/form-data">
                            <div class="row">
                          
                              <div class="pt-40 pb-40">
                <br />
                    
                    <h3>REGISTRATION LIST</h3>
              <hr />
              
              
                                        <div class="row">


                                        <form id="form1" runat="server">
        <div >
            <table class="table table-striped table-bordered" style="font-family: Serif;"
                border="1px" id="example" >
                <thead>
                    <tr>
                        <th style="text-align:center">#</th>
                        <th style="text-align:center;display:none">#</th>
                         <th style="text-align:center;display:none">#</th>
                       
                        <th style="text-align:center">First Name</th>
                      
                        <th style="text-align:center">Midle Name</th>

                          <th style="text-align:center">Last Name</th>

                            <th style="text-align:center"> Nationality</th>
                              <th style="text-align:center">Email</th>
                                <th style="text-align:center">Mobile#</th>
                                  <th style="text-align:center"> Card Type</th>
                                    <th style="text-align:center">Card No</th>
                        <th style="text-align:center">Action</th>
                    </tr>
                </thead>
                <tbody id="tlist" runat="server">
                </tbody>
            </table>
        </div>
    </form>










    

    </div>
    </div>
                             
                            </div>

                        </form>
                   
            </div>
        </section>
        <!-- Section Contact End -->        
    </div>
</main>
<!-- Site Main End -->
<div align="right"><!-- </div>
<!-- Site Footer -->
<footer>
	<div>
        <div class="site-footer">
        <p>&nbsp;</p>
      
     
       
           <!-- Footer Middle -->
            <div class="footer-middle clearfix">
                <div class="fm-social">
                    <h4>FOLLOW US SOCIAL MEDIA</h4>
                    <ul class="social-icons social-round clearfix">
                        <li class="facebook"><a href="#"><i class="fa fa-facebook"></i></a></li>
                        <li class="twitter"><a href="#"><i class="fa fa-twitter"></i></a></li>
                        <li class="linkedin"><a href="#"><i class="fa fa-linkedin"></i></a></li>
                        <li class="google-plus"><a href="#"><i class="fa fa-google-plus"></i></a></li>
                    </ul>
                </div>
                <div class="fm-newsletter">
                    <h4>SUBSCRIBE TO OUR NEWSLETTER</h4>
                    <div class="newsletter-form clearfix">
                    <form>
                        <input type="text" placeholder="ENTER YOUR E-MAIL ADDRESS" required>
                        <button type="submit"><i class="fa fa-paper-plane"></i></button>
                    </form>
                    </div>
                </div>
            </div>
            <!-- Footer Middle End -->
            
            <!-- Footer Bottom -->
            <div class="footer-bottom clearfix">
                <div class="fb-copyright">© TEAM B-079.</div>
                <div class="fb-contact">
                    <ul class="clearfix">
                        <li><i class="fa fa-map-marker"></i> HAJJ MISSION Kingdom of Saudi Arabia</li>
                        <li><i class="fa fa-phone"></i> 920000566</li>
                        <li><i class="fa fa-paper-plane"></i> <a href="#">INFO@HAJJ.COM</a></li>
                    </ul>
                </div>
            </div>
            <!-- Footer Bottom End -->
        </div>
    </div>
</footer>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/bxslider.min.js"></script>
<script src="assets/js/owl.carousel.min.js"></script>
<script src="assets/js/jquery.countTo.js"></script>
<script src="assets/js/jquery.fitvids.js"></script>
<script src="assets/js/jquery.magnific.popup.min.js"></script>
<script src="assets/js/contact.form.js"></script>

<!-- Map Scripts -->
<script src="http://maps.google.com/maps/api/js?sensor=false&amp;language=en"></script>
<script src="assets/js/gmap3.min.js"></script>

<!-- Custom Scripts -->
<script src="assets/js/custom.js"></script>
</body>
</html>
