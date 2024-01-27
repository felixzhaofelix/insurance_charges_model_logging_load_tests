Titre: Load test pour le modèle de prédiction avec logger

Date: 14-12-2023

Auteur: Félix Zhao

Résumé: Une exigence courante pour les services RESTful est la capacité de continuer à fonctionner tout en étant utilisé par de nombreux utilisateurs simultanément. Dans cet article de blog, nous montrerons comment créer un script de test de charge pour un service de modèle d'apprentissage automatique (ML).

# Testons notre service de prédiction avec des fausses requêtes pour voir sa performance d'accueil les requêtes

## Introduction

Le modèle ML déployé doit répondre aux exigences du système dans lequel il est déployé. Les exigences qu'un système doit remplir sont souvent catégorisées en deux types :

Les exigences fonctionnelles : Les exigences fonctionnelles sont le comportement spécifique qu'un système.

Les exigences non fonctionnelles : Les normes opérationnelles que le système doit respecter pour accomplir ses tâches assignées.

Un exemple d'exigence non fonctionnelle est la latence du système, qui est le temps nécessaire pour qu'un système réponde à une demande de bout en bout.
Par exemple, nous avons besoin d'un service ML qui fait des prédictions dans 10 ms, sinon, le système n'est pas plus utile en pratique.

Les exigences non fonctionnelles peuvent être formulées en utilisant des INDICATEURS de niveau de service (SLI). Un SLI est une métrique mesurant un aspect de la fonction du système.

Un SLI doit être bien défini et compris à la fois par les clients et les opérateurs d'un système, car il forme la base des objectifs de niveau de service. Quelques exemples de SLI sont la latence, le débit, la disponibilité, le taux d'erreur et la durabilité.

Les OBJECTIFS de niveau de service (SLO) sont des exigences sur le fonctionnement d'un système mesurées à travers les SLI du système. Les SLO sont des moyens définis et convenus pour indiquer quand un système fonctionne en dehors des normes de performance requises.

Par exemple, lors de la mesure de la latence, un SLO valide pourrait être quelque chose comme ceci : "la latence du système ne doit pas dépasser 500 ms pour 90% des demandes". Lors de la mesure des taux d'erreur, un SLO pourrait indiquer "le nombre d'erreurs ne doit pas dépasser 10 pour chaque 10 000 demandes effectuées sur le système".


Les tests de charge sont le processus par lequel nous pouvons vérifier qu'un modèle ML déployé en tant que service est capable de respecter le SLA du service tout en étant soumis à une charge. Certains des SLI que nous mesurerons seront la latence, le débit et le taux d'erreur.

Détails d'implémentation dans le fichier : 

https://github.com/uqam-lomagnin/specifications-de-l-evolution-de-l-application-ml-ia_mgl7320_g1/blob/fc8a292141a91309091a947f846afb630115d825/blog_post/load_test.ipynb


Quelques captures d'écran de l'exécution du script de test de charge :

![External image](https://github.com/uqam-lomagnin/specifications-de-l-evolution-de-l-application-ml-ia_mgl7320_g1/blob/felix_load_tests/images/locust_making_requests_to_service.png)

- locust faisant des requêtes au service

![External image](https://github.com/uqam-lomagnin/specifications-de-l-evolution-de-l-application-ml-ia_mgl7320_g1/blob/felix_load_tests/images/service_receiving_requests_from_locust.png)

- le service recevant des requêtes de locust

![External image](https://github.com/uqam-lomagnin/specifications-de-l-evolution-de-l-application-ml-ia_mgl7320_g1/blob/felix_load_tests/images/locust_graphs_multiple_users.png)

- graphiques de locust avec plusieurs utilisateurs

![External image](https://github.com/uqam-lomagnin/specifications-de-l-evolution-de-l-application-ml-ia_mgl7320_g1/blob/felix_load_tests/images/755_requests_made.png)

- 755 requêtes effectuées
- 0 échecs

![External image](https://github.com/uqam-lomagnin/specifications-de-l-evolution-de-l-application-ml-ia_mgl7320_g1/blob/felix_load_tests/images/docker_image_receiving_requests.png)

- image docker du service recevant des requêtes

Malheureusement, la fonctionnalité de load test n'a pas pu être intégré au service déployé sur Kubernetes à cause d'un problème de configuration
sur les serveurs, pour le moment, nous avons déployé le service sur Docker avec succès, ce qui nous confirme le fonctionnement du code, 
le déploiement sur Kubernetes est en cours de résolution.

----------------------------------------------------------------------------------------------------------------------------

