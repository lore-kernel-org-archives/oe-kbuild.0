Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC971DE8A0
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 13:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728393096; cv=none; b=Tf6dbQTLeNaNhmidhts31X05BFgz30osNLrstd6MRCDF5dLiSF32VryK7B3D1w1aqrVMS7NhEIOu5caHICCwd3wavdIjJ3DKjCkJ/yPEAH/Bvw3RSLNWnCgbqnPKfxebCmKgbFSj0bXNLDeZceY07nNJRBfcTgNItzw+OoihbVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728393096; c=relaxed/simple;
	bh=Lx0DQ+7hNwzR3HF0xBYkN598ubISq0RZvVXx9Lb2tJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nQFvTjdEQkV0DjMfh5LAmf9DTu3j60SisheryG7XxpdhEqB5bO6E6TVWA70wXgEAZnRaWlI8Zx5VRxEQgPo+FF9eovMle/yMtA3dHkvb4GNlDY2ICkSENNIGsR4T5S+Oi6ZhWBgNa57lDPLcvB7NZzR01Fjqxyf3SDQ5cqR84U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T8oHvNTU; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T8oHvNTU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728393095; x=1759929095;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lx0DQ+7hNwzR3HF0xBYkN598ubISq0RZvVXx9Lb2tJ8=;
  b=T8oHvNTUW7JhRY3tMmUk+QuL6K4N9mpn7D8MXYMgwuRoNnK7PmOLwfL0
   1t0l33SG0BLKaposl0V0YC5DyhLRQszXxsZ+4IKYU4hRgG9ED4ssXW1If
   +cHy4rUWzDrSI+ek+AF4ASxbzEGiHNognWWCOANPtMaIROVFKfY647iF3
   xlavNQBa7sGEiO59vbwfPk6JBHypyIZ4Qc5+ZOY3G+aJVvnGidLdNnitQ
   AmshwL/MZs38kqz6hcZQAHsOwqyy7QkNBM92nXErINCPXmXL57KvbYuv4
   JfkqN2In2+EdBoNEDBr/LeBWhiL0b6jZJw/7TYb9DeP1CmawjCe4P9gf4
   w==;
X-CSE-ConnectionGUID: G4crKsomSq+jFra+DYzCDQ==
X-CSE-MsgGUID: jawRW1w/SKKQTzr3M7OqoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="27718358"
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="27718358"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 06:11:34 -0700
X-CSE-ConnectionGUID: 2wDauCDPRLCV6HL6H/RJAw==
X-CSE-MsgGUID: WB933kRMQB6vgr/9uTvDCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,187,1725346800"; 
   d="scan'208";a="80619209"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Oct 2024 06:11:32 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sy9zt-0007Uo-2B;
	Tue, 08 Oct 2024 13:11:29 +0000
Date: Tue, 8 Oct 2024 21:10:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:ath12k-mlo-qcn9274 24/81]
 drivers/net/wireless/ath/ath12k/mac.c:9467 ath12k_mac_allocate() error:
 uninitialized symbol 'ab'.
Message-ID: <202410082104.cJbVqilk-lkp@intel.com>
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
TO: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>
CC: Harshitha Prem <quic_hprem@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
head:   4ad14f50820745f9c2f425ba07ca8431bf2409ed
commit: 3567d8e86545ca1a3fbb464a7bff08f5016bb58f [24/81] wifi: ath12k: Introduce mlo_capable flag for device group
:::::: branch date: 4 days ago
:::::: commit date: 5 days ago
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241008/202410082104.cJbVqilk-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410082104.cJbVqilk-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:9467 ath12k_mac_allocate() error: uninitialized symbol 'ab'.

Old smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:1427 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'nontx->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:1415 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'elem->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:4828 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:4830 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:9400 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 9389)

vim +/ab +9467 drivers/net/wireless/ath/ath12k/mac.c

6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9416  
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9417  int ath12k_mac_allocate(struct ath12k_hw_group *ag)
8a742a79f90e3d3 Karthikeyan Periyasamy 2024-01-14  9418  {
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9419  	struct ath12k_hw *ah;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9420  	struct ath12k_base *ab;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9421  	struct ath12k_pdev_map pdev_map[ATH12K_GROUP_MAX_RADIO];
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9422  	int ret, i, j;
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9423  	u8 radio_per_hw;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9424  	int mac_id, device_id;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9425  	int total_radio, num_hw;
8a742a79f90e3d3 Karthikeyan Periyasamy 2024-01-14  9426  
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9427  	total_radio = 0;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9428  	for (i = 0; i < ag->num_devices; i++)
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9429  		total_radio += ag->ab[i]->num_radios;
8a742a79f90e3d3 Karthikeyan Periyasamy 2024-01-14  9430  
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9431  	/* All pdev get combined and register as single wiphy based on
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9432  	 * hardware group which participate in multi-link operation else
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9433  	 * each pdev get register separately.
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9434  	 */
3567d8e86545ca1 Karthikeyan Periyasamy 2024-09-27  9435  	if (ag->mlo_capable)
3567d8e86545ca1 Karthikeyan Periyasamy 2024-09-27  9436  		radio_per_hw = total_radio;
3567d8e86545ca1 Karthikeyan Periyasamy 2024-09-27  9437  	else
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9438  		radio_per_hw = 1;
3567d8e86545ca1 Karthikeyan Periyasamy 2024-09-27  9439  
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9440  	num_hw = total_radio / radio_per_hw;
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9441  
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9442  	if (WARN_ON(num_hw >= ATH12K_GROUP_MAX_RADIO))
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9443  		return -ENOSPC;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9444  
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9445  	ag->num_hw = 0;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9446  	device_id = 0;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9447  	mac_id = 0;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9448  	for (i = 0; i < num_hw; i++) {
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9449  		for (j = 0; j < radio_per_hw; j++) {
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9450  			ab = ag->ab[device_id];
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9451  			pdev_map[j].ab = ab;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9452  			pdev_map[j].pdev_idx = mac_id;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9453  			mac_id++;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9454  
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9455  			/* If mac_id falls beyond the current device MACs then
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9456  			 * move to next device
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9457  			 */
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9458  			if (mac_id >= ab->num_radios) {
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9459  				mac_id = 0;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9460  				device_id++;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9461  				ath12k_mac_set_device_defaults(ab);
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9462  			}
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9463  		}
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9464  
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9465  		ah = ath12k_mac_hw_allocate(ag, pdev_map, radio_per_hw);
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9466  		if (!ah) {
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18 @9467  			ath12k_warn(ab, "failed to allocate mac80211 hw device for hw_idx %d\n",
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9468  				    i);
04edb5dc68f4356 Nathan Chancellor      2024-02-05  9469  			ret = -ENOMEM;
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9470  			goto err;
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9471  		}
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9472  
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9473  		ag->ah[i] = ah;
6c252823bedb7f8 Karthikeyan Periyasamy 2024-04-12  9474  		ag->num_hw++;
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9475  	}
8a742a79f90e3d3 Karthikeyan Periyasamy 2024-01-14  9476  
8a742a79f90e3d3 Karthikeyan Periyasamy 2024-01-14  9477  	return 0;
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9478  
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9479  err:
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9480  	for (i = i - 1; i >= 0; i--) {
01f062770f9740d Karthikeyan Periyasamy 2024-04-12  9481  		ah = ath12k_ab_to_ah(ab, i);
01f062770f9740d Karthikeyan Periyasamy 2024-04-12  9482  		if (!ah)
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9483  			continue;
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9484  
01f062770f9740d Karthikeyan Periyasamy 2024-04-12  9485  		ath12k_mac_hw_destroy(ah);
01f062770f9740d Karthikeyan Periyasamy 2024-04-12  9486  		ath12k_ab_set_ah(ab, i, NULL);
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9487  	}
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9488  
6db6e70a17f6fb3 Karthikeyan Periyasamy 2024-01-18  9489  	return ret;
8a742a79f90e3d3 Karthikeyan Periyasamy 2024-01-14  9490  }
7af01e569529544 Baochen Qiang          2024-06-19  9491  

:::::: The code at line 9467 was first introduced by commit
:::::: 6db6e70a17f6fb3f2cfae31bb212a2179d0f6e6b wifi: ath12k: Introduce the container for mac80211 hw

:::::: TO: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
:::::: CC: Kalle Valo <quic_kvalo@quicinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
