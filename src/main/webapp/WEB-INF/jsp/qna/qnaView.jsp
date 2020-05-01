<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<%@ include file="sub_img.html"%>
<%@ include file="sub_menu.jsp" %>
  <article>
      <h2> 1:1顧客掲示板 </h2>
      <h3> お客様のご質問対してお答えいたします。.</h3>
    <form name="formm" method="post">
    <table id="notice">
      <tr>
             <th>題目</th>
             <td>${qnaVO.q_subject}</td>
      </tr>
      <tr>
        <th>登録日</th>
        <td> <fmt:formatDate value="${qnaVO.indate}" type="date"/></td>
      </tr>
      <tr>
        <th>質問内容</th>
        <td>${qnaVO.q_content}
      </tr>
      <tr>
        <th>答弁内容</th>
        <td>${qnaVO.q_reply}
      </tr>
    </table>
    <div class="clear"></div>
     <div id="buttons" style="float:right">
      <input type="button"  value="質問リスト"     class="submit"  onclick="location.href='qna_list'">
      <input type="button"  value="ショッピン続き"  class="cancel"  onclick="location.href='index'">
      </div>
    </form>
  </article>
<%@ include file="../footer.jsp" %>