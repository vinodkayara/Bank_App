<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Secure Bank Registration</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }
        
        .container {
            width: 100%;
            max-width: 500px;
            background: rgba(30, 41, 59, 0.8);
            border-radius: 20px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.3);
            overflow: hidden;
            border: 1px solid #334155;
        }
        
        .header {
            background: linear-gradient(135deg, #6366f1, #8b5cf6);
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .header h1 {
            font-size: 28px;
            margin-bottom: 5px;
            font-weight: 600;
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
            color: #e2e8f0;
        }
        
        input {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #475569;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s;
            background: rgba(15, 23, 42, 0.8);
            color: #e2e8f0;
        }
        
        input:focus {
            outline: none;
            border-color: #6366f1;
            box-shadow: 0 0 0 3px rgba(99, 102, 241, 0.2);
        }
        
        .name-group {
            display: flex;
            gap: 15px;
        }
        
        .pin-group {
            display: flex;
            gap: 15px;
        }
        
        .name-group .form-group,
        .pin-group .form-group {
            flex: 1;
        }
        
        .submit-btn {
            background: linear-gradient(135deg, #6366f1, #8b5cf6);
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
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }
        
        .submit-btn:hover {
            background: linear-gradient(135deg, #8b5cf6, #6366f1);
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(139, 92, 246, 0.4);
        }
        
        .login-link {
            text-align: center;
            margin-top: 20px;
            font-size: 15px;
        }
        
        .login-link a {
            color: #6366f1;
            text-decoration: none;
            font-weight: 600;
        }
        
        .login-link a:hover {
            text-decoration: underline;
        }
        
        .error-message {
            color: #f87171;
            font-size: 14px;
            margin-top: 5px;
            display: none;
        }
        
        .success-message {
            background: rgba(34, 197, 94, 0.1);
            color: #4ade80;
            padding: 15px;
            border-radius: 8px;
            text-align: center;
            margin-bottom: 20px;
            display: none;
            border: 1px solid rgba(34, 197, 94, 0.3);
        }
        
        .bank-logo {
            text-align: center;
            margin-bottom: 10px;
        }
        
        .bank-logo span {
            font-size: 40px;
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
            color: #94a3b8;
            transition: color 0.3s;
        }
        
        .toggle-icon:hover {
            color: #6366f1;
        }
        
        @media (max-width: 600px) {
            .name-group,
            .pin-group {
                flex-direction: column;
                gap: 0;
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
            <h1>Create Your Account</h1>
            <p>Join our secure banking platform today</p>
        </div>
        
        <div class="form-container">
            <div class="success-message" id="successMessage">
                Registration successful! Redirecting to login...
            </div>
            
            <form id="registrationForm" action="register" method="post">
                <div class="name-group">
                    <div class="form-group">
                        <label for="fname">First Name</label>
                        <input type="text" id="fname" name="fname" placeholder="Enter your first name" required>
                        <div class="error-message" id="fnameError">Please enter a valid first name</div>
                    </div>
                    
                    <div class="form-group">
                        <label for="lname">Last Name</label>
                        <input type="text" id="lname" name="lname" placeholder="Enter your last name" required>
                        <div class="error-message" id="lnameError">Please enter a valid last name</div>
                    </div>
                </div>
                
                <div class="form-group">
                    <label for="phone">Phone Number</label>
                    <input type="tel" id="phone" name="phone" placeholder="Enter your 10-digit phone number" required>
                    <div class="error-message" id="phoneError">Please enter a valid 10-digit phone number</div>
                </div>
                
                <div class="form-group">
                    <label for="mail">Email Address</label>
                    <input type="email" id="mail" name="mail" placeholder="Enter your email address" required>
                    <div class="error-message" id="mailError">Please enter a valid email address</div>
                </div>
                
                <div class="pin-group">
                    <div class="form-group password-toggle">
                        <label for="pin">PIN (4-digit)</label>
                        <input type="password" id="pin" name="pin" placeholder="Enter a 4-digit PIN" maxlength="4" required>
                        <span class="toggle-icon" id="togglePin">👁</span>
                        <div class="error-message" id="pinError">PIN must be exactly 4 digits</div>
                    </div>
                    
                    <div class="form-group password-toggle">
                        <label for="confirmPin">Confirm PIN</label>
                        <input type="password" id="confirmPin" name="confirmPin" placeholder="Confirm your PIN" maxlength="4" required>
                        <span class="toggle-icon" id="toggleConfirmPin">👁</span>
                        <div class="error-message" id="confirmPinError">PINs do not match</div>
                    </div>
                </div>
                
                <button type="submit" class="submit-btn">Create Account</button>
            </form>
            
            <div class="login-link">
                Already have an account? <a href="login.jsp">Sign In</a>
            </div>
        </div>
    </div>
<script>
        document.getElementById('registrationForm').addEventListener('submit', function(event) {
            event.preventDefault();
            
            // Reset error messages
            document.querySelectorAll('.error-message').forEach(function(element) {
                element.style.display = 'none';
            });
            
            let isValid = true;
            
            // Validate first name
            const fname = document.getElementById('fname').value.trim();
            if (fname === '' || fname.length < 2) {
                document.getElementById('fnameError').style.display = 'block';
                isValid = false;
            }
            
            // Validate last name
            const lname = document.getElementById('lname').value.trim();
            if (lname === '' || lname.length < 2) {
                document.getElementById('lnameError').style.display = 'block';
                isValid = false;
            }
            
            // Validate phone number
            const phone = document.getElementById('phone').value.trim();
            const phoneRegex = /^\d{10}$/;
            if (!phoneRegex.test(phone)) {
                document.getElementById('phoneError').style.display = 'block';
                isValid = false;
            }
            
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
            
            // Validate Confirm PIN
            const confirmPin = document.getElementById('confirmPin').value.trim();
            if (pin !== confirmPin) {
                document.getElementById('confirmPinError').style.display = 'block';
                isValid = false;
            }
            
            if (isValid) {
                // Show success message
                document.getElementById('successMessage').style.display = 'block';
                
                // Submit the form to the servlet
                this.submit();
            }
        });
        
        // Real-time validation for PIN fields
        document.getElementById('pin').addEventListener('input', function() {
            this.value = this.value.replace(/\D/g, '');
            validatePinMatch();
        });
        
        document.getElementById('confirmPin').addEventListener('input', function() {
            this.value = this.value.replace(/\D/g, '');
            validatePinMatch();
        });
        
        // Real-time validation for phone field
        document.getElementById('phone').addEventListener('input', function() {
            this.value = this.value.replace(/\D/g, '');
        });
        
        // PIN match validation function
        function validatePinMatch() {
            const pin = document.getElementById('pin').value;
            const confirmPin = document.getElementById('confirmPin').value;
            const errorElement = document.getElementById('confirmPinError');
            
            if (confirmPin && pin !== confirmPin) {
                errorElement.style.display = 'block';
            } else {
                errorElement.style.display = 'none';
            }
        }
        
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
        
        // Toggle Confirm PIN visibility
        document.getElementById('toggleConfirmPin').addEventListener('click', function() {
            const confirmPinInput = document.getElementById('confirmPin');
            if (confirmPinInput.type === 'password') {
                confirmPinInput.type = 'text';
                this.textContent = '🔒';
            } else {
                confirmPinInput.type = 'password';
                this.textContent = '👁';
            }
        });
    </script>
    
</body>
</html>