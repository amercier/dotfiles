'use babel';

import * as path from 'path';

describe('The remark-lint provider for Linter', () => {
  const lint = require(path.join('..', 'lib', 'index.js')).provideLinter().lint;

  beforeEach(() => {
    atom.workspace.destroyActivePaneItem();
    waitsForPromise(() => {
      atom.packages.activatePackage('linter-markdown');
      return atom.packages.activatePackage('language-gfm').then(() =>
        atom.workspace.open(path.join(__dirname, 'fixtures', 'definition-case-valid.md'))
      );
    });
  });

  describe('checks a file with issues and', () => {
    let editor = null;
    const dciPath = path.join(__dirname, 'fixtures', 'definition-case-invalid.md');
    beforeEach(() => {
      waitsForPromise(() =>
        atom.workspace.open(dciPath).then(openEditor => editor = openEditor)
      );
    });

    it('finds at least one message', () => {
      waitsForPromise(() =>
        lint(editor).then(messages =>
          expect(messages.length).toBeGreaterThan(0)
        )
      );
    });

    it('verifies the first message', () => {
      waitsForPromise(() =>
        lint(editor).then(messages => {
          expect(messages[0].type).toBeDefined();
          expect(messages[0].type).toEqual('Error');
          expect(messages[0].html).toBeDefined();
          expect(messages[0].html).toEqual(
            '<span class="badge badge-flexible">definition-case</span> ' +
            'Do not use upper-case characters in definition labels'
          );
          expect(messages[0].filePath).toBeDefined();
          expect(messages[0].filePath).toMatch(/.+definition-case-invalid\.md$/);
          expect(messages[0].range).toBeDefined();
          expect(messages[0].range.length).toBeDefined();
          expect(messages[0].range.length).toEqual(2);
          expect(messages[0].range).toEqual([[2, 0], [2, 58]]);
        })
      );
    });
  });

  it('finds nothing wrong with a valid file', () => {
    const dcvPath = path.join(__dirname, 'fixtures', 'definition-case-valid.md');
    waitsForPromise(() =>
      atom.workspace.open(dcvPath).then(editor =>
        lint(editor).then(messages =>
          expect(messages.length).toEqual(0)
        )
      )
    );
  });
});
