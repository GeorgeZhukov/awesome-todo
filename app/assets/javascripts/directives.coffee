angular.module('directives', [])
  .directive 'project', ->
    templateUrl: "_project.html"

  .directive 'task', ->
    templateUrl: "_task.html"

  .directive 'comment', ->
    templateUrl: "_comment.html"