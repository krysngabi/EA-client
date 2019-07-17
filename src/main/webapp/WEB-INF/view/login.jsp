<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/platform.js" async defer></script>

<!------ Include the above in your HEAD tag ---------->

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <meta name="google-signin-client_id" content="818417293537-qvh0ogiscij8pm49rk6ag3ajdb67le9r.apps.googleusercontent.com">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
     <style>
        #logreg-forms{
            width:412px;
            margin:10vh auto;
            background-color:#f3f3f3;
            box-shadow: 0 1px 3px rgba(0,0,0,0.12), 0 1px 2px rgba(0,0,0,0.24);
            transition: all 0.3s cubic-bezier(.25,.8,.25,1);
        }
        #logreg-forms form {
            width: 100%;
            max-width: 410px;
            padding: 15px;
            margin: auto;
        }
        #logreg-forms .form-control {
            position: relative;
            box-sizing: border-box;
            height: auto;
            padding: 10px;
            font-size: 16px;
        }
        #logreg-forms .form-control:focus { z-index: 2; }
        #logreg-forms .form-signin input[type="email"] {
            margin-bottom: -1px;
            border-bottom-right-radius: 0;
            border-bottom-left-radius: 0;
        }
        #logreg-forms .form-signin input[type="password"] {
            border-top-left-radius: 0;
            border-top-right-radius: 0;
        }

        #logreg-forms .social-login{
            width:390px;
            margin:0 auto;
            margin-bottom: 14px;
        }
        #logreg-forms .social-btn{
            font-weight: 100;
            color:white;
            width:190px;
            font-size: 0.9rem;
        }

        #logreg-forms a{
            display: block;
            padding-top:10px;
            color:lightseagreen;
        }

        #logreg-form .lines{
            width:200px;
            border:1px solid red;
        }


        #logreg-forms button[type="submit"]{ margin-top:10px; }

        #logreg-forms .facebook-btn{  background-color:#3C589C; }

        #logreg-forms .google-btn{ background-color: #DF4B3B; }

        #logreg-forms .form-reset, #logreg-forms .form-signup{ display: none; }

        #logreg-forms .form-signup .social-btn{ width:210px; }

        #logreg-forms .form-signup input { margin-bottom: 2px;}

        .form-signup .social-login{
            width:210px !important;
            margin: 0 auto;
        }

        /* Mobile */

        @media screen and (max-width:500px){
            #logreg-forms{
                width:300px;
            }

            #logreg-forms  .social-login{
                width:200px;
                margin:0 auto;
                margin-bottom: 10px;
            }
            #logreg-forms  .social-btn{
                font-size: 1.3rem;
                font-weight: 100;
                color:white;
                width:200px;
                height: 56px;

            }
            #logreg-forms .social-btn:nth-child(1){
                margin-bottom: 5px;
            }
            #logreg-forms .social-btn span{
                display: none;
            }
            #logreg-forms  .facebook-btn:after{
                content:'Facebook';
            }

            #logreg-forms  .google-btn:after{
                content:'Google+';
            }

        }
    </style>

    <title>Login Form</title>
</head>
<body>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/fr_FR/sdk.js#xfbml=1&version=v3.3&appId=868311036876197&autoLogAppEvents=1"></script>
<script>
    $(function() {
        var handle200 = function(data, textStatus, jqXHR) {
            alert('201'); // success codes have the success signature
        };
        $('#login-form').submit(function(e) {


            // reference to form object
            var form = this;
            // for stopping the default action of element
            e.preventDefault();
            // mapthat will hold form data
            var formData = {}
            //iterate over form elements
            $.each(this, function(i, v){
                var input = $(v);

                // populate form data as key-value pairs
                // with the name of input as key and its value as value
                formData[input.attr("name")] = input.val();
            });
            $.ajax({
                type : "POST",
                url: '/login',
                async: false,
                contentType: "application/json",
                dataType : 'text',
                // convert form data to json format
                data : JSON.stringify(formData),

                success: function(data){
                    var uId = data.substring(0, 1);
                    var token=data.substring(1,data.length);

                    if(uId=='n'){
                        localStorage.removeItem("token");
                        window.location.href = "/login";
                    }else if(uId=='1'){
                        localStorage.setItem("token", token);
                        window.location.href = "/";
                    }else if(uId=='2'){
                        localStorage.setItem("token", token);
                        window.location.href = "/customer";
                    }
                }
            });
        });


    });
</script>
<script>
    // This is called with the results from from FB.getLoginStatus().
    function statusChangeCallback(response) {
        console.log('statusChangeCallback');
        console.log(response);
        // The response object is returned with a status field that lets the
        // app know the current login status of the person.
        // Full docs on the response object can be found in the documentation
        // for FB.getLoginStatus().
        if (response.status === 'connected') {
            // Logged into your app and Facebook.
            testAPI();
        } else {
            // The person is not logged into your app or we are unable to tell.
            document.getElementById('status').innerHTML = 'Please log ' +
                'into this app.';
        }
    }

    // This function is called when someone finishes with the Login
    // Button.  See the onlogin handler attached to it in the sample
    // code below.
    function checkLoginState() {
        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });
    }

    window.fbAsyncInit = function() {
        FB.init({
            appId      : '868311036876197',
            cookie     : true,  // enable cookies to allow the server to access
                                // the session
            xfbml      : true,  // parse social plugins on this page
            version    : 'v2.8' // The Graph API version to use for the call
        });

        // Now that we've initialized the JavaScript SDK, we call
        // FB.getLoginStatus().  This function gets the state of the
        // person visiting this page and can return one of three states to
        // the callback you provide.  They can be:
        //
        // 1. Logged into your app ('connected')
        // 2. Logged into Facebook, but not your app ('not_authorized')
        // 3. Not logged into Facebook and can't tell if they are logged into
        //    your app or not.
        //
        // These three cases are handled in the callback function.

        FB.getLoginStatus(function(response) {
            statusChangeCallback(response);
        });

    };

    // Load the SDK asynchronously
    (function(d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) return;
        js = d.createElement(s); js.id = id;
        js.src = "https://connect.facebook.net/en_US/sdk.js";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

    // Here we run a very simple test of the Graph API after login is
    // successful.  See statusChangeCallback() for when this call is made.
    function testAPI() {
        console.log('Welcome!  Fetching your information.... ');
        FB.api('/me', function(response) {
            alert('Successfully logged in as  : ' + response.name);

            $.ajax({
                type : "POST",
                url: '/login',
                async: false,
                contentType: "application/json",
                dataType : 'text',
                // convert form data to json format
                data : JSON.stringify( {
                    username: response.name,
                    password: response.name,
                    firstName:response.name
                }),

                success: function(data){
                    var uId = data.substring(0, 1);
                    var token=data.substring(1,data.length);


                    if(uId=='n'){
                        localStorage.removeItem("token");
                        window.location.href = "/login";
                    }else if(uId=='1'){
                        localStorage.setItem("token", token);
                        window.location.href = "/";
                    }else if(uId=='2'){
                        localStorage.setItem("token", token);
                        window.location.href = "/customer";
                    }
                }
            });

            console.log('Successful login for: ' + response.name);
            document.getElementById('status').innerHTML =
                'Thanks for logging in, ' + response.name + '!';
        });
    }
</script>
<script >
    var clicked=false;//Global Variable
    function ClickLogin()
    {
        clicked=true;
    }
    function onSignIn(googleUser) {

        if (clicked) {

            var profile = googleUser.getBasicProfile();
            console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
            console.log('Name: ' + profile.getName());
            console.log('Image URL: ' + profile.getImageUrl());
            console.log('Email: ' + profile.getEmail());
            alert('Successfully logged in as '+profile.getName());
            $.ajax({
                type: "POST",
                url: '/login',
                //async: false,
                contentType: "application/json",
                dataType: 'text',
                // convert form data to json format
                data: JSON.stringify({
                    username: profile.getName(),
                    password: profile.getName(),
                    firstName: profile.getName()
                })
                ,success:function (data) {
                    var uId = data.substring(0, 1);
                    var token=data.substring(1,data.length);


                    if(uId=='n'){
                        localStorage.removeItem("token");
                        window.location.href = "/login";
                    }else if(uId=='1'){
                        localStorage.setItem("token", token);
                        window.location.href = "/";
                    }else if(uId=='2'){
                        localStorage.setItem("token", token);
                        window.location.href = "/customer";
                    }

                }
            });
        }else{

        }
    }

</script>
<script>
    function myFunction() {
        gapi.auth2.getAuthInstance().disconnect();
        location.reload();
    }
</script>
<style type="text/css">
    #customBtn {
        display: inline-block;
        background: white;
       margin-left: auto;
        margin-right: auto;
    }
</style>
<div id="logreg-forms">
    <form:form class="form-signin" action="/login" modelAttribute="user"  id="login-form">
        <h1 class="h3 mb-3 font-weight-normal" style="text-align: center"> LogIn</h1>
        <div class="social-login" style="text-align: center">
            <fb:login-button scope="public_profile,email" onlogin="checkLoginState();" size="large"
                             autologoutlink="true" data-use-continue-as="true">
                Login with Facebook
            </fb:login-button>
        </div>
        <div  style="text-align: center" >
            <div class="g-signin2" data-onsuccess="onSignIn"  onclick="ClickLogin()" id="customBtn" data-width="230"  data-longtitle="true"></div>

        <a href="#" onclick="signOut();">GOOGLE SIGN out</a>
        <script>
            function signOut() {

                var auth2 = gapi.auth2.getAuthInstance();
                auth2.signOut().then(function () {
                    console.log('User signed out.');
                });
            }
        </script>
        </div>

        <p style="text-align:center"> OR  </p>
        <form:input type="text" id="inputUsername" class="form-control" placeholder="Username" required="" autofocus="" path="username"/>
        <form:input type="password" id="inputPassword" class="form-control" placeholder="Password" required="" path="password"/>


        <hr>
        <!-- <p>Don't have an account!</p>  -->
        <button class="btn btn-primary btn-block" type="submit" id="btn-login"><i class="fas fa-user"></i> Login</button>
    </form:form>



    <br>

</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="/script.js"></script>
</body>
</html>



</body>

</html>