Content-Type: multipart/mixed; boundary="===============2032739535877274271=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 03/22] cfg80211: regulatory: handle S1G channels
Date: Fri, 28 Aug 2020 10:28:25 +0800
Message-ID: <202008281014.5BUV6rx9%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2032739535877274271==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200827223304.16155-4-thomas@adapt-ip.com>
References: <20200827223304.16155-4-thomas@adapt-ip.com>
TO: Thomas Pedersen <thomas@adapt-ip.com>
TO: Johannes Berg <johannes@sipsolutions.net>
CC: "linux-wireless" <linux-wireless@vger.kernel.org>
CC: Thomas Pedersen <thomas@adapt-ip.com>

Hi Thomas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on next-20200827]
[also build test WARNING on v5.9-rc2]
[cannot apply to mac80211-next/master mac80211/master wireless-drivers-next=
/master wireless-drivers/master v5.9-rc2 v5.9-rc1 v5.8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Thomas-Pedersen/add-initia=
l-S1G-support/20200828-063630
base:    88abac0b753dfdd85362a26d2da8277cb1e0842b
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
compiler: alpha-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> net/mac80211/util.c:1456:11: warning: Either the condition 'chanctx_conf=
' is redundant or there is possible null pointer dereference: chanctx_conf.=
 [nullPointerRedundantCheck]
    min_bw =3D chanctx_conf->def.chan->band =3D=3D NL80211_BAND_S1GHZ ? 1 :=
 20;
             ^
   net/mac80211/util.c:1448:6: note: Assuming that condition 'chanctx_conf'=
 is not redundant
    if (chanctx_conf)
        ^
   net/mac80211/util.c:1456:11: note: Null pointer dereference
    min_bw =3D chanctx_conf->def.chan->band =3D=3D NL80211_BAND_S1GHZ ? 1 :=
 20;
             ^
   net/mac80211/util.c:1587:56: warning: Function 'ieee80211_send_auth' arg=
ument order different: declaration 'sdata, transaction, auth_alg, status, e=
xtra, extra_len, bssid, da, key, key_len, key_idx, tx_flags' definition 'sd=
ata, transaction, auth_alg, status, extra, extra_len, da, bssid, key, key_l=
en, key_idx, tx_flags' [funcArgOrderDifferent]
   void ieee80211_send_auth(struct ieee80211_sub_if_data *sdata,
                                                          ^
   net/mac80211/ieee80211_i.h:2129:56: note: Function 'ieee80211_send_auth'=
 argument order different: declaration 'sdata, transaction, auth_alg, statu=
s, extra, extra_len, bssid, da, key, key_len, key_idx, tx_flags' definition=
 'sdata, transaction, auth_alg, status, extra, extra_len, da, bssid, key, k=
ey_len, key_idx, tx_flags'
   void ieee80211_send_auth(struct ieee80211_sub_if_data *sdata,
                                                          ^
   net/mac80211/util.c:1587:56: note: Function 'ieee80211_send_auth' argume=
nt order different: declaration 'sdata, transaction, auth_alg, status, extr=
a, extra_len, bssid, da, key, key_len, key_idx, tx_flags' definition 'sdata=
, transaction, auth_alg, status, extra, extra_len, da, bssid, key, key_len,=
 key_idx, tx_flags'
   void ieee80211_send_auth(struct ieee80211_sub_if_data *sdata,
                                                          ^

# https://github.com/0day-ci/linux/commit/241a925b241ed8977ba3eb94e0b81fd2c=
c389f2e
git remote add linux-review https://github.com/0day-ci/linux
git fetch --no-tags linux-review Thomas-Pedersen/add-initial-S1G-support/20=
200828-063630
git checkout 241a925b241ed8977ba3eb94e0b81fd2cc389f2e
vim +/chanctx_conf +1456 net/mac80211/util.c

78ac51f81532c1 Sara Sharon       2019-01-16  1432  =

e552af05814849 Haim Dreyfuss     2018-03-28  1433  void ieee80211_regulator=
y_limit_wmm_params(struct ieee80211_sub_if_data *sdata,
e552af05814849 Haim Dreyfuss     2018-03-28  1434  					   struct ieee80211=
_tx_queue_params
e552af05814849 Haim Dreyfuss     2018-03-28  1435  					   *qparam, int ac)
e552af05814849 Haim Dreyfuss     2018-03-28  1436  {
e552af05814849 Haim Dreyfuss     2018-03-28  1437  	struct ieee80211_chanct=
x_conf *chanctx_conf;
e552af05814849 Haim Dreyfuss     2018-03-28  1438  	const struct ieee80211_=
reg_rule *rrule;
38cb87ee47fb82 Stanislaw Gruszka 2018-08-22  1439  	const struct ieee80211_=
wmm_ac *wmm_ac;
241a925b241ed8 Thomas Pedersen   2020-08-27  1440  	u16 min_bw, center_freq=
 =3D 0;
e552af05814849 Haim Dreyfuss     2018-03-28  1441  =

e552af05814849 Haim Dreyfuss     2018-03-28  1442  	if (sdata->vif.type !=
=3D NL80211_IFTYPE_AP &&
e552af05814849 Haim Dreyfuss     2018-03-28  1443  	    sdata->vif.type !=
=3D NL80211_IFTYPE_STATION)
e552af05814849 Haim Dreyfuss     2018-03-28  1444  		return;
e552af05814849 Haim Dreyfuss     2018-03-28  1445  =

e552af05814849 Haim Dreyfuss     2018-03-28  1446  	rcu_read_lock();
e552af05814849 Haim Dreyfuss     2018-03-28  1447  	chanctx_conf =3D rcu_de=
reference(sdata->vif.chanctx_conf);
e552af05814849 Haim Dreyfuss     2018-03-28  1448  	if (chanctx_conf)
e552af05814849 Haim Dreyfuss     2018-03-28  1449  		center_freq =3D chanct=
x_conf->def.chan->center_freq;
e552af05814849 Haim Dreyfuss     2018-03-28  1450  =

e552af05814849 Haim Dreyfuss     2018-03-28  1451  	if (!center_freq) {
e552af05814849 Haim Dreyfuss     2018-03-28  1452  		rcu_read_unlock();
e552af05814849 Haim Dreyfuss     2018-03-28  1453  		return;
e552af05814849 Haim Dreyfuss     2018-03-28  1454  	}
e552af05814849 Haim Dreyfuss     2018-03-28  1455  =

241a925b241ed8 Thomas Pedersen   2020-08-27 @1456  	min_bw =3D chanctx_conf=
->def.chan->band =3D=3D NL80211_BAND_S1GHZ ? 1 : 20;
241a925b241ed8 Thomas Pedersen   2020-08-27  1457  	rrule =3D freq_reg_info=
(sdata->wdev.wiphy, MHZ_TO_KHZ(center_freq),
241a925b241ed8 Thomas Pedersen   2020-08-27  1458  			      min_bw);
e552af05814849 Haim Dreyfuss     2018-03-28  1459  =

38cb87ee47fb82 Stanislaw Gruszka 2018-08-22  1460  	if (IS_ERR_OR_NULL(rrul=
e) || !rrule->has_wmm) {
e552af05814849 Haim Dreyfuss     2018-03-28  1461  		rcu_read_unlock();
e552af05814849 Haim Dreyfuss     2018-03-28  1462  		return;
e552af05814849 Haim Dreyfuss     2018-03-28  1463  	}
e552af05814849 Haim Dreyfuss     2018-03-28  1464  =

e552af05814849 Haim Dreyfuss     2018-03-28  1465  	if (sdata->vif.type =3D=
=3D NL80211_IFTYPE_AP)
38cb87ee47fb82 Stanislaw Gruszka 2018-08-22  1466  		wmm_ac =3D &rrule->wmm=
_rule.ap[ac];
e552af05814849 Haim Dreyfuss     2018-03-28  1467  	else
38cb87ee47fb82 Stanislaw Gruszka 2018-08-22  1468  		wmm_ac =3D &rrule->wmm=
_rule.client[ac];
e552af05814849 Haim Dreyfuss     2018-03-28  1469  	qparam->cw_min =3D max_=
t(u16, qparam->cw_min, wmm_ac->cw_min);
e552af05814849 Haim Dreyfuss     2018-03-28  1470  	qparam->cw_max =3D max_=
t(u16, qparam->cw_max, wmm_ac->cw_max);
e552af05814849 Haim Dreyfuss     2018-03-28  1471  	qparam->aifs =3D max_t(=
u8, qparam->aifs, wmm_ac->aifsn);
abd76d255d69d7 Dreyfuss, Haim    2018-08-31  1472  	qparam->txop =3D min_t(=
u16, qparam->txop, wmm_ac->cot / 32);
e552af05814849 Haim Dreyfuss     2018-03-28  1473  	rcu_read_unlock();
e552af05814849 Haim Dreyfuss     2018-03-28  1474  }
e552af05814849 Haim Dreyfuss     2018-03-28  1475  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2032739535877274271==--

