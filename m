Content-Type: multipart/mixed; boundary="===============4362766052209511808=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/mac80211/tx.c:2916 ieee80211_build_hdr() error: testing array offset 'link_id' after use.
Date: Thu, 25 Aug 2022 06:52:40 +0800
Message-ID: <202208250601.jXpUIekb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4362766052209511808==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c40e8341e3b3bb27e3a65b06b5b454626234c4f0
commit: 9dd1953846c7cd58100a5c6bd90db54e2c60668a wifi: nl80211/mac80211: cl=
arify link ID in control port TX
date:   5 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 weeks ago
config: openrisc-randconfig-m031-20220824 (https://download.01.org/0day-ci/=
archive/20220825/202208250601.jXpUIekb-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
net/mac80211/tx.c:2916 ieee80211_build_hdr() error: testing array offset 'l=
ink_id' after use.

Old smatch warnings:
net/mac80211/tx.c:1846 invoke_tx_handlers_late() warn: variable dereference=
d before check 'tx->skb' (see line 1821)
net/mac80211/tx.c:3509 ieee80211_xmit_fast_finish() error: we previously as=
sumed 'key' could be null (see line 3477)

vim +/link_id +2916 net/mac80211/tx.c

33b64eb2b1b1759 Luis Carlos Cobo 2008-02-23  2877  =

065e9605f941b8b Harvey Harrison  2008-06-22  2878  	if (ieee80211_is_data_q=
os(fc)) {
c29b9b9b0235d56 Johannes Berg    2007-09-14  2879  		__le16 *qos_control;
c29b9b9b0235d56 Johannes Berg    2007-09-14  2880  =

d58ff35122847a8 Johannes Berg    2017-06-16  2881  		qos_control =3D skb_pu=
sh(skb, 2);
c29b9b9b0235d56 Johannes Berg    2007-09-14  2882  		memcpy(skb_push(skb, h=
drlen - 2), &hdr, hdrlen - 2);
c29b9b9b0235d56 Johannes Berg    2007-09-14  2883  		/*
c29b9b9b0235d56 Johannes Berg    2007-09-14  2884  		 * Maybe we could actu=
ally set some fields here, for now just
c29b9b9b0235d56 Johannes Berg    2007-09-14  2885  		 * initialise to zero =
to indicate no special operation.
c29b9b9b0235d56 Johannes Berg    2007-09-14  2886  		 */
c29b9b9b0235d56 Johannes Berg    2007-09-14  2887  		*qos_control =3D 0;
c29b9b9b0235d56 Johannes Berg    2007-09-14  2888  	} else
e2ebc74d7e3d716 Johannes Berg    2007-07-27  2889  		memcpy(skb_push(skb, h=
drlen), &hdr, hdrlen);
c29b9b9b0235d56 Johannes Berg    2007-09-14  2890  =

d57a544d71092a8 Zhang Shengju    2016-03-03  2891  	skb_reset_mac_header(sk=
b);
e2ebc74d7e3d716 Johannes Berg    2007-07-27  2892  =

489ee9195a7de9e Felix Fietkau    2010-12-18  2893  	info =3D IEEE80211_SKB_=
CB(skb);
3b8d81e020f77c9 Johannes Berg    2009-06-17  2894  	memset(info, 0, sizeof(=
*info));
3b8d81e020f77c9 Johannes Berg    2009-06-17  2895  =

a729cff8ad5120d Johannes Berg    2011-11-06  2896  	info->flags =3D info_fl=
ags;
a729cff8ad5120d Johannes Berg    2011-11-06  2897  	info->ack_frame_id =3D =
info_id;
73c4e195e6396ee Johannes Berg    2014-11-09  2898  	info->band =3D band;
9dd1953846c7cd5 Johannes Berg    2022-07-19  2899  =

9dd1953846c7cd5 Johannes Berg    2022-07-19  2900  	if (likely(!cookie)) {
9dd1953846c7cd5 Johannes Berg    2022-07-19  2901  		ctrl_flags |=3D u32_en=
code_bits(link_id,
69d41b5a9c9d8d2 Johannes Berg    2022-06-09  2902  					      IEEE80211_TX_=
CTRL_MLO_LINK);
9dd1953846c7cd5 Johannes Berg    2022-07-19  2903  	} else {
9dd1953846c7cd5 Johannes Berg    2022-07-19  2904  		unsigned int pre_conf_=
link_id;
9dd1953846c7cd5 Johannes Berg    2022-07-19  2905  =

9dd1953846c7cd5 Johannes Berg    2022-07-19  2906  		/*
9dd1953846c7cd5 Johannes Berg    2022-07-19  2907  		 * ctrl_flags already =
have been set by
9dd1953846c7cd5 Johannes Berg    2022-07-19  2908  		 * ieee80211_tx_contro=
l_port(), here
9dd1953846c7cd5 Johannes Berg    2022-07-19  2909  		 * we just sanity chec=
k that
9dd1953846c7cd5 Johannes Berg    2022-07-19  2910  		 */
9dd1953846c7cd5 Johannes Berg    2022-07-19  2911  =

9dd1953846c7cd5 Johannes Berg    2022-07-19  2912  		pre_conf_link_id =3D u=
32_get_bits(ctrl_flags,
9dd1953846c7cd5 Johannes Berg    2022-07-19  2913  						IEEE80211_TX_CTRL_=
MLO_LINK);
9dd1953846c7cd5 Johannes Berg    2022-07-19  2914  =

9dd1953846c7cd5 Johannes Berg    2022-07-19  2915  		if (pre_conf_link_id !=
=3D link_id &&
9dd1953846c7cd5 Johannes Berg    2022-07-19 @2916  		    link_id !=3D IEEE8=
0211_LINK_UNSPECIFIED) {
9dd1953846c7cd5 Johannes Berg    2022-07-19  2917  #ifdef CPTCFG_MAC80211_V=
ERBOSE_DEBUG
9dd1953846c7cd5 Johannes Berg    2022-07-19  2918  			net_info_ratelimited(=
"%s: dropped frame to %pM with bad link ID request (%d vs. %d)\n",
9dd1953846c7cd5 Johannes Berg    2022-07-19  2919  					     sdata->name, h=
dr.addr1,
9dd1953846c7cd5 Johannes Berg    2022-07-19  2920  					     pre_conf_link_=
id, link_id);
9dd1953846c7cd5 Johannes Berg    2022-07-19  2921  #endif
9dd1953846c7cd5 Johannes Berg    2022-07-19  2922  			ret =3D -EINVAL;
9dd1953846c7cd5 Johannes Berg    2022-07-19  2923  			goto free;
9dd1953846c7cd5 Johannes Berg    2022-07-19  2924  		}
9dd1953846c7cd5 Johannes Berg    2022-07-19  2925  	}
9dd1953846c7cd5 Johannes Berg    2022-07-19  2926  =

9dd1953846c7cd5 Johannes Berg    2022-07-19  2927  	info->control.flags =3D=
 ctrl_flags;
a729cff8ad5120d Johannes Berg    2011-11-06  2928  =

4c9451ed94087ab Johannes Berg    2014-11-09  2929  	return skb;
4c9451ed94087ab Johannes Berg    2014-11-09  2930   free:
4c9451ed94087ab Johannes Berg    2014-11-09  2931  	kfree_skb(skb);
4c9451ed94087ab Johannes Berg    2014-11-09  2932  	return ERR_PTR(ret);
4c9451ed94087ab Johannes Berg    2014-11-09  2933  }
e2ebc74d7e3d716 Johannes Berg    2007-07-27  2934  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4362766052209511808==--

