Feature: Browse Articles
  In order to get somearticle for readind
  As an Geek
  I want to see all article and get detail

Scenario: See article list
  Given There are articles titled Foo,Bar
  When I go to the list of articles
  Then I should see Foo
  And I should see Bar
