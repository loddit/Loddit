class Loddit.Models.Article extends Backbone.Model
  paramRoot: 'article'

  defaults:
    title: null
    body: null

class Loddit.Collections.ArticlesCollection extends Backbone.Collection
  model: Loddit.Models.Article
  url: '/articles'
