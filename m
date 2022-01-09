Content-Type: multipart/mixed; boundary="===============4803005575043393073=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/x86/kvm/lapic.c:957:9: warning: Array access results in a null pointer dereference [clang-analyzer-core.NullDereference]
Date: Mon, 10 Jan 2022 04:11:46 +0800
Message-ID: <202201100458.JjselEzw-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4803005575043393073==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4634129ad9fdc89d10b597fc6f8f4336fb61e105
commit: c2f79a65b4b66681894ef7d7e3912ba55acc20d5 KVM: x86: WARN if the APIC=
 map is dirty without an in-kernel local APIC
date:   5 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-c007-20220108 (https://download.01.org/0day-ci/ar=
chive/20220110/202201100458.JjselEzw-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f3a344=
d2125fa37e59bae1b0874442c650a19607)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc2f79a65b4b66681894ef7d7e3912ba55acc20d5
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c2f79a65b4b66681894ef7d7e3912ba55acc20d5
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
                   page =3D alloc_pages_node(nid, gfp_mask, 0);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/sparse-vmemmap.c:339:7: note: Assuming 'page' is null
                   if (!page)
                       ^~~~~
   mm/sparse-vmemmap.c:339:3: note: Taking true branch
                   if (!page)
                   ^
   mm/sparse-vmemmap.c:340:4: note: Control jumps to line 346
                           goto out;
                           ^
   mm/sparse-vmemmap.c:346:2: note: Left side of '&&' is false
           list_for_each_entry_safe(page, next, list, lru)
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/kernel.h:495:61: note: expanded from macro 'container_of'
           BUILD_BUG_ON_MSG(!__same_type(*(ptr), ((type *)0)->member) &&   \
                                                                      ^
   mm/sparse-vmemmap.c:346:2: note: Taking false branch
           list_for_each_entry_safe(page, next, list, lru)
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:308:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   mm/sparse-vmemmap.c:346:2: note: Loop condition is false.  Exiting loop
           list_for_each_entry_safe(page, next, list, lru)
           ^
   include/linux/list.h:715:13: note: expanded from macro 'list_for_each_en=
try_safe'
           for (pos =3D list_first_entry(head, typeof(*pos), member),      =
  \
                      ^
   include/linux/list.h:522:2: note: expanded from macro 'list_first_entry'
           list_entry((ptr)->next, type, member)
           ^
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:316:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:306:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   mm/sparse-vmemmap.c:346:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(page, next, list, lru)
           ^
   include/linux/list.h:716:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:555:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:511:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kernel.h:494:2: note: expanded from macro 'container_of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   arch/x86/kvm/i8259.c:255:4: warning: Value stored to 'irq' is never read=
 [clang-analyzer-deadcode.DeadStores]
                           irq =3D irq2 + 8;
                           ^     ~~~~~~~~
   arch/x86/kvm/i8259.c:255:4: note: Value stored to 'irq' is never read
                           irq =3D irq2 + 8;
                           ^     ~~~~~~~~
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
>> arch/x86/kvm/lapic.c:957:9: warning: Array access results in a null poin=
ter dereference [clang-analyzer-core.NullDereference]
                           if (!(*dst)[i])
                                ^
   arch/x86/kvm/lapic.c:1171:2: note: 'dest_vcpu' initialized to a null poi=
nter value
           struct kvm_lapic **dest_vcpu =3D NULL;
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/lapic.c:1180:8: note: Left side of '||' is false
           map =3D rcu_dereference(kvm->arch.apic_map);
                 ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   arch/x86/kvm/lapic.c:1180:8: note: Left side of '||' is false
           map =3D rcu_dereference(kvm->arch.apic_map);
                 ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   arch/x86/kvm/lapic.c:1180:8: note: Left side of '||' is false
           map =3D rcu_dereference(kvm->arch.apic_map);
                 ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:290:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   arch/x86/kvm/lapic.c:1180:8: note: Left side of '||' is true
           map =3D rcu_dereference(kvm->arch.apic_map);
                 ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:38: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                                               ^
   arch/x86/kvm/lapic.c:1180:8: note: Taking false branch
           map =3D rcu_dereference(kvm->arch.apic_map);
                 ^
   include/linux/rcupdate.h:596:28: note: expanded from macro 'rcu_derefere=
nce'
   #define rcu_dereference(p) rcu_dereference_check(p, 0)
                              ^
   include/linux/rcupdate.h:528:2: note: expanded from macro 'rcu_dereferen=
ce_check'
           __rcu_dereference_check((p), (c) || rcu_read_lock_held(), __rcu)
           ^
   include/linux/rcupdate.h:389:48: note: expanded from macro '__rcu_derefe=
rence_check'
           typeof(*p) *________p1 =3D (typeof(*p) *__force)READ_ONCE(p); \
                                                         ^
   note: (skipping 2 expansions in backtrace; use -fmacro-backtrace-limit=
=3D0 to see all)
   include/linux/compiler_types.h:328:2: note: expanded from macro 'compile=
time_assert'

vim +957 arch/x86/kvm/lapic.c

1e08ec4a130e27 Gleb Natapov  2012-09-13  910  =

64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  911  /* Return true=
 if the interrupt can be handled by using *bitmap as index mask
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  912   * for valid d=
estinations in *dst array.
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  913   * Return fals=
e if kvm_apic_map_get_dest_lapic did nothing useful.
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  914   * Note: we ma=
y have zero kvm_lapic destinations when we return true, which
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  915   * means that =
the interrupt should be dropped.  In this case, *bitmap would be
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  916   * zero and *d=
st undefined.
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  917   */
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  918  static inline =
bool kvm_apic_map_get_dest_lapic(struct kvm *kvm,
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  919  		struct kvm_l=
apic **src, struct kvm_lapic_irq *irq,
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  920  		struct kvm_a=
pic_map *map, struct kvm_lapic ***dst,
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  921  		unsigned lon=
g *bitmap)
1e08ec4a130e27 Gleb Natapov  2012-09-13  922  {
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  923  	int i, lowest;
9ea369b032d87b Radim Kr=C4=8Dm=C3=A1=C5=99  2015-02-12  924  =

64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  925  	if (irq->shor=
thand =3D=3D APIC_DEST_SELF && src) {
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  926  		*dst =3D src;
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  927  		*bitmap =3D =
1;
1e08ec4a130e27 Gleb Natapov  2012-09-13  928  		return true;
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  929  	} else if (ir=
q->shorthand)
1e08ec4a130e27 Gleb Natapov  2012-09-13  930  		return false;
1e08ec4a130e27 Gleb Natapov  2012-09-13  931  =

c519265f2aa348 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  932  	if (!map || k=
vm_apic_is_broadcast_dest(kvm, src, irq, map))
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  933  		return false;
698f9755d9c061 Radim Kr=C4=8Dm=C3=A1=C5=99  2014-11-27  934  =

3697f302ab3700 Radim Kr=C4=8Dm=C3=A1=C5=99  2015-01-29  935  	if (irq->dest=
_mode =3D=3D APIC_DEST_PHYSICAL) {
0ca52e7b81a372 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  936  		if (irq->des=
t_id > map->max_apic_id) {
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  937  			*bitmap =3D=
 0;
1e08ec4a130e27 Gleb Natapov  2012-09-13  938  		} else {
1d487e9bf8ba66 Paolo Bonzini 2019-04-11  939  			u32 dest_id =3D array_inde=
x_nospec(irq->dest_id, map->max_apic_id + 1);
1d487e9bf8ba66 Paolo Bonzini 2019-04-11  940  			*dst =3D &map->phys_map[de=
st_id];
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  941  			*bitmap =3D=
 1;
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  942  		}
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  943  		return true;
3548a259f6990d Radim Kr=C4=8Dm=C3=A1=C5=99  2015-02-12  944  	}
3548a259f6990d Radim Kr=C4=8Dm=C3=A1=C5=99  2015-02-12  945  =

64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  946  	*bitmap =3D 0;
e45115b62f9abb Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  947  	if (!kvm_apic=
_map_get_logical_dest(map, irq->dest_id, dst,
e45115b62f9abb Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  948  				(u16 *)bit=
map))
e45115b62f9abb Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  949  		return false;
1e08ec4a130e27 Gleb Natapov  2012-09-13  950  =

520040146a0af3 Feng Wu       2016-01-25  951  	if (!kvm_lowest_prio_deliver=
y(irq))
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  952  		return true;
520040146a0af3 Feng Wu       2016-01-25  953  =

520040146a0af3 Feng Wu       2016-01-25  954  	if (!kvm_vector_hashing_enab=
led()) {
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  955  		lowest =3D -=
1;
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  956  		for_each_set=
_bit(i, bitmap, 16) {
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12 @957  			if (!(*dst)=
[i])
1e08ec4a130e27 Gleb Natapov  2012-09-13  958  				continue;
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  959  			if (lowest =
< 0)
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  960  				lowest =3D=
 i;
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  961  			else if (kv=
m_apic_compare_prio((*dst)[i]->vcpu,
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  962  						(*dst)[l=
owest]->vcpu) < 0)
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  963  				lowest =3D=
 i;
1e08ec4a130e27 Gleb Natapov  2012-09-13  964  		}
520040146a0af3 Feng Wu       2016-01-25  965  	} else {
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  966  		if (!*bitmap)
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  967  			return true;
520040146a0af3 Feng Wu       2016-01-25  968  =

64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  969  		lowest =3D k=
vm_vector_to_index(irq->vector, hweight16(*bitmap),
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  970  				bitmap, 16=
);
520040146a0af3 Feng Wu       2016-01-25  971  =

64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  972  		if (!(*dst)[=
lowest]) {
4efd805fca5590 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-02-12  973  			kvm_apic_di=
sabled_lapic_found(kvm);
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  974  			*bitmap =3D=
 0;
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  975  			return true;
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  976  		}
520040146a0af3 Feng Wu       2016-01-25  977  	}
520040146a0af3 Feng Wu       2016-01-25  978  =

64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  979  	*bitmap =3D (=
lowest >=3D 0) ? 1 << lowest : 0;
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  980  =

64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  981  	return true;
1e08ec4a130e27 Gleb Natapov  2012-09-13  982  }
64aa47bfc45323 Radim Kr=C4=8Dm=C3=A1=C5=99  2016-07-12  983  =


:::::: The code@line 957 was first introduced by commit
:::::: 64aa47bfc45323040d5db8f30cbd6851f2606c7d KVM: x86: add kvm_apic_map_=
get_dest_lapic

:::::: TO: Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcmar@redhat.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4803005575043393073==--

