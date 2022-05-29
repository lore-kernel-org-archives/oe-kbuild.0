Content-Type: multipart/mixed; boundary="===============7947555913209968939=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/kfence/kfence_test.c:165:2: warning: Value stored to 'cur' is never read [clang-analyzer-deadcode.DeadStores]
Date: Sun, 29 May 2022 11:35:03 +0800
Message-ID: <202205291135.ZxmkPB5Y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7947555913209968939==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Wang Kefeng <wangkefeng.wang@huawei.com>
CC: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: 75969686ec0df23157afe24dc818d7bddb087d78 ARM: 9166/1: Support KFENC=
E for ARM
date:   5 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220528 (https://download.01.org/0day-ci/archi=
ve/20220529/202205291135.ZxmkPB5Y-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 0fbe3f=
3f486e01448121f7931a4ca29fac1504ab)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D75969686ec0df23157afe24dc818d7bddb087d78
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 75969686ec0df23157afe24dc818d7bddb087d78
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^~~~~~
   init/main.c:643:2: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(static_command_line + xlen, command_line);
           ^~~~~~
   init/main.c:643:2: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
           strcpy(static_command_line + xlen, command_line);
           ^~~~~~
   init/main.c:655:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:655:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:657:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len,
                           ^~~~~~
   init/main.c:657:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len,
                           ^~~~~~
   init/main.c:661:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len, " -- ");
                           ^~~~~~
   init/main.c:661:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len, " -- ");
                           ^~~~~~
   init/main.c:663:4: warning: Call to function 'strcpy' is insecure as it =
does not provide bounding of the memory buffer. Replace unbounded copy func=
tions with analogous functions that support length arguments such as 'strlc=
py'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:663:4: note: Call to function 'strcpy' is insecure as it doe=
s not provide bounding of the memory buffer. Replace unbounded copy functio=
ns with analogous functions that support length arguments such as 'strlcpy'=
. CWE-119
                           strcpy(saved_command_line + len, extra_init_args=
);
                           ^~~~~~
   init/main.c:1185:4: warning: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                           strcpy(entry->buf, str_entry);
                           ^~~~~~
   init/main.c:1185:4: note: Call to function 'strcpy' is insecure as it do=
es not provide bounding of the memory buffer. Replace unbounded copy functi=
ons with analogous functions that support length arguments such as 'strlcpy=
'. CWE-119
                           strcpy(entry->buf, str_entry);
                           ^~~~~~
   init/main.c:1385:3: warning: Call to function 'strcpy' is insecure as it=
 does not provide bounding of the memory buffer. Replace unbounded copy fun=
ctions with analogous functions that support length arguments such as 'strl=
cpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(command_line, saved_command_line);
                   ^~~~~~
   init/main.c:1385:3: note: Call to function 'strcpy' is insecure as it do=
es not provide bounding of the memory buffer. Replace unbounded copy functi=
ons with analogous functions that support length arguments such as 'strlcpy=
'. CWE-119
                   strcpy(command_line, saved_command_line);
                   ^~~~~~
   Suppressed 23 warnings (20 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   17 warnings generated.
   fs/jfs/jfs_types.h:67:33: warning: The left operand of '&' is a garbage =
value [clang-analyzer-core.UndefinedBinaryOperatorResult]
           pxd->len_addr =3D (pxd->len_addr & cpu_to_le32(0xffffff)) |
                                          ^
   fs/jfs/namei.c:692:2: note: Assuming 'jfsloglevel' is < 4
           jfs_info("jfs_free_zero_link: ip =3D 0x%p", ip);
           ^
   fs/jfs/jfs_debug.h:56:6: note: expanded from macro 'jfs_info'
           if (jfsloglevel >=3D JFS_LOGLEVEL_INFO)           \
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/namei.c:692:2: note: Taking false branch
           jfs_info("jfs_free_zero_link: ip =3D 0x%p", ip);
           ^
   fs/jfs/jfs_debug.h:56:2: note: expanded from macro 'jfs_info'
           if (jfsloglevel >=3D JFS_LOGLEVEL_INFO)           \
           ^
   fs/jfs/namei.c:692:2: note: Loop condition is false.  Exiting loop
           jfs_info("jfs_free_zero_link: ip =3D 0x%p", ip);
           ^
   fs/jfs/jfs_debug.h:55:31: note: expanded from macro 'jfs_info'
   #define jfs_info(fmt, arg...) do {                      \
                                 ^
   fs/jfs/namei.c:699:2: note: Control jumps to 'case 32768:'  at line 700
           switch (type) {
           ^
   fs/jfs/namei.c:701:3: note:  Execution continues on line 714
                   break;
                   ^
   fs/jfs/namei.c:714:6: note: Assuming the condition is true
           if (JFS_IP(ip)->ea.flag & DXD_EXTENT) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/namei.c:714:2: note: Taking true branch
           if (JFS_IP(ip)->ea.flag & DXD_EXTENT) {
           ^
   fs/jfs/namei.c:727:3: note: Calling 'PXDaddress'
                   PXDaddress(&pxdlock->pxd, xaddr);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/jfs/jfs_types.h:67:33: note: The left operand of '&' is a garbage val=
ue
           pxd->len_addr =3D (pxd->len_addr & cpu_to_le32(0xffffff)) |
                            ~~~~~~~~~~~~~ ^
   fs/jfs/namei.c:881:16: warning: Value stored to 'ip' during its initiali=
zation is never read [clang-analyzer-deadcode.DeadStores]
           struct inode *ip =3D d_inode(dentry);
                         ^~   ~~~~~~~~~~~~~~~
   fs/jfs/namei.c:881:16: note: Value stored to 'ip' during its initializat=
ion is never read
           struct inode *ip =3D d_inode(dentry);
                         ^~   ~~~~~~~~~~~~~~~
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   Suppressed 15 warnings (15 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   16 warnings generated.
   Suppressed 16 warnings (16 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   23 warnings generated.
>> mm/kfence/kfence_test.c:165:2: warning: Value stored to 'cur' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           cur +=3D scnprintf(cur, end - cur, " 0x%p", (void *)addr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:165:2: note: Value stored to 'cur' is never read
           cur +=3D scnprintf(cur, end - cur, " 0x%p", (void *)addr);
           ^      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> mm/kfence/kfence_test.c:165:9: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           cur +=3D scnprintf(cur, end - cur, " 0x%p", (void *)addr);
                  ^
   mm/kfence/kfence_test.c:396:2: note: Calling 'test_free'
           test_free(expect.addr); /* Double-free. */
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:222:6: note: Assuming 'test_cache' is null
           if (test_cache)
               ^~~~~~~~~~
   mm/kfence/kfence_test.c:222:2: note: Taking false branch
           if (test_cache)
           ^
   mm/kfence/kfence_test.c:225:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   mm/kfence/kfence_test.c:396:2: note: Returning; memory was released via =
1st parameter
           test_free(expect.addr); /* Double-free. */
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:397:26: note: Calling 'report_matches'
           KUNIT_EXPECT_TRUE(test, report_matches(&expect));
                                   ^
   include/kunit/test.h:1322:48: note: expanded from macro 'KUNIT_EXPECT_TR=
UE'
           KUNIT_TRUE_ASSERTION(test, KUNIT_EXPECTATION, condition)
                                                         ^~~~~~~~~
   include/kunit/test.h:838:46: note: expanded from macro 'KUNIT_TRUE_ASSER=
TION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
                                                       ^~~~~~~~~
   include/kunit/test.h:832:10: note: expanded from macro 'KUNIT_TRUE_MSG_A=
SSERTION'
                                 condition,                                =
       \
                                 ^~~~~~~~~
   include/kunit/test.h:820:7: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
                              ^~~~~~~~~
   include/kunit/test.h:782:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   mm/kfence/kfence_test.c:105:2: note: Taking false branch
           if (!report_available())
           ^
   mm/kfence/kfence_test.c:113:2: note: Control jumps to 'case KFENCE_ERROR=
_INVALID_FREE:'  at line 129
           switch (r->type) {
           ^
   mm/kfence/kfence_test.c:131:3: note:  Execution continues on line 134
                   break;
                   ^
   mm/kfence/kfence_test.c:137:6: note: Assuming 'cur' is null
           if (cur)
               ^~~
   mm/kfence/kfence_test.c:137:2: note: Taking false branch
           if (cur)
           ^
   mm/kfence/kfence_test.c:144:2: note: Control jumps to 'case KFENCE_ERROR=
_INVALID_FREE:'  at line 160
           switch (r->type) {
           ^
   mm/kfence/kfence_test.c:162:3: note:  Execution continues on line 165
                   break;
                   ^
   mm/kfence/kfence_test.c:165:9: note: Use of memory after it is freed
           cur +=3D scnprintf(cur, end - cur, " 0x%p", (void *)addr);
                  ^                                  ~~~~~~~~~~~~
   mm/kfence/kfence_test.c:381:2: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           READ_ONCE(*expect.addr);
           ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   mm/kfence/kfence_test.c:380:2: note: Calling 'test_free'
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:222:6: note: Assuming 'test_cache' is null
           if (test_cache)
               ^~~~~~~~~~
   mm/kfence/kfence_test.c:222:2: note: Taking false branch
           if (test_cache)
           ^
   mm/kfence/kfence_test.c:225:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   mm/kfence/kfence_test.c:380:2: note: Returning; memory was released via =
1st parameter
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:381:2: note: Left side of '||' is true
           READ_ONCE(*expect.addr);
           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:29: note: expanded from macro '__nati=
ve_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
                                      ^
   mm/kfence/kfence_test.c:381:2: note: Taking false branch
           READ_ONCE(*expect.addr);
           ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
--
               ^~~~~~~~~~
   mm/kfence/kfence_test.c:222:2: note: Taking false branch
           if (test_cache)
           ^
   mm/kfence/kfence_test.c:225:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   mm/kfence/kfence_test.c:412:2: note: Returning; memory was released
           test_free(expect.addr); /* Invalid address free. */
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:413:2: note: Use of memory after it is freed
           test_free(buf); /* No error. */
           ^         ~~~
   mm/kfence/kfence_test.c:671:2: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
           KUNIT_EXPECT_EQ(test, *expect.addr, (char)42);
           ^
   include/kunit/test.h:1362:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:999:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:989:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:900:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:875:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           typeof(left) __left =3D (left);                                 =
         \
                                 ^~~~~~
   mm/kfence/kfence_test.c:664:2: note: Assuming 'test_cache' is null
           KUNIT_EXPECT_TRUE(test, test_cache); /* Want memcache. */
           ^
   include/kunit/test.h:1322:2: note: expanded from macro 'KUNIT_EXPECT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_EXPECTATION, condition)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:838:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:830:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:820:5: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:782:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   mm/kfence/kfence_test.c:664:2: note: Loop condition is false.  Exiting l=
oop
           KUNIT_EXPECT_TRUE(test, test_cache); /* Want memcache. */
           ^
   include/kunit/test.h:1322:2: note: expanded from macro 'KUNIT_EXPECT_TRU=
E'
           KUNIT_TRUE_ASSERTION(test, KUNIT_EXPECTATION, condition)
           ^
   include/kunit/test.h:838:2: note: expanded from macro 'KUNIT_TRUE_ASSERT=
ION'
           KUNIT_TRUE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:830:2: note: expanded from macro 'KUNIT_TRUE_MSG_AS=
SERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:819:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:778:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   mm/kfence/kfence_test.c:670:2: note: Calling 'test_free'
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:222:6: note: Assuming 'test_cache' is null
           if (test_cache)
               ^~~~~~~~~~
   mm/kfence/kfence_test.c:222:2: note: Taking false branch
           if (test_cache)
           ^
   mm/kfence/kfence_test.c:225:3: note: Memory is released
                   kfree(ptr);
                   ^~~~~~~~~~
   mm/kfence/kfence_test.c:670:2: note: Returning; memory was released via =
1st parameter
           test_free(expect.addr);
           ^~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:671:2: note: Use of memory after it is freed
           KUNIT_EXPECT_EQ(test, *expect.addr, (char)42);
           ^
   include/kunit/test.h:1362:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:999:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:989:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:900:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:875:24: note: expanded from macro 'KUNIT_BASE_BINAR=
Y_ASSERTION'
           typeof(left) __left =3D (left);                                 =
         \
                                 ^~~~~~
>> mm/kfence/kfence_test.c:705:10: warning: Array access (from variable 'bu=
f') results in a null pointer dereference [clang-analyzer-core.NullDerefere=
nce]
                   buf[i] =3D i + 1;
                   ~~~    ^
   mm/kfence/kfence_test.c:693:2: note: 'expect.addr' initialized to a null=
 pointer value
           const struct expect_report expect =3D {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/kfence/kfence_test.c:699:2: note: 'buf' initialized to a null pointer=
 value
           char *buf =3D expect.addr;
           ^~~~~~~~~
   mm/kfence/kfence_test.c:702:2: note: Assuming 'test_cache' is non-null
           KUNIT_EXPECT_FALSE(test, test_cache);
           ^
   include/kunit/test.h:1341:2: note: expanded from macro 'KUNIT_EXPECT_FAL=
SE'
           KUNIT_FALSE_ASSERTION(test, KUNIT_EXPECTATION, condition)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:849:2: note: expanded from macro 'KUNIT_FALSE_ASSER=
TION'
           KUNIT_FALSE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:841:2: note: expanded from macro 'KUNIT_FALSE_MSG_A=
SSERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:820:5: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
                           !!(condition) =3D=3D !!expected_true,           =
           \
   ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:782:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   mm/kfence/kfence_test.c:702:2: note: Loop condition is false.  Exiting l=
oop
           KUNIT_EXPECT_FALSE(test, test_cache);
           ^
   include/kunit/test.h:1341:2: note: expanded from macro 'KUNIT_EXPECT_FAL=
SE'
           KUNIT_FALSE_ASSERTION(test, KUNIT_EXPECTATION, condition)
           ^
   include/kunit/test.h:849:2: note: expanded from macro 'KUNIT_FALSE_ASSER=
TION'
           KUNIT_FALSE_MSG_ASSERTION(test, assert_type, condition, NULL)
           ^
   include/kunit/test.h:841:2: note: expanded from macro 'KUNIT_FALSE_MSG_A=
SSERTION'
           KUNIT_UNARY_ASSERTION(test,                                     =
       \
           ^
   include/kunit/test.h:819:2: note: expanded from macro 'KUNIT_UNARY_ASSER=
TION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:778:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   mm/kfence/kfence_test.c:703:2: note: Assuming '__left' is not equal to '=
__right'
           KUNIT_EXPECT_EQ(test, ksize(buf), size); /* Precise size match a=
fter KFENCE alloc. */
           ^
   include/kunit/test.h:1362:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/kunit/test.h:999:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:989:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:900:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:879:4: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
                           __left op __right,                              =
       \
   ~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~
   include/kunit/test.h:782:7: note: expanded from macro 'KUNIT_ASSERTION'
                              pass,                                        =
       \
                              ^~~~
   mm/kfence/kfence_test.c:703:2: note: Loop condition is false.  Exiting l=
oop
           KUNIT_EXPECT_EQ(test, ksize(buf), size); /* Precise size match a=
fter KFENCE alloc. */
           ^
   include/kunit/test.h:1362:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:999:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:989:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:900:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:878:2: note: expanded from macro 'KUNIT_BASE_BINARY=
_ASSERTION'
           KUNIT_ASSERTION(test,                                           =
       \
           ^
   include/kunit/test.h:778:74: note: expanded from macro 'KUNIT_ASSERTION'
   #define KUNIT_ASSERTION(test, pass, assert_class, INITIALIZER, fmt, ...)=
 do {  \
                                                                           =
 ^
   mm/kfence/kfence_test.c:703:2: note: Loop condition is false.  Exiting l=
oop
           KUNIT_EXPECT_EQ(test, ksize(buf), size); /* Precise size match a=
fter KFENCE alloc. */
           ^
   include/kunit/test.h:1362:2: note: expanded from macro 'KUNIT_EXPECT_EQ'
           KUNIT_BINARY_EQ_ASSERTION(test, KUNIT_EXPECTATION, left, right)
           ^
   include/kunit/test.h:999:2: note: expanded from macro 'KUNIT_BINARY_EQ_A=
SSERTION'
           KUNIT_BINARY_EQ_MSG_ASSERTION(test,                             =
       \
           ^
   include/kunit/test.h:989:2: note: expanded from macro 'KUNIT_BINARY_EQ_M=
SG_ASSERTION'
           KUNIT_BASE_EQ_MSG_ASSERTION(test,                               =
       \
           ^
   include/kunit/test.h:900:2: note: expanded from macro 'KUNIT_BASE_EQ_MSG=
_ASSERTION'
           KUNIT_BASE_BINARY_ASSERTION(test,                               =
       \

vim +/cur +165 mm/kfence/kfence_test.c

bc8fbc5f305aec Marco Elver   2021-02-25   93  =

bc8fbc5f305aec Marco Elver   2021-02-25   94  /* Check observed report matc=
hes information in @r. */
bc8fbc5f305aec Marco Elver   2021-02-25   95  static bool report_matches(co=
nst struct expect_report *r)
bc8fbc5f305aec Marco Elver   2021-02-25   96  {
f99e12b21b84fe Sven Schnelle 2021-07-28   97  	unsigned long addr =3D (unsi=
gned long)r->addr;
bc8fbc5f305aec Marco Elver   2021-02-25   98  	bool ret =3D false;
bc8fbc5f305aec Marco Elver   2021-02-25   99  	unsigned long flags;
bc8fbc5f305aec Marco Elver   2021-02-25  100  	typeof(observed.lines) expec=
t;
bc8fbc5f305aec Marco Elver   2021-02-25  101  	const char *end;
bc8fbc5f305aec Marco Elver   2021-02-25  102  	char *cur;
bc8fbc5f305aec Marco Elver   2021-02-25  103  =

bc8fbc5f305aec Marco Elver   2021-02-25  104  	/* Doubled-checked locking. =
*/
bc8fbc5f305aec Marco Elver   2021-02-25  105  	if (!report_available())
bc8fbc5f305aec Marco Elver   2021-02-25  106  		return false;
bc8fbc5f305aec Marco Elver   2021-02-25  107  =

bc8fbc5f305aec Marco Elver   2021-02-25  108  	/* Generate expected report =
contents. */
bc8fbc5f305aec Marco Elver   2021-02-25  109  =

bc8fbc5f305aec Marco Elver   2021-02-25  110  	/* Title */
bc8fbc5f305aec Marco Elver   2021-02-25  111  	cur =3D expect[0];
bc8fbc5f305aec Marco Elver   2021-02-25  112  	end =3D &expect[0][sizeof(ex=
pect[0]) - 1];
bc8fbc5f305aec Marco Elver   2021-02-25  113  	switch (r->type) {
bc8fbc5f305aec Marco Elver   2021-02-25  114  	case KFENCE_ERROR_OOB:
bc8fbc5f305aec Marco Elver   2021-02-25  115  		cur +=3D scnprintf(cur, end=
 - cur, "BUG: KFENCE: out-of-bounds %s",
bc8fbc5f305aec Marco Elver   2021-02-25  116  				 get_access_type(r));
bc8fbc5f305aec Marco Elver   2021-02-25  117  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  118  	case KFENCE_ERROR_UAF:
bc8fbc5f305aec Marco Elver   2021-02-25  119  		cur +=3D scnprintf(cur, end=
 - cur, "BUG: KFENCE: use-after-free %s",
bc8fbc5f305aec Marco Elver   2021-02-25  120  				 get_access_type(r));
bc8fbc5f305aec Marco Elver   2021-02-25  121  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  122  	case KFENCE_ERROR_CORRUPTION:
bc8fbc5f305aec Marco Elver   2021-02-25  123  		cur +=3D scnprintf(cur, end=
 - cur, "BUG: KFENCE: memory corruption");
bc8fbc5f305aec Marco Elver   2021-02-25  124  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  125  	case KFENCE_ERROR_INVALID:
bc8fbc5f305aec Marco Elver   2021-02-25  126  		cur +=3D scnprintf(cur, end=
 - cur, "BUG: KFENCE: invalid %s",
bc8fbc5f305aec Marco Elver   2021-02-25  127  				 get_access_type(r));
bc8fbc5f305aec Marco Elver   2021-02-25  128  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  129  	case KFENCE_ERROR_INVALID_FR=
EE:
bc8fbc5f305aec Marco Elver   2021-02-25  130  		cur +=3D scnprintf(cur, end=
 - cur, "BUG: KFENCE: invalid free");
bc8fbc5f305aec Marco Elver   2021-02-25  131  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  132  	}
bc8fbc5f305aec Marco Elver   2021-02-25  133  =

bc8fbc5f305aec Marco Elver   2021-02-25  134  	scnprintf(cur, end - cur, " =
in %pS", r->fn);
bc8fbc5f305aec Marco Elver   2021-02-25  135  	/* The exact offset won't ma=
tch, remove it; also strip module name. */
bc8fbc5f305aec Marco Elver   2021-02-25  136  	cur =3D strchr(expect[0], '+=
');
bc8fbc5f305aec Marco Elver   2021-02-25  137  	if (cur)
bc8fbc5f305aec Marco Elver   2021-02-25  138  		*cur =3D '\0';
bc8fbc5f305aec Marco Elver   2021-02-25  139  =

bc8fbc5f305aec Marco Elver   2021-02-25  140  	/* Access information */
bc8fbc5f305aec Marco Elver   2021-02-25  141  	cur =3D expect[1];
bc8fbc5f305aec Marco Elver   2021-02-25  142  	end =3D &expect[1][sizeof(ex=
pect[1]) - 1];
bc8fbc5f305aec Marco Elver   2021-02-25  143  =

bc8fbc5f305aec Marco Elver   2021-02-25  144  	switch (r->type) {
bc8fbc5f305aec Marco Elver   2021-02-25  145  	case KFENCE_ERROR_OOB:
bc8fbc5f305aec Marco Elver   2021-02-25  146  		cur +=3D scnprintf(cur, end=
 - cur, "Out-of-bounds %s at", get_access_type(r));
f99e12b21b84fe Sven Schnelle 2021-07-28  147  		addr =3D arch_kfence_test_a=
ddress(addr);
bc8fbc5f305aec Marco Elver   2021-02-25  148  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  149  	case KFENCE_ERROR_UAF:
bc8fbc5f305aec Marco Elver   2021-02-25  150  		cur +=3D scnprintf(cur, end=
 - cur, "Use-after-free %s at", get_access_type(r));
f99e12b21b84fe Sven Schnelle 2021-07-28  151  		addr =3D arch_kfence_test_a=
ddress(addr);
bc8fbc5f305aec Marco Elver   2021-02-25  152  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  153  	case KFENCE_ERROR_CORRUPTION:
bc8fbc5f305aec Marco Elver   2021-02-25  154  		cur +=3D scnprintf(cur, end=
 - cur, "Corrupted memory at");
bc8fbc5f305aec Marco Elver   2021-02-25  155  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  156  	case KFENCE_ERROR_INVALID:
bc8fbc5f305aec Marco Elver   2021-02-25  157  		cur +=3D scnprintf(cur, end=
 - cur, "Invalid %s at", get_access_type(r));
f99e12b21b84fe Sven Schnelle 2021-07-28  158  		addr =3D arch_kfence_test_a=
ddress(addr);
bc8fbc5f305aec Marco Elver   2021-02-25  159  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  160  	case KFENCE_ERROR_INVALID_FR=
EE:
bc8fbc5f305aec Marco Elver   2021-02-25  161  		cur +=3D scnprintf(cur, end=
 - cur, "Invalid free of");
bc8fbc5f305aec Marco Elver   2021-02-25  162  		break;
bc8fbc5f305aec Marco Elver   2021-02-25  163  	}
bc8fbc5f305aec Marco Elver   2021-02-25  164  =

f99e12b21b84fe Sven Schnelle 2021-07-28 @165  	cur +=3D scnprintf(cur, end =
- cur, " 0x%p", (void *)addr);
bc8fbc5f305aec Marco Elver   2021-02-25  166  =

bc8fbc5f305aec Marco Elver   2021-02-25  167  	spin_lock_irqsave(&observed.=
lock, flags);
bc8fbc5f305aec Marco Elver   2021-02-25  168  	if (!report_available())
bc8fbc5f305aec Marco Elver   2021-02-25  169  		goto out; /* A new report i=
s being captured. */
bc8fbc5f305aec Marco Elver   2021-02-25  170  =

bc8fbc5f305aec Marco Elver   2021-02-25  171  	/* Finally match expected ou=
tput to what we actually observed. */
bc8fbc5f305aec Marco Elver   2021-02-25  172  	ret =3D strstr(observed.line=
s[0], expect[0]) && strstr(observed.lines[1], expect[1]);
bc8fbc5f305aec Marco Elver   2021-02-25  173  out:
bc8fbc5f305aec Marco Elver   2021-02-25  174  	spin_unlock_irqrestore(&obse=
rved.lock, flags);
bc8fbc5f305aec Marco Elver   2021-02-25  175  	return ret;
bc8fbc5f305aec Marco Elver   2021-02-25  176  }
bc8fbc5f305aec Marco Elver   2021-02-25  177  =


:::::: The code at line 165 was first introduced by commit
:::::: f99e12b21b84feb1fd9d845a15096772f1659461 kfence: add function to mas=
k address bits

:::::: TO: Sven Schnelle <svens@linux.ibm.com>
:::::: CC: Heiko Carstens <hca@linux.ibm.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7947555913209968939==--

