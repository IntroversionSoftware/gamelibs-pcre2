/* config.h for CMake builds */

#ifndef __has_builtin
#define __has_builtin(x) 0
#endif

#if __has_builtin(__builtin_mul_overflow)
#define HAVE_BUILTIN_MUL_OVERFLOW 1
#endif
/* #undef HAVE_ATTRIBUTE_UNINITIALIZED */
#define HAVE_DIRENT_H 1
#define HAVE_SYS_STAT_H 1
#define HAVE_SYS_TYPES_H 1
#define HAVE_UNISTD_H 1
#ifdef _WIN32
#define HAVE_WINDOWS_H 1
#endif

/* #undef HAVE_BCOPY */
/* #undef HAVE_MEMFD_CREATE */
#define HAVE_MEMMOVE 1
/* #undef HAVE_SECURE_GETENV */
#define HAVE_STRERROR 1

#define SUPPORT_PCRE2_8 1
/* #undef SUPPORT_PCRE2_16 */
/* #undef SUPPORT_PCRE2_32 */
/* #undef PCRE2_DEBUG */
/* #undef DISABLE_PERCENT_ZT */

/* #undef SUPPORT_LIBBZ2 */
/* #undef SUPPORT_LIBEDIT */
/* #undef SUPPORT_LIBREADLINE */
#define SUPPORT_LIBZ 1

/* #undef SUPPORT_JIT */
/* #undef SLJIT_PROT_EXECUTABLE_ALLOCATOR */
/* #undef SUPPORT_PCRE2GREP_JIT  */
/* #undef SUPPORT_PCRE2GREP_CALLOUT  */
/* #undef SUPPORT_PCRE2GREP_CALLOUT_FORK  */
#define SUPPORT_UNICODE 1
/* #undef SUPPORT_VALGRIND */

/* #undef BSR_ANYCRLF */
/* #undef EBCDIC */
/* #undef EBCDIC_NL25 */
/* #undef HEAP_MATCH_RECURSE */
/* #undef NEVER_BACKSLASH_C */

#define PCRE2_EXPORT
#define LINK_SIZE		2
#define HEAP_LIMIT              20000000
#define MATCH_LIMIT		10000000
#define MATCH_LIMIT_DEPTH	MATCH_LIMIT
#define NEWLINE_DEFAULT         2
#define PARENS_NEST_LIMIT       250
#define PCRE2GREP_BUFSIZE       20480
#define PCRE2GREP_MAX_BUFSIZE   1048576

#define MAX_NAME_SIZE	32
#define MAX_NAME_COUNT	10000

/* end config.h for CMake builds */
