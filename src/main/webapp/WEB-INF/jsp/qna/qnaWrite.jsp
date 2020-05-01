<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="sub_img.html"%>
<%@ include file="sub_menu.jsp" %>
	<article>
	    <h2> 1:1顧客掲示板 </h2>
	    <h3>  お客様のご質問対してお答えいたします。</h3>
		<form name="formm" method="post" action="qna_write">
			<fieldset>
				<legend>Board Info</legend>
			    <label>Title</label>
			    <input type="text" name="q_subject"  size="77" ><br>
				<label>Content</label>
			    <textarea rows="8" cols="65" name="q_content"></textarea><br>
			</fieldset>
		<div class="clear"></div>
		 <div id="buttons" style="float:right">
			<input type="submit"  value="書き込み完了"     class="submit">
			<input type="reset"   value="取り消し" class="cancel" onclick="location.href='qna_list'">
			<input type="button"  value="ショッピング続き"  class="submit"  onclick="location.href='index'">
		  </div>
		</form>
	</article>
<%@ include file="../footer.jsp" %>