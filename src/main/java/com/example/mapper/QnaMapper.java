package com.example.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.dto.QnaVO;

@Mapper
public interface QnaMapper {
	public List<QnaVO>getUserQnaList(String u_id);
	public void insertQna(Map<String,Object>map);
	public QnaVO getOneQna(int qseq);
}