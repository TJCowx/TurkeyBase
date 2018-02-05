# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
- Ruby 2.4.2p198
- Rails 5.1.4

* System dependencies


* Configuration
- In the project root folder run "bundle install"

------------IF BUNDLE INSTALL DOESN'T WORK----------------------
- Go to: C:\RailsInstaller\Ruby2.2.0\bin\
- In rails.bat & bundle.bat change the following:
----------------------------------------------------------------
@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
@"C:\RailsInstaller\Ruby2.2.0\bin\ruby.exe" "C:/RailsInstaller/Ruby2.2.0/bin/rails" %1 %2 %3 %4 %5 %6 %7 %8 %9
GOTO :EOF
:WinNT
@"C:\RailsInstaller\Ruby2.2.0\bin\ruby.exe" "%~dpn0" %*
-----------------------------------------------------------------
TURNS INTO
-----------------------------------------------------------------
@ECHO OFF
IF NOT "%~f0" == "~f0" GOTO :WinNT
ECHO.This version of Ruby has not been built with support for Windows 95/98/Me.
GOTO :EOF
:WinNT
@"%~dp0ruby.exe" "%~dpn0" %*
-----------------------------------------------------------------

- Run rails db:migrate
- Run rake db:seed


* Database creation


* Database initialization


* How to run the test suite


* Services (job queues, cache servers, search engines, etc.)


* Deployment instructions

* ...
