Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22DDC7F
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Feb 2023 07:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676618145; x=1708154145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XaNcDSIAHzvd5nkhH+sbez/CuQygbHhdLW16J07Eff4=;
  b=OoG+sdBeX9gP56oO923scuUsNwrZv/TfywbeQ/yS2aOf9+kkGyAdc+Jk
   p0mXr3Q+NKPEkx75CbnDujTrQWkOb4giHp8pokEceSFgduE3pDf+EtoC4
   52VSevN4Qm2bfump8J1qhaoO2jcBBnzveNtSOagCLLXdPN83hVec9/2IY
   OMbVZbpamhwIfwL98l5PbL2Dh/igvTZTc1AB2R4x4Z3MFaOOMcgt6ajKY
   Mq0GmNG+IblyuWqaIQKOr838jaceIR0z16cGwEZ6kgMeUAOQzI4+p3F5Z
   ca88z5Vd6ZAkp5pKOyyO4y8bhpytADnn+A9F2aZKHJ6MQYa5Dd3zP1h2x
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="320033244"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="320033244"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 23:13:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="700813055"
X-IronPort-AV: E=Sophos;i="5.97,304,1669104000"; 
   d="scan'208";a="700813055"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 16 Feb 2023 23:13:02 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSuvV-000BCI-2v;
	Fri, 17 Feb 2023 07:13:01 +0000
Date: Fri, 17 Feb 2023 15:12:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 12375/13499] net/mac80211/rx.c:2947
 __ieee80211_rx_h_amsdu() error: we previously assumed 'rx->sta' could be
 null (see line 2933)
Message-ID: <202302171502.xQfQ6Rhu-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Felix Fietkau <nbd@nbd.name>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c068f40300a0eaa34f7105d137a5560b86951aa9
commit: 6e4c0d0460bd32ca9244dff3ba2d2da27235de11 [12375/13499] wifi: mac80211: add a workaround for receiving non-standard mesh A-MSDU
:::::: branch date: 3 hours ago
:::::: commit date: 3 days ago
config: parisc-randconfig-m031-20230213 (https://download.01.org/0day-ci/archive/20230217/202302171502.xQfQ6Rhu-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302171502.xQfQ6Rhu-lkp@intel.com/

New smatch warnings:
net/mac80211/rx.c:2947 __ieee80211_rx_h_amsdu() error: we previously assumed 'rx->sta' could be null (see line 2933)

Old smatch warnings:
net/mac80211/rx.c:888 ieee80211_rx_monitor() warn: variable dereferenced before check 'origskb' (see line 781)

vim +2947 net/mac80211/rx.c

986e43b19ae917 Felix Fietkau   2023-02-13  2890  
49461622edf74c Johannes Berg   2008-06-30  2891  static ieee80211_rx_result debug_noinline
24bba078eca099 Felix Fietkau   2018-02-27  2892  __ieee80211_rx_h_amsdu(struct ieee80211_rx_data *rx, u8 data_offset)
fd4c7f2fce1737 Ron Rindjunsky  2007-11-26  2893  {
eb9fb5b8883535 Johannes Berg   2009-11-16  2894  	struct net_device *dev = rx->sdata->dev;
eaf85ca7fecb21 Zhu Yi          2009-12-01  2895  	struct sk_buff *skb = rx->skb;
358c8d9d332230 Harvey Harrison 2008-07-15  2896  	struct ieee80211_hdr *hdr = (struct ieee80211_hdr *)skb->data;
358c8d9d332230 Harvey Harrison 2008-07-15  2897  	__le16 fc = hdr->frame_control;
eaf85ca7fecb21 Zhu Yi          2009-12-01  2898  	struct sk_buff_head frame_list;
986e43b19ae917 Felix Fietkau   2023-02-13  2899  	static ieee80211_rx_result res;
7f6990c830f3e8 Johannes Berg   2016-10-05  2900  	struct ethhdr ethhdr;
e2b5227faaf331 Johannes Berg   2016-10-05  2901  	const u8 *check_da = ethhdr.h_dest, *check_sa = ethhdr.h_source;
fd4c7f2fce1737 Ron Rindjunsky  2007-11-26  2902  
ea720935cf6686 Johannes Berg   2016-10-05  2903  	if (unlikely(ieee80211_has_a4(hdr->frame_control))) {
e2b5227faaf331 Johannes Berg   2016-10-05  2904  		check_da = NULL;
e2b5227faaf331 Johannes Berg   2016-10-05  2905  		check_sa = NULL;
e2b5227faaf331 Johannes Berg   2016-10-05  2906  	} else switch (rx->sdata->vif.type) {
e2b5227faaf331 Johannes Berg   2016-10-05  2907  		case NL80211_IFTYPE_AP:
e2b5227faaf331 Johannes Berg   2016-10-05  2908  		case NL80211_IFTYPE_AP_VLAN:
e2b5227faaf331 Johannes Berg   2016-10-05  2909  			check_da = NULL;
e2b5227faaf331 Johannes Berg   2016-10-05  2910  			break;
e2b5227faaf331 Johannes Berg   2016-10-05  2911  		case NL80211_IFTYPE_STATION:
e2b5227faaf331 Johannes Berg   2016-10-05  2912  			if (!rx->sta ||
e2b5227faaf331 Johannes Berg   2016-10-05  2913  			    !test_sta_flag(rx->sta, WLAN_STA_TDLS_PEER))
e2b5227faaf331 Johannes Berg   2016-10-05  2914  				check_sa = NULL;
e2b5227faaf331 Johannes Berg   2016-10-05  2915  			break;
e2b5227faaf331 Johannes Berg   2016-10-05  2916  		case NL80211_IFTYPE_MESH_POINT:
e2b5227faaf331 Johannes Berg   2016-10-05  2917  			check_sa = NULL;
986e43b19ae917 Felix Fietkau   2023-02-13  2918  			check_da = NULL;
e2b5227faaf331 Johannes Berg   2016-10-05  2919  			break;
e2b5227faaf331 Johannes Berg   2016-10-05  2920  		default:
e2b5227faaf331 Johannes Berg   2016-10-05  2921  			break;
ea720935cf6686 Johannes Berg   2016-10-05  2922  	}
fd4c7f2fce1737 Ron Rindjunsky  2007-11-26  2923  
eaf85ca7fecb21 Zhu Yi          2009-12-01  2924  	skb->dev = dev;
eaf85ca7fecb21 Zhu Yi          2009-12-01  2925  	__skb_queue_head_init(&frame_list);
fd4c7f2fce1737 Ron Rindjunsky  2007-11-26  2926  
7f6990c830f3e8 Johannes Berg   2016-10-05  2927  	if (ieee80211_data_to_8023_exthdr(skb, &ethhdr,
7f6990c830f3e8 Johannes Berg   2016-10-05  2928  					  rx->sdata->vif.addr,
24bba078eca099 Felix Fietkau   2018-02-27  2929  					  rx->sdata->vif.type,
a1d5ff5651ea59 Mathy Vanhoef   2021-05-11  2930  					  data_offset, true))
7f6990c830f3e8 Johannes Berg   2016-10-05  2931  		return RX_DROP_UNUSABLE;
7f6990c830f3e8 Johannes Berg   2016-10-05  2932  
6e4c0d0460bd32 Felix Fietkau   2023-02-13 @2933  	if (rx->sta && rx->sta->amsdu_mesh_control < 0) {
6e4c0d0460bd32 Felix Fietkau   2023-02-13  2934  		bool valid_std = ieee80211_is_valid_amsdu(skb, true);
6e4c0d0460bd32 Felix Fietkau   2023-02-13  2935  		bool valid_nonstd = ieee80211_is_valid_amsdu(skb, false);
6e4c0d0460bd32 Felix Fietkau   2023-02-13  2936  
6e4c0d0460bd32 Felix Fietkau   2023-02-13  2937  		if (valid_std && !valid_nonstd)
6e4c0d0460bd32 Felix Fietkau   2023-02-13  2938  			rx->sta->amsdu_mesh_control = 1;
6e4c0d0460bd32 Felix Fietkau   2023-02-13  2939  		else if (valid_nonstd && !valid_std)
6e4c0d0460bd32 Felix Fietkau   2023-02-13  2940  			rx->sta->amsdu_mesh_control = 0;
6e4c0d0460bd32 Felix Fietkau   2023-02-13  2941  	}
6e4c0d0460bd32 Felix Fietkau   2023-02-13  2942  
eaf85ca7fecb21 Zhu Yi          2009-12-01  2943  	ieee80211_amsdu_to_8023s(skb, &frame_list, dev->dev_addr,
eaf85ca7fecb21 Zhu Yi          2009-12-01  2944  				 rx->sdata->vif.type,
8b935ee2ea17db Johannes Berg   2016-10-05  2945  				 rx->local->hw.extra_tx_headroom,
6e4c0d0460bd32 Felix Fietkau   2023-02-13  2946  				 check_da, check_sa,
6e4c0d0460bd32 Felix Fietkau   2023-02-13 @2947  				 rx->sta->amsdu_mesh_control);
fd4c7f2fce1737 Ron Rindjunsky  2007-11-26  2948  
eaf85ca7fecb21 Zhu Yi          2009-12-01  2949  	while (!skb_queue_empty(&frame_list)) {
eaf85ca7fecb21 Zhu Yi          2009-12-01  2950  		rx->skb = __skb_dequeue(&frame_list);
fd4c7f2fce1737 Ron Rindjunsky  2007-11-26  2951  
986e43b19ae917 Felix Fietkau   2023-02-13  2952  		res = ieee80211_rx_mesh_data(rx->sdata, rx->sta, rx->skb);
986e43b19ae917 Felix Fietkau   2023-02-13  2953  		switch (res) {
986e43b19ae917 Felix Fietkau   2023-02-13  2954  		case RX_QUEUED:
ce3edf6d0b979f Johannes Berg   2007-12-19  2955  			continue;
986e43b19ae917 Felix Fietkau   2023-02-13  2956  		case RX_CONTINUE:
986e43b19ae917 Felix Fietkau   2023-02-13  2957  			break;
986e43b19ae917 Felix Fietkau   2023-02-13  2958  		default:
986e43b19ae917 Felix Fietkau   2023-02-13  2959  			goto free;
ce3edf6d0b979f Johannes Berg   2007-12-19  2960  		}
fd4c7f2fce1737 Ron Rindjunsky  2007-11-26  2961  
986e43b19ae917 Felix Fietkau   2023-02-13  2962  		if (!ieee80211_frame_allowed(rx, fc))
986e43b19ae917 Felix Fietkau   2023-02-13  2963  			goto free;
986e43b19ae917 Felix Fietkau   2023-02-13  2964  
fd4c7f2fce1737 Ron Rindjunsky  2007-11-26  2965  		ieee80211_deliver_skb(rx);
986e43b19ae917 Felix Fietkau   2023-02-13  2966  		continue;
986e43b19ae917 Felix Fietkau   2023-02-13  2967  
986e43b19ae917 Felix Fietkau   2023-02-13  2968  free:
986e43b19ae917 Felix Fietkau   2023-02-13  2969  		dev_kfree_skb(rx->skb);
fd4c7f2fce1737 Ron Rindjunsky  2007-11-26  2970  	}
fd4c7f2fce1737 Ron Rindjunsky  2007-11-26  2971  
9ae54c8463691b Johannes Berg   2008-01-31  2972  	return RX_QUEUED;
fd4c7f2fce1737 Ron Rindjunsky  2007-11-26  2973  }
fd4c7f2fce1737 Ron Rindjunsky  2007-11-26  2974  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
