<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/sidebar.jsp" %>

<div class="container mt-4">
    <h2>Créer une Réservation</h2>

    <c:if test="${error != null}">
        <div class="alert alert-danger">${error}</div>
    </c:if>

    <form action="${pageContext.request.contextPath}/reservations/save" method="post">
        <div class="mb-3">
            <label>Client</label>
            <select name="clientId" class="form-control" required>
                <c:forEach var="client" items="${clients}">
                    <option value="${client.id}">
                        ${client.nom} ${client.prenom}
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label>Voyage</label>
            <select name="voyageId" class="form-control" required>
                <c:forEach var="voyage" items="${voyages}">
                    <option value="${voyage.id}">
                        ${voyage.villeDepart} → ${voyage.villeArrivee} | ${voyage.dateDepart} ${voyage.heureDepart} [${voyage.nombrePlaces} places restantes]
                    </option>
                </c:forEach>
            </select>
        </div>

        <div class="mb-3">
            <label>Nombre de places</label>
            <input type="number" name="nombrePlaces" class="form-control" required min="1" />
        </div>

        <button type="submit" class="btn btn-success">Réserver</button>
        <a href="${pageContext.request.contextPath}/reservations" class="btn btn-secondary">Annuler</a>
    </form>
</div>

<%@ include file="includes/footer.jsp" %>
