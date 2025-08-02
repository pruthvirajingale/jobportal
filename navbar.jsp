<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- Lucide CDN -->
<script src="https://unpkg.com/lucide@latest"></script>

<style>

</style>

<div class="navbar">
  <div class="navbar-container">
    <a href="home.jsp" class="navbar-logo">Quick Jobs</a>
    <button class="menu-toggle" onclick="toggleMenu()">
      <i data-lucide="menu"></i>
    </button>
    <div class="navbar-right" id="navbarMenu">
      <a href="jobs.jsp" class="nav-item"><i data-lucide="briefcase"></i> Find Jobs</a>
      <a href="savedjobs.jsp" class="nav-item"><i data-lucide="bookmark"></i> Saved Jobs</a>
      <a href="companies.jsp" class="nav-item"><i data-lucide="building-2"></i> Companies</a>

      <div class="services-tab nav-item">
        <i data-lucide="settings"></i> Services &#9662;
        <div class="services-dropdown">
          <a href="courses.jsp"><i data-lucide="book-open-text"></i> Courses</a>
          <a href="resume.jsp"><i data-lucide="file-text"></i> Resume Writing</a>
          <a href="interview.jsp"><i data-lucide="user-check"></i> Mock Interviews</a>
        </div>
      </div>

      <a href="profile.jsp" class="nav-item"><i data-lucide="user"></i> Profile</a>
      <a href="logout.jsp" class="nav-item logout-link"><i data-lucide="log-out"></i> Logout</a>
    </div>
  </div>
</div>

<script>
  function toggleMenu() {
    document.getElementById('navbarMenu').classList.toggle('show');
  }
  lucide.createIcons(); // Activate Lucide icons
</script>
