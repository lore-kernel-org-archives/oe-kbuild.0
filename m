Content-Type: multipart/mixed; boundary="===============8888166218221552777=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 60/160] arch/x86/kvm/mmu/mmu.c:770:10: warning: Assigned value is garbage or undefined [clang-analyzer-core.uninitialized.Assign]
Date: Tue, 22 Feb 2022 14:52:20 +0800
Message-ID: <202202221446.Zl54ddYc-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8888166218221552777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Sean Christopherson <sean.j.christopherson@intel.com>
CC: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   a549602d4d30c1eaf6d8ca0b7793197392e69bda
commit: b6b6e18df0fbece51058f008081208eb5a5ff6d9 [60/160] KVM: x86/mmu: All=
ow non-zero init value for shadow PTE
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-c007-20220221 (https://download.01.org/0day-ci/ar=
chive/20220222/202202221446.Zl54ddYc-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/b6b6e18df0fbece51058f00808120=
8eb5a5ff6d9
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout b6b6e18df0fbece51058f008081208eb5a5ff6d9
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
               ^
   drivers/media/rc/rc-main.c:1795:34: note: Assuming field 'size' is not e=
qual to 0
           if (!rc_map || !rc_map->scan || rc_map->size =3D=3D 0)
                                           ^~~~~~~~~~~~~~~~~
   drivers/media/rc/rc-main.c:1795:2: note: Taking false branch
           if (!rc_map || !rc_map->scan || rc_map->size =3D=3D 0)
           ^
   drivers/media/rc/rc-main.c:1798:7: note: Calling 'ir_setkeytable'
           rc =3D ir_setkeytable(dev, rc_map);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/rc-main.c:477:7: note: Calling 'ir_create_table'
           rc =3D ir_create_table(dev, rc_map, from->name, from->rc_proto,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/rc-main.c:218:6: note: Assuming field 'name' is non-null
           if (!rc_map->name)
               ^~~~~~~~~~~~~
   drivers/media/rc/rc-main.c:218:2: note: Taking false branch
           if (!rc_map->name)
           ^
   drivers/media/rc/rc-main.c:221:18: note: '?' condition is false
           rc_map->alloc =3D roundup_pow_of_two(size * sizeof(struct rc_map=
_table));
                           ^
   include/linux/log2.h:176:2: note: expanded from macro 'roundup_pow_of_tw=
o'
           __builtin_constant_p(n) ? (             \
           ^
   drivers/media/rc/rc-main.c:223:17: note: Uninitialized value stored to f=
ield 'scancode'
           rc_map->scan =3D kmalloc(rc_map->alloc, GFP_KERNEL);
                          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/rc-main.c:224:6: note: Assuming field 'scan' is non-null
           if (!rc_map->scan) {
               ^~~~~~~~~~~~~
   drivers/media/rc/rc-main.c:224:2: note: Taking false branch
           if (!rc_map->scan) {
           ^
   drivers/media/rc/rc-main.c:230:2: note: Taking false branch
           dev_dbg(&dev->dev, "Allocated space for %u keycode entries (%u b=
ytes)\n",
           ^
   include/linux/dev_printk.h:162:2: note: expanded from macro 'dev_dbg'
           if (0)                                                          \
           ^
   drivers/media/rc/rc-main.c:477:7: note: Returning from 'ir_create_table'
           rc =3D ir_create_table(dev, rc_map, from->name, from->rc_proto,
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/rc-main.c:479:6: note: 'rc' is 0
           if (rc)
               ^~
   drivers/media/rc/rc-main.c:479:2: note: Taking false branch
           if (rc)
           ^
   drivers/media/rc/rc-main.c:482:14: note: 'i' is < field 'size'
           for (i =3D 0; i < from->size; i++) {
                       ^
   drivers/media/rc/rc-main.c:482:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < from->size; i++) {
           ^
   drivers/media/rc/rc-main.c:483:11: note: Calling 'ir_establish_scancode'
                   index =3D ir_establish_scancode(dev, rc_map,
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/media/rc/rc-main.c:384:6: note: Assuming field 'scancode_mask' i=
s 0
           if (dev->scancode_mask)
               ^~~~~~~~~~~~~~~~~~
   drivers/media/rc/rc-main.c:384:2: note: Taking false branch
           if (dev->scancode_mask)
           ^
   drivers/media/rc/rc-main.c:388:14: note: Assuming 'i' is < field 'len'
           for (i =3D 0; i < rc_map->len; i++) {
                       ^~~~~~~~~~~~~~~
   drivers/media/rc/rc-main.c:388:2: note: Loop condition is true.  Enterin=
g loop body
           for (i =3D 0; i < rc_map->len; i++) {
           ^
   drivers/media/rc/rc-main.c:389:32: note: The left operand of '=3D=3D' is=
 a garbage value
                   if (rc_map->scan[i].scancode =3D=3D scancode)
                       ~~~~~~~~~~~~~~~~~~~~~~~~ ^
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   Suppressed 7 warnings (7 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   8 warnings generated.
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> arch/x86/kvm/mmu/mmu.c:770:10: warning: Assigned value is garbage or und=
efined [clang-analyzer-core.uninitialized.Assign]
                   for (i =3D start; i < end; i++)
                          ^
   arch/x86/kvm/mmu/mmu.c:5294:7: note: Left side of '||' is false
           if (!READ_ONCE(vcpu->kvm->arch.indirect_shadow_pages))
                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   arch/x86/kvm/mmu/mmu.c:5294:7: note: Left side of '||' is false
           if (!READ_ONCE(vcpu->kvm->arch.indirect_shadow_pages))
                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:313:3: note: expanded from macro '__nativ=
e_word'
           (sizeof(t) =3D=3D sizeof(char) || sizeof(t) =3D=3D sizeof(short)=
 || \
            ^
   arch/x86/kvm/mmu/mmu.c:5294:7: note: Left side of '||' is true
           if (!READ_ONCE(vcpu->kvm->arch.indirect_shadow_pages))
                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:21: note: expanded from macro 'compileti=
me_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
                              ^
   include/linux/compiler_types.h:314:28: note: expanded from macro '__nati=
ve_word'
            sizeof(t) =3D=3D sizeof(int) || sizeof(t) =3D=3D sizeof(long))
                                     ^
   arch/x86/kvm/mmu/mmu.c:5294:7: note: Taking false branch
           if (!READ_ONCE(vcpu->kvm->arch.indirect_shadow_pages))
                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:326:3: note: expanded from macro '__compi=
letime_assert'
                   if (!(condition))                                       \
                   ^
   arch/x86/kvm/mmu/mmu.c:5294:7: note: Loop condition is false.  Exiting l=
oop
           if (!READ_ONCE(vcpu->kvm->arch.indirect_shadow_pages))
                ^
   include/asm-generic/rwonce.h:49:2: note: expanded from macro 'READ_ONCE'
           compiletime_assert_rwonce_type(x);                              \
           ^
   include/asm-generic/rwonce.h:36:2: note: expanded from macro 'compiletim=
e_assert_rwonce_type'
           compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(l=
ong long),  \
           ^
   include/linux/compiler_types.h:346:2: note: expanded from macro 'compile=
time_assert'
           _compiletime_assert(condition, msg, __compiletime_assert_, __COU=
NTER__)
           ^
   include/linux/compiler_types.h:334:2: note: expanded from macro '_compil=
etime_assert'
           __compiletime_assert(condition, msg, prefix, suffix)
           ^
   include/linux/compiler_types.h:318:2: note: expanded from macro '__compi=
letime_assert'
           do {                                                            \
           ^
   arch/x86/kvm/mmu/mmu.c:5294:6: note: Assuming the condition is false
           if (!READ_ONCE(vcpu->kvm->arch.indirect_shadow_pages))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:5294:2: note: Taking false branch
           if (!READ_ONCE(vcpu->kvm->arch.indirect_shadow_pages))
           ^
   arch/x86/kvm/mmu/mmu.c:5297:2: note: Loop condition is false.  Exiting l=
oop
           pgprintk("%s: gpa %llx bytes %d\n", __func__, gpa, bytes);
           ^
   arch/x86/kvm/mmu/mmu_internal.h:18:24: note: expanded from macro 'pgprin=
tk'
   #define pgprintk(x...) do { } while (0)
                          ^
   arch/x86/kvm/mmu/mmu.c:5304:2: note: Calling 'mmu_topup_memory_caches'
           mmu_topup_memory_caches(vcpu, true);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:783:6: note: Assuming 'r' is 0
           if (r)
               ^
   arch/x86/kvm/mmu/mmu.c:783:2: note: Taking false branch
           if (r)
           ^
   arch/x86/kvm/mmu/mmu.c:785:6: note: Calling 'mmu_topup_shadow_page_cache'
           r =3D mmu_topup_shadow_page_cache(vcpu);
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:759:6: note: 'start' declared without an initial =
value
           int start, end, i, r;

vim +770 arch/x86/kvm/mmu/mmu.c

b6b6e18df0fbece Sean Christopherson 2019-07-29  755  =

b6b6e18df0fbece Sean Christopherson 2019-07-29  756  static int mmu_topup_s=
hadow_page_cache(struct kvm_vcpu *vcpu)
b6b6e18df0fbece Sean Christopherson 2019-07-29  757  {
b6b6e18df0fbece Sean Christopherson 2019-07-29  758  	struct kvm_mmu_memory=
_cache *mc =3D &vcpu->arch.mmu_shadow_page_cache;
b6b6e18df0fbece Sean Christopherson 2019-07-29  759  	int start, end, i, r;
b6b6e18df0fbece Sean Christopherson 2019-07-29  760  =

b6b6e18df0fbece Sean Christopherson 2019-07-29  761  	if (shadow_init_value)
b6b6e18df0fbece Sean Christopherson 2019-07-29  762  		start =3D kvm_mmu_me=
mory_cache_nr_free_objects(mc);
b6b6e18df0fbece Sean Christopherson 2019-07-29  763  =

b6b6e18df0fbece Sean Christopherson 2019-07-29  764  	r =3D kvm_mmu_topup_m=
emory_cache(mc, PT64_ROOT_MAX_LEVEL);
b6b6e18df0fbece Sean Christopherson 2019-07-29  765  	if (r)
b6b6e18df0fbece Sean Christopherson 2019-07-29  766  		return r;
b6b6e18df0fbece Sean Christopherson 2019-07-29  767  =

b6b6e18df0fbece Sean Christopherson 2019-07-29  768  	if (shadow_init_value=
) {
b6b6e18df0fbece Sean Christopherson 2019-07-29  769  		end =3D kvm_mmu_memo=
ry_cache_nr_free_objects(mc);
b6b6e18df0fbece Sean Christopherson 2019-07-29 @770  		for (i =3D start; i =
< end; i++)
b6b6e18df0fbece Sean Christopherson 2019-07-29  771  			kvm_init_shadow_pag=
e(mc->objects[i]);
b6b6e18df0fbece Sean Christopherson 2019-07-29  772  	}
b6b6e18df0fbece Sean Christopherson 2019-07-29  773  	return 0;
b6b6e18df0fbece Sean Christopherson 2019-07-29  774  }
b6b6e18df0fbece Sean Christopherson 2019-07-29  775  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8888166218221552777==--

