# from rest_framework.permissions import IsAdminUser, IsAuthenticated

from erdata_app.api.serializers import *
from erdata_app.models import *
from rest_framework import generics


class ChildrenListGet(generics.ListAPIView):
    queryset = Children.objects.all()
    serializer_class = ChildrenSerializer


class ChildrenCreate(generics.CreateAPIView):
    # permission_classes = [IsAdminUser]
    queryset = Children.objects.all()
    serializer_class = ChildrenSerializer

class ChildrenDetailGet(generics.RetrieveAPIView):
    queryset = Children.objects.all()
    serializer_class = ChildrenSerializer


class ChildrenDetailUpdateDelete(generics.RetrieveUpdateDestroyAPIView):
    # permission_classes = [IsAdminUser]
    queryset = Children.objects.all()
    serializer_class = ChildrenSerializer


class SuggestionGet(generics.ListAPIView):
    # permission_classes = [IsAdminUser]
    queryset = Suggestion.objects.all()
    serializer_class = SuggestionSerializer


class SuggestionCreate(generics.CreateAPIView):
    # permission_classes = [IsAuthenticated]
    queryset = Suggestion.objects.all()
    serializer_class = SuggestionSerializer


class SuggestionDetail(generics.RetrieveUpdateDestroyAPIView):
    # permission_classes = [IsAdminUser]
    queryset = Suggestion.objects.all()
    serializer_class = SuggestionSerializer