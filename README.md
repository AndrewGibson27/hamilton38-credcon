## Getting up and running
Ensure you have Docker installed on your machine, then run `docker-compose build` to build the image.

Once built:
1. Start the app: `docker-compose up`
2. In a different terminal window, create the database: `docker-compose run web rake db:create`
3. Visit `http://localhost:3000/`

To work inside the container: `docker-compose run web bash`

Based on these official [Docker instructions](https://docs.docker.com/compose/rails/).
