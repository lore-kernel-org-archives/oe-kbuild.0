Content-Type: multipart/mixed; boundary="===============1149830212538619861=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/misc/habanalabs/common/memory.c:1031:16: warning: Either the condition '!hnode' is redundant or there is possible null pointer dereference: hnode.
Date: Sun, 13 Sep 2020 23:01:37 +0800
Message-ID: <202009132334.7tnnYWPy%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1149830212538619861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Oded Gabbay <oded.gabbay@gmail.com>
CC: Omer Shpigelman <oshpigelman@habana.ai>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   ef2e9a563b0cd7965e2a1263125dcbb1c86aa6cc
commit: 70b2f993ea4a79c298aac4ec1c58089020536ba5 habanalabs: create common =
folder
date:   7 weeks ago
:::::: branch date: 19 hours ago
:::::: commit date: 7 weeks ago
compiler: hppa-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/misc/habanalabs/common/memory.c:1031:16: warning: Either the con=
dition '!hnode' is redundant or there is possible null pointer dereference:=
 hnode. [nullPointerRedundantCheck]
     if (vaddr =3D=3D hnode->vaddr)
                  ^
   drivers/misc/habanalabs/common/memory.c:1034:6: note: Assuming that cond=
ition '!hnode' is not redundant
    if (!hnode) {
        ^
   drivers/misc/habanalabs/common/memory.c:1031:16: note: Null pointer dere=
ference
     if (vaddr =3D=3D hnode->vaddr)
                  ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D70b2f993ea4a79c298aac4ec1c58089020536ba5
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 70b2f993ea4a79c298aac4ec1c58089020536ba5
vim +1031 drivers/misc/habanalabs/common/memory.c

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1005  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1006  /*
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1007   * unmap_device_va      - unmap the given device virtual address
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1008   *
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1009   * @ctx                 : current context
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1010   * @vaddr               : device virtual address to unmap
71c5e55e7c077f drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1011   * @ctx_free            : true if in context free flow, false otherw=
ise.
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1012   *
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1013   * This function does the following:
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1014   * - Unmap the physical pages related to the given virtual address
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1015   * - return the device virtual block to the virtual block list
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1016   */
71c5e55e7c077f drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1017  static int unmap_device_va(struct hl_ctx *ctx, u64 vaddr, bool ctx_f=
ree)
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1018  {
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1019  	struct hl_device *hdev =3D ctx->hdev;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1020  	struct hl_vm_phys_pg_pack *phys_pg_pack =3D NULL;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1021  	struct hl_vm_hash_node *hnode =3D NULL;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1022  	struct hl_userptr *userptr =3D NULL;
71c5e55e7c077f drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1023  	struct hl_va_range *va_range;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1024  	enum vm_type_t *vm_type;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1025  	bool is_userptr;
c68f1baeaff4b2 drivers/misc/habanalabs/memory.c Tomer Tayar     2020-06-01 =
 1026  	int rc =3D 0;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1027  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1028  	/* protect from double entrance */
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1029  	mutex_lock(&ctx->mem_hash_lock);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1030  	hash_for_each_possible(ctx->mem_hash, hnode, node, (unsigned long)v=
addr)
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
@1031  		if (vaddr =3D=3D hnode->vaddr)
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1032  			break;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1033  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1034  	if (!hnode) {
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1035  		mutex_unlock(&ctx->mem_hash_lock);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1036  		dev_err(hdev->dev,
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1037  			"unmap failed, no mem hnode for vaddr 0x%llx\n",
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1038  			vaddr);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1039  		return -EINVAL;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1040  	}
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1041  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1042  	hash_del(&hnode->node);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1043  	mutex_unlock(&ctx->mem_hash_lock);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1044  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1045  	vm_type =3D hnode->ptr;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1046  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1047  	if (*vm_type =3D=3D VM_TYPE_USERPTR) {
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1048  		is_userptr =3D true;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1049  		userptr =3D hnode->ptr;
54bb67444ea3f3 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1050  		rc =3D init_phys_pg_pack_from_userptr(ctx, userptr,
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1051  							&phys_pg_pack);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1052  		if (rc) {
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1053  			dev_err(hdev->dev,
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1054  				"unable to init page pack for vaddr 0x%llx\n",
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1055  				vaddr);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1056  			goto vm_type_err;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1057  		}
64a7e2955d9a8a drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-01-05 =
 1058  =

64a7e2955d9a8a drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-01-05 =
 1059  		if (phys_pg_pack->page_size =3D=3D
64a7e2955d9a8a drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-01-05 =
 1060  					hdev->asic_prop.pmmu.page_size)
64a7e2955d9a8a drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-01-05 =
 1061  			va_range =3D ctx->host_va_range;
64a7e2955d9a8a drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-01-05 =
 1062  		else
64a7e2955d9a8a drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-01-05 =
 1063  			va_range =3D ctx->host_huge_va_range;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1064  	} else if (*vm_type =3D=3D VM_TYPE_PHYS_PACK) {
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1065  		is_userptr =3D false;
64a7e2955d9a8a drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-01-05 =
 1066  		va_range =3D ctx->dram_va_range;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1067  		phys_pg_pack =3D hnode->ptr;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1068  	} else {
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1069  		dev_warn(hdev->dev,
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1070  			"unmap failed, unknown vm desc for vaddr 0x%llx\n",
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1071  				vaddr);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1072  		rc =3D -EFAULT;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1073  		goto vm_type_err;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1074  	}
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1075  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1076  	if (atomic_read(&phys_pg_pack->mapping_cnt) =3D=3D 0) {
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1077  		dev_err(hdev->dev, "vaddr 0x%llx is not mapped\n", vaddr);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1078  		rc =3D -EINVAL;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1079  		goto mapping_cnt_err;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1080  	}
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1081  =

7f74d4d335f1bd drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-08-12 =
 1082  	vaddr &=3D ~(((u64) phys_pg_pack->page_size) - 1);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1083  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1084  	mutex_lock(&ctx->mmu_lock);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1085  =

7f74d4d335f1bd drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-08-12 =
 1086  	unmap_phys_pg_pack(ctx, vaddr, phys_pg_pack);
e850b89f50d2c1 drivers/misc/habanalabs/memory.c Oded Gabbay     2019-03-31 =
 1087  =

bea84c4d67e5ef drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1088  	/*
bea84c4d67e5ef drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1089  	 * During context free this function is called in a loop to clean a=
ll
bea84c4d67e5ef drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1090  	 * the context mappings. Hence the cache invalidation can be called=
 once
bea84c4d67e5ef drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1091  	 * at the loop end rather than for each iteration
bea84c4d67e5ef drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1092  	 */
bea84c4d67e5ef drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1093  	if (!ctx_free)
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1094  		rc =3D hdev->asic_funcs->mmu_invalidate_cache(hdev, true,
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1095  								*vm_type);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1096  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1097  	mutex_unlock(&ctx->mmu_lock);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1098  =

71c5e55e7c077f drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1099  	/*
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1100  	 * If the context is closing we don't need to check for the MMU cac=
he
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1101  	 * invalidation return code and update the VA free list as in this =
flow
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1102  	 * we invalidate the MMU cache outside of this unmap function and t=
he VA
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1103  	 * free list will be freed anyway.
71c5e55e7c077f drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1104  	 */
71c5e55e7c077f drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1105  	if (!ctx_free) {
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1106  		int tmp_rc;
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1107  =

71c5e55e7c077f drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1108  		if (rc)
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1109  			dev_err(hdev->dev,
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1110  				"unmapping vaddr 0x%llx failed due to MMU cache invalidation\n",
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1111  				vaddr);
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1112  =

8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1113  		tmp_rc =3D add_va_block(hdev, va_range, vaddr,
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1114  					vaddr + phys_pg_pack->total_size - 1);
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1115  		if (tmp_rc) {
71c5e55e7c077f drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1116  			dev_warn(hdev->dev,
71c5e55e7c077f drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1117  					"add va block failed for vaddr: 0x%llx\n",
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1118  					vaddr);
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1119  			if (!rc)
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1120  				rc =3D tmp_rc;
8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1121  		}
71c5e55e7c077f drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-11-14 =
 1122  	}
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1123  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1124  	atomic_dec(&phys_pg_pack->mapping_cnt);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1125  	kfree(hnode);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1126  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1127  	if (is_userptr) {
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1128  		free_phys_pg_pack(hdev, phys_pg_pack);
7f74d4d335f1bd drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-08-12 =
 1129  		dma_unmap_host_va(hdev, userptr);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1130  	}
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1131  =

8ff5f4fd40df95 drivers/misc/habanalabs/memory.c Omer Shpigelman 2020-05-24 =
 1132  	return rc;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1133  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1134  mapping_cnt_err:
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1135  	if (is_userptr)
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1136  		free_phys_pg_pack(hdev, phys_pg_pack);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1137  vm_type_err:
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1138  	mutex_lock(&ctx->mem_hash_lock);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1139  	hash_add(ctx->mem_hash, &hnode->node, vaddr);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1140  	mutex_unlock(&ctx->mem_hash_lock);
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1141  =

0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1142  	return rc;
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1143  }
0feaf86d4e6950 drivers/misc/habanalabs/memory.c Omer Shpigelman 2019-02-16 =
 1144  =


:::::: The code at line 1031 was first introduced by commit
:::::: 0feaf86d4e69507ab9b2af7dcc63a6886352d5db habanalabs: add virtual mem=
ory and MMU modules

:::::: TO: Omer Shpigelman <oshpigelman@habana.ai>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1149830212538619861==--

