Content-Type: multipart/mixed; boundary="===============2270039467456860802=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [intel-tdx:kvm-upstream-workaround 192/308] arch/x86/kvm/mmu/mmu.c:3194 __direct_populate_nonleaf() error: uninitialized symbol 'base_gfn'.
Date: Wed, 17 Aug 2022 07:19:07 +0800
Message-ID: <202208170731.En9MpxuW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2270039467456860802==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Isaku Yamahata <isaku.yamahata@intel.com>

tree:   https://github.com/intel/tdx.git kvm-upstream-workaround
head:   85c097fdd1667a842a9e75d8f658fc16bd72981a
commit: b917e5926dbb22c59f48063fb6196fb7dad75e03 [192/308] KVM: x86/legacy =
mmu: factor out __direct_map()
:::::: branch date: 14 hours ago
:::::: commit date: 14 hours ago
config: x86_64-randconfig-m001-20220815 (https://download.01.org/0day-ci/ar=
chive/20220817/202208170731.En9MpxuW-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/kvm/mmu/mmu.c:3194 __direct_populate_nonleaf() error: uninitialize=
d symbol 'base_gfn'.

Old smatch warnings:
arch/x86/kvm/mmu/mmu.c:7296 __mem_attr_is_mixed() error: uninitialized symb=
ol 'entry'.

vim +/base_gfn +3194 arch/x86/kvm/mmu/mmu.c

b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3157  =

b917e5926dbb22 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3158 =
 static void __direct_populate_nonleaf(struct kvm_vcpu *vcpu,
b917e5926dbb22 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3159 =
 				struct kvm_page_fault *fault,
b917e5926dbb22 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3160 =
 				struct kvm_shadow_walk_iterator *itp,
b917e5926dbb22 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3161 =
 				gfn_t *base_gfnp)
140754bc80e1cd arch/x86/kvm/mmu.c     Avi Kivity          2008-08-22  3162 =
 {
3fcf2d1bdeb6a5 arch/x86/kvm/mmu.c     Paolo Bonzini       2019-06-24  3163 =
 	struct kvm_shadow_walk_iterator it;
140754bc80e1cd arch/x86/kvm/mmu.c     Avi Kivity          2008-08-22  3164 =
 	struct kvm_mmu_page *sp;
b917e5926dbb22 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3165 =
 	gfn_t base_gfn;
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  3166  =

73a3c659478a2e arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-07  3167 =
 	kvm_mmu_hugepage_adjust(vcpu, fault);
4cd071d13c5cc6 arch/x86/kvm/mmu/mmu.c Sean Christopherson 2019-12-06  3168  =

f0066d94c92dc5 arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-06  3169 =
 	trace_kvm_mmu_spte_requested(fault);
43b74355ef8ba8 arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-06  3170 =
 	for_each_shadow_entry(vcpu, fault->addr, it) {
b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3171 =
 		/*
b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3172 =
 		 * We cannot overwrite existing page tables with an NX
b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3173 =
 		 * large page, as the leaf could be executable.
b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3174 =
 		 */
73a3c659478a2e arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-07  3175 =
 		if (fault->nx_huge_page_workaround_enabled)
536f0e6ace95aa arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-06  3176 =
 			disallowed_hugepage_adjust(fault, *it.sptep, it.level);
b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3177  =

43b74355ef8ba8 arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-06  3178 =
 		base_gfn =3D fault->gfn & ~(KVM_PAGES_PER_HPAGE(it.level) - 1);
73a3c659478a2e arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-07  3179 =
 		if (it.level =3D=3D fault->goal_level)
9f652d21c3f887 arch/x86/kvm/mmu.c     Avi Kivity          2008-12-25  3180 =
 			break;
c9fa0b3bef9a0b arch/x86/kvm/mmu.c     Lai Jiangshan       2010-05-26  3181  =

2e65e842c57d72 arch/x86/kvm/mmu/mmu.c David Matlack       2022-06-22  3182 =
 		sp =3D kvm_mmu_get_child_sp(vcpu, it.sptep, base_gfn, true, ACC_ALL);
0cd8dc73983308 arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2022-06-22  3183 =
 		if (sp =3D=3D ERR_PTR(-EEXIST))
0cd8dc73983308 arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2022-06-22  3184 =
 			continue;
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  3185  =

3fcf2d1bdeb6a5 arch/x86/kvm/mmu.c     Paolo Bonzini       2019-06-24  3186 =
 		link_shadow_page(vcpu, it.sptep, sp);
73a3c659478a2e arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-07  3187 =
 		if (fault->is_tdp && fault->huge_page_disallowed &&
73a3c659478a2e arch/x86/kvm/mmu/mmu.c Paolo Bonzini       2021-08-07  3188 =
 		    fault->req_level >=3D it.level)
b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini       2019-11-04  3189 =
 			account_huge_nx_page(vcpu->kvm, sp);
6aa8b732ca01c3 drivers/kvm/mmu.c      Avi Kivity          2006-12-10  3190 =
 	}
3fcf2d1bdeb6a5 arch/x86/kvm/mmu.c     Paolo Bonzini       2019-06-24  3191  =

b917e5926dbb22 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3192 =
 	*itp =3D it;
b917e5926dbb22 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3193 =
 	if (base_gfnp)
b917e5926dbb22 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12 @3194 =
 		*base_gfnp =3D base_gfn;
b917e5926dbb22 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3195 =
 }
b917e5926dbb22 arch/x86/kvm/mmu/mmu.c Isaku Yamahata      2022-01-12  3196  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2270039467456860802==--

