Content-Type: multipart/mixed; boundary="===============8671496151145692267=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [mac80211-next:rtnl 1/4] net/wireless/nl80211.c:3506:1-7: preceding lock on line 3223
Date: Sat, 16 Jan 2021 10:15:37 +0800
Message-ID: <202101161023.qVZ692CF-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8671496151145692267==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-wireless(a)vger.kernel.org
TO: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jberg/mac80211-next=
.git rtnl
head:   24431371abdbc37e228fb7041e3b6e0d7e9be359
commit: 604bd54a533e198245ee5a2dadc93787f2468b26 [1/4] cfg80211: avoid hold=
ing the RTNL when calling the driver
:::::: branch date: 4 hours ago
:::::: commit date: 27 hours ago
config: x86_64-randconfig-c002-20210115 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


"coccinelle warnings: (new ones prefixed by >>)"
>> net/wireless/nl80211.c:3506:1-7: preceding lock on line 3223

vim +3506 net/wireless/nl80211.c

f444de05d20e27cd Johannes Berg          2010-05-05  3174  =

556829657397b9b0 Johannes Berg          2007-09-20  3175  static int nl8021=
1_set_wiphy(struct sk_buff *skb, struct genl_info *info)
556829657397b9b0 Johannes Berg          2007-09-20  3176  {
604bd54a533e1982 Johannes Berg          2019-08-01  3177  	struct cfg80211_=
registered_device *rdev =3D NULL;
f444de05d20e27cd Johannes Berg          2010-05-05  3178  	struct net_devic=
e *netdev =3D NULL;
f444de05d20e27cd Johannes Berg          2010-05-05  3179  	struct wireless_=
dev *wdev;
a1e567c83f541432 Bill Jordan            2010-09-10  3180  	int result =3D 0=
, rem_txq_params =3D 0;
318884875bdddca6 Jouni Malinen          2008-10-30  3181  	struct nlattr *n=
l_txq_params;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3182  	u32 changed;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3183  	u8 retry_short =
=3D 0, retry_long =3D 0;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3184  	u32 frag_thresho=
ld =3D 0, rts_threshold =3D 0;
81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3185  	u8 cov=
erage_class =3D 0;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3186  	u32 tx=
q_limit =3D 0, txq_memory_limit =3D 0, txq_quantum =3D 0;
556829657397b9b0 Johannes Berg          2007-09-20  3187  =

604bd54a533e1982 Johannes Berg          2019-08-01  3188  	rtnl_lock();
f444de05d20e27cd Johannes Berg          2010-05-05  3189  	/*
f444de05d20e27cd Johannes Berg          2010-05-05  3190  	 * Try to find t=
he wiphy and netdev. Normally this
f444de05d20e27cd Johannes Berg          2010-05-05  3191  	 * function shou=
ldn't need the netdev, but this is
f444de05d20e27cd Johannes Berg          2010-05-05  3192  	 * done for back=
ward compatibility -- previously
f444de05d20e27cd Johannes Berg          2010-05-05  3193  	 * setting the c=
hannel was done per wiphy, but now
f444de05d20e27cd Johannes Berg          2010-05-05  3194  	 * it is per net=
dev. Previous userland like hostapd
f444de05d20e27cd Johannes Berg          2010-05-05  3195  	 * also passed a=
 netdev to set_wiphy, so that it is
f444de05d20e27cd Johannes Berg          2010-05-05  3196  	 * possible to l=
et that go to the right netdev!
f444de05d20e27cd Johannes Berg          2010-05-05  3197  	 */
4bbf4d56583dd52c Johannes Berg          2009-03-24  3198  =

f444de05d20e27cd Johannes Berg          2010-05-05  3199  	if (info->attrs[=
NL80211_ATTR_IFINDEX]) {
f444de05d20e27cd Johannes Berg          2010-05-05  3200  		int ifindex =3D=
 nla_get_u32(info->attrs[NL80211_ATTR_IFINDEX]);
f444de05d20e27cd Johannes Berg          2010-05-05  3201  =

7f2b8562c2ee6e2a Ying Xue               2014-01-15  3202  		netdev =3D __de=
v_get_by_index(genl_info_net(info), ifindex);
5fe231e873729fa2 Johannes Berg          2013-05-08  3203  		if (netdev && n=
etdev->ieee80211_ptr)
f26cbf401be935ee Zhao, Gang             2014-04-21  3204  			rdev =3D wiphy=
_to_rdev(netdev->ieee80211_ptr->wiphy);
5fe231e873729fa2 Johannes Berg          2013-05-08  3205  		else
f444de05d20e27cd Johannes Berg          2010-05-05  3206  			netdev =3D NUL=
L;
f444de05d20e27cd Johannes Berg          2010-05-05  3207  	}
f444de05d20e27cd Johannes Berg          2010-05-05  3208  =

f444de05d20e27cd Johannes Berg          2010-05-05  3209  	if (!netdev) {
878d9ec7367816dc Johannes Berg          2012-06-15  3210  		rdev =3D __cfg8=
0211_rdev_from_attrs(genl_info_net(info),
878d9ec7367816dc Johannes Berg          2012-06-15  3211  						  info->att=
rs);
604bd54a533e1982 Johannes Berg          2019-08-01  3212  		if (IS_ERR(rdev=
)) {
604bd54a533e1982 Johannes Berg          2019-08-01  3213  			rtnl_unlock();
4c476991062a0a59 Johannes Berg          2010-10-04  3214  			return PTR_ERR=
(rdev);
604bd54a533e1982 Johannes Berg          2019-08-01  3215  		}
f444de05d20e27cd Johannes Berg          2010-05-05  3216  		wdev =3D NULL;
f444de05d20e27cd Johannes Berg          2010-05-05  3217  		netdev =3D NULL;
f444de05d20e27cd Johannes Berg          2010-05-05  3218  		result =3D 0;
71fe96bf9db8b117 Johannes Berg          2012-10-24  3219  	} else
f444de05d20e27cd Johannes Berg          2010-05-05  3220  		wdev =3D netdev=
->ieee80211_ptr;
f444de05d20e27cd Johannes Berg          2010-05-05  3221  =

604bd54a533e1982 Johannes Berg          2019-08-01  3222  	if (rdev)
604bd54a533e1982 Johannes Berg          2019-08-01  3223  		mutex_lock(&rde=
v->wiphy.mtx);
604bd54a533e1982 Johannes Berg          2019-08-01  3224  	rtnl_unlock();
604bd54a533e1982 Johannes Berg          2019-08-01  3225  =

f444de05d20e27cd Johannes Berg          2010-05-05  3226  	/*
f444de05d20e27cd Johannes Berg          2010-05-05  3227  	 * end workaroun=
d code, by now the rdev is available
f444de05d20e27cd Johannes Berg          2010-05-05  3228  	 * and locked, a=
nd wdev may or may not be NULL.
f444de05d20e27cd Johannes Berg          2010-05-05  3229  	 */
4bbf4d56583dd52c Johannes Berg          2009-03-24  3230  =

4bbf4d56583dd52c Johannes Berg          2009-03-24  3231  	if (info->attrs[=
NL80211_ATTR_WIPHY_NAME])
318884875bdddca6 Jouni Malinen          2008-10-30  3232  		result =3D cfg8=
0211_dev_rename(
318884875bdddca6 Jouni Malinen          2008-10-30  3233  			rdev, nla_data=
(info->attrs[NL80211_ATTR_WIPHY_NAME]));
4bbf4d56583dd52c Johannes Berg          2009-03-24  3234  =

318884875bdddca6 Jouni Malinen          2008-10-30  3235  	if (result)
604bd54a533e1982 Johannes Berg          2019-08-01  3236  		goto out;
318884875bdddca6 Jouni Malinen          2008-10-30  3237  =

318884875bdddca6 Jouni Malinen          2008-10-30  3238  	if (info->attrs[=
NL80211_ATTR_WIPHY_TXQ_PARAMS]) {
318884875bdddca6 Jouni Malinen          2008-10-30  3239  		struct ieee8021=
1_txq_params txq_params;
318884875bdddca6 Jouni Malinen          2008-10-30  3240  		struct nlattr *=
tb[NL80211_TXQ_ATTR_MAX + 1];
318884875bdddca6 Jouni Malinen          2008-10-30  3241  =

604bd54a533e1982 Johannes Berg          2019-08-01  3242  		if (!rdev->ops-=
>set_txq_params) {
604bd54a533e1982 Johannes Berg          2019-08-01  3243  			result =3D -EO=
PNOTSUPP;
604bd54a533e1982 Johannes Berg          2019-08-01  3244  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3245  		}
318884875bdddca6 Jouni Malinen          2008-10-30  3246  =

604bd54a533e1982 Johannes Berg          2019-08-01  3247  		if (!netdev) {
604bd54a533e1982 Johannes Berg          2019-08-01  3248  			result =3D -EI=
NVAL;
604bd54a533e1982 Johannes Berg          2019-08-01  3249  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3250  		}
f70f01c2ebbe31fb Eliad Peller           2011-09-25  3251  =

133a3ff2c934223a Johannes Berg          2011-11-03  3252  		if (netdev->iee=
e80211_ptr->iftype !=3D NL80211_IFTYPE_AP &&
604bd54a533e1982 Johannes Berg          2019-08-01  3253  		    netdev->iee=
e80211_ptr->iftype !=3D NL80211_IFTYPE_P2P_GO) {
604bd54a533e1982 Johannes Berg          2019-08-01  3254  			result =3D -EI=
NVAL;
604bd54a533e1982 Johannes Berg          2019-08-01  3255  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3256  		}
133a3ff2c934223a Johannes Berg          2011-11-03  3257  =

604bd54a533e1982 Johannes Berg          2019-08-01  3258  		if (!netif_runn=
ing(netdev)) {
604bd54a533e1982 Johannes Berg          2019-08-01  3259  			result =3D -EN=
ETDOWN;
604bd54a533e1982 Johannes Berg          2019-08-01  3260  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3261  		}
2b5f8b0b44e17e62 Johannes Berg          2012-04-02  3262  =

318884875bdddca6 Jouni Malinen          2008-10-30  3263  		nla_for_each_ne=
sted(nl_txq_params,
318884875bdddca6 Jouni Malinen          2008-10-30  3264  				    info->att=
rs[NL80211_ATTR_WIPHY_TXQ_PARAMS],
318884875bdddca6 Jouni Malinen          2008-10-30  3265  				    rem_txq_p=
arams) {
8cb081746c031fb1 Johannes Berg          2019-04-26  3266  			result =3D nla=
_parse_nested_deprecated(tb,
8cb081746c031fb1 Johannes Berg          2019-04-26  3267  							     NL802=
11_TXQ_ATTR_MAX,
bfe2c7b1cce4a1e1 Johannes Berg          2016-10-26  3268  							     nl_tx=
q_params,
fe52145f91fe81b9 Johannes Berg          2017-04-12  3269  							     txq_p=
arams_policy,
fe52145f91fe81b9 Johannes Berg          2017-04-12  3270  							     info-=
>extack);
ae811e21df28deb4 Johannes Berg          2014-01-24  3271  			if (result)
604bd54a533e1982 Johannes Berg          2019-08-01  3272  				goto out;
318884875bdddca6 Jouni Malinen          2008-10-30  3273  			result =3D par=
se_txq_params(tb, &txq_params);
318884875bdddca6 Jouni Malinen          2008-10-30  3274  			if (result)
604bd54a533e1982 Johannes Berg          2019-08-01  3275  				goto out;
318884875bdddca6 Jouni Malinen          2008-10-30  3276  =

e35e4d28b687d4e8 Hila Gonen             2012-06-27  3277  			result =3D rde=
v_set_txq_params(rdev, netdev,
318884875bdddca6 Jouni Malinen          2008-10-30  3278  						     &txq_p=
arams);
318884875bdddca6 Jouni Malinen          2008-10-30  3279  			if (result)
604bd54a533e1982 Johannes Berg          2019-08-01  3280  				goto out;
318884875bdddca6 Jouni Malinen          2008-10-30  3281  		}
318884875bdddca6 Jouni Malinen          2008-10-30  3282  	}
556829657397b9b0 Johannes Berg          2007-09-20  3283  =

72bdcf3438091726 Jouni Malinen          2008-11-26  3284  	if (info->attrs[=
NL80211_ATTR_WIPHY_FREQ]) {
e16821bcfb364b0c Jouni Malinen          2014-04-28  3285  		result =3D __nl=
80211_set_channel(
e16821bcfb364b0c Jouni Malinen          2014-04-28  3286  			rdev,
e16821bcfb364b0c Jouni Malinen          2014-04-28  3287  			nl80211_can_se=
t_dev_channel(wdev) ? netdev : NULL,
71fe96bf9db8b117 Johannes Berg          2012-10-24  3288  			info);
72bdcf3438091726 Jouni Malinen          2008-11-26  3289  		if (result)
604bd54a533e1982 Johannes Berg          2019-08-01  3290  			goto out;
72bdcf3438091726 Jouni Malinen          2008-11-26  3291  	}
72bdcf3438091726 Jouni Malinen          2008-11-26  3292  =

98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3293  	if (info->attrs[=
NL80211_ATTR_WIPHY_TX_POWER_SETTING]) {
c8442118ad9cd05c Johannes Berg          2012-10-24  3294  		struct wireless=
_dev *txp_wdev =3D wdev;
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3295  		enum nl80211_tx=
_power_setting type;
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3296  		int idx, mbm =
=3D 0;
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3297  =

c8442118ad9cd05c Johannes Berg          2012-10-24  3298  		if (!(rdev->wip=
hy.features & NL80211_FEATURE_VIF_TXPOWER))
c8442118ad9cd05c Johannes Berg          2012-10-24  3299  			txp_wdev =3D N=
ULL;
c8442118ad9cd05c Johannes Berg          2012-10-24  3300  =

604bd54a533e1982 Johannes Berg          2019-08-01  3301  		if (!rdev->ops-=
>set_tx_power) {
604bd54a533e1982 Johannes Berg          2019-08-01  3302  			result =3D -EO=
PNOTSUPP;
604bd54a533e1982 Johannes Berg          2019-08-01  3303  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3304  		}
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3305  =

98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3306  		idx =3D NL80211=
_ATTR_WIPHY_TX_POWER_SETTING;
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3307  		type =3D nla_ge=
t_u32(info->attrs[idx]);
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3308  =

98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3309  		if (!info->attr=
s[NL80211_ATTR_WIPHY_TX_POWER_LEVEL] &&
604bd54a533e1982 Johannes Berg          2019-08-01  3310  		    (type !=3D =
NL80211_TX_POWER_AUTOMATIC)) {
604bd54a533e1982 Johannes Berg          2019-08-01  3311  			result =3D -EI=
NVAL;
604bd54a533e1982 Johannes Berg          2019-08-01  3312  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3313  		}
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3314  =

98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3315  		if (type !=3D N=
L80211_TX_POWER_AUTOMATIC) {
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3316  			idx =3D NL8021=
1_ATTR_WIPHY_TX_POWER_LEVEL;
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3317  			mbm =3D nla_ge=
t_u32(info->attrs[idx]);
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3318  		}
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3319  =

c8442118ad9cd05c Johannes Berg          2012-10-24  3320  		result =3D rdev=
_set_tx_power(rdev, txp_wdev, type, mbm);
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3321  		if (result)
604bd54a533e1982 Johannes Berg          2019-08-01  3322  			goto out;
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3323  	}
98d2ff8bec82fc35 Juuso Oikarinen        2010-06-23  3324  =

afe0cbf87500f058 Bruno Randolf          2010-11-10  3325  	if (info->attrs[=
NL80211_ATTR_WIPHY_ANTENNA_TX] &&
afe0cbf87500f058 Bruno Randolf          2010-11-10  3326  	    info->attrs[=
NL80211_ATTR_WIPHY_ANTENNA_RX]) {
afe0cbf87500f058 Bruno Randolf          2010-11-10  3327  		u32 tx_ant, rx_=
ant;
7a087e7484c9e402 Kirtika Ruchandani     2016-05-29  3328  =

7f531e03abf0162d Bruno Randolf          2010-12-16  3329  		if ((!rdev->wip=
hy.available_antennas_tx &&
7f531e03abf0162d Bruno Randolf          2010-12-16  3330  		     !rdev->wip=
hy.available_antennas_rx) ||
604bd54a533e1982 Johannes Berg          2019-08-01  3331  		    !rdev->ops-=
>set_antenna) {
604bd54a533e1982 Johannes Berg          2019-08-01  3332  			result =3D -EO=
PNOTSUPP;
604bd54a533e1982 Johannes Berg          2019-08-01  3333  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3334  		}
afe0cbf87500f058 Bruno Randolf          2010-11-10  3335  =

afe0cbf87500f058 Bruno Randolf          2010-11-10  3336  		tx_ant =3D nla_=
get_u32(info->attrs[NL80211_ATTR_WIPHY_ANTENNA_TX]);
afe0cbf87500f058 Bruno Randolf          2010-11-10  3337  		rx_ant =3D nla_=
get_u32(info->attrs[NL80211_ATTR_WIPHY_ANTENNA_RX]);
afe0cbf87500f058 Bruno Randolf          2010-11-10  3338  =

a7ffac9591a2a0ee Bruno Randolf          2010-12-08  3339  		/* reject anten=
na configurations which don't match the
7f531e03abf0162d Bruno Randolf          2010-12-16  3340  		 * available an=
tenna masks, except for the "all" mask */
7f531e03abf0162d Bruno Randolf          2010-12-16  3341  		if ((~tx_ant &&=
 (tx_ant & ~rdev->wiphy.available_antennas_tx)) ||
604bd54a533e1982 Johannes Berg          2019-08-01  3342  		    (~rx_ant &&=
 (rx_ant & ~rdev->wiphy.available_antennas_rx))) {
604bd54a533e1982 Johannes Berg          2019-08-01  3343  			result =3D -EI=
NVAL;
604bd54a533e1982 Johannes Berg          2019-08-01  3344  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3345  		}
a7ffac9591a2a0ee Bruno Randolf          2010-12-08  3346  =

7f531e03abf0162d Bruno Randolf          2010-12-16  3347  		tx_ant =3D tx_a=
nt & rdev->wiphy.available_antennas_tx;
7f531e03abf0162d Bruno Randolf          2010-12-16  3348  		rx_ant =3D rx_a=
nt & rdev->wiphy.available_antennas_rx;
a7ffac9591a2a0ee Bruno Randolf          2010-12-08  3349  =

e35e4d28b687d4e8 Hila Gonen             2012-06-27  3350  		result =3D rdev=
_set_antenna(rdev, tx_ant, rx_ant);
afe0cbf87500f058 Bruno Randolf          2010-11-10  3351  		if (result)
604bd54a533e1982 Johannes Berg          2019-08-01  3352  			goto out;
afe0cbf87500f058 Bruno Randolf          2010-11-10  3353  	}
afe0cbf87500f058 Bruno Randolf          2010-11-10  3354  =

b9a5f8cab751d362 Jouni Malinen          2009-04-20  3355  	changed =3D 0;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3356  =

b9a5f8cab751d362 Jouni Malinen          2009-04-20  3357  	if (info->attrs[=
NL80211_ATTR_WIPHY_RETRY_SHORT]) {
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3358  		retry_short =3D=
 nla_get_u8(
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3359  			info->attrs[NL=
80211_ATTR_WIPHY_RETRY_SHORT]);
7f2b8562c2ee6e2a Ying Xue               2014-01-15  3360  =

b9a5f8cab751d362 Jouni Malinen          2009-04-20  3361  		changed |=3D WI=
PHY_PARAM_RETRY_SHORT;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3362  	}
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3363  =

b9a5f8cab751d362 Jouni Malinen          2009-04-20  3364  	if (info->attrs[=
NL80211_ATTR_WIPHY_RETRY_LONG]) {
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3365  		retry_long =3D =
nla_get_u8(
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3366  			info->attrs[NL=
80211_ATTR_WIPHY_RETRY_LONG]);
7f2b8562c2ee6e2a Ying Xue               2014-01-15  3367  =

b9a5f8cab751d362 Jouni Malinen          2009-04-20  3368  		changed |=3D WI=
PHY_PARAM_RETRY_LONG;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3369  	}
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3370  =

b9a5f8cab751d362 Jouni Malinen          2009-04-20  3371  	if (info->attrs[=
NL80211_ATTR_WIPHY_FRAG_THRESHOLD]) {
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3372  		frag_threshold =
=3D nla_get_u32(
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3373  			info->attrs[NL=
80211_ATTR_WIPHY_FRAG_THRESHOLD]);
604bd54a533e1982 Johannes Berg          2019-08-01  3374  		if (frag_thresh=
old < 256) {
604bd54a533e1982 Johannes Berg          2019-08-01  3375  			result =3D -EI=
NVAL;
604bd54a533e1982 Johannes Berg          2019-08-01  3376  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3377  		}
7f2b8562c2ee6e2a Ying Xue               2014-01-15  3378  =

b9a5f8cab751d362 Jouni Malinen          2009-04-20  3379  		if (frag_thresh=
old !=3D (u32) -1) {
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3380  			/*
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3381  			 * Fragments (=
apart from the last one) are required to
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3382  			 * have even l=
ength. Make the fragmentation code
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3383  			 * simpler by =
stripping LSB should someone try to use
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3384  			 * odd thresho=
ld value.
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3385  			 */
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3386  			frag_threshold=
 &=3D ~0x1;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3387  		}
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3388  		changed |=3D WI=
PHY_PARAM_FRAG_THRESHOLD;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3389  	}
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3390  =

b9a5f8cab751d362 Jouni Malinen          2009-04-20  3391  	if (info->attrs[=
NL80211_ATTR_WIPHY_RTS_THRESHOLD]) {
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3392  		rts_threshold =
=3D nla_get_u32(
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3393  			info->attrs[NL=
80211_ATTR_WIPHY_RTS_THRESHOLD]);
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3394  		changed |=3D WI=
PHY_PARAM_RTS_THRESHOLD;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3395  	}
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3396  =

81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3397  	if (in=
fo->attrs[NL80211_ATTR_WIPHY_COVERAGE_CLASS]) {
604bd54a533e1982 Johannes Berg          2019-08-01  3398  		if (info->attrs=
[NL80211_ATTR_WIPHY_DYN_ACK]) {
604bd54a533e1982 Johannes Berg          2019-08-01  3399  			result =3D -EI=
NVAL;
604bd54a533e1982 Johannes Berg          2019-08-01  3400  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3401  		}
3057dbfdab1b86a7 Lorenzo Bianconi       2014-09-04  3402  =

81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3403  		cover=
age_class =3D nla_get_u8(
81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3404  			info=
->attrs[NL80211_ATTR_WIPHY_COVERAGE_CLASS]);
81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3405  		chang=
ed |=3D WIPHY_PARAM_COVERAGE_CLASS;
81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3406  	}
81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3407  =

3057dbfdab1b86a7 Lorenzo Bianconi       2014-09-04  3408  	if (info->attrs[=
NL80211_ATTR_WIPHY_DYN_ACK]) {
604bd54a533e1982 Johannes Berg          2019-08-01  3409  		if (!(rdev->wip=
hy.features & NL80211_FEATURE_ACKTO_ESTIMATION)) {
604bd54a533e1982 Johannes Berg          2019-08-01  3410  			result =3D -EO=
PNOTSUPP;
604bd54a533e1982 Johannes Berg          2019-08-01  3411  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3412  		}
3057dbfdab1b86a7 Lorenzo Bianconi       2014-09-04  3413  =

3057dbfdab1b86a7 Lorenzo Bianconi       2014-09-04  3414  		changed |=3D WI=
PHY_PARAM_DYN_ACK;
81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3415  	}
81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3416  =

52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3417  	if (in=
fo->attrs[NL80211_ATTR_TXQ_LIMIT]) {
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3418  		if (!=
wiphy_ext_feature_isset(&rdev->wiphy,
604bd54a533e1982 Johannes Berg          2019-08-01  3419  					     NL80211=
_EXT_FEATURE_TXQS)) {
604bd54a533e1982 Johannes Berg          2019-08-01  3420  			result =3D -EO=
PNOTSUPP;
604bd54a533e1982 Johannes Berg          2019-08-01  3421  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3422  		}
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3423  		txq_l=
imit =3D nla_get_u32(
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3424  			info=
->attrs[NL80211_ATTR_TXQ_LIMIT]);
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3425  		chang=
ed |=3D WIPHY_PARAM_TXQ_LIMIT;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3426  	}
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3427  =

52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3428  	if (in=
fo->attrs[NL80211_ATTR_TXQ_MEMORY_LIMIT]) {
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3429  		if (!=
wiphy_ext_feature_isset(&rdev->wiphy,
604bd54a533e1982 Johannes Berg          2019-08-01  3430  					     NL80211=
_EXT_FEATURE_TXQS)) {
604bd54a533e1982 Johannes Berg          2019-08-01  3431  			result =3D -EO=
PNOTSUPP;
604bd54a533e1982 Johannes Berg          2019-08-01  3432  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3433  		}
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3434  		txq_m=
emory_limit =3D nla_get_u32(
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3435  			info=
->attrs[NL80211_ATTR_TXQ_MEMORY_LIMIT]);
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3436  		chang=
ed |=3D WIPHY_PARAM_TXQ_MEMORY_LIMIT;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3437  	}
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3438  =

52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3439  	if (in=
fo->attrs[NL80211_ATTR_TXQ_QUANTUM]) {
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3440  		if (!=
wiphy_ext_feature_isset(&rdev->wiphy,
604bd54a533e1982 Johannes Berg          2019-08-01  3441  					     NL80211=
_EXT_FEATURE_TXQS)) {
604bd54a533e1982 Johannes Berg          2019-08-01  3442  			result =3D -EO=
PNOTSUPP;
604bd54a533e1982 Johannes Berg          2019-08-01  3443  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3444  		}
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3445  		txq_q=
uantum =3D nla_get_u32(
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3446  			info=
->attrs[NL80211_ATTR_TXQ_QUANTUM]);
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3447  		chang=
ed |=3D WIPHY_PARAM_TXQ_QUANTUM;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3448  	}
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3449  =

b9a5f8cab751d362 Jouni Malinen          2009-04-20  3450  	if (changed) {
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3451  		u8 old_retry_sh=
ort, old_retry_long;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3452  		u32 old_frag_th=
reshold, old_rts_threshold;
81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3453  		u8 ol=
d_coverage_class;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3454  		u32 o=
ld_txq_limit, old_txq_memory_limit, old_txq_quantum;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3455  =

604bd54a533e1982 Johannes Berg          2019-08-01  3456  		if (!rdev->ops-=
>set_wiphy_params) {
604bd54a533e1982 Johannes Berg          2019-08-01  3457  			result =3D -EO=
PNOTSUPP;
604bd54a533e1982 Johannes Berg          2019-08-01  3458  			goto out;
604bd54a533e1982 Johannes Berg          2019-08-01  3459  		}
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3460  =

b9a5f8cab751d362 Jouni Malinen          2009-04-20  3461  		old_retry_short=
 =3D rdev->wiphy.retry_short;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3462  		old_retry_long =
=3D rdev->wiphy.retry_long;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3463  		old_frag_thresh=
old =3D rdev->wiphy.frag_threshold;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3464  		old_rts_thresho=
ld =3D rdev->wiphy.rts_threshold;
81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3465  		old_c=
overage_class =3D rdev->wiphy.coverage_class;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3466  		old_t=
xq_limit =3D rdev->wiphy.txq_limit;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3467  		old_t=
xq_memory_limit =3D rdev->wiphy.txq_memory_limit;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3468  		old_t=
xq_quantum =3D rdev->wiphy.txq_quantum;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3469  =

b9a5f8cab751d362 Jouni Malinen          2009-04-20  3470  		if (changed & W=
IPHY_PARAM_RETRY_SHORT)
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3471  			rdev->wiphy.re=
try_short =3D retry_short;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3472  		if (changed & W=
IPHY_PARAM_RETRY_LONG)
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3473  			rdev->wiphy.re=
try_long =3D retry_long;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3474  		if (changed & W=
IPHY_PARAM_FRAG_THRESHOLD)
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3475  			rdev->wiphy.fr=
ag_threshold =3D frag_threshold;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3476  		if (changed & W=
IPHY_PARAM_RTS_THRESHOLD)
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3477  			rdev->wiphy.rt=
s_threshold =3D rts_threshold;
81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3478  		if (c=
hanged & WIPHY_PARAM_COVERAGE_CLASS)
81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3479  			rdev=
->wiphy.coverage_class =3D coverage_class;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3480  		if (c=
hanged & WIPHY_PARAM_TXQ_LIMIT)
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3481  			rdev=
->wiphy.txq_limit =3D txq_limit;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3482  		if (c=
hanged & WIPHY_PARAM_TXQ_MEMORY_LIMIT)
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3483  			rdev=
->wiphy.txq_memory_limit =3D txq_memory_limit;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3484  		if (c=
hanged & WIPHY_PARAM_TXQ_QUANTUM)
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3485  			rdev=
->wiphy.txq_quantum =3D txq_quantum;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3486  =

e35e4d28b687d4e8 Hila Gonen             2012-06-27  3487  		result =3D rdev=
_set_wiphy_params(rdev, changed);
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3488  		if (result) {
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3489  			rdev->wiphy.re=
try_short =3D old_retry_short;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3490  			rdev->wiphy.re=
try_long =3D old_retry_long;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3491  			rdev->wiphy.fr=
ag_threshold =3D old_frag_threshold;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3492  			rdev->wiphy.rt=
s_threshold =3D old_rts_threshold;
81077e82c3f59157 Luk=C3=A1=C5=A1 Turek            2009-12-21  3493  			rdev=
->wiphy.coverage_class =3D old_coverage_class;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3494  			rdev=
->wiphy.txq_limit =3D old_txq_limit;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3495  			rdev=
->wiphy.txq_memory_limit =3D old_txq_memory_limit;
52539ca89f365d3d Toke H=C3=B8iland-J=C3=B8rgensen 2018-05-08  3496  			rdev=
->wiphy.txq_quantum =3D old_txq_quantum;
604bd54a533e1982 Johannes Berg          2019-08-01  3497  			goto out;
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3498  		}
b9a5f8cab751d362 Jouni Malinen          2009-04-20  3499  	}
604bd54a533e1982 Johannes Berg          2019-08-01  3500  =

604bd54a533e1982 Johannes Berg          2019-08-01  3501  	result =3D 0;
604bd54a533e1982 Johannes Berg          2019-08-01  3502  =

604bd54a533e1982 Johannes Berg          2019-08-01  3503  out:
604bd54a533e1982 Johannes Berg          2019-08-01  3504  	if (rdev)
604bd54a533e1982 Johannes Berg          2019-08-01  3505  		mutex_unlock(&r=
dev->wiphy.mtx);
604bd54a533e1982 Johannes Berg          2019-08-01 @3506  	return result;
556829657397b9b0 Johannes Berg          2007-09-20  3507  }
556829657397b9b0 Johannes Berg          2007-09-20  3508  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8671496151145692267==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============8671496151145692267==--

