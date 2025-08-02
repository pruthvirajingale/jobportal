<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="db.jsp" %>
<%
    // Handle login form submission
    if ("POST".equals(request.getMethod())) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            PreparedStatement stmt = conn.prepareStatement("SELECT * FROM users WHERE username = ? AND password = ?");
            stmt.setString(1, username);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Successful login
                session.setAttribute("user_id", rs.getInt("id"));
                session.setAttribute("username", username);
                response.sendRedirect("index.jsp");
            } else {
                request.setAttribute("error", "Invalid username or password");
            }
        } catch (SQLException e) {
            request.setAttribute("error", "Database error: " + e.getMessage());
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Login - Worker Payroll System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
            height: 100vh;
            display: flex;
            align-items: center;
        }
        .login-card {
            max-width: 400px;
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
        .btn-login {
            width: 100%;
            padding: 10px;
            background-color: #1c2833;
            border: none;
        }
        .btn-login:hover {
            background-color: #141e27;
        }
        .register-link {
            text-align: center;
            margin-top: 1rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="login-card">
            <div class="logo">
                <h3>Login</h3>
                <p>Your Next Job, Just a Click Away</p>
            </div>

            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <form method="POST">
                <div class="mb-3">
                    <input type="text" class="form-control" name="username" placeholder="Username" required>
                </div>
                <div class="mb-3">
                    <input type="password" class="form-control" name="password" placeholder="Password" required>
                </div>
                <button type="submit" class="btn btn-primary btn-login">Login</button>
            </form>

            <div class="register-link">
                <p>Don't have an account? <a href="signup.jsp">Sign up</a></p>
            </div>
        </div>
    </div>
</body>
</html>
