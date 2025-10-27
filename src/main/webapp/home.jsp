<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SecureTrust Bank - Your Financial Partner</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #f0f8ff;
            color: #2c3e50;
            line-height: 1.6;
        }
        
        /* Header Styles */
        header {
            background: linear-gradient(135deg, #2c5530, #4a7c59);
            color: white;
            padding: 1rem 0;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            position: sticky;
            top: 0;
            z-index: 100;
        }
        
        .container {
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .header-content {
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .logo {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .logo-icon {
            font-size: 2.5rem;
        }
        
        .logo-text {
            font-size: 1.8rem;
            font-weight: 700;
        }
        
        nav ul {
            display: flex;
            list-style: none;
        }
        
        nav ul li {
            margin-left: 1.5rem;
        }
        
        nav ul li a {
            color: white;
            text-decoration: none;
            font-weight: 600;
            padding: 0.5rem 1rem;
            border-radius: 20px;
            transition: all 0.3s;
        }
        
        nav ul li a:hover {
            background-color: rgba(255, 255, 255, 0.25);
            transform: translateY(-2px);
        }
        
        .auth-buttons {
            display: flex;
            gap: 15px;
        }
        
        .btn {
            padding: 0.6rem 1.5rem;
            border-radius: 25px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
            display: inline-block;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        
        .btn-outline {
            border: 2px solid white;
            color: white;
            background: transparent;
        }
        
        .btn-outline:hover {
            background: white;
            color: #2c5530;
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }
        
        .btn-primary {
            background: #f8c630;
            color: #2c5530;
            border: 2px solid #f8c630;
        }
        
        .btn-primary:hover {
            background: #e6b325;
            border-color: #e6b325;
            transform: translateY(-2px);
            box-shadow: 0 6px 8px rgba(0, 0, 0, 0.15);
        }
        
        /* Hero Section */
        .hero {
            background: linear-gradient(rgba(44, 85, 48, 0.85), rgba(74, 124, 89, 0.9)), url('https://images.unsplash.com/photo-1601597111158-2fceff292cdc?ixlib=rb-4.0.3&auto=format&fit=crop&w=1350&q=80');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 6rem 0;
            text-align: center;
        }
        
        .hero-content {
            max-width: 800px;
            margin: 0 auto;
        }
        
        .hero h1 {
            font-size: 3.2rem;
            margin-bottom: 1.5rem;
            text-shadow: 1px 1px 3px rgba(0, 0, 0, 0.3);
        }
        
        .hero p {
            font-size: 1.3rem;
            margin-bottom: 2rem;
            opacity: 0.95;
        }
        
        .hero-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 2.5rem;
        }
        
        /* Features Section */
        .features {
            padding: 6rem 0;
            background-color: white;
        }
        
        .section-title {
            text-align: center;
            margin-bottom: 4rem;
        }
        
        .section-title h2 {
            font-size: 2.8rem;
            color: #2c5530;
            margin-bottom: 1.2rem;
            position: relative;
            display: inline-block;
        }
        
        .section-title h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 50%;
            transform: translateX(-50%);
            width: 80px;
            height: 4px;
            background: #f8c630;
            border-radius: 2px;
        }
        
        .section-title p {
            color: #5d6d7e;
            max-width: 700px;
            margin: 0 auto;
            font-size: 1.1rem;
        }
        
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2.5rem;
        }
        
        .feature-card {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 2.5rem 2rem;
            text-align: center;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.06);
            transition: all 0.4s;
            border-top: 4px solid #4a7c59;
        }
        
        .feature-card:hover {
            transform: translateY(-12px);
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
        }
        
        .feature-icon {
            font-size: 3.5rem;
            margin-bottom: 1.8rem;
            color: #4a7c59;
        }
        
        .feature-card h3 {
            font-size: 1.6rem;
            margin-bottom: 1.2rem;
            color: #2c5530;
        }
        
        .feature-card p {
            color: #5d6d7e;
            line-height: 1.7;
        }
        
        /* About Section */
        .about {
            padding: 6rem 0;
            background: linear-gradient(to bottom, #f0f8ff, #e6f2ff);
        }
        
        .about-content {
            display: flex;
            align-items: center;
            gap: 4rem;
        }
        
        .about-text {
            flex: 1;
        }
        
        .about-text h2 {
            font-size: 2.8rem;
            color: #2c5530;
            margin-bottom: 1.8rem;
            position: relative;
        }
        
        .about-text h2::after {
            content: '';
            position: absolute;
            bottom: -10px;
            left: 0;
            width: 80px;
            height: 4px;
            background: #f8c630;
            border-radius: 2px;
        }
        
        .about-text p {
            margin-bottom: 1.8rem;
            color: #5d6d7e;
            font-size: 1.1rem;
            line-height: 1.7;
        }
        
        .about-image {
            flex: 1;
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            transition: transform 0.4s;
        }
        
        .about-image:hover {
            transform: scale(1.02);
        }
        
        .about-image img {
            width: 100%;
            height: auto;
            display: block;
        }
        
        /* Contact Section */
        .contact {
            padding: 6rem 0;
            background-color: white;
        }
        
        .contact-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 4rem;
        }
        
        .contact-info {
            display: flex;
            flex-direction: column;
            gap: 2rem;
        }
        
        .contact-item {
            display: flex;
            align-items: flex-start;
            gap: 1.5rem;
            padding: 1.5rem;
            background: #f8f9fa;
            border-radius: 10px;
            transition: all 0.3s;
        }
        
        .contact-item:hover {
            background: #eef2f7;
            transform: translateX(5px);
        }
        
        .contact-icon {
            font-size: 1.8rem;
            color: #4a7c59;
            margin-top: 5px;
        }
        
        .contact-details h3 {
            margin-bottom: 0.8rem;
            color: #2c5530;
        }
        
        .contact-form {
            background: linear-gradient(135deg, #f8f9fa, #eef2f7);
            padding: 2.5rem;
            border-radius: 12px;
            box-shadow: 0 10px 25px rgba(0, 0, 0, 0.06);
        }
        
        .contact-form h3 {
            font-size: 1.8rem;
            margin-bottom: 1.8rem;
            color: #2c5530;
            text-align: center;
        }
        
        .form-group {
            margin-bottom: 1.8rem;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.8rem;
            font-weight: 600;
            color: #2c5530;
        }
        
        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 1rem 1.2rem;
            border: 1px solid #d1d8e0;
            border-radius: 8px;
            font-size: 1rem;
            transition: all 0.3s;
        }
        
        .form-group input:focus,
        .form-group textarea:focus {
            outline: none;
            border-color: #4a7c59;
            box-shadow: 0 0 0 3px rgba(74, 124, 89, 0.2);
        }
        
        .form-group textarea {
            height: 150px;
            resize: vertical;
        }
        
        /* Footer */
        footer {
            background: linear-gradient(135deg, #2c5530, #1e3a24);
            color: white;
            padding: 4rem 0 1.5rem;
        }
        
        .footer-content {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            gap: 3rem;
            margin-bottom: 3rem;
        }
        
        .footer-column h3 {
            font-size: 1.4rem;
            margin-bottom: 1.8rem;
            position: relative;
            padding-bottom: 0.8rem;
        }
        
        .footer-column h3::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            width: 50px;
            height: 3px;
            background: #f8c630;
            border-radius: 2px;
        }
        
        .footer-links {
            list-style: none;
        }
        
        .footer-links li {
            margin-bottom: 1rem;
        }
        
        .footer-links a {
            color: #bdc3c7;
            text-decoration: none;
            transition: all 0.3s;
            display: inline-block;
        }
        
        .footer-links a:hover {
            color: #f8c630;
            transform: translateX(5px);
        }
        
        .social-links {
            display: flex;
            gap: 1.2rem;
            margin-top: 1.5rem;
        }
        
        .social-links a {
            display: inline-flex;
            align-items: center;
            justify-content: center;
            width: 42px;
            height: 42px;
            background: rgba(255, 255, 255, 0.1);
            border-radius: 50%;
            color: white;
            text-decoration: none;
            transition: all 0.3s;
            font-weight: bold;
        }
        
        .social-links a:hover {
            background: #f8c630;
            color: #2c5530;
            transform: translateY(-5px);
        }
        
        .footer-bottom {
            text-align: center;
            padding-top: 2.5rem;
            border-top: 1px solid rgba(255, 255, 255, 0.1);
            color: #bdc3c7;
            font-size: 0.95rem;
        }
        
        /* Responsive Styles */
        @media (max-width: 768px) {
            .header-content {
                flex-direction: column;
                gap: 1.2rem;
            }
            
            nav ul {
                flex-wrap: wrap;
                justify-content: center;
            }
            
            .hero h1 {
                font-size: 2.5rem;
            }
            
            .hero-buttons {
                flex-direction: column;
                align-items: center;
            }
            
            .about-content {
                flex-direction: column;
            }
            
            .auth-buttons {
                justify-content: center;
            }
            
            .section-title h2 {
                font-size: 2.3rem;
            }
        }
        
        @media (max-width: 480px) {
            .logo-text {
                font-size: 1.5rem;
            }
            
            .hero h1 {
                font-size: 2rem;
            }
            
            .section-title h2 {
                font-size: 1.9rem;
            }
            
            .feature-card {
                padding: 2rem 1.5rem;
            }
        }
    </style>
</head>
<body>
    <!-- Header -->
    <header>
        <div class="container">
            <div class="header-content">
                <div class="logo">
                    <span class="logo-icon">🏦</span>
                    <span class="logo-text">SecureTrust Bank</span>
                </div>
                
                <nav>
                    <ul>
                        <li><a href="#home">Home</a></li>
                        <li><a href="#about">About</a></li>
                        <li><a href="#services">Services</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </nav>
                
                <div class="auth-buttons">
                    <a href="login.jsp" class="btn btn-outline">Login</a>
                    <a href="acctype.jsp" class="btn btn-primary">Register</a>
                </div>
            </div>
        </div>
    </header>

    <!-- Hero Section -->
    <section class="hero" id="home">
        <div class="container">
            <div class="hero-content">
                <h1>Your Trusted Financial Partner</h1>
                <p>SecureTrust Bank offers innovative banking solutions with top-tier security. Join thousands of satisfied customers who trust us with their financial future.</p>
                <div class="hero-buttons">
                    <a href="acctype.jsp" class="btn btn-primary">Open an Account</a>
                    <a href="#services" class="btn btn-outline">Our Services</a>
                </div>
            </div>
        </div>
    </section>

    <!-- Features Section -->
    <section class="features" id="services">
        <div class="container">
            <div class="section-title">
                <h2>Our Banking Services</h2>
                <p>We offer a comprehensive range of financial services to meet all your banking needs</p>
            </div>
            
            <div class="features-grid">
                <div class="feature-card">
                    <div class="feature-icon">💳</div>
                    <h3>Personal Banking</h3>
                    <p>Manage your finances with our easy-to-use personal banking solutions, including savings accounts, loans, and credit cards.</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">🏢</div>
                    <h3>Business Banking</h3>
                    <p>Grow your business with our tailored financial products, merchant services, and corporate accounts.</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">📱</div>
                    <h3>Digital Banking</h3>
                    <p>Access your accounts anytime, anywhere with our secure mobile and online banking platforms.</p>
                </div>
                
                <div class="feature-card">
                    <div class="feature-icon">🛡</div>
                    <h3>Secure Transactions</h3>
                    <p>Your security is our priority. We use advanced encryption and fraud detection to protect your money.</p>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section class="about" id="about">
        <div class="container">
            <div class="about-content">
                <div class="about-text">
                    <h2>About SecureTrust Bank</h2>
                    <p>Founded in 1985, SecureTrust Bank has been serving customers with integrity and innovation for over three decades. We've grown from a small community bank to a trusted financial institution serving customers nationwide.</p>
                    <p>Our mission is to provide secure, accessible, and innovative banking solutions that empower our customers to achieve their financial goals. We believe in building lasting relationships based on trust and transparency.</p>
                    <p>With over 200 branches and a comprehensive digital banking platform, we make banking convenient while maintaining the personal touch that our customers value.</p>
                </div>
                <div class="about-image">
                    <img src="https://images.unsplash.com/photo-1554224155-6726b3ff858f?ixlib=rb-4.0.3&auto=format&fit=crop&w=1000&q=80" alt="SecureTrust Bank Building">
                </div>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <section class="contact" id="contact">
        <div class="container">
            <div class="section-title">
                <h2>Contact Us</h2>
                <p>Get in touch with our customer service team for any inquiries or assistance</p>
            </div>
            
            <div class="contact-content">
                <div class="contact-info">
                    <div class="contact-item">
                        <div class="contact-icon">📍</div>
                        <div class="contact-details">
                            <h3>Head Office</h3>
                            <p>123 Financial District,<br>Metropolis, MP 12345</p>
                        </div>
                    </div>
                    
                    <div class="contact-item">
                        <div class="contact-icon">📞</div>
                        <div class="contact-details">
                            <h3>Phone</h3>
                            <p>1-800-SECURE-BANK<br>(1-800-732-8732)</p>
                        </div>
                    </div>
                    
                    <div class="contact-item">
                        <div class="contact-icon">✉</div>
                        <div class="contact-details">
                            <h3>Email</h3>
                            <p>info@securetrustbank.com<br>support@securetrustbank.com</p>
                        </div>
                    </div>
                    
                    <div class="contact-item">
                        <div class="contact-icon">🕒</div>
                        <div class="contact-details">
                            <h3>Business Hours</h3>
                            <p>Monday - Friday: 9:00 AM - 6:00 PM<br>Saturday: 10:00 AM - 2:00 PM</p>
                        </div>
                    </div>
                </div>
                
                <div class="contact-form">
                    <h3>Send us a Message</h3>
                    <form>
                        <div class="form-group">
                            <label for="name">Your Name</label>
                            <input type="text" id="name" placeholder="Enter your name">
                        </div>
                        
                        <div class="form-group">
                            <label for="email">Your Email</label>
                            <input type="email" id="email" placeholder="Enter your email">
                        </div>
                        
                        <div class="form-group">
                            <label for="subject">Subject</label>
                            <input type="text" id="subject" placeholder="Enter subject">
                        </div>
                        
                        <div class="form-group">
                            <label for="message">Message</label>
                            <textarea id="message" placeholder="Enter your message"></textarea>
                        </div>
                        
                        <button type="submit" class="btn btn-primary" style="width: 100%;">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer>
        <div class="container">
            <div class="footer-content">
                <div class="footer-column">
                    <h3>SecureTrust Bank</h3>
                    <p>Your trusted financial partner for secure and innovative banking solutions.</p>
                    <div class="social-links">
                        <a href="#" title="Facebook">f</a>
                        <a href="#" title="Twitter">t</a>
                        <a href="#" title="Instagram">ig</a>
                        <a href="#" title="LinkedIn">in</a>
                    </div>
                </div>
                
                <div class="footer-column">
                    <h3>Quick Links</h3>
                    <ul class="footer-links">
                        <li><a href="#home">Home</a></li>
                        <li><a href="#about">About Us</a></li>
                        <li><a href="#services">Services</a></li>
                        <li><a href="#contact">Contact</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h3>Services</h3>
                    <ul class="footer-links">
                        <li><a href="#">Personal Banking</a></li>
                        <li><a href="#">Business Banking</a></li>
                        <li><a href="#">Loans & Mortgages</a></li>
                        <li><a href="#">Investment Services</a></li>
                    </ul>
                </div>
                
                <div class="footer-column">
                    <h3>Support</h3>
                    <ul class="footer-links">
                        <li><a href="#">Help Center</a></li>
                        <li><a href="#">Security Tips</a></li>
                        <li><a href="#">Privacy Policy</a></li>
                        <li><a href="#">Terms of Service</a></li>
                    </ul>
                </div>
            </div>
            
            <div class="footer-bottom">
                <p>&copy; 2023 SecureTrust Bank. All rights reserved. | FDIC Insured</p>
            </div>
        </div>
    </footer>

    
</body>
</html>