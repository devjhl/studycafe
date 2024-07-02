<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Login Page</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .login-container {
            max-width: 400px;
            margin: 0 auto;
            padding-top: 50px;
        }
        .login-form {
            padding: 20px;
            background: #f7f7f7;
            border-radius: 10px;
            box-shadow: 0px 0px 10px 0px #0000001f;
        }
        .login-form h3 {
            text-align: center;
            margin-bottom: 20px;
        }
        .login-form .form-group {
            margin-bottom: 15px;
        }
        .login-form .btn {
            width: 100%;
        }
        .login-form .signup-link {
            text-align: center;
            display: block;
            margin-top: 10px;
        }
    </style>
</head>
<body>
<div class="login-container">
    <div class="login-form">
        <h3>LOGIN</h3>
        <form action="<c:url value='/login' />" method="post">
            <div class="form-group">
                <label for="username">ID</label>
                <input type="text" class="form-control" id="username" name="username" placeholder="Enter ID" required>
            </div>
            <div class="form-group">
                <label for="password">PASSWORD</label>
                <input type="password" class="form-control" id="password" name="password" placeholder="Enter Password" required>
            </div>
            <button type="submit" class="btn btn-primary">LOGIN</button>
            <a href="/user/signup" class="signup-link">SIGNUP</a>
        </form>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
