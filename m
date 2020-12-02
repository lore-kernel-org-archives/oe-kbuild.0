Content-Type: multipart/mixed; boundary="===============1166298743613151334=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/phy/cadence/phy-cadence-torrent.c:595:9: warning: Identical condition 'ret', second condition is always false
Date: Thu, 03 Dec 2020 01:30:59 +0800
Message-ID: <202012030154.lqmONVXT-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1166298743613151334==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Swapnil Jakhade <sjakhade@cadence.com>
CC: Kishon Vijay Abraham I <kishon@ti.com>
CC: Yuti Amonkar <yamonkar@cadence.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   509a15421674b9e1a3e1916939d0d0efd3e578da
commit: 572d659256eb44ddd153e77f904cb3e5bc995f40 phy: cadence-torrent: Impl=
ement PHY configure APIs
date:   9 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 9 months ago
compiler: sh4-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/phy/cadence/phy-cadence-torrent.c:595:9: warning: Identical cond=
ition 'ret', second condition is always false [identicalConditionAfterEarly=
Exit]
    return ret;
           ^
   drivers/phy/cadence/phy-cadence-torrent.c:591:6: note: first condition
    if (ret)
        ^
   drivers/phy/cadence/phy-cadence-torrent.c:595:9: note: second condition
    return ret;
           ^

vim +/ret +595 drivers/phy/cadence/phy-cadence-torrent.c

572d659256eb44d Swapnil Jakhade 2020-02-06  561  =

572d659256eb44d Swapnil Jakhade 2020-02-06  562  /* Configure link rate as =
required. */
572d659256eb44d Swapnil Jakhade 2020-02-06  563  static int cdns_torrent_dp=
_set_rate(struct cdns_torrent_phy *cdns_phy,
572d659256eb44d Swapnil Jakhade 2020-02-06  564  				    struct phy_configu=
re_opts_dp *dp)
572d659256eb44d Swapnil Jakhade 2020-02-06  565  {
572d659256eb44d Swapnil Jakhade 2020-02-06  566  	u32 ret;
572d659256eb44d Swapnil Jakhade 2020-02-06  567  =

572d659256eb44d Swapnil Jakhade 2020-02-06  568  	ret =3D cdns_torrent_dp_s=
et_power_state(cdns_phy, dp->lanes,
572d659256eb44d Swapnil Jakhade 2020-02-06  569  					      POWERSTATE_A3);
572d659256eb44d Swapnil Jakhade 2020-02-06  570  	if (ret)
572d659256eb44d Swapnil Jakhade 2020-02-06  571  		return ret;
572d659256eb44d Swapnil Jakhade 2020-02-06  572  	ret =3D cdns_torrent_dp_s=
et_pll_en(cdns_phy, dp, false);
572d659256eb44d Swapnil Jakhade 2020-02-06  573  	if (ret)
572d659256eb44d Swapnil Jakhade 2020-02-06  574  		return ret;
572d659256eb44d Swapnil Jakhade 2020-02-06  575  	ndelay(200);
572d659256eb44d Swapnil Jakhade 2020-02-06  576  =

572d659256eb44d Swapnil Jakhade 2020-02-06  577  	ret =3D cdns_torrent_dp_c=
onfigure_rate(cdns_phy, dp);
572d659256eb44d Swapnil Jakhade 2020-02-06  578  	if (ret)
572d659256eb44d Swapnil Jakhade 2020-02-06  579  		return ret;
572d659256eb44d Swapnil Jakhade 2020-02-06  580  	ndelay(200);
572d659256eb44d Swapnil Jakhade 2020-02-06  581  =

572d659256eb44d Swapnil Jakhade 2020-02-06  582  	ret =3D cdns_torrent_dp_s=
et_pll_en(cdns_phy, dp, true);
572d659256eb44d Swapnil Jakhade 2020-02-06  583  	if (ret)
572d659256eb44d Swapnil Jakhade 2020-02-06  584  		return ret;
572d659256eb44d Swapnil Jakhade 2020-02-06  585  	ret =3D cdns_torrent_dp_s=
et_power_state(cdns_phy, dp->lanes,
572d659256eb44d Swapnil Jakhade 2020-02-06  586  					      POWERSTATE_A2);
572d659256eb44d Swapnil Jakhade 2020-02-06  587  	if (ret)
572d659256eb44d Swapnil Jakhade 2020-02-06  588  		return ret;
572d659256eb44d Swapnil Jakhade 2020-02-06  589  	ret =3D cdns_torrent_dp_s=
et_power_state(cdns_phy, dp->lanes,
572d659256eb44d Swapnil Jakhade 2020-02-06  590  					      POWERSTATE_A0);
572d659256eb44d Swapnil Jakhade 2020-02-06  591  	if (ret)
572d659256eb44d Swapnil Jakhade 2020-02-06  592  		return ret;
572d659256eb44d Swapnil Jakhade 2020-02-06  593  	ndelay(900);
572d659256eb44d Swapnil Jakhade 2020-02-06  594  =

572d659256eb44d Swapnil Jakhade 2020-02-06 @595  	return ret;
572d659256eb44d Swapnil Jakhade 2020-02-06  596  }
572d659256eb44d Swapnil Jakhade 2020-02-06  597  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1166298743613151334==--

