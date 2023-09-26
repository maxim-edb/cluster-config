local namespaceTemplate = import 'template-namespace.jnt';
local adminRoleBindingTemplate = import 'template-rolebinding-admin.jnt';
local postgresAdminRoleBindingTemplate = import 'template-rolebinding-postgresql-admin.jnt';
local promoteRoleBindingTemplate = import 'template-rolebinding-promote.jnt';

local generateUserResources(username) = [
  namespaceTemplate(username),
  adminRoleBindingTemplate(username),
  promoteRoleBindingTemplate(username),
  postgresAdminRoleBindingTemplate(username),
];

[
  userResources
  for userNumber in std.range(1, 15)
  for userResources in generateUserResources('edbuser%02d' % userNumber)
]
