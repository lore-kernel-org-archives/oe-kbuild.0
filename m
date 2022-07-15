Content-Type: multipart/mixed; boundary="===============3083551534925870521=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5524/10906] drivers/net/phy/phylink.c:887 phylink_change_inband_advert() error: we previously assumed 'pl->pcs' could be null (see line 870)
Date: Sat, 16 Jul 2022 07:27:27 +0800
Message-ID: <202207160751.lDjTxiGW-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3083551534925870521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   6014cfa5bf32cf8c5c58b3cfd5ee0e1542c8a825
commit: 4f1dd48f403149dc720a24c54120749433c4b984 [5524/10906] net: phylink:=
 remove pcs_ops member
:::::: branch date: 11 hours ago
:::::: commit date: 2 weeks ago
config: microblaze-randconfig-m041-20220716 (https://download.01.org/0day-c=
i/archive/20220716/202207160751.lDjTxiGW-lkp(a)intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/phy/phylink.c:887 phylink_change_inband_advert() error: we prev=
iously assumed 'pl->pcs' could be null (see line 870)

vim +887 drivers/net/phy/phylink.c

9525ae83959b60c Russell King          2017-07-25  856  =

1571e700fd610c3 Russell King          2020-07-21  857  /*
1571e700fd610c3 Russell King          2020-07-21  858   * Reconfigure for a=
 change of inband advertisement.
1571e700fd610c3 Russell King          2020-07-21  859   * If we have a sepa=
rate PCS, we only need to call its pcs_config() method,
1571e700fd610c3 Russell King          2020-07-21  860   * and then restart =
AN if it indicates something changed. Otherwise, we do
1571e700fd610c3 Russell King          2020-07-21  861   * the full MAC reco=
nfiguration.
1571e700fd610c3 Russell King          2020-07-21  862   */
1571e700fd610c3 Russell King          2020-07-21  863  static int phylink_c=
hange_inband_advert(struct phylink *pl)
1571e700fd610c3 Russell King          2020-07-21  864  {
1571e700fd610c3 Russell King          2020-07-21  865  	int ret;
1571e700fd610c3 Russell King          2020-07-21  866  =

1571e700fd610c3 Russell King          2020-07-21  867  	if (test_bit(PHYLIN=
K_DISABLE_STOPPED, &pl->phylink_disable_state))
1571e700fd610c3 Russell King          2020-07-21  868  		return 0;
1571e700fd610c3 Russell King          2020-07-21  869  =

4f1dd48f403149d Russell King (Oracle  2022-06-27 @870) 	if (!pl->pcs && pl-=
>config->legacy_pre_march2020) {
1571e700fd610c3 Russell King          2020-07-21  871  		/* Legacy method */
1571e700fd610c3 Russell King          2020-07-21  872  		phylink_mac_config=
(pl, &pl->link_config);
1571e700fd610c3 Russell King          2020-07-21  873  		phylink_mac_pcs_an=
_restart(pl);
1571e700fd610c3 Russell King          2020-07-21  874  		return 0;
1571e700fd610c3 Russell King          2020-07-21  875  	}
1571e700fd610c3 Russell King          2020-07-21  876  =

1571e700fd610c3 Russell King          2020-07-21  877  	phylink_dbg(pl, "%s=
: mode=3D%s/%s adv=3D%*pb pause=3D%02x\n", __func__,
1571e700fd610c3 Russell King          2020-07-21  878  		    phylink_an_mod=
e_str(pl->cur_link_an_mode),
1571e700fd610c3 Russell King          2020-07-21  879  		    phy_modes(pl->=
link_config.interface),
1571e700fd610c3 Russell King          2020-07-21  880  		    __ETHTOOL_LINK=
_MODE_MASK_NBITS, pl->link_config.advertising,
1571e700fd610c3 Russell King          2020-07-21  881  		    pl->link_confi=
g.pause);
1571e700fd610c3 Russell King          2020-07-21  882  =

1571e700fd610c3 Russell King          2020-07-21  883  	/* Modern PCS-based=
 method; update the advert at the PCS, and
1571e700fd610c3 Russell King          2020-07-21  884  	 * restart negotiat=
ion if the pcs_config() helper indicates that
1571e700fd610c3 Russell King          2020-07-21  885  	 * the programmed a=
dvertisement has changed.
1571e700fd610c3 Russell King          2020-07-21  886  	 */
4f1dd48f403149d Russell King (Oracle  2022-06-27 @887) 	ret =3D pl->pcs->op=
s->pcs_config(pl->pcs, pl->cur_link_an_mode,
1571e700fd610c3 Russell King          2020-07-21  888  				       pl->link_=
config.interface,
1571e700fd610c3 Russell King          2020-07-21  889  				       pl->link_=
config.advertising,
4f1dd48f403149d Russell King (Oracle  2022-06-27  890) 				       !!(pl->li=
nk_config.pause &
4f1dd48f403149d Russell King (Oracle  2022-06-27  891) 					  MLO_PAUSE_AN)=
);
1571e700fd610c3 Russell King          2020-07-21  892  	if (ret < 0)
1571e700fd610c3 Russell King          2020-07-21  893  		return ret;
1571e700fd610c3 Russell King          2020-07-21  894  =

1571e700fd610c3 Russell King          2020-07-21  895  	if (ret > 0)
1571e700fd610c3 Russell King          2020-07-21  896  		phylink_mac_pcs_an=
_restart(pl);
1571e700fd610c3 Russell King          2020-07-21  897  =

1571e700fd610c3 Russell King          2020-07-21  898  	return 0;
1571e700fd610c3 Russell King          2020-07-21  899  }
1571e700fd610c3 Russell King          2020-07-21  900  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3083551534925870521==--

