## Hi,
Here's how to set up docker and shit\
The notion doc is soooorta wonky, but still, here: https://rvk7895.notion.site/rvk7895/Instructions-to-install-MySQL-in-Docker-b91ff88693544d639abcd30844a2ff86

First, get this repo and cd into it.\
Now, do everything from within here

**Step 1.** Get the docker engine :thumbs:

**Step 2.** use the `usermod` command to add yourself to the `docker` group. This is only to prevent spamming sudo for any docker command.

**Step 3.** Get MYSQL in docker: `docker pull ubuntu/mysql` (this works on arch too btw)

**Step 4.** Set up MYSQL environment within docker: `docker run --name=<SetAContainerName> -p 30306:3306 -e MYSQL_ROOT_PASSWORD=<SetAPassword> -d ubuntu/mysql`

---

Now, in no particular order of steps,
- To start the docker-wala MySQL CLI: `docker exec -it <ContainerName> mysql -uroot -p`

- To construct a database within the docker MYSQL from the dump file, **ONLY the Vehicle table exists rn**\
Copy the dump from this dir to docker's storage space: `docker cp ./monkeDB1.sql <ContainerName>:/monkeDB1.sql`\
Then start the docker-wala MySQL CLI (same as above): `docker exec -it <ContainerName> mysql -uroot -p`\
Then from within the MySQL CLI, `source monkeDB1.sql`

- To run the program,\
Ensure you have PyMySQL: `pip install PyMySQL`\
`python3 MiniWorld.py`\
**NOTE: Only Options 1 (insert vehicle) and 5 (Log Out) work rn. Just a basic working setup bruh.**

- After you're done adding tables/doing anything remotely useful within the database other than screwing around,\
i.e. if you have actually added meaningful tables to the database, to dump the database from within docker to a regular ol' file on your regular ol' real system:\
`docker exec -it <DockerSetName> mysqldump -uroot -p<SQLPassword> --databases <dbName> > <filename>.sql`\
(Example: after creating the vehicle table, i did this so that now you guys can 'clone' the latest version of our db on your machines without having to manually create tables and stuff.)