Content-Type: multipart/mixed; boundary="===============5605992021052450199=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/wireless/sme.c:782 __cfg80211_connect_result() error: we previously assumed 'cr->bss' could be null (see line 733)
Date: Wed, 23 Feb 2022 04:16:46 +0800
Message-ID: <202202230424.WSCoRj8c-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5605992021052450199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   038101e6b2cd5c55f888f85db42ea2ad3aecb4b6
commit: 1e688dd2a3d6759d416616ff07afc4bb836c4213 powerpc/bug: Provide bette=
r flexibility to WARN_ON/__WARN_FLAGS() with asm goto
date:   6 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 6 months ago
config: powerpc64-randconfig-m031-20220220 (https://download.01.org/0day-ci=
/archive/20220223/202202230424.WSCoRj8c-lkp(a)intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/wireless/sme.c:782 __cfg80211_connect_result() error: we previously ass=
umed 'cr->bss' could be null (see line 733)

vim +782 net/wireless/sme.c

e45cd82ace91b71 Johannes Berg             2009-07-02  726  =

5349a0f7bfbdd7d Vidyullatha Kanchanapally 2017-03-31  727  	if (!cr->bss &&=
 (cr->status =3D=3D WLAN_STATUS_SUCCESS)) {
f26cbf401be935e Zhao, Gang                2014-04-21  728  		WARN_ON_ONCE(!=
wiphy_to_rdev(wdev->wiphy)->ops->connect);
5349a0f7bfbdd7d Vidyullatha Kanchanapally 2017-03-31  729  		cr->bss =3D cf=
g80211_get_bss(wdev->wiphy, NULL, cr->bssid,
4c4d684a55fc01d Ujjal Roy                 2013-12-04  730  					   wdev->ss=
id, wdev->ssid_len,
34d505193bd1066 Lior David                2016-01-28  731  					   wdev->co=
nn_bss_type,
6eb18137643fee5 Dedy Lansky               2015-02-08  732  					   IEEE8021=
1_PRIVACY_ANY);
5349a0f7bfbdd7d Vidyullatha Kanchanapally 2017-03-31 @733  		if (cr->bss)
5349a0f7bfbdd7d Vidyullatha Kanchanapally 2017-03-31  734  			cfg80211_hold=
_bss(bss_from_pub(cr->bss));
4c4d684a55fc01d Ujjal Roy                 2013-12-04  735  	}
4c4d684a55fc01d Ujjal Roy                 2013-12-04  736  =

df7fc0f9735085b Johannes Berg             2009-07-29  737  	if (wdev->curre=
nt_bss) {
df7fc0f9735085b Johannes Berg             2009-07-29  738  		cfg80211_unhol=
d_bss(wdev->current_bss);
5b112d3d098c97b Johannes Berg             2013-02-01  739  		cfg80211_put_b=
ss(wdev->wiphy, &wdev->current_bss->pub);
df7fc0f9735085b Johannes Berg             2009-07-29  740  		wdev->current_=
bss =3D NULL;
df7fc0f9735085b Johannes Berg             2009-07-29  741  	}
df7fc0f9735085b Johannes Berg             2009-07-29  742  =

5349a0f7bfbdd7d Vidyullatha Kanchanapally 2017-03-31  743  	if (cr->status =
!=3D WLAN_STATUS_SUCCESS) {
453431a54934d91 Waiman Long               2020-08-06  744  		kfree_sensitiv=
e(wdev->connect_keys);
fffd0934b9390f3 Johannes Berg             2009-07-08  745  		wdev->connect_=
keys =3D NULL;
8dadadb7e977a91 Johannes Berg             2009-08-04  746  		wdev->ssid_len=
 =3D 0;
bd2522b16884710 Andrzej Zaborowski        2017-01-06  747  		wdev->conn_own=
er_nlportid =3D 0;
5349a0f7bfbdd7d Vidyullatha Kanchanapally 2017-03-31  748  		if (cr->bss) {
5349a0f7bfbdd7d Vidyullatha Kanchanapally 2017-03-31  749  			cfg80211_unho=
ld_bss(bss_from_pub(cr->bss));
5349a0f7bfbdd7d Vidyullatha Kanchanapally 2017-03-31  750  			cfg80211_put_=
bss(wdev->wiphy, cr->bss);
f1940c5730f0f05 Johannes Berg             2013-06-19  751  		}
c1fbb258846dfc4 Eliad Peller              2014-04-30  752  		cfg80211_sme_f=
ree(wdev);
fffd0934b9390f3 Johannes Berg             2009-07-08  753  		return;
fffd0934b9390f3 Johannes Berg             2009-07-08  754  	}
fffd0934b9390f3 Johannes Berg             2009-07-08  755  =

5349a0f7bfbdd7d Vidyullatha Kanchanapally 2017-03-31  756  	if (WARN_ON(!cr=
->bss))
b23aa676ab9d544 Samuel Ortiz              2009-07-01  757  		return;
f1940c5730f0f05 Johannes Berg             2013-06-19  758  =

5349a0f7bfbdd7d Vidyullatha Kanchanapally 2017-03-31  759  	wdev->current_b=
ss =3D bss_from_pub(cr->bss);
b23aa676ab9d544 Samuel Ortiz              2009-07-01  760  =

b8676221f00dd5b David Spinadel            2016-09-22  761  	if (!(wdev->wip=
hy->flags & WIPHY_FLAG_HAS_STATIC_WEP))
fffd0934b9390f3 Johannes Berg             2009-07-08  762  		cfg80211_uploa=
d_connect_keys(wdev);
8b19e6ca3bac7e0 Luis R. Rodriguez         2009-07-30  763  =

9caf03640279e64 Johannes Berg             2012-11-29  764  	rcu_read_lock();
5349a0f7bfbdd7d Vidyullatha Kanchanapally 2017-03-31  765  	country_ie =3D =
ieee80211_bss_get_ie(cr->bss, WLAN_EID_COUNTRY);
9caf03640279e64 Johannes Berg             2012-11-29  766  	if (!country_ie=
) {
9caf03640279e64 Johannes Berg             2012-11-29  767  		rcu_read_unloc=
k();
9caf03640279e64 Johannes Berg             2012-11-29  768  		return;
9caf03640279e64 Johannes Berg             2012-11-29  769  	}
9caf03640279e64 Johannes Berg             2012-11-29  770  =

9caf03640279e64 Johannes Berg             2012-11-29  771  	country_ie =3D =
kmemdup(country_ie, 2 + country_ie[1], GFP_ATOMIC);
9caf03640279e64 Johannes Berg             2012-11-29  772  	rcu_read_unlock=
();
8b19e6ca3bac7e0 Luis R. Rodriguez         2009-07-30  773  =

8b19e6ca3bac7e0 Luis R. Rodriguez         2009-07-30  774  	if (!country_ie)
8b19e6ca3bac7e0 Luis R. Rodriguez         2009-07-30  775  		return;
8b19e6ca3bac7e0 Luis R. Rodriguez         2009-07-30  776  =

8b19e6ca3bac7e0 Luis R. Rodriguez         2009-07-30  777  	/*
8b19e6ca3bac7e0 Luis R. Rodriguez         2009-07-30  778  	 * ieee80211_bs=
s_get_ie() ensures we can access:
8b19e6ca3bac7e0 Luis R. Rodriguez         2009-07-30  779  	 * - country_ie=
 + 2, the start of the country ie data, and
8b19e6ca3bac7e0 Luis R. Rodriguez         2009-07-30  780  	 * - and countr=
y_ie[1] which is the IE length
8b19e6ca3bac7e0 Luis R. Rodriguez         2009-07-30  781  	 */
5349a0f7bfbdd7d Vidyullatha Kanchanapally 2017-03-31 @782  	regulatory_hint=
_country_ie(wdev->wiphy, cr->bss->channel->band,
1a9193185f462a5 Johannes Berg             2012-12-03  783  				   country_i=
e + 2, country_ie[1]);
9caf03640279e64 Johannes Berg             2012-11-29  784  	kfree(country_i=
e);
b23aa676ab9d544 Samuel Ortiz              2009-07-01  785  }
f21293549f60f88 Johannes Berg             2009-07-01  786  =


:::::: The code at line 782 was first introduced by commit
:::::: 5349a0f7bfbdd7d81b8418c707dcd1439c714647 cfg80211: Use a structure t=
o pass connect response params

:::::: TO: Vidyullatha Kanchanapally <vkanchan@qti.qualcomm.com>
:::::: CC: Johannes Berg <johannes.berg@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5605992021052450199==--

