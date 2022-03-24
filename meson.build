project('pcre2', 'c')

compiler = meson.get_compiler('c')
link_deps = []
incdirs = ['src']
cflags = ['-DHAVE_CONFIG_H=1', '-DPCRE2_CODE_UNIT_WIDTH=8', '-DPCRE2_STATIC']

sources = [
    'src/pcre2_auto_possess.c',
    'src/pcre2_chartables.c',
    'src/pcre2_compile.c',
    'src/pcre2_config.c',
    'src/pcre2_context.c',
    'src/pcre2_convert.c',
    'src/pcre2_dfa_match.c',
    'src/pcre2_error.c',
    'src/pcre2_extuni.c',
    'src/pcre2_find_bracket.c',
    'src/pcre2_jit_compile.c',
    'src/pcre2_maketables.c',
    'src/pcre2_match.c',
    'src/pcre2_match_data.c',
    'src/pcre2_newline.c',
    'src/pcre2_ord2utf.c',
    'src/pcre2_pattern_info.c',
    'src/pcre2_script_run.c',
    'src/pcre2_serialize.c',
    'src/pcre2_string_utils.c',
    'src/pcre2_study.c',
    'src/pcre2_substitute.c',
    'src/pcre2_substring.c',
    'src/pcre2_tables.c',
    'src/pcre2_ucd.c',
    'src/pcre2_valid_utf.c',
    'src/pcre2_xclass.c',
]

incdirs = include_directories(incdirs)

pcre2 = static_library(
    'pcre2',
    sources,
    c_args: cflags,
    include_directories: incdirs,
    dependencies: link_deps,
)
pcre2_dep = declare_dependency(
    include_directories: incdirs,
    dependencies: link_deps,
    link_with: pcre2,
    version: meson.project_version()
)

meson.override_dependency('pcre2', pcre2_dep)

# vim: set ts=4 sts=4 sw=4 et:
