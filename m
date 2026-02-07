Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051DA19C566
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Feb 2026 12:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770468645; cv=none; b=HOjGNDA0RzI4+UYHl64coQLWFQ5NW6wEKwJdS4wLrQAhKUfyq/OiqIqbbD/KGLaap+nn5QIV2Q3D4LBfE/g4AjX9X30K9GPY6d4PDu7khO49VwBfQdZfeKaTrufzLLfSm4wOBK2W9IO61x2hIuAmAsi6gZUpCIt9BWCT+kLvF+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770468645; c=relaxed/simple;
	bh=0NgdHvW4aIEUfkUwvIVRpd7m05xdHjbwcjaGdhr1IIw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LWSTUNmNyCwesAyGGz5VhzzvFutJ6OS1NyaE17KarMkYziel78Xr72cShIORiMSVNPE4BEQN81RMD0KyU1KNXJ+ts2TybhdRTCmICijn1J1qdIYmOgMTCeWk5JeD6WMDnKIdzY2/SqzzPNTPI0U+661Ddv9qi3cEsmK/NNqMAts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7nzXuCT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7nzXuCT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770468645; x=1802004645;
  h=date:from:to:cc:subject:message-id;
  bh=0NgdHvW4aIEUfkUwvIVRpd7m05xdHjbwcjaGdhr1IIw=;
  b=F7nzXuCTUNuiggXfUJREgmMvJbff4yFRhYWixxlNwF0cCYqvj5qyTAhY
   BanRrhw6EoZkfIbfk3F9H3Du/V6pzjX30eNfk9QPXFe5rpwTXz/0c3RWB
   ib8st8It2RcjpzIWmYMl2CFduExT9Hmbf2K0RDA5eGWR95C86CvO1WNFR
   jCliuF8wtxYAFEKgskEY1p0ULPr4DFcA5c1aP4J1sRjHv7+kmILy4HxAg
   NCahEo7TxtOoatJ9BzjLqFrmkxBrGQCPsywAl0q+JqlhJHbt0rvap/WX9
   GyVW70T9Aeie6TdE5mJDS/K84rO5DNl1GAs7Y+7XwytaVEe8praf1862s
   g==;
X-CSE-ConnectionGUID: MnJdZk0BRl2i5wJ/cXpTmQ==
X-CSE-MsgGUID: /UzrF3KuSyeJvgkB0hhliw==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71720120"
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="71720120"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Feb 2026 04:50:44 -0800
X-CSE-ConnectionGUID: hBPJQ6qwSZyw/xIms+2Bmw==
X-CSE-MsgGUID: 54Ag4ukzSdK/9bfZ99ABdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,278,1763452800"; 
   d="scan'208";a="241458881"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Feb 2026 04:50:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vohlp-00000000leC-13by;
	Sat, 07 Feb 2026 12:50:41 +0000
Date: Sat, 07 Feb 2026 20:50:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android16-6.12-desktop 0/6]
 net/mac80211/link.c:26:7-11: ERROR: iterator variable bound on line 23 cannot
 be NULL
Message-ID: <202602072026.2O3OdR2g-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   1d370994ba023ff99b9ddab815c6e190e10b3403
commit: d383657857385e44a921b591adf4b546d6f5cb90 [0/6] wifi: mac80211: Create separate links for VLAN interfaces
:::::: branch date: 22 hours ago
:::::: commit date: 7 months ago
config: x86_64-randconfig-101-20260207 (https://download.01.org/0day-ci/archive/20260207/202602072026.2O3OdR2g-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602072026.2O3OdR2g-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/mac80211/link.c:26:7-11: ERROR: iterator variable bound on line 23 cannot be NULL

vim +26 net/mac80211/link.c

e73b5e51a05d41 Johannes Berg 2022-09-02  14  
d383657857385e Muna Sinada   2025-03-25  15  static void ieee80211_update_apvlan_links(struct ieee80211_sub_if_data *sdata)
d383657857385e Muna Sinada   2025-03-25  16  {
d383657857385e Muna Sinada   2025-03-25  17  	struct ieee80211_sub_if_data *vlan;
d383657857385e Muna Sinada   2025-03-25  18  	struct ieee80211_link_data *link;
d383657857385e Muna Sinada   2025-03-25  19  	u16 ap_bss_links = sdata->vif.valid_links;
d383657857385e Muna Sinada   2025-03-25  20  	u16 new_links, vlan_links;
d383657857385e Muna Sinada   2025-03-25  21  	unsigned long add;
d383657857385e Muna Sinada   2025-03-25  22  
d383657857385e Muna Sinada   2025-03-25 @23  	list_for_each_entry(vlan, &sdata->u.ap.vlans, u.vlan.list) {
d383657857385e Muna Sinada   2025-03-25  24  		int link_id;
d383657857385e Muna Sinada   2025-03-25  25  
d383657857385e Muna Sinada   2025-03-25 @26  		if (!vlan)
d383657857385e Muna Sinada   2025-03-25  27  			continue;
d383657857385e Muna Sinada   2025-03-25  28  
d383657857385e Muna Sinada   2025-03-25  29  		/* No support for 4addr with MLO yet */
d383657857385e Muna Sinada   2025-03-25  30  		if (vlan->wdev.use_4addr)
d383657857385e Muna Sinada   2025-03-25  31  			return;
d383657857385e Muna Sinada   2025-03-25  32  
d383657857385e Muna Sinada   2025-03-25  33  		vlan_links = vlan->vif.valid_links;
d383657857385e Muna Sinada   2025-03-25  34  
d383657857385e Muna Sinada   2025-03-25  35  		new_links = ap_bss_links;
d383657857385e Muna Sinada   2025-03-25  36  
d383657857385e Muna Sinada   2025-03-25  37  		add = new_links & ~vlan_links;
d383657857385e Muna Sinada   2025-03-25  38  		if (!add)
d383657857385e Muna Sinada   2025-03-25  39  			continue;
d383657857385e Muna Sinada   2025-03-25  40  
d383657857385e Muna Sinada   2025-03-25  41  		ieee80211_vif_set_links(vlan, add, 0);
d383657857385e Muna Sinada   2025-03-25  42  
d383657857385e Muna Sinada   2025-03-25  43  		for_each_set_bit(link_id, &add, IEEE80211_MLD_MAX_NUM_LINKS) {
d383657857385e Muna Sinada   2025-03-25  44  			link = sdata_dereference(vlan->link[link_id], vlan);
d383657857385e Muna Sinada   2025-03-25  45  			ieee80211_link_vlan_copy_chanctx(link);
d383657857385e Muna Sinada   2025-03-25  46  		}
d383657857385e Muna Sinada   2025-03-25  47  	}
d383657857385e Muna Sinada   2025-03-25  48  }
d383657857385e Muna Sinada   2025-03-25  49  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
