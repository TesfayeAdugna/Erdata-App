from rest_framework import serializers
from erdata_app.models import *


class ChildrenSerializer(serializers.ModelSerializer):
    class Meta:
        model = Children
        exclude = []


class SuggestionSerializer(serializers.ModelSerializer):
    suggested_by = serializers.StringRelatedField(read_only=True)
    class Meta:
        model = Suggestion
        exclude = []