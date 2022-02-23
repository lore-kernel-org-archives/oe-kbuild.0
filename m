Content-Type: multipart/mixed; boundary="===============0030129048616090850=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 155/160] arch/x86/kvm/mmu/mmu.c:3227:34: warning: Dereference of undefined pointer value (loaded from field 'sptep') [clang-analyzer-core.NullDereference]
Date: Wed, 23 Feb 2022 08:01:45 +0800
Message-ID: <202202230735.Q0KkzJfu-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0030129048616090850==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   a549602d4d30c1eaf6d8ca0b7793197392e69bda
commit: bc215305405aab0c7eb765a4764d27b5007935ed [155/160] KVM: x86/legacy =
mmu: prohibit mapping private or shared page for legacy MMU
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-c007-20220221 (https://download.01.org/0day-ci/ar=
chive/20220223/202202230735.Q0KkzJfu-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project d271fc=
04d5b97b12e6b797c6067d3c96a8d7470e)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel/tdx/commit/bc215305405aab0c7eb765a4764d2=
7b5007935ed
        git remote add intel-tdx https://github.com/intel/tdx.git
        git fetch --no-tags intel-tdx kvm-upstream-workaround
        git checkout bc215305405aab0c7eb765a4764d27b5007935ed
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   arch/x86/kvm/mmu/mmu.c:4316:6: note: Assuming 'sp' is non-null
           if (sp && is_obsolete_sp(vcpu->kvm, sp))
               ^~
   arch/x86/kvm/mmu/mmu.c:4316:6: note: Left side of '&&' is true
   arch/x86/kvm/mmu/mmu.c:4316:2: note: Taking false branch
           if (sp && is_obsolete_sp(vcpu->kvm, sp))
           ^
   arch/x86/kvm/mmu/mmu.c:4327:7: note: 'sp' is non-null
           if (!sp && kvm_test_request(KVM_REQ_MMU_RELOAD, vcpu))
                ^~
   arch/x86/kvm/mmu/mmu.c:4327:10: note: Left side of '&&' is false
           if (!sp && kvm_test_request(KVM_REQ_MMU_RELOAD, vcpu))
                   ^
   arch/x86/kvm/mmu/mmu.c:4330:16: note: Field 'slot' is non-null
           return fault->slot &&
                         ^
   arch/x86/kvm/mmu/mmu.c:4330:9: note: Left side of '&&' is true
           return fault->slot &&
                  ^
   arch/x86/kvm/mmu/mmu.c:4330:2: note: Returning without writing to 'fault=
->gfn', which participates in a condition later
           return fault->slot &&
           ^
   arch/x86/kvm/mmu/mmu.c:4371:6: note: Returning from 'is_page_fault_stale'
           if (is_page_fault_stale(vcpu, fault, mmu_seq))
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4371:2: note: Taking false branch
           if (is_page_fault_stale(vcpu, fault, mmu_seq))
           ^
   arch/x86/kvm/mmu/mmu.c:4375:6: note: 'r' is 0
           if (r)
               ^
   arch/x86/kvm/mmu/mmu.c:4375:2: note: Taking false branch
           if (r)
           ^
   arch/x86/kvm/mmu/mmu.c:4378:6: note: 'is_tdp_mmu_fault' is false
           if (is_tdp_mmu_fault)
               ^~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:4378:2: note: Taking false branch
           if (is_tdp_mmu_fault)
           ^
   arch/x86/kvm/mmu/mmu.c:4381:7: note: Calling '__direct_map'
                   r =3D __direct_map(vcpu, fault);
                       ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3234:20: note: Calling 'kvm_is_private_gfn'
           bool is_private =3D kvm_is_private_gfn(vcpu->kvm, fault->addr >>=
 PAGE_SHIFT);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   arch/x86/kvm/mmu.h:411:9: note: 'mask' is 0
           return mask && !(gfn & mask);
                  ^~~~
   arch/x86/kvm/mmu.h:411:14: note: Left side of '&&' is false
           return mask && !(gfn & mask);
                       ^
   arch/x86/kvm/mmu.h:411:2: note: Returning zero, which participates in a =
condition later
           return mask && !(gfn & mask);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3234:20: note: Returning from 'kvm_is_private_gfn'
           bool is_private =3D kvm_is_private_gfn(vcpu->kvm, fault->addr >>=
 PAGE_SHIFT);
                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3239:6: note: Calling 'is_error_noslot_pfn'
           if (is_error_noslot_pfn(fault->pfn) || kvm_is_reserved_pfn(fault=
->pfn)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:116:10: note: Assuming the condition is false
           return !!(pfn & KVM_PFN_ERR_NOSLOT_MASK);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kvm_host.h:116:2: note: Returning the value 1, which parti=
cipates in a condition later
           return !!(pfn & KVM_PFN_ERR_NOSLOT_MASK);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3239:6: note: Returning from 'is_error_noslot_pfn'
           if (is_error_noslot_pfn(fault->pfn) || kvm_is_reserved_pfn(fault=
->pfn)) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3239:38: note: Left side of '||' is true
           if (is_error_noslot_pfn(fault->pfn) || kvm_is_reserved_pfn(fault=
->pfn)) {
                                               ^
   arch/x86/kvm/mmu/mmu.c:3240:7: note: 'is_private' is false
                   if (is_private)
                       ^~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3240:3: note: Taking false branch
                   if (is_private)
                   ^
   arch/x86/kvm/mmu/mmu.c:3253:2: note: Calling '__direct_populate_nonleaf'
           __direct_populate_nonleaf(vcpu, fault, &it, &base_gfn);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3181:2: note: 'base_gfn' declared without an init=
ial value
           gfn_t base_gfn;
           ^~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3186:2: note: Loop condition is false. Execution =
continues on line 3213
           for_each_shadow_entry(vcpu, fault->addr, it) {
           ^
   arch/x86/kvm/mmu/mmu.c:181:2: note: expanded from macro 'for_each_shadow=
_entry'
           for (shadow_walk_init(&(_walker), _vcpu, _addr);        \
           ^
   arch/x86/kvm/mmu/mmu.c:3214:6: note: 'base_gfnp' is non-null
           if (base_gfnp)
               ^~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3214:2: note: Taking true branch
           if (base_gfnp)
           ^
   arch/x86/kvm/mmu/mmu.c:3215:14: note: Assigned value is garbage or undef=
ined
                   *base_gfnp =3D base_gfn;
                              ^ ~~~~~~~~
>> arch/x86/kvm/mmu/mmu.c:3227:34: warning: Dereference of undefined pointe=
r value (loaded from field 'sptep') [clang-analyzer-core.NullDereference]
           return is_private_prohibit_spte(*it.sptep);
                                           ^   ~~~~~
   arch/x86/kvm/mmu/mmu.c:3222:2: note: Calling 'shadow_walk_init'
           for_each_shadow_entry(vcpu, gpa_private, it) {
           ^
   arch/x86/kvm/mmu/mmu.c:181:7: note: expanded from macro 'for_each_shadow=
_entry'
           for (shadow_walk_init(&(_walker), _vcpu, _addr);        \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2422:6: note: Assuming 'tdp_enabled' is false
           if (tdp_enabled && kvm_is_private_gfn(vcpu->kvm, addr >> PAGE_SH=
IFT))
               ^~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2422:18: note: Left side of '&&' is false
           if (tdp_enabled && kvm_is_private_gfn(vcpu->kvm, addr >> PAGE_SH=
IFT))
                           ^
   arch/x86/kvm/mmu/mmu.c:2426:2: note: Calling 'shadow_walk_init_using_roo=
t'
           shadow_walk_init_using_root(iterator, vcpu, root, addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2396:6: note: Assuming field 'level' is < PT64_RO=
OT_4LEVEL
           if (iterator->level >=3D PT64_ROOT_4LEVEL &&
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2396:42: note: Left side of '&&' is false
           if (iterator->level >=3D PT64_ROOT_4LEVEL &&
                                                   ^
   arch/x86/kvm/mmu/mmu.c:2401:6: note: Assuming field 'level' is not equal=
 to PT32E_ROOT_LEVEL
           if (iterator->level =3D=3D PT32E_ROOT_LEVEL) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2401:2: note: Taking false branch
           if (iterator->level =3D=3D PT32E_ROOT_LEVEL) {
           ^
   arch/x86/kvm/mmu/mmu.c:2415:1: note: Returning without writing to 'itera=
tor->sptep'
   }
   ^
   arch/x86/kvm/mmu/mmu.c:2426:2: note: Returning from 'shadow_walk_init_us=
ing_root'
           shadow_walk_init_using_root(iterator, vcpu, root, addr);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2427:1: note: Returning without writing to 'itera=
tor->sptep'
   }
   ^
   arch/x86/kvm/mmu/mmu.c:3222:2: note: Returning from 'shadow_walk_init'
           for_each_shadow_entry(vcpu, gpa_private, it) {
           ^
   arch/x86/kvm/mmu/mmu.c:181:7: note: expanded from macro 'for_each_shadow=
_entry'
           for (shadow_walk_init(&(_walker), _vcpu, _addr);        \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3222:2: note: Calling 'shadow_walk_okay'
           for_each_shadow_entry(vcpu, gpa_private, it) {
           ^
   arch/x86/kvm/mmu/mmu.c:182:7: note: expanded from macro 'for_each_shadow=
_entry'
                shadow_walk_okay(&(_walker));                      \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2431:6: note: Assuming field 'level' is < PG_LEVE=
L_4K
           if (iterator->level < PG_LEVEL_4K)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:2431:2: note: Taking true branch
           if (iterator->level < PG_LEVEL_4K)
           ^
   arch/x86/kvm/mmu/mmu.c:2432:3: note: Returning without writing to 'itera=
tor->sptep'
                   return false;
                   ^
   arch/x86/kvm/mmu/mmu.c:3222:2: note: Returning from 'shadow_walk_okay'
           for_each_shadow_entry(vcpu, gpa_private, it) {
           ^
   arch/x86/kvm/mmu/mmu.c:182:7: note: expanded from macro 'for_each_shadow=
_entry'
                shadow_walk_okay(&(_walker));                      \
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/x86/kvm/mmu/mmu.c:3222:2: note: Loop condition is false. Execution =
continues on line 3227
           for_each_shadow_entry(vcpu, gpa_private, it) {
           ^
   arch/x86/kvm/mmu/mmu.c:181:2: note: expanded from macro 'for_each_shadow=
_entry'
           for (shadow_walk_init(&(_walker), _vcpu, _addr);        \
           ^
   arch/x86/kvm/mmu/mmu.c:3227:34: note: Dereference of undefined pointer v=
alue (loaded from field 'sptep')
           return is_private_prohibit_spte(*it.sptep);
                                           ^   ~~~~~
   arch/x86/kvm/mmu/mmu.c:3851:3: warning: Value stored to 'r' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                   r =3D -EIO;
                   ^   ~~~~
   arch/x86/kvm/mmu/mmu.c:3851:3: note: Value stored to 'r' is never read
                   r =3D -EIO;
                   ^   ~~~~
   arch/x86/kvm/mmu/mmu.c:3865:4: warning: Value stored to 'r' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                           r =3D -EIO;
                           ^   ~~~~
   arch/x86/kvm/mmu/mmu.c:3865:4: note: Value stored to 'r' is never read
                           r =3D -EIO;
                           ^   ~~~~
   arch/x86/kvm/mmu/mmu.c:3872:5: warning: Value stored to 'r' is never rea=
d [clang-analyzer-deadcode.DeadStores]
                                   r =3D -EIO;
                                   ^   ~~~~
   arch/x86/kvm/mmu/mmu.c:3872:5: note: Value stored to 'r' is never read
                                   r =3D -EIO;
                                   ^   ~~~~
   Suppressed 8 warnings (8 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/sptep +3227 arch/x86/kvm/mmu/mmu.c

b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3172  =

a679a18f3da984 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3173 =
 static void __direct_populate_nonleaf(struct kvm_vcpu *vcpu,
a679a18f3da984 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3174 =
 				struct kvm_page_fault *fault,
a679a18f3da984 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3175 =
 				struct kvm_shadow_walk_iterator *itp,
a679a18f3da984 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3176 =
 				gfn_t *base_gfnp)
140754bc80e1cd arch/x86/kvm/mmu.c     Avi Kivity          2008-08-22  3177 =
 {
a9e679a21dbee6 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-27  3178 =
 	bool is_private =3D kvm_is_private_gfn(vcpu->kvm, gpa_to_gfn(fault->addr)=
);
3fcf2d1bdeb6a5 arch/x86/kvm/mmu.c     Paolo Bonzini       2019-06-24  3179 =
 	struct kvm_shadow_walk_iterator it;
140754bc80e1cd arch/x86/kvm/mmu.c     Avi Kivity          2008-08-22  3180 =
 	struct kvm_mmu_page *sp;
a679a18f3da984 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3181 =
 	gfn_t base_gfn;
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  3182  =

73a3c659478a2e arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-07  3183 =
 	kvm_mmu_hugepage_adjust(vcpu, fault);
4cd071d13c5cc6 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2019-12-06  3184  =

f0066d94c92dc5 arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-06  3185 =
 	trace_kvm_mmu_spte_requested(fault);
43b74355ef8ba8 arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-06  3186 =
 	for_each_shadow_entry(vcpu, fault->addr, it) {
b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3187 =
 		/*
b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3188 =
 		 * We cannot overwrite existing page tables with an NX
b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3189 =
 		 * large page, as the leaf could be executable.
b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3190 =
 		 */
73a3c659478a2e arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-07  3191 =
 		if (fault->nx_huge_page_workaround_enabled)
536f0e6ace95aa arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-06  3192 =
 			disallowed_hugepage_adjust(fault, *it.sptep, it.level);
b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3193  =

43b74355ef8ba8 arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-06  3194 =
 		base_gfn =3D fault->gfn & ~(KVM_PAGES_PER_HPAGE(it.level) - 1);
73a3c659478a2e arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-07  3195 =
 		if (it.level =3D=3D fault->goal_level)
9f652d21c3f887 arch/x86/kvm/mmu.c     Avi Kivity          2008-12-25  3196 =
 			break;
c9fa0b3bef9a0b arch/x86/kvm/mmu.c     Lai Jiangshan       2010-05-26  3197  =

3fcf2d1bdeb6a5 arch/x86/kvm/mmu.c     Paolo Bonzini       2019-06-24  3198 =
 		drop_large_spte(vcpu, it.sptep);
03fffc5493c8c8 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-07-02  3199 =
 		if (is_shadow_present_pte(*it.sptep))
03fffc5493c8c8 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-07-02  3200 =
 			continue;
03fffc5493c8c8 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2021-07-02  3201  =

bfb1971423d7ec arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-26  3202 =
 		sp =3D kvm_mmu_get_page(vcpu, base_gfn, it.addr, it.level - 1,
a9e679a21dbee6 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-27  3203 =
 				      true, ACC_ALL, is_private);
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  3204  =

3fcf2d1bdeb6a5 arch/x86/kvm/mmu.c     Paolo Bonzini       2019-06-24  3205 =
 		link_shadow_page(vcpu, it.sptep, sp);
73a3c659478a2e arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-07  3206 =
 		if (fault->is_tdp && fault->huge_page_disallowed &&
73a3c659478a2e arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-07  3207 =
 		    fault->req_level >=3D it.level)
b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3208 =
 			account_huge_nx_page(vcpu->kvm, sp);
a9e679a21dbee6 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-27  3209 =
 		if (is_private)
a9e679a21dbee6 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-27  3210 =
 			kvm_mmu_link_private_sp(vcpu->kvm, sp);
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  3211 =
 	}
3fcf2d1bdeb6a5 arch/x86/kvm/mmu.c     Paolo Bonzini       2019-06-24  3212  =

a679a18f3da984 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3213 =
 	*itp =3D it;
a679a18f3da984 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12 @3214 =
 	if (base_gfnp)
a679a18f3da984 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3215 =
 		*base_gfnp =3D base_gfn;
a679a18f3da984 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3216 =
 }
a679a18f3da984 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3217  =

bc215305405aab arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-19  3218 =
 static bool mmu_private_prohibit(struct kvm_vcpu *vcpu, gpa_t gpa_private)
bc215305405aab arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-19  3219 =
 {
bc215305405aab arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-19  3220 =
 	struct kvm_shadow_walk_iterator it;
bc215305405aab arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-19  3221  =

bc215305405aab arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-19  3222 =
 	for_each_shadow_entry(vcpu, gpa_private, it) {
bc215305405aab arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-19  3223 =
 		if (!is_shadow_present_pte(*it.sptep))
bc215305405aab arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-19  3224 =
 			break;
bc215305405aab arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-19  3225 =
 	}
bc215305405aab arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-19  3226  =

bc215305405aab arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-19 @3227 =
 	return is_private_prohibit_spte(*it.sptep);
bc215305405aab arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-19  3228 =
 }
bc215305405aab arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-19  3229  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0030129048616090850==--

