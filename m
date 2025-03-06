Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D03FF78F45
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 06:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741242829; cv=none; b=FUqsWYkaBFMxOe8unSzV1Rgg4dRtGbVf9nno6a8sxVo1TkNVzH89cIbVvNAnIXlmjVjqEJ4b6TGEOE2K2JrFx2o4XOnTM4EipOJWv0hhiHWz25qzgiULg23blGIYSQ6+RKmBcbhRisrwwQI2a2m33bakUH5bnKAPzAujGHcCoLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741242829; c=relaxed/simple;
	bh=MmSo3VFODycTV8o1v3UfHnCpCeXyWl72yNHtu6HAKck=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cw/oDBnJ6NaH4sTXG7yiYEzOqGMA17ZbvVdarknOn673LfwHLEHvPWXU5wXB+lh3IqsVDWsvACwVR/HCIZ9sx55kSZ2j/PdygJUqCPc+THC5AmZn8THb5OSWWshhEl3I/Z654DoCi3MwVEvO7Tf1b3vw+wqr/ecXDEFzwwuQXRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jeQV3Es/; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jeQV3Es/"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-388cae9eb9fso121269f8f.3
        for <oe-kbuild@lists.linux.dev>; Wed, 05 Mar 2025 22:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741242824; x=1741847624; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=twm03Oy4r5nPGPtZkmiVjVc9lS2x2ybjNxtocoftd9Y=;
        b=jeQV3Es/srhwD56FsardQYNyJDMFUhRDkf/LVLLtQ7BiBStb+3I6WN8Rd/M/sUNKGl
         RNF30cPbBla4eRY+k7PdJFn4Ren/Ro2FrN0c8n3ZWhmQShjCYDlewm3gGw7oZvys3gDM
         vBow9GO373r5bIMb9pgVewepGJTPCjfLqW8hTOiSfAheIvWVUWXASO7TV6PS71g7OFs/
         yjA4dUXgcUf0mQPLVKWGxjGcFnhapaNuEHGxkLErOAddwUmbIK3UaY5AC8hzczvfoi6t
         KNFdSebzGz7BegMYx7dRZhwry68Bmqa/z5U5eAswRwKWMm1/N+MXoSjMCKiCcj+IJIaN
         ZMtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741242824; x=1741847624;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=twm03Oy4r5nPGPtZkmiVjVc9lS2x2ybjNxtocoftd9Y=;
        b=n+2wI79khqmSkikDpAqET9VJDLAFkNMCCrT3f8wlptsohYnQ3DOruJUU59TaAiZxYc
         51liWTxxd5Y1mml5A4J0vaC9EzRPN084MntC/w5uKx8y0tgZmMZxq5wjTLnQ/S7jke4H
         /0rNGHOvuFEo8pMLTpxLXWJUkd2hnS0tMy3p6nzE98MKYvyhcCORTcAG3LrNEmI7mdM8
         DiQBok+olrrLNvwxECyHam/D3sqa+Rm2lhb/ATWvDaNa4/pkukr6nspFFXmNgLV/bVdG
         nmAnbnmM3wbUDXKFBqw/nUrtp4h93dmBeFLZTnxnk8cKYaw00Qklg0+QTL56eBzbhwWt
         ICaw==
X-Gm-Message-State: AOJu0YzdCOAFUpAITBSUUF7bOvdNaJyP2YwBF61HKhbK+RIJBS4F870b
	3o9zv68xHduTubqjtPr4mDcG6FdxV9mQ/x3oc60+g2NVMwXwhzZpVQVWnFM0Uw6bFQDCp0uV0h5
	N
X-Gm-Gg: ASbGncuvYB+VbwDk1ZrBh8+t/8mwQbl+jwb8rbyCvCYUIXJ2vSB+hhSZBy1AvQndDHk
	+1Qnd+EIJF6RDA/OPXvJAINbT8TSTpjy6Cbwy7e9pbEgW0IIw5LvDyqinpkIHTrnA9ppPiJY2mi
	Xxn+xjFfeDC+2pEAomamObdZRpSR/WRvF8FpvTXYX8ncoSgAxB92D7HYVEKu6X/i6UhjH7GKHwC
	0BE5FYolrXiVhHxLsEiv+qXim7WH1gf3HCarwzblvWpFVODj2GgUK/9+XYq/E72ocAblvzHl6HB
	c30eLLZxM3fm5CzGKJwVrnBZiOy8rlw5l2NtAwx1/FEEusgxcQ==
X-Google-Smtp-Source: AGHT+IGeNal1Sgc/E3DzZp24+r0BXPhvab8A8uCChGmpF5qLmcYIveJqXWJIACmg+4dgEdduPWpeBg==
X-Received: by 2002:a5d:6489:0:b0:391:13ef:1b27 with SMTP id ffacd0b85a97d-3911f7ce4b6mr5435387f8f.51.1741242824406;
        Wed, 05 Mar 2025 22:33:44 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912c102db1sm940772f8f.95.2025.03.05.22.33.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 22:33:43 -0800 (PST)
Date: Thu, 6 Mar 2025 09:33:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Muna Sinada <muna.sinada@oss.qualcomm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
	ath12k@lists.infradead.org,
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Subject: [ath:ath12k-split-phy 81/139] net/mac80211/link.c:96
 ieee80211_link_init() warn: can 'master' even be NULL?
Message-ID: <f3cb8f15-e2a9-49ac-b138-6d1c8b04ca7c@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
head:   64723c7be2b959dde8f4a8c85401a57d8740af10
commit: 139c21bdb8c36a8ad201b71678b0d1168856d5d3 [81/139] wifi: mac80211: Create separate links for VLAN interfaces
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250306/202503060854.5cPgdKzO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202503060854.5cPgdKzO-lkp@intel.com/

smatch warnings:
net/mac80211/link.c:96 ieee80211_link_init() warn: can 'master' even be NULL?

vim +/master +96 net/mac80211/link.c

e73b5e51a05d41 Johannes Berg      2022-09-02   77  void ieee80211_link_init(struct ieee80211_sub_if_data *sdata,
e73b5e51a05d41 Johannes Berg      2022-09-02   78  			 int link_id,
e73b5e51a05d41 Johannes Berg      2022-09-02   79  			 struct ieee80211_link_data *link,
e73b5e51a05d41 Johannes Berg      2022-09-02   80  			 struct ieee80211_bss_conf *link_conf)
e73b5e51a05d41 Johannes Berg      2022-09-02   81  {
e73b5e51a05d41 Johannes Berg      2022-09-02   82  	bool deflink = link_id < 0;
e73b5e51a05d41 Johannes Berg      2022-09-02   83  
e73b5e51a05d41 Johannes Berg      2022-09-02   84  	if (link_id < 0)
e73b5e51a05d41 Johannes Berg      2022-09-02   85  		link_id = 0;
e73b5e51a05d41 Johannes Berg      2022-09-02   86  
e73b5e51a05d41 Johannes Berg      2022-09-02   87  	rcu_assign_pointer(sdata->vif.link_conf[link_id], link_conf);
e73b5e51a05d41 Johannes Berg      2022-09-02   88  	rcu_assign_pointer(sdata->link[link_id], link);
e73b5e51a05d41 Johannes Berg      2022-09-02   89  
139c21bdb8c36a Muna Sinada        2024-10-17   90  	if (sdata->vif.type == NL80211_IFTYPE_AP_VLAN) {
139c21bdb8c36a Muna Sinada        2024-10-17   91  		struct ieee80211_sub_if_data *master;
139c21bdb8c36a Muna Sinada        2024-10-17   92  		struct ieee80211_bss_conf *master_conf;
139c21bdb8c36a Muna Sinada        2024-10-17   93  
139c21bdb8c36a Muna Sinada        2024-10-17   94  		master = container_of(sdata->bss,
139c21bdb8c36a Muna Sinada        2024-10-17   95  				      struct ieee80211_sub_if_data, u.ap);
139c21bdb8c36a Muna Sinada        2024-10-17  @96  		if (!master)

master can't be NULL.  container_of() takes "sdata->bss" and subtracts an
offset.

139c21bdb8c36a Muna Sinada        2024-10-17   97  			goto skip_vlan_conf;
139c21bdb8c36a Muna Sinada        2024-10-17   98  
139c21bdb8c36a Muna Sinada        2024-10-17   99  		master_conf = sdata_dereference(master->vif.link_conf[link_id],
139c21bdb8c36a Muna Sinada        2024-10-17  100  						master);
139c21bdb8c36a Muna Sinada        2024-10-17  101  
139c21bdb8c36a Muna Sinada        2024-10-17  102  		memcpy(link_conf, master_conf, sizeof(*link_conf));
139c21bdb8c36a Muna Sinada        2024-10-17  103  	}
139c21bdb8c36a Muna Sinada        2024-10-17  104  
139c21bdb8c36a Muna Sinada        2024-10-17  105  skip_vlan_conf:
e73b5e51a05d41 Johannes Berg      2022-09-02  106  	link->sdata = sdata;
e73b5e51a05d41 Johannes Berg      2022-09-02  107  	link->link_id = link_id;
e73b5e51a05d41 Johannes Berg      2022-09-02  108  	link->conf = link_conf;
e73b5e51a05d41 Johannes Berg      2022-09-02  109  	link_conf->link_id = link_id;
e1f113cc678703 Benjamin Berg      2023-03-01  110  	link_conf->vif = &sdata->vif;
c4382d5ca1af75 Emmanuel Grumbach  2024-10-07  111  	link->ap_power_level = IEEE80211_UNSET_POWER_LEVEL;
c4382d5ca1af75 Emmanuel Grumbach  2024-10-07  112  	link->user_power_level = sdata->local->user_power_level;
c4382d5ca1af75 Emmanuel Grumbach  2024-10-07  113  	link_conf->txpower = INT_MIN;
e73b5e51a05d41 Johannes Berg      2022-09-02  114  
344d18cec23142 Johannes Berg      2024-05-06  115  	wiphy_work_init(&link->csa.finalize_work,
e73b5e51a05d41 Johannes Berg      2022-09-02  116  			ieee80211_csa_finalize_work);
b38579aeb5b04f Johannes Berg      2023-08-28  117  	wiphy_work_init(&link->color_change_finalize_work,
e73b5e51a05d41 Johannes Berg      2022-09-02  118  			ieee80211_color_change_finalize_work);
4cc6f3e5e5765a Remi Pommarel      2024-09-24  119  	wiphy_delayed_work_init(&link->color_collision_detect_work,
9288188438d85e Lorenzo Bianconi   2023-01-25  120  				ieee80211_color_collision_detection_work);
e73b5e51a05d41 Johannes Berg      2022-09-02  121  	INIT_LIST_HEAD(&link->assigned_chanctx_list);
e73b5e51a05d41 Johannes Berg      2022-09-02  122  	INIT_LIST_HEAD(&link->reserved_chanctx_list);
6241d79f004329 Aditya Kumar Singh 2024-09-06  123  	wiphy_delayed_work_init(&link->dfs_cac_timer_work,
6241d79f004329 Aditya Kumar Singh 2024-09-06  124  				ieee80211_dfs_cac_timer_work);
e73b5e51a05d41 Johannes Berg      2022-09-02  125  
e73b5e51a05d41 Johannes Berg      2022-09-02  126  	if (!deflink) {
e73b5e51a05d41 Johannes Berg      2022-09-02  127  		switch (sdata->vif.type) {
e73b5e51a05d41 Johannes Berg      2022-09-02  128  		case NL80211_IFTYPE_AP:
139c21bdb8c36a Muna Sinada        2024-10-17  129  		case NL80211_IFTYPE_AP_VLAN:
e73b5e51a05d41 Johannes Berg      2022-09-02  130  			ether_addr_copy(link_conf->addr,
e73b5e51a05d41 Johannes Berg      2022-09-02  131  					sdata->wdev.links[link_id].addr);
e73b5e51a05d41 Johannes Berg      2022-09-02  132  			link_conf->bssid = link_conf->addr;
e73b5e51a05d41 Johannes Berg      2022-09-02  133  			WARN_ON(!(sdata->wdev.valid_links & BIT(link_id)));
e73b5e51a05d41 Johannes Berg      2022-09-02  134  			break;
e73b5e51a05d41 Johannes Berg      2022-09-02  135  		case NL80211_IFTYPE_STATION:
e73b5e51a05d41 Johannes Berg      2022-09-02  136  			/* station sets the bssid in ieee80211_mgd_setup_link */
e73b5e51a05d41 Johannes Berg      2022-09-02  137  			break;
e73b5e51a05d41 Johannes Berg      2022-09-02  138  		default:
e73b5e51a05d41 Johannes Berg      2022-09-02  139  			WARN_ON(1);
e73b5e51a05d41 Johannes Berg      2022-09-02  140  		}
170cd6a66d9a16 Benjamin Berg      2023-03-01  141  
170cd6a66d9a16 Benjamin Berg      2023-03-01  142  		ieee80211_link_debugfs_add(link);
e73b5e51a05d41 Johannes Berg      2022-09-02  143  	}
e73b5e51a05d41 Johannes Berg      2022-09-02  144  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

