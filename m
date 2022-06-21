Content-Type: multipart/mixed; boundary="===============7711315146069961151=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: include/linux/atomic/atomic-instrumented.h:28:9: warning: Dereference of null pointer [clang-analyzer-core.NullDereference]
Date: Tue, 21 Jun 2022 09:02:26 +0800
Message-ID: <202206210828.B1sWjmM1-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7711315146069961151==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check first_new_problem:=
 include/linux/atomic/atomic-instrumented.h:28:9: warning: Dereference of n=
ull pointer [clang-analyzer-core.NullDereference]"
:::::: =


CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Florian Westphal <fw@strlen.de>
CC: Pablo Neira Ayuso <pablo@netfilter.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4b35035bcf80ddb47c0112c4fbd84a63a2836a18
commit: 719774377622bc4025d2a74f551b5dc2158c6c30 netfilter: conntrack: conv=
ert to refcount_t api
date:   5 months ago
:::::: branch date: 3 days ago
:::::: commit date: 5 months ago
config: arm-randconfig-c002-20220617 (https://download.01.org/0day-ci/archi=
ve/20220621/202206210828.B1sWjmM1-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d764aa=
7fc6b9cc3fbe960019018f5f9e941eb0a6)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D719774377622bc4025d2a74f551b5dc2158c6c30
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 719774377622bc4025d2a74f551b5dc2158c6c30
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm clang-analyzer =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/dlm/lock.c:5046:6: note: Assuming 'ls' is non-null
           if (!ls) {
               ^~~
   fs/dlm/lock.c:5046:2: note: Taking false branch
           if (!ls) {
           ^
   fs/dlm/lock.c:5062:6: note: Assuming field 'h_cmd' is equal to DLM_MSG
           if (hd->h_cmd =3D=3D DLM_MSG)
               ^~~~~~~~~~~~~~~~~~~~
   fs/dlm/lock.c:5062:2: note: Taking true branch
           if (hd->h_cmd =3D=3D DLM_MSG)
           ^
   fs/dlm/lock.c:5063:3: note: Calling 'dlm_receive_message'
                   dlm_receive_message(ls, &p->message, nodeid);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dlm/lock.c:4988:2: note: Taking false branch
           if (dlm_locking_stopped(ls)) {
           ^
   fs/dlm/lock.c:5001:3: note: Calling '_receive_message'
                   _receive_message(ls, ms, 0);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dlm/lock.c:4861:6: note: Assuming the condition is false
           if (!dlm_is_member(ls, ms->m_header.h_nodeid)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dlm/lock.c:4861:2: note: Taking false branch
           if (!dlm_is_member(ls, ms->m_header.h_nodeid)) {
           ^
   fs/dlm/lock.c:4868:2: note: Control jumps to 'case 11:'  at line 4921
           switch (ms->m_type) {
           ^
   fs/dlm/lock.c:4922:3: note: Calling 'receive_lookup'
                   receive_lookup(ls, ms);
                   ^~~~~~~~~~~~~~~~~~~~~~
   fs/dlm/lock.c:4366:18: note: 'ret_nodeid' declared without an initial va=
lue
           int len, error, ret_nodeid, from_nodeid, our_nodeid;
                           ^~~~~~~~~~
   fs/dlm/lock.c:4373:10: note: Calling 'dlm_master_lookup'
           error =3D dlm_master_lookup(ls, from_nodeid, ms->m_extra, len, 0,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dlm/lock.c:920:6: note: Assuming 'len' is > DLM_RESNAME_MAXLEN
           if (len > DLM_RESNAME_MAXLEN)
               ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/dlm/lock.c:920:2: note: Taking true branch
           if (len > DLM_RESNAME_MAXLEN)
           ^
   fs/dlm/lock.c:921:3: note: Returning without writing to '*r_nodeid'
                   return -EINVAL;
                   ^
   fs/dlm/lock.c:921:3: note: Returning the value -22, which participates i=
n a condition later
                   return -EINVAL;
                   ^~~~~~~~~~~~~~
   fs/dlm/lock.c:4373:10: note: Returning from 'dlm_master_lookup'
           error =3D dlm_master_lookup(ls, from_nodeid, ms->m_extra, len, 0,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/dlm/lock.c:4377:7: note: 'error' is -22
           if (!error && ret_nodeid =3D=3D our_nodeid) {
                ^~~~~
   fs/dlm/lock.c:4377:13: note: Left side of '&&' is false
           if (!error && ret_nodeid =3D=3D our_nodeid) {
                      ^
   fs/dlm/lock.c:4381:2: note: 3rd function call argument is an uninitializ=
ed value
           send_lookup_reply(ls, ms, ret_nodeid, error);
           ^                         ~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   3 warnings generated.
   net/netfilter/nf_log.c:318:14: warning: Value stored to 'net' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct net *net =3D seq_file_net(seq);
                       ^~~   ~~~~~~~~~~~~~~~~~
   net/netfilter/nf_log.c:318:14: note: Value stored to 'net' during its in=
itialization is never read
           struct net *net =3D seq_file_net(seq);
                       ^~~   ~~~~~~~~~~~~~~~~~
   net/netfilter/nf_log.c:330:14: warning: Value stored to 'net' during its=
 initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct net *net =3D seq_file_net(s);
                       ^~~   ~~~~~~~~~~~~~~~
   net/netfilter/nf_log.c:330:14: note: Value stored to 'net' during its in=
itialization is never read
           struct net *net =3D seq_file_net(s);
                       ^~~   ~~~~~~~~~~~~~~~
   Suppressed 1 warnings (1 with check filters).
   6 warnings generated.
   Suppressed 6 warnings (6 with check filters).
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
   net/netfilter/nfnetlink.c:429:4: warning: Value stored to 'err' is never=
 read [clang-analyzer-deadcode.DeadStores]
                           err =3D -EINTR;
                           ^     ~~~~~~
   net/netfilter/nfnetlink.c:429:4: note: Value stored to 'err' is never re=
ad
                           err =3D -EINTR;
                           ^     ~~~~~~
   net/netfilter/nfnetlink.c:436:3: warning: Value stored to 'err' is never=
 read [clang-analyzer-deadcode.DeadStores]
                   err =3D 0;
                   ^     ~
   net/netfilter/nfnetlink.c:436:3: note: Value stored to 'err' is never re=
ad
                   err =3D 0;
                   ^     ~
   1 warning generated.
   Suppressed 1 warnings (1 with check filters).
   2 warnings generated.
>> include/linux/atomic/atomic-instrumented.h:28:9: warning: Dereference of=
 null pointer [clang-analyzer-core.NullDereference]
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   net/netfilter/nf_conntrack_standalone.c:300:2: note: 'ct' initialized he=
re
           struct nf_conn *ct =3D nf_ct_tuplehash_to_ctrack(hash);
           ^~~~~~~~~~~~~~~~~~
   net/netfilter/nf_conntrack_standalone.c:305:10: note: Assuming 'ct' is n=
ull
           WARN_ON(!ct);
                   ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   net/netfilter/nf_conntrack_standalone.c:306:38: note: Passing null point=
er value via 1st parameter 'r'
           if (unlikely(!refcount_inc_not_zero(&ct->ct_general.use)))
                                               ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/netfilter/nf_conntrack_standalone.c:306:16: note: Calling 'refcount_=
inc_not_zero'
           if (unlikely(!refcount_inc_not_zero(&ct->ct_general.use)))
                         ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   include/linux/refcount.h:245:33: note: Passing null pointer value via 1s=
t parameter 'r'
           return __refcount_inc_not_zero(r, NULL);
                                          ^
   include/linux/refcount.h:245:9: note: Calling '__refcount_inc_not_zero'
           return __refcount_inc_not_zero(r, NULL);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:227:36: note: Passing null pointer value via 2n=
d parameter 'r'
           return __refcount_add_not_zero(1, r, oldp);
                                             ^
   include/linux/refcount.h:227:9: note: Calling '__refcount_add_not_zero'
           return __refcount_add_not_zero(1, r, oldp);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:152:26: note: Passing null pointer value via 1s=
t parameter 'r'
           int old =3D refcount_read(r);
                                   ^
   include/linux/refcount.h:152:12: note: Calling 'refcount_read'
           int old =3D refcount_read(r);
                     ^~~~~~~~~~~~~~~~
   include/linux/refcount.h:147:21: note: Passing null pointer value via 1s=
t parameter 'v'
           return atomic_read(&r->refs);
                              ^~~~~~~~
   include/linux/refcount.h:147:9: note: Calling 'atomic_read'
           return atomic_read(&r->refs);
                  ^~~~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:28:9: note: Left side of '||'=
 is false
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/atomic/atomic-instrumented.h:28:9: note: Left side of '||'=
 is false
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:302:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   include/linux/atomic/atomic-instrumented.h:28:9: note: Left side of '||'=
 is true
           return arch_atomic_read(v);
                  ^
   arch/arm/include/asm/atomic.h:25:29: note: expanded from macro 'arch_ato=
mic_read'
   #define arch_atomic_read(v)     READ_ONCE((v)->counter)
                                   ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:303:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))

vim +28 include/linux/atomic/atomic-instrumented.h

aa525d063851a9 include/asm-generic/atomic-instrumented.h Mark Rutland 2018-=
09-04  23  =

c020395b6634b7 include/asm-generic/atomic-instrumented.h Marco Elver  2019-=
11-26  24  static __always_inline int
aa525d063851a9 include/asm-generic/atomic-instrumented.h Mark Rutland 2018-=
09-04  25  atomic_read(const atomic_t *v)
aa525d063851a9 include/asm-generic/atomic-instrumented.h Mark Rutland 2018-=
09-04  26  {
ed8af2e4d2a71b include/asm-generic/atomic-instrumented.h Marco Elver  2020-=
01-21  27  	instrument_atomic_read(v, sizeof(*v));
aa525d063851a9 include/asm-generic/atomic-instrumented.h Mark Rutland 2018-=
09-04 @28  	return arch_atomic_read(v);
aa525d063851a9 include/asm-generic/atomic-instrumented.h Mark Rutland 2018-=
09-04  29  }
aa525d063851a9 include/asm-generic/atomic-instrumented.h Mark Rutland 2018-=
09-04  30  =


:::::: The code at line 28 was first introduced by commit
:::::: aa525d063851a98e020b827fdd1d7776ae652301 locking/atomics: Switch to =
generated instrumentation

:::::: TO: Mark Rutland <mark.rutland@arm.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7711315146069961151==--

