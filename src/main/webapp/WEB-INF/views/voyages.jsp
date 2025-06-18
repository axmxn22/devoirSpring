<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="includes/header.jsp" %>
<%@ include file="includes/sidebar.jsp" %>

<div class="container mt-3">
    <c:if test="${not empty success}">
        <div class="alert alert-success">${success}</div>
    </c:if>
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
</div>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Liste des Voyages</h2>
        <a href="${pageContext.request.contextPath}/voyages/form" class="btn btn-primary">Ajouter un voyage</a>
    </div>

    <!-- Formulaire de recherche -->
    <form method="get" action="${pageContext.request.contextPath}/voyages" class="mb-3">
        <div class="input-group">
            <input type="text" name="recherche" class="form-control" placeholder="Rechercher par ville..." />
            <button type="submit" class="btn btn-secondary">Rechercher</button>
        </div>
    </form>

    <!-- Tableau des voyages -->
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Ville de départ</th>
                <th>Ville d'arrivée</th>
                <th>Date</th>
                <th>Heure</th>
                <th>Places</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="voyage" items="${voyages}">
                <tr>
                    <td>${voyage.id}</td>
                    <td>${voyage.villeDepart}</td>
                    <td>${voyage.villeArrivee}</td>
                    <td>${voyage.dateDepart}</td>
                    <td>${voyage.heureDepart}</td>
                    <td>${voyage.nombrePlaces}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/voyages/edit/${voyage.id}" class="btn btn-sm btn-warning">Modifier</a>
                        <a href="${pageContext.request.contextPath}/voyages/delete/${voyage.id}"
                           class="btn btn-sm btn-danger"
                           onclick="return confirm('Supprimer ce voyage ?')">Supprimer</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="includes/footer.jsp" %>
