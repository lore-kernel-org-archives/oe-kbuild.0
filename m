Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CBE726290
	for <oe-kbuild@lists.linux.dev>; Wed, 20 May 2026 00:11:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779235905; cv=none; b=NR/uC7oM2J3G3pEQV2HZOvAJW//qmILf5BmTB2j2YzArk89+xH47hrHktrJUeiRHWIZhIQ9nt20i43nJzm1qD28BkMBFmBznBLLiAxq+4Jx/M91FYjnN712cNoMTbDkGzLGCwhFtoHdlryfY8Pril33curCQSQEWlwRO1PZtbJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779235905; c=relaxed/simple;
	bh=VFqCWrHIBXSB0gxGXUyAQcVefvYBy92RI5Ennm5UGFQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U74/88gECRwvtN+o9UZ7L775tPxamhWw2eLDKRmhMiiKHEetb2d7vDH97mh2KmQg/hNtcpoS78xF6LS9cNjcbavSSwcW8hvgfA3UwDi7rF97DnUY1Yn9sPv6xKxINobGvyyQ/oJ1Q018ciKdmIWESKTedlocmzEyU+TV4raCtBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b8jDF51S; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b8jDF51S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779235903; x=1810771903;
  h=date:from:to:cc:subject:message-id;
  bh=VFqCWrHIBXSB0gxGXUyAQcVefvYBy92RI5Ennm5UGFQ=;
  b=b8jDF51SrSPbhi0ARnWILSwrbYplKD8Z6qGkat0RuWHUjpkqa+A8sm6f
   ZbaEDw9ElpgBQ2xmaclAetSSZSBD0ia0mkyTmhaqxvumMulsj8f7X2Yzv
   ivnBVtoJ82qRMB+zGgh7vLWNsOpBdTSaUEcZkFX72DUFTUAH60PEJnSgJ
   EFYPdzEdIZm//eBSYAG31vPC/hu8yDVY9QSzYKYGlwu++no0PD60uXehi
   1rhYLVZLhlVZIxoBYhD2wOrBoVvbd4F/8/MDiP/29e6Xlk/hPgj/KKuIB
   wGH4vlRUH17iWbehD0wJ41UAcAf+vWSHkPUfqEy2CRGh5H3Xt7G3oArMQ
   Q==;
X-CSE-ConnectionGUID: FxpoqazLQYi9yuTMpt0pSQ==
X-CSE-MsgGUID: CxQz7+3QR1Sk2TTDRD/dsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="91232740"
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="91232740"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2026 17:11:41 -0700
X-CSE-ConnectionGUID: //xgESWXT6uhlh1k/vrtvQ==
X-CSE-MsgGUID: 9S/LrBWPRsS6Jnkgy6ioWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,243,1770624000"; 
   d="scan'208";a="263450265"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 19 May 2026 17:11:40 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPUXC-000000002Bx-01te;
	Wed, 20 May 2026 00:11:38 +0000
Date: Wed, 20 May 2026 08:02:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/edac/skx_common.c:230:26-27: ERROR: invalid
 reference to the index variable of the iterator on line 217
Message-ID: <202605200738.iYE7RxwB-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
CC: Tony Luck <tony.luck@intel.com>

Hi Qiuxu,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   27fa82620cbaa89a7fc11ac3057701d598813e87
commit: 9fc67b11703fe9d8a5617ccacec2a452e455fa52 EDAC/{skx_common,imh}: Add EDAC driver for Intel Diamond Rapids servers
date:   6 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-r063-20260520 (https://download.01.org/0day-ci/archive/20260520/202605200738.iYE7RxwB-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9fc67b11703f ("EDAC/{skx_common,imh}: Add EDAC driver for Intel Diamond Rapids servers")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605200738.iYE7RxwB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/edac/skx_common.c:230:26-27: ERROR: invalid reference to the index variable of the iterator on line 217

vim +230 drivers/edac/skx_common.c

d9207cf7760f5f Qiuxu Zhuo 2025-02-14  162  
2397f795735219 Qiuxu Zhuo 2024-10-15  163  static bool skx_adxl_decode(struct decoded_addr *res, enum error_source err_src)
88a242c9874044 Qiuxu Zhuo 2019-01-30  164  {
30b47b71fdc009 Qiuxu Zhuo 2025-07-31  165  	int i, lmc, len = 0;
29b8e84fbc23cb Tony Luck  2019-08-15  166  	struct skx_dev *d;
88a242c9874044 Qiuxu Zhuo 2019-01-30  167  
88a242c9874044 Qiuxu Zhuo 2019-01-30  168  	if (res->addr >= skx_tohm || (res->addr >= skx_tolm &&
88a242c9874044 Qiuxu Zhuo 2019-01-30  169  				      res->addr < BIT_ULL(32))) {
88a242c9874044 Qiuxu Zhuo 2019-01-30  170  		edac_dbg(0, "Address 0x%llx out of range\n", res->addr);
88a242c9874044 Qiuxu Zhuo 2019-01-30  171  		return false;
88a242c9874044 Qiuxu Zhuo 2019-01-30  172  	}
88a242c9874044 Qiuxu Zhuo 2019-01-30  173  
88a242c9874044 Qiuxu Zhuo 2019-01-30  174  	if (adxl_decode(res->addr, adxl_values)) {
88a242c9874044 Qiuxu Zhuo 2019-01-30  175  		edac_dbg(0, "Failed to decode 0x%llx\n", res->addr);
88a242c9874044 Qiuxu Zhuo 2019-01-30  176  		return false;
88a242c9874044 Qiuxu Zhuo 2019-01-30  177  	}
88a242c9874044 Qiuxu Zhuo 2019-01-30  178  
a36667037a0c0e Qiuxu Zhuo 2024-10-15  179  	/*
a36667037a0c0e Qiuxu Zhuo 2024-10-15  180  	 * GNR with a Flat2LM memory configuration may mistakenly classify
a36667037a0c0e Qiuxu Zhuo 2024-10-15  181  	 * a near-memory error(DDR5) as a far-memory error(CXL), resulting
a36667037a0c0e Qiuxu Zhuo 2024-10-15  182  	 * in the incorrect selection of decoded ADXL components.
a36667037a0c0e Qiuxu Zhuo 2024-10-15  183  	 * To address this, prefetch the decoded far-memory controller ID
a36667037a0c0e Qiuxu Zhuo 2024-10-15  184  	 * and adjust the error source to near-memory if the far-memory
a36667037a0c0e Qiuxu Zhuo 2024-10-15  185  	 * controller ID is invalid.
a36667037a0c0e Qiuxu Zhuo 2024-10-15  186  	 */
a36667037a0c0e Qiuxu Zhuo 2024-10-15  187  	if (skx_res_cfg && skx_res_cfg->type == GNR && err_src == ERR_SRC_2LM_FM) {
a36667037a0c0e Qiuxu Zhuo 2024-10-15  188  		res->imc = (int)adxl_values[component_indices[INDEX_MEMCTRL]];
a36667037a0c0e Qiuxu Zhuo 2024-10-15  189  		if (res->imc == -1) {
a36667037a0c0e Qiuxu Zhuo 2024-10-15  190  			err_src = ERR_SRC_2LM_NM;
a36667037a0c0e Qiuxu Zhuo 2024-10-15  191  			edac_dbg(0, "Adjust the error source to near-memory.\n");
a36667037a0c0e Qiuxu Zhuo 2024-10-15  192  		}
a36667037a0c0e Qiuxu Zhuo 2024-10-15  193  	}
a36667037a0c0e Qiuxu Zhuo 2024-10-15  194  
88a242c9874044 Qiuxu Zhuo 2019-01-30  195  	res->socket  = (int)adxl_values[component_indices[INDEX_SOCKET]];
2397f795735219 Qiuxu Zhuo 2024-10-15  196  	if (err_src == ERR_SRC_2LM_NM) {
2f4348e5a86198 Qiuxu Zhuo 2021-06-11  197  		res->imc     = (adxl_nm_bitmap & BIT_NM_MEMCTRL) ?
2f4348e5a86198 Qiuxu Zhuo 2021-06-11  198  			       (int)adxl_values[component_indices[INDEX_NM_MEMCTRL]] : -1;
2f4348e5a86198 Qiuxu Zhuo 2021-06-11  199  		res->channel = (adxl_nm_bitmap & BIT_NM_CHANNEL) ?
2f4348e5a86198 Qiuxu Zhuo 2021-06-11  200  			       (int)adxl_values[component_indices[INDEX_NM_CHANNEL]] : -1;
2f4348e5a86198 Qiuxu Zhuo 2021-06-11  201  		res->dimm    = (adxl_nm_bitmap & BIT_NM_DIMM) ?
2f4348e5a86198 Qiuxu Zhuo 2021-06-11  202  			       (int)adxl_values[component_indices[INDEX_NM_DIMM]] : -1;
14646de48bd779 Qiuxu Zhuo 2022-07-22  203  		res->cs      = (adxl_nm_bitmap & BIT_NM_CS) ?
14646de48bd779 Qiuxu Zhuo 2022-07-22  204  			       (int)adxl_values[component_indices[INDEX_NM_CS]] : -1;
2f4348e5a86198 Qiuxu Zhuo 2021-06-11  205  	} else {
88a242c9874044 Qiuxu Zhuo 2019-01-30  206  		res->imc     = (int)adxl_values[component_indices[INDEX_MEMCTRL]];
88a242c9874044 Qiuxu Zhuo 2019-01-30  207  		res->channel = (int)adxl_values[component_indices[INDEX_CHANNEL]];
88a242c9874044 Qiuxu Zhuo 2019-01-30  208  		res->dimm    = (int)adxl_values[component_indices[INDEX_DIMM]];
14646de48bd779 Qiuxu Zhuo 2022-07-22  209  		res->cs      = (int)adxl_values[component_indices[INDEX_CS]];
2f4348e5a86198 Qiuxu Zhuo 2021-06-11  210  	}
88a242c9874044 Qiuxu Zhuo 2019-01-30  211  
91ded20fa2fefe Qiuxu Zhuo 2025-07-31  212  	if (res->imc < 0) {
29b8e84fbc23cb Tony Luck  2019-08-15  213  		skx_printk(KERN_ERR, "Bad imc %d\n", res->imc);
29b8e84fbc23cb Tony Luck  2019-08-15  214  		return false;
29b8e84fbc23cb Tony Luck  2019-08-15  215  	}
29b8e84fbc23cb Tony Luck  2019-08-15  216  
29b8e84fbc23cb Tony Luck  2019-08-15 @217  	list_for_each_entry(d, &dev_edac_list, list) {
29b8e84fbc23cb Tony Luck  2019-08-15  218  		if (d->imc[0].src_id == res->socket) {
29b8e84fbc23cb Tony Luck  2019-08-15  219  			res->dev = d;
29b8e84fbc23cb Tony Luck  2019-08-15  220  			break;
29b8e84fbc23cb Tony Luck  2019-08-15  221  		}
29b8e84fbc23cb Tony Luck  2019-08-15  222  	}
29b8e84fbc23cb Tony Luck  2019-08-15  223  
29b8e84fbc23cb Tony Luck  2019-08-15  224  	if (!res->dev) {
29b8e84fbc23cb Tony Luck  2019-08-15  225  		skx_printk(KERN_ERR, "No device for src_id %d imc %d\n",
29b8e84fbc23cb Tony Luck  2019-08-15  226  			   res->socket, res->imc);
29b8e84fbc23cb Tony Luck  2019-08-15  227  		return false;
29b8e84fbc23cb Tony Luck  2019-08-15  228  	}
29b8e84fbc23cb Tony Luck  2019-08-15  229  
30b47b71fdc009 Qiuxu Zhuo 2025-07-31 @230  	lmc = skx_get_mc_mapping(d, res->imc);
30b47b71fdc009 Qiuxu Zhuo 2025-07-31  231  	if (lmc < 0) {
30b47b71fdc009 Qiuxu Zhuo 2025-07-31  232  		skx_printk(KERN_ERR, "No lmc for imc %d\n", res->imc);
30b47b71fdc009 Qiuxu Zhuo 2025-07-31  233  		return false;
30b47b71fdc009 Qiuxu Zhuo 2025-07-31  234  	}
30b47b71fdc009 Qiuxu Zhuo 2025-07-31  235  
30b47b71fdc009 Qiuxu Zhuo 2025-07-31  236  	res->imc = lmc;
d9207cf7760f5f Qiuxu Zhuo 2025-02-14  237  
88a242c9874044 Qiuxu Zhuo 2019-01-30  238  	for (i = 0; i < adxl_component_count; i++) {
88a242c9874044 Qiuxu Zhuo 2019-01-30  239  		if (adxl_values[i] == ~0x0ull)
88a242c9874044 Qiuxu Zhuo 2019-01-30  240  			continue;
88a242c9874044 Qiuxu Zhuo 2019-01-30  241  
88a242c9874044 Qiuxu Zhuo 2019-01-30  242  		len += snprintf(adxl_msg + len, MSG_SIZE - len, " %s:0x%llx",
88a242c9874044 Qiuxu Zhuo 2019-01-30  243  				adxl_component_names[i], adxl_values[i]);
88a242c9874044 Qiuxu Zhuo 2019-01-30  244  		if (MSG_SIZE - len <= 0)
88a242c9874044 Qiuxu Zhuo 2019-01-30  245  			break;
88a242c9874044 Qiuxu Zhuo 2019-01-30  246  	}
88a242c9874044 Qiuxu Zhuo 2019-01-30  247  
fe32f366931a95 Qiuxu Zhuo 2022-09-01  248  	res->decoded_by_adxl = true;
fe32f366931a95 Qiuxu Zhuo 2022-09-01  249  
88a242c9874044 Qiuxu Zhuo 2019-01-30  250  	return true;
88a242c9874044 Qiuxu Zhuo 2019-01-30  251  }
88a242c9874044 Qiuxu Zhuo 2019-01-30  252  

:::::: The code at line 230 was first introduced by commit
:::::: 30b47b71fdc0091db5a4fa9503ad630aeb0ab3eb EDAC/skx_common: Swap memory controller index mapping

:::::: TO: Qiuxu Zhuo <qiuxu.zhuo@intel.com>
:::::: CC: Tony Luck <tony.luck@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
