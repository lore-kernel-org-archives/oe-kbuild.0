Content-Type: multipart/mixed; boundary="===============8296259857267293121=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/kunit/test.h:1281:21: warning: dereference of NULL 'filtered' [CWE-476]
Date: Tue, 14 Jun 2022 18:35:42 +0800
Message-ID: <202206141840.xuQNzSm7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8296259857267293121==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/kunit/test.h:1281:21: warning: dereference of NULL 'filtered' [CWE=
-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Daniel Latypov <dlatypov@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: David Gow <davidgow@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3
commit: 1d71307a6f94df3750f8f884545a769e227172fe kunit: add unit test for f=
iltering suites by names
date:   12 months ago
:::::: branch date: 35 hours ago
:::::: commit date: 12 months ago
config: arm-randconfig-c002-20220613 (https://download.01.org/0day-ci/archi=
ve/20220614/202206141840.xuQNzSm7-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D1d71307a6f94df3750f8f884545a769e227172fe
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 1d71307a6f94df3750f8f884545a769e227172fe
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from lib/kunit/executor.c:4:
   In function 'filter_subsuite_test':
>> include/kunit/test.h:1281:21: warning: dereference of NULL 'filtered' [C=
WE-476] [-Wanalyzer-null-dereference]
    1281 |         typeof(ptr) __ptr =3D (ptr);                            =
                 \
         |                     ^~~~~
   include/kunit/test.h:1295:9: note: in expansion of macro 'KUNIT_PTR_NOT_=
ERR_OR_NULL_MSG_ASSERTION'
    1295 |         KUNIT_PTR_NOT_ERR_OR_NULL_MSG_ASSERTION(test,           =
               \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:1854:9: note: in expansion of macro 'KUNIT_PTR_NOT_=
ERR_OR_NULL_ASSERTION'
    1854 |         KUNIT_PTR_NOT_ERR_OR_NULL_ASSERTION(test, KUNIT_ASSERTIO=
N, ptr)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   lib/kunit/executor_test.c:28:9: note: in expansion of macro 'KUNIT_ASSER=
T_NOT_ERR_OR_NULL'
      28 |         KUNIT_ASSERT_NOT_ERR_OR_NULL(test, filtered[0]);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
     'filter_subsuite_test': events 1-2
       |
       |   15 | static void filter_subsuite_test(struct kunit *test)
       |      |             ^~~~~~~~~~~~~~~~~~~~
       |      |             |
       |      |             (1) entry to 'filter_subsuite_test'
       |......
       |   20 |         subsuite[0] =3D alloc_fake_suite(test, "suite1");
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (2) calling 'alloc_fake_suite' from '=
filter_subsuite_test'
       |
       +--> 'alloc_fake_suite': event 3
              |
              |  123 | static struct kunit_suite *alloc_fake_suite(struct k=
unit *test,
              |      |                            ^~~~~~~~~~~~~~~~
              |      |                            |
              |      |                            (3) entry to 'alloc_fake_=
suite'
              |
            'alloc_fake_suite': event 4
              |
              |include/linux/fortify-string.h:36:12:
              |   36 |         if (p_size < size)
              |      |            ^
              |      |            |
              |      |            (4) following 'false' branch...
              |
            'alloc_fake_suite': event 5
              |
              |   27 | #define __underlying_strncpy    __builtin_strncpy
              |      |                                 ^
              |      |                                 |
              |      |                                 (5) ...to here
   include/linux/fortify-string.h:38:16: note: in expansion of macro '__und=
erlying_strncpy'
              |   38 |         return __underlying_strncpy(p, q, size);
              |      |                ^~~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'filter_subsuite_test': events 6-7
       |
       |lib/kunit/executor_test.c:20:23:
       |   20 |         subsuite[0] =3D alloc_fake_suite(test, "suite1");
       |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (6) returning to 'filter_subsuite_tes=
t' from 'alloc_fake_suite'
       |   21 |         subsuite[1] =3D alloc_fake_suite(test, "suite2");
       |      |                       ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (7) calling 'alloc_fake_suite' from '=
filter_subsuite_test'
       |
       +--> 'alloc_fake_suite': event 8
              |
              |  123 | static struct kunit_suite *alloc_fake_suite(struct k=
unit *test,
              |      |                            ^~~~~~~~~~~~~~~~
              |      |                            |
              |      |                            (8) entry to 'alloc_fake_=
suite'
              |
            'alloc_fake_suite': event 9
              |
              |include/linux/fortify-string.h:36:12:
              |   36 |         if (p_size < size)
              |      |            ^
              |      |            |
              |      |            (9) following 'false' branch...
              |
            'alloc_fake_suite': event 10
              |
              |   27 | #define __underlying_strncpy    __builtin_strncpy
              |      |                                 ^
              |      |                                 |
              |      |                                 (10) ...to here
   include/linux/fortify-string.h:38:16: note: in expansion of macro '__und=
erlying_strncpy'
              |   38 |         return __underlying_strncpy(p, q, size);
              |      |                ^~~~~~~~~~~~~~~~~~~~
              |
       <------+
       |
     'filter_subsuite_test': events 11-12
       |
       |lib/kunit/executor_test.c:21:23:
       |   21 |         subsuite[1] =3D alloc_fake_suite(test, "suite2");
       |      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (11) returning to 'filter_subsuite_te=
st' from 'alloc_fake_suite'
       |......
       |   24 |         filtered =3D kunit_filter_subsuite(subsuite, "suite=
2*");
       |      |                    ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~
       |      |                    |

vim +/filtered +1281 include/kunit/test.h

73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1236  =

73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1237  #define KUNIT_BINARY_STR_=
EQ_MSG_ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1238  					  assert_type,			   =
    \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1239  					  left,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1240  					  right,			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1241  					  fmt,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1242  					  ...)				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1243  	KUNIT_BINARY_STR_ASSERTI=
ON(test,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1244  				   assert_type,				  =
     \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1245  				   left, =3D=3D, righ=
t,			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1246  				   fmt,					       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1247  				   ##__VA_ARGS__)
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1248  =

73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1249  #define KUNIT_BINARY_STR_=
EQ_ASSERTION(test, assert_type, left, right)	       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1250  	KUNIT_BINARY_STR_EQ_MSG_=
ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1251  					  assert_type,			   =
    \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1252  					  left,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1253  					  right,			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1254  					  NULL)
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1255  =

73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1256  #define KUNIT_BINARY_STR_=
NE_MSG_ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1257  					  assert_type,			   =
    \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1258  					  left,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1259  					  right,			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1260  					  fmt,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1261  					  ...)				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1262  	KUNIT_BINARY_STR_ASSERTI=
ON(test,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1263  				   assert_type,				  =
     \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1264  				   left, !=3D, right,=
			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1265  				   fmt,					       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1266  				   ##__VA_ARGS__)
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1267  =

73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1268  #define KUNIT_BINARY_STR_=
NE_ASSERTION(test, assert_type, left, right)	       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1269  	KUNIT_BINARY_STR_NE_MSG_=
ASSERTION(test,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1270  					  assert_type,			   =
    \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1271  					  left,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1272  					  right,			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1273  					  NULL)
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1274  =

73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1275  #define KUNIT_PTR_NOT_ERR=
_OR_NULL_MSG_ASSERTION(test,			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1276  						assert_type,		     =
  \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1277  						ptr,			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1278  						fmt,			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1279  						...)			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1280  do {									       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23 @1281  	typeof(ptr) __ptr =3D (p=
tr);					       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1282  									       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1283  	KUNIT_ASSERTION(test,			=
			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1284  			!IS_ERR_OR_NULL(__ptr)=
,				       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1285  			kunit_ptr_not_err_asse=
rt,			       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1286  			KUNIT_INIT_PTR_NOT_ERR=
_STRUCT(test,		       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1287  						      assert_type,	=
       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1288  						      #ptr,		      =
 \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1289  						      __ptr),		    =
   \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1290  			fmt,						       \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1291  			##__VA_ARGS__);					  =
     \
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1292  } while (0)
73cda7bb8bfb1d4 Brendan Higgins 2019-09-23  1293  =


:::::: The code@line 1281 was first introduced by commit
:::::: 73cda7bb8bfb1d4be0325d76172950ede1a65fd0 kunit: test: add the concep=
t of expectations

:::::: TO: Brendan Higgins <brendanhiggins@google.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8296259857267293121==--

