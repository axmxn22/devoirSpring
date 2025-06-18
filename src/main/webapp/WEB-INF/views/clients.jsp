<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/sidebar.jsp" %>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Liste des clients</h2>
        <a href="${pageContext.request.contextPath}/clients/form" class="btn btn-primary">Ajouter un client</a>
    </div>

    <table class="table table-bordered table-hover">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Nom</th>
                <th>Prénom</th>
                <th>Contact</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="client" items="${clients}">
                <tr>
                    <td>${client.id}</td>
                    <td>${client.nom}</td>
                    <td>${client.prenom}</td>
                    <td>${client.contact}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="includes/footer.jsp" %>
