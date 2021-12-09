Content-Type: multipart/mixed; boundary="===============7057880642967793172=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5409:30: warning: Possible null pointer dereference: new_rule [nullPointer]
Date: Thu, 09 Dec 2021 11:08:59 +0800
Message-ID: <202112091027.s5UHVKud-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7057880642967793172==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Liu Jian <liujian56@huawei.com>

Hi Liu,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2a987e65025e2b79c6d453b78cb5985ac6e5eb26
commit: 54422bd436e084e6c74aff6026c1767f1570ab26 net: hns3: no return state=
ment in hclge_clear_arfs_rules
date:   9 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 9 months ago
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:4132:3: warning:=
 Assignment of function parameter has no effect outside the function. Did y=
ou forget dereferencing it? [uselessAssignmentPtrArg]
     handle =3D &hdev->vport[0].nic;
     ^
>> drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5409:30: warning=
: Possible null pointer dereference: new_rule [nullPointer]
    hclge_fd_inc_rule_cnt(hdev, new_rule->location);
                                ^
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:6585:61: note: C=
alling function 'hclge_update_fd_list', 4th argument 'NULL' value is 0
    hclge_update_fd_list(hdev, HCLGE_FD_DELETED, fs->location, NULL);
                                                               ^
   drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c:5409:30: note: N=
ull pointer dereference
    hclge_fd_inc_rule_cnt(hdev, new_rule->location);
                                ^

vim +5409 drivers/net/ethernet/hisilicon/hns3/hns3pf/hclge_main.c

67b0e1428e2f59 Jian Shen 2021-03-22  5376  =

fc4243b8de8b4e Jian Shen 2021-03-22  5377  static void hclge_update_fd_list=
(struct hclge_dev *hdev,
fc4243b8de8b4e Jian Shen 2021-03-22  5378  				 enum HCLGE_FD_NODE_STATE st=
ate, u16 location,
fc4243b8de8b4e Jian Shen 2021-03-22  5379  				 struct hclge_fd_rule *new_r=
ule)
fc4243b8de8b4e Jian Shen 2021-03-22  5380  {
fc4243b8de8b4e Jian Shen 2021-03-22  5381  	struct hlist_head *hlist =3D &h=
dev->fd_rule_list;
fc4243b8de8b4e Jian Shen 2021-03-22  5382  	struct hclge_fd_rule *fd_rule, =
*parent =3D NULL;
fc4243b8de8b4e Jian Shen 2021-03-22  5383  =

fc4243b8de8b4e Jian Shen 2021-03-22  5384  	fd_rule =3D hclge_find_fd_rule(=
hlist, location, &parent);
fc4243b8de8b4e Jian Shen 2021-03-22  5385  	if (fd_rule) {
67b0e1428e2f59 Jian Shen 2021-03-22  5386  		hclge_fd_dec_user_def_refcnt(h=
dev, fd_rule);
67b0e1428e2f59 Jian Shen 2021-03-22  5387  		if (state =3D=3D HCLGE_FD_ACTI=
VE)
67b0e1428e2f59 Jian Shen 2021-03-22  5388  			hclge_fd_inc_user_def_refcnt(=
hdev, new_rule);
67b0e1428e2f59 Jian Shen 2021-03-22  5389  		hclge_sync_fd_user_def_cfg(hde=
v, true);
67b0e1428e2f59 Jian Shen 2021-03-22  5390  =

fc4243b8de8b4e Jian Shen 2021-03-22  5391  		hclge_update_fd_rule_node(hdev=
, fd_rule, new_rule, state);
fc4243b8de8b4e Jian Shen 2021-03-22  5392  		return;
fc4243b8de8b4e Jian Shen 2021-03-22  5393  	}
fc4243b8de8b4e Jian Shen 2021-03-22  5394  =

fc4243b8de8b4e Jian Shen 2021-03-22  5395  	/* it's unlikely to fail here, =
because we have checked the rule
fc4243b8de8b4e Jian Shen 2021-03-22  5396  	 * exist before.
fc4243b8de8b4e Jian Shen 2021-03-22  5397  	 */
fc4243b8de8b4e Jian Shen 2021-03-22  5398  	if (unlikely(state =3D=3D HCLGE=
_FD_TO_DEL || state =3D=3D HCLGE_FD_DELETED)) {
fc4243b8de8b4e Jian Shen 2021-03-22  5399  		dev_warn(&hdev->pdev->dev,
fc4243b8de8b4e Jian Shen 2021-03-22  5400  			 "failed to delete fd rule %u=
, it's inexistent\n",
fc4243b8de8b4e Jian Shen 2021-03-22  5401  			 location);
fc4243b8de8b4e Jian Shen 2021-03-22  5402  		return;
fc4243b8de8b4e Jian Shen 2021-03-22  5403  	}
fc4243b8de8b4e Jian Shen 2021-03-22  5404  =

67b0e1428e2f59 Jian Shen 2021-03-22  5405  	hclge_fd_inc_user_def_refcnt(hd=
ev, new_rule);
67b0e1428e2f59 Jian Shen 2021-03-22  5406  	hclge_sync_fd_user_def_cfg(hdev=
, true);
67b0e1428e2f59 Jian Shen 2021-03-22  5407  =

fc4243b8de8b4e Jian Shen 2021-03-22  5408  	hclge_fd_insert_rule_node(hlist=
, new_rule, parent);
fc4243b8de8b4e Jian Shen 2021-03-22 @5409  	hclge_fd_inc_rule_cnt(hdev, new=
_rule->location);
fc4243b8de8b4e Jian Shen 2021-03-22  5410  =

fc4243b8de8b4e Jian Shen 2021-03-22  5411  	if (state =3D=3D HCLGE_FD_TO_AD=
D) {
fc4243b8de8b4e Jian Shen 2021-03-22  5412  		set_bit(HCLGE_STATE_FD_TBL_CHA=
NGED, &hdev->state);
fc4243b8de8b4e Jian Shen 2021-03-22  5413  		hclge_task_schedule(hdev, 0);
fc4243b8de8b4e Jian Shen 2021-03-22  5414  	}
fc4243b8de8b4e Jian Shen 2021-03-22  5415  }
fc4243b8de8b4e Jian Shen 2021-03-22  5416  =


:::::: The code at line 5409 was first introduced by commit
:::::: fc4243b8de8b4e7170f07f2660dcab3f8ecda0e9 net: hns3: refactor flow di=
rector configuration

:::::: TO: Jian Shen <shenjian15@huawei.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7057880642967793172==--

