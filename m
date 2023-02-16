Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9094C747A;
	Thu, 16 Feb 2023 15:52:20 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id v11so2058627edx.12;
        Thu, 16 Feb 2023 07:52:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sWKfj8YDGkl6WPwwzJhD3FgMzz5P3+ciTkv5Vv3HxHI=;
        b=SphygXkN8/gTVarkLMkQOclDyO1OBz129V+zg3o7MEA/XXd0/9MXIjwxxsEZ3M/wQe
         etpUiXCb2nl3nA9wWhnyNtNDWxkN3EtHrKZNTmNHGZC94Ch93BHJWY/FLam8Zyz9zGr/
         0Cs50xd0pYBk/yjeCAJ8+IjgMtqZE1/PVMJWnjCyEv4n96WcdiTrOHi34idrYV4BdHGo
         ZAoiN4q7VphVEGeCNFF8r1BXY6wLt0d+X1u9SQG3BqgqSjvIsxGVWsH69oRFTge2Tq4C
         CptTbEV0vAYpv25MuEhvCMn7ZL02uh5QEa+ojNlFM7SeGzY/Nr/Z78eNxuS0BAbapIhH
         N7Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sWKfj8YDGkl6WPwwzJhD3FgMzz5P3+ciTkv5Vv3HxHI=;
        b=4kZ6qGsh0QulL4HHFsYaX2JyUL1VejASZbJwjhlQfv/I02lyfLcKhDgLXkFlbDQC1E
         al4PIPYbzZvifV0EEw/2DfZmrgTPPOxAFA+ueHLFObzawEFQn5xF7UP3/RR9eIyXENCL
         pZ8d+76Z5G/tT1t93CJED32GTfpTHKolcJVlFpDvAo7P+NW2l3682EbZm71E3j2u2+mv
         2ssuXOQhvmXFUY0XVAE39RZkg4obLVWeQZb83oAlP/XvIAVCKAK3bFgjbHERfaTXgM9K
         xACbKGKhiSweweu9pRTdx7ZzkI++kAvvFhth+Ey0scuFFO9Cnl60uFLEhEw45WUBKKMv
         7U0Q==
X-Gm-Message-State: AO0yUKXv2pZKBrwuBa4AnMhrhPNWb3ZjViEhh5XAuarwaCSAfNdB0cB6
	1rhGuFm+exONPlS74WLI47rhv9MNVawhbg==
X-Google-Smtp-Source: AK7set+xvXc/Vys5PTRobYC2LB6yIj+RLxSdJ8Q5d7uPP2IojGZbb1Y81noeHUaGjH2XSZOOtBbUlA==
X-Received: by 2002:a17:906:454:b0:8aa:a802:adcd with SMTP id e20-20020a170906045400b008aaa802adcdmr6052502eja.30.1676562738409;
        Thu, 16 Feb 2023 07:52:18 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id lf17-20020a170907175100b008b14516382bsm940809ejc.129.2023.02.16.07.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 07:52:18 -0800 (PST)
Date: Thu, 16 Feb 2023 18:52:14 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Johannes Berg <johannes.berg@intel.com>
Subject: [linux-next:master 12385/13217] net/mac80211/rx.c:2947
 __ieee80211_rx_h_amsdu() error: we previously assumed 'rx->sta' could be
 null (see line 2933)
Message-ID: <202302162310.nri8c4a1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230216155214.gTnI0bI-OMC_DwOHHGg7pdwSS_6h18J6m3GTMnXAkBw@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   509583475828c4fd86897113f78315c1431edcc3
commit: 6e4c0d0460bd32ca9244dff3ba2d2da27235de11 [12385/13217] wifi: mac80211: add a workaround for receiving non-standard mesh A-MSDU
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230216/202302162310.nri8c4a1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302162310.nri8c4a1-lkp@intel.com/

New smatch warnings:
net/mac80211/rx.c:2947 __ieee80211_rx_h_amsdu() error: we previously assumed 'rx->sta' could be null (see line 2933)

Old smatch warnings:
net/mac80211/rx.c:888 ieee80211_rx_monitor() warn: variable dereferenced before check 'origskb' (see line 781)

vim +2947 net/mac80211/rx.c

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
                                                            ^^^^^^^
Check for NULL

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
                                                                                 ^^^^^^^
Unchecked dereference

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

