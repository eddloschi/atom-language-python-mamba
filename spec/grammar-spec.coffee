describe 'mamba grammar', ->
  grammar = null

  beforeEach ->
    waitsForPromise ->
      atom.packages.activatePackage('language-python-mamba')

    runs ->
      grammar = atom.grammars.grammarForScopeName('source.python.mamba')

  describe 'example groups', ->
    it 'should tokenize describe', ->
      {tokens} = grammar.tokenizeLine("with describe('description'):")
      expect(tokens[1].value).toEqual 'describe'
      expect(tokens[1].scopes).toContain 'support.function.mamba.description'

    it 'should tokenize description', ->
      {tokens} = grammar.tokenizeLine("with description('description'):")
      expect(tokens[1].value).toEqual 'description'
      expect(tokens[1].scopes).toContain 'support.function.mamba.description'

    it 'should tokenize context', ->
      {tokens} = grammar.tokenizeLine("with context('context'):")
      expect(tokens[1].value).toEqual 'context'
      expect(tokens[1].scopes).toContain 'support.function.mamba.context'

    describe 'pending', ->
      it 'should tokenize _describe', ->
        {tokens} = grammar.tokenizeLine("with _describe('description'):")
        expect(tokens[1].value).toEqual '_describe'
        expect(tokens[1].scopes).toContain 'support.function.mamba.description.pending'

      it 'should tokenize _description', ->
        {tokens} = grammar.tokenizeLine("with _description('description'):")
        expect(tokens[1].value).toEqual '_description'
        expect(tokens[1].scopes).toContain 'support.function.mamba.description.pending'

      it 'should tokenize _context', ->
        {tokens} = grammar.tokenizeLine("with _context('context'):")
        expect(tokens[1].value).toEqual '_context'
        expect(tokens[1].scopes).toContain 'support.function.mamba.context.pending'

  describe 'hooks', ->
    describe 'before', ->
      describe 'all', ->
        beforeEach =>
          {@tokens} = grammar.tokenizeLine('with before.all:')

        it 'should tokenize before', =>
          expect(@tokens[1].value).toEqual 'before'
          expect(@tokens[1].scopes).toContain 'support.function.mamba.hook.before'

        it 'should tokenize all', =>
          expect(@tokens[3].value).toEqual 'all'
          expect(@tokens[3].scopes).toContain 'support.function.mamba.hook.all'

      describe 'each', ->
        beforeEach =>
          {@tokens} = grammar.tokenizeLine('with before.each:')

        it 'should tokenize before', =>
          expect(@tokens[1].value).toEqual 'before'
          expect(@tokens[1].scopes).toContain 'support.function.mamba.hook.before'

        it 'should tokenize each', =>
          expect(@tokens[3].value).toEqual 'each'
          expect(@tokens[3].scopes).toContain 'support.function.mamba.hook.each'

    describe 'after', ->
      describe 'all', ->
        beforeEach =>
          {@tokens} = grammar.tokenizeLine('with after.all:')

        it 'should tokenize before', =>
          expect(@tokens[1].value).toEqual 'after'
          expect(@tokens[1].scopes).toContain 'support.function.mamba.hook.after'

        it 'should tokenize all', =>
          expect(@tokens[3].value).toEqual 'all'
          expect(@tokens[3].scopes).toContain 'support.function.mamba.hook.all'

      describe 'each', ->
        beforeEach =>
          {@tokens} = grammar.tokenizeLine('with after.each:')

        it 'should tokenize before', =>
          expect(@tokens[1].value).toEqual 'after'
          expect(@tokens[1].scopes).toContain 'support.function.mamba.hook.after'

        it 'should tokenize each', =>
          expect(@tokens[3].value).toEqual 'each'
          expect(@tokens[3].scopes).toContain 'support.function.mamba.hook.each'

  describe 'examples', ->
    it 'should tokenize it', ->
      {tokens} = grammar.tokenizeLine("with it('example'):")
      expect(tokens[1].value).toEqual 'it'
      expect(tokens[1].scopes).toContain 'support.function.mamba.example'

    describe 'pending', ->
      it 'should tokenize _it', ->
        {tokens} = grammar.tokenizeLine("with _it('example'):")
        expect(tokens[1].value).toEqual '_it'
        expect(tokens[1].scopes).toContain 'support.function.mamba.example.pending'
