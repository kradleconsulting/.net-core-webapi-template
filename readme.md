To restore the database create the database and run the script:

psql -U <User> -d <kwebapi> -f <PathToScript>


- <User> is the user that has rights to the database
- <kwebapi> is the default database name. You have to create it first, and give rights to the user.
- <PathToScript> path to the database script, normally it should be found here: <Project folder>\KWebApi.Data\Database.sql

psql should be used because pgadmin or dbeaver couldn't work with some of sql statements