Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88A8CD281
	for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 08:40:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="l2toIKnA"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3316d3d11e1so2152109f8f.0
        for <oe-kbuild@lists.linux.dev>; Mon, 27 Nov 2023 00:40:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701074415; x=1701679215; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :from:to:cc:subject:date:message-id:reply-to;
        bh=awMjj1wwjjtbhxeSOrDUmJkKzIc1TOvAP1VaIYVhyB4=;
        b=l2toIKnAMnWbDRtje6lAozWaD9x3/TI6VoQXgXfoQjFEZQB88IIt07gkUX/9eqKnp2
         BomXwqNLBnoo4zkxNWi+/KvxIgta1fQyEnkH+zXhG6V2kQgb7v02DvsR2nBohp4IeBZV
         idySuUz71amOcXNAz5n4/O09iQNvUXLRxJ9hPK4kIGDuafHXhoQi87e3kuGub8dYh4lY
         9pQ4xNomIILJOpDIwgL8OzdAizB5amEd+RQwZP7pRLdmqgCyHFr+vbyA3rDvR1xKtpBL
         mDjqvTRhdMevJ9B+FYNGoAJ3nDyW67wsQIg3loTlj7bR5I3WOcbqB9L9fi0RcPsMgw+9
         lAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701074415; x=1701679215;
        h=content-disposition:mime-version:message-id:subject:cc:to:date:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=awMjj1wwjjtbhxeSOrDUmJkKzIc1TOvAP1VaIYVhyB4=;
        b=mRgJ7Z0Xrd9AUlV5U69/hUDPhZFoHqByMFWW9xz4KJVe+Kn9dB/zwIMDACjdrNr+je
         4OZUeBUeMPNh6+mzZD0lKB84XHMZciP7ZYTEnFcKJifUEjkIfBrZtZ+x9OmqbCyifERi
         QUPaeZx7T4+JUaXw3LgnSd55PBUsJHVlbXUroMFfzmQw4hh2xdIVa6OryC2k4y9im/T7
         5Zn8Xfk2saAndC1yLQ8tG0/yZ2QPUuizyQQxNm0BFy/Nkb+ZRHrLbeJ8qCSbp8S0Dbpf
         hPvzZGn5936BdlrWhAvUIveL2xD57Etj6MLhasnCe8s84jXn08d1hEtktljI5xYoiLP2
         J7Yg==
X-Gm-Message-State: AOJu0Ywi5BGv3/sjTAiwJOswEcdcUvQaUipV89SdpmsTOJG97qEvd/2X
	ISlh4joJBoMPem3G/lh3UES2wL5MMG0GYzUleuk=
X-Google-Smtp-Source: AGHT+IHs7+vl2dXMbfBG7lM+Dhbkyr6wxdZgrF/7HEcN/ll3mbyId9SC+Nm3hyT1Watz+jvEAwZ/5Q==
X-Received: by 2002:a5d:4e89:0:b0:32f:7ff9:b731 with SMTP id e9-20020a5d4e89000000b0032f7ff9b731mr10343900wru.1.1701074415231;
        Mon, 27 Nov 2023 00:40:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m5-20020a5d56c5000000b00332cbd59f8bsm11263255wrw.25.2023.11.27.00.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Nov 2023 00:40:15 -0800 (PST)
From: Dan Carpenter <dan.carpenter@linaro.org>
X-Google-Original-From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Mon, 27 Nov 2023 11:40:12 +0300
To: oe-kbuild@lists.linux.dev, Johannes Berg <johannes.berg@intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gregory Greenman <gregory.greenman@intel.com>
Subject: drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c:711
 iwl_mvm_mld_add_sta() warn: missing error code 'ret'
Message-ID: <5db1bb80-5f08-449d-854e-36fbd8ab1d0b@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2da77f431ac49b5763b88751a75f70daa46296c
commit: 3aa80d31869bc2ba86f709843f7dbe1514ea10bb wifi: iwlwifi: mvm: check for iwl_mvm_mld_update_sta() errors
config: powerpc-randconfig-r071-20231126 (https://download.01.org/0day-ci/archive/20231127/202311270524.6QM9aKuf-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231127/202311270524.6QM9aKuf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311270524.6QM9aKuf-lkp@intel.com/

smatch warnings:
drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c:711 iwl_mvm_mld_add_sta() warn: missing error code 'ret'

vim +/ret +711 drivers/net/wireless/intel/iwlwifi/mvm/mld-sta.c

57974a55d99546 Gregory Greenman 2023-03-28  670  int iwl_mvm_mld_add_sta(struct iwl_mvm *mvm, struct ieee80211_vif *vif,
57974a55d99546 Gregory Greenman 2023-03-28  671  			struct ieee80211_sta *sta)
57974a55d99546 Gregory Greenman 2023-03-28  672  {
57974a55d99546 Gregory Greenman 2023-03-28  673  	struct iwl_mvm_vif *mvm_vif = iwl_mvm_vif_from_mac80211(vif);
57974a55d99546 Gregory Greenman 2023-03-28  674  	struct iwl_mvm_sta *mvm_sta = iwl_mvm_sta_from_mac80211(sta);
57974a55d99546 Gregory Greenman 2023-03-28  675  	unsigned long link_sta_added_to_fw = 0;
57974a55d99546 Gregory Greenman 2023-03-28  676  	struct ieee80211_link_sta *link_sta;
57974a55d99546 Gregory Greenman 2023-03-28  677  	int ret = 0;
57974a55d99546 Gregory Greenman 2023-03-28  678  	unsigned int link_id;
57974a55d99546 Gregory Greenman 2023-03-28  679  
57974a55d99546 Gregory Greenman 2023-03-28  680  	lockdep_assert_held(&mvm->mutex);
57974a55d99546 Gregory Greenman 2023-03-28  681  
57974a55d99546 Gregory Greenman 2023-03-28  682  	if (!test_bit(IWL_MVM_STATUS_IN_HW_RESTART, &mvm->status)) {
57974a55d99546 Gregory Greenman 2023-03-28  683  		ret = iwl_mvm_mld_alloc_sta_links(mvm, vif, sta);
87f7e2435cb7dd Miri Korenblit   2023-03-28  684  		if (ret)
87f7e2435cb7dd Miri Korenblit   2023-03-28  685  			return ret;
87f7e2435cb7dd Miri Korenblit   2023-03-28  686  
57974a55d99546 Gregory Greenman 2023-03-28  687  		spin_lock_init(&mvm_sta->lock);
57974a55d99546 Gregory Greenman 2023-03-28  688  
57974a55d99546 Gregory Greenman 2023-03-28  689  		ret = iwl_mvm_sta_init(mvm, vif, sta, IWL_MVM_INVALID_STA,
57974a55d99546 Gregory Greenman 2023-03-28  690  				       STATION_TYPE_PEER);
9e949dfdc5d169 Johannes Berg    2023-05-14  691  	} else {
9e949dfdc5d169 Johannes Berg    2023-05-14  692  		ret = iwl_mvm_alloc_sta_after_restart(mvm, vif, sta);
9e949dfdc5d169 Johannes Berg    2023-05-14  693  	}
9e949dfdc5d169 Johannes Berg    2023-05-14  694  
57974a55d99546 Gregory Greenman 2023-03-28  695  	if (ret)
57974a55d99546 Gregory Greenman 2023-03-28  696  		goto err;
57974a55d99546 Gregory Greenman 2023-03-28  697  
57974a55d99546 Gregory Greenman 2023-03-28  698  	/* at this stage sta link pointers are already allocated */
57974a55d99546 Gregory Greenman 2023-03-28  699  	ret = iwl_mvm_mld_update_sta(mvm, vif, sta);
3aa80d31869bc2 Johannes Berg    2023-09-21  700  	if (ret)
3aa80d31869bc2 Johannes Berg    2023-09-21  701  		goto err;
57974a55d99546 Gregory Greenman 2023-03-28  702  
57974a55d99546 Gregory Greenman 2023-03-28  703  	for_each_sta_active_link(vif, sta, link_sta, link_id) {
57974a55d99546 Gregory Greenman 2023-03-28  704  		struct ieee80211_bss_conf *link_conf =
0d504ca1f19b1a Johannes Berg    2023-03-29  705  			link_conf_dereference_protected(vif, link_id);
57974a55d99546 Gregory Greenman 2023-03-28  706  		struct iwl_mvm_link_sta *mvm_link_sta =
57974a55d99546 Gregory Greenman 2023-03-28  707  			rcu_dereference_protected(mvm_sta->link[link_id],
57974a55d99546 Gregory Greenman 2023-03-28  708  						  lockdep_is_held(&mvm->mutex));
57974a55d99546 Gregory Greenman 2023-03-28  709  
57974a55d99546 Gregory Greenman 2023-03-28  710  		if (WARN_ON(!link_conf || !mvm_link_sta))
57974a55d99546 Gregory Greenman 2023-03-28 @711  			goto err;

error code?

57974a55d99546 Gregory Greenman 2023-03-28  712  
57974a55d99546 Gregory Greenman 2023-03-28  713  		ret = iwl_mvm_mld_cfg_sta(mvm, sta, vif, link_sta, link_conf,
57974a55d99546 Gregory Greenman 2023-03-28  714  					  mvm_link_sta);
57974a55d99546 Gregory Greenman 2023-03-28  715  		if (ret)
57974a55d99546 Gregory Greenman 2023-03-28  716  			goto err;
57974a55d99546 Gregory Greenman 2023-03-28  717  
57974a55d99546 Gregory Greenman 2023-03-28  718  		link_sta_added_to_fw |= BIT(link_id);
57974a55d99546 Gregory Greenman 2023-03-28  719  
57974a55d99546 Gregory Greenman 2023-03-28  720  		if (vif->type == NL80211_IFTYPE_STATION)
57974a55d99546 Gregory Greenman 2023-03-28  721  			iwl_mvm_mld_set_ap_sta_id(sta, mvm_vif->link[link_id],
57974a55d99546 Gregory Greenman 2023-03-28  722  						  mvm_link_sta);
57974a55d99546 Gregory Greenman 2023-03-28  723  	}
87f7e2435cb7dd Miri Korenblit   2023-03-28  724  
87f7e2435cb7dd Miri Korenblit   2023-03-28  725  	return 0;
57974a55d99546 Gregory Greenman 2023-03-28  726  
57974a55d99546 Gregory Greenman 2023-03-28  727  err:
57974a55d99546 Gregory Greenman 2023-03-28  728  	/* remove all already allocated stations in FW */
57974a55d99546 Gregory Greenman 2023-03-28  729  	for_each_set_bit(link_id, &link_sta_added_to_fw,
57974a55d99546 Gregory Greenman 2023-03-28  730  			 IEEE80211_MLD_MAX_NUM_LINKS) {
57974a55d99546 Gregory Greenman 2023-03-28  731  		struct iwl_mvm_link_sta *mvm_link_sta =
57974a55d99546 Gregory Greenman 2023-03-28  732  			rcu_dereference_protected(mvm_sta->link[link_id],
57974a55d99546 Gregory Greenman 2023-03-28  733  						  lockdep_is_held(&mvm->mutex));
57974a55d99546 Gregory Greenman 2023-03-28  734  
57974a55d99546 Gregory Greenman 2023-03-28  735  		iwl_mvm_mld_rm_sta_from_fw(mvm, mvm_link_sta->sta_id);
57974a55d99546 Gregory Greenman 2023-03-28  736  	}
57974a55d99546 Gregory Greenman 2023-03-28  737  
57974a55d99546 Gregory Greenman 2023-03-28  738  	/* free all sta resources in the driver */
57974a55d99546 Gregory Greenman 2023-03-28  739  	iwl_mvm_mld_sta_rm_all_sta_links(mvm, mvm_sta);
57974a55d99546 Gregory Greenman 2023-03-28  740  	return ret;
87f7e2435cb7dd Miri Korenblit   2023-03-28  741  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

