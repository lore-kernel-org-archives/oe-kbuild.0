Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53154366
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 00:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747526495; cv=none; b=RwccLEbCDw0wzxFqt/UliQ1S0P5/+NBWrxc1H5dZVZwlVJIvEjAmHd0aCYrdm+gR+zcYQYlbmVtUi8zdXYj/tZyCfZgZKzs9P2RJpy3igEZxDZ5Wzl9stefmDNoWekRPxf5jna4JmkHbUkIpGhJlMVGvWgGY2ROHRJOU7HRzmQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747526495; c=relaxed/simple;
	bh=37v9oNVdrdzDUj+bcmYAjRtxTkBxfIJucwZeU3Xi/aM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MUY68schtUWbIyuEEgWyyEg+/L+xokWQgqAnJDlYL/nCY6gtXtIuSYRchpC/WzMVhW58TWzZYfe6DPJlad7yokuO3jJmPh7I2s0Ac7LHyPzBx8QXYpHP30J+wAgIVWxFTYB8fymmU0IekwHmdZhs4sm4d3NxBaJ8qkiS9EcYyjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hRHe7bT1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hRHe7bT1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747526493; x=1779062493;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=37v9oNVdrdzDUj+bcmYAjRtxTkBxfIJucwZeU3Xi/aM=;
  b=hRHe7bT1+cVPUTDdXbAyKTN+HdrGiqTLhNgcMNjHjCwUPyUmPFAt/lwY
   CDPWakNFJ99Ic26d1FfP60uF/hqqzqXqppuKwYBcT/NMBeeBJZ/oB7jyR
   7efG+vlSzYEmRqA4JSdi+M5aNPQLzNbflkoMa7u6yQ/l4rQPuOtmDfa7o
   Cjq7rTGwI7ES4UILBrIppbBFeYSXc9h7umTYUr69YKvjy2SahcICo17Fk
   yw0WXtsA3e/FPFKAqasYp7/DyOxvqA1NOwmtgygd01QetAUz9nnNybRwX
   4bBhhKSufEYrXZtt1PQ5dOimCsGEkQzuoAjq3HGiDtZdhenU23gWXzKV8
   g==;
X-CSE-ConnectionGUID: o3u9C32PRfqh2UnpfRgU/Q==
X-CSE-MsgGUID: ZcM3I39MRQ2ef06aI+bD/A==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="60098585"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="60098585"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 17:01:32 -0700
X-CSE-ConnectionGUID: uoNKqJjlRIurcKlJa7218A==
X-CSE-MsgGUID: NowKaJEmSSSyIeWOZwmqgw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="143895813"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 17 May 2025 17:01:31 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGRT7-000KVR-0r;
	Sun, 18 May 2025 00:01:29 +0000
Date: Sun, 18 May 2025 08:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:pending-deferred 23/61]
 drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env()
 error: buffer overflow 'local_non_psd->power' 5 <= 15
Message-ID: <202505180703.Kr9OfQRP-lkp@intel.com>
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
TO: Baochen Qiang <quic_bqiang@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
CC: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git pending-deferred
head:   52c1e49f8c69a630f3dbe7dd79c52979cdad19d2
commit: cccbb9d0dd6ab9e3353066217e9ab5b44bd761d3 [23/61] wifi: ath12k: add parse of transmit power envelope element
:::::: branch date: 26 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-161-20250518 (https://download.01.org/0day-ci/archive/20250518/202505180703.Kr9OfQRP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505180703.Kr9OfQRP-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'local_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15
drivers/net/wireless/ath/ath12k/mac.c:9812 ath12k_mac_parse_tx_pwr_env() error: buffer overflow 'reg_non_psd->power' 5 <= 15

Old smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:1505 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'nontx->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:1493 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'elem->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:6285 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:6287 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:11674 ath12k_mac_hw_register() error: uninitialized symbol 'cap'.

vim +9812 drivers/net/wireless/ath/ath12k/mac.c

d889913205cf7e Kalle Valo    2022-11-28  9754  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9755  static void ath12k_mac_parse_tx_pwr_env(struct ath12k *ar,
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9756  					struct ath12k_link_vif *arvif)
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9757  {
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9758  	struct ieee80211_bss_conf *bss_conf = ath12k_mac_get_link_bss_conf(arvif);
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9759  	struct ath12k_reg_tpc_power_info *tpc_info = &arvif->reg_tpc_info;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9760  	struct ieee80211_parsed_tpe_eirp *local_non_psd, *reg_non_psd;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9761  	struct ieee80211_parsed_tpe_psd *local_psd, *reg_psd;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9762  	struct ieee80211_parsed_tpe *tpe = &bss_conf->tpe;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9763  	enum wmi_reg_6g_client_type client_type;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9764  	struct ath12k_reg_info *reg_info;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9765  	struct ath12k_base *ab = ar->ab;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9766  	bool psd_valid, non_psd_valid;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9767  	int i;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9768  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9769  	reg_info = ab->reg_info[ar->pdev_idx];
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9770  	client_type = reg_info->client_type;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9771  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9772  	local_psd = &tpe->psd_local[client_type];
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9773  	reg_psd = &tpe->psd_reg_client[client_type];
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9774  	local_non_psd = &tpe->max_local[client_type];
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9775  	reg_non_psd = &tpe->max_reg_client[client_type];
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9776  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9777  	psd_valid = local_psd->valid | reg_psd->valid;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9778  	non_psd_valid = local_non_psd->valid | reg_non_psd->valid;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9779  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9780  	if (!psd_valid && !non_psd_valid) {
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9781  		ath12k_warn(ab,
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9782  			    "no transmit power envelope match client power type %d\n",
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9783  			    client_type);
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9784  		return;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9785  	};
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9786  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9787  	if (psd_valid) {
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9788  		tpc_info->is_psd_power = true;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9789  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9790  		tpc_info->num_pwr_levels = max(local_psd->count,
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9791  					       reg_psd->count);
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9792  		if (tpc_info->num_pwr_levels > ATH12K_NUM_PWR_LEVELS)
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9793  			tpc_info->num_pwr_levels = ATH12K_NUM_PWR_LEVELS;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9794  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9795  		for (i = 0; i < tpc_info->num_pwr_levels; i++) {
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9796  			tpc_info->tpe[i] = min(local_psd->power[i],
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9797  					       reg_psd->power[i]) / 2;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9798  			ath12k_dbg(ab, ATH12K_DBG_MAC,
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9799  				   "TPE PSD power[%d] : %d\n",
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9800  				   i, tpc_info->tpe[i]);
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9801  		}
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9802  	} else {
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9803  		tpc_info->is_psd_power = false;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9804  		tpc_info->eirp_power = 0;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9805  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9806  		tpc_info->num_pwr_levels = max(local_non_psd->count,
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9807  					       reg_non_psd->count);
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9808  		if (tpc_info->num_pwr_levels > ATH12K_NUM_PWR_LEVELS)
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9809  			tpc_info->num_pwr_levels = ATH12K_NUM_PWR_LEVELS;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9810  
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9811  		for (i = 0; i < tpc_info->num_pwr_levels; i++) {
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18 @9812  			tpc_info->tpe[i] = min(local_non_psd->power[i],
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9813  					       reg_non_psd->power[i]) / 2;
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9814  			ath12k_dbg(ab, ATH12K_DBG_MAC,
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9815  				   "non PSD power[%d] : %d\n",
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9816  				   i, tpc_info->tpe[i]);
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9817  		}
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9818  	}
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9819  }
cccbb9d0dd6ab9 Baochen Qiang 2025-04-18  9820  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
