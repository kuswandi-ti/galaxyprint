<div class="page" data-animsition-in="fade-in" data-animsition-out="fade-out">
    <div class="page-content">
      <div class="page-brand-info">
        <div class="brand">
          <img class="brand-img" src="images/header/logo.png" alt="...">
          <!-- <h2 class="brand-text font-size-40">PT GRAHA UTAMA TIMBER  ADMIN PAGE</h2> -->
        </div>
        <p class="font-size-20"></p>
      </div>

      <div class="page-login-main">
        <div class="brand hidden-md-up">
          <img class="brand-img" src="../assets/images/logo-colored%402x.png" alt="...">
          <h3 class="brand-text font-size-40">GUT</h3>
        </div>
        <h3 class="font-size-24">Sign In</h3>

        <form method="post" action="<?=base_url('Auth/do_login')?>" autocomplete="off">
          <div class="form-group form-material floating" data-plugin="formMaterial">
            <input type="text" class="form-control empty" id="inputUsername" name="username">
            <label class="floating-label" for="inputUsername">Username</label>
          </div>
          <div class="form-group form-material floating" data-plugin="formMaterial">
            <input type="password" class="form-control empty" id="inputPassword" name="password">
            <label class="floating-label" for="inputPassword">Password</label>
          </div>
          
          <button type="submit" class="btn btn-primary btn-block">Sign in</button>
        </form>

        <footer class="page-copyright">
          <p>© PT. GRAHA UTAMA TIMBER 2018. All RIGHT RESERVED.</p>
        </footer>
      </div>

    </div>
  </div>
</div>
  <!-- End Page