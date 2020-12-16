from django.db import models


class Driver(models.Model):
    name = models.TextField()
    license = models.TextField()

    def __str__(self):
        return self.name


class Car(models.Model):
    make = models.TextField()
    model = models.TextField()
    year = models.IntegerField()
    vin = models.TextField()
    owner = models.ForeignKey("Driver", on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return f"{self.year} {self.make} {self.model} ({self.owner.name})"
