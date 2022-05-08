# Tester ma solution

## Voici les étapes à suivre pour tester ma solution :

- cloner le dépôt
- composer update / composer install
- créer dans /config un fichier db.php prenant pour modèle db.php.dist et le compléter avec un utilisateur mysql fonctionnel
- exécuter les requêtes SQL présentes dans /sql :
```
mysql -u db_user -p < sql/user.sql
mysql -u db_user -p < sql/proposal.sql
mysql -u db_user -p < sql/userProposal.sql
```
