Content-Type: multipart/mixed; boundary="===============4334254943765026657=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/phy/phylink.c:887 phylink_change_inband_advert() error: we previously assumed 'pl->pcs' could be null (see line 870)
Date: Thu, 25 Aug 2022 00:24:58 +0800
Message-ID: <202208250056.TryBiAaK-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4334254943765026657==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c40e8341e3b3bb27e3a65b06b5b454626234c4f0
commit: 4f1dd48f403149dc720a24c54120749433c4b984 net: phylink: remove pcs_o=
ps member
date:   8 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 8 weeks ago
config: openrisc-randconfig-m031-20220824 (https://download.01.org/0day-ci/=
archive/20220825/202208250056.TryBiAaK-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/phy/phylink.c:887 phylink_change_inband_advert() error: we prev=
iously assumed 'pl->pcs' could be null (see line 870)

vim +887 drivers/net/phy/phylink.c

9525ae83959b60 Russell King          2017-07-25  856  =

1571e700fd610c Russell King          2020-07-21  857  /*
1571e700fd610c Russell King          2020-07-21  858   * Reconfigure for a =
change of inband advertisement.
1571e700fd610c Russell King          2020-07-21  859   * If we have a separ=
ate PCS, we only need to call its pcs_config() method,
1571e700fd610c Russell King          2020-07-21  860   * and then restart A=
N if it indicates something changed. Otherwise, we do
1571e700fd610c Russell King          2020-07-21  861   * the full MAC recon=
figuration.
1571e700fd610c Russell King          2020-07-21  862   */
1571e700fd610c Russell King          2020-07-21  863  static int phylink_ch=
ange_inband_advert(struct phylink *pl)
1571e700fd610c Russell King          2020-07-21  864  {
1571e700fd610c Russell King          2020-07-21  865  	int ret;
1571e700fd610c Russell King          2020-07-21  866  =

1571e700fd610c Russell King          2020-07-21  867  	if (test_bit(PHYLINK=
_DISABLE_STOPPED, &pl->phylink_disable_state))
1571e700fd610c Russell King          2020-07-21  868  		return 0;
1571e700fd610c Russell King          2020-07-21  869  =

4f1dd48f403149 Russell King (Oracle  2022-06-27 @870) 	if (!pl->pcs && pl->=
config->legacy_pre_march2020) {
1571e700fd610c Russell King          2020-07-21  871  		/* Legacy method */
1571e700fd610c Russell King          2020-07-21  872  		phylink_mac_config(=
pl, &pl->link_config);
1571e700fd610c Russell King          2020-07-21  873  		phylink_mac_pcs_an_=
restart(pl);
1571e700fd610c Russell King          2020-07-21  874  		return 0;
1571e700fd610c Russell King          2020-07-21  875  	}
1571e700fd610c Russell King          2020-07-21  876  =

1571e700fd610c Russell King          2020-07-21  877  	phylink_dbg(pl, "%s:=
 mode=3D%s/%s adv=3D%*pb pause=3D%02x\n", __func__,
1571e700fd610c Russell King          2020-07-21  878  		    phylink_an_mode=
_str(pl->cur_link_an_mode),
1571e700fd610c Russell King          2020-07-21  879  		    phy_modes(pl->l=
ink_config.interface),
1571e700fd610c Russell King          2020-07-21  880  		    __ETHTOOL_LINK_=
MODE_MASK_NBITS, pl->link_config.advertising,
1571e700fd610c Russell King          2020-07-21  881  		    pl->link_config=
.pause);
1571e700fd610c Russell King          2020-07-21  882  =

1571e700fd610c Russell King          2020-07-21  883  	/* Modern PCS-based =
method; update the advert at the PCS, and
1571e700fd610c Russell King          2020-07-21  884  	 * restart negotiati=
on if the pcs_config() helper indicates that
1571e700fd610c Russell King          2020-07-21  885  	 * the programmed ad=
vertisement has changed.
1571e700fd610c Russell King          2020-07-21  886  	 */
4f1dd48f403149 Russell King (Oracle  2022-06-27 @887) 	ret =3D pl->pcs->ops=
->pcs_config(pl->pcs, pl->cur_link_an_mode,
1571e700fd610c Russell King          2020-07-21  888  				       pl->link_c=
onfig.interface,
1571e700fd610c Russell King          2020-07-21  889  				       pl->link_c=
onfig.advertising,
4f1dd48f403149 Russell King (Oracle  2022-06-27  890) 				       !!(pl->lin=
k_config.pause &
4f1dd48f403149 Russell King (Oracle  2022-06-27  891) 					  MLO_PAUSE_AN));
1571e700fd610c Russell King          2020-07-21  892  	if (ret < 0)
1571e700fd610c Russell King          2020-07-21  893  		return ret;
1571e700fd610c Russell King          2020-07-21  894  =

1571e700fd610c Russell King          2020-07-21  895  	if (ret > 0)
1571e700fd610c Russell King          2020-07-21  896  		phylink_mac_pcs_an_=
restart(pl);
1571e700fd610c Russell King          2020-07-21  897  =

1571e700fd610c Russell King          2020-07-21  898  	return 0;
1571e700fd610c Russell King          2020-07-21  899  }
1571e700fd610c Russell King          2020-07-21  900  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4334254943765026657==--

