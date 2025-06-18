<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/sidebar.jsp" %>

<div class="container mt-4">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>Liste des Réservations</h2>
        <a href="${pageContext.request.contextPath}/reservations/form" class="btn btn-primary">Nouvelle réservation</a>
    </div>

    <table class="table table-bordered">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>Client</th>
                <th>Voyage</th>
                <th>Places réservées</th>
                <th>Date</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="res" items="${reservations}">
                <tr>
                    <td>${res.id}</td>
                    <td>${res.client.nom} ${res.client.prenom}</td>
                    <td>${res.voyage.villeDepart} → ${res.voyage.villeArrivee}</td>
                    <td>${res.nombrePlaces}</td>
                    <td>${res.dateReservation}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<%@ include file="includes/footer.jsp" %>
