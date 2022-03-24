# -*- Makefile -*- for pcre2

.SECONDEXPANSION:
.SUFFIXES:

ifneq ($(findstring $(MAKEFLAGS),s),s)
ifndef V
        QUIET          = @
        QUIET_CC       = @echo '   ' CC $<;
        QUIET_AR       = @echo '   ' AR $@;
        QUIET_RANLIB   = @echo '   ' RANLIB $@;
        QUIET_INSTALL  = @echo '   ' INSTALL $<;
        export V
endif
endif

LIB      = libpcre2.a
AR      ?= ar
ARFLAGS ?= rc
CC      ?= gcc
RANLIB  ?= ranlib
RM      ?= rm -f

BUILD_DIR := build
BUILD_ID  ?= default-build-id
OBJ_DIR   := $(BUILD_DIR)/$(BUILD_ID)

ifeq (,$(BUILD_ID))
$(error BUILD_ID cannot be an empty string)
endif

prefix ?= /usr/local
libdir := $(prefix)/lib
includedir := $(prefix)/include

CFLAGS ?= -O2
CFLAGS += -DHAVE_CONFIG_H=1 -DPCRE2_CODE_UNIT_WIDTH=8 -DPCRE2_STATIC -Isrc 

HEADERS = \
	src/pcre2.h \

SOURCES = \
    src/pcre2_auto_possess.c \
    src/pcre2_chartables.c \
    src/pcre2_chkdint.c \
    src/pcre2_compile.c \
    src/pcre2_compile_class.c \
    src/pcre2_compile_cgroup.c \
    src/pcre2_config.c \
    src/pcre2_context.c \
    src/pcre2_convert.c \
    src/pcre2_dfa_match.c \
    src/pcre2_error.c \
    src/pcre2_extuni.c \
    src/pcre2_find_bracket.c \
    src/pcre2_jit_compile.c \
    src/pcre2_maketables.c \
    src/pcre2_match.c \
    src/pcre2_match_data.c \
    src/pcre2_newline.c \
    src/pcre2_ord2utf.c \
    src/pcre2_pattern_info.c \
    src/pcre2_script_run.c \
    src/pcre2_serialize.c \
    src/pcre2_string_utils.c \
    src/pcre2_study.c \
    src/pcre2_substitute.c \
    src/pcre2_substring.c \
    src/pcre2_tables.c \
    src/pcre2_ucd.c \
    src/pcre2_valid_utf.c \
    src/pcre2_xclass.c \

SOURCES := $(wildcard $(SOURCES))
HEADERS := $(wildcard $(HEADERS))

HEADERS_INST := $(patsubst src/%,$(includedir)/%,$(HEADERS))
OBJECTS := $(patsubst src/%.c,$(OBJ_DIR)/%.o,$(SOURCES))

.PHONY: install

all: $(OBJ_DIR)/$(LIB)

$(includedir)/%.h: src/%.h
	-@if [ ! -d $(includedir)  ]; then mkdir -p $(includedir); fi
	$(QUIET_INSTALL)cp $< $@
	@chmod 0644 $@

$(libdir)/%.a: $(OBJ_DIR)/%.a
	-@if [ ! -d $(libdir)  ]; then mkdir -p $(libdir); fi
	$(QUIET_INSTALL)cp $< $@
	@chmod 0644 $@

install: $(HEADERS_INST) $(libdir)/$(LIB)

clean:
	$(RM) -r $(OBJ_DIR)

distclean:
	$(RM) -r $(BUILD_DIR)

$(OBJ_DIR)/$(LIB): $(OBJECTS)
	$(QUIET_AR)$(AR) $(ARFLAGS) $@ $^
	$(QUIET_RANLIB)$(RANLIB) $@

$(OBJ_DIR)/%.o: src/%.c $(OBJ_DIR)/.cflags | $$(@D)/.
	$(QUIET_CC)$(CC) $(CFLAGS) -o $@ -c $<

.PRECIOUS: $(OBJ_DIR)/. $(OBJ_DIR)%/.

$(OBJ_DIR)/.:
	$(QUIET)mkdir -p $@

$(OBJ_DIR)%/.:
	$(QUIET)mkdir -p $@

TRACK_CFLAGS = $(subst ','\'',$(CXX) $(CXXFLAGS))

$(OBJ_DIR)/.cflags: .force-cflags | $$(@D)/.
	@FLAGS='$(TRACK_CFLAGS)'; \
    if test x"$$FLAGS" != x"`cat $(OBJ_DIR)/.cflags 2>/dev/null`" ; then \
        echo "    * rebuilding pcre2: new build flags or prefix"; \
        echo "$$FLAGS" > $(OBJ_DIR)/.cflags; \
    fi

.PHONY: .force-cflags
