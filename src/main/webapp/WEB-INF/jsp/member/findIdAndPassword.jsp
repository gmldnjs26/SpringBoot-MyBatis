<%@ include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<script>
	$.ajax()

</script>

<c:if test="${message != null}">
	<script>
		alert("${message}");
	</script>
</c:if>

<article>
<center>

	<form action="findUserId.io" method="post" >
		<table>
			<tr>
				<td align="right"><label> Name</label></td>
				<td><input type="text" name="u_name" value=""></td>
			</tr>
			<tr>
				<td align="right"><label> E-Mail</label></td>
				<td><input type="text" name="email" value=""></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="submit"
					value="Find ID"></td>
			</tr>
		</table>
	</form>
	<p>
	<p>
	<p>
	<p>
	<p>
	<p>
	<p>
	<p>
	<p>
	<p>
	<p>
	<p>
	<form name="findUserPassword.io">
		<table>
			<tr>
				<td align="right"><label> ID</label></td>
				<td><input type="text" name="u_id" value=""></td>
			</tr>
			<tr>
				<td align="right"><label>Name</label></td>
				<td><input type="text" name="u_name" value=""></td>
			</tr>
			<tr>
				<td align="right"><label> E-Mail</label></td>
				<td><input type="text" name="email" value=""></td>
			</tr>
			<tr>
				<td align="center" colspan="2"><input type="submit"
					value="Find Password" onclick="findPassword()"></td>
			</tr>
		</table>
	</form>
</center>
</article>
<%@ include file="../footer.jsp"%>