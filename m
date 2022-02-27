Content-Type: multipart/mixed; boundary="===============2736487271863910652=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2961:42: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Sun, 27 Feb 2022 09:01:30 +0800
Message-ID: <202202270852.bZcVLzId-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2736487271863910652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexandre Ghiti <alexandre.ghiti@canonical.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2c8c230edab57eae6d2e8df7239ef121a45a1443
commit: e8a62cc26ddf53a3c6ba2a8d33036cf7b84f3923 riscv: Implement sv48 supp=
ort
date:   5 weeks ago
:::::: branch date: 7 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-c006-20220225 (https://download.01.org/0day-ci/arc=
hive/20220227/202202270852.bZcVLzId-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3De8a62cc26ddf53a3c6ba2a8d33036cf7b84f3923
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout e8a62cc26ddf53a3c6ba2a8d33036cf7b84f3923
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   drivers/hwmon/lm75.h:29:12: note: '?' condition is true
   drivers/hwmon/lm75.h:30:29: note: The result of the left shift is undefi=
ned because the left operand is negative
           return (u16)((ntemp / 500) << 7);
                        ~~~~~~~~~~~~~ ^
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   drivers/media/dvb-frontends/cx24120.c:1225:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D cx24120_writereg(state, CX24120_REG_CLKDIV, state->dcur.=
clkdiv);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/media/dvb-frontends/cx24120.c:1225:2: note: Value stored to 'ret=
' is never read
           ret =3D cx24120_writereg(state, CX24120_REG_CLKDIV, state->dcur.=
clkdiv);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~
   drivers/media/dvb-frontends/cx24120.c:1229:2: warning: Value stored to '=
ret' is never read [clang-analyzer-deadcode.DeadStores]
           ret =3D cx24120_writereg(state, CX24120_REG_RATEDIV, ret);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:1229:2: note: Value stored to 'ret=
' is never read
           ret =3D cx24120_writereg(state, CX24120_REG_RATEDIV, ret);
           ^     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:1471:24: warning: Value stored to =
'state' during its initialization is never read [clang-analyzer-deadcode.De=
adStores]
           struct cx24120_state *state =3D fe->demodulator_priv;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/cx24120.c:1471:24: note: Value stored to 'st=
ate' during its initialization is never read
           struct cx24120_state *state =3D fe->demodulator_priv;
                                 ^~~~~   ~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   drivers/media/dvb-frontends/si21xx.c:830:2: warning: Value stored to 'st=
atus' is never read [clang-analyzer-deadcode.DeadStores]
           status |=3D si21_writeregs(state, PLL_DIVISOR_REG, &regs[0], 0x0=
4);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/dvb-frontends/si21xx.c:830:2: note: Value stored to 'statu=
s' is never read
           status |=3D si21_writeregs(state, PLL_DIVISOR_REG, &regs[0], 0x0=
4);
           ^         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   block/bfq-wf2q.c:263:7: warning: Access to field 'my_sched_data' results=
 in a dereference of a null pointer (loaded from variable 'entity') [clang-=
analyzer-core.NullDereference]
           if (!entity->my_sched_data)
                ^
   block/bfq-wf2q.c:1508:2: note: 'entity' initialized to a null pointer va=
lue
           struct bfq_entity *entity =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-wf2q.c:1512:6: note: Assuming the condition is false
           if (bfq_tot_busy_queues(bfqd) =3D=3D 0)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-wf2q.c:1512:2: note: Taking false branch
           if (bfq_tot_busy_queues(bfqd) =3D=3D 0)
           ^
   block/bfq-wf2q.c:1521:2: note: Loop condition is false. Execution contin=
ues on line 1582
           for (; sd ; sd =3D entity->my_sched_data) {
           ^
   block/bfq-wf2q.c:1582:28: note: Passing null pointer value via 1st param=
eter 'entity'
           bfqq =3D bfq_entity_to_bfqq(entity);
                                     ^~~~~~
   block/bfq-wf2q.c:1582:9: note: Calling 'bfq_entity_to_bfqq'
           bfqq =3D bfq_entity_to_bfqq(entity);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~
   block/bfq-wf2q.c:263:7: note: Access to field 'my_sched_data' results in=
 a dereference of a null pointer (loaded from variable 'entity')
           if (!entity->my_sched_data)
                ^~~~~~
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (3 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2961:42: warning: Assigned v=
alue is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
           for ( ; start_gfn <=3D end_gfn; start_gfn +=3D nr_pages_avail) {
                                                   ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3057:9: note: Calling 'kvm_r=
ead_guest_offset_cached'
           return kvm_read_guest_offset_cached(kvm, ghc, data, 0, len);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3033:9: note: Assuming the c=
ondition is false
           BUG_ON(len + offset > ghc->len);
                  ^
   include/asm-generic/bug.h:161:45: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                               ^~~~~~~~~
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3033:2: note: Taking false b=
ranch
           BUG_ON(len + offset > ghc->len);
           ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3033:2: note: Loop condition=
 is false.  Exiting loop
           BUG_ON(len + offset > ghc->len);
           ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                             ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3035:6: note: Assuming 'slot=
s->generation' is not equal to 'ghc->generation'
           if (slots->generation !=3D ghc->generation) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3035:2: note: Taking true br=
anch
           if (slots->generation !=3D ghc->generation) {
           ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3036:7: note: Calling '__kvm=
_gfn_to_hva_cache_init'
                   if (__kvm_gfn_to_hva_cache_init(slots, ghc, ghc->gpa, gh=
c->len))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2947:2: note: 'nr_pages_avai=
l' declared without an initial value
           gfn_t nr_pages_avail;
           ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2952:6: note: Assuming 'star=
t_gfn' is <=3D 'end_gfn'
           if (start_gfn > end_gfn) {
               ^~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2952:2: note: Taking false b=
ranch
           if (start_gfn > end_gfn) {
           ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2961:10: note: 'start_gfn' i=
s <=3D 'end_gfn'
           for ( ; start_gfn <=3D end_gfn; start_gfn +=3D nr_pages_avail) {
                   ^~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2961:2: note: Loop condition=
 is true.  Entering loop body
           for ( ; start_gfn <=3D end_gfn; start_gfn +=3D nr_pages_avail) {
           ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2963:14: note: Calling 'gfn_=
to_hva_many'
                   ghc->hva =3D gfn_to_hva_many(ghc->memslot, start_gfn,
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2164:9: note: Calling '__gfn=
_to_hva_many'
           return __gfn_to_hva_many(slot, gfn, nr_pages, true);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2149:7: note: 'slot' is non-=
null
           if (!slot || slot->flags & KVM_MEMSLOT_INVALID)
                ^~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2149:6: note: Left side of '=
||' is false
           if (!slot || slot->flags & KVM_MEMSLOT_INVALID)
               ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2149:15: note: Assuming the =
condition is false
           if (!slot || slot->flags & KVM_MEMSLOT_INVALID)
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2149:2: note: Taking false b=
ranch
           if (!slot || slot->flags & KVM_MEMSLOT_INVALID)
           ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2152:6: note: Assuming the c=
ondition is true
           if (memslot_is_readonly(slot) && write)
               ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2152:6: note: Left side of '=
&&' is true
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2152:35: note: 'write' is tr=
ue
           if (memslot_is_readonly(slot) && write)
                                            ^~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2152:2: note: Taking true br=
anch
           if (memslot_is_readonly(slot) && write)
           ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2153:3: note: Returning with=
out writing to '*nr_pages'
                   return KVM_HVA_ERR_RO_BAD;
                   ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2164:9: note: Returning from=
 '__gfn_to_hva_many'
           return __gfn_to_hva_many(slot, gfn, nr_pages, true);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2164:2: note: Returning with=
out writing to '*nr_pages'
           return __gfn_to_hva_many(slot, gfn, nr_pages, true);
           ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2963:14: note: Returning fro=
m 'gfn_to_hva_many'
                   ghc->hva =3D gfn_to_hva_many(ghc->memslot, start_gfn,
                              ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2965:7: note: Calling 'kvm_i=
s_error_hva'
                   if (kvm_is_error_hva(ghc->hva))
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:130:9: note: Assuming 'addr' is < field 'page_o=
ffset'
           return addr >=3D PAGE_OFFSET;
                  ^~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:130:2: note: Returning zero, which participates=
 in a condition later
           return addr >=3D PAGE_OFFSET;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:2965:7: note: Returning from=
 'kvm_is_error_hva'

vim +2961 arch/riscv/kvm/../../../virt/kvm/kvm_main.c

8e73485c7959fd Paolo Bonzini       2015-05-17  2938  =

5a2d4365d2c39e Paolo Bonzini       2017-02-03  2939  static int __kvm_gfn_t=
o_hva_cache_init(struct kvm_memslots *slots,
5a2d4365d2c39e Paolo Bonzini       2017-02-03  2940  				       struct gfn_=
to_hva_cache *ghc,
8f964525a121f2 Andrew Honig        2013-03-29  2941  				       gpa_t gpa, =
unsigned long len)
49c7754ce57063 Gleb Natapov        2010-10-18  2942  {
49c7754ce57063 Gleb Natapov        2010-10-18  2943  	int offset =3D offset=
_in_page(gpa);
8f964525a121f2 Andrew Honig        2013-03-29  2944  	gfn_t start_gfn =3D g=
pa >> PAGE_SHIFT;
8f964525a121f2 Andrew Honig        2013-03-29  2945  	gfn_t end_gfn =3D (gp=
a + len - 1) >> PAGE_SHIFT;
8f964525a121f2 Andrew Honig        2013-03-29  2946  	gfn_t nr_pages_needed=
 =3D end_gfn - start_gfn + 1;
8f964525a121f2 Andrew Honig        2013-03-29  2947  	gfn_t nr_pages_avail;
49c7754ce57063 Gleb Natapov        2010-10-18  2948  =

6ad1e29fe0aba8 Sean Christopherson 2020-01-09  2949  	/* Update ghc->genera=
tion before performing any error checks. */
49c7754ce57063 Gleb Natapov        2010-10-18  2950  	ghc->generation =3D s=
lots->generation;
6ad1e29fe0aba8 Sean Christopherson 2020-01-09  2951  =

6ad1e29fe0aba8 Sean Christopherson 2020-01-09  2952  	if (start_gfn > end_g=
fn) {
f1b9dd5eb86cec Jim Mattson         2018-12-17  2953  		ghc->hva =3D KVM_HVA=
_ERR_BAD;
6ad1e29fe0aba8 Sean Christopherson 2020-01-09  2954  		return -EINVAL;
6ad1e29fe0aba8 Sean Christopherson 2020-01-09  2955  	}
f1b9dd5eb86cec Jim Mattson         2018-12-17  2956  =

8f964525a121f2 Andrew Honig        2013-03-29  2957  	/*
8f964525a121f2 Andrew Honig        2013-03-29  2958  	 * If the requested r=
egion crosses two memslots, we still
8f964525a121f2 Andrew Honig        2013-03-29  2959  	 * verify that the en=
tire region is valid here.
8f964525a121f2 Andrew Honig        2013-03-29  2960  	 */
6ad1e29fe0aba8 Sean Christopherson 2020-01-09 @2961  	for ( ; start_gfn <=
=3D end_gfn; start_gfn +=3D nr_pages_avail) {
5a2d4365d2c39e Paolo Bonzini       2017-02-03  2962  		ghc->memslot =3D __g=
fn_to_memslot(slots, start_gfn);
8f964525a121f2 Andrew Honig        2013-03-29  2963  		ghc->hva =3D gfn_to_=
hva_many(ghc->memslot, start_gfn,
8f964525a121f2 Andrew Honig        2013-03-29  2964  					   &nr_pages_avai=
l);
8f964525a121f2 Andrew Honig        2013-03-29  2965  		if (kvm_is_error_hva=
(ghc->hva))
6ad1e29fe0aba8 Sean Christopherson 2020-01-09  2966  			return -EFAULT;
8f964525a121f2 Andrew Honig        2013-03-29  2967  	}
f1b9dd5eb86cec Jim Mattson         2018-12-17  2968  =

8f964525a121f2 Andrew Honig        2013-03-29  2969  	/* Use the slow path =
for cross page reads and writes. */
6ad1e29fe0aba8 Sean Christopherson 2020-01-09  2970  	if (nr_pages_needed =
=3D=3D 1)
f1b9dd5eb86cec Jim Mattson         2018-12-17  2971  		ghc->hva +=3D offset;
f1b9dd5eb86cec Jim Mattson         2018-12-17  2972  	else
8f964525a121f2 Andrew Honig        2013-03-29  2973  		ghc->memslot =3D NUL=
L;
f1b9dd5eb86cec Jim Mattson         2018-12-17  2974  =

6ad1e29fe0aba8 Sean Christopherson 2020-01-09  2975  	ghc->gpa =3D gpa;
6ad1e29fe0aba8 Sean Christopherson 2020-01-09  2976  	ghc->len =3D len;
6ad1e29fe0aba8 Sean Christopherson 2020-01-09  2977  	return 0;
49c7754ce57063 Gleb Natapov        2010-10-18  2978  }
5a2d4365d2c39e Paolo Bonzini       2017-02-03  2979  =


:::::: The code at line 2961 was first introduced by commit
:::::: 6ad1e29fe0aba843dfffc714fced0ef6a2e19502 KVM: Clean up __kvm_gfn_to_=
hva_cache_init() and its callers

:::::: TO: Sean Christopherson <sean.j.christopherson@intel.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2736487271863910652==--

