Content-Type: multipart/mixed; boundary="===============1262246541353983921=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/thunderbolt/test.c:1670:2: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Sun, 27 Feb 2022 07:29:37 +0800
Message-ID: <202202270725.koiIGHGf-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1262246541353983921==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Mika Westerberg <mika.westerberg@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9137eda53752ef73148e42b0d7640a00f1bc96b1
commit: 15a4c7e8f916f4826b0bb541663798af3a1294bd thunderbolt: Add KUnit tes=
ts for XDomain properties
date:   12 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 12 months ago
config: i386-randconfig-c001-20220221 (https://download.01.org/0day-ci/arch=
ive/20220227/202202270725.koiIGHGf-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D15a4c7e8f916f4826b0bb541663798af3a1294bd
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 15a4c7e8f916f4826b0bb541663798af3a1294bd
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Di386 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   include/kunit/test.h:774:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
                                       ...)                                =
       \
                                                                           =
       ^
   drivers/thunderbolt/test.c:1510:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_EXPECT_PTR_EQ(test, tunnel1->paths[1]->hops[1].out_port, d=
own);
           ^
   include/kunit/test.h:1286:2: note: expanded from macro 'KUNIT_EXPECT_PTR=
_EQ'
           KUNIT_BINARY_PTR_EQ_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:923:2: note: expanded from macro 'KUNIT_BINARY_PTR_=
EQ_ASSERTION'
           KUNIT_BINARY_PTR_EQ_MSG_ASSERTION(test,                         =
       \
           ^
   include/kunit/test.h:913:2: note: expanded from macro 'KUNIT_BINARY_PTR_=
EQ_MSG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:780:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1510:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_EXPECT_PTR_EQ(test, tunnel1->paths[1]->hops[1].out_port, d=
own);
           ^
   include/kunit/test.h:1286:2: note: expanded from macro 'KUNIT_EXPECT_PTR=
_EQ'
           KUNIT_BINARY_PTR_EQ_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:923:2: note: expanded from macro 'KUNIT_BINARY_PTR_=
EQ_ASSERTION'
           KUNIT_BINARY_PTR_EQ_MSG_ASSERTION(test,                         =
       \
           ^
   include/kunit/test.h:913:2: note: expanded from macro 'KUNIT_BINARY_PTR_=
EQ_MSG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:774:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
                                       ...)                                =
       \
                                                                           =
       ^
   drivers/thunderbolt/test.c:1514:2: note: Value assigned to 'tunnel2'
           tunnel2 =3D tb_tunnel_alloc_usb3(NULL, up, down, 0, 0);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/test.c:1515:26: note: Assuming 'tunnel2' is equal to=
 null
           KUNIT_ASSERT_TRUE(test, tunnel2 !=3D NULL);
                                   ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1515:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_ASSERT_TRUE(test, tunnel2 !=3D NULL);
           ^
   include/kunit/test.h:1513:2: note: expanded from macro 'KUNIT_ASSERT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1516:2: note: Access to field 'type' results =
in a dereference of a null pointer (loaded from variable 'tunnel2')
           KUNIT_EXPECT_EQ(test, tunnel2->type, (enum tb_tunnel_type)TB_TUN=
NEL_USB3);
           ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^                                                  ~~~~
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:776:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           typeof(left) __left =3D (left);                                 =
         \
                                 ^~~~~
>> drivers/thunderbolt/test.c:1670:2: warning: Dereference of null pointer =
[clang-analyzer-core.NullDereference]
           KUNIT_EXPECT_STREQ(test, p->value.text, "Apple Inc.");
           ^
   include/kunit/test.h:1446:2: note: expanded from macro 'KUNIT_EXPECT_STR=
EQ'
           KUNIT_BINARY_STR_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, rig=
ht)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   include/kunit/test.h:1162:2: note: expanded from macro 'KUNIT_BINARY_STR=
_EQ_ASSERTION'
           KUNIT_BINARY_STR_EQ_MSG_ASSERTION(test,                         =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:1155:2: note: expanded from macro 'KUNIT_BINARY_STR=
_EQ_MSG_ASSERTION'
           KUNIT_BINARY_STR_ASSERTION(test,                                =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:1132:24: note: expanded from macro 'KUNIT_BINARY_ST=
R_ASSERTION'
           typeof(left) __left =3D (left);                                 =
         \
                                 ^~~~~~
   drivers/thunderbolt/test.c:1663:26: note: Assuming 'dir' is equal to null
           KUNIT_ASSERT_TRUE(test, dir !=3D NULL);
                                   ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1663:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_ASSERT_TRUE(test, dir !=3D NULL);
           ^
   include/kunit/test.h:1513:2: note: expanded from macro 'KUNIT_ASSERT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1666:26: note: Assuming 'p' is non-null
           KUNIT_ASSERT_TRUE(test, !p);
                                   ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
                                                       ^~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
                                                       ^~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
                                 ^~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
                              ^~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1666:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_ASSERT_TRUE(test, !p);
           ^
   include/kunit/test.h:1513:2: note: expanded from macro 'KUNIT_ASSERT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1668:2: note: Value assigned to 'p'
           p =3D tb_property_find(dir, "vendorid", TB_PROPERTY_TYPE_TEXT);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/test.c:1669:26: note: Assuming 'p' is equal to null
           KUNIT_ASSERT_TRUE(test, p !=3D NULL);
                                   ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
--
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1703:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_EXPECT_EQ(test, p->value.immediate, (u32)0x1);
           ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:780:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1703:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_EXPECT_EQ(test, p->value.immediate, (u32)0x1);
           ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:774:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
                                       ...)                                =
       \
                                                                           =
       ^
   drivers/thunderbolt/test.c:1705:2: note: Value assigned to 'p'
           p =3D tb_property_find(network_dir, "prtcstns", TB_PROPERTY_TYPE=
_VALUE);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/thunderbolt/test.c:1706:26: note: Assuming 'p' is equal to null
           KUNIT_ASSERT_TRUE(test, p !=3D NULL);
                                   ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1706:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_ASSERT_TRUE(test, p !=3D NULL);
           ^
   include/kunit/test.h:1513:2: note: expanded from macro 'KUNIT_ASSERT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1707:2: note: Dereference of null pointer
           KUNIT_EXPECT_EQ(test, p->value.immediate, (u32)0x0);
           ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:776:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           typeof(left) __left =3D (left);                                 =
         \
                                 ^~~~~~
>> drivers/thunderbolt/test.c:1739:3: warning: Array access (from variable =
'block') results in a null pointer dereference [clang-analyzer-core.NullDer=
eference]
                   KUNIT_EXPECT_EQ(test, root_directory[i], block[i]);
                   ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^                                                        ~~~~~
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:777:26: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           typeof(right) __right =3D (right);                              =
         \
                                   ^~~~~~
   drivers/thunderbolt/test.c:1725:26: note: Assuming 'dir' is equal to null
           KUNIT_ASSERT_TRUE(test, dir !=3D NULL);
                                   ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1725:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_ASSERT_TRUE(test, dir !=3D NULL);
           ^
   include/kunit/test.h:1513:2: note: expanded from macro 'KUNIT_ASSERT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1728:2: note: Assuming '__left' is not equal =
to '__right'
           KUNIT_ASSERT_EQ(test, ret, (int)ARRAY_SIZE(root_directory));
           ^
   include/kunit/test.h:1552:2: note: expanded from macro 'KUNIT_ASSERT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_ASSERTION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:781:4: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
                           __left op __right,                              =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1728:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_ASSERT_EQ(test, ret, (int)ARRAY_SIZE(root_directory));
           ^
   include/kunit/test.h:1552:2: note: expanded from macro 'KUNIT_ASSERT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_ASSERTION, left, right)
           ^
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:780:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1728:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_ASSERT_EQ(test, ret, (int)ARRAY_SIZE(root_directory));
           ^
   include/kunit/test.h:1552:2: note: expanded from macro 'KUNIT_ASSERT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_ASSERTION, left, right)
--
                              ^~~~
   drivers/thunderbolt/test.c:1733:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_ASSERT_TRUE(test, block !=3D NULL);
           ^
   include/kunit/test.h:1513:2: note: expanded from macro 'KUNIT_ASSERT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1736:2: note: Assuming '__left' is not equal =
to '__right'
           KUNIT_EXPECT_EQ(test, ret, 0);
           ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:781:4: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
                           __left op __right,                              =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1736:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_EXPECT_EQ(test, ret, 0);
           ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:780:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1736:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_EXPECT_EQ(test, ret, 0);
           ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:774:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
                                       ...)                                =
       \
                                                                           =
       ^
   drivers/thunderbolt/test.c:1738:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < ARRAY_SIZE(root_directory); i++)
           ^
   drivers/thunderbolt/test.c:1739:3: note: Array access (from variable 'bl=
ock') results in a null pointer dereference
                   KUNIT_EXPECT_EQ(test, root_directory[i], block[i]);
                   ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^                                                        ~~~~~
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:777:26: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           typeof(right) __right =3D (right);                              =
         \
                                   ^~~~~~
>> drivers/thunderbolt/test.c:1792:6: warning: Null pointer passed as 1st a=
rgument to memory comparison function [clang-analyzer-unix.cstring.NullArg]
                                   !memcmp(p1->value.data, p2->value.data,
                                    ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
                                                       ^~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
                                                       ^~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
                                 ^~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
                              ^~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1750:6: note: Assuming field 'uuid' is null
           if (d1->uuid) {
               ^~~~~~~~
   drivers/thunderbolt/test.c:1750:2: note: Taking false branch
           if (d1->uuid) {
           ^
   drivers/thunderbolt/test.c:1754:27: note: Assuming field 'uuid' is not e=
qual to null
                   KUNIT_ASSERT_TRUE(test, d2->uuid =3D=3D NULL);
                                           ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1754:3: note: Loop condition is false.  Exiti=
ng loop
                   KUNIT_ASSERT_TRUE(test, d2->uuid =3D=3D NULL);
                   ^
   include/kunit/test.h:1513:2: note: expanded from macro 'KUNIT_ASSERT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1758:2: note: Loop condition is true.  Enteri=
ng loop body
           tb_property_for_each(d1, tmp)
           ^
   include/linux/thunderbolt.h:167:2: note: expanded from macro 'tb_propert=
y_for_each'
           for (property =3D tb_property_get_next(dir, NULL);        \
           ^
   drivers/thunderbolt/test.c:1758:2: note: Loop condition is false. Execut=
ion continues on line 1760
           tb_property_for_each(d1, tmp)
           ^
   include/linux/thunderbolt.h:167:2: note: expanded from macro 'tb_propert=
y_for_each'
           for (property =3D tb_property_get_next(dir, NULL);        \
           ^
   drivers/thunderbolt/test.c:1760:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_ASSERT_NE(test, n1, 0);
           ^
   include/kunit/test.h:1594:2: note: expanded from macro 'KUNIT_ASSERT_NE'
           KUNIT_BINARY_NE_ASSERTION(test, KUNIT_ASSERTION, left, right)
           ^
   include/kunit/test.h:940:2: note: expanded from macro 'KUNIT_BINARY_NE_A=
SSERTION'
           KUNIT_BINARY_NE_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:930:2: note: expanded from macro 'KUNIT_BINARY_NE_M=
SG_ASSERTION'
           KUNIT_BASE_NE_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:818:2: note: expanded from macro 'KUNIT_BASE_NE_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:780:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1760:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_ASSERT_NE(test, n1, 0);
           ^
   include/kunit/test.h:1594:2: note: expanded from macro 'KUNIT_ASSERT_NE'
           KUNIT_BINARY_NE_ASSERTION(test, KUNIT_ASSERTION, left, right)
           ^
   include/kunit/test.h:940:2: note: expanded from macro 'KUNIT_BINARY_NE_A=
SSERTION'
           KUNIT_BINARY_NE_MSG_ASSERTION(test,                             =
       \
--
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:774:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
                                       ...)                                =
       \
                                                                           =
       ^
   drivers/thunderbolt/test.c:1781:3: note: Control jumps to 'case TB_PROPE=
RTY_TYPE_DATA:'  at line 1788
                   switch (p1->type) {
                   ^
   drivers/thunderbolt/test.c:1789:28: note: Assuming field 'data' is equal=
 to null
                           KUNIT_ASSERT_TRUE(test, p1->value.data !=3D NULL=
);
                                                   ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1789:4: note: Loop condition is false.  Exiti=
ng loop
                           KUNIT_ASSERT_TRUE(test, p1->value.data !=3D NULL=
);
                           ^
   include/kunit/test.h:1513:2: note: expanded from macro 'KUNIT_ASSERT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1790:28: note: Assuming field 'data' is equal=
 to null
                           KUNIT_ASSERT_TRUE(test, p2->value.data !=3D NULL=
);
                                                   ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1790:4: note: Loop condition is false.  Exiti=
ng loop
                           KUNIT_ASSERT_TRUE(test, p2->value.data !=3D NULL=
);
                           ^
   include/kunit/test.h:1513:2: note: expanded from macro 'KUNIT_ASSERT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1792:6: note: Null pointer passed as 1st argu=
ment to memory comparison function
                                   !memcmp(p1->value.data, p2->value.data,
                                    ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
                                                       ^~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
                                                       ^~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
                                 ^~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
                              ^~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
>> drivers/thunderbolt/test.c:1792:6: warning: Null pointer passed as 2nd a=
rgument to memory comparison function [clang-analyzer-unix.cstring.NullArg]
                                   !memcmp(p1->value.data, p2->value.data,
                                    ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
                                                       ^~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
                                                       ^~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
                                 ^~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
                              ^~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1750:6: note: Assuming field 'uuid' is null
           if (d1->uuid) {
               ^~~~~~~~
   drivers/thunderbolt/test.c:1750:2: note: Taking false branch
           if (d1->uuid) {
           ^
   drivers/thunderbolt/test.c:1754:27: note: Assuming field 'uuid' is not e=
qual to null
                   KUNIT_ASSERT_TRUE(test, d2->uuid =3D=3D NULL);
                                           ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1754:3: note: Loop condition is false.  Exiti=
ng loop
                   KUNIT_ASSERT_TRUE(test, d2->uuid =3D=3D NULL);
                   ^
   include/kunit/test.h:1513:2: note: expanded from macro 'KUNIT_ASSERT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1758:2: note: Loop condition is true.  Enteri=
ng loop body
           tb_property_for_each(d1, tmp)
           ^
   include/linux/thunderbolt.h:167:2: note: expanded from macro 'tb_propert=
y_for_each'
           for (property =3D tb_property_get_next(dir, NULL);        \
           ^
   drivers/thunderbolt/test.c:1758:2: note: Loop condition is false. Execut=
ion continues on line 1760
           tb_property_for_each(d1, tmp)
           ^
   include/linux/thunderbolt.h:167:2: note: expanded from macro 'tb_propert=
y_for_each'
           for (property =3D tb_property_get_next(dir, NULL);        \
           ^
   drivers/thunderbolt/test.c:1760:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_ASSERT_NE(test, n1, 0);
           ^
   include/kunit/test.h:1594:2: note: expanded from macro 'KUNIT_ASSERT_NE'
           KUNIT_BINARY_NE_ASSERTION(test, KUNIT_ASSERTION, left, right)
           ^
   include/kunit/test.h:940:2: note: expanded from macro 'KUNIT_BINARY_NE_A=
SSERTION'
           KUNIT_BINARY_NE_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:930:2: note: expanded from macro 'KUNIT_BINARY_NE_M=
SG_ASSERTION'
           KUNIT_BASE_NE_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:818:2: note: expanded from macro 'KUNIT_BASE_NE_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:780:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1760:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_ASSERT_NE(test, n1, 0);
           ^
   include/kunit/test.h:1594:2: note: expanded from macro 'KUNIT_ASSERT_NE'
           KUNIT_BINARY_NE_ASSERTION(test, KUNIT_ASSERTION, left, right)
           ^
   include/kunit/test.h:940:2: note: expanded from macro 'KUNIT_BINARY_NE_A=
SSERTION'
           KUNIT_BINARY_NE_MSG_ASSERTION(test,                             =
       \
--
           ^
   include/kunit/test.h:774:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
                                       ...)                                =
       \
                                                                           =
       ^
   drivers/thunderbolt/test.c:1833:2: note: Value assigned to 'block'
           block =3D kunit_kzalloc(test, sizeof(root_directory), GFP_KERNEL=
);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/thunderbolt/test.c:1834:26: note: Assuming 'block' is equal to n=
ull
           KUNIT_ASSERT_TRUE(test, block !=3D NULL);
                                   ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1834:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_ASSERT_TRUE(test, block !=3D NULL);
           ^
   include/kunit/test.h:1513:2: note: expanded from macro 'KUNIT_ASSERT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1837:26: note: Assuming 'ret' is not equal to=
 0
           KUNIT_EXPECT_TRUE(test, !ret);
                                   ^
   include/kunit/test.h:1224:48: note: expanded from macro 'KUNIT_EXPECT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_EXPECTATION, condition)
                                                         ^~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
                                                       ^~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
                                 ^~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
                              ^~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1837:2: note: Loop condition is false.  Exiti=
ng loop
           KUNIT_EXPECT_TRUE(test, !ret);
           ^
   include/kunit/test.h:1224:2: note: expanded from macro 'KUNIT_EXPECT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_EXPECTATION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1839:2: note: Loop condition is true.  Enteri=
ng loop body
           for (i =3D 0; i < ARRAY_SIZE(root_directory); i++)
           ^
   drivers/thunderbolt/test.c:1840:3: note: Array access (from variable 'bl=
ock') results in a null pointer dereference
                   KUNIT_EXPECT_EQ(test, root_directory[i], block[i]);
                   ^
   include/kunit/test.h:1264:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^                                                        ~~~~~
   include/kunit/test.h:901:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:891:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:802:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:777:26: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           typeof(right) __right =3D (right);                              =
         \
                                   ^~~~~~
>> include/linux/uuid.h:63:9: warning: Null pointer passed as 2nd argument =
to memory comparison function [clang-analyzer-unix.cstring.NullArg]
           return memcmp(u1, u2, sizeof(uuid_t)) =3D=3D 0;
                  ^
   drivers/thunderbolt/test.c:1750:6: note: Assuming field 'uuid' is non-nu=
ll
           if (d1->uuid) {
               ^~~~~~~~
   drivers/thunderbolt/test.c:1750:2: note: Taking true branch
           if (d1->uuid) {
           ^
   drivers/thunderbolt/test.c:1751:27: note: Assuming field 'uuid' is equal=
 to null
                   KUNIT_ASSERT_TRUE(test, d2->uuid !=3D NULL);
                                           ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1751:3: note: Loop condition is false.  Exiti=
ng loop
                   KUNIT_ASSERT_TRUE(test, d2->uuid !=3D NULL);
                   ^
   include/kunit/test.h:1513:2: note: expanded from macro 'KUNIT_ASSERT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
           ^
   include/kunit/test.h:739:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:731:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:720:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:679:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   drivers/thunderbolt/test.c:1752:48: note: Passing null pointer value via=
 2nd parameter 'u2'
                   KUNIT_ASSERT_TRUE(test, uuid_equal(d1->uuid, d2->uuid));
                                                                ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
                                                       ^~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
                                                       ^~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
                                 ^~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
                              ^~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   drivers/thunderbolt/test.c:1752:27: note: Calling 'uuid_equal'
                   KUNIT_ASSERT_TRUE(test, uuid_equal(d1->uuid, d2->uuid));
                                           ^
   include/kunit/test.h:1513:46: note: expanded from macro 'KUNIT_ASSERT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_ASSERTION, condition)
                                                       ^~~~~~~~~
   include/kunit/test.h:739:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
                                                       ^~~~~~~~~
   include/kunit/test.h:733:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
                                 ^~~~~~~~~
   include/kunit/test.h:721:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
                              ^~~~~~~~~
   include/kunit/test.h:683:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   include/linux/uuid.h:63:9: note: Null pointer passed as 2nd argument to =
memory comparison function
           return memcmp(u1, u2, sizeof(uuid_t)) =3D=3D 0;
                  ^          ~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   drivers/memstick/host/rtsx_pci_ms.c:374:3: warning: 4th function call ar=
gument is an uninitialized value [clang-analyzer-core.CallAndMessage]
                   dev_dbg(ms_dev(host), "int_reg: 0x%02x\n", int_reg);
                   ^
   include/linux/dev_printk.h:123:2: note: expanded from macro 'dev_dbg'
           dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/dynamic_debug.h:161:25: note: expanded from macro 'dynamic=
_dev_dbg'
           _dynamic_func_call(fmt,__dynamic_dev_dbg,               \
                                  ^
   drivers/memstick/host/rtsx_pci_ms.c:391:32: note: Left side of '&&' is f=
alse
           struct realtek_pci_ms *host =3D container_of(work,
                                         ^
   include/linux/kernel.h:709:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \

vim +1670 drivers/thunderbolt/test.c

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1652  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1653  static const uuid_t networ=
k_dir_uuid =3D
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1654  	UUID_INIT(0xc66189ca, 0x1=
cce, 0x4195,
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1655  		  0xbd, 0xb8, 0x49, 0x59=
, 0x2e, 0x5f, 0x5a, 0x4f);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1656  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1657  static void tb_test_proper=
ty_parse(struct kunit *test)
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1658  {
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1659  	struct tb_property_dir *d=
ir, *network_dir;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1660  	struct tb_property *p;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1661  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1662  	dir =3D tb_property_parse=
_dir(root_directory, ARRAY_SIZE(root_directory));
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1663  	KUNIT_ASSERT_TRUE(test, d=
ir !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1664  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1665  	p =3D tb_property_find(di=
r, "foo", TB_PROPERTY_TYPE_TEXT);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1666  	KUNIT_ASSERT_TRUE(test, !=
p);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1667  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1668  	p =3D tb_property_find(di=
r, "vendorid", TB_PROPERTY_TYPE_TEXT);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1669  	KUNIT_ASSERT_TRUE(test, p=
 !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04 @1670  	KUNIT_EXPECT_STREQ(test, =
p->value.text, "Apple Inc.");
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1671  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1672  	p =3D tb_property_find(di=
r, "vendorid", TB_PROPERTY_TYPE_VALUE);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1673  	KUNIT_ASSERT_TRUE(test, p=
 !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1674  	KUNIT_EXPECT_EQ(test, p->=
value.immediate, (u32)0xa27);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1675  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1676  	p =3D tb_property_find(di=
r, "deviceid", TB_PROPERTY_TYPE_TEXT);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1677  	KUNIT_ASSERT_TRUE(test, p=
 !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1678  	KUNIT_EXPECT_STREQ(test, =
p->value.text, "Macintosh");
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1679  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1680  	p =3D tb_property_find(di=
r, "deviceid", TB_PROPERTY_TYPE_VALUE);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1681  	KUNIT_ASSERT_TRUE(test, p=
 !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1682  	KUNIT_EXPECT_EQ(test, p->=
value.immediate, (u32)0xa);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1683  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1684  	p =3D tb_property_find(di=
r, "missing", TB_PROPERTY_TYPE_DIRECTORY);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1685  	KUNIT_ASSERT_TRUE(test, !=
p);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1686  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1687  	p =3D tb_property_find(di=
r, "network", TB_PROPERTY_TYPE_DIRECTORY);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1688  	KUNIT_ASSERT_TRUE(test, p=
 !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1689  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1690  	network_dir =3D p->value.=
dir;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1691  	KUNIT_EXPECT_TRUE(test, u=
uid_equal(network_dir->uuid, &network_dir_uuid));
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1692  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1693  	p =3D tb_property_find(ne=
twork_dir, "prtcid", TB_PROPERTY_TYPE_VALUE);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1694  	KUNIT_ASSERT_TRUE(test, p=
 !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1695  	KUNIT_EXPECT_EQ(test, p->=
value.immediate, (u32)0x1);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1696  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1697  	p =3D tb_property_find(ne=
twork_dir, "prtcvers", TB_PROPERTY_TYPE_VALUE);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1698  	KUNIT_ASSERT_TRUE(test, p=
 !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1699  	KUNIT_EXPECT_EQ(test, p->=
value.immediate, (u32)0x1);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1700  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1701  	p =3D tb_property_find(ne=
twork_dir, "prtcrevs", TB_PROPERTY_TYPE_VALUE);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1702  	KUNIT_ASSERT_TRUE(test, p=
 !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1703  	KUNIT_EXPECT_EQ(test, p->=
value.immediate, (u32)0x1);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1704  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1705  	p =3D tb_property_find(ne=
twork_dir, "prtcstns", TB_PROPERTY_TYPE_VALUE);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1706  	KUNIT_ASSERT_TRUE(test, p=
 !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1707  	KUNIT_EXPECT_EQ(test, p->=
value.immediate, (u32)0x0);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1708  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1709  	p =3D tb_property_find(ne=
twork_dir, "deviceid", TB_PROPERTY_TYPE_VALUE);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1710  	KUNIT_EXPECT_TRUE(test, !=
p);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1711  	p =3D tb_property_find(ne=
twork_dir, "deviceid", TB_PROPERTY_TYPE_TEXT);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1712  	KUNIT_EXPECT_TRUE(test, !=
p);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1713  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1714  	tb_property_free_dir(dir);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1715  }
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1716  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1717  static void tb_test_proper=
ty_format(struct kunit *test)
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1718  {
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1719  	struct tb_property_dir *d=
ir;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1720  	ssize_t block_len;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1721  	u32 *block;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1722  	int ret, i;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1723  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1724  	dir =3D tb_property_parse=
_dir(root_directory, ARRAY_SIZE(root_directory));
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1725  	KUNIT_ASSERT_TRUE(test, d=
ir !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1726  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1727  	ret =3D tb_property_forma=
t_dir(dir, NULL, 0);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1728  	KUNIT_ASSERT_EQ(test, ret=
, (int)ARRAY_SIZE(root_directory));
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1729  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1730  	block_len =3D ret;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1731  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1732  	block =3D kunit_kzalloc(t=
est, block_len * sizeof(u32), GFP_KERNEL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1733  	KUNIT_ASSERT_TRUE(test, b=
lock !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1734  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1735  	ret =3D tb_property_forma=
t_dir(dir, block, block_len);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1736  	KUNIT_EXPECT_EQ(test, ret=
, 0);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1737  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1738  	for (i =3D 0; i < ARRAY_S=
IZE(root_directory); i++)
15a4c7e8f916f4 Mika Westerberg 2020-05-04 @1739  		KUNIT_EXPECT_EQ(test, ro=
ot_directory[i], block[i]);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1740  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1741  	tb_property_free_dir(dir);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1742  }
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1743  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1744  static void compare_dirs(s=
truct kunit *test, struct tb_property_dir *d1,
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1745  			 struct tb_property_dir=
 *d2)
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1746  {
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1747  	struct tb_property *p1, *=
p2, *tmp;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1748  	int n1, n2, i;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1749  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1750  	if (d1->uuid) {
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1751  		KUNIT_ASSERT_TRUE(test, =
d2->uuid !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1752  		KUNIT_ASSERT_TRUE(test, =
uuid_equal(d1->uuid, d2->uuid));
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1753  	} else {
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1754  		KUNIT_ASSERT_TRUE(test, =
d2->uuid =3D=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1755  	}
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1756  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1757  	n1 =3D 0;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1758  	tb_property_for_each(d1, =
tmp)
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1759  		n1++;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1760  	KUNIT_ASSERT_NE(test, n1,=
 0);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1761  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1762  	n2 =3D 0;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1763  	tb_property_for_each(d2, =
tmp)
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1764  		n2++;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1765  	KUNIT_ASSERT_NE(test, n2,=
 0);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1766  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1767  	KUNIT_ASSERT_EQ(test, n1,=
 n2);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1768  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1769  	p1 =3D NULL;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1770  	p2 =3D NULL;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1771  	for (i =3D 0; i < n1; i++=
) {
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1772  		p1 =3D tb_property_get_n=
ext(d1, p1);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1773  		KUNIT_ASSERT_TRUE(test, =
p1 !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1774  		p2 =3D tb_property_get_n=
ext(d2, p2);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1775  		KUNIT_ASSERT_TRUE(test, =
p2 !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1776  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1777  		KUNIT_ASSERT_STREQ(test,=
 &p1->key[0], &p2->key[0]);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1778  		KUNIT_ASSERT_EQ(test, p1=
->type, p2->type);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1779  		KUNIT_ASSERT_EQ(test, p1=
->length, p2->length);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1780  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1781  		switch (p1->type) {
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1782  		case TB_PROPERTY_TYPE_DI=
RECTORY:
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1783  			KUNIT_ASSERT_TRUE(test,=
 p1->value.dir !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1784  			KUNIT_ASSERT_TRUE(test,=
 p2->value.dir !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1785  			compare_dirs(test, p1->=
value.dir, p2->value.dir);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1786  			break;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1787  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1788  		case TB_PROPERTY_TYPE_DA=
TA:
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1789  			KUNIT_ASSERT_TRUE(test,=
 p1->value.data !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1790  			KUNIT_ASSERT_TRUE(test,=
 p2->value.data !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1791  			KUNIT_ASSERT_TRUE(test,
15a4c7e8f916f4 Mika Westerberg 2020-05-04 @1792  				!memcmp(p1->value.data=
, p2->value.data,
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1793  					p1->length * 4)
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1794  			);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1795  			break;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1796  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1797  		case TB_PROPERTY_TYPE_TE=
XT:
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1798  			KUNIT_ASSERT_TRUE(test,=
 p1->value.text !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1799  			KUNIT_ASSERT_TRUE(test,=
 p2->value.text !=3D NULL);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1800  			KUNIT_ASSERT_STREQ(test=
, p1->value.text, p2->value.text);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1801  			break;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1802  =

15a4c7e8f916f4 Mika Westerberg 2020-05-04  1803  		case TB_PROPERTY_TYPE_VA=
LUE:
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1804  			KUNIT_ASSERT_EQ(test, p=
1->value.immediate,
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1805  					p2->value.immediate);
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1806  			break;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1807  		default:
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1808  			KUNIT_FAIL(test, "unexp=
ected property type");
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1809  			break;
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1810  		}
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1811  	}
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1812  }
15a4c7e8f916f4 Mika Westerberg 2020-05-04  1813  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1262246541353983921==--

