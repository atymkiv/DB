UPDATE real_estate.role SET role_name = 'Admin', permissions = 'full' WHERE roleID = 1;
UPDATE real_estate.role SET role_name = 'Moderator', permissions = 'read, write, confirm' WHERE roleID = 2;
UPDATE real_estate.role SET role_name = 'User', permissions = 'read, write, edit' WHERE roleID = 3;