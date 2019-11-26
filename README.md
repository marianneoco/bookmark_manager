User Stories
============

As a user
to keep track of my favourite websites
I would like to be able to view a list of saved bookmarks

As a User
to keep track of my favourite websites
I want to mark a webpage as a favourite

User ---->  Bookmarks ----
      read                |
                          |
return list<_____________ |

To set up the database
============
- connect to psql
- CREATE DATABASE bookmark_manager;
- \c bookmark_manager;
- Run the SQL scripts in the `db/migrations` folder.
