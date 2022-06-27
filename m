Content-Type: multipart/mixed; boundary="===============6928536367486370853=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rmk-arm:net-next 36/51] drivers/net/phy/phylink.c:885 phylink_change_inband_advert() error: we previously assumed 'pl->pcs' could be null (see line 868)
Date: Mon, 27 Jun 2022 03:04:31 +0000
Message-ID: <202206252237.u2XCl4WP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6928536367486370853==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   git://git.armlinux.org.uk/~rmk/linux-arm net-next
head:   27dd9da5270e825fadd193b534742d46976267df
commit: a46ef9dd2d34ffdf78a81a8b970bd97f38590784 [36/51] net: phylink: remo=
ve pcs_ops member
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: nios2-randconfig-m031-20220624
compiler: nios2-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/phy/phylink.c:885 phylink_change_inband_advert() error: we prev=
iously assumed 'pl->pcs' could be null (see line 868)

vim +885 drivers/net/phy/phylink.c

9525ae83959b60 Russell King          2017-07-25  854  =

1571e700fd610c Russell King          2020-07-21  855  /*
1571e700fd610c Russell King          2020-07-21  856   * Reconfigure for a =
change of inband advertisement.
1571e700fd610c Russell King          2020-07-21  857   * If we have a separ=
ate PCS, we only need to call its pcs_config() method,
1571e700fd610c Russell King          2020-07-21  858   * and then restart A=
N if it indicates something changed. Otherwise, we do
1571e700fd610c Russell King          2020-07-21  859   * the full MAC recon=
figuration.
1571e700fd610c Russell King          2020-07-21  860   */
1571e700fd610c Russell King          2020-07-21  861  static int phylink_ch=
ange_inband_advert(struct phylink *pl)
1571e700fd610c Russell King          2020-07-21  862  {
1571e700fd610c Russell King          2020-07-21  863  	int ret;
1571e700fd610c Russell King          2020-07-21  864  =

1571e700fd610c Russell King          2020-07-21  865  	if (test_bit(PHYLINK=
_DISABLE_STOPPED, &pl->phylink_disable_state))
1571e700fd610c Russell King          2020-07-21  866  		return 0;
1571e700fd610c Russell King          2020-07-21  867  =

a46ef9dd2d34ff Russell King (Oracle  2022-04-14 @868) 	if (!pl->pcs && pl->=
config->legacy_pre_march2020) {
1571e700fd610c Russell King          2020-07-21  869  		/* Legacy method */
1571e700fd610c Russell King          2020-07-21  870  		phylink_mac_config(=
pl, &pl->link_config);
1571e700fd610c Russell King          2020-07-21  871  		phylink_mac_pcs_an_=
restart(pl);
1571e700fd610c Russell King          2020-07-21  872  		return 0;
1571e700fd610c Russell King          2020-07-21  873  	}
1571e700fd610c Russell King          2020-07-21  874  =

1571e700fd610c Russell King          2020-07-21  875  	phylink_dbg(pl, "%s:=
 mode=3D%s/%s adv=3D%*pb pause=3D%02x\n", __func__,
1571e700fd610c Russell King          2020-07-21  876  		    phylink_an_mode=
_str(pl->cur_link_an_mode),
1571e700fd610c Russell King          2020-07-21  877  		    phy_modes(pl->l=
ink_config.interface),
1571e700fd610c Russell King          2020-07-21  878  		    __ETHTOOL_LINK_=
MODE_MASK_NBITS, pl->link_config.advertising,
1571e700fd610c Russell King          2020-07-21  879  		    pl->link_config=
.pause);
1571e700fd610c Russell King          2020-07-21  880  =

1571e700fd610c Russell King          2020-07-21  881  	/* Modern PCS-based =
method; update the advert at the PCS, and
1571e700fd610c Russell King          2020-07-21  882  	 * restart negotiati=
on if the pcs_config() helper indicates that
1571e700fd610c Russell King          2020-07-21  883  	 * the programmed ad=
vertisement has changed.
1571e700fd610c Russell King          2020-07-21  884  	 */
a46ef9dd2d34ff Russell King (Oracle  2022-04-14 @885) 	ret =3D pl->pcs->ops=
->pcs_config(pl->pcs, pl->cur_link_an_mode,
1571e700fd610c Russell King          2020-07-21  886  				       pl->link_c=
onfig.interface,
1571e700fd610c Russell King          2020-07-21  887  				       pl->link_c=
onfig.advertising,
a46ef9dd2d34ff Russell King (Oracle  2022-04-14  888) 				       !!(pl->lin=
k_config.pause &
a46ef9dd2d34ff Russell King (Oracle  2022-04-14  889) 					  MLO_PAUSE_AN));
1571e700fd610c Russell King          2020-07-21  890  	if (ret < 0)
1571e700fd610c Russell King          2020-07-21  891  		return ret;
1571e700fd610c Russell King          2020-07-21  892  =

1571e700fd610c Russell King          2020-07-21  893  	if (ret > 0)
1571e700fd610c Russell King          2020-07-21  894  		phylink_mac_pcs_an_=
restart(pl);
1571e700fd610c Russell King          2020-07-21  895  =

1571e700fd610c Russell King          2020-07-21  896  	return 0;
1571e700fd610c Russell King          2020-07-21  897  }
1571e700fd610c Russell King          2020-07-21  898  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6928536367486370853==--

