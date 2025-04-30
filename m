Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A73215D1
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Apr 2025 00:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745971418; cv=none; b=pSFDQcqw16kyskmw2dc34W1fM/Id96/Q3Wn4LXQIbm+BaQEabF1uf6MO2IDmyMDIiYlWd/p3Sn/gWan1kKMW206iwQcu3Dy2XkJGUjZo4GeoVPRLI12m0N2VuW6TvNpdy+4xnXRo+n3zPrki9rJyTjkNPH+g29hKMOrfNGKAxuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745971418; c=relaxed/simple;
	bh=/PTEU5kEoLXNDbALIOMz6W1gOHGKAEseeWqHkibd0Yk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rpz5PPAYvnKHTRhsq2+LD0i8a5CKfR8CqbE6FLcK0CSehdTRv707QlvCIUr80SaMGmIAB9l4ykYlcRPX25FV9TUEEQdKPhuW4la0l2Ziz+Vb6gvA7vGBAKPoCau7ELxw5YVKNzgcSXaaqjU9XfM+zokiNB246XYreRYIcc6Ym4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpE0K0Y7; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpE0K0Y7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745971416; x=1777507416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/PTEU5kEoLXNDbALIOMz6W1gOHGKAEseeWqHkibd0Yk=;
  b=FpE0K0Y7QVj22G5xSrwaeUdSwH6Sp4mHOF1Vl540ALC2R4a5JEMc8ZWx
   SHmjiw37ZZG2ecJUtbwZwlXehvpVrcRpnAEL7jhOzSUs1kwwwIX+EtNZ/
   JglfzKW3Yhy8vOkUTn8QT+78S4d6Xn/Z7pIEkfpqbIU1yG4//0iinKSAg
   UGMh6w60DCkvQOhpYZZY7Yrjns2oDJB9FBZqIWtqfKNjHvnkzCWj1TSzB
   8dJCJmSZlTm6OdnFHCWVbu8AklSwN2S+dwH9FKprEJttcPu/02Om/dycA
   gZfBhx8gPLiy6V70gjIuJEt6+HowLFcDzQI5S+W1I7mmAKpgGTydXtMH6
   w==;
X-CSE-ConnectionGUID: CcZj+PWPSYa3+ZUH3+E2xg==
X-CSE-MsgGUID: PutCnPhjQ1S9cXg50Pj+Iw==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="58991558"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="58991558"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 17:03:31 -0700
X-CSE-ConnectionGUID: WFzzyE/DTwC5Sre0b9oxqw==
X-CSE-MsgGUID: Nb8b6nE+R3WSXTOV4e2nyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133870725"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 29 Apr 2025 17:03:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9uv9-00032F-2f;
	Wed, 30 Apr 2025 00:03:27 +0000
Date: Wed, 30 Apr 2025 08:02:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 5132/7105] net/mac80211/link.c:26:7-11: ERROR:
 iterator variable bound on line 23 cannot be NULL
Message-ID: <202504300719.azbk9K7V-lkp@intel.com>
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
TO: Muna Sinada <muna.sinada@oss.qualcomm.com>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9d9096722447b77662d4237a09909bde7774f22e
commit: 90233b0ad215efc9ea56a7c0b09021bcd4eea4ac [5132/7105] wifi: mac80211: Create separate links for VLAN interfaces
:::::: branch date: 15 hours ago
:::::: commit date: 6 days ago
config: m68k-randconfig-r061-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300719.azbk9K7V-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202504300719.azbk9K7V-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/mac80211/link.c:26:7-11: ERROR: iterator variable bound on line 23 cannot be NULL

vim +26 net/mac80211/link.c

e73b5e51a05d41 Johannes Berg 2022-09-02  14  
90233b0ad215ef Muna Sinada   2025-03-25  15  static void ieee80211_update_apvlan_links(struct ieee80211_sub_if_data *sdata)
90233b0ad215ef Muna Sinada   2025-03-25  16  {
90233b0ad215ef Muna Sinada   2025-03-25  17  	struct ieee80211_sub_if_data *vlan;
90233b0ad215ef Muna Sinada   2025-03-25  18  	struct ieee80211_link_data *link;
90233b0ad215ef Muna Sinada   2025-03-25  19  	u16 ap_bss_links = sdata->vif.valid_links;
90233b0ad215ef Muna Sinada   2025-03-25  20  	u16 new_links, vlan_links;
90233b0ad215ef Muna Sinada   2025-03-25  21  	unsigned long add;
90233b0ad215ef Muna Sinada   2025-03-25  22  
90233b0ad215ef Muna Sinada   2025-03-25 @23  	list_for_each_entry(vlan, &sdata->u.ap.vlans, u.vlan.list) {
90233b0ad215ef Muna Sinada   2025-03-25  24  		int link_id;
90233b0ad215ef Muna Sinada   2025-03-25  25  
90233b0ad215ef Muna Sinada   2025-03-25 @26  		if (!vlan)
90233b0ad215ef Muna Sinada   2025-03-25  27  			continue;
90233b0ad215ef Muna Sinada   2025-03-25  28  
90233b0ad215ef Muna Sinada   2025-03-25  29  		/* No support for 4addr with MLO yet */
90233b0ad215ef Muna Sinada   2025-03-25  30  		if (vlan->wdev.use_4addr)
90233b0ad215ef Muna Sinada   2025-03-25  31  			return;
90233b0ad215ef Muna Sinada   2025-03-25  32  
90233b0ad215ef Muna Sinada   2025-03-25  33  		vlan_links = vlan->vif.valid_links;
90233b0ad215ef Muna Sinada   2025-03-25  34  
90233b0ad215ef Muna Sinada   2025-03-25  35  		new_links = ap_bss_links;
90233b0ad215ef Muna Sinada   2025-03-25  36  
90233b0ad215ef Muna Sinada   2025-03-25  37  		add = new_links & ~vlan_links;
90233b0ad215ef Muna Sinada   2025-03-25  38  		if (!add)
90233b0ad215ef Muna Sinada   2025-03-25  39  			continue;
90233b0ad215ef Muna Sinada   2025-03-25  40  
90233b0ad215ef Muna Sinada   2025-03-25  41  		ieee80211_vif_set_links(vlan, add, 0);
90233b0ad215ef Muna Sinada   2025-03-25  42  
90233b0ad215ef Muna Sinada   2025-03-25  43  		for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
90233b0ad215ef Muna Sinada   2025-03-25  44  			link = sdata_dereference(vlan->link[link_id], vlan);
90233b0ad215ef Muna Sinada   2025-03-25  45  			ieee80211_link_vlan_copy_chanctx(link);
90233b0ad215ef Muna Sinada   2025-03-25  46  		}
90233b0ad215ef Muna Sinada   2025-03-25  47  	}
90233b0ad215ef Muna Sinada   2025-03-25  48  }
90233b0ad215ef Muna Sinada   2025-03-25  49  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
