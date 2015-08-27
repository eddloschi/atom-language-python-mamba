language_python_mamba = require '../lib/language-python-mamba'

describe 'language-python-mamba', ->
  describe 'when a mamba file is loaded', ->
    beforeEach ->
      waitsForPromise ->
        atom.packages.activatePackage('language-python-mamba')
      waitsForPromise ->
        atom.workspace.open('fixtures/sample_spec.py')

    it 'should set the grammar to source.python.mamba', ->
      expect(atom.workspace.getActiveTextEditor().getGrammar().scopeName).toEqual 'source.python.mamba'

  describe '_isMambaFile', ->
    it 'should return true to spec files', ->
      expect(language_python_mamba._isMambaFile('sample_spec.py')).toBe true

    it 'should return false to non-spec files', ->
      expect(language_python_mamba._isMambaFile('sample.py')).toBe false

    it 'should accept a dash as separator', ->
      expect(language_python_mamba._isMambaFile('sample-spec.py')).toBe true

    it 'should require a separator', ->
      expect(language_python_mamba._isMambaFile('samplespec.py')).toBe false
