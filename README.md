## Getting up and running

Ensure you have Docker installed on your machine, then run `docker-compose build` to build the image.

Once built:
1. Create the database: `docker-compose run web rake db:create`
2. In a different terminal window, start the app: `docker-compose up` (visit `http://localhost:3000/`)

To work inside the container: `docker-compose run --rm web /bin/bash/`
