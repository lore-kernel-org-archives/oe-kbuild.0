Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4B541C69
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 00:38:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741221506; cv=none; b=ivMKqYCk0luNIkKzLg7PXoPv7J9O5VOl1RqZrWcpT7+CwQLhY2o2oigsxSB4P65HJWnwD+dQk/ah9WjS1a1LU1466yTarCerlHUpNUd294zh2B3bwdt4Mn+piAZMT3FGM77D/FabFVjivZkNx+h2G1XHva6XzpEdrvLGMa5zzZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741221506; c=relaxed/simple;
	bh=sEtbkg1zhDswCHSUYTJWyUsHFtV3L5E7ru0OjaH9ryU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YbWhSTQSv1LmIhXLj7FYzwvKeLDL/YyUhi4+gSYQc4ryOWpr4SbLQGkWiio0UH2F7IvnAR1S1tAqV2/OSX5ihwJyluJgc+XflCbVTeXeYR860yg4CM2AWOsTNDExJQooEhZ1obNoh0e8sHI3pmFhcVe2oqfMT2DU6Eylf53TuyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cSSDDhHs; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cSSDDhHs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741221505; x=1772757505;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sEtbkg1zhDswCHSUYTJWyUsHFtV3L5E7ru0OjaH9ryU=;
  b=cSSDDhHs+LqbKUNlTtCgtKWNxY2y/DqGRG9HHeYB5ZiWxgMD5R4hn60B
   ku+m2H76iS9CyEhaMPBW/yra/TFtxfKfVTPumFhfYMA6iq8CGPm6KjIp4
   0oBK8PG6JYayVF/QBRnCCu5Jkm6d+w84D+X8QTwH5L6c06n69SnsUbwme
   AnANr+heat+aO5+OKfvfD8uTyYWNvqYnwEcjEEQrZ95Y2fwgG8TmnkJzH
   hFeSMfte5ROTDYv55HwP1AT3mxY9BOv6U8ae0/uLY4Zhv0HzN3wT0mWjz
   1iKp4Ru+vuVeZz4AZx5oSiGjeSNwI9X7xyzkdzHjmWuQprA9F5/NdhTXh
   Q==;
X-CSE-ConnectionGUID: Mc6sllrtTuaNIH+4bDjzjg==
X-CSE-MsgGUID: b0znx3Y4RtyQSV2i220bcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="42073451"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="42073451"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 16:38:25 -0800
X-CSE-ConnectionGUID: afhIuOgdQZakqBgJL4vDKQ==
X-CSE-MsgGUID: lmBQEcrbT52wn/Ih55tsjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="118651213"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 05 Mar 2025 16:38:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpzFP-000MMA-1u;
	Thu, 06 Mar 2025 00:38:02 +0000
Date: Thu, 6 Mar 2025 08:37:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:ath12k-split-phy 81/139] net/mac80211/link.c:96
 ieee80211_link_init() warn: can 'master' even be NULL?
Message-ID: <202503060854.5cPgdKzO-lkp@intel.com>
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
CC: Jeff Johnson <jjohnson@kernel.org>
CC: Kalle Valo <kvalo@kernel.org>
CC: ath12k@lists.infradead.org
TO: Muna Sinada <muna.sinada@oss.qualcomm.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-split-phy
head:   64723c7be2b959dde8f4a8c85401a57d8740af10
commit: 139c21bdb8c36a8ad201b71678b0d1168856d5d3 [81/139] wifi: mac80211: Create separate links for VLAN interfaces
:::::: branch date: 6 hours ago
:::::: commit date: 30 hours ago
config: x86_64-randconfig-161-20250306 (https://download.01.org/0day-ci/archive/20250306/202503060854.5cPgdKzO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503060854.5cPgdKzO-lkp@intel.com/

smatch warnings:
net/mac80211/link.c:96 ieee80211_link_init() warn: can 'master' even be NULL?

vim +/master +96 net/mac80211/link.c

e73b5e51a05d41 Johannes Berg      2022-09-02   76  
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
e73b5e51a05d41 Johannes Berg      2022-09-02  145  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
