<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>

<div class="cover-container d-flex w-100 h-10 p-3 mx-auto flex-column">
  <header class="mb-auto" style="background-color:rgb(224,224,224)">  
      <nav class="nav nav-masthead justify-content-center float-md-end">
        <a class="nav-link fw-bold py-1 px-2 active" aria-current="page" href="<c:url value="/BoardListAction.do?pageNum=1"/>" style="color:rgb(85,85,85);">게시판</a>
        <a class="nav-link fw-bold py-1 px-2" href="#" style="color:rgb(85,85,85);">Q&A</a>
        <a class="nav-link fw-bold py-1 px-2" href="#" style="color:rgb(85,85,85);">공지사항</a>
  </nav>
  </header>
 </div>