# Utilise l'image officielle Tomcat 9
FROM tomcat:9.0

# Supprime les applications par défaut du Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copie ton fichier WAR généré par Maven dans le dossier ROOT de Tomcat
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war
