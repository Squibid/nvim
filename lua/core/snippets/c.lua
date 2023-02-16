ls.add_snippets('c', {
  s('trip', {
    -- cond ? then : else statment
    i(1, 'cond'), t(' ? '), i(2, 'then'), t(' : '), i(3, 'else')
  }),
  s('stdlibs', {
    -- cond ? then : else statment
    t('#include <stdio.h>'),
    t({'', '#include <stdlib.h>'})
  }),
  s('die', {
    t({
    'void die(const char *fmt, ...) {', '',
      'va_list ap;',
      '',
      'va_start(ap, fmt);',
      'vfprintf(stderr, fmt, ap);',
      'va_end(ap);',
      '',
      [[if (fmt[0] && fmt[strlen(fmt)-1] == ':') {]],
      [[  fputc(' ', stderr);]],
      '  perror(NULL);',
      '} else',
      [[  fputc('\n', stderr);]],
      '  exit(1);',
      '}',
    })
  })
})
