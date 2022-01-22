Content-Type: multipart/mixed; boundary="===============4098685976663793883=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:1024:37: warning: Uninitialized variable: pdesc [uninitvar]
Date: Sun, 23 Jan 2022 05:51:51 +0800
Message-ID: <202201230446.MgsaPDeX-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4098685976663793883==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Martin Krastev <krastevm@vmware.com>
CC: Zack Rusin <zackr@vmware.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1c52283265a462a100ae63ddf58b4e5884acde86
commit: 7a7a933edd6c3a6d5d64e08093f2d564104cefcd drm/vmwgfx: Introduce VMwa=
re mks-guest-stats
date:   8 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 8 months ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/message/fusion/mptbase.c:2888:3: warning: Variable 'i' is modifi=
ed but its new value is never used. [unreadVariable]
     i++;
     ^
>> drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:1024:37: warning: Uninitialized vari=
able: pdesc [uninitvar]
    struct page *pages_stat[ARRAY_SIZE(pdesc->statPPNs)];
                                       ^
   drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:1025:37: warning: Uninitialized vari=
able: pdesc [uninitvar]
    struct page *pages_info[ARRAY_SIZE(pdesc->infoPPNs)];
                                       ^
   drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:1026:37: warning: Uninitialized vari=
able: pdesc [uninitvar]
    struct page *pages_strs[ARRAY_SIZE(pdesc->strsPPNs)];
                                       ^
   drivers/gpu/drm/vmwgfx/vmwgfx_msg.c:1040:34: warning: Uninitialized vari=
able: pdesc [uninitvar]
    if (num_pages_stat > ARRAY_SIZE(pdesc->statPPNs) ||
                                    ^

vim +1024 drivers/gpu/drm/vmwgfx/vmwgfx_msg.c

7a7a933edd6c3a Martin Krastev 2021-06-09   993  =

7a7a933edd6c3a Martin Krastev 2021-06-09   994  /**
7a7a933edd6c3a Martin Krastev 2021-06-09   995   * vmw_mksstat_add_ioctl: C=
reates a single userspace-originating mksGuestStat
7a7a933edd6c3a Martin Krastev 2021-06-09   996   * instance descriptor and =
registers that with the hypervisor.
7a7a933edd6c3a Martin Krastev 2021-06-09   997   *
7a7a933edd6c3a Martin Krastev 2021-06-09   998   * Create a hypervisor PFN =
mapping, containing a single mksGuestStat instance
7a7a933edd6c3a Martin Krastev 2021-06-09   999   * descriptor and pin the c=
orresponding userspace pages.
7a7a933edd6c3a Martin Krastev 2021-06-09  1000   *
7a7a933edd6c3a Martin Krastev 2021-06-09  1001   * @dev: Identifies the drm=
 device.
7a7a933edd6c3a Martin Krastev 2021-06-09  1002   * @data: Pointer to the io=
ctl argument.
7a7a933edd6c3a Martin Krastev 2021-06-09  1003   * @file_priv: Identifies t=
he caller; unused.
7a7a933edd6c3a Martin Krastev 2021-06-09  1004   * Return: Zero on success,=
 negative error code on error.
7a7a933edd6c3a Martin Krastev 2021-06-09  1005   */
7a7a933edd6c3a Martin Krastev 2021-06-09  1006  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1007  int vmw_mksstat_add_ioctl(s=
truct drm_device *dev, void *data,
7a7a933edd6c3a Martin Krastev 2021-06-09  1008  				struct drm_file *file_p=
riv)
7a7a933edd6c3a Martin Krastev 2021-06-09  1009  {
7a7a933edd6c3a Martin Krastev 2021-06-09  1010  	struct drm_vmw_mksstat_add=
_arg *arg =3D
7a7a933edd6c3a Martin Krastev 2021-06-09  1011  		(struct drm_vmw_mksstat_a=
dd_arg *) data;
7a7a933edd6c3a Martin Krastev 2021-06-09  1012  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1013  	struct vmw_private *const =
dev_priv =3D vmw_priv(dev);
7a7a933edd6c3a Martin Krastev 2021-06-09  1014  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1015  	struct page *page;
7a7a933edd6c3a Martin Krastev 2021-06-09  1016  	MKSGuestStatInstanceDescri=
ptor *pdesc;
7a7a933edd6c3a Martin Krastev 2021-06-09  1017  	const size_t num_pages_sta=
t =3D vmw_num_pages(arg->stat_len);
7a7a933edd6c3a Martin Krastev 2021-06-09  1018  	const size_t num_pages_inf=
o =3D vmw_num_pages(arg->info_len);
7a7a933edd6c3a Martin Krastev 2021-06-09  1019  	const size_t num_pages_str=
s =3D vmw_num_pages(arg->strs_len);
7a7a933edd6c3a Martin Krastev 2021-06-09  1020  	long desc_len;
7a7a933edd6c3a Martin Krastev 2021-06-09  1021  	long nr_pinned_stat;
7a7a933edd6c3a Martin Krastev 2021-06-09  1022  	long nr_pinned_info;
7a7a933edd6c3a Martin Krastev 2021-06-09  1023  	long nr_pinned_strs;
7a7a933edd6c3a Martin Krastev 2021-06-09 @1024  	struct page *pages_stat[AR=
RAY_SIZE(pdesc->statPPNs)];
7a7a933edd6c3a Martin Krastev 2021-06-09  1025  	struct page *pages_info[AR=
RAY_SIZE(pdesc->infoPPNs)];
7a7a933edd6c3a Martin Krastev 2021-06-09  1026  	struct page *pages_strs[AR=
RAY_SIZE(pdesc->strsPPNs)];
7a7a933edd6c3a Martin Krastev 2021-06-09  1027  	size_t i, slot;
7a7a933edd6c3a Martin Krastev 2021-06-09  1028  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1029  	arg->id =3D -1;
7a7a933edd6c3a Martin Krastev 2021-06-09  1030  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1031  	if (!arg->stat || !arg->in=
fo || !arg->strs)
7a7a933edd6c3a Martin Krastev 2021-06-09  1032  		return -EINVAL;
7a7a933edd6c3a Martin Krastev 2021-06-09  1033  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1034  	if (!arg->stat_len || !arg=
->info_len || !arg->strs_len)
7a7a933edd6c3a Martin Krastev 2021-06-09  1035  		return -EINVAL;
7a7a933edd6c3a Martin Krastev 2021-06-09  1036  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1037  	if (!arg->description)
7a7a933edd6c3a Martin Krastev 2021-06-09  1038  		return -EINVAL;
7a7a933edd6c3a Martin Krastev 2021-06-09  1039  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1040  	if (num_pages_stat > ARRAY=
_SIZE(pdesc->statPPNs) ||
7a7a933edd6c3a Martin Krastev 2021-06-09  1041  		num_pages_info > ARRAY_SI=
ZE(pdesc->infoPPNs) ||
7a7a933edd6c3a Martin Krastev 2021-06-09  1042  		num_pages_strs > ARRAY_SI=
ZE(pdesc->strsPPNs))
7a7a933edd6c3a Martin Krastev 2021-06-09  1043  		return -EINVAL;
7a7a933edd6c3a Martin Krastev 2021-06-09  1044  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1045  	/* Find an available slot =
in the mksGuestStats user array and reserve it */
7a7a933edd6c3a Martin Krastev 2021-06-09  1046  	for (slot =3D 0; slot < AR=
RAY_SIZE(dev_priv->mksstat_user_pids); ++slot)
7a7a933edd6c3a Martin Krastev 2021-06-09  1047  		if (!atomic_cmpxchg(&dev_=
priv->mksstat_user_pids[slot], 0, MKSSTAT_PID_RESERVED))
7a7a933edd6c3a Martin Krastev 2021-06-09  1048  			break;
7a7a933edd6c3a Martin Krastev 2021-06-09  1049  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1050  	if (slot =3D=3D ARRAY_SIZE=
(dev_priv->mksstat_user_pids))
7a7a933edd6c3a Martin Krastev 2021-06-09  1051  		return -ENOSPC;
7a7a933edd6c3a Martin Krastev 2021-06-09  1052  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1053  	BUG_ON(dev_priv->mksstat_u=
ser_pages[slot]);
7a7a933edd6c3a Martin Krastev 2021-06-09  1054  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1055  	/* Allocate a page for the=
 instance descriptor */
7a7a933edd6c3a Martin Krastev 2021-06-09  1056  	page =3D alloc_page(GFP_KE=
RNEL | __GFP_ZERO);
7a7a933edd6c3a Martin Krastev 2021-06-09  1057  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1058  	if (!page) {
7a7a933edd6c3a Martin Krastev 2021-06-09  1059  		atomic_set(&dev_priv->mks=
stat_user_pids[slot], 0);
7a7a933edd6c3a Martin Krastev 2021-06-09  1060  		return -ENOMEM;
7a7a933edd6c3a Martin Krastev 2021-06-09  1061  	}
7a7a933edd6c3a Martin Krastev 2021-06-09  1062  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1063  	/* Set up the instance des=
criptor */
7a7a933edd6c3a Martin Krastev 2021-06-09  1064  	pdesc =3D page_address(pag=
e);
7a7a933edd6c3a Martin Krastev 2021-06-09  1065  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1066  	pdesc->reservedMBZ =3D 0;
7a7a933edd6c3a Martin Krastev 2021-06-09  1067  	pdesc->statStartVA =3D arg=
->stat;
7a7a933edd6c3a Martin Krastev 2021-06-09  1068  	pdesc->strsStartVA =3D arg=
->strs;
7a7a933edd6c3a Martin Krastev 2021-06-09  1069  	pdesc->statLength =3D arg-=
>stat_len;
7a7a933edd6c3a Martin Krastev 2021-06-09  1070  	pdesc->infoLength =3D arg-=
>info_len;
7a7a933edd6c3a Martin Krastev 2021-06-09  1071  	pdesc->strsLength =3D arg-=
>strs_len;
7a7a933edd6c3a Martin Krastev 2021-06-09  1072  	desc_len =3D strncpy_from_=
user(pdesc->description, u64_to_user_ptr(arg->description),
7a7a933edd6c3a Martin Krastev 2021-06-09  1073  		ARRAY_SIZE(pdesc->descrip=
tion) - 1);
7a7a933edd6c3a Martin Krastev 2021-06-09  1074  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1075  	if (desc_len < 0) {
7a7a933edd6c3a Martin Krastev 2021-06-09  1076  		atomic_set(&dev_priv->mks=
stat_user_pids[slot], 0);
7a7a933edd6c3a Martin Krastev 2021-06-09  1077  		return -EFAULT;
7a7a933edd6c3a Martin Krastev 2021-06-09  1078  	}
7a7a933edd6c3a Martin Krastev 2021-06-09  1079  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1080  	reset_ppn_array(pdesc->sta=
tPPNs, ARRAY_SIZE(pdesc->statPPNs));
7a7a933edd6c3a Martin Krastev 2021-06-09  1081  	reset_ppn_array(pdesc->inf=
oPPNs, ARRAY_SIZE(pdesc->infoPPNs));
7a7a933edd6c3a Martin Krastev 2021-06-09  1082  	reset_ppn_array(pdesc->str=
sPPNs, ARRAY_SIZE(pdesc->strsPPNs));
7a7a933edd6c3a Martin Krastev 2021-06-09  1083  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1084  	/* Pin mksGuestStat user p=
ages and store those in the instance descriptor */
7a7a933edd6c3a Martin Krastev 2021-06-09  1085  	nr_pinned_stat =3D pin_use=
r_pages(arg->stat, num_pages_stat, FOLL_LONGTERM, pages_stat, NULL);
7a7a933edd6c3a Martin Krastev 2021-06-09  1086  	if (num_pages_stat !=3D nr=
_pinned_stat)
7a7a933edd6c3a Martin Krastev 2021-06-09  1087  		goto err_pin_stat;
7a7a933edd6c3a Martin Krastev 2021-06-09  1088  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1089  	for (i =3D 0; i < num_page=
s_stat; ++i)
7a7a933edd6c3a Martin Krastev 2021-06-09  1090  		pdesc->statPPNs[i] =3D pa=
ge_to_pfn(pages_stat[i]);
7a7a933edd6c3a Martin Krastev 2021-06-09  1091  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1092  	nr_pinned_info =3D pin_use=
r_pages(arg->info, num_pages_info, FOLL_LONGTERM, pages_info, NULL);
7a7a933edd6c3a Martin Krastev 2021-06-09  1093  	if (num_pages_info !=3D nr=
_pinned_info)
7a7a933edd6c3a Martin Krastev 2021-06-09  1094  		goto err_pin_info;
7a7a933edd6c3a Martin Krastev 2021-06-09  1095  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1096  	for (i =3D 0; i < num_page=
s_info; ++i)
7a7a933edd6c3a Martin Krastev 2021-06-09  1097  		pdesc->infoPPNs[i] =3D pa=
ge_to_pfn(pages_info[i]);
7a7a933edd6c3a Martin Krastev 2021-06-09  1098  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1099  	nr_pinned_strs =3D pin_use=
r_pages(arg->strs, num_pages_strs, FOLL_LONGTERM, pages_strs, NULL);
7a7a933edd6c3a Martin Krastev 2021-06-09  1100  	if (num_pages_strs !=3D nr=
_pinned_strs)
7a7a933edd6c3a Martin Krastev 2021-06-09  1101  		goto err_pin_strs;
7a7a933edd6c3a Martin Krastev 2021-06-09  1102  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1103  	for (i =3D 0; i < num_page=
s_strs; ++i)
7a7a933edd6c3a Martin Krastev 2021-06-09  1104  		pdesc->strsPPNs[i] =3D pa=
ge_to_pfn(pages_strs[i]);
7a7a933edd6c3a Martin Krastev 2021-06-09  1105  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1106  	/* Send the descriptor to =
the host via a hypervisor call. The mksGuestStat
7a7a933edd6c3a Martin Krastev 2021-06-09  1107  	   pages will remain in us=
e until the user requests a matching remove stats
7a7a933edd6c3a Martin Krastev 2021-06-09  1108  	   or a stats reset occurs=
. */
7a7a933edd6c3a Martin Krastev 2021-06-09  1109  	hypervisor_ppn_add((PPN64)=
page_to_pfn(page));
7a7a933edd6c3a Martin Krastev 2021-06-09  1110  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1111  	dev_priv->mksstat_user_pag=
es[slot] =3D page;
7a7a933edd6c3a Martin Krastev 2021-06-09  1112  	atomic_set(&dev_priv->mkss=
tat_user_pids[slot], current->pid);
7a7a933edd6c3a Martin Krastev 2021-06-09  1113  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1114  	arg->id =3D slot;
7a7a933edd6c3a Martin Krastev 2021-06-09  1115  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1116  	DRM_DEV_INFO(dev->dev, "pi=
d=3D%d arg.description=3D'%.*s' id=3D%lu\n", current->pid, (int)desc_len, p=
desc->description, slot);
7a7a933edd6c3a Martin Krastev 2021-06-09  1117  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1118  	return 0;
7a7a933edd6c3a Martin Krastev 2021-06-09  1119  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1120  err_pin_strs:
7a7a933edd6c3a Martin Krastev 2021-06-09  1121  	if (nr_pinned_strs > 0)
7a7a933edd6c3a Martin Krastev 2021-06-09  1122  		unpin_user_pages(pages_st=
rs, nr_pinned_strs);
7a7a933edd6c3a Martin Krastev 2021-06-09  1123  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1124  err_pin_info:
7a7a933edd6c3a Martin Krastev 2021-06-09  1125  	if (nr_pinned_info > 0)
7a7a933edd6c3a Martin Krastev 2021-06-09  1126  		unpin_user_pages(pages_in=
fo, nr_pinned_info);
7a7a933edd6c3a Martin Krastev 2021-06-09  1127  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1128  err_pin_stat:
7a7a933edd6c3a Martin Krastev 2021-06-09  1129  	if (nr_pinned_stat > 0)
7a7a933edd6c3a Martin Krastev 2021-06-09  1130  		unpin_user_pages(pages_st=
at, nr_pinned_stat);
7a7a933edd6c3a Martin Krastev 2021-06-09  1131  =

7a7a933edd6c3a Martin Krastev 2021-06-09  1132  	atomic_set(&dev_priv->mkss=
tat_user_pids[slot], 0);
7a7a933edd6c3a Martin Krastev 2021-06-09  1133  	__free_page(page);
7a7a933edd6c3a Martin Krastev 2021-06-09  1134  	return -ENOMEM;
7a7a933edd6c3a Martin Krastev 2021-06-09  1135  }
7a7a933edd6c3a Martin Krastev 2021-06-09  1136  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4098685976663793883==--

