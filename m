Content-Type: multipart/mixed; boundary="===============0816572056638729200=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [xilinx-xlnx:xlnx_rebase_v5.15 400/872] drivers/usb/gadget/function/f_tcm.c:340:2-12: alloc with no test, possible model on line 345
Date: Wed, 09 Feb 2022 17:21:42 +0800
Message-ID: <202202091733.OwkhhpPA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0816572056638729200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-arm-kernel(a)lists.infradead.org
TO: Quanyang Wang <quanyang.wang@windriver.com>
CC: Michal Simek <monstr@monstr.eu>
CC: Manish Narani <manish.narani@xilinx.com>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.15
head:   1183ce490adb103e5e569b8ebd74c50c885ddc05
commit: 52817ef9c056b35660cd1fd8cd02c3d3603c8059 [400/872] Revert "usb: fun=
ction: f_tcm: Add support for getting alt interface number"
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20220=
209/202202091733.OwkhhpPA-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> drivers/usb/gadget/function/f_tcm.c:340:2-12: alloc with no test, possib=
le model on line 345

vim +340 drivers/usb/gadget/function/f_tcm.c

c6628548acf083 Rajnikant Bhojani 2022-01-26  331  =

c6628548acf083 Rajnikant Bhojani 2022-01-26  332  static int alloc_cmd_reso=
urce(struct f_uas *fu, int num, struct usb_ep *ep,
c6628548acf083 Rajnikant Bhojani 2022-01-26  333  			      void  (*complete=
)(struct usb_ep *ep,
c6628548acf083 Rajnikant Bhojani 2022-01-26  334  						struct usb_request =
*req))
c6628548acf083 Rajnikant Bhojani 2022-01-26  335  {
c6628548acf083 Rajnikant Bhojani 2022-01-26  336  	int i;
c6628548acf083 Rajnikant Bhojani 2022-01-26  337  =

c6628548acf083 Rajnikant Bhojani 2022-01-26  338  	fu->ncmd =3D num;
c6628548acf083 Rajnikant Bhojani 2022-01-26  339  	for (i =3D 0; i < fu->nc=
md; i++) {
c6628548acf083 Rajnikant Bhojani 2022-01-26 @340  		fu->cmd[i] =3D kcalloc(=
fu->ncmd, sizeof(struct usbg_cdb),
c6628548acf083 Rajnikant Bhojani 2022-01-26  341  				GFP_KERNEL);
c6628548acf083 Rajnikant Bhojani 2022-01-26  342  		if (!fu->cmd)
c6628548acf083 Rajnikant Bhojani 2022-01-26  343  			goto err_cmd;
c6628548acf083 Rajnikant Bhojani 2022-01-26  344  =

c6628548acf083 Rajnikant Bhojani 2022-01-26 @345  		fu->cmd[i]->req =3D usb=
_ep_alloc_request(ep, GFP_KERNEL);
c6628548acf083 Rajnikant Bhojani 2022-01-26  346  		if (!fu->cmd[i]->req)
c6628548acf083 Rajnikant Bhojani 2022-01-26  347  			goto err_cmd;
c6628548acf083 Rajnikant Bhojani 2022-01-26  348  =

c6628548acf083 Rajnikant Bhojani 2022-01-26  349  		fu->cmd[i]->buf =3D kma=
lloc(fu->ep_out->maxpacket, GFP_KERNEL);
c6628548acf083 Rajnikant Bhojani 2022-01-26  350  		if (!fu->cmd[i]->buf)
c6628548acf083 Rajnikant Bhojani 2022-01-26  351  			goto err_cmd;
c6628548acf083 Rajnikant Bhojani 2022-01-26  352  =

c6628548acf083 Rajnikant Bhojani 2022-01-26  353  		fu->cmd[i]->req->comple=
te =3D complete;
c6628548acf083 Rajnikant Bhojani 2022-01-26  354  		fu->cmd[i]->req->buf =
=3D fu->cmd[i]->buf;
c6628548acf083 Rajnikant Bhojani 2022-01-26  355  		fu->cmd[i]->req->length=
 =3D fu->ep_out->maxpacket;
c6628548acf083 Rajnikant Bhojani 2022-01-26  356  		fu->cmd[i]->req->contex=
t =3D fu;
c6628548acf083 Rajnikant Bhojani 2022-01-26  357  	}
c6628548acf083 Rajnikant Bhojani 2022-01-26  358  =

c6628548acf083 Rajnikant Bhojani 2022-01-26  359  	return 0;
c6628548acf083 Rajnikant Bhojani 2022-01-26  360  err_cmd:
c6628548acf083 Rajnikant Bhojani 2022-01-26  361  	free_cmd_resource(fu, ep=
);
c6628548acf083 Rajnikant Bhojani 2022-01-26  362  	return -ENOMEM;
c6628548acf083 Rajnikant Bhojani 2022-01-26  363  }
c6628548acf083 Rajnikant Bhojani 2022-01-26  364  =


:::::: The code at line 340 was first introduced by commit
:::::: c6628548acf08392524df4bdbeee080f6f5ecc43 usb: gadget: f_tcm: queue m=
ultiple commands request

:::::: TO: Rajnikant Bhojani <rajnikant.bhojani@xilinx.com>
:::::: CC: Michal Simek <michal.simek@xilinx.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0816572056638729200==--

