Content-Type: multipart/mixed; boundary="===============4295487745248610902=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [wireless-next:main 6/6] net/mac80211/status.c:980 __ieee80211_tx_status() warn: potential spectre issue 'sta->deflink.status_stats.msdu_failed' [w]
Date: Tue, 12 Apr 2022 11:04:05 +0800
Message-ID: <202204121149.xAXL07oi-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4295487745248610902==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Johannes Berg <johannes@sipsolutions.net>
CC: Kalle Valo <kvalo@kernel.org>
CC: linux-wireless(a)vger.kernel.org
TO: Sriram R <quic_srirrama@quicinc.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wireless/wireless-n=
ext.git main
head:   046d2e7c50e3087a32a85fd384c21f896dbccf83
commit: 046d2e7c50e3087a32a85fd384c21f896dbccf83 [6/6] mac80211: prepare st=
a handling for MLO support
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: i386-randconfig-m021-20220411 (https://download.01.org/0day-ci/arch=
ive/20220412/202204121149.xAXL07oi-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.2.0-19) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/mac80211/status.c:980 __ieee80211_tx_status() warn: potential spectre i=
ssue 'sta->deflink.status_stats.msdu_failed' [w]
net/mac80211/status.c:982 __ieee80211_tx_status() warn: potential spectre i=
ssue 'sta->deflink.status_stats.msdu_retries' [w]

vim +980 net/mac80211/status.c

4dc792b8f098ab Helmut Schaa           2015-09-02   892  =

5fe49a9d11644f Felix Fietkau          2017-04-26   893  static void __ieee8=
0211_tx_status(struct ieee80211_hw *hw,
3318111cf63d97 Felix Fietkau          2020-09-08   894  				  struct ieee80=
211_tx_status *status,
3318111cf63d97 Felix Fietkau          2020-09-08   895  				  int rates_idx=
, int retry_count)
4dc792b8f098ab Helmut Schaa           2015-09-02   896  {
5fe49a9d11644f Felix Fietkau          2017-04-26   897  	struct sk_buff *sk=
b =3D status->skb;
7e1cdcbb092458 Felix Fietkau          2014-11-19   898  	struct ieee80211_h=
dr *hdr =3D (struct ieee80211_hdr *) skb->data;
7e1cdcbb092458 Felix Fietkau          2014-11-19   899  	struct ieee80211_l=
ocal *local =3D hw_to_local(hw);
5fe49a9d11644f Felix Fietkau          2017-04-26   900  	struct ieee80211_t=
x_info *info =3D status->info;
5fe49a9d11644f Felix Fietkau          2017-04-26   901  	struct sta_info *s=
ta;
7e1cdcbb092458 Felix Fietkau          2014-11-19   902  	__le16 fc;
7e1cdcbb092458 Felix Fietkau          2014-11-19   903  	struct ieee80211_s=
upported_band *sband;
7e1cdcbb092458 Felix Fietkau          2014-11-19   904  	bool send_to_cooke=
d;
7e1cdcbb092458 Felix Fietkau          2014-11-19   905  	bool acked;
5972fa15b923df Markus Theil           2019-12-18   906  	bool noack_success;
7e1cdcbb092458 Felix Fietkau          2014-11-19   907  	struct ieee80211_b=
ar *bar;
7e1cdcbb092458 Felix Fietkau          2014-11-19   908  	int shift =3D 0;
5e06a9e8b6db44 Johannes Berg          2015-01-16   909  	int tid =3D IEEE80=
211_NUM_TIDS;
7e1cdcbb092458 Felix Fietkau          2014-11-19   910  =

fe7a5d5c1ad659 Johannes Berg          2009-11-18   911  	sband =3D local->h=
w.wiphy->bands[info->band];
375177bf35efc0 Vivek Natarajan        2010-02-09   912  	fc =3D hdr->frame_=
control;
fe7a5d5c1ad659 Johannes Berg          2009-11-18   913  =

5fe49a9d11644f Felix Fietkau          2017-04-26   914  	if (status->sta) {
5fe49a9d11644f Felix Fietkau          2017-04-26   915  		sta =3D container=
_of(status->sta, struct sta_info, sta);
2103dec14792be Simon Wunderlich       2013-07-08   916  		shift =3D ieee802=
11_vif_get_shift(&sta->sdata->vif);
2103dec14792be Simon Wunderlich       2013-07-08   917  =

47086fc51aa222 Johannes Berg          2011-09-29   918  		if (info->flags &=
 IEEE80211_TX_STATUS_EOSP)
c2c98fdeb5c897 Johannes Berg          2011-09-29   919  			clear_sta_flag(s=
ta, WLAN_STA_SP);
47086fc51aa222 Johannes Berg          2011-09-29   920  =

04ac3c0ee2c773 Felix Fietkau          2010-12-02   921  		acked =3D !!(info=
->flags & IEEE80211_TX_STAT_ACK);
5972fa15b923df Markus Theil           2019-12-18   922  		noack_success =3D=
 !!(info->flags &
5972fa15b923df Markus Theil           2019-12-18   923  				   IEEE80211_TX=
_STAT_NOACK_TRANSMITTED);
71f2c3470fca51 Masashi Honma          2016-08-02   924  =

71f2c3470fca51 Masashi Honma          2016-08-02   925  		/* mesh Peer Serv=
ice Period support */
71f2c3470fca51 Masashi Honma          2016-08-02   926  		if (ieee80211_vif=
_is_mesh(&sta->sdata->vif) &&
71f2c3470fca51 Masashi Honma          2016-08-02   927  		    ieee80211_is_=
data_qos(fc))
71f2c3470fca51 Masashi Honma          2016-08-02   928  			ieee80211_mpsp_t=
rigger_process(
71f2c3470fca51 Masashi Honma          2016-08-02   929  				ieee80211_get_q=
os_ctl(hdr), sta, true, acked);
71f2c3470fca51 Masashi Honma          2016-08-02   930  =

30686bf7f5b3c3 Johannes Berg          2015-06-02   931  		if (ieee80211_hw_=
check(&local->hw, HAS_RATE_CONTROL) &&
00a9a6d1e2f18c Chun-Yeow Yeoh         2014-04-02   932  		    (ieee80211_is=
_data(hdr->frame_control)) &&
0c86980817853e Juuso Oikarinen        2010-04-22   933  		    (rates_idx !=
=3D -1))
046d2e7c50e308 Sriram R               2022-04-04   934  			sta->deflink.tx_=
stats.last_rate =3D
e5a9f8d04660da Johannes Berg          2015-10-16   935  				info->status.ra=
tes[rates_idx];
0c86980817853e Juuso Oikarinen        2010-04-22   936  =

fe7a5d5c1ad659 Johannes Berg          2009-11-18   937  		if ((info->flags =
& IEEE80211_TX_STAT_AMPDU_NO_BACK) &&
fe7a5d5c1ad659 Johannes Berg          2009-11-18   938  		    (ieee80211_is=
_data_qos(fc))) {
79c892b85027d5 Johannes Berg          2014-11-21   939  			u16 ssn;
fe7a5d5c1ad659 Johannes Berg          2009-11-18   940  			u8 *qc;
fe7a5d5c1ad659 Johannes Berg          2009-11-18   941  =

fe7a5d5c1ad659 Johannes Berg          2009-11-18   942  			qc =3D ieee80211=
_get_qos_ctl(hdr);
fe7a5d5c1ad659 Johannes Berg          2009-11-18   943  			tid =3D qc[0] & =
0xf;
fe7a5d5c1ad659 Johannes Berg          2009-11-18   944  			ssn =3D ((le16_t=
o_cpu(hdr->seq_ctrl) + 0x10)
fe7a5d5c1ad659 Johannes Berg          2009-11-18   945  						& IEEE80211_S=
CTL_SEQ);
8c771244fbab51 Felix Fietkau          2011-08-20   946  			ieee80211_send_b=
ar(&sta->sdata->vif, hdr->addr1,
fe7a5d5c1ad659 Johannes Berg          2009-11-18   947  					   tid, ssn);
79c892b85027d5 Johannes Berg          2014-11-21   948  		} else if (ieee80=
211_is_data_qos(fc)) {
79c892b85027d5 Johannes Berg          2014-11-21   949  			u8 *qc =3D ieee8=
0211_get_qos_ctl(hdr);
79c892b85027d5 Johannes Berg          2014-11-21   950  =

79c892b85027d5 Johannes Berg          2014-11-21   951  			tid =3D qc[0] & =
0xf;
fe7a5d5c1ad659 Johannes Berg          2009-11-18   952  		}
fe7a5d5c1ad659 Johannes Berg          2009-11-18   953  =

e69deded2bc29e Helmut Schaa           2011-08-11   954  		if (!acked && iee=
e80211_is_back_req(fc)) {
79c892b85027d5 Johannes Berg          2014-11-21   955  			u16 control;
7107676a3a4641 Felix Fietkau          2011-09-15   956  =

e69deded2bc29e Helmut Schaa           2011-08-11   957  			/*
7107676a3a4641 Felix Fietkau          2011-09-15   958  			 * BAR failed, s=
tore the last SSN and retry sending
7107676a3a4641 Felix Fietkau          2011-09-15   959  			 * the BAR when =
the next unicast transmission on the
7107676a3a4641 Felix Fietkau          2011-09-15   960  			 * same TID succ=
eeds.
e69deded2bc29e Helmut Schaa           2011-08-11   961  			 */
e69deded2bc29e Helmut Schaa           2011-08-11   962  			bar =3D (struct =
ieee80211_bar *) skb->data;
7107676a3a4641 Felix Fietkau          2011-09-15   963  			control =3D le16=
_to_cpu(bar->control);
7107676a3a4641 Felix Fietkau          2011-09-15   964  			if (!(control & =
IEEE80211_BAR_CTRL_MULTI_TID)) {
f0425beda4d404 Felix Fietkau          2011-08-28   965  				u16 ssn =3D le1=
6_to_cpu(bar->start_seq_num);
f0425beda4d404 Felix Fietkau          2011-08-28   966  =

7107676a3a4641 Felix Fietkau          2011-09-15   967  				tid =3D (contro=
l &
e69deded2bc29e Helmut Schaa           2011-08-11   968  				       IEEE8021=
1_BAR_CTRL_TID_INFO_MASK) >>
e69deded2bc29e Helmut Schaa           2011-08-11   969  				      IEEE80211=
_BAR_CTRL_TID_INFO_SHIFT;
f0425beda4d404 Felix Fietkau          2011-08-28   970  =

f0425beda4d404 Felix Fietkau          2011-08-28   971  				ieee80211_set_b=
ar_pending(sta, tid, ssn);
e69deded2bc29e Helmut Schaa           2011-08-11   972  			}
e69deded2bc29e Helmut Schaa           2011-08-11   973  		}
e69deded2bc29e Helmut Schaa           2011-08-11   974  =

fe7a5d5c1ad659 Johannes Berg          2009-11-18   975  		if (info->flags &=
 IEEE80211_TX_STAT_TX_FILTERED) {
fe7a5d5c1ad659 Johannes Berg          2009-11-18   976  			ieee80211_handle=
_filtered_frame(local, sta, skb);
fe7a5d5c1ad659 Johannes Berg          2009-11-18   977  			return;
3318111cf63d97 Felix Fietkau          2020-09-08   978  		} else if (ieee80=
211_is_data_present(fc)) {
5972fa15b923df Markus Theil           2019-12-18   979  			if (!acked && !n=
oack_success)
046d2e7c50e308 Sriram R               2022-04-04  @980  				sta->deflink.st=
atus_stats.msdu_failed[tid]++;
e5a9f8d04660da Johannes Berg          2015-10-16   981  =

046d2e7c50e308 Sriram R               2022-04-04  @982  			sta->deflink.sta=
tus_stats.msdu_retries[tid] +=3D
e5a9f8d04660da Johannes Berg          2015-10-16   983  				retry_count;
79c892b85027d5 Johannes Berg          2014-11-21   984  		}
0f78231bffb868 Johannes Berg          2009-12-01   985  =

04ac3c0ee2c773 Felix Fietkau          2010-12-02   986  		if (!(info->flags=
 & IEEE80211_TX_CTL_INJECTED) && acked)
0f78231bffb868 Johannes Berg          2009-12-01   987  			ieee80211_frame_=
acked(sta, skb);
99ba2a14283be9 Johannes Berg          2010-11-24   988  =

2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23   989  	} else i=
f (wiphy_ext_feature_isset(local->hw.wiphy,
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23   990  					   N=
L80211_EXT_FEATURE_AIRTIME_FAIRNESS)) {
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23   991  		struct =
ieee80211_sub_if_data *sdata;
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23   992  		struct =
ieee80211_txq *txq;
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23   993  		u32 air=
time;
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23   994  =

2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23   995  		/* Acco=
unt airtime to multicast queue */
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23   996  		sdata =
=3D ieee80211_sdata_from_skb(local, skb);
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23   997  =

2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23   998  		if (sda=
ta && (txq =3D sdata->vif.txq)) {
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23   999  			airtim=
e =3D info->status.tx_time ?:
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23  1000  				ieee8=
0211_calc_expected_tx_airtime(hw,
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23  1001  								 =
  &sdata->vif,
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23  1002  								 =
  NULL,
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23  1003  								 =
  skb->len,
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23  1004  								 =
  false);
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23  1005  =

2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23  1006  			ieee80=
211_register_airtime(txq, airtime, 0);
2433647bc8d983 Toke H=C3=B8iland-J=C3=B8rgensen 2021-06-23  1007  		}
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1008  	}
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1009  =

fe7a5d5c1ad659 Johannes Berg          2009-11-18  1010  	/* SNMP counters
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1011  	 * Fragments are p=
assed to low-level drivers as separate skbs, so these
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1012  	 * are actually fr=
agments, not frames. Update frame counters only for
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1013  	 * the first fragm=
ent of the frame. */
5cf16616e152dd Sujith Manoharan       2014-12-10  1014  	if ((info->flags &=
 IEEE80211_TX_STAT_ACK) ||
5cf16616e152dd Sujith Manoharan       2014-12-10  1015  	    (info->flags &=
 IEEE80211_TX_STAT_NOACK_TRANSMITTED)) {
adf5ace5d8161b Helmut Schaa           2011-12-08  1016  		if (ieee80211_is_=
first_frag(hdr->seq_ctrl)) {
c206ca670974ce Johannes Berg          2015-04-22  1017  			I802_DEBUG_INC(l=
ocal->dot11TransmittedFrameCount);
85b89af07d5095 Eliad Peller           2014-12-21  1018  			if (is_multicast=
_ether_addr(ieee80211_get_DA(hdr)))
c206ca670974ce Johannes Berg          2015-04-22  1019  				I802_DEBUG_INC(=
local->dot11MulticastTransmittedFrameCount);
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1020  			if (retry_count =
> 0)
c206ca670974ce Johannes Berg          2015-04-22  1021  				I802_DEBUG_INC(=
local->dot11RetryCount);
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1022  			if (retry_count =
> 1)
c206ca670974ce Johannes Berg          2015-04-22  1023  				I802_DEBUG_INC(=
local->dot11MultipleRetryCount);
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1024  		}
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1025  =

fe7a5d5c1ad659 Johannes Berg          2009-11-18  1026  		/* This counter s=
hall be incremented for an acknowledged MPDU
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1027  		 * with an indivi=
dual address in the address 1 field or an MPDU
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1028  		 * with a multica=
st address in the address 1 field of type Data
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1029  		 * or Management.=
 */
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1030  		if (!is_multicast=
_ether_addr(hdr->addr1) ||
adf5ace5d8161b Helmut Schaa           2011-12-08  1031  		    ieee80211_is_=
data(fc) ||
adf5ace5d8161b Helmut Schaa           2011-12-08  1032  		    ieee80211_is_=
mgmt(fc))
c206ca670974ce Johannes Berg          2015-04-22  1033  			I802_DEBUG_INC(l=
ocal->dot11TransmittedFragmentCount);
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1034  	} else {
adf5ace5d8161b Helmut Schaa           2011-12-08  1035  		if (ieee80211_is_=
first_frag(hdr->seq_ctrl))
c206ca670974ce Johannes Berg          2015-04-22  1036  			I802_DEBUG_INC(l=
ocal->dot11FailedCount);
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1037  	}
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1038  =

30b2f0be23fb40 Thomas Pedersen        2020-01-13  1039  	if (ieee80211_is_a=
ny_nullfunc(fc) &&
08a5bdde381299 Thomas Pedersen        2019-11-18  1040  	    ieee80211_has_=
pm(fc) &&
30686bf7f5b3c3 Johannes Berg          2015-06-02  1041  	    ieee80211_hw_c=
heck(&local->hw, REPORTS_TX_ACK_STATUS) &&
375177bf35efc0 Vivek Natarajan        2010-02-09  1042  	    !(info->flags =
& IEEE80211_TX_CTL_INJECTED) &&
375177bf35efc0 Vivek Natarajan        2010-02-09  1043  	    local->ps_sdat=
a && !(local->scanning)) {
6e899fa027addf Bassem Dawood          2021-02-27  1044  		if (info->flags &=
 IEEE80211_TX_STAT_ACK)
375177bf35efc0 Vivek Natarajan        2010-02-09  1045  			local->ps_sdata-=
>u.mgd.flags |=3D
375177bf35efc0 Vivek Natarajan        2010-02-09  1046  					IEEE80211_STA_=
NULLFUNC_ACKED;
6e899fa027addf Bassem Dawood          2021-02-27  1047  		mod_timer(&local-=
>dynamic_ps_timer,
6e899fa027addf Bassem Dawood          2021-02-27  1048  			  jiffies + msec=
s_to_jiffies(10));
375177bf35efc0 Vivek Natarajan        2010-02-09  1049  	}
375177bf35efc0 Vivek Natarajan        2010-02-09  1050  =

8a2fbedcdc9bec Johannes Berg          2012-10-26  1051  	ieee80211_report_u=
sed_skb(local, skb, false);
a729cff8ad5120 Johannes Berg          2011-11-06  1052  =

fe7a5d5c1ad659 Johannes Berg          2009-11-18  1053  	/* this was a tran=
smitted frame, but now we want to reuse it */
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1054  	skb_orphan(skb);
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1055  =

eaf55530c94cb7 Felix Fietkau          2010-03-11  1056  	/* Need to make a =
copy before skb->cb gets cleared */
eaf55530c94cb7 Felix Fietkau          2010-03-11  1057  	send_to_cooked =3D=
 !!(info->flags & IEEE80211_TX_CTL_INJECTED) ||
adf5ace5d8161b Helmut Schaa           2011-12-08  1058  			 !(ieee80211_is_=
data(fc));
eaf55530c94cb7 Felix Fietkau          2010-03-11  1059  =

fe7a5d5c1ad659 Johannes Berg          2009-11-18  1060  	/*
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1061  	 * This is a bit r=
acy but we can avoid a lot of work
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1062  	 * with this test.=
..
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1063  	 */
eaf55530c94cb7 Felix Fietkau          2010-03-11  1064  	if (!local->monito=
rs && (!send_to_cooked || !local->cooked_mntrs)) {
f02dff93e26bef Felix Fietkau          2020-09-08  1065  		if (status->free_=
list)
f02dff93e26bef Felix Fietkau          2020-09-08  1066  			list_add_tail(&s=
kb->list, status->free_list);
f02dff93e26bef Felix Fietkau          2020-09-08  1067  		else
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1068  			dev_kfree_skb(sk=
b);
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1069  		return;
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1070  	}
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1071  =

4dc792b8f098ab Helmut Schaa           2015-09-02  1072  	/* send to monitor=
 interfaces */
b7b2e8caa08c30 John Crispin           2019-07-14  1073  	ieee80211_tx_monit=
or(local, skb, sband, retry_count, shift,
b7b2e8caa08c30 John Crispin           2019-07-14  1074  			     send_to_coo=
ked, status);
fe7a5d5c1ad659 Johannes Berg          2009-11-18  1075  }
5fe49a9d11644f Felix Fietkau          2017-04-26  1076  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4295487745248610902==--

