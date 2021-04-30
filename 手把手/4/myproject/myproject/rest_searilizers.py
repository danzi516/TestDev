from rest_framework import serializers

from product.model import productModel
from project.models import projectModel
from ProductProject.models import ProductProjectModel


class ProductSerializer(serializers.ModelSerializer):
    class Meta:
        model = productModel
        fields = '__all__'



class ProjectSerializer(serializers.ModelSerializer):

    class Meta:
        model = projectModel
        fields = '__all__'

class ProductProjectSerializer(serializers.ModelSerializer):
    project = ProjectSerializer(read_only=True)
    product = ProductSerializer(read_only=True)
    class Meta:
        model = ProductProjectModel
        fields =  '__all__'

