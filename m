Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8543B221F26
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jun 2026 02:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781058661; cv=none; b=SeSC14rEapSkDj4btCiG7j8SdpmThvkYbk2P+aFZQQKUBzQBRm+H/7ohDWeTDvCUgwe2cDKZJltfTZWvzSdnEg5Qt3WEVvLnrrFqKGNO2Tg3YdnSvMibnpKP711vZE4PlY4UA4arNfhFx3vCs9wrzCdRd+E8QoGUGblfuC14BjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781058661; c=relaxed/simple;
	bh=K/mgZjbgWAPZ6iBfGNTUCD3yAFEVO6TE/vQZtxelWk8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gKbWBNOQdy40oROZuYS3YvOUrTz6pimAfdsrBIx+xCdUxBlGrsm4oH7DJKVoT/BySIz1jGKBLDfQVMCk3FekAZDQfcTy++XQw00xWstezp/WUAVhtUvwm/oMhplDzEYTDdIh+xljvdakWeBay33LqPSUmShdHX5Fh/zhAU4d9T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kUkexJib; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kUkexJib"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781058660; x=1812594660;
  h=date:from:to:cc:subject:message-id;
  bh=K/mgZjbgWAPZ6iBfGNTUCD3yAFEVO6TE/vQZtxelWk8=;
  b=kUkexJibZrhZCt3pCmMQEGzhtSNCsxKMVoWCIKNzFzcTN/ZqSqsil6Or
   QwcJAP9yI861CzfuCs98EewYDXGqBXIZsFhiXT4zWiCKCq+pouoPKgfHa
   s2Z9MgsNHuQ8Ujt20LlpzTVqznVmberRVwVLr4gsd37nfW+jG5KZKU8SF
   NkuZDVW56YG7EDUkUdjdvwnnI/IVnykWBMM4M5gXIzLkcAskSjRJpVHR/
   qNokLfr7zQHX4mahcU0nc5vRmghgj0XzdA1ukFfce7ZPymc+AhWbdCkWA
   2pc3bt/1WbLul23Q/HePfs8mkvreCytywstYGeLQsUSM+uFHmbiY2mWiw
   w==;
X-CSE-ConnectionGUID: 5XDowZqKTGmj6rObXxSi0w==
X-CSE-MsgGUID: TRfxkEbDSa+AUGEyno9YJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11812"; a="81844714"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="81844714"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2026 19:30:59 -0700
X-CSE-ConnectionGUID: sAz/Dyo8S7u2CTC6t4GfpA==
X-CSE-MsgGUID: tQp6PeY/SiGn3fTLyfp/9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; 
   d="scan'208";a="269711214"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Jun 2026 19:30:57 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wX8iU-00000000KoY-30p3;
	Wed, 10 Jun 2026 02:30:54 +0000
Date: Wed, 10 Jun 2026 10:30:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [reinette:resctrl/controls_rfc_v1 48/82]
 fs/resctrl/rdtgroup.c:1160 rdt_bit_usage_show() warn: inconsistent returns
 'global &rdtgroup_mutex'.
Message-ID: <202606101004.PsNAKxDj-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Reinette Chatre <reinette.chatre@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/reinette/linux.git resctrl/controls_rfc_v1
head:   37557cac804539e802e887a320e85c7a916a0bb9
commit: a54ec3de291898407c4cf41dea220e5fe0a2c2e9 [48/82] fs/resctrl: Obtain global properties from default cache control
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: i386-randconfig-141-20260610 (https://download.01.org/0day-ci/archive/20260610/202606101004.PsNAKxDj-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606101004.PsNAKxDj-lkp@intel.com/

smatch warnings:
fs/resctrl/rdtgroup.c:1160 rdt_bit_usage_show() warn: inconsistent returns 'global &rdtgroup_mutex'.

vim +1160 fs/resctrl/rdtgroup.c

7168ae330e8105 James Morse     2025-05-15  1043  
7168ae330e8105 James Morse     2025-05-15  1044  /*
7168ae330e8105 James Morse     2025-05-15  1045   * rdt_bit_usage_show - Display current usage of resources
7168ae330e8105 James Morse     2025-05-15  1046   *
7168ae330e8105 James Morse     2025-05-15  1047   * A domain is a shared resource that can now be allocated differently. Here
7168ae330e8105 James Morse     2025-05-15  1048   * we display the current regions of the domain as an annotated bitmask.
7168ae330e8105 James Morse     2025-05-15  1049   * For each domain of this resource its allocation bitmask
7168ae330e8105 James Morse     2025-05-15  1050   * is annotated as below to indicate the current usage of the corresponding bit:
7168ae330e8105 James Morse     2025-05-15  1051   *   0 - currently unused
7168ae330e8105 James Morse     2025-05-15  1052   *   X - currently available for sharing and used by software and hardware
7168ae330e8105 James Morse     2025-05-15  1053   *   H - currently used by hardware only but available for software use
7168ae330e8105 James Morse     2025-05-15  1054   *   S - currently used and shareable by software only
7168ae330e8105 James Morse     2025-05-15  1055   *   E - currently used exclusively by one resource group
7168ae330e8105 James Morse     2025-05-15  1056   *   P - currently pseudo-locked by one resource group
7168ae330e8105 James Morse     2025-05-15  1057   */
7168ae330e8105 James Morse     2025-05-15  1058  static int rdt_bit_usage_show(struct kernfs_open_file *of,
7168ae330e8105 James Morse     2025-05-15  1059  			      struct seq_file *seq, void *v)
7168ae330e8105 James Morse     2025-05-15  1060  {
cb6283f40b6a21 Reinette Chatre 2026-04-09  1061  	struct rdt_resource_final *f = rdt_kn_parent_priv(of->kn);
7168ae330e8105 James Morse     2025-05-15  1062  	/*
7168ae330e8105 James Morse     2025-05-15  1063  	 * Use unsigned long even though only 32 bits are used to ensure
7168ae330e8105 James Morse     2025-05-15  1064  	 * test_bit() is used safely.
7168ae330e8105 James Morse     2025-05-15  1065  	 */
7168ae330e8105 James Morse     2025-05-15  1066  	unsigned long sw_shareable = 0, hw_shareable = 0;
7168ae330e8105 James Morse     2025-05-15  1067  	unsigned long exclusive = 0, pseudo_locked = 0;
cb6283f40b6a21 Reinette Chatre 2026-04-09  1068  	struct rdt_resource *r = f->res;
7168ae330e8105 James Morse     2025-05-15  1069  	struct rdt_ctrl_domain *dom;
7168ae330e8105 James Morse     2025-05-15  1070  	int i, hwb, swb, excl, psl;
a54ec3de291898 Reinette Chatre 2026-04-14  1071  	struct resctrl_ctrl *ctrl;
7168ae330e8105 James Morse     2025-05-15  1072  	enum rdtgrp_mode mode;
7168ae330e8105 James Morse     2025-05-15  1073  	bool sep = false;
7168ae330e8105 James Morse     2025-05-15  1074  	u32 ctrl_val;
7168ae330e8105 James Morse     2025-05-15  1075  
7168ae330e8105 James Morse     2025-05-15  1076  	cpus_read_lock();
7168ae330e8105 James Morse     2025-05-15  1077  	mutex_lock(&rdtgroup_mutex);
a54ec3de291898 Reinette Chatre 2026-04-14  1078  
a54ec3de291898 Reinette Chatre 2026-04-14  1079  	ctrl = resctrl_get_cache_ctrl(r);
a54ec3de291898 Reinette Chatre 2026-04-14  1080  	if (!ctrl)
a54ec3de291898 Reinette Chatre 2026-04-14  1081  		return 0;
a54ec3de291898 Reinette Chatre 2026-04-14  1082  
a54ec3de291898 Reinette Chatre 2026-04-14  1083  	list_for_each_entry(dom, &ctrl->domains, hdr.list) {
7168ae330e8105 James Morse     2025-05-15  1084  		if (sep)
7168ae330e8105 James Morse     2025-05-15  1085  			seq_putc(seq, ';');
a54ec3de291898 Reinette Chatre 2026-04-14  1086  		hw_shareable = ctrl->cache.shareable_bits;
7168ae330e8105 James Morse     2025-05-15  1087  		sw_shareable = 0;
7168ae330e8105 James Morse     2025-05-15  1088  		exclusive = 0;
7168ae330e8105 James Morse     2025-05-15  1089  		seq_printf(seq, "%d=", dom->hdr.id);
7168ae330e8105 James Morse     2025-05-15  1090  		for (i = 0; i < closids_supported(); i++) {
ac7de456a37f9b Babu Moger      2025-11-12  1091  			if (!closid_allocated(i) ||
ac7de456a37f9b Babu Moger      2025-11-12  1092  			    (resctrl_arch_get_io_alloc_enabled(r) &&
ac7de456a37f9b Babu Moger      2025-11-12  1093  			     i == resctrl_io_alloc_closid(r)))
7168ae330e8105 James Morse     2025-05-15  1094  				continue;
7168ae330e8105 James Morse     2025-05-15  1095  			ctrl_val = resctrl_arch_get_config(r, dom, i,
cb6283f40b6a21 Reinette Chatre 2026-04-09  1096  							   f->conf_type);
7168ae330e8105 James Morse     2025-05-15  1097  			mode = rdtgroup_mode_by_closid(i);
7168ae330e8105 James Morse     2025-05-15  1098  			switch (mode) {
7168ae330e8105 James Morse     2025-05-15  1099  			case RDT_MODE_SHAREABLE:
7168ae330e8105 James Morse     2025-05-15  1100  				sw_shareable |= ctrl_val;
7168ae330e8105 James Morse     2025-05-15  1101  				break;
7168ae330e8105 James Morse     2025-05-15  1102  			case RDT_MODE_EXCLUSIVE:
7168ae330e8105 James Morse     2025-05-15  1103  				exclusive |= ctrl_val;
7168ae330e8105 James Morse     2025-05-15  1104  				break;
7168ae330e8105 James Morse     2025-05-15  1105  			case RDT_MODE_PSEUDO_LOCKSETUP:
7168ae330e8105 James Morse     2025-05-15  1106  			/*
7168ae330e8105 James Morse     2025-05-15  1107  			 * RDT_MODE_PSEUDO_LOCKSETUP is possible
7168ae330e8105 James Morse     2025-05-15  1108  			 * here but not included since the CBM
7168ae330e8105 James Morse     2025-05-15  1109  			 * associated with this CLOSID in this mode
7168ae330e8105 James Morse     2025-05-15  1110  			 * is not initialized and no task or cpu can be
7168ae330e8105 James Morse     2025-05-15  1111  			 * assigned this CLOSID.
7168ae330e8105 James Morse     2025-05-15  1112  			 */
7168ae330e8105 James Morse     2025-05-15  1113  				break;
7168ae330e8105 James Morse     2025-05-15  1114  			case RDT_MODE_PSEUDO_LOCKED:
7168ae330e8105 James Morse     2025-05-15  1115  			case RDT_NUM_MODES:
7168ae330e8105 James Morse     2025-05-15  1116  				WARN(1,
7168ae330e8105 James Morse     2025-05-15  1117  				     "invalid mode for closid %d\n", i);
7168ae330e8105 James Morse     2025-05-15  1118  				break;
7168ae330e8105 James Morse     2025-05-15  1119  			}
7168ae330e8105 James Morse     2025-05-15  1120  		}
ac7de456a37f9b Babu Moger      2025-11-12  1121  
ac7de456a37f9b Babu Moger      2025-11-12  1122  		/*
ac7de456a37f9b Babu Moger      2025-11-12  1123  		 * When the "io_alloc" feature is enabled, a portion of the cache
ac7de456a37f9b Babu Moger      2025-11-12  1124  		 * is configured for shared use between hardware and software.
ac7de456a37f9b Babu Moger      2025-11-12  1125  		 * Also, when CDP is enabled the CBMs of CDP_CODE and CDP_DATA
ac7de456a37f9b Babu Moger      2025-11-12  1126  		 * resources are kept in sync. So, the CBMs for "io_alloc" can
ac7de456a37f9b Babu Moger      2025-11-12  1127  		 * be accessed through either resource.
ac7de456a37f9b Babu Moger      2025-11-12  1128  		 */
ac7de456a37f9b Babu Moger      2025-11-12  1129  		if (resctrl_arch_get_io_alloc_enabled(r)) {
ac7de456a37f9b Babu Moger      2025-11-12  1130  			ctrl_val = resctrl_arch_get_config(r, dom,
ac7de456a37f9b Babu Moger      2025-11-12  1131  							   resctrl_io_alloc_closid(r),
cb6283f40b6a21 Reinette Chatre 2026-04-09  1132  							   f->conf_type);
ac7de456a37f9b Babu Moger      2025-11-12  1133  			hw_shareable |= ctrl_val;
ac7de456a37f9b Babu Moger      2025-11-12  1134  		}
ac7de456a37f9b Babu Moger      2025-11-12  1135  
a54ec3de291898 Reinette Chatre 2026-04-14  1136  		for (i = ctrl->cache.cbm_len - 1; i >= 0; i--) {
7168ae330e8105 James Morse     2025-05-15  1137  			pseudo_locked = dom->plr ? dom->plr->cbm : 0;
7168ae330e8105 James Morse     2025-05-15  1138  			hwb = test_bit(i, &hw_shareable);
7168ae330e8105 James Morse     2025-05-15  1139  			swb = test_bit(i, &sw_shareable);
7168ae330e8105 James Morse     2025-05-15  1140  			excl = test_bit(i, &exclusive);
7168ae330e8105 James Morse     2025-05-15  1141  			psl = test_bit(i, &pseudo_locked);
7168ae330e8105 James Morse     2025-05-15  1142  			if (hwb && swb)
7168ae330e8105 James Morse     2025-05-15  1143  				seq_putc(seq, 'X');
7168ae330e8105 James Morse     2025-05-15  1144  			else if (hwb && !swb)
7168ae330e8105 James Morse     2025-05-15  1145  				seq_putc(seq, 'H');
7168ae330e8105 James Morse     2025-05-15  1146  			else if (!hwb && swb)
7168ae330e8105 James Morse     2025-05-15  1147  				seq_putc(seq, 'S');
7168ae330e8105 James Morse     2025-05-15  1148  			else if (excl)
7168ae330e8105 James Morse     2025-05-15  1149  				seq_putc(seq, 'E');
7168ae330e8105 James Morse     2025-05-15  1150  			else if (psl)
7168ae330e8105 James Morse     2025-05-15  1151  				seq_putc(seq, 'P');
7168ae330e8105 James Morse     2025-05-15  1152  			else /* Unused bits remain */
7168ae330e8105 James Morse     2025-05-15  1153  				seq_putc(seq, '0');
7168ae330e8105 James Morse     2025-05-15  1154  		}
7168ae330e8105 James Morse     2025-05-15  1155  		sep = true;
7168ae330e8105 James Morse     2025-05-15  1156  	}
7168ae330e8105 James Morse     2025-05-15  1157  	seq_putc(seq, '\n');
7168ae330e8105 James Morse     2025-05-15  1158  	mutex_unlock(&rdtgroup_mutex);
7168ae330e8105 James Morse     2025-05-15  1159  	cpus_read_unlock();
7168ae330e8105 James Morse     2025-05-15 @1160  	return 0;
7168ae330e8105 James Morse     2025-05-15  1161  }
7168ae330e8105 James Morse     2025-05-15  1162  

:::::: The code at line 1160 was first introduced by commit
:::::: 7168ae330e8105296210b2b2d31d791d5c073345 x86,fs/resctrl: Move the resctrl filesystem code to live in /fs/resctrl

:::::: TO: James Morse <james.morse@arm.com>
:::::: CC: Borislav Petkov (AMD) <bp@alien8.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
