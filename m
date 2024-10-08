Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28108218598
	for <oe-kbuild@lists.linux.dev>; Tue,  8 Oct 2024 22:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728427516; cv=none; b=YDFpt+xYp5YyOiVMr99+xdo4JcnaV7NpTKhuWAeXNIRRn84P6ek9f9R+34C04s6pfd4bhOffjjf7NpkE88YOJgRAprZLJccHDO8ysy57PFOOc6EqJeSa9RyC5Hp0Tk4P2NIKXEofGVSJwNwlRDBIyuq65JqM5uFf+FW3GrQuLqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728427516; c=relaxed/simple;
	bh=TAV5yBayt0HpsL+It0bFim96CS5NWqTbSexaLJe2g9s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I/LLiNtkkLiMaOJqko3AgFUZYRhKS4Hf6lwMidV+1CftUEsjeiobZ7D/Rf6Uw5iStRQVzn70NwarjKqrnng3rTtz+EkXLxXZSJR+E2AQgTrW9gsGd53zLIcmJbRXx7eOv4JuhAo6YbFzAsmjUFj+anR5DaDxPZ+62ej5r870unI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhCy5n7A; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhCy5n7A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728427515; x=1759963515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TAV5yBayt0HpsL+It0bFim96CS5NWqTbSexaLJe2g9s=;
  b=BhCy5n7A49S3BnY9k25XeWZunaEb9S3pROpufmSnl9cshAGHgNYXYNje
   rlZk0qh6B/0c0MbXCR1oCyJtpV+ltruY88dxd9JsgFpf3LgN+rqIjioql
   K8K+Z96iO40Ha7RwMAZARO1KNa+JRVx2RE042Mf1vw7ujeZHxbduai8Ww
   eUMTnXVVma8IA4GM+CtgUVjL4YmXjVkJrvKJHC/W12WZjai3fwkA4Nd+e
   kwBd47w1PAApskaBGY/XX8sJWaJ39i1NhTIc6mEgQM8JGA6CrApwGSNyp
   WtIlAsrdEJZo3TY2nLmk52mjUqadxT8+OgAzy5+gOX/kgy0d838EnF47t
   Q==;
X-CSE-ConnectionGUID: yGIqEhA1S/esBGrhWRXS1A==
X-CSE-MsgGUID: KGqS53b/TtC++/K7s96mEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="31384520"
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="31384520"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Oct 2024 15:45:14 -0700
X-CSE-ConnectionGUID: gtPuCROySQKvZoMIxF2hGw==
X-CSE-MsgGUID: 7xo1bPmqSq+/u0g5292FQA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,188,1725346800"; 
   d="scan'208";a="75704640"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 08 Oct 2024 15:45:12 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syIx4-0008Ro-15;
	Tue, 08 Oct 2024 22:45:10 +0000
Date: Wed, 9 Oct 2024 06:45:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ath:ath12k-mlo-qcn9274 64/81]
 drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error:
 buffer overflow 'vif->link_conf' 15 <= 15
Message-ID: <202410090633.yjfmlMkr-lkp@intel.com>
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
TO: Sriram R <quic_srirrama@quicinc.com>
CC: Kalle Valo <quic_kvalo@quicinc.com>
CC: Rameshkumar Sundaram <quic_ramess@quicinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git ath12k-mlo-qcn9274
head:   7435d14d41d5d479a5e6a8a2cd4efdac9d928823
commit: 8e3d460d4c16e52a70ebfa7e1dd0bd20bf739888 [64/81] wifi: ath12k: Use mac80211 vif's link conf instead of bss_conf
:::::: branch date: 5 hours ago
:::::: commit date: 5 days ago
config: csky-randconfig-r072-20241008 (https://download.01.org/0day-ci/archive/20241009/202410090633.yjfmlMkr-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410090633.yjfmlMkr-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15
drivers/net/wireless/ath/ath12k/mac.c:517 ath12k_get_link_bss_conf() error: buffer overflow 'vif->link_conf' 15 <= 15

Old smatch warnings:
drivers/net/wireless/ath/ath12k/mac.c:1479 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'nontx->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:1467 ath12k_mac_set_arvif_ies() warn: potential spectre issue 'elem->data' [r] (local cap)
drivers/net/wireless/ath/ath12k/mac.c:4589 ath12k_mac_op_set_key() error: uninitialized symbol 'ret'.
drivers/net/wireless/ath/ath12k/mac.c:5793 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:5795 ath12k_conf_tx_uapsd() error: uninitialized symbol 'value'.
drivers/net/wireless/ath/ath12k/mac.c:10895 ath12k_mac_destroy() error: we previously assumed 'ab' could be null (see line 10884)
drivers/net/wireless/ath/ath12k/mac.c:10962 ath12k_mac_allocate() error: uninitialized symbol 'ab'.

vim +517 drivers/net/wireless/ath/ath12k/mac.c

d889913205cf7e Kalle Valo 2022-11-28  506  
8e3d460d4c16e5 Sriram R   2024-08-16  507  struct ieee80211_bss_conf *ath12k_get_link_bss_conf(struct ath12k_link_vif *arvif)
8e3d460d4c16e5 Sriram R   2024-08-16  508  {
8e3d460d4c16e5 Sriram R   2024-08-16  509  	struct ieee80211_vif *vif = arvif->ahvif->vif;
8e3d460d4c16e5 Sriram R   2024-08-16  510  	struct ieee80211_bss_conf *link_conf;
8e3d460d4c16e5 Sriram R   2024-08-16  511  	/* ieee80211_vif->link_conf[]s are rcu objects which requires rcu_read_lock()
8e3d460d4c16e5 Sriram R   2024-08-16  512  	 * to be held for safe access.
8e3d460d4c16e5 Sriram R   2024-08-16  513  	 */
8e3d460d4c16e5 Sriram R   2024-08-16  514  	if (arvif->link_id > IEEE80211_MLD_MAX_NUM_LINKS)
8e3d460d4c16e5 Sriram R   2024-08-16  515  		return NULL;
8e3d460d4c16e5 Sriram R   2024-08-16  516  	rcu_read_lock();
8e3d460d4c16e5 Sriram R   2024-08-16 @517  	link_conf = rcu_dereference(vif->link_conf[arvif->link_id]);
8e3d460d4c16e5 Sriram R   2024-08-16  518  	rcu_read_unlock();
8e3d460d4c16e5 Sriram R   2024-08-16  519  	return link_conf;
8e3d460d4c16e5 Sriram R   2024-08-16  520  }
8e3d460d4c16e5 Sriram R   2024-08-16  521  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
