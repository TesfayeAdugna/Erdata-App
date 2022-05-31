from django.contrib.auth.models import User
from rest_framework import serializers

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['username', 'email',"date_joined"]

class RegistrationSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={'input-type':'password'},write_only=True)
    email = serializers.EmailField()
    first_name = serializers.CharField()
    last_name = serializers.CharField()
    class Meta:
        model = User
        fields = ['username','first_name','last_name','email','password','password2']
        extra_kwargs = {
            'password':{'write_only' : True},
        }

    def save(self):
        password = self.validated_data['password']
        password2 = self.validated_data['password2']
        if password != password2:
            raise serializers.ValidationError({'error':'password1 and password2 must be the same.'})
        if User.objects.filter(email=self.validated_data['email']).exists():
            raise serializers.ValidationError({'error': 'this email already exit.'})
        if User.objects.filter(username=self.validated_data['username']).exists():
            raise serializers.ValidationError({'error': 'this username already exit.'})
        account = User(email=self.validated_data['email'],username=self.validated_data['username'],
                       first_name=self.validated_data['first_name'], last_name = self.validated_data['last_name'])
        account.set_password(password)
        account.save()
        return account


class UpdateSerializer(serializers.ModelSerializer):
    password2 = serializers.CharField(style={'input-type': 'password'}, write_only=True)
    email = serializers.EmailField()
    first_name = serializers.CharField()
    last_name = serializers.CharField()

    class Meta:
        model = User
        fields = ['username', 'first_name', 'last_name', 'email', 'password', 'password2']
        extra_kwargs = {
            'password': {'write_only': True},
        }

    def save(self):
        password = self.validated_data['password']
        password2 = self.validated_data['password2']
        if password != password2:
            raise serializers.ValidationError({'error': 'password1 and password2 must be the same.'})
        account = User(email=self.validated_data['email'], username=self.validated_data['username'],
                       first_name=self.validated_data['first_name'], last_name=self.validated_data['last_name'])
        account.set_password(password)
        account.save()
        return account

