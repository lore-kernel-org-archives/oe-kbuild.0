Content-Type: multipart/mixed; boundary="===============6453204177316059708=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v1 09/13] KVM: x86/mmu: Split huge pages when dirty logging is enabled
Date: Thu, 16 Dec 2021 19:20:43 +0800
Message-ID: <202112161909.MY90V3mF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6453204177316059708==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20211213225918.672507-10-dmatlack@google.com>
References: <20211213225918.672507-10-dmatlack@google.com>
TO: David Matlack <dmatlack@google.com>
TO: Paolo Bonzini <pbonzini@redhat.com>
CC: kvm(a)vger.kernel.org
CC: Ben Gardon <bgardon@google.com>
CC: Joerg Roedel <joro@8bytes.org>
CC: Jim Mattson <jmattson@google.com>
CC: Wanpeng Li <wanpengli@tencent.com>
CC: Vitaly Kuznetsov <vkuznets@redhat.com>
CC: Sean Christopherson <seanjc@google.com>
CC: "Janis Schoetterl-Glausch" <scgl@linux.vnet.ibm.com>
CC: Junaid Shahid <junaids@google.com>

Hi David,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 1c10f4b4877ffaed602d12ff8cbbd5009e82c970]

url:    https://github.com/0day-ci/linux/commits/David-Matlack/KVM-x86-mmu-=
Eager-Page-Splitting-for-the-TDP-MMU/20211214-070153
base:   1c10f4b4877ffaed602d12ff8cbbd5009e82c970
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021-20211216 (https://download.01.org/0day-ci/arch=
ive/20211216/202112161909.MY90V3mF-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/x86/kvm/mmu/spte.c:239 make_huge_page_split_spte() warn: should '(inde=
x * ((1 << (12 + ((child_level - 1) * 9))) / ((1) << 12))) << 12' be a 64 b=
it type?

vim +239 arch/x86/kvm/mmu/spte.c

4be03bd08ef69e David Matlack 2021-12-13  209  =

4be03bd08ef69e David Matlack 2021-12-13  210  /*
4be03bd08ef69e David Matlack 2021-12-13  211   * Construct an SPTE that map=
s a sub-page of the given huge page SPTE where
4be03bd08ef69e David Matlack 2021-12-13  212   * `index` identifies which s=
ub-page.
4be03bd08ef69e David Matlack 2021-12-13  213   *
4be03bd08ef69e David Matlack 2021-12-13  214   * This is used during huge p=
age splitting to build the SPTEs that make up the
4be03bd08ef69e David Matlack 2021-12-13  215   * new page table.
4be03bd08ef69e David Matlack 2021-12-13  216   */
4be03bd08ef69e David Matlack 2021-12-13  217  u64 make_huge_page_split_spte=
(u64 huge_spte, int huge_level, int index, unsigned int access)
4be03bd08ef69e David Matlack 2021-12-13  218  {
4be03bd08ef69e David Matlack 2021-12-13  219  	u64 child_spte;
4be03bd08ef69e David Matlack 2021-12-13  220  	int child_level;
4be03bd08ef69e David Matlack 2021-12-13  221  =

4be03bd08ef69e David Matlack 2021-12-13  222  	if (WARN_ON(is_mmio_spte(hug=
e_spte)))
4be03bd08ef69e David Matlack 2021-12-13  223  		return 0;
4be03bd08ef69e David Matlack 2021-12-13  224  =

4be03bd08ef69e David Matlack 2021-12-13  225  	if (WARN_ON(!is_shadow_prese=
nt_pte(huge_spte)))
4be03bd08ef69e David Matlack 2021-12-13  226  		return 0;
4be03bd08ef69e David Matlack 2021-12-13  227  =

4be03bd08ef69e David Matlack 2021-12-13  228  	if (WARN_ON(!is_large_pte(hu=
ge_spte)))
4be03bd08ef69e David Matlack 2021-12-13  229  		return 0;
4be03bd08ef69e David Matlack 2021-12-13  230  =

4be03bd08ef69e David Matlack 2021-12-13  231  	child_spte =3D huge_spte;
4be03bd08ef69e David Matlack 2021-12-13  232  	child_level =3D huge_level -=
 1;
4be03bd08ef69e David Matlack 2021-12-13  233  =

4be03bd08ef69e David Matlack 2021-12-13  234  	/*
4be03bd08ef69e David Matlack 2021-12-13  235  	 * The child_spte already ha=
s the base address of the huge page being
4be03bd08ef69e David Matlack 2021-12-13  236  	 * split. So we just have to=
 OR in the offset to the page@the next
4be03bd08ef69e David Matlack 2021-12-13  237  	 * lower level for the given=
 index.
4be03bd08ef69e David Matlack 2021-12-13  238  	 */
4be03bd08ef69e David Matlack 2021-12-13 @239  	child_spte |=3D (index * KVM=
_PAGES_PER_HPAGE(child_level)) << PAGE_SHIFT;
4be03bd08ef69e David Matlack 2021-12-13  240  =

4be03bd08ef69e David Matlack 2021-12-13  241  	if (child_level =3D=3D PG_LE=
VEL_4K) {
4be03bd08ef69e David Matlack 2021-12-13  242  		child_spte &=3D ~PT_PAGE_SI=
ZE_MASK;
4be03bd08ef69e David Matlack 2021-12-13  243  =

4be03bd08ef69e David Matlack 2021-12-13  244  		/* Allow execution for 4K p=
ages if it was disabled for NX HugePages. */
4be03bd08ef69e David Matlack 2021-12-13  245  		if (is_nx_huge_page_enabled=
() && access & ACC_EXEC_MASK)
4be03bd08ef69e David Matlack 2021-12-13  246  			child_spte =3D mark_spte_e=
xecutable(child_spte);
4be03bd08ef69e David Matlack 2021-12-13  247  	}
4be03bd08ef69e David Matlack 2021-12-13  248  =

4be03bd08ef69e David Matlack 2021-12-13  249  	return child_spte;
4be03bd08ef69e David Matlack 2021-12-13  250  }
4be03bd08ef69e David Matlack 2021-12-13  251  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============6453204177316059708==--

