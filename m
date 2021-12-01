Content-Type: multipart/mixed; boundary="===============3772057717161128555=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/riscv/include/asm/atomic.h:30:9: warning: Use of memory after it is freed [clang-analyzer-unix.Malloc]
Date: Wed, 01 Dec 2021 20:03:56 +0800
Message-ID: <202112012033.UvMtQN3d-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3772057717161128555==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Xie He <xie.he.0141@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   58e1100fdc5990b0cc0d4beaf2562a92e621ac7d
commit: b491e6a7391e3ecdebdd7a097550195cc878924a net: lapb: Add locking to =
the lapb module
date:   10 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 10 months ago
config: riscv-randconfig-c006-20211128 (https://download.01.org/0day-ci/arc=
hive/20211201/202112012033.UvMtQN3d-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project 5162b5=
58d8c0b542e752b037e72a69d5fd51eb1e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Db491e6a7391e3ecdebdd7a097550195cc878924a
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout b491e6a7391e3ecdebdd7a097550195cc878924a
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   kernel/bpf/btf.c:4242:2: note: Taking false branch
           if (err)
           ^
   kernel/bpf/btf.c:4248:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/bpf/btf.c:4248:2: note: Taking false branch
           if (err)
           ^
   kernel/bpf/btf.c:4251:8: note: Calling 'btf_parse_type_sec'
           err =3D btf_parse_type_sec(env);
                 ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:4003:6: note: Assuming the condition is false
           if (hdr->type_off & (sizeof(u32) - 1)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:4003:2: note: Taking false branch
           if (hdr->type_off & (sizeof(u32) - 1)) {
           ^
   kernel/bpf/btf.c:4008:17: note: Field 'base_btf' is non-null
           if (!env->btf->base_btf && !hdr->type_len) {
                          ^
   kernel/bpf/btf.c:4008:26: note: Left side of '&&' is false
           if (!env->btf->base_btf && !hdr->type_len) {
                                   ^
   kernel/bpf/btf.c:4014:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/bpf/btf.c:4014:2: note: Taking false branch
           if (err)
           ^
   kernel/bpf/btf.c:4017:9: note: Calling 'btf_check_all_types'
           return btf_check_all_types(env);
                  ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:3965:6: note: 'err' is 0
           if (err)
               ^~~
   kernel/bpf/btf.c:3965:2: note: Taking false branch
           if (err)
           ^
   kernel/bpf/btf.c:3969:11: note: Assuming pointer value is null
           for (i =3D btf->base_btf ? 0 : 1; i < btf->nr_types; i++) {
                    ^~~~~~~~~~~~~
   kernel/bpf/btf.c:3969:11: note: Assuming field 'base_btf' is null
           for (i =3D btf->base_btf ? 0 : 1; i < btf->nr_types; i++) {
                    ^~~~~~~~~~~~~
   kernel/bpf/btf.c:3969:11: note: '?' condition is false
   kernel/bpf/btf.c:3969:34: note: Assuming 'i' is < field 'nr_types'
           for (i =3D btf->base_btf ? 0 : 1; i < btf->nr_types; i++) {
                                           ^~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:3969:2: note: Loop condition is true.  Entering loop bo=
dy
           for (i =3D btf->base_btf ? 0 : 1; i < btf->nr_types; i++) {
           ^
   kernel/bpf/btf.c:3971:7: note: Calling 'btf_type_by_id'
                   t =3D btf_type_by_id(btf, type_id);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:709:9: note: Assuming 'type_id' is < field 'start_id'
           while (type_id < btf->start_id)
                  ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:709:2: note: Loop condition is true.  Entering loop body
           while (type_id < btf->start_id)
           ^
   kernel/bpf/btf.c:710:3: note: Null pointer value stored to 'btf'
                   btf =3D btf->base_btf;
                   ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:709:19: note: Access to field 'start_id' results in a d=
ereference of a null pointer (loaded from variable 'btf')
           while (type_id < btf->start_id)
                            ^~~
   kernel/bpf/btf.c:790:3: warning: Value stored to 'id' is never read [cla=
ng-analyzer-deadcode.DeadStores]
                   id =3D t->type;
                   ^    ~~~~~~~
   kernel/bpf/btf.c:790:3: note: Value stored to 'id' is never read
                   id =3D t->type;
                   ^    ~~~~~~~
   kernel/bpf/btf.c:817:25: warning: Value stored to 't' during its initial=
ization is never read [clang-analyzer-deadcode.DeadStores]
           const struct btf_type *t =3D show->state.type;
                                  ^   ~~~~~~~~~~~~~~~~
   kernel/bpf/btf.c:817:25: note: Value stored to 't' during its initializa=
tion is never read
           const struct btf_type *t =3D show->state.type;
                                  ^   ~~~~~~~~~~~~~~~~
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   Suppressed 12 warnings (12 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
>> arch/riscv/include/asm/atomic.h:30:9: warning: Use of memory after it is=
 freed [clang-analyzer-unix.Malloc]
           return READ_ONCE(v->counter);
                  ^
   include/asm-generic/rwonce.h:50:2: note: expanded from macro 'READ_ONCE'
           __READ_ONCE(x);                                                 \
           ^
   include/asm-generic/rwonce.h:44:24: note: expanded from macro '__READ_ON=
CE'
   #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(=
x))
                           ^
   net/lapb/lapb_iface.c:181:6: note: Assuming 'lapb' is non-null
           if (!lapb)
               ^~~~~
   net/lapb/lapb_iface.c:181:2: note: Taking false branch
           if (!lapb)
           ^
   net/lapb/lapb_iface.c:183:2: note: Calling 'lapb_put'
           lapb_put(lapb);
           ^~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:57:2: note: Taking true branch
           if (refcount_dec_and_test(&lapb->refcnt))
           ^
   net/lapb/lapb_iface.c:58:3: note: Calling 'lapb_free_cb'
                   lapb_free_cb(lapb);
                   ^~~~~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:47:2: note: Memory is released
           kfree(lapb);
           ^~~~~~~~~~~
   net/lapb/lapb_iface.c:58:3: note: Returning; memory was released via 1st=
 parameter
                   lapb_free_cb(lapb);
                   ^~~~~~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:183:2: note: Returning; memory was released via 1s=
t parameter
           lapb_put(lapb);
           ^~~~~~~~~~~~~~
   net/lapb/lapb_iface.c:186:9: note: Calling 'refcount_read'
           while (refcount_read(&lapb->refcnt) > 2)
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/refcount.h:147:9: note: Calling 'atomic_read'
           return atomic_read(&r->refs);
                  ^~~~~~~~~~~~~~~~~~~~~
   arch/riscv/include/asm/atomic.h:30:9: note: Left side of '||' is false
           return READ_ONCE(v->counter);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:282:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   arch/riscv/include/asm/atomic.h:30:9: note: Left side of '||' is false
           return READ_ONCE(v->counter);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:282:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   arch/riscv/include/asm/atomic.h:30:9: note: Left side of '||' is true
           return READ_ONCE(v->counter);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:283:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   arch/riscv/include/asm/atomic.h:30:9: note: Taking false branch
           return READ_ONCE(v->counter);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:320:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:308:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:300:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   arch/riscv/include/asm/atomic.h:30:9: note: Loop condition is false.  Ex=
iting loop
           return READ_ONCE(v->counter);
                  ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \

vim +30 arch/riscv/include/asm/atomic.h

fab957c11efe2f Palmer Dabbelt 2017-07-10  21  =

fd2efaa4eb5317 Mark Rutland   2018-07-16  22  #define __atomic_acquire_fenc=
e()					\
fd2efaa4eb5317 Mark Rutland   2018-07-16  23  	__asm__ __volatile__(RISCV_A=
CQUIRE_BARRIER "" ::: "memory")
fd2efaa4eb5317 Mark Rutland   2018-07-16  24  =

fd2efaa4eb5317 Mark Rutland   2018-07-16  25  #define __atomic_release_fenc=
e()					\
fd2efaa4eb5317 Mark Rutland   2018-07-16  26  	__asm__ __volatile__(RISCV_R=
ELEASE_BARRIER "" ::: "memory");
5ce6c1f3535fa8 Andrea Parri   2018-03-09  27  =

fab957c11efe2f Palmer Dabbelt 2017-07-10  28  static __always_inline int at=
omic_read(const atomic_t *v)
fab957c11efe2f Palmer Dabbelt 2017-07-10  29  {
fab957c11efe2f Palmer Dabbelt 2017-07-10 @30  	return READ_ONCE(v->counter);
fab957c11efe2f Palmer Dabbelt 2017-07-10  31  }
fab957c11efe2f Palmer Dabbelt 2017-07-10  32  static __always_inline void a=
tomic_set(atomic_t *v, int i)
fab957c11efe2f Palmer Dabbelt 2017-07-10  33  {
fab957c11efe2f Palmer Dabbelt 2017-07-10  34  	WRITE_ONCE(v->counter, i);
fab957c11efe2f Palmer Dabbelt 2017-07-10  35  }
fab957c11efe2f Palmer Dabbelt 2017-07-10  36  =


:::::: The code at line 30 was first introduced by commit
:::::: fab957c11efe2f405e08b9f0d080524bc2631428 RISC-V: Atomic and Locking =
Code

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============3772057717161128555==--

