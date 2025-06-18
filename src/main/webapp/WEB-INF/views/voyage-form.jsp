<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="includes/header.jsp" %>
<%@ include file="includes/sidebar.jsp" %>

<div class="container mt-5">
    <h2>${voyage.id == null ? "Ajouter un Voyage" : "Modifier le Voyage"}</h2>

    <form:form method="post" modelAttribute="voyage" action="${pageContext.request.contextPath}/voyages/save">
        <div class="mb-3">
            <label>Ville de départ</label>
            <form:input path="villeDepart" cssClass="form-control"/>
        </div>

        <div class="mb-3">
            <label>Ville d'arrivée</label>
            <form:input path="villeArrivee" cssClass="form-control"/>
        </div>

        <div class="mb-3">
            <label>Date de départ</label>
            <form:input path="dateDepart" type="date" cssClass="form-control"/>
        </div>

        <div class="mb-3">
            <label>Heure de départ</label>
            <form:input path="heureDepart" type="time" cssClass="form-control"/>
        </div>

        <div class="mb-3">
            <label>Nombre de places</label>
            <form:input path="nombrePlaces" type="number" cssClass="form-control"/>
        </div>

        <button type="submit" class="btn btn-success">Enregistrer</button>
        <a href="${pageContext.request.contextPath}/voyages" class="btn btn-secondary">Annuler</a>
    </form:form>
</div>

<%@ include file="includes/footer.jsp" %>
