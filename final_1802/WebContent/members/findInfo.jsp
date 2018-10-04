<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<body>

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
              <div class="col-sm-12">
                <h6>FIND YOUR INFOMATION</h6>
                
                
                <form name="frm_mbr_findInfo" method="post">
                  <ul class="row">
                    
                    <!-- Name -->
                    <li class="col-md-6">
                      <label> NAME
                        <input type="text" name="mbr_name" value="" autocomplete="off" placeholder="">
                      </label>
                    </li>
                    
                    <!-- Phone -->
                    <li class="col-md-6">
                      <label> PHONE
                        <input type="text" name="mbr_phone" value="" autocomplete="off" placeholder="">
                      </label>
                    </li>
                    
                    <!-- Find -->
                    <li class="col-md-2">
                      <button type="button" class="btn" name="btn_findInfo">FIND</button>
                    </li>
                    
                    <!-- Back -->
                    <li class="col-md-2">
                      <button type="button" class="btn" name="btn_back">BACK</button>
                    </li>
                    
                  </ul>
                </form>
                
              </div>
              
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</div>

</body>
</html>