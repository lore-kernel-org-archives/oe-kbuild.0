Content-Type: multipart/mixed; boundary="===============4845708814818334009=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [nvdimm:libnvdimm-for-next 6/7] arch/x86/mm/pat/set_memory.c:1943 set_mce_nospec() warn: should 'pfn << 12' be a 64 bit type?
Date: Sat, 14 May 2022 02:06:27 +0800
Message-ID: <202205140205.9ZVu7BcU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4845708814818334009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-nvdimm(a)lists.01.org
TO: Jane Chu <jane.chu@oracle.com>
CC: Dan Williams <dan.j.williams@intel.com>
CC: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/nvdimm/nvdimm.git l=
ibnvdimm-for-next
head:   e4628f04a31a3c3e03364a16bbfac0f07ad02b40
commit: 39702cf7885c0806576fd3d04450394467db60b4 [6/7] x86/mce: relocate se=
t{clear}_mce_nospec() functions
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
514/202205140205.9ZVu7BcU-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-20) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
arch/x86/mm/pat/set_memory.c:1943 set_mce_nospec() warn: should 'pfn << 12'=
 be a 64 bit type?

Old smatch warnings:
arch/x86/mm/pat/set_memory.c:2335 kernel_map_pages_in_pgd() warn: bitwise A=
ND condition is false here

vim +1943 arch/x86/mm/pat/set_memory.c

75cbade8ea3127 arch/x86/mm/pageattr.c       Arjan van de Ven 2008-01-30  19=
27  =

39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
28  /*
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
29   * Prevent speculative access to the page by either unmapping
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
30   * it (if we do not require access to any part of the page) or
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
31   * marking it uncacheable (if we want to try to retrieve data
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
32   * from non-poisoned lines in the page).
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
33   */
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
34  int set_mce_nospec(unsigned long pfn, bool unmap)
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
35  {
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
36  	unsigned long decoy_addr;
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
37  	int rc;
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
38  =

39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
39  	if (!IS_ENABLED(CONFIG_64BIT))
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
40  		return 0;
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
41  =

39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
42  	/* SGX pages are not in the 1:1 map */
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22 @19=
43  	if (arch_is_platform_page(pfn << PAGE_SHIFT))
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
44  		return 0;
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
45  	/*
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
46  	 * We would like to just call:
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
47  	 *      set_memory_XX((unsigned long)pfn_to_kaddr(pfn), 1);
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
48  	 * but doing that would radically increase the odds of a
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
49  	 * speculative access to the poison page because we'd have
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
50  	 * the virtual address of the kernel 1:1 mapping sitting
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
51  	 * around in registers.
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
52  	 * Instead we get tricky.  We create a non-canonical address
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
53  	 * that looks just like the one we want, but has bit 63 flipped.
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
54  	 * This relies on set_memory_XX() properly sanitizing any __pa()
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
55  	 * results with __PHYSICAL_MASK or PTE_PFN_MASK.
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
56  	 */
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
57  	decoy_addr =3D (pfn << PAGE_SHIFT) + (PAGE_OFFSET ^ BIT(63));
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
58  =

39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
59  	if (unmap)
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
60  		rc =3D set_memory_np(decoy_addr, 1);
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
61  	else
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
62  		rc =3D set_memory_uc(decoy_addr, 1);
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
63  	if (rc)
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
64  		pr_warn("Could not invalidate pfn=3D0x%lx from 1:1 map\n", pfn);
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
65  	return rc;
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
66  }
39702cf7885c08 arch/x86/mm/pat/set_memory.c Jane Chu         2022-04-22  19=
67  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4845708814818334009==--

