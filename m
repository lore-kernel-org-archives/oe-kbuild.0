Content-Type: multipart/mixed; boundary="===============8551768285011697561=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [staging:staging-next 101/127] drivers/staging/wfx/sta.c:723:14: warning: The if condition is the same as the previous if condition [duplicateCondition]
Date: Tue, 14 Apr 2020 18:27:34 +0800
Message-ID: <202004141823.ilrJ5Bnp%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8551768285011697561==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: devel(a)driverdev.osuosl.org
TO: "J=C3=A9r=C3=B4me Pouiller" <jerome.pouiller@silabs.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git =
staging-next
head:   ce920326663b3df22c94ade99a8b234baa6ccaa5
commit: 9abb6b26f62e392ba3761256e9e020a45c5629e3 [101/127] staging: wfx: ch=
ange the way the station associate to an AP
:::::: branch date: 21 hours ago
:::::: commit date: 22 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/staging/wfx/sta.c:723:14: warning: The if condition is the same =
as the previous if condition [duplicateCondition]
    if (changed & BSS_CHANGED_ASSOC) {
                ^
   drivers/staging/wfx/sta.c:717:14: note: First condition
    if (changed & BSS_CHANGED_ASSOC) {
                ^
   drivers/staging/wfx/sta.c:723:14: note: Second condition
    if (changed & BSS_CHANGED_ASSOC) {
                ^
   drivers/staging/wfx/wfx.h:137:18: warning: The scope of the variable 'tm=
p' can be reduced. [variableScope]
    struct wfx_vif *tmp;
                    ^
   drivers/staging/wfx/wfx.h:155:18: warning: The scope of the variable 'wv=
if' can be reduced. [variableScope]
    struct wfx_vif *wvif;
                    ^
   drivers/staging/wfx/sta.c:679:6: warning: The scope of the variable 'i' =
can be reduced. [variableScope]
    int i;
        ^

# https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git/commit=
/?id=3D9abb6b26f62e392ba3761256e9e020a45c5629e3
git remote add staging https://git.kernel.org/pub/scm/linux/kernel/git/greg=
kh/staging.git
git remote update staging
git checkout 9abb6b26f62e392ba3761256e9e020a45c5629e3
vim +723 drivers/staging/wfx/sta.c

4fb6036a1b743ad J=C3=A9r=C3=B4me Pouiller 2020-04-01  671  =

40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  672  void wfx_bss_inf=
o_changed(struct ieee80211_hw *hw,
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  673  			     struct i=
eee80211_vif *vif,
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  674  			     struct i=
eee80211_bss_conf *info,
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  675  			     u32 chan=
ged)
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  676  {
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  677  	struct wfx_dev =
*wdev =3D hw->priv;
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  678  	struct wfx_vif =
*wvif =3D (struct wfx_vif *) vif->drv_priv;
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  679  	int i;
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  680  =

40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  681  	mutex_lock(&wde=
v->conf_mutex);
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  682  =

40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  683  	/* TODO: BSS_CH=
ANGED_QOS */
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  684  	if (changed & B=
SS_CHANGED_ARP_FILTER) {
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  685  		for (i =3D 0; =
i < HIF_MAX_ARP_IP_ADDRTABLE_ENTRIES; i++) {
e52e68eee7d0a67 J=C3=A9r=C3=B4me Pouiller 2020-01-15  686  			__be32 *arp_a=
ddr =3D &info->arp_addr_list[i];
e52e68eee7d0a67 J=C3=A9r=C3=B4me Pouiller 2020-01-15  687  =

e52e68eee7d0a67 J=C3=A9r=C3=B4me Pouiller 2020-01-15  688  			if (info->arp=
_addr_cnt > HIF_MAX_ARP_IP_ADDRTABLE_ENTRIES)
e52e68eee7d0a67 J=C3=A9r=C3=B4me Pouiller 2020-01-15  689  				arp_addr =3D=
 NULL;
e52e68eee7d0a67 J=C3=A9r=C3=B4me Pouiller 2020-01-15  690  			if (i >=3D in=
fo->arp_addr_cnt)
e52e68eee7d0a67 J=C3=A9r=C3=B4me Pouiller 2020-01-15  691  				arp_addr =3D=
 NULL;
e52e68eee7d0a67 J=C3=A9r=C3=B4me Pouiller 2020-01-15  692  			hif_set_arp_i=
pv4_filter(wvif, i, arp_addr);
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  693  		}
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  694  	}
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  695  =

9abb6b26f62e392 J=C3=A9r=C3=B4me Pouiller 2020-04-10  696  	if (changed & B=
SS_CHANGED_BASIC_RATES ||
9abb6b26f62e392 J=C3=A9r=C3=B4me Pouiller 2020-04-10  697  	    changed & B=
SS_CHANGED_BEACON_INT ||
9abb6b26f62e392 J=C3=A9r=C3=B4me Pouiller 2020-04-10  698  	    changed & B=
SS_CHANGED_BSSID) {
9abb6b26f62e392 J=C3=A9r=C3=B4me Pouiller 2020-04-10  699  		if (vif->type =
=3D=3D NL80211_IFTYPE_STATION ||
9abb6b26f62e392 J=C3=A9r=C3=B4me Pouiller 2020-04-10  700  		    vif->type =
=3D=3D NL80211_IFTYPE_ADHOC)
9abb6b26f62e392 J=C3=A9r=C3=B4me Pouiller 2020-04-10  701  			wfx_do_join(w=
vif);
9abb6b26f62e392 J=C3=A9r=C3=B4me Pouiller 2020-04-10  702  	}
9abb6b26f62e392 J=C3=A9r=C3=B4me Pouiller 2020-04-10  703  =

cba1d8976db0032 J=C3=A9r=C3=B4me Pouiller 2020-04-10  704  	if (changed & B=
SS_CHANGED_AP_PROBE_RESP ||
cba1d8976db0032 J=C3=A9r=C3=B4me Pouiller 2020-04-10  705  	    changed & B=
SS_CHANGED_BEACON)
d8a92d918612fca J=C3=A9r=C3=B4me Pouiller 2020-01-15  706  		wfx_upload_ap_=
templates(wvif);
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  707  =

8c7128c4cf4e0e6 Jules Irenge    2019-11-13  708  	if (changed & BSS_CHANGED=
_BEACON_ENABLED &&
9d443ffc588bbee J=C3=A9r=C3=B4me Pouiller 2020-01-15  709  	    wvif->state=
 !=3D WFX_STATE_IBSS)
4fb6036a1b743ad J=C3=A9r=C3=B4me Pouiller 2020-04-01  710  		wfx_enable_bea=
con(wvif, info->enable_beacon);
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  711  =

b0674e0675520be J=C3=A9r=C3=B4me Pouiller 2020-01-15  712  	if (changed & B=
SS_CHANGED_BEACON_INFO)
b0674e0675520be J=C3=A9r=C3=B4me Pouiller 2020-01-15  713  		hif_set_beacon=
_wakeup_period(wvif, info->dtim_period,
b0674e0675520be J=C3=A9r=C3=B4me Pouiller 2020-01-15  714  					     info->=
dtim_period);
b0674e0675520be J=C3=A9r=C3=B4me Pouiller 2020-01-15  715  =

40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  716  	/* assoc/disass=
oc, or maybe AID changed */
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  717  	if (changed & B=
SS_CHANGED_ASSOC) {
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  718  		wfx_tx_lock_fl=
ush(wdev);
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  719  		wvif->wep_defa=
ult_key_id =3D -1;
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  720  		wfx_tx_unlock(=
wdev);
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  721  	}
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  722  =

9abb6b26f62e392 J=C3=A9r=C3=B4me Pouiller 2020-04-10 @723  	if (changed & B=
SS_CHANGED_ASSOC) {
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  724  		if (info->asso=
c || info->ibss_joined)
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  725  			wfx_join_fina=
lize(wvif, info);
9abb6b26f62e392 J=C3=A9r=C3=B4me Pouiller 2020-04-10  726  		else if (!info=
->assoc && vif->type =3D=3D NL80211_IFTYPE_STATION)
9abb6b26f62e392 J=C3=A9r=C3=B4me Pouiller 2020-04-10  727  			wfx_do_unjoin=
(wvif);
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  728  		else
9abb6b26f62e392 J=C3=A9r=C3=B4me Pouiller 2020-04-10  729  			dev_warn(wdev=
->dev, "%s: misunderstood change: ASSOC\n",
9abb6b26f62e392 J=C3=A9r=C3=B4me Pouiller 2020-04-10  730  				 __func__);
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  731  	}
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  732  =

eddd8585fb46db6 J=C3=A9r=C3=B4me Pouiller 2019-12-17  733  	if (changed & B=
SS_CHANGED_ASSOC ||
eddd8585fb46db6 J=C3=A9r=C3=B4me Pouiller 2019-12-17  734  	    changed & B=
SS_CHANGED_ERP_CTS_PROT ||
eddd8585fb46db6 J=C3=A9r=C3=B4me Pouiller 2019-12-17  735  	    changed & B=
SS_CHANGED_ERP_PREAMBLE) {
deb7734ea984ec6 J=C3=A9r=C3=B4me Pouiller 2020-01-15  736  		u8 erp_ie[3] =
=3D { WLAN_EID_ERP_INFO, 1, 0 };
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  737  =

deb7734ea984ec6 J=C3=A9r=C3=B4me Pouiller 2020-01-15  738  		hif_erp_use_pr=
otection(wvif, info->use_cts_prot);
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  739  		if (info->use_=
cts_prot)
deb7734ea984ec6 J=C3=A9r=C3=B4me Pouiller 2020-01-15  740  			erp_ie[2] |=
=3D WLAN_ERP_USE_PROTECTION;
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  741  		if (info->use_=
short_preamble)
deb7734ea984ec6 J=C3=A9r=C3=B4me Pouiller 2020-01-15  742  			erp_ie[2] |=
=3D WLAN_ERP_BARKER_PREAMBLE;
deb7734ea984ec6 J=C3=A9r=C3=B4me Pouiller 2020-01-15  743  		if (wvif->vif-=
>type !=3D NL80211_IFTYPE_STATION)
a09343fc354d459 J=C3=A9r=C3=B4me Pouiller 2020-01-15  744  			hif_update_ie=
_beacon(wvif, erp_ie, sizeof(erp_ie));
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  745  	}
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  746  =

eddd8585fb46db6 J=C3=A9r=C3=B4me Pouiller 2019-12-17  747  	if (changed & B=
SS_CHANGED_ASSOC || changed & BSS_CHANGED_ERP_SLOT)
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  748  		hif_slot_time(=
wvif, info->use_short_slot ? 9 : 20);
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  749  =

ba366b9268263f7 J=C3=A9r=C3=B4me Pouiller 2020-01-15  750  	if (changed & B=
SS_CHANGED_ASSOC || changed & BSS_CHANGED_CQM)
9ed8b0d0f27cf7b J=C3=A9r=C3=B4me Pouiller 2020-01-15  751  		hif_set_rcpi_r=
ssi_threshold(wvif, info->cqm_rssi_thold,
9ed8b0d0f27cf7b J=C3=A9r=C3=B4me Pouiller 2020-01-15  752  					    info->c=
qm_rssi_hyst);
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  753  =

f050f3dac668690 J=C3=A9r=C3=B4me Pouiller 2020-01-15  754  	if (changed & B=
SS_CHANGED_TXPOWER)
f050f3dac668690 J=C3=A9r=C3=B4me Pouiller 2020-01-15  755  		hif_set_output=
_power(wvif, info->txpower);
8d97a12fa4d25f7 J=C3=A9r=C3=B4me Pouiller 2020-01-15  756  =

8d97a12fa4d25f7 J=C3=A9r=C3=B4me Pouiller 2020-01-15  757  	if (changed & B=
SS_CHANGED_PS)
8d97a12fa4d25f7 J=C3=A9r=C3=B4me Pouiller 2020-01-15  758  		wfx_update_pm(=
wvif);
8d97a12fa4d25f7 J=C3=A9r=C3=B4me Pouiller 2020-01-15  759  =

40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  760  	mutex_unlock(&w=
dev->conf_mutex);
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  761  }
40115bbc40e2fd2 J=C3=A9r=C3=B4me Pouiller 2019-09-19  762  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8551768285011697561==--

