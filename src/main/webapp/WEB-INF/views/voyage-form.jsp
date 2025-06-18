<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ include file="includes/header.jsp" %>
<%@ include file="includes/sidebar.jsp" %>

<div class="container mt-5">
    <h2>${voyage.id == null ? "Ajouter un Voyage" : "Modifier le Voyage"}</h2>

    <form:form method="post" modelAttribute="voyage" action="${pageContext.request.contextPath}/voyages/save">
        <!-- Ville de départ -->
        <div class="mb-3">
            <label>Ville de départ</label>
            <form:select path="villeDepart" cssClass="form-control">
                <form:option value="" label="-- Sélectionner une ville --" />
                <form:option value="Dakar" />
                <form:option value="Thiès" />
                <form:option value="Saint-Louis" />
                <form:option value="Kaolack" />
                <form:option value="Ziguinchor" />
                <form:option value="Kolda" />
                <form:option value="Tambacounda" />
                <form:option value="Matam" />
                <form:option value="Kédougou" />
                <form:option value="Louga" />
                <form:option value="Fatick" />
                <form:option value="Diourbel" />
            </form:select>
        </div>

        <!-- Ville d'arrivée -->
        <div class="mb-3">
            <label>Ville d'arrivée</label>
            <form:select path="villeArrivee" cssClass="form-control">
                <form:option value="" label="-- Sélectionner une ville --" />
                <form:option value="Dakar" />
                <form:option value="Thiès" />
                <form:option value="Saint-Louis" />
                <form:option value="Kaolack" />
                <form:option value="Ziguinchor" />
                <form:option value="Kolda" />
                <form:option value="Tambacounda" />
                <form:option value="Matam" />
                <form:option value="Kédougou" />
                <form:option value="Louga" />
                <form:option value="Fatick" />
                <form:option value="Diourbel" />
            </form:select>
        </div>

        <!-- Date de départ -->
        <div class="mb-3">
            <label>Date de départ</label>
            <form:input path="dateDepart" type="date" cssClass="form-control"/>
        </div>

        <!-- Heure de départ -->
        <div class="mb-3">
            <label>Heure de départ</label>
            <form:input path="heureDepart" type="time" cssClass="form-control"/>
        </div>

        <!-- Nombre de places -->
        <div class="mb-3">
            <label>Nombre de places</label>
            <form:input path="nombrePlaces" type="number" min="1" cssClass="form-control"/>
        </div>

        <!-- Boutons -->
        <button type="submit" class="btn btn-success">Enregistrer</button>
        <a href="${pageContext.request.contextPath}/voyages" class="btn btn-secondary">Annuler</a>
    </form:form>
</div>

<%@ include file="includes/footer.jsp" %>