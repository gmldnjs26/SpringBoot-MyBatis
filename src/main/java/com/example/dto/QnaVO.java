package com.example.dto;

import java.sql.Date;

public class QnaVO {
	private int qseq;
	private String q_subject;
	private String q_content;
	private String q_reply;
	private String u_id; // reference Member(id)
	private int q_status;;
	private Date indate;

	public int getQseq() {
		return qseq;
	}
	public void setQseq(int qseq) {
		this.qseq = qseq;
	}
	public String getQ_subject() {
		return q_subject;
	}
	public void setQ_subject(String q_subject) {
		this.q_subject = q_subject;
	}
	public String getQ_content() {
		return q_content;
	}
	public void setQ_content(String q_content) {
		this.q_content = q_content;
	}
	public String getQ_reply() {
		return q_reply;
	}
	public void setQ_reply(String q_reply) {
		this.q_reply = q_reply;
	}
	public String getU_id() {
		return u_id;
	}
	public void setU_id(String u_id) {
		this.u_id = u_id;
	}

	public int getQ_status() {
		return q_status;
	}
	public void setQ_status(int q_status) {
		this.q_status = q_status;
	}
	public Date getIndate() {
		return indate;
	}
	public void setIndate(Date indate) {
		this.indate = indate;
	}


}
