Content-Type: multipart/mixed; boundary="===============6672915043824664140=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 7079/9128] drivers/bus/imx-weim.c:355:18-21: ERROR: pdev is NULL but dereferenced.
Date: Sun, 27 Feb 2022 07:39:55 +0800
Message-ID: <202202270705.QkKGBSYi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6672915043824664140==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Ivan Bornyakov <i.bornyakov@metrotek.ru>
CC: Shawn Guo <shawnguo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   06aeb1495c39c86ccfaf1adadc1d2200179f16eb
commit: e6cb5408289f4202f4088731a4ac98c7ffaedb9d [7079/9128] bus: imx-weim:=
 add DT overlay support for WEIM bus
:::::: branch date: 22 hours ago
:::::: commit date: 5 days ago
config: arm64-randconfig-c003-20220226 (https://download.01.org/0day-ci/arc=
hive/20220227/202202270705.QkKGBSYi-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/bus/imx-weim.c:355:18-21: ERROR: pdev is NULL but dereferenced.

vim +355 drivers/bus/imx-weim.c

85bf6d4e4b100e Huang Shijie   2013-05-28  302  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  303  #if IS_ENABLED(CONFIG_OF_DYN=
AMIC)
e6cb5408289f42 Ivan Bornyakov 2022-02-22  304  static int of_weim_notify(st=
ruct notifier_block *nb, unsigned long action,
e6cb5408289f42 Ivan Bornyakov 2022-02-22  305  			  void *arg)
e6cb5408289f42 Ivan Bornyakov 2022-02-22  306  {
e6cb5408289f42 Ivan Bornyakov 2022-02-22  307  	const struct imx_weim_devty=
pe *devtype;
e6cb5408289f42 Ivan Bornyakov 2022-02-22  308  	struct of_reconfig_data *rd=
 =3D arg;
e6cb5408289f42 Ivan Bornyakov 2022-02-22  309  	const struct of_device_id *=
of_id;
e6cb5408289f42 Ivan Bornyakov 2022-02-22  310  	struct platform_device *pde=
v;
e6cb5408289f42 Ivan Bornyakov 2022-02-22  311  	int ret =3D NOTIFY_OK;
e6cb5408289f42 Ivan Bornyakov 2022-02-22  312  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  313  	switch (of_reconfig_get_sta=
te_change(action, rd)) {
e6cb5408289f42 Ivan Bornyakov 2022-02-22  314  	case OF_RECONFIG_CHANGE_ADD:
e6cb5408289f42 Ivan Bornyakov 2022-02-22  315  		of_id =3D of_match_node(we=
im_id_table, rd->dn->parent);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  316  		if (!of_id)
e6cb5408289f42 Ivan Bornyakov 2022-02-22  317  			return NOTIFY_OK; /* not =
for us */
e6cb5408289f42 Ivan Bornyakov 2022-02-22  318  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  319  		devtype =3D of_id->data;
e6cb5408289f42 Ivan Bornyakov 2022-02-22  320  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  321  		pdev =3D of_find_device_by=
_node(rd->dn->parent);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  322  		if (!pdev) {
e6cb5408289f42 Ivan Bornyakov 2022-02-22  323  			pr_err("%s: could not fin=
d platform device for '%pOF'\n",
e6cb5408289f42 Ivan Bornyakov 2022-02-22  324  				__func__, rd->dn->parent=
);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  325  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  326  			return notifier_from_errn=
o(-EINVAL);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  327  		}
e6cb5408289f42 Ivan Bornyakov 2022-02-22  328  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  329  		if (weim_timing_setup(&pde=
v->dev, rd->dn, devtype))
e6cb5408289f42 Ivan Bornyakov 2022-02-22  330  			dev_warn(&pdev->dev,
e6cb5408289f42 Ivan Bornyakov 2022-02-22  331  				 "Failed to setup timing=
 for '%pOF'\n", rd->dn);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  332  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  333  		if (!of_node_check_flag(rd=
->dn, OF_POPULATED)) {
e6cb5408289f42 Ivan Bornyakov 2022-02-22  334  			if (!of_platform_device_c=
reate(rd->dn, NULL, &pdev->dev)) {
e6cb5408289f42 Ivan Bornyakov 2022-02-22  335  				dev_err(&pdev->dev,
e6cb5408289f42 Ivan Bornyakov 2022-02-22  336  					"Failed to create child=
 device '%pOF'\n",
e6cb5408289f42 Ivan Bornyakov 2022-02-22  337  					rd->dn);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  338  				ret =3D notifier_from_er=
rno(-EINVAL);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  339  			}
e6cb5408289f42 Ivan Bornyakov 2022-02-22  340  		}
e6cb5408289f42 Ivan Bornyakov 2022-02-22  341  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  342  		platform_device_put(pdev);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  343  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  344  		break;
e6cb5408289f42 Ivan Bornyakov 2022-02-22  345  	case OF_RECONFIG_CHANGE_REM=
OVE:
e6cb5408289f42 Ivan Bornyakov 2022-02-22  346  		if (!of_node_check_flag(rd=
->dn, OF_POPULATED))
e6cb5408289f42 Ivan Bornyakov 2022-02-22  347  			return NOTIFY_OK; /* devi=
ce already destroyed */
e6cb5408289f42 Ivan Bornyakov 2022-02-22  348  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  349  		of_id =3D of_match_node(we=
im_id_table, rd->dn->parent);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  350  		if (!of_id)
e6cb5408289f42 Ivan Bornyakov 2022-02-22  351  			return NOTIFY_OK; /* not =
for us */
e6cb5408289f42 Ivan Bornyakov 2022-02-22  352  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  353  		pdev =3D of_find_device_by=
_node(rd->dn);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  354  		if (!pdev) {
e6cb5408289f42 Ivan Bornyakov 2022-02-22 @355  			dev_err(&pdev->dev,
e6cb5408289f42 Ivan Bornyakov 2022-02-22  356  				"Could not find platform=
 device for '%pOF'\n",
e6cb5408289f42 Ivan Bornyakov 2022-02-22  357  				rd->dn);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  358  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  359  			ret =3D notifier_from_err=
no(-EINVAL);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  360  		} else {
e6cb5408289f42 Ivan Bornyakov 2022-02-22  361  			of_platform_device_destro=
y(&pdev->dev, NULL);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  362  			platform_device_put(pdev);
e6cb5408289f42 Ivan Bornyakov 2022-02-22  363  		}
e6cb5408289f42 Ivan Bornyakov 2022-02-22  364  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  365  		break;
e6cb5408289f42 Ivan Bornyakov 2022-02-22  366  	default:
e6cb5408289f42 Ivan Bornyakov 2022-02-22  367  		break;
e6cb5408289f42 Ivan Bornyakov 2022-02-22  368  	}
e6cb5408289f42 Ivan Bornyakov 2022-02-22  369  =

e6cb5408289f42 Ivan Bornyakov 2022-02-22  370  	return ret;
e6cb5408289f42 Ivan Bornyakov 2022-02-22  371  }
e6cb5408289f42 Ivan Bornyakov 2022-02-22  372  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6672915043824664140==--

