Content-Type: multipart/mixed; boundary="===============3229138378920944482=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: lib/test_bpf.c:63:8: warning: Excessive padding in 'struct bpf_test' (11 padding bytes, where 3 is optimal).
Date: Tue, 14 Dec 2021 14:08:22 +0800
Message-ID: <202112141457.bIIpNh08-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3229138378920944482==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Johan Almbladh <johan.almbladh@anyfinetworks.com>
CC: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5472f14a37421d1bca3dddf33cabd3bd6dbefbbc
commit: c2a228d69cef802cf6bfd773c84f8419d2e2acf9 bpf/tests: Allow different=
 number of runs per test case
date:   3 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-c007-20211202 (https://download.01.org/0day-ci/ar=
chive/20211214/202112141457.bIIpNh08-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 4b5532=
97ef3ee4dc2119d5429adf3072e90fac38)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc2a228d69cef802cf6bfd773c84f8419d2e2acf9
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c2a228d69cef802cf6bfd773c84f8419d2e2acf9
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   ^
   security/keys/trusted-keys/trusted_tpm1.c:59:3: note: '?' condition is t=
rue
                   pr_info("can't alloc %s\n", hash_alg);
                   ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   security/keys/trusted-keys/trusted_tpm1.c:59:3: note: '?' condition is t=
rue
                   pr_info("can't alloc %s\n", hash_alg);
                   ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   security/keys/trusted-keys/trusted_tpm1.c:59:3: note: Loop condition is =
false.  Exiting loop
                   pr_info("can't alloc %s\n", hash_alg);
                   ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:369:2: note: expanded from macro '__printk_index_=
emit'
           do {                                                            \
           ^
   security/keys/trusted-keys/trusted_tpm1.c:490:8: note: Returned allocate=
d memory
           ret =3D TSS_sha1(td->xorwork, SHA1_DIGEST_SIZE * 2, td->xorhash);
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   security/keys/trusted-keys/trusted_tpm1.c:491:6: note: Assuming 'ret' is=
 >=3D 0
           if (ret < 0)
               ^~~~~~~
   security/keys/trusted-keys/trusted_tpm1.c:491:2: note: Taking false bran=
ch
           if (ret < 0)
           ^
   security/keys/trusted-keys/trusted_tpm1.c:495:6: note: Assuming 'ret' is=
 >=3D 0
           if (ret < 0)
               ^~~~~~~
   security/keys/trusted-keys/trusted_tpm1.c:495:2: note: Taking false bran=
ch
           if (ret < 0)
           ^
   security/keys/trusted-keys/trusted_tpm1.c:498:6: note: Potential memory =
leak
           if (ret !=3D TPM_NONCE_SIZE) {
               ^
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> lib/test_bpf.c:63:8: warning: Excessive padding in 'struct bpf_test' (11=
 padding bytes, where 3 is optimal). =

   Optimal fields order: =

   descr, =

   fill_helper, =

   u, =

   expected_errcode, =

   stack_depth, =

   nr_testruns, =

   test, =

   aux, =

   data, =

   frag_data, =

   consider reordering the fields or adding explicit padding members [clang=
-analyzer-optin.performance.Padding]
   struct bpf_test {
   ~~~~~~~^~~~~~~~~~
   lib/test_bpf.c:63:8: note: Excessive padding in 'struct bpf_test' (11 pa=
dding bytes, where 3 is optimal). Optimal fields order: descr, fill_helper,=
 u, expected_errcode, stack_depth, nr_testruns, test, aux, data, frag_data,=
 consider reordering the fields or adding explicit padding members
   struct bpf_test {
   ~~~~~~~^~~~~~~~~~
   lib/test_bpf.c:8593:2: warning: Undefined or garbage value returned to c=
aller [clang-analyzer-core.uninitialized.UndefReturn]
           return fp;
           ^
   lib/test_bpf.c:9242:6: note: Assuming 'ret' is >=3D 0
           if (ret < 0)
               ^~~~~~~
   lib/test_bpf.c:9242:2: note: Taking false branch
           if (ret < 0)
           ^
   lib/test_bpf.c:9245:8: note: Calling 'test_bpf'
           ret =3D test_bpf();
                 ^~~~~~~~~~
   lib/test_bpf.c:8953:2: note: Loop condition is true.  Entering loop body
           for (i =3D 0; i < ARRAY_SIZE(tests); i++) {
           ^
   lib/test_bpf.c:8958:3: note: Taking false branch
                   if (exclude_test(i))
                   ^
   lib/test_bpf.c:8961:3: note: Left side of '&&' is true
                   pr_info("#%d %s ", i, tests[i].descr);
                   ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:7: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                       ^
   lib/test_bpf.c:8961:3: note: Taking true branch
                   pr_info("#%d %s ", i, tests[i].descr);
                   ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:370:3: note: expanded from macro '__printk_index_=
emit'
                   if (__builtin_constant_p(_fmt) && __builtin_constant_p(_=
level)) { \
                   ^
   lib/test_bpf.c:8961:3: note: '?' condition is true
                   pr_info("#%d %s ", i, tests[i].descr);
                   ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:379:12: note: expanded from macro '__printk_index=
_emit'
                                   .fmt =3D __builtin_constant_p(_fmt) ? (_=
fmt) : NULL, \
                                          ^
   lib/test_bpf.c:8961:3: note: '?' condition is true
                   pr_info("#%d %s ", i, tests[i].descr);
                   ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)
           ^
   include/linux/printk.h:446:26: note: expanded from macro 'printk'
   #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##__VA_ARGS__)
                            ^
   include/linux/printk.h:417:3: note: expanded from macro 'printk_index_wr=
ap'
                   __printk_index_emit(_fmt, NULL, NULL);                  \
                   ^
   include/linux/printk.h:383:14: note: expanded from macro '__printk_index=
_emit'
                                   .level =3D __builtin_constant_p(_level) =
? (_level) : NULL, \
                                            ^
   lib/test_bpf.c:8961:3: note: Loop condition is false.  Exiting loop
                   pr_info("#%d %s ", i, tests[i].descr);
                   ^
   include/linux/printk.h:519:2: note: expanded from macro 'pr_info'
           printk(KERN_INFO pr_fmt(fmt), ##__VA_ARGS__)

vim +63 lib/test_bpf.c

10f18e0ba1ea7e Daniel Borkmann    2014-05-23  62  =

64a8946b447e41 Alexei Starovoitov 2014-05-08 @63  struct bpf_test {
64a8946b447e41 Alexei Starovoitov 2014-05-08  64  	const char *descr;
64a8946b447e41 Alexei Starovoitov 2014-05-08  65  	union {
64a8946b447e41 Alexei Starovoitov 2014-05-08  66  		struct sock_filter insn=
s[MAX_INSNS];
2695fb552cbef1 Alexei Starovoitov 2014-07-24  67  		struct bpf_insn insns_i=
nt[MAX_INSNS];
a4afd37b26f4b9 Daniel Borkmann    2015-05-13  68  		struct {
a4afd37b26f4b9 Daniel Borkmann    2015-05-13  69  			void *insns;
a4afd37b26f4b9 Daniel Borkmann    2015-05-13  70  			unsigned int len;
a4afd37b26f4b9 Daniel Borkmann    2015-05-13  71  		} ptr;
ece80490e2c1ce Andrew Morton      2014-05-22  72  	} u;
10f18e0ba1ea7e Daniel Borkmann    2014-05-23  73  	__u8 aux;
64a8946b447e41 Alexei Starovoitov 2014-05-08  74  	__u8 data[MAX_DATA];
64a8946b447e41 Alexei Starovoitov 2014-05-08  75  	struct {
64a8946b447e41 Alexei Starovoitov 2014-05-08  76  		int data_size;
64a8946b447e41 Alexei Starovoitov 2014-05-08  77  		__u32 result;
64a8946b447e41 Alexei Starovoitov 2014-05-08  78  	} test[MAX_SUBTESTS];
a4afd37b26f4b9 Daniel Borkmann    2015-05-13  79  	int (*fill_helper)(struc=
t bpf_test *self);
09584b40674241 Yonghong Song      2018-02-02  80  	int expected_errcode; /*=
 used when FLAG_EXPECTED_FAIL is set in the aux */
bac142acb90e95 Nicolas Schichan   2015-08-04  81  	__u8 frag_data[MAX_DATA];
105c03614bff2d Alexei Starovoitov 2017-05-30  82  	int stack_depth; /* for =
eBPF only, since tests don't call verifier */
c2a228d69cef80 Johan Almbladh     2021-09-14  83  	int nr_testruns; /* Cust=
om run count, defaults to MAX_TESTRUNS if 0 */
64a8946b447e41 Alexei Starovoitov 2014-05-08  84  };
64a8946b447e41 Alexei Starovoitov 2014-05-08  85  =


:::::: The code@line 63 was first introduced by commit
:::::: 64a8946b447e418b4283c3573ef397980cca0cd8 net: filter: BPF testsuite

:::::: TO: Alexei Starovoitov <ast@plumgrid.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3229138378920944482==--

