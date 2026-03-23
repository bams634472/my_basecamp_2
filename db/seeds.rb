# This file should ensure the existence of records required to run the application in every environment (production, development, test). The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

admin = User.find_or_create_by!(email: "admin@example.com") do |user|
  user.name = "Admin"
  user.password = "password"
  user.password_confirmation = "password"
end

member = User.find_or_create_by!(email: "member@example.com") do |user|
  user.name = "Member"
  user.password = "password"
  user.password_confirmation = "password"
end

project = Project.find_or_create_by!(title: "Build MyBaseCamp2") do |project|
  project.description = "Extended project management with attachments, threads and messaging"
  project.owner = admin
end

ProjectMembership.find_or_create_by!(user: admin, project: project) do |m|
  m.admin = true
end
ProjectMembership.find_or_create_by!(user: member, project: project) do |m|
  m.admin = false
end

thread = ProjectThread.find_or_create_by!(project: project, title: "Welcome Thread") do |t|
  t.user = admin
  t.body = "Discuss features here."
end

Message.find_or_create_by!(project_thread: thread, user: member, body: "This is a great first message!")

