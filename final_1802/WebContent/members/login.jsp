<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Wrap -->
<div id="wrap"> 
  
  <!-- Content -->
  <div id="content"> 
    
    <!--======= PAGES INNER =========-->
    <section class="chart-page padding-top-100 padding-bottom-100">
      <div class="container"> 
        
        <!-- Payments Steps -->
        <div class="shopping-cart"> 
          
          <!-- SHOPPING INFORMATION -->
          <div class="cart-ship-info">
            <div class="row"> 
              
              <!-- ESTIMATE SHIPPING & TAX -->
              <div class="col-sm-7">
                <h6>LOGIN YOUR ACCOUNT</h6>
                
                
                <form name="frm_mbr_login" method="post">
                  <ul class="row">
                    
                    <!-- Name -->
                    <li class="col-md-12">
                      <label> USERNAME
                        <input type="text" name="first-name" value="" placeholder="">
                      </label>
                    </li>
                    <!-- LAST NAME -->
                    <li class="col-md-12">
                      <label> PASSWORD
                        <input type="password" name="last-name" value="" placeholder="">
                      </label>
                    </li>
                    
                    <!-- LOGIN -->
                    <li class="col-md-4">
                      <button type="button" class="btn" name="btn_login">LOGIN</button>
                    </li>
                    
                    <li class="col-md-4">
                    </li>
                    
                    <!-- FORGET PASS -->
                    <li class="col-md-4">
                      <div class="checkbox margin-0 margin-top-20 text-right">
                        <a href="#.">Forget Password</a>
                      </div>
                    </li>
                  </ul>
                </form>
                
              </div>
              
              <!-- SUB TOTAL -->
              <div class="col-sm-5">
                <h6>LOGIN WITH</h6>
                
                <ul class="login-with">
                	<li>
                    	<a href="#."><i class="fa fa-facebook"></i>FACEBOOK</a>
                    </li>
                    
                    <li>
                    	<a href="#."><i class="fa fa-google"></i>GOOGLE</a>
                    </li>
                    
                    <li>
                    	<a href="#."><i class="fa fa-twitter"></i>TWITTER</a>
                    </li>
                </ul>
                
                
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>
