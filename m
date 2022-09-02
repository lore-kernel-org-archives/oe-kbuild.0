Content-Type: multipart/mixed; boundary="===============6564154183695398877=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 10/12] mac80211: support S1G rate encoding.
Date: Sat, 03 Sep 2022 03:15:36 +0800
Message-ID: <202209030311.ZfYtAbq4-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6564154183695398877==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220830022017.51017-11-kieran.frewen@morsemicro.com>
References: <20220830022017.51017-11-kieran.frewen@morsemicro.com>
TO: Kieran Frewen <kieran.frewen@morsemicro.com>
TO: johannes(a)sipsolutions.net
CC: linux-wireless(a)vger.kernel.org
CC: quic_jjohnson(a)quicinc.com
CC: Kieran Frewen <kieran.frewen@morsemicro.com>

Hi Kieran,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on wireless/main]
[also build test WARNING on linus/master v6.0-rc3]
[cannot apply to wireless-next/main]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kieran-Frewen/Additi=
onal-Support-for-802-11ah-S1G/20220830-102217
base:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless.g=
it main
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: csky-randconfig-m031-20220901 (https://download.01.org/0day-ci/arch=
ive/20220903/202209030311.ZfYtAbq4-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/mac80211/cfg.c:776 sta_set_rate_info_tx() error: we previously assumed =
'sband' could be null (see line 771)

vim +/sband +776 net/mac80211/cfg.c

e5473e80d46767 Jouni Malinen            2020-02-22  745  =

6b62bf326393de Thomas Pedersen          2012-03-05  746  void sta_set_rate_=
info_tx(struct sta_info *sta,
6b62bf326393de Thomas Pedersen          2012-03-05  747  			  const struct =
ieee80211_tx_rate *rate,
6b62bf326393de Thomas Pedersen          2012-03-05  748  			  struct rate_i=
nfo *rinfo)
6b62bf326393de Thomas Pedersen          2012-03-05  749  {
fccc3f976cfc1e Kieran Frewen            2022-08-30  750  	struct ieee80211_=
supported_band *sband;
fccc3f976cfc1e Kieran Frewen            2022-08-30  751  =

fccc3f976cfc1e Kieran Frewen            2022-08-30  752  	sband =3D ieee802=
11_get_sband(sta->sdata);
6b62bf326393de Thomas Pedersen          2012-03-05  753  	rinfo->flags =3D =
0;
fccc3f976cfc1e Kieran Frewen            2022-08-30  754  	if (rate->flags &=
 IEEE80211_TX_RC_S1G_MCS &&
fccc3f976cfc1e Kieran Frewen            2022-08-30  755  	    sband->band =
=3D=3D NL80211_BAND_S1GHZ) {
fccc3f976cfc1e Kieran Frewen            2022-08-30  756  		rinfo->flags |=
=3D RATE_INFO_FLAGS_S1G_MCS;
fccc3f976cfc1e Kieran Frewen            2022-08-30  757  		rinfo->mcs =3D i=
eee80211_rate_get_s1g_mcs(rate);
fccc3f976cfc1e Kieran Frewen            2022-08-30  758  		rinfo->nss =3D i=
eee80211_rate_get_s1g_nss(rate);
fccc3f976cfc1e Kieran Frewen            2022-08-30  759  	} else if (rate->=
flags & IEEE80211_TX_RC_MCS) {
6b62bf326393de Thomas Pedersen          2012-03-05  760  		rinfo->flags |=
=3D RATE_INFO_FLAGS_MCS;
8bc83c24638b72 Johannes Berg            2012-11-09  761  		rinfo->mcs =3D r=
ate->idx;
8bc83c24638b72 Johannes Berg            2012-11-09  762  	} else if (rate->=
flags & IEEE80211_TX_RC_VHT_MCS) {
8bc83c24638b72 Johannes Berg            2012-11-09  763  		rinfo->flags |=
=3D RATE_INFO_FLAGS_VHT_MCS;
8bc83c24638b72 Johannes Berg            2012-11-09  764  		rinfo->mcs =3D i=
eee80211_rate_get_vht_mcs(rate);
8bc83c24638b72 Johannes Berg            2012-11-09  765  		rinfo->nss =3D i=
eee80211_rate_get_vht_nss(rate);
8bc83c24638b72 Johannes Berg            2012-11-09  766  	} else {
2103dec14792be Simon Wunderlich         2013-07-08  767  		int shift =3D ie=
ee80211_vif_get_shift(&sta->sdata->vif);
2103dec14792be Simon Wunderlich         2013-07-08  768  		u16 brate;
2103dec14792be Simon Wunderlich         2013-07-08  769  =

8b783d104e7f40 Thomas Pedersen          2020-10-05  770  		WARN_ON_ONCE(sba=
nd && !sband->bitrates);
8b783d104e7f40 Thomas Pedersen          2020-10-05 @771  		if (sband && sba=
nd->bitrates) {
2103dec14792be Simon Wunderlich         2013-07-08  772  			brate =3D sband=
->bitrates[rate->idx].bitrate;
2103dec14792be Simon Wunderlich         2013-07-08  773  			rinfo->legacy =
=3D DIV_ROUND_UP(brate, 1 << shift);
8bc83c24638b72 Johannes Berg            2012-11-09  774  		}
21a8e9dd52b64f Mohammed Shafi Shajakhan 2017-04-27  775  	}
fccc3f976cfc1e Kieran Frewen            2022-08-30 @776  	if (sband->band =
=3D=3D NL80211_BAND_S1GHZ) {
fccc3f976cfc1e Kieran Frewen            2022-08-30  777  		if (rate->flags =
& IEEE80211_TX_RC_2_MHZ_WIDTH)
fccc3f976cfc1e Kieran Frewen            2022-08-30  778  			rinfo->bw =3D R=
ATE_INFO_BW_2;
fccc3f976cfc1e Kieran Frewen            2022-08-30  779  		else if (rate->f=
lags & IEEE80211_TX_RC_4_MHZ_WIDTH)
fccc3f976cfc1e Kieran Frewen            2022-08-30  780  			rinfo->bw =3D R=
ATE_INFO_BW_4;
fccc3f976cfc1e Kieran Frewen            2022-08-30  781  		else if (rate->f=
lags & IEEE80211_TX_RC_8_MHZ_WIDTH)
fccc3f976cfc1e Kieran Frewen            2022-08-30  782  			rinfo->bw =3D R=
ATE_INFO_BW_8;
fccc3f976cfc1e Kieran Frewen            2022-08-30  783  		else if (rate->f=
lags & IEEE80211_TX_RC_16_MHZ_WIDTH)
fccc3f976cfc1e Kieran Frewen            2022-08-30  784  			rinfo->bw =3D R=
ATE_INFO_BW_16;
fccc3f976cfc1e Kieran Frewen            2022-08-30  785  		else
fccc3f976cfc1e Kieran Frewen            2022-08-30  786  			rinfo->bw =3D R=
ATE_INFO_BW_1;
fccc3f976cfc1e Kieran Frewen            2022-08-30  787  	} else {
6b62bf326393de Thomas Pedersen          2012-03-05  788  		if (rate->flags =
& IEEE80211_TX_RC_40_MHZ_WIDTH)
b51f3beecfbbfc Johannes Berg            2015-01-15  789  			rinfo->bw =3D R=
ATE_INFO_BW_40;
b51f3beecfbbfc Johannes Berg            2015-01-15  790  		else if (rate->f=
lags & IEEE80211_TX_RC_80_MHZ_WIDTH)
b51f3beecfbbfc Johannes Berg            2015-01-15  791  			rinfo->bw =3D R=
ATE_INFO_BW_80;
b51f3beecfbbfc Johannes Berg            2015-01-15  792  		else if (rate->f=
lags & IEEE80211_TX_RC_160_MHZ_WIDTH)
b51f3beecfbbfc Johannes Berg            2015-01-15  793  			rinfo->bw =3D R=
ATE_INFO_BW_160;
b51f3beecfbbfc Johannes Berg            2015-01-15  794  		else
b51f3beecfbbfc Johannes Berg            2015-01-15  795  			rinfo->bw =3D R=
ATE_INFO_BW_20;
fccc3f976cfc1e Kieran Frewen            2022-08-30  796  	}
fccc3f976cfc1e Kieran Frewen            2022-08-30  797  =

6b62bf326393de Thomas Pedersen          2012-03-05  798  	if (rate->flags &=
 IEEE80211_TX_RC_SHORT_GI)
6b62bf326393de Thomas Pedersen          2012-03-05  799  		rinfo->flags |=
=3D RATE_INFO_FLAGS_SHORT_GI;
6b62bf326393de Thomas Pedersen          2012-03-05  800  }
6b62bf326393de Thomas Pedersen          2012-03-05  801  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6564154183695398877==--

