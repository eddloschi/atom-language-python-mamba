module.exports =
  activate: ->
    atom.workspace.observeTextEditors (editor) =>
      return unless @_isMambaFile editor.getPath()
      mambaGrammar = atom.grammars.grammarForScopeName 'source.python.mamba'
      return unless mambaGrammar?
      editor.setGrammar mambaGrammar

  _isMambaFile: (path) ->
    path.match('[-_]spec\.py$')?
