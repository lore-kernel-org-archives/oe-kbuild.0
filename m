Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F413F22616
	for <oe-kbuild@lists.linux.dev>; Fri, 26 Jan 2024 20:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706299523; cv=none; b=joA6jsZNQtTBHv40Kyw3E7QfxntXmgn7CBg6LHUe72MZx8SeiHrI1YSlhGUz2w/J5Oteme8rbCOFXOXA+KKiapPhEKXPxhDjmo/eKjGKV0qv1k39LuzRHoYvdL5nKJrHFnobFE6oq0n6XicE1y7B2Bud2i1hHRGnsgBCQB61hgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706299523; c=relaxed/simple;
	bh=ALEJ/C3IxX00YOaDNnzGxbvw21h/hPL9SSfuDV452tk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r+1g7KmO1L/M6Pu1Fbfti7yO5yGqybHkOy0+KTQ+EXRw/Vu55LfV0p1C8chP+gGq0J+AHiHLiN100Az5h3Hfaii3wBfR5Szn+ztg//ngCOnAP0fCIB3wR3ksGh3Y89b1W+LN8T9P3yLeGFO6ENwyHAH73jeW8jv6qTrataso6Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCgdFTOg; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCgdFTOg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706299521; x=1737835521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ALEJ/C3IxX00YOaDNnzGxbvw21h/hPL9SSfuDV452tk=;
  b=QCgdFTOgFmJLl/HB8BKSgEyqhOiJTeqjBgbAd0t/pnVwHQwrc0tzhObh
   DuutuCb1ZJvzJXxz/EvWBmk1S2actf+YKdziFK5VJKkHGTXHFBSNwfr/H
   JRoNwoHfg0qTsk4os+Mc5XUakdudKKqSpHKszz+ygQSVkoha5aHrrRY1B
   Hn/zjS61bS0mX6sy0/1mMPNsWZ3REuMck4nHcuLJy7e3MEVlcqmll1us7
   1hReQ3l53Z4x9Es8SavPwVX/Xj7CR9BJ2de92bBVZn7w55c+YowCnVpza
   dGrmFycz0IC+QlaKzjFowjxMKlgy5tWAeE+pI0qxpuJaG/lDeG9iH5BHB
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="1488737"
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="1488737"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jan 2024 12:05:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,216,1701158400"; 
   d="scan'208";a="2765042"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 26 Jan 2024 12:05:19 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTSRw-0001JO-2A;
	Fri, 26 Jan 2024 20:05:16 +0000
Date: Sat, 27 Jan 2024 04:04:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/mac80211/tdls.c:871:19-21: WARNING opportunity for max()
Message-ID: <202401270423.ICTURuWU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mukesh Sisodiya <mukesh.sisodiya@intel.com>
CC: Johannes Berg <johannes.berg@intel.com>
CC: Gregory Greenman <gregory.greenman@intel.com>
CC: Benjamin Berg <benjamin.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ecb1b8288dc7ccbdcb3b9df005fa1c0e0c0388a7
commit: 78a7ea370d5f0eb6f3e774e7f6afece1c3a6860f wifi: mac80211: handle TDLS negotiation with MLO
date:   7 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-101-20240126 (https://download.01.org/0day-ci/archive/20240127/202401270423.ICTURuWU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202401270423.ICTURuWU-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/mac80211/tdls.c:871:19-21: WARNING opportunity for max()

vim +871 net/mac80211/tdls.c

95224fe83e5e78 Arik Nemtsov    2014-05-01  856  
c2733905692589 Arik Nemtsov    2014-11-09  857  static struct sk_buff *
c2733905692589 Arik Nemtsov    2014-11-09  858  ieee80211_tdls_build_mgmt_packet_data(struct ieee80211_sub_if_data *sdata,
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  859  				      const u8 *peer, int link_id,
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  860  				      u8 action_code, u8 dialog_token,
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  861  				      u16 status_code, bool initiator,
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  862  				      const u8 *extra_ies, size_t extra_ies_len,
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  863  				      u8 oper_class,
c2733905692589 Arik Nemtsov    2014-11-09  864  				      struct cfg80211_chan_def *chandef)
95224fe83e5e78 Arik Nemtsov    2014-05-01  865  {
95224fe83e5e78 Arik Nemtsov    2014-05-01  866  	struct ieee80211_local *local = sdata->local;
c2733905692589 Arik Nemtsov    2014-11-09  867  	struct sk_buff *skb;
95224fe83e5e78 Arik Nemtsov    2014-05-01  868  	int ret;
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  869  	struct ieee80211_link_data *link;
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  870  
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16 @871  	link_id = link_id >= 0 ? link_id : 0;
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  872  	rcu_read_lock();
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  873  	link = rcu_dereference(sdata->link[link_id]);
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  874  	if (WARN_ON(!link))
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  875  		goto unlock;
95224fe83e5e78 Arik Nemtsov    2014-05-01  876  
c2733905692589 Arik Nemtsov    2014-11-09  877  	skb = netdev_alloc_skb(sdata->dev,
1277b4a9f531e8 Liad Kaufman    2014-11-09  878  			       local->hw.extra_tx_headroom +
95224fe83e5e78 Arik Nemtsov    2014-05-01  879  			       max(sizeof(struct ieee80211_mgmt),
95224fe83e5e78 Arik Nemtsov    2014-05-01  880  				   sizeof(struct ieee80211_tdls_data)) +
95224fe83e5e78 Arik Nemtsov    2014-05-01  881  			       50 + /* supported rates */
b98fb44ffceeac Arik Nemtsov    2015-06-10  882  			       10 + /* ext capab */
40b861a0eeb06b Arik Nemtsov    2014-07-17  883  			       26 + /* max(WMM-info, WMM-param) */
13cc8a4a1d24ff Arik Nemtsov    2014-07-17  884  			       2 + max(sizeof(struct ieee80211_ht_cap),
13cc8a4a1d24ff Arik Nemtsov    2014-07-17  885  				       sizeof(struct ieee80211_ht_operation)) +
fb28ec0ce4acd5 Arik Nemtsov    2015-03-01  886  			       2 + max(sizeof(struct ieee80211_vht_cap),
fb28ec0ce4acd5 Arik Nemtsov    2015-03-01  887  				       sizeof(struct ieee80211_vht_operation)) +
f0d29cb979567f Arik Nemtsov    2014-11-09  888  			       50 + /* supported channels */
2cedd87960a809 Arik Nemtsov    2014-11-09  889  			       3 + /* 40/20 BSS coex */
fb28ec0ce4acd5 Arik Nemtsov    2015-03-01  890  			       4 + /* AID */
a38700dd486f3d Arik Nemtsov    2015-03-18  891  			       4 + /* oper classes */
95224fe83e5e78 Arik Nemtsov    2014-05-01  892  			       extra_ies_len +
95224fe83e5e78 Arik Nemtsov    2014-05-01  893  			       sizeof(struct ieee80211_tdls_lnkie));
95224fe83e5e78 Arik Nemtsov    2014-05-01  894  	if (!skb)
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  895  		goto unlock;
95224fe83e5e78 Arik Nemtsov    2014-05-01  896  
95224fe83e5e78 Arik Nemtsov    2014-05-01  897  	skb_reserve(skb, local->hw.extra_tx_headroom);
95224fe83e5e78 Arik Nemtsov    2014-05-01  898  
95224fe83e5e78 Arik Nemtsov    2014-05-01  899  	switch (action_code) {
95224fe83e5e78 Arik Nemtsov    2014-05-01  900  	case WLAN_TDLS_SETUP_REQUEST:
95224fe83e5e78 Arik Nemtsov    2014-05-01  901  	case WLAN_TDLS_SETUP_RESPONSE:
95224fe83e5e78 Arik Nemtsov    2014-05-01  902  	case WLAN_TDLS_SETUP_CONFIRM:
95224fe83e5e78 Arik Nemtsov    2014-05-01  903  	case WLAN_TDLS_TEARDOWN:
95224fe83e5e78 Arik Nemtsov    2014-05-01  904  	case WLAN_TDLS_DISCOVERY_REQUEST:
a7a6bdd0670feb Arik Nemtsov    2014-11-09  905  	case WLAN_TDLS_CHANNEL_SWITCH_REQUEST:
8a4d32f30d11d6 Arik Nemtsov    2014-11-09  906  	case WLAN_TDLS_CHANNEL_SWITCH_RESPONSE:
c2733905692589 Arik Nemtsov    2014-11-09  907  		ret = ieee80211_prep_tdls_encap_data(local->hw.wiphy,
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  908  						     sdata->dev, link, peer,
95224fe83e5e78 Arik Nemtsov    2014-05-01  909  						     action_code, dialog_token,
95224fe83e5e78 Arik Nemtsov    2014-05-01  910  						     status_code, skb);
95224fe83e5e78 Arik Nemtsov    2014-05-01  911  		break;
95224fe83e5e78 Arik Nemtsov    2014-05-01  912  	case WLAN_PUB_ACTION_TDLS_DISCOVER_RES:
c2733905692589 Arik Nemtsov    2014-11-09  913  		ret = ieee80211_prep_tdls_direct(local->hw.wiphy, sdata->dev,
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  914  						 peer, link, action_code,
95224fe83e5e78 Arik Nemtsov    2014-05-01  915  						 dialog_token, status_code,
95224fe83e5e78 Arik Nemtsov    2014-05-01  916  						 skb);
95224fe83e5e78 Arik Nemtsov    2014-05-01  917  		break;
95224fe83e5e78 Arik Nemtsov    2014-05-01  918  	default:
95224fe83e5e78 Arik Nemtsov    2014-05-01  919  		ret = -ENOTSUPP;
95224fe83e5e78 Arik Nemtsov    2014-05-01  920  		break;
95224fe83e5e78 Arik Nemtsov    2014-05-01  921  	}
95224fe83e5e78 Arik Nemtsov    2014-05-01  922  
95224fe83e5e78 Arik Nemtsov    2014-05-01  923  	if (ret < 0)
95224fe83e5e78 Arik Nemtsov    2014-05-01  924  		goto fail;
95224fe83e5e78 Arik Nemtsov    2014-05-01  925  
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  926  	ieee80211_tdls_add_ies(link, skb, peer, action_code, status_code,
c2733905692589 Arik Nemtsov    2014-11-09  927  			       initiator, extra_ies, extra_ies_len, oper_class,
c2733905692589 Arik Nemtsov    2014-11-09  928  			       chandef);
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  929  	rcu_read_unlock();
c2733905692589 Arik Nemtsov    2014-11-09  930  	return skb;
c2733905692589 Arik Nemtsov    2014-11-09  931  
c2733905692589 Arik Nemtsov    2014-11-09  932  fail:
c2733905692589 Arik Nemtsov    2014-11-09  933  	dev_kfree_skb(skb);
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  934  unlock:
78a7ea370d5f0e Mukesh Sisodiya 2023-06-16  935  	rcu_read_unlock();
c2733905692589 Arik Nemtsov    2014-11-09  936  	return NULL;
c2733905692589 Arik Nemtsov    2014-11-09  937  }
c2733905692589 Arik Nemtsov    2014-11-09  938  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
