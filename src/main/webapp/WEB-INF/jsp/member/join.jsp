<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="sub_img.html"%>
<%@ include file="sub_menu.html" %>
  <article>
    <h2>Join Us</h2>
    <form id="join" action="join.do" method="post" name="formm">
      <fieldset>
        <legend>Basic Information</legend>
        <label>User ID</label>
        <input type="text"      name="u_id"        size="12"  >
        <input type="hidden"    name="reid">
        <input type="button"    value="ID重複チェック"  class="dup" onclick="idcheck()"><br>
        <label>Password</label>
        <input type="password"  name="u_pwd"><br>
        <label>Retype Password</label>
        <input type="password"  name="pwdCheck"><br>
        <label>Name</label>
        <input type="text"      name="u_name"><br>
        <label>E-Mail</label>
        <input type="text"      name="email"><br>

      </fieldset>
      <fieldset>
        <legend>Optional</legend>
        <label>Zip Code</label>
        <input type="text" id= "zip_num" name="zip_num" size="10" >
        <input type="button"     value="アドレス探し" class="dup" onclick="post_zip()"><br>
        <label>Address</label>
        <input type="text" id="addr1"  name="addr1"   size="40">
        <br/>
        <label>Address 2 (物件名)</label>
        <input type="text" id="addr2"  name="addr2"   size="25">
        <input type="hidden" name="address">
        <br>
        <label>Phone Number</label>
        <input  type="text"       name="phone"><br>
      </fieldset>
      <div class="clear"></div>
      <div id="buttons">
        <input type="button"    value="会員加入"   class="submit" onclick="go_save()">
        <input type="reset"      value="Cancel"     class="cancel">
      </div>
    </form>
  </article>


<%@ include file="../footer.jsp" %>
