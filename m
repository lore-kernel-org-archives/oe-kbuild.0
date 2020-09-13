Content-Type: multipart/mixed; boundary="===============4489367859622878166=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [habanaai:dev/ogabbay/nic_patchset_v2 33/56] drivers/misc/habanalabs/common/mmu_v1.c:399:16: warning: Variable 'hop2_pte_addr' is reassigned a value before the old one has been used.
Date: Mon, 14 Sep 2020 02:27:37 +0800
Message-ID: <202009140233.wOgkQaz6%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4489367859622878166==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: Moti Haimovski <mhaimovski@habana.ai>
CC: Oded Gabbay <oded.gabbay@gmail.com>

tree:   https://github.com/HabanaAI/linux.git dev/ogabbay/nic_patchset_v2
head:   8ff5d9e889ea76aeffd08ce4faeff1e40152d716
commit: b4123293c186dce375459b425131df23f7340ef9 [33/56] habanalabs: rename=
 mmu.c to mmu_v1.c
:::::: branch date: 28 hours ago
:::::: commit date: 33 hours ago
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/misc/habanalabs/common/mmu_v1.c:399:16: warning: Variable 'hop2_=
pte_addr' is reassigned a value before the old one has been used. [redundan=
tAssignment]
    hop2_pte_addr =3D hop2_addr;
                  ^
   drivers/misc/habanalabs/common/mmu_v1.c:398:16: note: Variable 'hop2_pte=
_addr' is reassigned a value before the old one has been used.
    hop2_pte_addr =3D hop2_addr;
                  ^
   drivers/misc/habanalabs/common/mmu_v1.c:399:16: note: Variable 'hop2_pte=
_addr' is reassigned a value before the old one has been used.
    hop2_pte_addr =3D hop2_addr;
                  ^

# https://github.com/HabanaAI/linux/commit/b4123293c186dce375459b425131df23=
f7340ef9
git remote add habanaai https://github.com/HabanaAI/linux.git
git fetch --no-tags habanaai dev/ogabbay/nic_patchset_v2
git checkout b4123293c186dce375459b425131df23f7340ef9
vim +/hop2_pte_addr +399 drivers/misc/habanalabs/common/mmu_v1.c

0feaf86d4e6950 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-16  36=
5  =

66542c3b9d2fe1 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-24  36=
6  static void dram_default_mapping_fini(struct hl_ctx *ctx)
0feaf86d4e6950 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-16  36=
7  {
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  36=
8  	struct hl_device *hdev =3D ctx->hdev;
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  36=
9  	struct asic_fixed_properties *prop =3D &hdev->asic_prop;
66542c3b9d2fe1 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-24  37=
0  	u64 num_of_hop3, total_hops, hop0_addr, hop1_addr, hop2_addr,
66542c3b9d2fe1 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-24  37=
1  		hop2_pte_addr, hop3_pte_addr;
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  37=
2  	int i, j;
0feaf86d4e6950 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-16  37=
3  =

7aa2227affb510 drivers/misc/habanalabs/mmu.c Oded Gabbay     2019-05-29  37=
4  	if ((!hdev->dram_supports_virtual_memory) ||
7aa2227affb510 drivers/misc/habanalabs/mmu.c Oded Gabbay     2019-05-29  37=
5  			(!hdev->dram_default_page_mapping) ||
7aa2227affb510 drivers/misc/habanalabs/mmu.c Oded Gabbay     2019-05-29  37=
6  			(ctx->asid =3D=3D HL_KERNEL_ASID_ID))
0feaf86d4e6950 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-16  37=
7  		return;
0feaf86d4e6950 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-16  37=
8  =

b3bf147bd6117f drivers/misc/habanalabs/mmu.c Oded Gabbay     2019-03-01  37=
9  	num_of_hop3 =3D prop->dram_size_for_default_page_mapping;
b3bf147bd6117f drivers/misc/habanalabs/mmu.c Oded Gabbay     2019-03-01  38=
0  	do_div(num_of_hop3, prop->dram_page_size);
b3bf147bd6117f drivers/misc/habanalabs/mmu.c Oded Gabbay     2019-03-01  38=
1  	do_div(num_of_hop3, PTE_ENTRIES_IN_HOP);
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  38=
2  =

66542c3b9d2fe1 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-24  38=
3  	hop0_addr =3D get_hop0_addr(ctx);
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  38=
4  	/* add hop1 and hop2 */
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  38=
5  	total_hops =3D num_of_hop3 + 2;
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  38=
6  	hop1_addr =3D ctx->dram_default_hops[total_hops - 1];
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  38=
7  	hop2_addr =3D ctx->dram_default_hops[total_hops - 2];
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  38=
8  =

27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  38=
9  	for (i =3D 0 ; i < num_of_hop3 ; i++) {
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  39=
0  		hop3_pte_addr =3D ctx->dram_default_hops[i];
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  39=
1  		for (j =3D 0 ; j < PTE_ENTRIES_IN_HOP ; j++) {
66542c3b9d2fe1 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-24  39=
2  			clear_pte(ctx, hop3_pte_addr);
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  39=
3  			put_pte(ctx, ctx->dram_default_hops[i]);
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  39=
4  			hop3_pte_addr +=3D HL_PTE_SIZE;
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  39=
5  		}
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  39=
6  	}
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  39=
7  =

66542c3b9d2fe1 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-24  39=
8  	hop2_pte_addr =3D hop2_addr;
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28 @39=
9  	hop2_pte_addr =3D hop2_addr;
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  40=
0  	for (i =3D 0 ; i < num_of_hop3 ; i++) {
66542c3b9d2fe1 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-24  40=
1  		clear_pte(ctx, hop2_pte_addr);
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  40=
2  		put_pte(ctx, hop2_addr);
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  40=
3  		hop2_pte_addr +=3D HL_PTE_SIZE;
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  40=
4  	}
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  40=
5  =

66542c3b9d2fe1 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-24  40=
6  	clear_pte(ctx, hop1_addr);
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  40=
7  	put_pte(ctx, hop1_addr);
66542c3b9d2fe1 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-24  40=
8  	clear_pte(ctx, hop0_addr);
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  40=
9  =

27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  41=
0  	kfree(ctx->dram_default_hops);
27ca384cb7c44b drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-28  41=
1  =

66542c3b9d2fe1 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-24  41=
2  	flush(ctx);
66542c3b9d2fe1 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-24  41=
3  }
66542c3b9d2fe1 drivers/misc/habanalabs/mmu.c Omer Shpigelman 2019-02-24  41=
4  =


:::::: The code at line 399 was first introduced by commit
:::::: 27ca384cb7c44b8b16ea43f9aed930664140360e habanalabs: add MMU DRAM de=
fault page mapping

:::::: TO: Omer Shpigelman <oshpigelman@habana.ai>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4489367859622878166==--

