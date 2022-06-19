Content-Type: multipart/mixed; boundary="===============6247501966136074602=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/asm-generic/rwonce.h:44:26: warning: dereference of NULL 'chain' [CWE-476]
Date: Sun, 19 Jun 2022 14:05:41 +0800
Message-ID: <202206191437.K2YoLwbB-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6247501966136074602==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/asm-generic/rwonce.h:44:26: warning: dereference of NULL 'chain' [=
CWE-476] [-Wanalyzer-null-dereference]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 4765473fefd4403b5eeca371637065b561522c50 netfilter: nf_tables: cons=
olidate rule verdict trace call
date:   6 months ago
:::::: branch date: 34 hours ago
:::::: commit date: 6 months ago
config: arm-randconfig-c002-20220617 (https://download.01.org/0day-ci/archi=
ve/20220619/202206191437.K2YoLwbB-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D4765473fefd4403b5eeca371637065b561522c50
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 4765473fefd4403b5eeca371637065b561522c50
        # save the config file
         ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


gcc-analyzer warnings: (new ones prefixed by >>)
   In file included from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:266,
                    from include/linux/kernel.h:11,
                    from net/netfilter/nf_tables_core.c:8:
   net/netfilter/nf_tables_core.c: In function 'nft_do_chain':
>> include/asm-generic/rwonce.h:44:26: warning: dereference of NULL 'chain'=
 [CWE-476] [-Wanalyzer-null-dereference]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof=
(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
      50 |         __READ_ONCE(x);                                         =
        \
         |         ^~~~~~~~~~~
   include/linux/rcupdate.h:390:55: note: in expansion of macro 'READ_ONCE'
     390 |         typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONC=
E(p); \
         |                                                       ^~~~~~~~~
   include/linux/rcupdate.h:529:9: note: in expansion of macro '__rcu_deref=
erence_check'
     529 |         __rcu_dereference_check((p), (c) || rcu_read_lock_held()=
, __rcu)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:597:28: note: in expansion of macro 'rcu_derefe=
rence_check'
     597 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_core.c:204:25: note: in expansion of macro 'rcu_=
dereference'
     204 |                 rules =3D rcu_dereference(chain->rules_gen_1);
         |                         ^~~~~~~~~~~~~~~
     'nft_do_chain': event 1
       |
       |  211 |         for (; *rules ; rules++) {
       |      |                ^
       |      |                |
       |      |                (1) following 'false' branch...
       |
     'nft_do_chain': event 2
       |
       |include/asm-generic/rwonce.h:44:26:
       |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_t=
ypeof(x) *)&(x))
       |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (2) ...to here
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
       |   50 |         __READ_ONCE(x);                                    =
             \
       |      |         ^~~~~~~~~~~
   arch/arm/include/asm/atomic.h:25:33: note: in expansion of macro 'READ_O=
NCE'
       |   25 | #define arch_atomic_read(v)     READ_ONCE((v)->counter)
       |      |                                 ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:28:16: note: in expansion of =
macro 'arch_atomic_read'
       |   28 |         return arch_atomic_read(v);
       |      |                ^~~~~~~~~~~~~~~~
       |
     'nft_do_chain': events 3-12
       |
       |net/netfilter/nf_tables_core.c:94:12:
       |   94 |         if (static_branch_unlikely(&nft_trace_enabled)) {
       |      |            ^
       |      |            |
       |      |            (3) following 'false' branch...
       |......
       |  203 |         if (genbit)
       |      |            ~
       |      |            |
       |      |            (12) following 'true' branch...
       |......
       |  240 |         switch (regs.verdict.code & NF_VERDICT_MASK) {
       |      |         ~~~~~~  ~~~~~~~~~~~~~~~~~
       |      |         |                   |
       |      |         |                   (4) ...to here
       |      |         (5) following 'false' branch...
       |......
       |  248 |         switch (regs.verdict.code) {
       |      |         ~~~~~~
       |      |         |
       |      |         (6) ...to here
       |      |         (7) following 'default:' branch...
       |  249 |         case NFT_JUMP:
       |      |         ~~~~
       |      |         |
       |      |         (8) ...to here
       |  250 |                 if (WARN_ON_ONCE(stackptr >=3D NFT_JUMP_STA=
CK_SIZE))
       |      |                    ~
       |      |                    |
       |      |                    (9) following 'false' branch...
       |  251 |                         return NF_DROP;
       |  252 |                 jumpstack[stackptr].chain =3D chain;
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                                           |
       |      |                                           (10) ...to here
       |......
       |  257 |                 chain =3D regs.verdict.chain;
       |      |                 ~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                       |
       |      |                       (11) 'chain' is NULL
       |
     'nft_do_chain': event 13
       |
       |include/asm-generic/rwonce.h:44:26:
       |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_t=
ypeof(x) *)&(x))
       |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (13) ...to here
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
       |   50 |         __READ_ONCE(x);                                    =
             \
       |      |         ^~~~~~~~~~~
   include/linux/rcupdate.h:390:55: note: in expansion of macro 'READ_ONCE'
       |  390 |         typeof(*p) *________p1 =3D (typeof(*p) *__force)REA=
D_ONCE(p); \
       |      |                                                       ^~~~~=
~~~~
   include/linux/rcupdate.h:529:9: note: in expansion of macro '__rcu_deref=
erence_check'
       |  529 |         __rcu_dereference_check((p), (c) || rcu_read_lock_h=
eld(), __rcu)
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:597:28: note: in expansion of macro 'rcu_derefe=
rence_check'
       |  597 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
       |      |                            ^~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_core.c:204:25: note: in expansion of macro 'rcu_=
dereference'
       |  204 |                 rules =3D rcu_dereference(chain->rules_gen_=
1);
       |      |                         ^~~~~~~~~~~~~~~
       |
     'nft_do_chain': event 14
       |
       |include/asm-generic/rwonce.h:44:26:
       |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_t=
ypeof(x) *)&(x))
       |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (14) dereference of NULL 'chain'
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
       |   50 |         __READ_ONCE(x);                                    =
             \
       |      |         ^~~~~~~~~~~
   include/linux/rcupdate.h:390:55: note: in expansion of macro 'READ_ONCE'
       |  390 |         typeof(*p) *________p1 =3D (typeof(*p) *__force)REA=
D_ONCE(p); \
       |      |                                                       ^~~~~=
~~~~
   include/linux/rcupdate.h:529:9: note: in expansion of macro '__rcu_deref=
erence_check'
       |  529 |         __rcu_dereference_check((p), (c) || rcu_read_lock_h=
eld(), __rcu)
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:597:28: note: in expansion of macro 'rcu_derefe=
rence_check'
       |  597 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
       |      |                            ^~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_core.c:204:25: note: in expansion of macro 'rcu_=
dereference'
       |  204 |                 rules =3D rcu_dereference(chain->rules_gen_=
1);
       |      |                         ^~~~~~~~~~~~~~~
       |
>> include/asm-generic/rwonce.h:44:26: warning: dereference of NULL 'chain'=
 [CWE-476] [-Wanalyzer-null-dereference]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof=
(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
      50 |         __READ_ONCE(x);                                         =
        \
         |         ^~~~~~~~~~~
   include/linux/rcupdate.h:390:55: note: in expansion of macro 'READ_ONCE'
     390 |         typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONC=
E(p); \
         |                                                       ^~~~~~~~~
   include/linux/rcupdate.h:529:9: note: in expansion of macro '__rcu_deref=
erence_check'
     529 |         __rcu_dereference_check((p), (c) || rcu_read_lock_held()=
, __rcu)
         |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:597:28: note: in expansion of macro 'rcu_derefe=
rence_check'
     597 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
         |                            ^~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_core.c:206:25: note: in expansion of macro 'rcu_=
dereference'
     206 |                 rules =3D rcu_dereference(chain->rules_gen_0);
         |                         ^~~~~~~~~~~~~~~
     'nft_do_chain': event 1
       |
       |  203 |         if (genbit)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch...
       |
     'nft_do_chain': event 2
       |
       |include/asm-generic/rwonce.h:44:26:
       |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_t=
ypeof(x) *)&(x))
       |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (2) ...to here
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
       |   50 |         __READ_ONCE(x);                                    =
             \
       |      |         ^~~~~~~~~~~
   include/linux/rcupdate.h:390:55: note: in expansion of macro 'READ_ONCE'
       |  390 |         typeof(*p) *________p1 =3D (typeof(*p) *__force)REA=
D_ONCE(p); \
       |      |                                                       ^~~~~=
~~~~
   include/linux/rcupdate.h:529:9: note: in expansion of macro '__rcu_deref=
erence_check'
       |  529 |         __rcu_dereference_check((p), (c) || rcu_read_lock_h=
eld(), __rcu)
       |      |         ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:597:28: note: in expansion of macro 'rcu_derefe=
rence_check'
       |  597 | #define rcu_dereference(p) rcu_dereference_check(p, 0)
       |      |                            ^~~~~~~~~~~~~~~~~~~~~
   net/netfilter/nf_tables_core.c:206:25: note: in expansion of macro 'rcu_=
dereference'
       |  206 |                 rules =3D rcu_dereference(chain->rules_gen_=
0);
       |      |                         ^~~~~~~~~~~~~~~
       |
     'nft_do_chain': event 3
       |
       |  211 |         for (; *rules ; rules++) {
       |      |                ^
       |      |                |
       |      |                (3) following 'false' branch...
       |
     'nft_do_chain': event 4
       |
       |include/asm-generic/rwonce.h:44:26:
       |   44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_t=
ypeof(x) *)&(x))
       |      |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~
       |      |                          |
       |      |                          (4) ...to here
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_O=
NCE'
       |   50 |         __READ_ONCE(x);                                    =
             \
       |      |         ^~~~~~~~~~~
   arch/arm/include/asm/atomic.h:25:33: note: in expansion of macro 'READ_O=
NCE'
       |   25 | #define arch_atomic_read(v)     READ_ONCE((v)->counter)
       |      |                                 ^~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:28:16: note: in expansion of =
macro 'arch_atomic_read'
       |   28 |         return arch_atomic_read(v);
       |      |                ^~~~~~~~~~~~~~~~
       |
     'nft_do_chain': events 5-14
       |
       |net/netfilter/nf_tables_core.c:94:12:
       |   94 |         if (static_branch_unlikely(&nft_trace_enabled)) {
       |      |            ^
       |      |            |
       |      |            (5) following 'false' branch...
       |......
       |  203 |         if (genbit)
       |      |            ~
       |      |            |
       |      |            (14) following 'false' branch...
       |......
       |  240 |         switch (regs.verdict.code & NF_VERDICT_MASK) {
       |      |         ~~~~~~  ~~~~~~~~~~~~~~~~~
       |      |         |                   |
       |      |         |                   (6) ...to here
       |      |         (7) following 'false' branch...
       |......
       |  248 |         switch (regs.verdict.code) {
       |      |         ~~~~~~
       |      |         |
       |      |         (8) ...to here
       |      |         (9) following 'default:' branch...
       |  249 |         case NFT_JUMP:
       |      |         ~~~~
       |      |         |
       |      |         (10) ...to here
       |  250 |                 if (WARN_ON_ONCE(stackptr >=3D NFT_JUMP_STA=
CK_SIZE))

vim +/chain +44 include/asm-generic/rwonce.h

e506ea451254ab Will Deacon 2019-10-15  28  =

e506ea451254ab Will Deacon 2019-10-15  29  /*
e506ea451254ab Will Deacon 2019-10-15  30   * Yes, this permits 64-bit acce=
sses on 32-bit architectures. These will
e506ea451254ab Will Deacon 2019-10-15  31   * actually be atomic in some ca=
ses (namely Armv7 + LPAE), but for others we
e506ea451254ab Will Deacon 2019-10-15  32   * rely on the access being spli=
t into 2x32-bit accesses for a 32-bit quantity
e506ea451254ab Will Deacon 2019-10-15  33   * (e.g. a virtual address) and =
a strong prevailing wind.
e506ea451254ab Will Deacon 2019-10-15  34   */
e506ea451254ab Will Deacon 2019-10-15  35  #define compiletime_assert_rwonc=
e_type(t)					\
e506ea451254ab Will Deacon 2019-10-15  36  	compiletime_assert(__native_wor=
d(t) || sizeof(t) =3D=3D sizeof(long long),	\
e506ea451254ab Will Deacon 2019-10-15  37  		"Unsupported access size for {=
READ,WRITE}_ONCE().")
e506ea451254ab Will Deacon 2019-10-15  38  =

e506ea451254ab Will Deacon 2019-10-15  39  /*
e506ea451254ab Will Deacon 2019-10-15  40   * Use __READ_ONCE() instead of =
READ_ONCE() if you do not require any
3c9184109e78ea Will Deacon 2019-10-30  41   * atomicity. Note that this may=
 result in tears!
e506ea451254ab Will Deacon 2019-10-15  42   */
b78b331a3f5c07 Will Deacon 2019-10-15  43  #ifndef __READ_ONCE
e506ea451254ab Will Deacon 2019-10-15 @44  #define __READ_ONCE(x)	(*(const =
volatile __unqual_scalar_typeof(x) *)&(x))
b78b331a3f5c07 Will Deacon 2019-10-15  45  #endif
e506ea451254ab Will Deacon 2019-10-15  46  =


:::::: The code at line 44 was first introduced by commit
:::::: e506ea451254ab17e0bf918ca36232fec2a9b10c compiler.h: Split {READ,WRI=
TE}_ONCE definitions out into rwonce.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6247501966136074602==--

