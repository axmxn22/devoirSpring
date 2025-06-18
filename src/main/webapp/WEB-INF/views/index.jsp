<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="includes/header.jsp" %>
<%@ include file="includes/sidebar.jsp" %>

<div class="container mt-4">
    <h2>Tableau de bord</h2>
    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card text-bg-primary mb-3">
                <div class="card-body">
                    <h5 class="card-title">Voyages</h5>
                    <p class="card-text">Voir et gérer les voyages.</p>
                    <a href="voyages" class="btn btn-light">Accéder</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title">Clients</h5>
                    <p class="card-text">Voir et gérer les clients.</p>
                    <a href="clients" class="btn btn-light">Accéder</a>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-bg-warning mb-3">
                <div class="card-body">
                    <h5 class="card-title">Réservations</h5>
                    <p class="card-text">Voir et gérer les réservations.</p>
                    <a href="reservations" class="btn btn-light">Accéder</a>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="includes/footer.jsp" %>
