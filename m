Content-Type: multipart/mixed; boundary="===============1451248317385496500=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [linux-next:master 2227/3715] drivers/staging/wfx/sta.c:155 wfx_filter_mcast() warn: ignoring unreachable code.
Date: Wed, 22 Apr 2020 00:35:17 +0800
Message-ID: <202004220013.FJygLtnx%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1451248317385496500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: "J=C3=A9r=C3=B4me Pouiller" <jerome.pouiller@silabs.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   39a314cd1168cbcb05ebcd973098c8f1440a3064
commit: c801351a9d4587aab131d018330d4b35a0b3cdcf [2227/3715] staging: wfx: =
drop useless attribute 'filter_mcast'
:::::: branch date: 10 hours ago
:::::: commit date: 5 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/staging/wfx/sta.c:155 wfx_filter_mcast() warn: ignoring unreachable=
 code.

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Dc801351a9d4587aab131d018330d4b35a0b3cdcf
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout c801351a9d4587aab131d018330d4b35a0b3cdcf
vim +155 drivers/staging/wfx/sta.c

2c69b2da378243 J=C3=A9r=C3=B4me Pouiller 2020-04-15  146  =

c801351a9d4587 J=C3=A9r=C3=B4me Pouiller 2020-04-15  147  static void wfx_f=
ilter_mcast(struct wfx_vif *wvif, bool filter_mcast)
2c69b2da378243 J=C3=A9r=C3=B4me Pouiller 2020-04-15  148  {
2c69b2da378243 J=C3=A9r=C3=B4me Pouiller 2020-04-15  149  	int i;
40115bbc40e2fd J=C3=A9r=C3=B4me Pouiller 2019-09-19  150  =

e86bc725ba5f96 J=C3=A9r=C3=B4me Pouiller 2020-04-15  151  	// Temporary wor=
karound for filters
e86bc725ba5f96 J=C3=A9r=C3=B4me Pouiller 2020-04-15  152  	hif_set_data_fil=
tering(wvif, false, true);
e86bc725ba5f96 J=C3=A9r=C3=B4me Pouiller 2020-04-15  153  	return;
e86bc725ba5f96 J=C3=A9r=C3=B4me Pouiller 2020-04-15  154  =

c801351a9d4587 J=C3=A9r=C3=B4me Pouiller 2020-04-15 @155  	if (!filter_mcas=
t) {
e86bc725ba5f96 J=C3=A9r=C3=B4me Pouiller 2020-04-15  156  		hif_set_data_fi=
ltering(wvif, false, true);
e86bc725ba5f96 J=C3=A9r=C3=B4me Pouiller 2020-04-15  157  		return;
e86bc725ba5f96 J=C3=A9r=C3=B4me Pouiller 2020-04-15  158  	}
981132aa039d90 J=C3=A9r=C3=B4me Pouiller 2020-04-15  159  	for (i =3D 0; i =
< wvif->filter_mcast_count; i++)
981132aa039d90 J=C3=A9r=C3=B4me Pouiller 2020-04-15  160  		hif_set_mac_add=
r_condition(wvif, i, wvif->filter_mcast_addr[i]);
e86bc725ba5f96 J=C3=A9r=C3=B4me Pouiller 2020-04-15  161  	hif_set_uc_mc_bc=
_condition(wvif, 0,
e86bc725ba5f96 J=C3=A9r=C3=B4me Pouiller 2020-04-15  162  				   HIF_FILTER=
_UNICAST | HIF_FILTER_BROADCAST);
e86bc725ba5f96 J=C3=A9r=C3=B4me Pouiller 2020-04-15  163  	hif_set_config_d=
ata_filter(wvif, true, 0, BIT(1),
981132aa039d90 J=C3=A9r=C3=B4me Pouiller 2020-04-15  164  				   BIT(wvif->=
filter_mcast_count) - 1);
e86bc725ba5f96 J=C3=A9r=C3=B4me Pouiller 2020-04-15  165  	hif_set_data_fil=
tering(wvif, true, true);
40115bbc40e2fd J=C3=A9r=C3=B4me Pouiller 2019-09-19  166  }
40115bbc40e2fd J=C3=A9r=C3=B4me Pouiller 2019-09-19  167  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1451248317385496500==--

