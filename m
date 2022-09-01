Content-Type: multipart/mixed; boundary="===============6134418238118058938=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v2 06/12] mac80211: support ieee80211_ext format
Date: Fri, 02 Sep 2022 06:02:54 +0800
Message-ID: <202209020526.wlb7U84j-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6134418238118058938==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220830022017.51017-7-kieran.frewen@morsemicro.com>
References: <20220830022017.51017-7-kieran.frewen@morsemicro.com>
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
ive/20220902/202209020526.wlb7U84j-lkp(a)intel.com/config)
compiler: csky-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/mac80211/rx.c:4956 __ieee80211_rx_handle_packet() error: potentially de=
referencing uninitialized 'hdr'.
net/mac80211/rx.c:5011 __ieee80211_rx_handle_packet() error: potentially de=
referencing uninitialized 'ext_hdr'.

Old smatch warnings:
net/mac80211/rx.c:877 ieee80211_rx_monitor() warn: variable dereferenced be=
fore check 'origskb' (see line 770)
net/mac80211/rx.c:5013 __ieee80211_rx_handle_packet() error: potentially de=
referencing uninitialized 'hdr'.

vim +/hdr +4956 net/mac80211/rx.c

892b3bceb0b5340 Johannes Berg           2022-06-14  4885  =

571ecf676d66735 Johannes Berg           2007-07-27  4886  /*
6b59db7d4c4b0ad Zhao, Gang              2014-04-21  4887   * This is the ac=
tual Rx frames handler. as it belongs to Rx path it must
6368e4b18d5c71c Ron Rindjunsky          2007-12-24  4888   * be called with=
 rcu_read_lock protection.
571ecf676d66735 Johannes Berg           2007-07-27  4889   */
71ebb4aac87e4a1 Ron Rindjunsky          2008-01-21  4890  static void __iee=
e80211_rx_handle_packet(struct ieee80211_hw *hw,
d63b548fffdbd23 Johannes Berg           2016-03-31  4891  					 struct ieee=
80211_sta *pubsta,
af9f9b22beee70a Johannes Berg           2015-06-11  4892  					 struct sk_b=
uff *skb,
c5d1686b314ea44 Felix Fietkau           2020-07-26  4893  					 struct list=
_head *list)
571ecf676d66735 Johannes Berg           2007-07-27  4894  {
571ecf676d66735 Johannes Berg           2007-07-27  4895  	struct ieee80211=
_local *local =3D hw_to_local(hw);
571ecf676d66735 Johannes Berg           2007-07-27  4896  	struct ieee80211=
_sub_if_data *sdata;
571ecf676d66735 Johannes Berg           2007-07-27  4897  	struct ieee80211=
_hdr *hdr;
f4260573b3041a3 Kieran Frewen           2022-08-30  4898  	struct ieee80211=
_ext *ext_hdr;
e3cf8b3f7b9eefb Zhu Yi                  2010-03-29  4899  	__le16 fc;
5cf121c3cdb9555 Johannes Berg           2008-02-25  4900  	struct ieee80211=
_rx_data rx;
4406c3768956083 Johannes Berg           2010-09-24  4901  	struct ieee80211=
_sub_if_data *prev;
83e7e4ce9e93c3b Herbert Xu              2016-09-19  4902  	struct rhlist_he=
ad *tmp;
e3cf8b3f7b9eefb Zhu Yi                  2010-03-29  4903  	int err =3D 0;
571ecf676d66735 Johannes Berg           2007-07-27  4904  =

e3cf8b3f7b9eefb Zhu Yi                  2010-03-29  4905  	fc =3D ((struct =
ieee80211_hdr *)skb->data)->frame_control;
571ecf676d66735 Johannes Berg           2007-07-27  4906  	memset(&rx, 0, s=
izeof(rx));
571ecf676d66735 Johannes Berg           2007-07-27  4907  	rx.skb =3D skb;
571ecf676d66735 Johannes Berg           2007-07-27  4908  	rx.local =3D loc=
al;
c5d1686b314ea44 Felix Fietkau           2020-07-26  4909  	rx.list =3D list;
892b3bceb0b5340 Johannes Berg           2022-06-14  4910  	rx.link_id =3D -=
1;
72abd81b980ef7f Johannes Berg           2007-09-17  4911  =

e3cf8b3f7b9eefb Zhu Yi                  2010-03-29  4912  	if (ieee80211_is=
_data(fc) || ieee80211_is_mgmt(fc))
c206ca670974cef Johannes Berg           2015-04-22  4913  		I802_DEBUG_INC(=
local->dot11ReceivedFragmentCount);
571ecf676d66735 Johannes Berg           2007-07-27  4914  =

f4260573b3041a3 Kieran Frewen           2022-08-30  4915  	if (ieee80211_is=
_mgmt(fc) || ieee80211_is_s1g_beacon(fc)) {
4a4f1a5808c8bb0 Johannes Berg           2012-10-26  4916  		/* drop frame i=
f too short for header */
4a4f1a5808c8bb0 Johannes Berg           2012-10-26  4917  		if (skb->len < =
ieee80211_hdrlen(fc))
4a4f1a5808c8bb0 Johannes Berg           2012-10-26  4918  			err =3D -ENOBU=
FS;
e3cf8b3f7b9eefb Zhu Yi                  2010-03-29  4919  		else
4a4f1a5808c8bb0 Johannes Berg           2012-10-26  4920  			err =3D skb_li=
nearize(skb);
4a4f1a5808c8bb0 Johannes Berg           2012-10-26  4921  	} else {
e3cf8b3f7b9eefb Zhu Yi                  2010-03-29  4922  		err =3D !pskb_m=
ay_pull(skb, ieee80211_hdrlen(fc));
4a4f1a5808c8bb0 Johannes Berg           2012-10-26  4923  	}
e3cf8b3f7b9eefb Zhu Yi                  2010-03-29  4924  =

e3cf8b3f7b9eefb Zhu Yi                  2010-03-29  4925  	if (err) {
e3cf8b3f7b9eefb Zhu Yi                  2010-03-29  4926  		dev_kfree_skb(s=
kb);
e3cf8b3f7b9eefb Zhu Yi                  2010-03-29  4927  		return;
e3cf8b3f7b9eefb Zhu Yi                  2010-03-29  4928  	}
e3cf8b3f7b9eefb Zhu Yi                  2010-03-29  4929  =

f4260573b3041a3 Kieran Frewen           2022-08-30  4930  	if (ieee80211_is=
_s1g_beacon(fc))
f4260573b3041a3 Kieran Frewen           2022-08-30  4931  		ext_hdr =3D (st=
ruct ieee80211_ext *)skb->data;
f4260573b3041a3 Kieran Frewen           2022-08-30  4932  	else
e3cf8b3f7b9eefb Zhu Yi                  2010-03-29  4933  		hdr =3D (struct=
 ieee80211_hdr *)skb->data;
f4260573b3041a3 Kieran Frewen           2022-08-30  4934  =

38f3714d66b5679 Johannes Berg           2008-01-29  4935  	ieee80211_parse_=
qos(&rx);
d1c3a37ceeb1a5e Johannes Berg           2009-01-07  4936  	ieee80211_verify=
_alignment(&rx);
38f3714d66b5679 Johannes Berg           2008-01-29  4937  =

f4260573b3041a3 Kieran Frewen           2022-08-30  4938  	if (unlikely(iee=
e80211_is_probe_resp(fc) ||
f4260573b3041a3 Kieran Frewen           2022-08-30  4939  		     ieee80211_=
is_beacon(fc) ||
f4260573b3041a3 Kieran Frewen           2022-08-30  4940  		     ieee80211_=
is_s1g_beacon(fc)))
d48b296850f25cb Johannes Berg           2012-07-06  4941  		ieee80211_scan_=
rx(local, skb);
d48b296850f25cb Johannes Berg           2012-07-06  4942  =

19d19e960598161 Johannes Berg           2017-02-27  4943  	if (ieee80211_is=
_data(fc)) {
19d19e960598161 Johannes Berg           2017-02-27  4944  		struct sta_info=
 *sta, *prev_sta;
19d19e960598161 Johannes Berg           2017-02-27  4945  =

d63b548fffdbd23 Johannes Berg           2016-03-31  4946  		if (pubsta) {
d63b548fffdbd23 Johannes Berg           2016-03-31  4947  			rx.sta =3D con=
tainer_of(pubsta, struct sta_info, sta);
d63b548fffdbd23 Johannes Berg           2016-03-31  4948  			rx.sdata =3D r=
x.sta->sdata;
d63b548fffdbd23 Johannes Berg           2016-03-31  4949  			if (ieee80211_=
prepare_and_rx_handle(&rx, skb, true))
d63b548fffdbd23 Johannes Berg           2016-03-31  4950  				return;
d63b548fffdbd23 Johannes Berg           2016-03-31  4951  			goto out;
19d19e960598161 Johannes Berg           2017-02-27  4952  		}
7bedd0cfad4e122 Johannes Berg           2015-02-13  4953  =

56af326830757f3 Ben Greear              2010-09-23  4954  		prev_sta =3D NU=
LL;
4406c3768956083 Johannes Berg           2010-09-24  4955  =

83e7e4ce9e93c3b Herbert Xu              2016-09-19 @4956  		for_each_sta_in=
fo(local, hdr->addr2, sta, tmp) {
56af326830757f3 Ben Greear              2010-09-23  4957  			if (!prev_sta)=
 {
56af326830757f3 Ben Greear              2010-09-23  4958  				prev_sta =3D =
sta;
56af326830757f3 Ben Greear              2010-09-23  4959  				continue;
56af326830757f3 Ben Greear              2010-09-23  4960  			}
56af326830757f3 Ben Greear              2010-09-23  4961  =

56af326830757f3 Ben Greear              2010-09-23  4962  			rx.sta =3D pre=
v_sta;
56af326830757f3 Ben Greear              2010-09-23  4963  			rx.sdata =3D p=
rev_sta->sdata;
4406c3768956083 Johannes Berg           2010-09-24  4964  			ieee80211_prep=
are_and_rx_handle(&rx, skb, false);
571ecf676d66735 Johannes Berg           2007-07-27  4965  =

56af326830757f3 Ben Greear              2010-09-23  4966  			prev_sta =3D s=
ta;
4406c3768956083 Johannes Berg           2010-09-24  4967  		}
56af326830757f3 Ben Greear              2010-09-23  4968  =

56af326830757f3 Ben Greear              2010-09-23  4969  		if (prev_sta) {
56af326830757f3 Ben Greear              2010-09-23  4970  			rx.sta =3D pre=
v_sta;
56af326830757f3 Ben Greear              2010-09-23  4971  			rx.sdata =3D p=
rev_sta->sdata;
56af326830757f3 Ben Greear              2010-09-23  4972  =

4406c3768956083 Johannes Berg           2010-09-24  4973  			if (ieee80211_=
prepare_and_rx_handle(&rx, skb, true))
56af326830757f3 Ben Greear              2010-09-23  4974  				return;
8e26d5ad2f9c038 Senthil Balasubramanian 2010-11-30  4975  			goto out;
abe60632f311d51 Johannes Berg           2009-11-25  4976  		}
abe60632f311d51 Johannes Berg           2009-11-25  4977  	}
4406c3768956083 Johannes Berg           2010-09-24  4978  =

4406c3768956083 Johannes Berg           2010-09-24  4979  	prev =3D NULL;
4406c3768956083 Johannes Berg           2010-09-24  4980  =

abe60632f311d51 Johannes Berg           2009-11-25  4981  	list_for_each_en=
try_rcu(sdata, &local->interfaces, list) {
9607e6b66a0d25c Johannes Berg           2009-12-23  4982  		if (!ieee80211_=
sdata_running(sdata))
2a8a9a88fc1b18f Johannes Berg           2007-08-28  4983  			continue;
2a8a9a88fc1b18f Johannes Berg           2007-08-28  4984  =

fbc44bf7177dfd6 Johannes Berg           2009-10-01  4985  		if (sdata->vif.=
type =3D=3D NL80211_IFTYPE_MONITOR ||
fbc44bf7177dfd6 Johannes Berg           2009-10-01  4986  		    sdata->vif.=
type =3D=3D NL80211_IFTYPE_AP_VLAN)
b2e7771e556917c Johannes Berg           2007-09-26  4987  			continue;
b2e7771e556917c Johannes Berg           2007-09-26  4988  =

340e11f332c695c Johannes Berg           2007-07-27  4989  		/*
abe60632f311d51 Johannes Berg           2009-11-25  4990  		 * frame is des=
tined for this interface, but if it's
abe60632f311d51 Johannes Berg           2009-11-25  4991  		 * not also for=
 the previous one we handle that after
abe60632f311d51 Johannes Berg           2009-11-25  4992  		 * the loop to =
avoid copying the SKB once too much
340e11f332c695c Johannes Berg           2007-07-27  4993  		 */
340e11f332c695c Johannes Berg           2007-07-27  4994  =

340e11f332c695c Johannes Berg           2007-07-27  4995  		if (!prev) {
340e11f332c695c Johannes Berg           2007-07-27  4996  			prev =3D sdata;
340e11f332c695c Johannes Berg           2007-07-27  4997  			continue;
340e11f332c695c Johannes Berg           2007-07-27  4998  		}
f4260573b3041a3 Kieran Frewen           2022-08-30  4999  		if (ieee80211_i=
s_s1g_beacon(fc))
f4260573b3041a3 Kieran Frewen           2022-08-30  5000  			rx.sta =3D sta=
_info_get_bss(prev, ext_hdr->u.s1g_beacon.sa);
f4260573b3041a3 Kieran Frewen           2022-08-30  5001  		else
f4260573b3041a3 Kieran Frewen           2022-08-30  5002  			rx.sta =3D sta=
_info_get_bss(prev, hdr->addr2);
20b01f80f72426e Johannes Berg           2010-09-24  5003  		rx.sdata =3D pr=
ev;
892b3bceb0b5340 Johannes Berg           2022-06-14  5004  		ieee80211_rx_fo=
r_interface(&rx, skb, false);
4bb29f8c390fb7b Felix Fietkau           2010-01-22  5005  =

571ecf676d66735 Johannes Berg           2007-07-27  5006  		prev =3D sdata;
571ecf676d66735 Johannes Berg           2007-07-27  5007  	}
4bb29f8c390fb7b Felix Fietkau           2010-01-22  5008  =

4bb29f8c390fb7b Felix Fietkau           2010-01-22  5009  	if (prev) {
f4260573b3041a3 Kieran Frewen           2022-08-30  5010  		if (ieee80211_i=
s_s1g_beacon(fc))
f4260573b3041a3 Kieran Frewen           2022-08-30 @5011  			rx.sta =3D sta=
_info_get_bss(prev, ext_hdr->u.s1g_beacon.sa);
f4260573b3041a3 Kieran Frewen           2022-08-30  5012  		else
f4260573b3041a3 Kieran Frewen           2022-08-30  5013  			rx.sta =3D sta=
_info_get_bss(prev, hdr->addr2);
20b01f80f72426e Johannes Berg           2010-09-24  5014  		rx.sdata =3D pr=
ev;
4bb29f8c390fb7b Felix Fietkau           2010-01-22  5015  =

892b3bceb0b5340 Johannes Berg           2022-06-14  5016  		if (ieee80211_r=
x_for_interface(&rx, skb, true))
4406c3768956083 Johannes Berg           2010-09-24  5017  			return;
4bb29f8c390fb7b Felix Fietkau           2010-01-22  5018  	}
4406c3768956083 Johannes Berg           2010-09-24  5019  =

8e26d5ad2f9c038 Senthil Balasubramanian 2010-11-30  5020   out:
571ecf676d66735 Johannes Berg           2007-07-27  5021  	dev_kfree_skb(sk=
b);
571ecf676d66735 Johannes Berg           2007-07-27  5022  }
6368e4b18d5c71c Ron Rindjunsky          2007-12-24  5023  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6134418238118058938==--

