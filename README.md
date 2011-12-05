# Formulatron App

This is a spike to get a working custom form builder (similar to Wufoo). The eventual goal is to pull this into its own gem.

Currently you can create forms with a number of different fields. Each of these fields has a name and a type (currently supports text fields, text areas, checkboxes and radio buttons). Checkboxes and radio buttons can also have a number of different choices.

## Frontend

Currently the implentation is tied to [SimpleForm](https://github.com/plataformatec/simple_form). There's a bunch of javascript to make the add/remove the fields/choices. However, currently it's pretty obtrusive. It would be nice to refactor into a nicer unobtrusive solution.

## Backend

All the data is stored in MongoDB (Using the [Mongoid](http://mongoid.org/) gem). The schemaless nature of MongoDB makes creating and storing these flexible forms a lot easier.