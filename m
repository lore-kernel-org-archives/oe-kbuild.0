Content-Type: multipart/mixed; boundary="===============7218449923569664324=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/stackinit_kunit.c:51:49: warning: use of uninitialized value '*ptr' [CWE-457]
Date: Sat, 06 Aug 2022 19:54:35 +0800
Message-ID: <202208061946.fb78MtKU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7218449923569664324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: lib/stack=
init_kunit.c:51:49: warning: use of uninitialized value '*ptr' [CWE-457] [-=
Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6614a3c3164a5df2b54abb0b3559f51041cf705b
commit: 02788ebcf521fe78c24eb221fd1ed7f86792c330 lib: stackinit: Convert to=
 KUnit
date:   5 months ago
:::::: branch date: 12 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220805 (https://download.01.org/0day-ci/archi=
ve/20220806/202208061946.fb78MtKU-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D02788ebcf521fe78c24eb221fd1ed7f86792c330
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 02788ebcf521fe78c24eb221fd1ed7f86792c330
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
              |      |            ^
              |      |            |
              |      |            (11) following 'false' branch (when 'fill=
 =3D=3D 0')...
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
              |  317 |                 DEFINE_TEST(name ## _ ## init,      =
            \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
              |  324 |                 DEFINE_STRUCT_TEST(trailing_hole, in=
it, xfail); \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:341:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
              |  341 | DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_trailing_hole_assigned_copy': event 12
              |
              |  235 |         memcpy(check_buf, target_start, target_size)=
;           \
              |      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |         |
              |      |         (12) ...to here
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
              |  317 |                 DEFINE_TEST(name ## _ ## init,      =
            \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
              |  324 |                 DEFINE_STRUCT_TEST(trailing_hole, in=
it, xfail); \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:341:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
              |  341 | DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_trailing_hole_assigned_copy': event 13
              |
              |include/linux/fortify-string.h:223:12:
              |  223 |         if (p_size < size || q_size < size)
              |      |            ^
              |      |            |
              |      |            (13) following 'false' branch...
              |
            'leaf_trailing_hole_assigned_copy': event 14
              |
              |   41 | #define __underlying_memcpy     __builtin_memcpy
              |      |                                 ^
              |      |                                 |
              |      |                                 (14) ...to here
   include/linux/fortify-string.h:225:16: note: in expansion of macro '__un=
derlying_memcpy'
              |  225 |         return __underlying_memcpy(p, q, size);
              |      |                ^~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'test_trailing_hole_assigned_copy': event 15
       |
       |lib/stackinit_kunit.c:173:19:
       |  173 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 0=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (15) returning to 'test_trailing_hole_ass=
igned_copy' from 'leaf_trailing_hole_assigned_copy'
       |  174 |                                 FETCH_ARG_ ## which(zero));=
     \
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfa=
il); \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:341:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
       |  341 | DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
     'test_trailing_hole_assigned_copy': event 16
       |
       |  178 |                 range_contains(fill_start, fill_size,      =
     \
   include/kunit/test.h:782:28: note: in definition of macro 'KUNIT_ASSERTI=
ON'
       |  782 |                            pass,                           =
                    \
       |      |                            ^~~~
   include/kunit/test.h:830:9: note: in expansion of macro 'KUNIT_UNARY_ASS=
ERTION'
       |  830 |         KUNIT_UNARY_ASSERTION(test,                        =
                    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1614:9: note: in expansion of macro 'KUNIT_TRUE_MSG=
_ASSERTION'
       | 1614 |         KUNIT_TRUE_MSG_ASSERTION(test,                     =
                    \
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:177:9: note: in expansion of macro 'KUNIT_ASSERT_T=
RUE_MSG'
       |  177 |         KUNIT_ASSERT_TRUE_MSG(test,                        =
     \
       |      |         ^~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfa=
il); \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:341:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
       |  341 | DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'do_nothing_u8_none':
>> lib/stackinit_kunit.c:51:49: warning: use of uninitialized value '*ptr' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      51 | #define DO_NOTHING_RETURN_SCALAR(ptr)           *(ptr)
         |                                                 ^~~~~~
   lib/stackinit_kunit.c:204:24: note: in expansion of macro 'DO_NOTHING_RE=
TURN_SCALAR'
     204 |                 return DO_NOTHING_RETURN_ ## which(ptr);        \
         |                        ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
     305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
     309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);            \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_u8_none': event 1
       |
       |  149 | static noinline void test_ ## name (struct kunit *test)    =
     \
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) entry to 'test_u8_none'
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
       |  305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR=
,    \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
       |  309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);       =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
     'test_u8_none': event 2
       |
       |  163 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 1=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (2) calling 'leaf_u8_none' from 'test_u8_=
none'
       |  164 |                                 FETCH_ARG_ ## which(zero));=
     \
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
       |  305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR=
,    \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
       |  309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);       =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
       +--> 'leaf_u8_none': event 3
              |
              |  208 | static noinline int leaf_ ## name(unsigned long sp, =
bool fill,  \
              |      |                     ^~~~~
              |      |                     |
              |      |                     (3) entry to 'leaf_u8_none'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);=
            \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u8_none': event 4
              |
              |  212 |         var_type var                                =
            \
              |      |                  ^~~
              |      |                  |
              |      |                  (4) region created on stack here
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);=
            \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u8_none': event 5
              |
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (5) following 'true' branch (when 'fill !=
=3D 0')...
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);=
            \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
--
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);=
            \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u8_none': event 15
              |
              |   56 |                 (var) =3D do_nothing_ ## name(&(var))
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (15) calling 'do_nothing_u8_=
none' from 'leaf_u8_none'
   lib/stackinit_kunit.c:232:9: note: in expansion of macro 'DO_NOTHING_CAL=
L_SCALAR'
              |  232 |         DO_NOTHING_CALL_ ## which(var, name);       =
            \
              |      |         ^~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);=
            \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
              +--> 'do_nothing_u8_none': event 16
                     |
                     |  200 | do_nothing_ ## name(var_type *ptr)           =
                   \
                     |      | ^~~~~~~~~~~
                     |      | |
                     |      | (16) entry to 'do_nothing_u8_none'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
                     |  305 |                 DEFINE_TEST(name ## _ ## init=
, name, SCALAR,    \
                     |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
                     |  309 |                 DEFINE_SCALAR_TEST(u8, init, =
xfail);            \
                     |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
                     |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
                     |      | ^~~~~~~~~~~~~~~~~~~
                     |
                   'do_nothing_u8_none': event 17
                     |
                     |  203 |         if ((unsigned long)ptr > 0x2)        =
                   \
                     |      |            ^
                     |      |            |
                     |      |            (17) following 'false' branch...
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
                     |  305 |                 DEFINE_TEST(name ## _ ## init=
, name, SCALAR,    \
                     |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
                     |  309 |                 DEFINE_SCALAR_TEST(u8, init, =
xfail);            \
                     |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
                     |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
                     |      | ^~~~~~~~~~~~~~~~~~~
                     |
                   'do_nothing_u8_none': event 18
                     |
                     |   51 | #define DO_NOTHING_RETURN_SCALAR(ptr)        =
   *(ptr)
                     |      |                                              =
   ^~~~~~
                     |      |                                              =
   |
                     |      |                                              =
   (18) ...to here
   lib/stackinit_kunit.c:206:24: note: in expansion of macro 'DO_NOTHING_RE=
TURN_SCALAR'
                     |  206 |                 return DO_NOTHING_RETURN_ ## =
which(ptr + 1);    \
                     |      |                        ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
                     |  305 |                 DEFINE_TEST(name ## _ ## init=
, name, SCALAR,    \
                     |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
                     |  309 |                 DEFINE_SCALAR_TEST(u8, init, =
xfail);            \
                     |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
                     |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
                     |      | ^~~~~~~~~~~~~~~~~~~
                     |
                   'do_nothing_u8_none': event 19
                     |
                     |   51 | #define DO_NOTHING_RETURN_SCALAR(ptr)        =
   *(ptr)
                     |      |                                              =
   ^~~~~~
                     |      |                                              =
   |
                     |      |                                              =
   (19) use of uninitialized value 'ptr[1]' here
   lib/stackinit_kunit.c:206:24: note: in expansion of macro 'DO_NOTHING_RE=
TURN_SCALAR'
                     |  206 |                 return DO_NOTHING_RETURN_ ## =
which(ptr + 1);    \
                     |      |                        ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
                     |  305 |                 DEFINE_TEST(name ## _ ## init=
, name, SCALAR,    \
                     |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
                     |  309 |                 DEFINE_SCALAR_TEST(u8, init, =
xfail);            \
                     |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
                     |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
                     |      | ^~~~~~~~~~~~~~~~~~~
                     |
   lib/stackinit_kunit.c: In function 'do_nothing_u16_none':
>> lib/stackinit_kunit.c:51:49: warning: use of uninitialized value '*ptr' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      51 | #define DO_NOTHING_RETURN_SCALAR(ptr)           *(ptr)
         |                                                 ^~~~~~
   lib/stackinit_kunit.c:204:24: note: in expansion of macro 'DO_NOTHING_RE=
TURN_SCALAR'
     204 |                 return DO_NOTHING_RETURN_ ## which(ptr);        \
         |                        ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
     305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
     310 |                 DEFINE_SCALAR_TEST(u16, init, xfail);           \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_u16_none': event 1
       |
       |  149 | static noinline void test_ ## name (struct kunit *test)    =
     \
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) entry to 'test_u16_none'
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
       |  305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR=
,    \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
       |  310 |                 DEFINE_SCALAR_TEST(u16, init, xfail);      =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
     'test_u16_none': event 2
       |
       |  163 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 1=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (2) calling 'leaf_u16_none' from 'test_u1=
6_none'
       |  164 |                                 FETCH_ARG_ ## which(zero));=
     \
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
       |  305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR=
,    \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
       |  310 |                 DEFINE_SCALAR_TEST(u16, init, xfail);      =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
       +--> 'leaf_u16_none': event 3
              |
              |  208 | static noinline int leaf_ ## name(unsigned long sp, =
bool fill,  \
              |      |                     ^~~~~
              |      |                     |
              |      |                     (3) entry to 'leaf_u16_none'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  310 |                 DEFINE_SCALAR_TEST(u16, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u16_none': event 4
              |
              |  212 |         var_type var                                =
            \
              |      |                  ^~~
              |      |                  |
              |      |                  (4) region created on stack here
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  310 |                 DEFINE_SCALAR_TEST(u16, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u16_none': event 5
              |
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (5) following 'true' branch (when 'fill !=
=3D 0')...
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  310 |                 DEFINE_SCALAR_TEST(u16, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
--
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  310 |                 DEFINE_SCALAR_TEST(u16, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u16_none': event 17
              |
              |   56 |                 (var) =3D do_nothing_ ## name(&(var))
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (17) calling 'do_nothing_u16=
_none' from 'leaf_u16_none'
   lib/stackinit_kunit.c:232:9: note: in expansion of macro 'DO_NOTHING_CAL=
L_SCALAR'
              |  232 |         DO_NOTHING_CALL_ ## which(var, name);       =
            \
              |      |         ^~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  310 |                 DEFINE_SCALAR_TEST(u16, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
              +--> 'do_nothing_u16_none': event 18
                     |
                     |  200 | do_nothing_ ## name(var_type *ptr)           =
                   \
                     |      | ^~~~~~~~~~~
                     |      | |
                     |      | (18) entry to 'do_nothing_u16_none'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
                     |  305 |                 DEFINE_TEST(name ## _ ## init=
, name, SCALAR,    \
                     |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
                     |  310 |                 DEFINE_SCALAR_TEST(u16, init,=
 xfail);           \
                     |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
                     |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
                     |      | ^~~~~~~~~~~~~~~~~~~
                     |
                   'do_nothing_u16_none': event 19
                     |
                     |  203 |         if ((unsigned long)ptr > 0x2)        =
                   \
                     |      |            ^
                     |      |            |
                     |      |            (19) following 'false' branch...
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
                     |  305 |                 DEFINE_TEST(name ## _ ## init=
, name, SCALAR,    \
                     |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
                     |  310 |                 DEFINE_SCALAR_TEST(u16, init,=
 xfail);           \
                     |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
                     |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
                     |      | ^~~~~~~~~~~~~~~~~~~
                     |
                   'do_nothing_u16_none': event 20
                     |
                     |   51 | #define DO_NOTHING_RETURN_SCALAR(ptr)        =
   *(ptr)
                     |      |                                              =
   ^~~~~~
                     |      |                                              =
   |
                     |      |                                              =
   (20) ...to here
   lib/stackinit_kunit.c:206:24: note: in expansion of macro 'DO_NOTHING_RE=
TURN_SCALAR'
                     |  206 |                 return DO_NOTHING_RETURN_ ## =
which(ptr + 1);    \
                     |      |                        ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
                     |  305 |                 DEFINE_TEST(name ## _ ## init=
, name, SCALAR,    \
                     |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
                     |  310 |                 DEFINE_SCALAR_TEST(u16, init,=
 xfail);           \
                     |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
                     |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
                     |      | ^~~~~~~~~~~~~~~~~~~
                     |
                   'do_nothing_u16_none': event 21
                     |
                     |   51 | #define DO_NOTHING_RETURN_SCALAR(ptr)        =
   *(ptr)
                     |      |                                              =
   ^~~~~~
                     |      |                                              =
   |
                     |      |                                              =
   (21) use of uninitialized value 'ptr[1]' here
   lib/stackinit_kunit.c:206:24: note: in expansion of macro 'DO_NOTHING_RE=
TURN_SCALAR'
                     |  206 |                 return DO_NOTHING_RETURN_ ## =
which(ptr + 1);    \
                     |      |                        ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
                     |  305 |                 DEFINE_TEST(name ## _ ## init=
, name, SCALAR,    \
                     |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
                     |  310 |                 DEFINE_SCALAR_TEST(u16, init,=
 xfail);           \
                     |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
                     |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
                     |      | ^~~~~~~~~~~~~~~~~~~
                     |
   lib/stackinit_kunit.c: In function 'do_nothing_u32_none':
>> lib/stackinit_kunit.c:51:49: warning: use of uninitialized value '*ptr' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      51 | #define DO_NOTHING_RETURN_SCALAR(ptr)           *(ptr)
         |                                                 ^~~~~~
   lib/stackinit_kunit.c:204:24: note: in expansion of macro 'DO_NOTHING_RE=
TURN_SCALAR'
     204 |                 return DO_NOTHING_RETURN_ ## which(ptr);        \
         |                        ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
     305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
     311 |                 DEFINE_SCALAR_TEST(u32, init, xfail);           \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_u32_none': event 1
       |
       |  149 | static noinline void test_ ## name (struct kunit *test)    =
     \
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) entry to 'test_u32_none'
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
       |  305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR=
,    \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
       |  311 |                 DEFINE_SCALAR_TEST(u32, init, xfail);      =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
     'test_u32_none': event 2
       |
       |  163 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 1=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (2) calling 'leaf_u32_none' from 'test_u3=
2_none'
       |  164 |                                 FETCH_ARG_ ## which(zero));=
     \
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
       |  305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR=
,    \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
       |  311 |                 DEFINE_SCALAR_TEST(u32, init, xfail);      =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
       +--> 'leaf_u32_none': event 3
              |
              |  208 | static noinline int leaf_ ## name(unsigned long sp, =
bool fill,  \
              |      |                     ^~~~~
              |      |                     |
              |      |                     (3) entry to 'leaf_u32_none'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  311 |                 DEFINE_SCALAR_TEST(u32, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u32_none': event 4
              |
              |  212 |         var_type var                                =
            \
              |      |                  ^~~
              |      |                  |
              |      |                  (4) region created on stack here
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  311 |                 DEFINE_SCALAR_TEST(u32, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u32_none': event 5
              |
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (5) following 'true' branch (when 'fill !=
=3D 0')...
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  311 |                 DEFINE_SCALAR_TEST(u32, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
--
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  311 |                 DEFINE_SCALAR_TEST(u32, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u32_none': event 17
              |
              |   56 |                 (var) =3D do_nothing_ ## name(&(var))
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (17) calling 'do_nothing_u32=
_none' from 'leaf_u32_none'
   lib/stackinit_kunit.c:232:9: note: in expansion of macro 'DO_NOTHING_CAL=
L_SCALAR'
              |  232 |         DO_NOTHING_CALL_ ## which(var, name);       =
            \
              |      |         ^~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  311 |                 DEFINE_SCALAR_TEST(u32, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
              +--> 'do_nothing_u32_none': event 18
                     |
                     |  200 | do_nothing_ ## name(var_type *ptr)           =
                   \
                     |      | ^~~~~~~~~~~
                     |      | |
                     |      | (18) entry to 'do_nothing_u32_none'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
                     |  305 |                 DEFINE_TEST(name ## _ ## init=
, name, SCALAR,    \
                     |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
                     |  311 |                 DEFINE_SCALAR_TEST(u32, init,=
 xfail);           \
                     |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
                     |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
                     |      | ^~~~~~~~~~~~~~~~~~~
                     |
                   'do_nothing_u32_none': event 19
                     |
                     |  203 |         if ((unsigned long)ptr > 0x2)        =
                   \
                     |      |            ^
                     |      |            |
                     |      |            (19) following 'false' branch...
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
                     |  305 |                 DEFINE_TEST(name ## _ ## init=
, name, SCALAR,    \
                     |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
                     |  311 |                 DEFINE_SCALAR_TEST(u32, init,=
 xfail);           \
                     |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
                     |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
                     |      | ^~~~~~~~~~~~~~~~~~~
                     |
                   'do_nothing_u32_none': event 20
                     |
                     |   51 | #define DO_NOTHING_RETURN_SCALAR(ptr)        =
   *(ptr)
                     |      |                                              =
   ^~~~~~
                     |      |                                              =
   |
                     |      |                                              =
   (20) ...to here
   lib/stackinit_kunit.c:206:24: note: in expansion of macro 'DO_NOTHING_RE=
TURN_SCALAR'
                     |  206 |                 return DO_NOTHING_RETURN_ ## =
which(ptr + 1);    \
                     |      |                        ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
                     |  305 |                 DEFINE_TEST(name ## _ ## init=
, name, SCALAR,    \
                     |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
                     |  311 |                 DEFINE_SCALAR_TEST(u32, init,=
 xfail);           \
                     |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
                     |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
                     |      | ^~~~~~~~~~~~~~~~~~~
                     |
                   'do_nothing_u32_none': event 21
                     |
                     |   51 | #define DO_NOTHING_RETURN_SCALAR(ptr)        =
   *(ptr)
                     |      |                                              =
   ^~~~~~
                     |      |                                              =
   |
                     |      |                                              =
   (21) use of uninitialized value 'ptr[1]' here
   lib/stackinit_kunit.c:206:24: note: in expansion of macro 'DO_NOTHING_RE=
TURN_SCALAR'
                     |  206 |                 return DO_NOTHING_RETURN_ ## =
which(ptr + 1);    \
                     |      |                        ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
                     |  305 |                 DEFINE_TEST(name ## _ ## init=
, name, SCALAR,    \
                     |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
                     |  311 |                 DEFINE_SCALAR_TEST(u32, init,=
 xfail);           \
                     |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
                     |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
                     |      | ^~~~~~~~~~~~~~~~~~~
                     |
   lib/stackinit_kunit.c: In function 'do_nothing_u64_none':
>> lib/stackinit_kunit.c:51:49: warning: use of uninitialized value '*ptr' =
[CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      51 | #define DO_NOTHING_RETURN_SCALAR(ptr)           *(ptr)
         |                                                 ^~~~~~
   lib/stackinit_kunit.c:204:24: note: in expansion of macro 'DO_NOTHING_RE=
TURN_SCALAR'
     204 |                 return DO_NOTHING_RETURN_ ## which(ptr);        \
         |                        ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
     305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:312:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
     312 |                 DEFINE_SCALAR_TEST(u64, init, xfail);           \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_u64_none': event 1
       |
       |  149 | static noinline void test_ ## name (struct kunit *test)    =
     \
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) entry to 'test_u64_none'
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
       |  305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR=
,    \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:312:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
       |  312 |                 DEFINE_SCALAR_TEST(u64, init, xfail);      =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
     'test_u64_none': event 2
       |
       |  163 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 1=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (2) calling 'leaf_u64_none' from 'test_u6=
4_none'
       |  164 |                                 FETCH_ARG_ ## which(zero));=
     \
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
       |  305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR=
,    \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:312:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
       |  312 |                 DEFINE_SCALAR_TEST(u64, init, xfail);      =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
       +--> 'leaf_u64_none': event 3
              |
              |  208 | static noinline int leaf_ ## name(unsigned long sp, =
bool fill,  \
              |      |                     ^~~~~
              |      |                     |
              |      |                     (3) entry to 'leaf_u64_none'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:312:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  312 |                 DEFINE_SCALAR_TEST(u64, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u64_none': event 4
              |
              |  212 |         var_type var                                =
            \
              |      |                  ^~~
              |      |                  |
              |      |                  (4) region created on stack here
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:312:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  312 |                 DEFINE_SCALAR_TEST(u64, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u64_none': event 5
              |
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (5) following 'true' branch (when 'fill !=
=3D 0')...
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:312:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  312 |                 DEFINE_SCALAR_TEST(u64, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);

vim +51 lib/stackinit_kunit.c

50ceaa95ea0970 lib/test_stackinit.c Kees Cook 2019-01-23  50  =

50ceaa95ea0970 lib/test_stackinit.c Kees Cook 2019-01-23 @51  #define DO_NO=
THING_RETURN_SCALAR(ptr)		*(ptr)
50ceaa95ea0970 lib/test_stackinit.c Kees Cook 2019-01-23  52  #define DO_NO=
THING_RETURN_STRING(ptr)		/**/
50ceaa95ea0970 lib/test_stackinit.c Kees Cook 2019-01-23  53  #define DO_NO=
THING_RETURN_STRUCT(ptr)		/**/
50ceaa95ea0970 lib/test_stackinit.c Kees Cook 2019-01-23  54  =


:::::: The code at line 51 was first introduced by commit
:::::: 50ceaa95ea09703722b30b4afa617c972071cd7f lib: Introduce test_stackin=
it module

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7218449923569664324==--

