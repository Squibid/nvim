ls.add_snippets('make', {
  s({
    name = "Start Makefile",
    trig = "make",
    dscr = "simple starter make file"
  },
    fmta(
      [[
      # flags and incs
      CFLAGS = <FLAGS>
      INCS = <MAIN>.c

      PREFIX = <PREFIX> 

      # compiler and linker
      CC = cc

      all: <MAINA>
      <MAINA>: <MAINA>.o
        $(CC) <MAINA>.o $(CFLAGS) -o $@
      <MAINA>.o: $(INCS)

      clean:
        rm -f <MAINA> *.o

      install: <MAINA>
        mkdir -p $(PREFIX)/bin
        cp -f <MAINA> $(PREFIX)/bin
        chmod 755 $(PREFIX)/bin/<MAINA>
      uninstall: <MAINA>
        rm -f $(PREFIX)/bin/<MAINA>
      ]],
      {
        FLAGS = i(1, "-Wall"),
        MAIN = i(2, "main"),
        PREFIX = i(3, "/usr/local"),
        MAINA = ri(2),
      }
    )
  ),
})
