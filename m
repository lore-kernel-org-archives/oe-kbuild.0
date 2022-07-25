Content-Type: multipart/mixed; boundary="===============5475478868559153414=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3505/12552] net/wireless/mlme.c:328 cfg80211_mlme_assoc() warn: variable dereferenced before check 'req->bss' (see line 324)
Date: Mon, 25 Jul 2022 16:58:21 +0000
Message-ID: <202207242103.KGZT4s1I-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5475478868559153414==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   18c107a1f120d095404d141dfad8f594bdc44020
commit: d648c23024bd01333acd2fd5e34bcde0ffb66b16 [3505/12552] wifi: nl80211=
: support MLO in auth/assoc
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-m021-20220718 (https://download.01.org/0day-ci/arch=
ive/20220724/202207242103.KGZT4s1I-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/wireless/mlme.c:328 cfg80211_mlme_assoc() warn: variable dereferenced b=
efore check 'req->bss' (see line 324)
net/wireless/nl80211.c:10682 nl80211_associate() error: uninitialized symbo=
l 'bssid'.

Old smatch warnings:
net/wireless/nl80211.c:277 validate_ie_attr() warn: potential spectre issue=
 'elem->data' [r]
net/wireless/nl80211.c:4992 nl80211_parse_tx_bitrate_mask() warn: potential=
 spectre issue 'rdev->wiphy.bands' [r] (local cap)
net/wireless/nl80211.c:4993 nl80211_parse_tx_bitrate_mask() warn: possible =
spectre second half.  'sband'
net/wireless/nl80211.c:5002 nl80211_parse_tx_bitrate_mask() warn: potential=
 spectre issue 'mask->control' [w] (local cap)
net/wireless/nl80211.c:8861 nl80211_trigger_scan() warn: potential spectre =
issue 'wiphy->bands' [r] (local cap)
net/wireless/nl80211.c:8864 nl80211_trigger_scan() warn: potential spectre =
issue 'request->rates' [r] (local cap)
net/wireless/nl80211.c:9058 nl80211_parse_sched_scan_per_band_rssi() warn: =
potential spectre issue 'match_sets->per_band_rssi_thold' [w] (local cap)

vim +328 net/wireless/mlme.c

ee2aca343c9aa64 Johannes Berg 2013-02-21  294  =

0f7594489a8ab15 Johannes Berg 2022-05-31  295  /* Note: caller must cfg8021=
1_put_bss() regardless of result */
91bf9b26fc95c50 Johannes Berg 2013-05-15  296  int cfg80211_mlme_assoc(stru=
ct cfg80211_registered_device *rdev,
667503ddcb96f3b Johannes Berg 2009-07-07  297  			struct net_device *dev,
f62fab735e99af2 Johannes Berg 2013-02-21  298  			struct cfg80211_assoc_req=
uest *req)
19957bb399e2722 Johannes Berg 2009-07-02  299  {
19957bb399e2722 Johannes Berg 2009-07-02  300  	struct wireless_dev *wdev =
=3D dev->ieee80211_ptr;
d648c23024bd013 Johannes Berg 2022-05-31  301  	int err, i, j;
19957bb399e2722 Johannes Berg 2009-07-02  302  =

667503ddcb96f3b Johannes Berg 2009-07-07  303  	ASSERT_WDEV_LOCK(wdev);
667503ddcb96f3b Johannes Berg 2009-07-07  304  =

d648c23024bd013 Johannes Berg 2022-05-31  305  	for (i =3D 1; i < ARRAY_SIZ=
E(req->links); i++) {
d648c23024bd013 Johannes Berg 2022-05-31  306  		if (!req->links[i].bss)
d648c23024bd013 Johannes Berg 2022-05-31  307  			continue;
d648c23024bd013 Johannes Berg 2022-05-31  308  		for (j =3D 0; j < i; j++) {
d648c23024bd013 Johannes Berg 2022-05-31  309  			if (req->links[i].bss =3D=
=3D req->links[j].bss)
d648c23024bd013 Johannes Berg 2022-05-31  310  				return -EINVAL;
d648c23024bd013 Johannes Berg 2022-05-31  311  		}
d648c23024bd013 Johannes Berg 2022-05-31  312  	}
d648c23024bd013 Johannes Berg 2022-05-31  313  =

7b0a0e3c3a88260 Johannes Berg 2022-04-14  314  	if (wdev->connected &&
7b0a0e3c3a88260 Johannes Berg 2022-04-14  315  	    (!req->prev_bssid ||
7b0a0e3c3a88260 Johannes Berg 2022-04-14  316  	     !ether_addr_equal(wdev=
->u.client.connected_addr, req->prev_bssid)))
19957bb399e2722 Johannes Berg 2009-07-02  317  		return -EALREADY;
19957bb399e2722 Johannes Berg 2009-07-02  318  =

f62fab735e99af2 Johannes Berg 2013-02-21  319  	cfg80211_oper_and_ht_capa(&=
req->ht_capa_mask,
7e7c8926b2f4e34 Ben Greear    2011-11-18  320  				  rdev->wiphy.ht_capa_mo=
d_mask);
f62fab735e99af2 Johannes Berg 2013-02-21  321  	cfg80211_oper_and_vht_capa(=
&req->vht_capa_mask,
ee2aca343c9aa64 Johannes Berg 2013-02-21  322  				   rdev->wiphy.vht_capa_=
mod_mask);
7e7c8926b2f4e34 Ben Greear    2011-11-18  323  =

f62fab735e99af2 Johannes Berg 2013-02-21 @324  	err =3D rdev_assoc(rdev, de=
v, req);
0f7594489a8ab15 Johannes Berg 2022-05-31  325  	if (!err) {
d648c23024bd013 Johannes Berg 2022-05-31  326  		int link_id;
d648c23024bd013 Johannes Berg 2022-05-31  327  =

d648c23024bd013 Johannes Berg 2022-05-31 @328  		if (req->bss) {
0f7594489a8ab15 Johannes Berg 2022-05-31  329  			cfg80211_ref_bss(&rdev->w=
iphy, req->bss);
f1940c5730f0f05 Johannes Berg 2013-06-19  330  			cfg80211_hold_bss(bss_fro=
m_pub(req->bss));
0f7594489a8ab15 Johannes Berg 2022-05-31  331  		}
d648c23024bd013 Johannes Berg 2022-05-31  332  =

d648c23024bd013 Johannes Berg 2022-05-31  333  		for (link_id =3D 0; link_i=
d < ARRAY_SIZE(req->links); link_id++) {
d648c23024bd013 Johannes Berg 2022-05-31  334  			if (!req->links[link_id].=
bss)
d648c23024bd013 Johannes Berg 2022-05-31  335  				continue;
d648c23024bd013 Johannes Berg 2022-05-31  336  			cfg80211_ref_bss(&rdev->w=
iphy, req->links[link_id].bss);
d648c23024bd013 Johannes Berg 2022-05-31  337  			cfg80211_hold_bss(bss_fro=
m_pub(req->links[link_id].bss));
d648c23024bd013 Johannes Berg 2022-05-31  338  		}
d648c23024bd013 Johannes Berg 2022-05-31  339  	}
19957bb399e2722 Johannes Berg 2009-07-02  340  	return err;
19957bb399e2722 Johannes Berg 2009-07-02  341  }
19957bb399e2722 Johannes Berg 2009-07-02  342  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5475478868559153414==--

