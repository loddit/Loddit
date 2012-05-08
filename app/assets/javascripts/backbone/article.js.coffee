$ ->
  class Loddit.Models.Article extends Backbone.Model
    paramRoot: 'article'
    urlRoot: "/articles"

    defaults:
      title: null
      body: null
      created_at: null
      updated_at: null

    validate: (attrs) ->
      if attrs.title == ''
        "Title can not be empty"


  class Loddit.Collections.Articles extends Backbone.Collection
    model: Loddit.Models.Article
    url: '/articles'
    
    comparator: (article) ->
      return -article.get("id")

  class Loddit.Views.Article extends Backbone.View
    tagName: "div"
    className: "article"
    template: (json) -> Mustache.to_html($('#article-template').html(),json)

    events:
      "dblclick .title"    : "edit"
      "keypress input[name='title']"  : "update"
      "keyup input[name='title']"     : "checkEmpty"
      "blur input[name='title']"      : "leave"

    initialize: =>
      this.model.bind('change', this.render,this)
      this.model.view = this
      this.render()

    render: =>
      $(@el).html(@template(@model.toJSON()))

    edit: =>
      $(@el).addClass('editing')
      @.$("input[name='title']").focus()

    update: (e) =>
      if e.keyCode == 13
        @model.set({title:@.$('input').val()})
        $(@el).removeClass('editing')

    checkEmpty: (e) =>
      if e.keyCode == 8 and @.$('input').val().length == 0
        @.$(".twipsy").show()
      else
        @.$(".twipsy").hide()

    leave: =>
      @model.set({title:@.$('input').val()})
      $(@el).removeClass('editing')

  class Loddit.Views.Index extends Backbone.View
    el: $('#index')
    template: (json) -> Mustache.to_html($('#index-template').html(),json)

    events:
      "submit form" : "create"

    initialize: =>
      @collection.bind('add', @render,this)
      @collection.bind("reset",@render,this)
      @render()

    render: =>
      self = this
      self.el.html(self.template({length:self.collection.length}))
      _.each(self.collection.models,(article) ->
          v = new Loddit.Views.Article({model:article})
          self.el.append v.el
          )

    create: =>
      article = new Loddit.Models.Article()
      if article.set({title:@.$('#article_title').val(),body:@.$('#article_body').val()})
        this.collection.add(article)

  class Loddit.Routers.Articles extends Backbone.Router
    routes:
      "a" :                 "articles"
      "articles" :                 "articles"

    articles: ->
      window.i = new Loddit.Views.Index({collection:c})

