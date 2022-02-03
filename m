Content-Type: multipart/mixed; boundary="===============7851672202288528299=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mchinth:sep_socwatch_linux_5_16 1/1] drivers/platform/x86/socperf/pmu_list.c:193 pmu_list_Balance_Tree() error: we previously assumed 'node->left' could be null (see line 181)
Date: Thu, 03 Feb 2022 22:06:26 +0800
Message-ID: <202202031933.h2LPMjx2-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7851672202288528299==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Manisha Chinthapally <manisha.chinthapally@intel.com>

tree:   https://github.com/mchinth/linux sep_socwatch_linux_5_16
head:   4cbfca15a262729ae8557758b49226fe4769f582
commit: 4cbfca15a262729ae8557758b49226fe4769f582 [1/1] Platform/x86 Updated=
 SEP/SOCPERF drivers to latest version
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: i386-randconfig-m021-20220131 (https://download.01.org/0day-ci/arch=
ive/20220203/202202031933.h2LPMjx2-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/platform/x86/socperf/pmu_list.c:193 pmu_list_Balance_Tree() error: =
we previously assumed 'node->left' could be null (see line 181)
drivers/platform/x86/sepdk/sep/unc_gt.c:82 unc_gt_Initialize() error: we pr=
eviously assumed 'pecb' could be null (see line 78)
drivers/platform/x86/sepdk/sep/pmu_list.c:174 pmu_list_Balance_Tree() error=
: we previously assumed 'node->left' could be null (see line 162)
drivers/platform/x86/sepdk/sep/pmu_list.c:252 pmu_list_Balance_Tree_Range()=
 error: we previously assumed 'node->left' could be null (see line 239)
drivers/platform/x86/sepdk/sep/lwpmudrv.c:1164 lwpmudrv_Initialize() warn: =
potential spectre issue 'devices' [w] (local cap)
drivers/platform/x86/sepdk/sep/lwpmudrv.c:1354 lwpmudrv_Initialize_UNC() wa=
rn: potential spectre issue 'devices' [w] (local cap)

Old smatch warnings:
drivers/platform/x86/sepdk/sep/lwpmudrv.c:2208 lwpmudrv_Trigger_Read() erro=
r: we previously assumed 'drv_cfg' could be null (see line 2194)
drivers/platform/x86/sepdk/sep/lwpmudrv.c:3352 lwpmudrv_Read_Counters_And_S=
witch_Group() warn: inconsistent indenting
drivers/platform/x86/sepdk/sep/lwpmudrv.c:3505 lwpmudrv_Read_And_Reset_Coun=
ters() warn: inconsistent indenting
drivers/platform/x86/sepdk/sep/lwpmudrv.c:3792 lwpmudrv_Configure_Events() =
warn: potential spectre issue '(&devices[cur_device])->PMU_register_data' [=
w] (local cap)
drivers/platform/x86/sepdk/sep/lwpmudrv.c:4278 lwpmudrv_Configure_Events_UN=
C() warn: potential spectre issue 'PMU_register_data_unc' [w] (local cap)
drivers/platform/x86/sepdk/sep/lwpmudrv.c:4282 lwpmudrv_Configure_Events_UN=
C() warn: possible spectre second half.  'ecb'
drivers/platform/x86/sepdk/sep/lwpmudrv.c:5390 lwpmudrv_Get_Platform_Info()=
 warn: maybe return -EFAULT instead of the bytes remaining?
drivers/platform/x86/sepdk/sep/lwpmudrv.c:5422 lwpmudrv_Get_Platform_Info()=
 warn: maybe return -EFAULT instead of the bytes remaining?

vim +193 drivers/platform/x86/socperf/pmu_list.c

4cbfca15a26272 Manisha Chinthapally 2022-02-02  170  =

4cbfca15a26272 Manisha Chinthapally 2022-02-02  171  /*********************=
*******************************************************************
4cbfca15a26272 Manisha Chinthapally 2022-02-02  172   * Range is not used: =
for PCI and MMIO
4cbfca15a26272 Manisha Chinthapally 2022-02-02  173   *********************=
*******************************************************************/
4cbfca15a26272 Manisha Chinthapally 2022-02-02  174  =

4cbfca15a26272 Manisha Chinthapally 2022-02-02  175  static PMU_SEARCH_NODE=
 *pmu_list_Balance_Tree(PMU_SEARCH_NODE *node, U64 key)
4cbfca15a26272 Manisha Chinthapally 2022-02-02  176  {
4cbfca15a26272 Manisha Chinthapally 2022-02-02  177  	S32 height_delta =3D =
0;
4cbfca15a26272 Manisha Chinthapally 2022-02-02  178  =

4cbfca15a26272 Manisha Chinthapally 2022-02-02  179  	if (node->left && nod=
e->right) {
4cbfca15a26272 Manisha Chinthapally 2022-02-02  180  		height_delta =3D nod=
e->left->height - node->right->height;
4cbfca15a26272 Manisha Chinthapally 2022-02-02 @181  	} else if (node->left=
) {
4cbfca15a26272 Manisha Chinthapally 2022-02-02  182  		height_delta =3D nod=
e->left->height;
4cbfca15a26272 Manisha Chinthapally 2022-02-02  183  	} else if (node->righ=
t) {
4cbfca15a26272 Manisha Chinthapally 2022-02-02  184  		height_delta =3D 0 -=
 (node->right->height);
4cbfca15a26272 Manisha Chinthapally 2022-02-02  185  	}
4cbfca15a26272 Manisha Chinthapally 2022-02-02  186  =

4cbfca15a26272 Manisha Chinthapally 2022-02-02  187  	if (height_delta =3D=
=3D 0) {
4cbfca15a26272 Manisha Chinthapally 2022-02-02  188  		// tree is balanced
4cbfca15a26272 Manisha Chinthapally 2022-02-02  189  		return node;
4cbfca15a26272 Manisha Chinthapally 2022-02-02  190  	}
4cbfca15a26272 Manisha Chinthapally 2022-02-02  191  	// if Delta > 1, bala=
nce left tree
4cbfca15a26272 Manisha Chinthapally 2022-02-02  192  	else if ((height_delt=
a > 1) && (node->key > key)) {
4cbfca15a26272 Manisha Chinthapally 2022-02-02 @193  		node =3D pmu_list_Ri=
ght_Rotate(node);
4cbfca15a26272 Manisha Chinthapally 2022-02-02  194  	} else if ((height_de=
lta > 1) && (node->key < key)) {
4cbfca15a26272 Manisha Chinthapally 2022-02-02  195  		node->left =3D pmu_l=
ist_Left_Rotate(node->left);
4cbfca15a26272 Manisha Chinthapally 2022-02-02  196  		node =3D pmu_list_Ri=
ght_Rotate(node);
4cbfca15a26272 Manisha Chinthapally 2022-02-02  197  	}
4cbfca15a26272 Manisha Chinthapally 2022-02-02  198  	// if Delta < -1, bal=
ance right tree
4cbfca15a26272 Manisha Chinthapally 2022-02-02  199  	else if ((height_delt=
a < -1) && (node->key < key)) {
4cbfca15a26272 Manisha Chinthapally 2022-02-02  200  		node =3D pmu_list_Le=
ft_Rotate(node);
4cbfca15a26272 Manisha Chinthapally 2022-02-02  201  	} else if ((height_de=
lta < -1) && (node->key > key)) {
4cbfca15a26272 Manisha Chinthapally 2022-02-02  202  		node->right =3D pmu_=
list_Right_Rotate(node->right);
4cbfca15a26272 Manisha Chinthapally 2022-02-02  203  		node =3D pmu_list_Le=
ft_Rotate(node);
4cbfca15a26272 Manisha Chinthapally 2022-02-02  204  	}
4cbfca15a26272 Manisha Chinthapally 2022-02-02  205  	return node;
4cbfca15a26272 Manisha Chinthapally 2022-02-02  206  }
4cbfca15a26272 Manisha Chinthapally 2022-02-02  207  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7851672202288528299==--

