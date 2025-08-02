<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="db.jsp" %>
<%
    // Handle signup form submission
    if ("POST".equals(request.getMethod())) {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
        } else {
            try {
                // Check if username exists
                PreparedStatement checkStmt = conn.prepareStatement("SELECT * FROM users WHERE username = ?");
                checkStmt.setString(1, username);
                ResultSet rs = checkStmt.executeQuery();

                if (rs.next()) {
                    request.setAttribute("error", "Username already exists");
                } else {
                    // Create new user
                    PreparedStatement stmt = conn.prepareStatement(
                        "INSERT INTO users (first_name, last_name, email, username, password) VALUES (?, ?, ?, ?, ?)");
                    stmt.setString(1, firstName);
                    stmt.setString(2, lastName);
                    stmt.setString(3, email);
                    stmt.setString(4, username);
                    stmt.setString(5, password);

                    int rows = stmt.executeUpdate();
                    if (rows > 0) {
                        request.setAttribute("success", "Registration successful! Please login.");
                    }
                }
            } catch (SQLException e) {
                request.setAttribute("error", "Database error: " + e.getMessage());
            }
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Sign Up</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
        }
        .signup-card {
            max-width: 500px;
            margin: 0 auto;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1);
            background: white;
        }
        .logo {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #1c2833;
            font-weight: 600;
        }
        .btn-signup {
            width: 100%;
            padding: 10px;
            background-color: #1c2833;
            border: none;
        }
        .btn-signup:hover {
            background-color: #141e27;
        }
        .login-link {
            text-align: center;
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="signup-card">
            <div class="logo">
                <h3>Sign-up</h3>
                <p>Your next Job, Just a Click Away</p>
            </div>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <% if (request.getAttribute("success") != null) { %>
                <div class="alert alert-success">
                    <%= request.getAttribute("success") %>
                </div>
            <% } %>

            <form method="POST">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <input type="text" class="form-control" name="firstName" placeholder="First Name" required>
                    </div>
                    <div class="col-md-6 mb-3">
                        <input type="text" class="form-control" name="lastName" placeholder="Last Name" required>
                    </div>
                </div>

                <div class="mb-3">
                    <input type="email" class="form-control" name="email" placeholder="Email" required>
                </div>

                <div class="mb-3">
                    <input type="text" class="form-control" name="username" placeholder="Username" required>
                </div>

                <div class="mb-3">
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                </div>

                <div class="mb-3">
                    <input type="password" class="form-control" name="confirmPassword" placeholder="Confirm Password" required>
                </div>

                <button type="submit" class="btn btn-primary btn-signup">Sign Up</button>
            </form>

            <div class="login-link">
                <p>Already have an account? <a href="login.jsp">Login</a></p>
            </div>
        </div>
    </div>
</body>
</html>
