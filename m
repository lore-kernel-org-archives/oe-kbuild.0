Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 725E02A1B2
	for <oe-kbuild@lists.linux.dev>; Fri,  1 Nov 2024 11:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730461660; cv=none; b=Tf8H1BUBxjMEqQ5xTYP3GWyqow4Nd0w4jmNkx17kK+vLBwdxubmRRlRo/VM2bYKGWVOJ78huWIsWj5wj5qt2R5jBtl3uIuKuWuouHMECqxHet1jjiuuxueYoYjtvBMj7mq7fAmtExUS2LahWPQMU9oqsxdDuomu3a4yproBLkB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730461660; c=relaxed/simple;
	bh=Ca0R1Y2X0FknJYOYVq2S7iNA10cVqcMGroAPLrgt4hg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uYsQsXOctENpdtGaTGXLEV9J4vSFFWFinSMNytbxm2q9XY9gWzW2btcnu6T+tdmuBCSuEfyt1q+UQlYZsOTxHdNkJ16SG11skC60BxV/moA/H++OLb17cfk4AcDSal53+bqKAsz878yGeWSEMjy4pWuLvXB4P+OQBokBRi7WLaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FRAGjdLx; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FRAGjdLx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730461657; x=1761997657;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ca0R1Y2X0FknJYOYVq2S7iNA10cVqcMGroAPLrgt4hg=;
  b=FRAGjdLx1dX7lsJxVmOCOLZP31LROkP5jQBNWOBN9wgFn5zmLTcRm2MH
   IYQTrBbt8AuKe40HyoeGdGTT4so+fszyZjj+YzvseuLa5Wvy3gYvN1bkm
   +mUfUDUWsjTphhVm2Drhh34rZCvzVl4Bh/2hGUdcuLmMcwJW8H4NR+NgO
   Ck3GASRenKFr00g3qYT0TXM+02euaM9FIuyu4DZ24ZoqPAzGN0suem2K9
   KLic3p/n2C9mJa42c8F6UmWllwQYTH/3/by9DyqF7ebrkrLoodetN19Bt
   x8FIV1FCjtDcNJ7NpxRsOPhkKJ6aCzwiQLL4+jYgd+mHmd9oc7Y8fRelk
   w==;
X-CSE-ConnectionGUID: l1pHAQiCSlyGLb273dBsJg==
X-CSE-MsgGUID: lnn1TSPcSYyXorw95sFDXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="30185788"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="30185788"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2024 04:47:37 -0700
X-CSE-ConnectionGUID: /OgMS4wZS3S32ie+Y3uLJw==
X-CSE-MsgGUID: IvbxmAApQ7KTOVK0ROed9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,249,1725346800"; 
   d="scan'208";a="113776232"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 01 Nov 2024 04:47:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6q7p-000hUr-2K;
	Fri, 01 Nov 2024 11:47:33 +0000
Date: Fri, 1 Nov 2024 19:47:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/ath/ath12k/mac.c:2552:21-27: opportunity for
 str_enable_disable(psmode)
Message-ID: <202411011943.yYxnp7QA-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Baochen Qiang <quic_bqiang@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6c52d4da1c742cd01a797a4d0a2d3c5a60dc9bfe
commit: 54ca3308a23c5fc0cd5c53d86918217834626c44 wifi: ath12k: enable 802.11 power save mode in station mode
date:   9 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-103-20241101 (https://download.01.org/0day-ci/archive/20241101/202411011943.yYxnp7QA-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202411011943.yYxnp7QA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/wireless/ath/ath12k/mac.c:2552:21-27: opportunity for str_enable_disable(psmode)

vim +2552 drivers/net/wireless/ath/ath12k/mac.c

d889913205cf7eb Kalle Valo    2022-11-28  2512  
54ca3308a23c5fc Baochen Qiang 2024-02-01  2513  static void ath12k_mac_vif_setup_ps(struct ath12k_vif *arvif)
54ca3308a23c5fc Baochen Qiang 2024-02-01  2514  {
54ca3308a23c5fc Baochen Qiang 2024-02-01  2515  	struct ath12k *ar = arvif->ar;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2516  	struct ieee80211_vif *vif = arvif->vif;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2517  	struct ieee80211_conf *conf = &ath12k_ar_to_hw(ar)->conf;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2518  	enum wmi_sta_powersave_param param;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2519  	enum wmi_sta_ps_mode psmode;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2520  	int ret;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2521  	int timeout;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2522  	bool enable_ps;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2523  
54ca3308a23c5fc Baochen Qiang 2024-02-01  2524  	lockdep_assert_held(&ar->conf_mutex);
54ca3308a23c5fc Baochen Qiang 2024-02-01  2525  
54ca3308a23c5fc Baochen Qiang 2024-02-01  2526  	if (vif->type != NL80211_IFTYPE_STATION)
54ca3308a23c5fc Baochen Qiang 2024-02-01  2527  		return;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2528  
54ca3308a23c5fc Baochen Qiang 2024-02-01  2529  	enable_ps = arvif->ps;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2530  	if (enable_ps) {
54ca3308a23c5fc Baochen Qiang 2024-02-01  2531  		psmode = WMI_STA_PS_MODE_ENABLED;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2532  		param = WMI_STA_PS_PARAM_INACTIVITY_TIME;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2533  
54ca3308a23c5fc Baochen Qiang 2024-02-01  2534  		timeout = conf->dynamic_ps_timeout;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2535  		if (timeout == 0) {
54ca3308a23c5fc Baochen Qiang 2024-02-01  2536  			/* firmware doesn't like 0 */
54ca3308a23c5fc Baochen Qiang 2024-02-01  2537  			timeout = ieee80211_tu_to_usec(vif->bss_conf.beacon_int) / 1000;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2538  		}
54ca3308a23c5fc Baochen Qiang 2024-02-01  2539  
54ca3308a23c5fc Baochen Qiang 2024-02-01  2540  		ret = ath12k_wmi_set_sta_ps_param(ar, arvif->vdev_id, param,
54ca3308a23c5fc Baochen Qiang 2024-02-01  2541  						  timeout);
54ca3308a23c5fc Baochen Qiang 2024-02-01  2542  		if (ret) {
54ca3308a23c5fc Baochen Qiang 2024-02-01  2543  			ath12k_warn(ar->ab, "failed to set inactivity time for vdev %d: %i\n",
54ca3308a23c5fc Baochen Qiang 2024-02-01  2544  				    arvif->vdev_id, ret);
54ca3308a23c5fc Baochen Qiang 2024-02-01  2545  			return;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2546  		}
54ca3308a23c5fc Baochen Qiang 2024-02-01  2547  	} else {
54ca3308a23c5fc Baochen Qiang 2024-02-01  2548  		psmode = WMI_STA_PS_MODE_DISABLED;
54ca3308a23c5fc Baochen Qiang 2024-02-01  2549  	}
54ca3308a23c5fc Baochen Qiang 2024-02-01  2550  
54ca3308a23c5fc Baochen Qiang 2024-02-01  2551  	ath12k_dbg(ar->ab, ATH12K_DBG_MAC, "mac vdev %d psmode %s\n",
54ca3308a23c5fc Baochen Qiang 2024-02-01 @2552  		   arvif->vdev_id, psmode ? "enable" : "disable");
54ca3308a23c5fc Baochen Qiang 2024-02-01  2553  
54ca3308a23c5fc Baochen Qiang 2024-02-01  2554  	ret = ath12k_wmi_pdev_set_ps_mode(ar, arvif->vdev_id, psmode);
54ca3308a23c5fc Baochen Qiang 2024-02-01  2555  	if (ret)
54ca3308a23c5fc Baochen Qiang 2024-02-01  2556  		ath12k_warn(ar->ab, "failed to set sta power save mode %d for vdev %d: %d\n",
54ca3308a23c5fc Baochen Qiang 2024-02-01  2557  			    psmode, arvif->vdev_id, ret);
54ca3308a23c5fc Baochen Qiang 2024-02-01  2558  }
54ca3308a23c5fc Baochen Qiang 2024-02-01  2559  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
