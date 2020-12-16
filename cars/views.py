from django.shortcuts import render

from .models import Car, Driver


def driver_detail(request, pk):
    owner_obj = Driver.objects.get(pk=pk)
    car_objs = Car.objects.filter(owner_id=owner_obj.id)
    context = {
        "vehicles": car_objs,
        "drivers": owner_obj,
    }
    return render(request, "driver_detail.html", context)
