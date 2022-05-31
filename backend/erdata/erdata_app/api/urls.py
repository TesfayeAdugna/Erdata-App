from django.urls import path

from erdata_app.api.views import *

urlpatterns = [
    path('children/',ChildrenListGet.as_view(), name = 'children-list'),
    path('children-create/',ChildrenCreate.as_view(), name = 'children-create'),
    path('children/<int:pk>',ChildrenDetailGet.as_view(), name = 'children-detail'),
    path('children-up-del/<int:pk>',ChildrenDetailUpdateDelete.as_view(), name = 'children-detail-up-del'),
    path('suggestion-list/',SuggestionGet.as_view(),name = 'suggestion-list'),
    path('suggestion-create/',SuggestionCreate.as_view(),name = 'suggestion-create'),
    path('suggestion-detail/',SuggestionDetail.as_view(),name = 'suggestion-detail'),
]