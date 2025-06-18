<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/sidebar.jsp" %>

<div class="container mt-4">
    <h2>Ajouter un client</h2>
    <form:form method="post" modelAttribute="client" action="${pageContext.request.contextPath}/clients/save">
        <div class="mb-3">
            <label>Nom</label>
            <form:input path="nom" cssClass="form-control"/>
        </div>
        <div class="mb-3">
            <label>Prénom</label>
            <form:input path="prenom" cssClass="form-control"/>
        </div>
        <div class="mb-3">
            <label>Contact</label>
            <form:input path="contact" cssClass="form-control"/>
        </div>
        <button type="submit" class="btn btn-success">Enregistrer</button>
        <a href="${pageContext.request.contextPath}/clients" class="btn btn-secondary">Annuler</a>
    </form:form>
</div>

<%@ include file="includes/footer.jsp" %>
