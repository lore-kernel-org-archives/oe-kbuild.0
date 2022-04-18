Content-Type: multipart/mixed; boundary="===============8410351510182845424=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/wireless/mediatek/mt76/eeprom.c:315 mt76_get_rate_power_limits() error: uninitialized symbol 'len'.
Date: Mon, 18 Apr 2022 10:49:41 +0800
Message-ID: <202204181030.hGmAyk2e-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8410351510182845424==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Shayne Chen <shayne.chen@mediatek.com>
CC: Felix Fietkau <nbd@nbd.name>
CC: Lorenzo Bianconi <lorenzo@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   b2d229d4ddb17db541098b83524d901257e93845
commit: a9627d992b5e3aa18315094b501eba0f4d883419 mt76: extend DT rate power=
 limits to support 11ax devices
date:   12 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 12 months ago
config: x86_64-randconfig-m001-20220418 (https://download.01.org/0day-ci/ar=
chive/20220418/202204181030.hGmAyk2e-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/net/wireless/mediatek/mt76/eeprom.c:315 mt76_get_rate_power_limits(=
) error: uninitialized symbol 'len'.

vim +/len +315 drivers/net/wireless/mediatek/mt76/eeprom.c

a9627d992b5e3a Shayne Chen   2021-04-13  253  =

22b980badc0fc7 Felix Fietkau 2021-04-13  254  s8 mt76_get_rate_power_limits=
(struct mt76_phy *phy,
22b980badc0fc7 Felix Fietkau 2021-04-13  255  			      struct ieee80211_cha=
nnel *chan,
22b980badc0fc7 Felix Fietkau 2021-04-13  256  			      struct mt76_power_li=
mits *dest,
22b980badc0fc7 Felix Fietkau 2021-04-13  257  			      s8 target_power)
22b980badc0fc7 Felix Fietkau 2021-04-13  258  {
22b980badc0fc7 Felix Fietkau 2021-04-13  259  	struct mt76_dev *dev =3D phy=
->dev;
22b980badc0fc7 Felix Fietkau 2021-04-13  260  	struct device_node *np;
22b980badc0fc7 Felix Fietkau 2021-04-13  261  	const __be32 *val;
22b980badc0fc7 Felix Fietkau 2021-04-13  262  	char name[16];
22b980badc0fc7 Felix Fietkau 2021-04-13  263  	u32 mcs_rates =3D dev->drv->=
mcs_rates;
a9627d992b5e3a Shayne Chen   2021-04-13  264  	u32 ru_rates =3D ARRAY_SIZE(=
dest->ru[0]);
22b980badc0fc7 Felix Fietkau 2021-04-13  265  	char band;
22b980badc0fc7 Felix Fietkau 2021-04-13  266  	size_t len;
22b980badc0fc7 Felix Fietkau 2021-04-13  267  	s8 max_power =3D 0;
22b980badc0fc7 Felix Fietkau 2021-04-13  268  	s8 txs_delta;
22b980badc0fc7 Felix Fietkau 2021-04-13  269  =

22b980badc0fc7 Felix Fietkau 2021-04-13  270  	if (!mcs_rates)
22b980badc0fc7 Felix Fietkau 2021-04-13  271  		mcs_rates =3D 10;
22b980badc0fc7 Felix Fietkau 2021-04-13  272  =

22b980badc0fc7 Felix Fietkau 2021-04-13  273  	memset(dest, target_power, s=
izeof(*dest));
22b980badc0fc7 Felix Fietkau 2021-04-13  274  =

22b980badc0fc7 Felix Fietkau 2021-04-13  275  	if (!IS_ENABLED(CONFIG_OF))
22b980badc0fc7 Felix Fietkau 2021-04-13  276  		return target_power;
22b980badc0fc7 Felix Fietkau 2021-04-13  277  =

22b980badc0fc7 Felix Fietkau 2021-04-13  278  	np =3D mt76_find_power_limit=
s_node(dev);
22b980badc0fc7 Felix Fietkau 2021-04-13  279  	if (!np)
22b980badc0fc7 Felix Fietkau 2021-04-13  280  		return target_power;
22b980badc0fc7 Felix Fietkau 2021-04-13  281  =

22b980badc0fc7 Felix Fietkau 2021-04-13  282  	switch (chan->band) {
22b980badc0fc7 Felix Fietkau 2021-04-13  283  	case NL80211_BAND_2GHZ:
22b980badc0fc7 Felix Fietkau 2021-04-13  284  		band =3D '2';
22b980badc0fc7 Felix Fietkau 2021-04-13  285  		break;
22b980badc0fc7 Felix Fietkau 2021-04-13  286  	case NL80211_BAND_5GHZ:
22b980badc0fc7 Felix Fietkau 2021-04-13  287  		band =3D '5';
22b980badc0fc7 Felix Fietkau 2021-04-13  288  		break;
22b980badc0fc7 Felix Fietkau 2021-04-13  289  	default:
22b980badc0fc7 Felix Fietkau 2021-04-13  290  		return target_power;
22b980badc0fc7 Felix Fietkau 2021-04-13  291  	}
22b980badc0fc7 Felix Fietkau 2021-04-13  292  =

22b980badc0fc7 Felix Fietkau 2021-04-13  293  	snprintf(name, sizeof(name),=
 "txpower-%cg", band);
22b980badc0fc7 Felix Fietkau 2021-04-13  294  	np =3D of_get_child_by_name(=
np, name);
22b980badc0fc7 Felix Fietkau 2021-04-13  295  	if (!np)
22b980badc0fc7 Felix Fietkau 2021-04-13  296  		return target_power;
22b980badc0fc7 Felix Fietkau 2021-04-13  297  =

22b980badc0fc7 Felix Fietkau 2021-04-13  298  	np =3D mt76_find_channel_nod=
e(np, chan);
22b980badc0fc7 Felix Fietkau 2021-04-13  299  	if (!np)
22b980badc0fc7 Felix Fietkau 2021-04-13  300  		return target_power;
22b980badc0fc7 Felix Fietkau 2021-04-13  301  =

22b980badc0fc7 Felix Fietkau 2021-04-13  302  	txs_delta =3D mt76_get_txs_d=
elta(np, hweight8(phy->antenna_mask));
22b980badc0fc7 Felix Fietkau 2021-04-13  303  =

22b980badc0fc7 Felix Fietkau 2021-04-13  304  	val =3D mt76_get_of_array(np=
, "rates-cck", &len, ARRAY_SIZE(dest->cck));
22b980badc0fc7 Felix Fietkau 2021-04-13  305  	mt76_apply_array_limit(dest-=
>cck, ARRAY_SIZE(dest->cck), val,
22b980badc0fc7 Felix Fietkau 2021-04-13  306  			       target_power, txs_d=
elta, &max_power);
22b980badc0fc7 Felix Fietkau 2021-04-13  307  =

22b980badc0fc7 Felix Fietkau 2021-04-13  308  	val =3D mt76_get_of_array(np=
, "rates-ofdm",
22b980badc0fc7 Felix Fietkau 2021-04-13  309  				&len, ARRAY_SIZE(dest->of=
dm));
22b980badc0fc7 Felix Fietkau 2021-04-13  310  	mt76_apply_array_limit(dest-=
>ofdm, ARRAY_SIZE(dest->ofdm), val,
22b980badc0fc7 Felix Fietkau 2021-04-13  311  			       target_power, txs_d=
elta, &max_power);
22b980badc0fc7 Felix Fietkau 2021-04-13  312  =

22b980badc0fc7 Felix Fietkau 2021-04-13  313  	val =3D mt76_get_of_array(np=
, "rates-mcs", &len, mcs_rates + 1);
a9627d992b5e3a Shayne Chen   2021-04-13  314  	mt76_apply_multi_array_limit=
(dest->mcs[0], ARRAY_SIZE(dest->mcs[0]),
a9627d992b5e3a Shayne Chen   2021-04-13 @315  				     ARRAY_SIZE(dest->mcs=
), val, len,
a9627d992b5e3a Shayne Chen   2021-04-13  316  				     target_power, txs_de=
lta, &max_power);
22b980badc0fc7 Felix Fietkau 2021-04-13  317  =

a9627d992b5e3a Shayne Chen   2021-04-13  318  	val =3D mt76_get_of_array(np=
, "rates-ru", &len, ru_rates + 1);
a9627d992b5e3a Shayne Chen   2021-04-13  319  	mt76_apply_multi_array_limit=
(dest->ru[0], ARRAY_SIZE(dest->ru[0]),
a9627d992b5e3a Shayne Chen   2021-04-13  320  				     ARRAY_SIZE(dest->ru)=
, val, len,
a9627d992b5e3a Shayne Chen   2021-04-13  321  				     target_power, txs_de=
lta, &max_power);
22b980badc0fc7 Felix Fietkau 2021-04-13  322  =

22b980badc0fc7 Felix Fietkau 2021-04-13  323  	return max_power;
22b980badc0fc7 Felix Fietkau 2021-04-13  324  }
22b980badc0fc7 Felix Fietkau 2021-04-13  325  EXPORT_SYMBOL_GPL(mt76_get_ra=
te_power_limits);
22b980badc0fc7 Felix Fietkau 2021-04-13  326  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8410351510182845424==--

