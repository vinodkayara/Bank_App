<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Secure Bank Login</title>
<style>
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

body {
	background: linear-gradient(135deg, #1a2a6c, #b21f1f, #fdbb2d);
	min-height: 100vh;
	display: flex;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

.container {
	width: 100%;
	max-width: 450px;
	background-color: rgba(255, 255, 255, 0.95);
	border-radius: 15px;
	box-shadow: 0 15px 30px rgba(0, 0, 0, 0.3);
	overflow: hidden;
}

.header {
	background: linear-gradient(to right, #1a2a6c, #2a3a9c);
	color: white;
	padding: 25px 30px;
	text-align: center;
}

.header h1 {
	font-size: 28px;
	margin-bottom: 5px;
}

.header p {
	opacity: 0.9;
	font-size: 14px;
}

.form-container {
	padding: 30px;
}

.form-group {
	margin-bottom: 20px;
}

label {
	display: block;
	margin-bottom: 8px;
	font-weight: 600;
	color: #333;
}

input {
	width: 100%;
	padding: 12px 15px;
	border: 1px solid #ddd;
	border-radius: 8px;
	font-size: 16px;
	transition: all 0.3s;
}

input:focus {
	outline: none;
	border-color: #2a3a9c;
	box-shadow: 0 0 0 3px rgba(42, 58, 156, 0.2);
}

.password-toggle {
	position: relative;
}

.toggle-icon {
	position: absolute;
	right: 15px;
	top: 50%;
	transform: translateY(-50%);
	cursor: pointer;
	color: #666;
}

.submit-btn {
	background: linear-gradient(to right, #1a2a6c, #2a3a9c);
	color: white;
	border: none;
	padding: 14px;
	font-size: 18px;
	font-weight: 600;
	border-radius: 8px;
	cursor: pointer;
	width: 100%;
	transition: all 0.3s;
	margin-top: 10px;
}

.submit-btn:hover {
	background: linear-gradient(to right, #2a3a9c, #3a4abc);
	transform: translateY(-2px);
	box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
}

.links {
	display: flex;
	justify-content: space-between;
	margin-top: 20px;
	font-size: 15px;
}

.links a {
	color: #2a3a9c;
	text-decoration: none;
	font-weight: 600;
}

.links a:hover {
	text-decoration: underline;
}

.error-message {
	color: #e74c3c;
	font-size: 14px;
	margin-top: 5px;
	display: none;
}

.success-message {
	background-color: #2ecc71;
	color: white;
	padding: 15px;
	border-radius: 8px;
	text-align: center;
	margin-bottom: 20px;
	display: none;
}

.bank-logo {
	text-align: center;
	margin-bottom: 10px;
}

.bank-logo span {
	font-size: 40px;
	color: #2a3a9c;
}

.remember-forgot {
	display: flex;
	justify-content: space-between;
	align-items: center;
	margin-bottom: 20px;
}

.remember-me {
	display: flex;
	align-items: center;
}

.remember-me input {
	width: auto;
	margin-right: 8px;
}

@media ( max-width : 600px) {
	.links, .remember-forgot {
		flex-direction: column;
		gap: 10px;
		align-items: flex-start;
	}
	.container {
		margin: 10px;
	}
}
</style>
</head>
<body>
	<div class="container">
		<div class="header">
			<div class="bank-logo">
				<span>🏦</span>
			</div>
			<h1>Welcome Back</h1>
			<p>Sign in to your bank account</p>
		</div>

		<div class="form-container">
			<div class="success-message" id="successMessage">Login
				successful! Redirecting to dashboard...</div>

			<form id="loginForm">
				<div class="form-group">
					<label for="mail">Email Address</label> <input type="email"
						id="mail" name="mail" placeholder="Enter your email address"
						required>
					<div class="error-message" id="mailError">Please enter a
						valid email address</div>
				</div>

				<div class="form-group password-toggle">
					<label for="pin">PIN</label> <input type="password" id="pin"
						name="pin" placeholder="Enter your 4-digit PIN" maxlength="4"
						required> <span class="toggle-icon" id="togglePin">👁</span>
					<div class="error-message" id="pinError">Please enter your
						4-digit PIN</div>
				</div>

				<div class="remember-forgot">
					<div class="remember-me">
						<input type="checkbox" id="remember" name="remember"> <label
							for="remember">Remember me</label>
					</div>
					<a href="#" class="forgot-pin">Forgot PIN?</a>
				</div>

				<button type="submit" class="submit-btn">Sign In</button>
			</form>

			<div class="links">
				<a href="#" class="security-tips">Security Tips</a> 
				<a href="acctype.jsp" class="register-link">Create Account</a>
			</div>
		</div>
	</div>

	<script>
        document.getElementById('loginForm').addEventListener('submit', function(event) {
            event.preventDefault();
            
            // Reset error messages
            document.querySelectorAll('.error-message').forEach(function(element) {
                element.style.display = 'none';
            });
            
            let isValid = true;
            
            // Validate email
            const mail = document.getElementById('mail').value.trim();
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
            if (!emailRegex.test(mail)) {
                document.getElementById('mailError').style.display = 'block';
                isValid = false;
            }
            
            // Validate PIN
            const pin = document.getElementById('pin').value.trim();
            const pinRegex = /^\d{4}$/;
            if (!pinRegex.test(pin)) {
                document.getElementById('pinError').style.display = 'block';
                isValid = false;
            }
            
            if (isValid) {
                // In a real application, you would send data to your backend here
                console.log('Login data:', {
                    mail: mail,
                    pin: pin,
                    remember: document.getElementById('remember').checked
                });
                
                // Show success message
                document.getElementById('successMessage').style.display = 'block';
                
                // In a real application, you would redirect to dashboard
                // setTimeout(() => {
                //     window.location.href = 'dashboard.html';
                // }, 1500);
                
                // For demo purposes, we'll just reset the form after a delay
                setTimeout(() => {
                    document.getElementById('loginForm').reset();
                    document.getElementById('successMessage').style.display = 'none';
                }, 3000);
            }
        });
        
        // Real-time validation for PIN field
        document.getElementById('pin').addEventListener('input', function() {
            this.value = this.value.replace(/\D/g, '');
        });
        
        // Toggle PIN visibility
        document.getElementById('togglePin').addEventListener('click', function() {
            const pinInput = document.getElementById('pin');
            if (pinInput.type === 'password') {
                pinInput.type = 'text';
                this.textContent = '🔒';
            } else {
                pinInput.type = 'password';
                this.textContent = '👁';
            }
        });
        
        // Demo credentials for testing
        document.getElementById('loginForm').addEventListener('input', function() {
            const mail = document.getElementById('mail').value;
            const pin = document.getElementById('pin').value;
            
            // For demo purposes - show a hint for test credentials
            if (mail === 'demo@bank.com' && pin === '1234') {
                console.log('Using demo credentials - would redirect to dashboard in real app');
            }
        });
    </script>
	
</body>
</html>