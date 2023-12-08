<%@ page pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../Css/style.css">
    <title>Document</title>
</head>

<body>
    <div class=" container postition-relative">
        <div class="wrapper position-absolute top-50 start-0 translate-middle-y w-100">
            <div class="row">
                <div class="col col-sm-3"></div>
                <div class="col col-sm-6 bg-light rounded-4 py-30" style="padding: 30px 150px;">
                    <h1 class="text-center mb-5 mt-1">Login Form</h1>
                    <form name="signin" method = 'post' action='SigninServlet'>
                        <div class="FormGroup mb-3">
                            <label for="Username" class="form-label" style="font-weight:bold">Username</label>
                            <input type="text" class="form-control" id="Username" name="username" value="" 
                            aria-describedby="usernameHelp">
                            <div id="usernameHelp" class="form-text">
                            </div>
                        </div>
                        <div class="FormGroup mb-3">
                            <label for="password" class="form-label" style="font-weight:bold">Password</label>
                            <input type="password" class="form-control" id="password" name="password" value="" 
                            aria-describedby="passwordHelp">
                            <div id="passwordHelp" class="form-text">
                            </div>
                        </div>
                        <div class="FormGroup w-100 mt-4">
                        	<button type="submit" name="ok" value='SIGN IN' class="btn btn-primary w-100">Login</button>
                        </div>
                        <div class="FormGroup w-100 bg-light">
                            <p class="mt-4 w-100 d-flex justify-content-between align-items-center">
                                <span>Don't
                                    have account? <a href="SignupServlet?signup=1" >SignUp</a></span>
                                <span>Forgot
                                    password? <a href="">ForgotPassword</a></span>
                            </p>
                        </div>
                    </form>
                </div>
                <div class="col col-sm-3"></div>
            </div>

        </div>
    </div>
</body>

</html>
    