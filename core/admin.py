from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from .models import User


# Register your models here.
@admin.register(User)
class UserAdmin(BaseUserAdmin):
    actions = ['add_to_staff_members', 'remove_from_staff_members']
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('username', 'password1', 'password2', 'email', 'first_name', 'last_name', 'profile_type'),
        }),
    )
    list_filter = ['profile_type', 'is_staff', 'is_superuser', 'is_active']
    @admin.action(description='Add to staff members')
    def add_to_staff_members(self, request, queryset):
        added_to_staff = queryset.update(is_staff=True)
        self.message_user(
            request,
            f'{added_to_staff} professor successfully added to staff members.'
        )
    
    @admin.action(description='Remove from staff members')
    def remove_from_staff_members(self, request, queryset):
        removed_from_staff = queryset.update(is_staff=False)
        self.message_user(
            request,
            f'{removed_from_staff} professor successfully removed from staff members.'
        )
    

