Content-Type: multipart/mixed; boundary="===============6078425559330335522=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:1091:4: warning: Variable 'r' is reassigned a value before the old one has been used. 'break; '
Date: Sat, 19 Sep 2020 10:11:47 +0800
Message-ID: <202009191039.b5qeOrS5%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6078425559330335522==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Alex Deucher <alexander.deucher@amd.com>
CC: Xiaojie Yuan <xiaojie.yuan@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   92ab97adeefccf375de7ebaad9d5b75d4125fe8b
commit: 631cdbd27e922a845a728ea2f933c41d220b3cd1 drm/amdgpu/atomfirmware: s=
implify the interface to get vram info
date:   12 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 12 months ago
compiler: s390-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:1091:4: warning: Variable 'r' is r=
eassigned a value before the old one has been used. 'break;' missing? [redu=
ndantAssignInSwitch]
    r =3D amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VMC, VMC_1_0__SRCID__VM=
_FAULT,
      ^
   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:1025:4: note: Variable 'r' is reas=
signed a value before the old one has been used. 'break;' missing?
    r =3D amdgpu_atomfirmware_get_vram_info(adev, &vram_width, &vram_type);
      ^
   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:1091:4: note: Variable 'r' is reas=
signed a value before the old one has been used. 'break;' missing?
    r =3D amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VMC, VMC_1_0__SRCID__VM=
_FAULT,
      ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D631cdbd27e922a845a728ea2f933c41d220b3cd1
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout 631cdbd27e922a845a728ea2f933c41d220b3cd1
vim +1091 drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c

ebdef28ebbcf767 Alex Deucher      2018-04-06  1011  =

e60f8db5e4c85d7 Alex Xie          2017-03-09  1012  static int gmc_v9_0_sw_=
init(void *handle)
e60f8db5e4c85d7 Alex Xie          2017-03-09  1013  {
631cdbd27e922a8 Alex Deucher      2019-09-23  1014  	int r, vram_width =3D =
0, vram_type =3D 0;
e60f8db5e4c85d7 Alex Xie          2017-03-09  1015  	struct amdgpu_device *=
adev =3D (struct amdgpu_device *)handle;
e60f8db5e4c85d7 Alex Xie          2017-03-09  1016  =

0c8c0847cc68e33 Huang Rui         2017-05-31  1017  	gfxhub_v1_0_init(adev);
51cce480fda9701 Le Ma             2018-09-04  1018  	if (adev->asic_type =
=3D=3D CHIP_ARCTURUS)
51cce480fda9701 Le Ma             2018-09-04  1019  		mmhub_v9_4_init(adev);
51cce480fda9701 Le Ma             2018-09-04  1020  	else
77f6c7637063257 Huang Rui         2017-05-31  1021  		mmhub_v1_0_init(adev);
0c8c0847cc68e33 Huang Rui         2017-05-31  1022  =

770d13b19fdf365 Christian K=C3=B6nig   2018-01-12  1023  	spin_lock_init(&a=
dev->gmc.invalidate_lock);
e60f8db5e4c85d7 Alex Xie          2017-03-09  1024  =

631cdbd27e922a8 Alex Deucher      2019-09-23  1025  	r =3D amdgpu_atomfirmw=
are_get_vram_info(adev, &vram_width, &vram_type);
631cdbd27e922a8 Alex Deucher      2019-09-23  1026  	if (amdgpu_sriov_vf(ad=
ev))
631cdbd27e922a8 Alex Deucher      2019-09-23  1027  		/* For Vega10 SR-IOV,=
 vram_width can't be read from ATOM as RAVEN,
631cdbd27e922a8 Alex Deucher      2019-09-23  1028  		 * and DF related reg=
isters is not readable, seems hardcord is the
631cdbd27e922a8 Alex Deucher      2019-09-23  1029  		 * only way to set th=
e correct vram_width
631cdbd27e922a8 Alex Deucher      2019-09-23  1030  		 */
631cdbd27e922a8 Alex Deucher      2019-09-23  1031  		adev->gmc.vram_width =
=3D 2048;
631cdbd27e922a8 Alex Deucher      2019-09-23  1032  	else if (amdgpu_emu_mo=
de !=3D 1)
631cdbd27e922a8 Alex Deucher      2019-09-23  1033  		adev->gmc.vram_width =
=3D vram_width;
631cdbd27e922a8 Alex Deucher      2019-09-23  1034  =

631cdbd27e922a8 Alex Deucher      2019-09-23  1035  	if (!adev->gmc.vram_wi=
dth) {
631cdbd27e922a8 Alex Deucher      2019-09-23  1036  		int chansize, numchan;
631cdbd27e922a8 Alex Deucher      2019-09-23  1037  =

631cdbd27e922a8 Alex Deucher      2019-09-23  1038  		/* hbm memory channel=
 size */
631cdbd27e922a8 Alex Deucher      2019-09-23  1039  		if (adev->flags & AMD=
_IS_APU)
631cdbd27e922a8 Alex Deucher      2019-09-23  1040  			chansize =3D 64;
631cdbd27e922a8 Alex Deucher      2019-09-23  1041  		else
631cdbd27e922a8 Alex Deucher      2019-09-23  1042  			chansize =3D 128;
631cdbd27e922a8 Alex Deucher      2019-09-23  1043  =

631cdbd27e922a8 Alex Deucher      2019-09-23  1044  		numchan =3D adev->df_=
funcs->get_hbm_channel_number(adev);
631cdbd27e922a8 Alex Deucher      2019-09-23  1045  		adev->gmc.vram_width =
=3D numchan * chansize;
631cdbd27e922a8 Alex Deucher      2019-09-23  1046  	}
631cdbd27e922a8 Alex Deucher      2019-09-23  1047  =

631cdbd27e922a8 Alex Deucher      2019-09-23  1048  	adev->gmc.vram_type =
=3D vram_type;
fd66560b803e32c Hawking Zhang     2017-06-22  1049  	switch (adev->asic_typ=
e) {
fd66560b803e32c Hawking Zhang     2017-06-22  1050  	case CHIP_RAVEN:
1daa2bfa17aa5ac Le Ma             2018-08-31  1051  		adev->num_vmhubs =3D =
2;
1daa2bfa17aa5ac Le Ma             2018-08-31  1052  =

6a42fd6fbf53409 Christian K=C3=B6nig   2017-12-05  1053  		if (adev->rev_id=
 =3D=3D 0x0 || adev->rev_id =3D=3D 0x1) {
f3368128bacece3 Christian K=C3=B6nig   2017-11-23  1054  			amdgpu_vm_adjus=
t_size(adev, 256 * 1024, 9, 3, 48);
6a42fd6fbf53409 Christian K=C3=B6nig   2017-12-05  1055  		} else {
6a42fd6fbf53409 Christian K=C3=B6nig   2017-12-05  1056  			/* vm_size is 1=
28TB + 512GB for legacy 3-level page support */
6a42fd6fbf53409 Christian K=C3=B6nig   2017-12-05  1057  			amdgpu_vm_adjus=
t_size(adev, 128 * 1024 + 512, 9, 2, 48);
770d13b19fdf365 Christian K=C3=B6nig   2018-01-12  1058  			adev->gmc.trans=
late_further =3D
6a42fd6fbf53409 Christian K=C3=B6nig   2017-12-05  1059  				adev->vm_manag=
er.num_level > 1;
6a42fd6fbf53409 Christian K=C3=B6nig   2017-12-05  1060  		}
fd66560b803e32c Hawking Zhang     2017-06-22  1061  		break;
fd66560b803e32c Hawking Zhang     2017-06-22  1062  	case CHIP_VEGA10:
273a14cd1514345 Alex Deucher      2018-03-13  1063  	case CHIP_VEGA12:
d96b428c3cea9ed Feifei Xu         2018-04-20  1064  	case CHIP_VEGA20:
8787ee01458f129 Huang Rui         2019-07-24  1065  	case CHIP_RENOIR:
1daa2bfa17aa5ac Le Ma             2018-08-31  1066  		adev->num_vmhubs =3D =
2;
1daa2bfa17aa5ac Le Ma             2018-08-31  1067  =

8787ee01458f129 Huang Rui         2019-07-24  1068  =

36b32a682bc3269 Zhang, Jerry      2017-03-29  1069  		/*
36b32a682bc3269 Zhang, Jerry      2017-03-29  1070  		 * To fulfill 4-level=
 page support,
36b32a682bc3269 Zhang, Jerry      2017-03-29  1071  		 * vm size is 256TB (=
48bit), maximum size of Vega10,
36b32a682bc3269 Zhang, Jerry      2017-03-29  1072  		 * block size 512 (9b=
it)
36b32a682bc3269 Zhang, Jerry      2017-03-29  1073  		 */
cdba61daf550904 wentalou          2019-01-24  1074  		/* sriov restrict max=
_pfn below AMDGPU_GMC_HOLE */
cdba61daf550904 wentalou          2019-01-24  1075  		if (amdgpu_sriov_vf(a=
dev))
cdba61daf550904 wentalou          2019-01-24  1076  			amdgpu_vm_adjust_siz=
e(adev, 256 * 1024, 9, 3, 47);
cdba61daf550904 wentalou          2019-01-24  1077  		else
f3368128bacece3 Christian K=C3=B6nig   2017-11-23  1078  			amdgpu_vm_adjus=
t_size(adev, 256 * 1024, 9, 3, 48);
fd66560b803e32c Hawking Zhang     2017-06-22  1079  		break;
3de2ff5d60d0695 Le Ma             2018-09-04  1080  	case CHIP_ARCTURUS:
c8a6e2a3170064c Le Ma             2018-08-31  1081  		adev->num_vmhubs =3D =
3;
c8a6e2a3170064c Le Ma             2018-08-31  1082  =

3de2ff5d60d0695 Le Ma             2018-09-04  1083  		/* Keep the vm size s=
ame with Vega20 */
3de2ff5d60d0695 Le Ma             2018-09-04  1084  		amdgpu_vm_adjust_size=
(adev, 256 * 1024, 9, 3, 48);
3de2ff5d60d0695 Le Ma             2018-09-04  1085  		break;
fd66560b803e32c Hawking Zhang     2017-06-22  1086  	default:
fd66560b803e32c Hawking Zhang     2017-06-22  1087  		break;
fd66560b803e32c Hawking Zhang     2017-06-22  1088  	}
fd66560b803e32c Hawking Zhang     2017-06-22  1089  =

e60f8db5e4c85d7 Alex Xie          2017-03-09  1090  	/* This interrupt is V=
MC page fault.*/
44a99b65fc27474 Andrey Grodzovsky 2018-05-25 @1091  	r =3D amdgpu_irq_add_i=
d(adev, SOC15_IH_CLIENTID_VMC, VMC_1_0__SRCID__VM_FAULT,
770d13b19fdf365 Christian K=C3=B6nig   2018-01-12  1092  				&adev->gmc.vm_=
fault);
30da7bb18471327 Christian K=C3=B6nig   2018-09-26  1093  	if (r)
30da7bb18471327 Christian K=C3=B6nig   2018-09-26  1094  		return r;
30da7bb18471327 Christian K=C3=B6nig   2018-09-26  1095  =

7d19b15f7013c9a Le Ma             2018-09-06  1096  	if (adev->asic_type =
=3D=3D CHIP_ARCTURUS) {
7d19b15f7013c9a Le Ma             2018-09-06  1097  		r =3D amdgpu_irq_add_=
id(adev, SOC15_IH_CLIENTID_VMC1, VMC_1_0__SRCID__VM_FAULT,
7d19b15f7013c9a Le Ma             2018-09-06  1098  					&adev->gmc.vm_faul=
t);
7d19b15f7013c9a Le Ma             2018-09-06  1099  		if (r)
7d19b15f7013c9a Le Ma             2018-09-06  1100  			return r;
7d19b15f7013c9a Le Ma             2018-09-06  1101  	}
7d19b15f7013c9a Le Ma             2018-09-06  1102  =

44a99b65fc27474 Andrey Grodzovsky 2018-05-25  1103  	r =3D amdgpu_irq_add_i=
d(adev, SOC15_IH_CLIENTID_UTCL2, UTCL2_1_0__SRCID__FAULT,
770d13b19fdf365 Christian K=C3=B6nig   2018-01-12  1104  				&adev->gmc.vm_=
fault);
e60f8db5e4c85d7 Alex Xie          2017-03-09  1105  =

e60f8db5e4c85d7 Alex Xie          2017-03-09  1106  	if (r)
e60f8db5e4c85d7 Alex Xie          2017-03-09  1107  		return r;
e60f8db5e4c85d7 Alex Xie          2017-03-09  1108  =

791c47694f01663 xinhui pan        2019-01-23  1109  	/* interrupt sent to D=
F. */
791c47694f01663 xinhui pan        2019-01-23  1110  	r =3D amdgpu_irq_add_i=
d(adev, SOC15_IH_CLIENTID_DF, 0,
791c47694f01663 xinhui pan        2019-01-23  1111  			&adev->gmc.ecc_irq);
791c47694f01663 xinhui pan        2019-01-23  1112  	if (r)
791c47694f01663 xinhui pan        2019-01-23  1113  		return r;
791c47694f01663 xinhui pan        2019-01-23  1114  =

e60f8db5e4c85d7 Alex Xie          2017-03-09  1115  	/* Set the internal MC=
 address mask
e60f8db5e4c85d7 Alex Xie          2017-03-09  1116  	 * This is the max add=
ress of the GPU's
e60f8db5e4c85d7 Alex Xie          2017-03-09  1117  	 * internal address sp=
ace.
e60f8db5e4c85d7 Alex Xie          2017-03-09  1118  	 */
770d13b19fdf365 Christian K=C3=B6nig   2018-01-12  1119  	adev->gmc.mc_mask=
 =3D 0xffffffffffffULL; /* 48 bit MC */
e60f8db5e4c85d7 Alex Xie          2017-03-09  1120  =

244511f386ccb90 Christoph Hellwig 2019-08-15  1121  	r =3D dma_set_mask_and=
_coherent(adev->dev, DMA_BIT_MASK(44));
e60f8db5e4c85d7 Alex Xie          2017-03-09  1122  	if (r) {
e60f8db5e4c85d7 Alex Xie          2017-03-09  1123  		printk(KERN_WARNING "=
amdgpu: No suitable DMA available.\n");
244511f386ccb90 Christoph Hellwig 2019-08-15  1124  		return r;
e60f8db5e4c85d7 Alex Xie          2017-03-09  1125  	}
244511f386ccb90 Christoph Hellwig 2019-08-15  1126  	adev->need_swiotlb =3D=
 drm_need_swiotlb(44);
e60f8db5e4c85d7 Alex Xie          2017-03-09  1127  =

47622ba033d6da5 Alex Deucher      2018-11-30  1128  	if (adev->gmc.xgmi.sup=
ported) {
bf0a60b78b61a7b Alex Deucher      2018-06-19  1129  		r =3D gfxhub_v1_1_get=
_xgmi_info(adev);
bf0a60b78b61a7b Alex Deucher      2018-06-19  1130  		if (r)
bf0a60b78b61a7b Alex Deucher      2018-06-19  1131  			return r;
bf0a60b78b61a7b Alex Deucher      2018-06-19  1132  	}
bf0a60b78b61a7b Alex Deucher      2018-06-19  1133  =

e60f8db5e4c85d7 Alex Xie          2017-03-09  1134  	r =3D gmc_v9_0_mc_init=
(adev);
e60f8db5e4c85d7 Alex Xie          2017-03-09  1135  	if (r)
e60f8db5e4c85d7 Alex Xie          2017-03-09  1136  		return r;
e60f8db5e4c85d7 Alex Xie          2017-03-09  1137  =

ebdef28ebbcf767 Alex Deucher      2018-04-06  1138  	adev->gmc.stolen_size =
=3D gmc_v9_0_get_vbios_fb_size(adev);
ebdef28ebbcf767 Alex Deucher      2018-04-06  1139  =

e60f8db5e4c85d7 Alex Xie          2017-03-09  1140  	/* Memory manager */
e60f8db5e4c85d7 Alex Xie          2017-03-09  1141  	r =3D amdgpu_bo_init(a=
dev);
e60f8db5e4c85d7 Alex Xie          2017-03-09  1142  	if (r)
e60f8db5e4c85d7 Alex Xie          2017-03-09  1143  		return r;
e60f8db5e4c85d7 Alex Xie          2017-03-09  1144  =

e60f8db5e4c85d7 Alex Xie          2017-03-09  1145  	r =3D gmc_v9_0_gart_in=
it(adev);
e60f8db5e4c85d7 Alex Xie          2017-03-09  1146  	if (r)
e60f8db5e4c85d7 Alex Xie          2017-03-09  1147  		return r;
e60f8db5e4c85d7 Alex Xie          2017-03-09  1148  =

05ec3eda8b213cc Christian K=C3=B6nig   2017-05-11  1149  	/*
05ec3eda8b213cc Christian K=C3=B6nig   2017-05-11  1150  	 * number of VMs
05ec3eda8b213cc Christian K=C3=B6nig   2017-05-11  1151  	 * VMID 0 is rese=
rved for System
05ec3eda8b213cc Christian K=C3=B6nig   2017-05-11  1152  	 * amdgpu graphic=
s/compute will use VMIDs 1-7
05ec3eda8b213cc Christian K=C3=B6nig   2017-05-11  1153  	 * amdkfd will us=
e VMIDs 8-15
05ec3eda8b213cc Christian K=C3=B6nig   2017-05-11  1154  	 */
a2d15ed733365ba Le Ma             2019-07-16  1155  	adev->vm_manager.id_mg=
r[AMDGPU_GFXHUB_0].num_ids =3D AMDGPU_NUM_OF_VMIDS;
a2d15ed733365ba Le Ma             2019-07-16  1156  	adev->vm_manager.id_mg=
r[AMDGPU_MMHUB_0].num_ids =3D AMDGPU_NUM_OF_VMIDS;
c8a6e2a3170064c Le Ma             2018-08-31  1157  	adev->vm_manager.id_mg=
r[AMDGPU_MMHUB_1].num_ids =3D AMDGPU_NUM_OF_VMIDS;
05ec3eda8b213cc Christian K=C3=B6nig   2017-05-11  1158  =

05ec3eda8b213cc Christian K=C3=B6nig   2017-05-11  1159  	amdgpu_vm_manager=
_init(adev);
05ec3eda8b213cc Christian K=C3=B6nig   2017-05-11  1160  =

05ec3eda8b213cc Christian K=C3=B6nig   2017-05-11  1161  	return 0;
e60f8db5e4c85d7 Alex Xie          2017-03-09  1162  }
e60f8db5e4c85d7 Alex Xie          2017-03-09  1163  =


:::::: The code at line 1091 was first introduced by commit
:::::: 44a99b65fc27474b66f7173b971bfbd67ca6ba74 drm/amd: Use newly added in=
terrupt source defs for SOC15.

:::::: TO: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6078425559330335522==--

