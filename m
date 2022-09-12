Content-Type: multipart/mixed; boundary="===============3056670306532644883=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Mon, 12 Sep 2022 11:57:08 +0800
Message-ID: <202209121112.wPJkpDdH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3056670306532644883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: lib/stack=
init_kunit.c:152:13: warning: use of uninitialized value '<unknown>' [CWE-4=
57] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   80e78fcce86de0288793a0ef0f6acf37656ee4cf
commit: 02788ebcf521fe78c24eb221fd1ed7f86792c330 lib: stackinit: Convert to=
 KUnit
date:   6 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220906 (https://download.01.org/0day-ci/archi=
ve/20220912/202209121112.wPJkpDdH-lkp(a)intel.com/config)
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

gcc_analyzer warnings: (new ones prefixed by >>)
   lib/stackinit_kunit.c: In function 'test_u8_zero':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
     305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
     309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);            \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_u8_zero': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   In file included from lib/stackinit_kunit.c:14:
>> lib/stackinit_kunit.c:178:17: warning: dereferencing pointer 'target_sta=
rt' to within stale stack frame [-Wanalyzer-use-of-pointer-in-stale-stack-f=
rame]
     178 |                 range_contains(fill_start, fill_size,           \
   include/kunit/test.h:782:28: note: in definition of macro 'KUNIT_ASSERTI=
ON'
     782 |                            pass,                                =
               \
         |                            ^~~~
   include/kunit/test.h:830:9: note: in expansion of macro 'KUNIT_UNARY_ASS=
ERTION'
     830 |         KUNIT_UNARY_ASSERTION(test,                             =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1614:9: note: in expansion of macro 'KUNIT_TRUE_MSG=
_ASSERTION'
    1614 |         KUNIT_TRUE_MSG_ASSERTION(test,                          =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:177:9: note: in expansion of macro 'KUNIT_ASSERT_T=
RUE_MSG'
     177 |         KUNIT_ASSERT_TRUE_MSG(test,                             \
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
     305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
     309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);            \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_u8_zero': event 1
       |
       |  149 | static noinline void test_ ## name (struct kunit *test)    =
     \
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) entry to 'test_u8_zero'
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
     'test_u8_zero': event 2
       |
       |  163 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 1=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (2) calling 'leaf_u8_zero' from 'test_u8_=
zero'
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
       +--> 'leaf_u8_zero': event 3
              |
              |  208 | static noinline int leaf_ ## name(unsigned long sp, =
bool fill,  \
              |      |                     ^~~~~
              |      |                     |
              |      |                     (3) entry to 'leaf_u8_zero'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);=
            \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u8_zero': event 4
              |
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (4) following 'true' branch (when 'fill !=
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u8_zero': event 5
              |
              |  224 |                 fill_start =3D &var;                =
              \
--
              |      |                     ^~~~~
              |      |                     |
              |      |                     (10) entry to 'leaf_u8_zero'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);=
            \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u8_zero': event 11
              |
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (11) following 'false' branch (when 'fill=
 =3D=3D 0')...
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);=
            \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u8_zero': event 12
              |
              |   56 |                 (var) =3D do_nothing_ ## name(&(var))
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (12) ...to here
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'test_u8_zero': event 13
       |
       |  173 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 0=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (13) returning to 'test_u8_zero' from 'le=
af_u8_zero'
       |  174 |                                 FETCH_ARG_ ## which(zero));=
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
     'test_u8_zero': event 14
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
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
       |  305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR=
,    \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:309:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
       |  309 |                 DEFINE_SCALAR_TEST(u8, init, xfail);       =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_u16_zero':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
     305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
     310 |                 DEFINE_SCALAR_TEST(u16, init, xfail);           \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_u16_zero': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
>> lib/stackinit_kunit.c:178:17: warning: dereferencing pointer 'target_sta=
rt' to within stale stack frame [-Wanalyzer-use-of-pointer-in-stale-stack-f=
rame]
     178 |                 range_contains(fill_start, fill_size,           \
   include/kunit/test.h:782:28: note: in definition of macro 'KUNIT_ASSERTI=
ON'
     782 |                            pass,                                =
               \
         |                            ^~~~
   include/kunit/test.h:830:9: note: in expansion of macro 'KUNIT_UNARY_ASS=
ERTION'
     830 |         KUNIT_UNARY_ASSERTION(test,                             =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1614:9: note: in expansion of macro 'KUNIT_TRUE_MSG=
_ASSERTION'
    1614 |         KUNIT_TRUE_MSG_ASSERTION(test,                          =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:177:9: note: in expansion of macro 'KUNIT_ASSERT_T=
RUE_MSG'
     177 |         KUNIT_ASSERT_TRUE_MSG(test,                             \
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
     305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
     310 |                 DEFINE_SCALAR_TEST(u16, init, xfail);           \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_u16_zero': event 1
       |
       |  149 | static noinline void test_ ## name (struct kunit *test)    =
     \
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) entry to 'test_u16_zero'
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
     'test_u16_zero': event 2
       |
       |  163 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 1=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (2) calling 'leaf_u16_zero' from 'test_u1=
6_zero'
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
       +--> 'leaf_u16_zero': event 3
              |
              |  208 | static noinline int leaf_ ## name(unsigned long sp, =
bool fill,  \
              |      |                     ^~~~~
              |      |                     |
              |      |                     (3) entry to 'leaf_u16_zero'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  310 |                 DEFINE_SCALAR_TEST(u16, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u16_zero': event 4
              |
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (4) following 'true' branch (when 'fill !=
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u16_zero': event 5
              |
              |  224 |                 fill_start =3D &var;                =
              \
--
              |      |                     ^~~~~
              |      |                     |
              |      |                     (10) entry to 'leaf_u16_zero'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  310 |                 DEFINE_SCALAR_TEST(u16, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u16_zero': event 11
              |
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (11) following 'false' branch (when 'fill=
 =3D=3D 0')...
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  310 |                 DEFINE_SCALAR_TEST(u16, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u16_zero': event 12
              |
              |   56 |                 (var) =3D do_nothing_ ## name(&(var))
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (12) ...to here
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'test_u16_zero': event 13
       |
       |  173 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 0=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (13) returning to 'test_u16_zero' from 'l=
eaf_u16_zero'
       |  174 |                                 FETCH_ARG_ ## which(zero));=
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
     'test_u16_zero': event 14
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
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
       |  305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR=
,    \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:310:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
       |  310 |                 DEFINE_SCALAR_TEST(u16, init, xfail);      =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_u32_zero':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
     305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
     311 |                 DEFINE_SCALAR_TEST(u32, init, xfail);           \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_u32_zero': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
>> lib/stackinit_kunit.c:178:17: warning: dereferencing pointer 'target_sta=
rt' to within stale stack frame [-Wanalyzer-use-of-pointer-in-stale-stack-f=
rame]
     178 |                 range_contains(fill_start, fill_size,           \
   include/kunit/test.h:782:28: note: in definition of macro 'KUNIT_ASSERTI=
ON'
     782 |                            pass,                                =
               \
         |                            ^~~~
   include/kunit/test.h:830:9: note: in expansion of macro 'KUNIT_UNARY_ASS=
ERTION'
     830 |         KUNIT_UNARY_ASSERTION(test,                             =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1614:9: note: in expansion of macro 'KUNIT_TRUE_MSG=
_ASSERTION'
    1614 |         KUNIT_TRUE_MSG_ASSERTION(test,                          =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:177:9: note: in expansion of macro 'KUNIT_ASSERT_T=
RUE_MSG'
     177 |         KUNIT_ASSERT_TRUE_MSG(test,                             \
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
     305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
     311 |                 DEFINE_SCALAR_TEST(u32, init, xfail);           \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_u32_zero': event 1
       |
       |  149 | static noinline void test_ ## name (struct kunit *test)    =
     \
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) entry to 'test_u32_zero'
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
     'test_u32_zero': event 2
       |
       |  163 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 1=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (2) calling 'leaf_u32_zero' from 'test_u3=
2_zero'
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
       +--> 'leaf_u32_zero': event 3
              |
              |  208 | static noinline int leaf_ ## name(unsigned long sp, =
bool fill,  \
              |      |                     ^~~~~
              |      |                     |
              |      |                     (3) entry to 'leaf_u32_zero'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  311 |                 DEFINE_SCALAR_TEST(u32, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u32_zero': event 4
              |
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (4) following 'true' branch (when 'fill !=
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u32_zero': event 5
              |
              |  224 |                 fill_start =3D &var;                =
              \
--
              |      |                     ^~~~~
              |      |                     |
              |      |                     (10) entry to 'leaf_u32_zero'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  311 |                 DEFINE_SCALAR_TEST(u32, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u32_zero': event 11
              |
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (11) following 'false' branch (when 'fill=
 =3D=3D 0')...
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  311 |                 DEFINE_SCALAR_TEST(u32, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u32_zero': event 12
              |
              |   56 |                 (var) =3D do_nothing_ ## name(&(var))
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (12) ...to here
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'test_u32_zero': event 13
       |
       |  173 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 0=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (13) returning to 'test_u32_zero' from 'l=
eaf_u32_zero'
       |  174 |                                 FETCH_ARG_ ## which(zero));=
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
     'test_u32_zero': event 14
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
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
       |  305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR=
,    \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:311:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
       |  311 |                 DEFINE_SCALAR_TEST(u32, init, xfail);      =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_u64_zero':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
     305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:312:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
     312 |                 DEFINE_SCALAR_TEST(u64, init, xfail);           \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_u64_zero': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
>> lib/stackinit_kunit.c:178:17: warning: dereferencing pointer 'target_sta=
rt' to within stale stack frame [-Wanalyzer-use-of-pointer-in-stale-stack-f=
rame]
     178 |                 range_contains(fill_start, fill_size,           \
   include/kunit/test.h:782:28: note: in definition of macro 'KUNIT_ASSERTI=
ON'
     782 |                            pass,                                =
               \
         |                            ^~~~
   include/kunit/test.h:830:9: note: in expansion of macro 'KUNIT_UNARY_ASS=
ERTION'
     830 |         KUNIT_UNARY_ASSERTION(test,                             =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1614:9: note: in expansion of macro 'KUNIT_TRUE_MSG=
_ASSERTION'
    1614 |         KUNIT_TRUE_MSG_ASSERTION(test,                          =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:177:9: note: in expansion of macro 'KUNIT_ASSERT_T=
RUE_MSG'
     177 |         KUNIT_ASSERT_TRUE_MSG(test,                             \
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
     305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR,    \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:312:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
     312 |                 DEFINE_SCALAR_TEST(u64, init, xfail);           \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_u64_zero': event 1
       |
       |  149 | static noinline void test_ ## name (struct kunit *test)    =
     \
       |      |                      ^~~~~
       |      |                      |
       |      |                      (1) entry to 'test_u64_zero'
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
     'test_u64_zero': event 2
       |
       |  163 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 1=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (2) calling 'leaf_u64_zero' from 'test_u6=
4_zero'
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
       +--> 'leaf_u64_zero': event 3
              |
              |  208 | static noinline int leaf_ ## name(unsigned long sp, =
bool fill,  \
              |      |                     ^~~~~
              |      |                     |
              |      |                     (3) entry to 'leaf_u64_zero'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:312:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  312 |                 DEFINE_SCALAR_TEST(u64, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u64_zero': event 4
              |
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (4) following 'true' branch (when 'fill !=
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u64_zero': event 5
              |
              |  224 |                 fill_start =3D &var;                =
              \
--
              |      |                     ^~~~~
              |      |                     |
              |      |                     (10) entry to 'leaf_u64_zero'
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:312:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  312 |                 DEFINE_SCALAR_TEST(u64, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u64_zero': event 11
              |
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (11) following 'false' branch (when 'fill=
 =3D=3D 0')...
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:312:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  312 |                 DEFINE_SCALAR_TEST(u64, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u64_zero': event 12
              |
              |   56 |                 (var) =3D do_nothing_ ## name(&(var))
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (12) ...to here
   lib/stackinit_kunit.c:232:9: note: in expansion of macro 'DO_NOTHING_CAL=
L_SCALAR'
              |  232 |         DO_NOTHING_CALL_ ## which(var, name);       =
            \
              |      |         ^~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
              |  305 |                 DEFINE_TEST(name ## _ ## init, name,=
 SCALAR,    \
              |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:312:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
              |  312 |                 DEFINE_SCALAR_TEST(u64, init, xfail)=
;           \
              |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
              |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
              |      | ^~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'test_u64_zero': event 13
       |
       |  173 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 0=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (13) returning to 'test_u64_zero' from 'l=
eaf_u64_zero'
       |  174 |                                 FETCH_ARG_ ## which(zero));=
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
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
     'test_u64_zero': event 14
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
   lib/stackinit_kunit.c:305:17: note: in expansion of macro 'DEFINE_TEST'
       |  305 |                 DEFINE_TEST(name ## _ ## init, name, SCALAR=
,    \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:312:17: note: in expansion of macro 'DEFINE_SCALAR=
_TEST'
       |  312 |                 DEFINE_SCALAR_TEST(u64, init, xfail);      =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_char_array_zero':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:313:17: note: in expansion of macro 'DEFINE_TEST'
     313 |                 DEFINE_TEST(char_array_ ## init, unsigned char, \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_char_array_zero': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:313:17: note: in expansion of macro 'DEFINE_TEST'
       |  313 |                 DEFINE_TEST(char_array_ ## init, unsigned c=
har, \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:333:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  333 | DEFINE_SCALAR_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_small_hole_zero':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:334:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
     334 | DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_small_hole_zero': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail)=
;    \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:334:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
       |  334 | DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_big_hole_zero':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail);      \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:334:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
     334 | DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_big_hole_zero': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail); =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:334:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
       |  334 | DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_trailing_hole_zero':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfail); \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:334:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
     334 | DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_trailing_hole_zero': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:334:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
       |  334 | DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_packed_zero':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:334:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
     334 | DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_packed_zero': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:334:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
       |  334 | DEFINE_STRUCT_TESTS(zero, ALWAYS_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_small_hole_static_partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_small_hole_static_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail)=
;    \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_big_hole_static_partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail);      \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_big_hole_static_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail); =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_trailing_hole_static_partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfail); \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_trailing_hole_static_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_packed_static_partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_packed_static_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_small_hole_static_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_small_hole_static_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail)=
;    \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_big_hole_static_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail);      \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_big_hole_static_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail); =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_trailing_hole_static_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfail); \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_trailing_hole_static_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_packed_static_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_packed_static_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:336:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  336 | DEFINE_STRUCT_INITIALIZER_TESTS(static, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_small_hole_dynamic_partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_small_hole_dynamic_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail)=
;    \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_big_hole_dynamic_partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail);      \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_big_hole_dynamic_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail); =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_trailing_hole_dynamic_partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfail); \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_trailing_hole_dynamic_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_packed_dynamic_partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_packed_dynamic_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_small_hole_dynamic_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_small_hole_dynamic_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail)=
;    \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_big_hole_dynamic_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail);      \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_big_hole_dynamic_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail); =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_trailing_hole_dynamic_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfail); \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_trailing_hole_dynamic_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_packed_dynamic_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_packed_dynamic_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:337:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  337 | DEFINE_STRUCT_INITIALIZER_TESTS(dynamic, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_small_hole_runtime_partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_small_hole_runtime_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail)=
;    \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_big_hole_runtime_partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail);      \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_big_hole_runtime_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail); =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_trailing_hole_runtime_partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfail); \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_trailing_hole_runtime_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_packed_runtime_partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_packed_runtime_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_small_hole_runtime_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_small_hole_runtime_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail)=
;    \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_big_hole_runtime_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail);      \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_big_hole_runtime_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail); =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_trailing_hole_runtime_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfail); \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_trailing_hole_runtime_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_packed_runtime_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_packed_runtime_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:338:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  338 | DEFINE_STRUCT_INITIALIZER_TESTS(runtime, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_small_hole_assigned_static_part=
ial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_small_hole_assigned_static_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail)=
;    \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PAS=
S);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_big_hole_assigned_static_partia=
l':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail);      \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_big_hole_assigned_static_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail); =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PAS=
S);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_trailing_hole_assigned_static_p=
artial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfail); \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_trailing_hole_assigned_static_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PAS=
S);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_packed_assigned_static_partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_packed_assigned_static_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PAS=
S);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_small_hole_assigned_static_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_small_hole_assigned_static_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail)=
;    \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PAS=
S);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_big_hole_assigned_static_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail);      \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_big_hole_assigned_static_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail); =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PAS=
S);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_trailing_hole_assigned_static_a=
ll':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfail); \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_trailing_hole_assigned_static_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PAS=
S);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_packed_assigned_static_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_packed_assigned_static_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:339:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  339 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_static, STRONG_PAS=
S);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_small_hole_assigned_dynamic_par=
tial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_small_hole_assigned_dynamic_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail)=
;    \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PA=
SS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_big_hole_assigned_dynamic_parti=
al':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail);      \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_big_hole_assigned_dynamic_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail); =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PA=
SS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_trailing_hole_assigned_dynamic_=
partial':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfail); \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_trailing_hole_assigned_dynamic_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PA=
SS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_packed_assigned_dynamic_partial=
':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,       \
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_packed_assigned_dynamic_partial': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:328:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  328 |                 DEFINE_STRUCT_TESTS(base ## _ ## partial,  =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PA=
SS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_small_hole_assigned_dynamic_all=
':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_small_hole_assigned_dynamic_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail)=
;    \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PA=
SS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_big_hole_assigned_dynamic_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail);      \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_big_hole_assigned_dynamic_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail); =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PA=
SS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_trailing_hole_assigned_dynamic_=
all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfail); \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_trailing_hole_assigned_dynamic_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PA=
SS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_packed_assigned_dynamic_all':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
     330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
         |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
     340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'test_packed_assigned_dynamic_all': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:330:17: note: in expansion of macro 'DEFINE_STRUCT=
_TESTS'
       |  330 |                 DEFINE_STRUCT_TESTS(base ## _ ## all, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:340:1: note: in expansion of macro 'DEFINE_STRUCT_=
INITIALIZER_TESTS'
       |  340 | DEFINE_STRUCT_INITIALIZER_TESTS(assigned_dynamic, STRONG_PA=
SS);
       |      | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_small_hole_assigned_copy':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:341:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
     341 | DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
         | ^~~~~~~~~~~~~~~~~~~
     'test_small_hole_assigned_copy': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail)=
;    \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:341:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
       |  341 | DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_big_hole_assigned_copy':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail);      \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:341:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
     341 | DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
         | ^~~~~~~~~~~~~~~~~~~
     'test_big_hole_assigned_copy': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail); =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:341:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
       |  341 | DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_trailing_hole_assigned_copy':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfail); \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:341:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
     341 | DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
         | ^~~~~~~~~~~~~~~~~~~
     'test_trailing_hole_assigned_copy': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c: In function 'test_packed_assigned_copy':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:341:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
     341 | DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
         | ^~~~~~~~~~~~~~~~~~~
     'test_packed_assigned_copy': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:341:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
       |  341 | DEFINE_STRUCT_TESTS(assigned_copy, ALWAYS_FAIL);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'leaf_u8_none':
   lib/stackinit_kunit.c:212:18: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     212 |         var_type var                                            \
         |                  ^~~
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
     'leaf_u8_none': event 1
       |
       |  212 |         var_type var                                       =
     \
       |      |                  ^~~
       |      |                  |
       |      |                  (1) use of uninitialized value '<unknown>'=
 here
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
   lib/stackinit_kunit.c: In function 'test_u8_none':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
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
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
>> lib/stackinit_kunit.c:178:17: warning: dereferencing pointer 'target_sta=
rt' to within stale stack frame [-Wanalyzer-use-of-pointer-in-stale-stack-f=
rame]
     178 |                 range_contains(fill_start, fill_size,           \
   include/kunit/test.h:782:28: note: in definition of macro 'KUNIT_ASSERTI=
ON'
     782 |                            pass,                                =
               \
         |                            ^~~~
   include/kunit/test.h:830:9: note: in expansion of macro 'KUNIT_UNARY_ASS=
ERTION'
     830 |         KUNIT_UNARY_ASSERTION(test,                             =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1614:9: note: in expansion of macro 'KUNIT_TRUE_MSG=
_ASSERTION'
    1614 |         KUNIT_TRUE_MSG_ASSERTION(test,                          =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:177:9: note: in expansion of macro 'KUNIT_ASSERT_T=
RUE_MSG'
     177 |         KUNIT_ASSERT_TRUE_MSG(test,                             \
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
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
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (4) following 'true' branch (when 'fill !=
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
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u8_none': event 5
              |
              |  224 |                 fill_start =3D &var;                =
              \
--
            'leaf_u8_none': event 12
              |
              |   56 |                 (var) =3D do_nothing_ ## name(&(var))
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (12) ...to here
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
       <------+
       |
     'test_u8_none': event 13
       |
       |  173 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 0=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (13) returning to 'test_u8_none' from 'le=
af_u8_none'
       |  174 |                                 FETCH_ARG_ ## which(zero));=
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
     'test_u8_none': event 14
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
   lib/stackinit_kunit.c: In function 'leaf_u16_none':
   lib/stackinit_kunit.c:212:18: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     212 |         var_type var                                            \
         |                  ^~~
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
     'leaf_u16_none': event 1
       |
       |  212 |         var_type var                                       =
     \
       |      |                  ^~~
       |      |                  |
       |      |                  (1) use of uninitialized value '<unknown>'=
 here
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
   lib/stackinit_kunit.c: In function 'test_u16_none':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
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
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
>> lib/stackinit_kunit.c:178:17: warning: dereferencing pointer 'target_sta=
rt' to within stale stack frame [-Wanalyzer-use-of-pointer-in-stale-stack-f=
rame]
     178 |                 range_contains(fill_start, fill_size,           \
   include/kunit/test.h:782:28: note: in definition of macro 'KUNIT_ASSERTI=
ON'
     782 |                            pass,                                =
               \
         |                            ^~~~
   include/kunit/test.h:830:9: note: in expansion of macro 'KUNIT_UNARY_ASS=
ERTION'
     830 |         KUNIT_UNARY_ASSERTION(test,                             =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1614:9: note: in expansion of macro 'KUNIT_TRUE_MSG=
_ASSERTION'
    1614 |         KUNIT_TRUE_MSG_ASSERTION(test,                          =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:177:9: note: in expansion of macro 'KUNIT_ASSERT_T=
RUE_MSG'
     177 |         KUNIT_ASSERT_TRUE_MSG(test,                             \
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
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
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (4) following 'true' branch (when 'fill !=
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
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u16_none': event 5
              |
              |  224 |                 fill_start =3D &var;                =
              \
--
            'leaf_u16_none': event 12
              |
              |   56 |                 (var) =3D do_nothing_ ## name(&(var))
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (12) ...to here
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
       <------+
       |
     'test_u16_none': event 13
       |
       |  173 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 0=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (13) returning to 'test_u16_none' from 'l=
eaf_u16_none'
       |  174 |                                 FETCH_ARG_ ## which(zero));=
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
     'test_u16_none': event 14
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
   lib/stackinit_kunit.c: In function 'leaf_u32_none':
   lib/stackinit_kunit.c:212:18: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     212 |         var_type var                                            \
         |                  ^~~
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
     'leaf_u32_none': event 1
       |
       |  212 |         var_type var                                       =
     \
       |      |                  ^~~
       |      |                  |
       |      |                  (1) use of uninitialized value '<unknown>'=
 here
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
   lib/stackinit_kunit.c: In function 'test_u32_none':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
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
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
>> lib/stackinit_kunit.c:178:17: warning: dereferencing pointer 'target_sta=
rt' to within stale stack frame [-Wanalyzer-use-of-pointer-in-stale-stack-f=
rame]
     178 |                 range_contains(fill_start, fill_size,           \
   include/kunit/test.h:782:28: note: in definition of macro 'KUNIT_ASSERTI=
ON'
     782 |                            pass,                                =
               \
         |                            ^~~~
   include/kunit/test.h:830:9: note: in expansion of macro 'KUNIT_UNARY_ASS=
ERTION'
     830 |         KUNIT_UNARY_ASSERTION(test,                             =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1614:9: note: in expansion of macro 'KUNIT_TRUE_MSG=
_ASSERTION'
    1614 |         KUNIT_TRUE_MSG_ASSERTION(test,                          =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:177:9: note: in expansion of macro 'KUNIT_ASSERT_T=
RUE_MSG'
     177 |         KUNIT_ASSERT_TRUE_MSG(test,                             \
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
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
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (4) following 'true' branch (when 'fill !=
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
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u32_none': event 5
              |
              |  224 |                 fill_start =3D &var;                =
              \
--
            'leaf_u32_none': event 12
              |
              |   56 |                 (var) =3D do_nothing_ ## name(&(var))
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (12) ...to here
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
       <------+
       |
     'test_u32_none': event 13
       |
       |  173 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 0=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (13) returning to 'test_u32_none' from 'l=
eaf_u32_none'
       |  174 |                                 FETCH_ARG_ ## which(zero));=
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
     'test_u32_none': event 14
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
   lib/stackinit_kunit.c: In function 'leaf_u64_none':
   lib/stackinit_kunit.c:212:18: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     212 |         var_type var                                            \
         |                  ^~~
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
     'leaf_u64_none': event 1
       |
       |  212 |         var_type var                                       =
     \
       |      |                  ^~~
       |      |                  |
       |      |                  (1) use of uninitialized value '<unknown>'=
 here
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
   lib/stackinit_kunit.c: In function 'test_u64_none':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
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
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
>> lib/stackinit_kunit.c:178:17: warning: dereferencing pointer 'target_sta=
rt' to within stale stack frame [-Wanalyzer-use-of-pointer-in-stale-stack-f=
rame]
     178 |                 range_contains(fill_start, fill_size,           \
   include/kunit/test.h:782:28: note: in definition of macro 'KUNIT_ASSERTI=
ON'
     782 |                            pass,                                =
               \
         |                            ^~~~
   include/kunit/test.h:830:9: note: in expansion of macro 'KUNIT_UNARY_ASS=
ERTION'
     830 |         KUNIT_UNARY_ASSERTION(test,                             =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1614:9: note: in expansion of macro 'KUNIT_TRUE_MSG=
_ASSERTION'
    1614 |         KUNIT_TRUE_MSG_ASSERTION(test,                          =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:177:9: note: in expansion of macro 'KUNIT_ASSERT_T=
RUE_MSG'
     177 |         KUNIT_ASSERT_TRUE_MSG(test,                             \
         |         ^~~~~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
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
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (4) following 'true' branch (when 'fill !=
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
              |      | ^~~~~~~~~~~~~~~~~~~
              |
            'leaf_u64_none': event 5
              |
              |  224 |                 fill_start =3D &var;                =
              \
--
              |      |                     ^~~~~
              |      |                     |
              |      |                     (10) entry to 'leaf_u64_none'
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
            'leaf_u64_none': event 11
              |
              |  223 |         if (fill) {                                 =
            \
              |      |            ^
              |      |            |
              |      |            (11) following 'false' branch (when 'fill=
 =3D=3D 0')...
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
            'leaf_u64_none': event 12
              |
              |   56 |                 (var) =3D do_nothing_ ## name(&(var))
              |      |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~
              |      |                         |
              |      |                         (12) ...to here
   lib/stackinit_kunit.c:232:9: note: in expansion of macro 'DO_NOTHING_CAL=
L_SCALAR'
              |  232 |         DO_NOTHING_CALL_ ## which(var, name);       =
            \
              |      |         ^~~~~~~~~~~~~~~~
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
       <------+
       |
     'test_u64_none': event 13
       |
       |  173 |         ignored =3D leaf_ ##name((unsigned long)&ignored, 0=
,      \
       |      |                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                   |
       |      |                   (13) returning to 'test_u64_none' from 'l=
eaf_u64_none'
       |  174 |                                 FETCH_ARG_ ## which(zero));=
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
     'test_u64_none': event 14
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
   lib/stackinit_kunit.c: In function 'test_char_array_none':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:313:17: note: in expansion of macro 'DEFINE_TEST'
     313 |                 DEFINE_TEST(char_array_ ## init, unsigned char, \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
     343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_char_array_none': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:313:17: note: in expansion of macro 'DEFINE_TEST'
       |  313 |                 DEFINE_TEST(char_array_ ## init, unsigned c=
har, \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:343:1: note: in expansion of macro 'DEFINE_SCALAR_=
TESTS'
       |  343 | DEFINE_SCALAR_TESTS(none, STRONG_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_small_hole_none':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail);    \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:344:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
     344 | DEFINE_STRUCT_TESTS(none, BYREF_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_small_hole_none': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:322:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  322 |                 DEFINE_STRUCT_TEST(small_hole, init, xfail)=
;    \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:344:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
       |  344 | DEFINE_STRUCT_TESTS(none, BYREF_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_big_hole_none':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail);      \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:344:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
     344 | DEFINE_STRUCT_TESTS(none, BYREF_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_big_hole_none': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:323:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  323 |                 DEFINE_STRUCT_TEST(big_hole, init, xfail); =
     \
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:344:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
       |  344 | DEFINE_STRUCT_TESTS(none, BYREF_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_trailing_hole_none':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:324:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     324 |                 DEFINE_STRUCT_TEST(trailing_hole, init, xfail); \
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:344:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
     344 | DEFINE_STRUCT_TESTS(none, BYREF_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_trailing_hole_none': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
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
   lib/stackinit_kunit.c:344:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
       |  344 | DEFINE_STRUCT_TESTS(none, BYREF_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_packed_none':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
     317 |                 DEFINE_TEST(name ## _ ## init,                  \
         |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
     325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
         |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:344:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
     344 | DEFINE_STRUCT_TESTS(none, BYREF_PASS);
         | ^~~~~~~~~~~~~~~~~~~
     'test_packed_none': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:317:17: note: in expansion of macro 'DEFINE_TEST'
       |  317 |                 DEFINE_TEST(name ## _ ## init,             =
     \
       |      |                 ^~~~~~~~~~~
   lib/stackinit_kunit.c:325:17: note: in expansion of macro 'DEFINE_STRUCT=
_TEST'
       |  325 |                 DEFINE_STRUCT_TEST(packed, init, xfail)
       |      |                 ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:344:1: note: in expansion of macro 'DEFINE_STRUCT_=
TESTS'
       |  344 | DEFINE_STRUCT_TESTS(none, BYREF_PASS);
       |      | ^~~~~~~~~~~~~~~~~~~
       |
   lib/stackinit_kunit.c: In function 'test_user':
>> lib/stackinit_kunit.c:152:13: warning: use of uninitialized value '<unkn=
own>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     152 |         int ignored;                                            \
         |             ^~~~~~~
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
     239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
         | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:346:1: note: in expansion of macro 'DEFINE_TEST'
     346 | DEFINE_TEST(user, struct test_user, STRUCT, none, USER_PASS);
         | ^~~~~~~~~~~
     'test_user': event 1
       |
       |  152 |         int ignored;                                       =
     \
       |      |             ^~~~~~~
       |      |             |
       |      |             (1) use of uninitialized value '<unknown>' here
   lib/stackinit_kunit.c:239:1: note: in expansion of macro 'DEFINE_TEST_DR=
IVER'
       |  239 | DEFINE_TEST_DRIVER(name, var_type, which, xfail)
       |      | ^~~~~~~~~~~~~~~~~~
   lib/stackinit_kunit.c:346:1: note: in expansion of macro 'DEFINE_TEST'
       |  346 | DEFINE_TEST(user, struct test_user, STRUCT, none, USER_PASS=
);
       |      | ^~~~~~~~~~~
       |

vim +152 lib/stackinit_kunit.c

a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23   95  =

a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23   96  =

a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23   97  #define __s=
tatic_partial		{ .two =3D 0, }
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23   98  #define __s=
tatic_all			{ .one =3D 0,			\
f9398f15605a50 lib/test_stackinit.c  Kees Cook 2021-07-23   99  					  .two=
 =3D 0,			\
f9398f15605a50 lib/test_stackinit.c  Kees Cook 2021-07-23  100  					  .thr=
ee =3D 0,			\
f9398f15605a50 lib/test_stackinit.c  Kees Cook 2021-07-23  101  					  .fou=
r =3D 0,			\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  102  					}
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  103  #define __d=
ynamic_partial		{ .two =3D arg->two, }
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  104  #define __d=
ynamic_all			{ .one =3D arg->one,		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  105  					  .two=
 =3D arg->two,		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  106  					  .thr=
ee =3D arg->three,		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  107  					  .fou=
r =3D arg->four,		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  108  					}
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  109  #define __r=
untime_partial		var.two =3D 0
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  110  #define __r=
untime_all			var.one =3D 0;			\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  111  					var.tw=
o =3D 0;			\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  112  					var.th=
ree =3D 0;			\
f9398f15605a50 lib/test_stackinit.c  Kees Cook 2021-07-23  113  					var.fo=
ur =3D 0
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  114  =

a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  115  #define INI=
T_STRUCT_static_partial(var_type)				\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  116  					=3D __=
static_partial
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  117  #define INI=
T_STRUCT_static_all(var_type)				\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  118  					=3D __=
static_all
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  119  #define INI=
T_STRUCT_dynamic_partial(var_type)				\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  120  					=3D __=
dynamic_partial
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  121  #define INI=
T_STRUCT_dynamic_all(var_type)				\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  122  					=3D __=
dynamic_all
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  123  #define INI=
T_STRUCT_runtime_partial(var_type)				\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  124  					; __ru=
ntime_partial
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  125  #define INI=
T_STRUCT_runtime_all(var_type)				\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  126  					; __ru=
ntime_all
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  127  =

a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  128  #define INI=
T_STRUCT_assigned_static_partial(var_type)			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  129  					; var =
=3D (var_type)__static_partial
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  130  #define INI=
T_STRUCT_assigned_static_all(var_type)			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  131  					; var =
=3D (var_type)__static_all
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  132  #define INI=
T_STRUCT_assigned_dynamic_partial(var_type)			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  133  					; var =
=3D (var_type)__dynamic_partial
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  134  #define INI=
T_STRUCT_assigned_dynamic_all(var_type)			\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  135  					; var =
=3D (var_type)__dynamic_all
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  136  =

a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  137  #define INI=
T_STRUCT_assigned_copy(var_type)				\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  138  					; var =
=3D *(arg)
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  139  =

50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  140  /*
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  141   * @name: u=
nique string name for the test
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  142   * @var_typ=
e: type to be tested for zeroing initialization
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  143   * @which: =
is this a SCALAR, STRING, or STRUCT type?
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  144   * @init_le=
vel: what kind of initialization is performed
9cf016e6b49b53 lib/test_stackinit.c  Kees Cook 2020-04-06  145   * @xfail: =
is this test expected to fail?
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  146   */
9cf016e6b49b53 lib/test_stackinit.c  Kees Cook 2020-04-06  147  #define DEF=
INE_TEST_DRIVER(name, var_type, which, xfail)	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  148  /* Returns =
0 on success, 1 on failure. */			\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  149  static noin=
line void test_ ## name (struct kunit *test)		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  150  {								\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  151  	var_type z=
ero INIT_CLONE_ ## which;			\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23 @152  	int ignore=
d;						\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  153  	u8 sum =3D=
 0, i;						\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  154  								\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  155  	/* Notice =
when a new test is larger than expected. */	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  156  	BUILD_BUG_=
ON(sizeof(zero) > MAX_VAR_SIZE);		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  157  								\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  158  	/* Fill cl=
one type with zero for per-field init. */	\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  159  	ZERO_CLONE=
_ ## which(zero);				\
8c30d32b1a326b lib/test_stackinit.c  Kees Cook 2019-06-04  160  	/* Clear e=
ntire check buffer for 0xFF overlap test. */	\
8c30d32b1a326b lib/test_stackinit.c  Kees Cook 2019-06-04  161  	memset(che=
ck_buf, 0x00, sizeof(check_buf));		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  162  	/* Fill st=
ack with 0xFF. */				\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  163  	ignored =
=3D leaf_ ##name((unsigned long)&ignored, 1,	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  164  				FETCH_A=
RG_ ## which(zero));	\
8c30d32b1a326b lib/test_stackinit.c  Kees Cook 2019-06-04  165  	/* Verify =
all bytes overwritten with 0xFF. */		\
8c30d32b1a326b lib/test_stackinit.c  Kees Cook 2019-06-04  166  	for (sum =
=3D 0, i =3D 0; i < target_size; i++)		\
8c30d32b1a326b lib/test_stackinit.c  Kees Cook 2019-06-04  167  		sum +=3D =
(check_buf[i] !=3D 0xFF);			\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  168  	KUNIT_ASSE=
RT_EQ_MSG(test, sum, 0,			\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  169  			    "lea=
f fill was not 0xFF!?\n");	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  170  	/* Clear e=
ntire check buffer for later bit tests. */	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  171  	memset(che=
ck_buf, 0x00, sizeof(check_buf));		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  172  	/* Extract=
 stack-defined variable contents. */		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  173  	ignored =
=3D leaf_ ##name((unsigned long)&ignored, 0,	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  174  				FETCH_A=
RG_ ## which(zero));	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  175  								\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  176  	/* Validat=
e that compiler lined up fill and target. */	\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  177  	KUNIT_ASSE=
RT_TRUE_MSG(test,				\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16 @178  		range_con=
tains(fill_start, fill_size,		\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  179  			    targ=
et_start, target_size),		\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  180  		"stack fi=
ll missed target!? "			\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  181  		"(fill %z=
u wide, target offset by %d)\n",	\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  182  		fill_size=
,					\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  183  		(int)((ss=
ize_t)(uintptr_t)fill_start -		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  184  		      (ss=
ize_t)(uintptr_t)target_start));	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  185  								\
8c30d32b1a326b lib/test_stackinit.c  Kees Cook 2019-06-04  186  	/* Look fo=
r any bytes still 0xFF in check region. */	\
8c30d32b1a326b lib/test_stackinit.c  Kees Cook 2019-06-04  187  	for (sum =
=3D 0, i =3D 0; i < target_size; i++)		\
8c30d32b1a326b lib/test_stackinit.c  Kees Cook 2019-06-04  188  		sum +=3D =
(check_buf[i] =3D=3D 0xFF);			\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  189  								\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  190  	if (sum !=
=3D 0 && xfail)					\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  191  		kunit_ski=
p(test,				\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  192  			   "XFAI=
L uninit bytes: %d\n",		\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  193  			   sum);=
				\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  194  	KUNIT_ASSE=
RT_EQ_MSG(test, sum, 0,			\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  195  		"uninit b=
ytes: %d\n", sum);			\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  196  }
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  197  #define DEF=
INE_TEST(name, var_type, which, init_level, xfail)	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  198  /* no-op to=
 force compiler into ignoring "uninitialized" vars */\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  199  static noin=
line DO_NOTHING_TYPE_ ## which(var_type)		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  200  do_nothing_=
 ## name(var_type *ptr)				\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  201  {								\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  202  	/* Will al=
ways be true, but compiler doesn't know. */	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  203  	if ((unsig=
ned long)ptr > 0x2)				\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  204  		return DO=
_NOTHING_RETURN_ ## which(ptr);	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  205  	else						=
	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  206  		return DO=
_NOTHING_RETURN_ ## which(ptr + 1);	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  207  }								\
02788ebcf521fe lib/stackinit_kunit.c Kees Cook 2022-02-16  208  static noin=
line int leaf_ ## name(unsigned long sp, bool fill,	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  209  				  var_t=
ype *arg)		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  210  {								\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  211  	char buf[V=
AR_BUFFER];					\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  212  	var_type v=
ar						\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  213  		INIT_ ## =
which ## _ ## init_level(var_type);	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  214  								\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  215  	target_sta=
rt =3D &var;					\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  216  	target_siz=
e =3D sizeof(var);				\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  217  	/*							\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  218  	 * Keep th=
is buffer around to make sure we've got a	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  219  	 * stack f=
rame of SOME kind...				\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  220  	 */							\
8c30d32b1a326b lib/test_stackinit.c  Kees Cook 2019-06-04  221  	memset(buf=
, (char)(sp & 0xff), sizeof(buf));		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  222  	/* Fill va=
riable with 0xFF. */				\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  223  	if (fill) =
{						\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  224  		fill_star=
t =3D &var;				\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  225  		fill_size=
 =3D sizeof(var);			\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  226  		memset(fi=
ll_start,				\
8c30d32b1a326b lib/test_stackinit.c  Kees Cook 2019-06-04  227  		       (c=
har)((sp & 0xff) | forced_mask),	\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  228  		       fi=
ll_size);				\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  229  	}							\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  230  								\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  231  	/* Silence=
 "never initialized" warnings. */		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  232  	DO_NOTHING=
_CALL_ ## which(var, name);			\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  233  								\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  234  	/* Exfiltr=
ate "var". */					\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  235  	memcpy(che=
ck_buf, target_start, target_size);		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  236  								\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  237  	return (in=
t)buf[0] | (int)buf[sizeof(buf) - 1];		\
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  238  }								\
a8fc576d4af2f2 lib/test_stackinit.c  Kees Cook 2021-07-23  239  DEFINE_TEST=
_DRIVER(name, var_type, which, xfail)
50ceaa95ea0970 lib/test_stackinit.c  Kees Cook 2019-01-23  240  =


:::::: The code at line 152 was first introduced by commit
:::::: 50ceaa95ea09703722b30b4afa617c972071cd7f lib: Introduce test_stackin=
it module

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3056670306532644883==--

