from turtle import home

from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name="Home "),
    path('cart/', views.cart, name="cart")
]
