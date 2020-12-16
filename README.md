# django-postgres-docker

`docker-compose up -d` and the Django app should be available at
<http://locahost:5000>.

## Initialize the App

1. `docker-compose exec app ./manage.py migrate`
1. `docker-compose exec app ./manage.py createsuperuser`
1. `docker-compose exec app psql "postgresql://postgres:password@db/demo" -c "\copy cars_driver FROM /var/projects/fixtures/drivers.csv (format csv)"`
1. `docker-compose exec app psql "postgresql://postgres:password@db/demo" -c "\copy cars_car FROM /var/projects/fixtures/cars.csv (format csv)"`

## Django Admin

<http://localhost:5000/admin>
