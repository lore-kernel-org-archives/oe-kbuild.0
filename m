Content-Type: multipart/mixed; boundary="===============4738189514743231905=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5713/7473] drivers/net/phy/phylink.c:823 phylink_change_inband_advert() error: we previously assumed 'pl->pcs_ops' could be null (see line 806)
Date: Thu, 16 Dec 2021 11:52:41 +0800
Message-ID: <202112161111.nZYxPvCn-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4738189514743231905==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   93bf6eee76c0e716f6b32de690b1c52991547bb4
commit: 001f4261fe4d5ae710cf1f445b6cae6d9d3ae26e [5713/7473] net: phylink: =
use legacy_pre_march2020
:::::: branch date: 6 hours ago
:::::: commit date: 6 days ago
config: x86_64-randconfig-m001-20211214 (https://download.01.org/0day-ci/ar=
chive/20211216/202112161111.nZYxPvCn-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/phy/phylink.c:823 phylink_change_inband_advert() error: we prev=
iously assumed 'pl->pcs_ops' could be null (see line 806)

vim +823 drivers/net/phy/phylink.c

9525ae83959b60 Russell King          2017-07-25  792  =

1571e700fd610c Russell King          2020-07-21  793  /*
1571e700fd610c Russell King          2020-07-21  794   * Reconfigure for a =
change of inband advertisement.
1571e700fd610c Russell King          2020-07-21  795   * If we have a separ=
ate PCS, we only need to call its pcs_config() method,
1571e700fd610c Russell King          2020-07-21  796   * and then restart A=
N if it indicates something changed. Otherwise, we do
1571e700fd610c Russell King          2020-07-21  797   * the full MAC recon=
figuration.
1571e700fd610c Russell King          2020-07-21  798   */
1571e700fd610c Russell King          2020-07-21  799  static int phylink_ch=
ange_inband_advert(struct phylink *pl)
1571e700fd610c Russell King          2020-07-21  800  {
1571e700fd610c Russell King          2020-07-21  801  	int ret;
1571e700fd610c Russell King          2020-07-21  802  =

1571e700fd610c Russell King          2020-07-21  803  	if (test_bit(PHYLINK=
_DISABLE_STOPPED, &pl->phylink_disable_state))
1571e700fd610c Russell King          2020-07-21  804  		return 0;
1571e700fd610c Russell King          2020-07-21  805  =

001f4261fe4d5a Russell King (Oracle  2021-12-09 @806) 	if (!pl->pcs_ops && =
pl->config->legacy_pre_march2020) {
1571e700fd610c Russell King          2020-07-21  807  		/* Legacy method */
1571e700fd610c Russell King          2020-07-21  808  		phylink_mac_config(=
pl, &pl->link_config);
1571e700fd610c Russell King          2020-07-21  809  		phylink_mac_pcs_an_=
restart(pl);
1571e700fd610c Russell King          2020-07-21  810  		return 0;
1571e700fd610c Russell King          2020-07-21  811  	}
1571e700fd610c Russell King          2020-07-21  812  =

1571e700fd610c Russell King          2020-07-21  813  	phylink_dbg(pl, "%s:=
 mode=3D%s/%s adv=3D%*pb pause=3D%02x\n", __func__,
1571e700fd610c Russell King          2020-07-21  814  		    phylink_an_mode=
_str(pl->cur_link_an_mode),
1571e700fd610c Russell King          2020-07-21  815  		    phy_modes(pl->l=
ink_config.interface),
1571e700fd610c Russell King          2020-07-21  816  		    __ETHTOOL_LINK_=
MODE_MASK_NBITS, pl->link_config.advertising,
1571e700fd610c Russell King          2020-07-21  817  		    pl->link_config=
.pause);
1571e700fd610c Russell King          2020-07-21  818  =

1571e700fd610c Russell King          2020-07-21  819  	/* Modern PCS-based =
method; update the advert at the PCS, and
1571e700fd610c Russell King          2020-07-21  820  	 * restart negotiati=
on if the pcs_config() helper indicates that
1571e700fd610c Russell King          2020-07-21  821  	 * the programmed ad=
vertisement has changed.
1571e700fd610c Russell King          2020-07-21  822  	 */
7137e18f6f889a Russell King          2020-07-21 @823  	ret =3D pl->pcs_ops-=
>pcs_config(pl->pcs, pl->cur_link_an_mode,
1571e700fd610c Russell King          2020-07-21  824  				      pl->link_co=
nfig.interface,
1571e700fd610c Russell King          2020-07-21  825  				      pl->link_co=
nfig.advertising,
1571e700fd610c Russell King          2020-07-21  826  				      !!(pl->link=
_config.pause & MLO_PAUSE_AN));
1571e700fd610c Russell King          2020-07-21  827  	if (ret < 0)
1571e700fd610c Russell King          2020-07-21  828  		return ret;
1571e700fd610c Russell King          2020-07-21  829  =

1571e700fd610c Russell King          2020-07-21  830  	if (ret > 0)
1571e700fd610c Russell King          2020-07-21  831  		phylink_mac_pcs_an_=
restart(pl);
1571e700fd610c Russell King          2020-07-21  832  =

1571e700fd610c Russell King          2020-07-21  833  	return 0;
1571e700fd610c Russell King          2020-07-21  834  }
1571e700fd610c Russell King          2020-07-21  835  =


:::::: The code at line 823 was first introduced by commit
:::::: 7137e18f6f889a67046d5004e1690a32d7d2108d net: phylink: add struct ph=
ylink_pcs

:::::: TO: Russell King <rmk+kernel@armlinux.org.uk>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4738189514743231905==--

