Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD7F1C1AD4
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Dec 2024 07:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733900824; cv=none; b=lonShuCtKwMgS6rWS6a4nTve9O08tVyw/6E2ybcHJVM8a9/cNjUIib7xA2U9Lb1vVPwXHF37zbJukR5Il7JGItHaQBaIngkdgTrn4QZsj2kv0tnZZe66KumN2orykPly7fdNTCNPRrnLdPhRlYke+bK1L7IUb41UhdKCvcA6+Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733900824; c=relaxed/simple;
	bh=4BpRmNw1kP9YQILyt3kzz4zc3WooNvYns0ZWCTs/lmQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=u8jIpImPeYtf4V2E9WFB3gPGCVmTIjYxk46Gdtxcc8+ZlnyyRQW21NU6jnr1QtHrNV7BfjGsXSJRXLKAeuUWUePIeAJY2Fmh8z8w0uVrcwDtEVEelOKyYqtbM6T4STCwVFSzgyIq1bgfI0Olmnfeu0Hop5KKsaln3bkhtfbEhwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gY61sjKG; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gY61sjKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733900823; x=1765436823;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4BpRmNw1kP9YQILyt3kzz4zc3WooNvYns0ZWCTs/lmQ=;
  b=gY61sjKGEmk2F5lWd3OvRgvUcaV8erUo0t6hR+yBo0/H91D/PbKT/ZHx
   g4wmLol8dbO9bSvkf/cbO9Gg92K9ih6Nnil3GSCvWkpa4L1uClrBmR1ZY
   fPMtXn5rM6m1vi/xDaCZlDOhSY9EfVbf+Ja+762BAw6ibRCt9WaiEAoit
   kHy70gvVBA3BGCqWdOtFE6qvrZHO2n7jmzh/3+os0Ag9AiYW5n6H/nPq4
   JEN10NZ6RQK6BWsRY2rw0PVyR2Pegyyx67HNkRdKyCRQz2vnfEIRnrOy0
   /oVicshR9zDprtUXtEq1Z50bLDpn2xmtZUAsnOY9rsOAi3Thi5dL45EfN
   Q==;
X-CSE-ConnectionGUID: i67uGGi0RuKzgulbDh2UPw==
X-CSE-MsgGUID: j84o20+RTSaaEzNmW8DB0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="34408205"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="34408205"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2024 23:07:03 -0800
X-CSE-ConnectionGUID: MN05LsWVRtGc4E3Zy62Oig==
X-CSE-MsgGUID: QDurJrfJSI+JwBcK7CwJBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="126524578"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 10 Dec 2024 23:07:01 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tLGoE-0006O1-1c;
	Wed, 11 Dec 2024 07:06:58 +0000
Date: Wed, 11 Dec 2024 15:06:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/wireless/ath/ath12k/mac.c:2552:21-27: opportunity for
 str_enable_disable(psmode)
Message-ID: <202412111439.BQZKWZM7-lkp@intel.com>
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
head:   f92f4749861b06fed908d336b4dee1326003291b
commit: 54ca3308a23c5fc0cd5c53d86918217834626c44 wifi: ath12k: enable 802.11 power save mode in station mode
date:   10 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 10 months ago
config: arm-randconfig-r054-20241211 (https://download.01.org/0day-ci/archive/20241211/202412111439.BQZKWZM7-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412111439.BQZKWZM7-lkp@intel.com/

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
