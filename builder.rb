# frozen_string_literal: true

class Person
  attr_reader :email

  def initialize(email)
    @email = email
  end
end

class Project
  attr_reader :owners, :editors
  attr_accessor :name

  def initialize
    @owners = []
    @editors = []
    @name = name
  end
end

class ProjectBuilder
  attr_reader :project

  def initialize
    @project = Project.new
  end

  def name=(name)
    @project.name = name
  end

  def add_owners(email)
    @project.owners << Person.new(email)
  end

  def add_editors(email)
    @project.editors << Person.new(email)
  end
end

builder = ProjectBuilder.new
builder.name = 'First Project'
builder.add_editors('bob@editor.com')
builder.add_owners('bob@owner.com')

project = builder.project
puts "Project name: #{project.name}"
puts "Owners: #{project.owners.map(&:email)}"
puts "Editors: #{project.editors.map(&:email)}"
