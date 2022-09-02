Content-Type: multipart/mixed; boundary="===============0789854020174330621=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 01/12] cfg80211: regulatory: extend regulatory support for S1G
Date: Fri, 02 Sep 2022 11:16:08 +0800
Message-ID: <202209021125.ayRkIB1e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0789854020174330621==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220830022017.51017-2-kieran.frewen@morsemicro.com>
References: <20220830022017.51017-2-kieran.frewen@morsemicro.com>
TO: Kieran Frewen <kieran.frewen@morsemicro.com>
TO: johannes(a)sipsolutions.net
CC: linux-wireless(a)vger.kernel.org
CC: quic_jjohnson(a)quicinc.com
CC: Kieran Frewen <kieran.frewen@morsemicro.com>

Hi Kieran,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wireless/main]
[also build test WARNING on linus/master v6.0-rc3 next-20220901]
[cannot apply to wireless-next/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kieran-Frewen/Additi=
onal-Support-for-802-11ah-S1G/20220830-102217
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.g=
it main
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: csky-randconfig-m031-20220901 (https://download.01.org/0day-ci/arch=
ive/20220902/202209021125.ayRkIB1e-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/wireless/reg.c:2597 handle_channel_custom() error: uninitialized symbol=
 'center_freq_khz'.

vim +/center_freq_khz +2597 net/wireless/reg.c

d7549cbb9ab067 Sven Neumann      2011-08-30  2577  =

1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2578  static void handle_chann=
el_custom(struct wiphy *wiphy,
fdc9d7b2863ce6 Johannes Berg     2012-12-03  2579  				  struct ieee80211_c=
hannel *chan,
c4b9d655e445a8 Ganapathi Bhat    2019-12-20  2580  				  const struct ieee8=
0211_regdomain *regd,
c4b9d655e445a8 Ganapathi Bhat    2019-12-20  2581  				  u32 min_bw)
1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2582  {
038659e7c6b385 Luis R. Rodriguez 2009-05-02  2583  	u32 bw_flags =3D 0;
1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2584  	const struct ieee80211_=
reg_rule *reg_rule =3D NULL;
1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2585  	const struct ieee80211_=
power_rule *power_rule =3D NULL;
934f4c7dd3a544 Thomas Pedersen   2020-04-01  2586  	u32 bw, center_freq_khz;
7c0e7a45e22911 Kieran Frewen     2022-08-30  2587  	bool is_s1g =3D chan->b=
and =3D=3D NL80211_BAND_S1GHZ;
1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2588  =

7c0e7a45e22911 Kieran Frewen     2022-08-30  2589  	if (is_s1g) {
7c0e7a45e22911 Kieran Frewen     2022-08-30  2590  		bw =3D MHZ_TO_KHZ(16);
7c0e7a45e22911 Kieran Frewen     2022-08-30  2591  		min_bw =3D MHZ_TO_KHZ(=
1);
7c0e7a45e22911 Kieran Frewen     2022-08-30  2592  	} else {
7c0e7a45e22911 Kieran Frewen     2022-08-30  2593  		bw =3D MHZ_TO_KHZ(20);
7c0e7a45e22911 Kieran Frewen     2022-08-30  2594  	}
7c0e7a45e22911 Kieran Frewen     2022-08-30  2595  =

7c0e7a45e22911 Kieran Frewen     2022-08-30  2596  	for (; bw >=3D min_bw; =
bw =3D bw / 2) {
934f4c7dd3a544 Thomas Pedersen   2020-04-01 @2597  		reg_rule =3D freq_reg_=
info_regd(center_freq_khz, regd, bw);
4edd56981c8fbb Matthias May      2015-07-17  2598  		if (!IS_ERR(reg_rule))
4edd56981c8fbb Matthias May      2015-07-17  2599  			break;
4edd56981c8fbb Matthias May      2015-07-17  2600  	}
1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2601  =

a7ee7d44b57c9a Johannes Berg     2020-02-21  2602  	if (IS_ERR_OR_NULL(reg_=
rule)) {
934f4c7dd3a544 Thomas Pedersen   2020-04-01  2603  		pr_debug("Disabling fr=
eq %d.%03d MHz as custom regd has no rule that fits it\n",
934f4c7dd3a544 Thomas Pedersen   2020-04-01  2604  			 chan->center_freq, c=
han->freq_offset);
db8dfee57d37d2 Arik Nemtsov      2014-12-15  2605  		if (wiphy->regulatory_=
flags & REGULATORY_WIPHY_SELF_MANAGED) {
db8dfee57d37d2 Arik Nemtsov      2014-12-15  2606  			chan->flags |=3D IEEE=
80211_CHAN_DISABLED;
db8dfee57d37d2 Arik Nemtsov      2014-12-15  2607  		} else {
cc493e4f5296f4 Luis R. Rodriguez 2013-11-06  2608  			chan->orig_flags |=3D=
 IEEE80211_CHAN_DISABLED;
cc493e4f5296f4 Luis R. Rodriguez 2013-11-06  2609  			chan->flags =3D chan-=
>orig_flags;
db8dfee57d37d2 Arik Nemtsov      2014-12-15  2610  		}
1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2611  		return;
1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2612  	}
1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2613  =

1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2614  	power_rule =3D &reg_rul=
e->power_rule;
1aeb135f84fe40 Michal Sojka      2015-11-23  2615  	bw_flags =3D reg_rule_t=
o_chan_bw_flags(regd, reg_rule, chan);
1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2616  =

2e18b38fc8fb03 Arik Nemtsov      2014-11-16  2617  	chan->dfs_state_entered=
 =3D jiffies;
c7ab508190aee6 Arik Nemtsov      2014-11-16  2618  	chan->dfs_state =3D NL8=
0211_DFS_USABLE;
c7ab508190aee6 Arik Nemtsov      2014-11-16  2619  =

c7ab508190aee6 Arik Nemtsov      2014-11-16  2620  	chan->beacon_found =3D =
false;
db8dfee57d37d2 Arik Nemtsov      2014-12-15  2621  =

db8dfee57d37d2 Arik Nemtsov      2014-12-15  2622  	if (wiphy->regulatory_f=
lags & REGULATORY_WIPHY_SELF_MANAGED)
db8dfee57d37d2 Arik Nemtsov      2014-12-15  2623  		chan->flags =3D chan->=
orig_flags | bw_flags |
db8dfee57d37d2 Arik Nemtsov      2014-12-15  2624  			      map_regdom_flag=
s(reg_rule->flags);
db8dfee57d37d2 Arik Nemtsov      2014-12-15  2625  	else
038659e7c6b385 Luis R. Rodriguez 2009-05-02  2626  		chan->flags |=3D map_r=
egdom_flags(reg_rule->flags) | bw_flags;
db8dfee57d37d2 Arik Nemtsov      2014-12-15  2627  =

1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2628  	chan->max_antenna_gain =
=3D (int) MBI_TO_DBI(power_rule->max_antenna_gain);
279f0f55249820 Felix Fietkau     2012-10-17  2629  	chan->max_reg_power =3D=
 chan->max_power =3D
279f0f55249820 Felix Fietkau     2012-10-17  2630  		(int) MBM_TO_DBM(power=
_rule->max_eirp);
2e18b38fc8fb03 Arik Nemtsov      2014-11-16  2631  =

2e18b38fc8fb03 Arik Nemtsov      2014-11-16  2632  	if (chan->flags & IEEE8=
0211_CHAN_RADAR) {
2e18b38fc8fb03 Arik Nemtsov      2014-11-16  2633  		if (reg_rule->dfs_cac_=
ms)
2e18b38fc8fb03 Arik Nemtsov      2014-11-16  2634  			chan->dfs_cac_ms =3D =
reg_rule->dfs_cac_ms;
2e18b38fc8fb03 Arik Nemtsov      2014-11-16  2635  		else
2e18b38fc8fb03 Arik Nemtsov      2014-11-16  2636  			chan->dfs_cac_ms =3D =
IEEE80211_DFS_MIN_CAC_TIME_MS;
2e18b38fc8fb03 Arik Nemtsov      2014-11-16  2637  	}
2e18b38fc8fb03 Arik Nemtsov      2014-11-16  2638  =

2e18b38fc8fb03 Arik Nemtsov      2014-11-16  2639  	chan->max_power =3D cha=
n->max_reg_power;
1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2640  }
1fa25e413659f9 Luis R. Rodriguez 2009-01-22  2641  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0789854020174330621==--

