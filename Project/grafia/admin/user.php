
<!DOCTYPE html>
<html>  
<head>  
    <title>GRAFIA</title>  
    <!--insert style.css file inside index.html !-->

</head>  
<?php include 'includes/header.php'; ?>

<body class="hold-transition login-page">
<div class="login-box">
  	<div class="login-logo">
  		<b>Employee Login</b>
  	</div>
      <div class="login-box-body">
    	<p class="login-box-msg">Sign in to start your work</p>
   
        <form action = "authentication.php" onsubmit = "return validation()" method = "POST"> 
            <div class="form-group has-feedback">
                    <input type="text" class="form-control" name="user" placeholder="input Username" required autofocus>
                    <span class="glyphicon glyphicon-user form-control-feedback"></span>
                </div>
            <div class="form-group has-feedback">
                <input type="password" class="form-control" name="pass" placeholder="input Password" required>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
        	<div class="row">
    			<div class="col-xs-4">
          			<button type="submit" class="btn btn-primary btn-block btn-flat" name="login"><i class="fa fa-sign-in"></i> Sign In</button>
        		</div>
      		</div>
     
        </form>  
    </div> 
</div> 
    <!-- validation for empty field   !-->
    <script>  
            function validation()  
            {  
                var id=document.f1.user.value;  
                var ps=document.f1.pass.value;  
                if(id.length=="" && ps.length=="") {  
                    alert("User Name and Password fields are empty");  
                    return false;  
                }  
                else  
                {  
                    if(id.length=="") {  
                        alert("User Name is empty");  
                        return false;  
                    }   
                    if (ps.length=="") {  
                    alert("Password field is empty");  
                    return false;  
                    }  
                }                             
            }  
        </script>  
</body>     
</html>  
