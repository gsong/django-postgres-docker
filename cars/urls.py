from django.urls import path

from . import views

urlpatterns = [
    path("<int:pk>/", views.driver_detail, name="driver_detail"),
]
