Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5840A1BD9EE
	for <oe-kbuild@lists.linux.dev>; Mon, 18 Nov 2024 16:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731947524; cv=none; b=aFzfbcg+tJSdxqqocBstNY/DZJj9W9LwH/Z4GAG3n7sJUoK8qIWbNoQM7ArVO6uTKaNsqW1JDCd98JUWBkoUhjXYfhAOk/HZa7Cq7VVzSH6G789SONEQOxEwoE92ClFSCPFruikTfaz0b/v1WDMQ0HIHE4rT8RQvKtExtQrb73c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731947524; c=relaxed/simple;
	bh=flW2akXxajNg5+e9FtuY1BfpX+z9GkSDgIKTTnVsHks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C4diFXbChtUMfpa3+85KcQH7FQ0tGLINOnEpfGE5i/PVG70g5UH+NEXWM6ISoeRQk66IMNUiaX8O0M3dprGwGkRBZjALJNG28VZUwdGFdgVjUnQchGQhRip+M3HTGUBiDu50REDkqkzwiWfNE9ZC524dx75yxPhTZNvqTN6Pmmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JFES/jXK; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JFES/jXK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731947522; x=1763483522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=flW2akXxajNg5+e9FtuY1BfpX+z9GkSDgIKTTnVsHks=;
  b=JFES/jXKZr9pHLgfAbFHSEkFIYYHfGSUrY1PqKsLoRSnBWAtrRDDgK4y
   k6MzK49+4B8BX7Czps2ljpqe006k/wsg6pGDaU4YceYhh6U5H1K++MfU8
   +U90xVBWWFMvykLjr2NAp3qv37aDxtXB3VUWSVDnZNJTln0/Q+PeCXqId
   NZvSoY7QKM0rPI7vsJ9vhn2/5SEjD9bjLfx/rUIaSub2lcQVvTmKMZ+zf
   abNsGIRMhyq7rd+jVVip011zsbHFQe27C+GxYYeplzcC8fxhwOWnPY7nh
   NhqxxWwhIrT0qIpxa3QDfZL0XddiDIm8kG38VcbIZhisSUHF+I/qzKfur
   Q==;
X-CSE-ConnectionGUID: M6ckjikWSXyipv2vI3ponQ==
X-CSE-MsgGUID: Kp2/q0kNSHujtCscg4k4Lg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32012456"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="32012456"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 08:32:00 -0800
X-CSE-ConnectionGUID: U+sVnMaVT5ayT7xGsA+lqA==
X-CSE-MsgGUID: QRyI3s3jRpy5B4fXiXP4VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="89668185"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Nov 2024 08:31:59 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD4fM-0002Wx-0D;
	Mon, 18 Nov 2024 16:31:56 +0000
Date: Tue, 19 Nov 2024 00:31:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11222/12140]
 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:591
 dwmac1000_timestamp_interrupt() error: uninitialized symbol 'ptp_time'.
Message-ID: <202411190051.So7Kx8fH-lkp@intel.com>
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
TO: Maxime Chevallier <maxime.chevallier@bootlin.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Daniel Machon <daniel.machon@microchip.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ae58226b89ac0cffa05ba7357733776542e40216
commit: 477c3e1f63638a26cf5debbe3dad5e5929b4c31e [11222/12140] net: stmmac: Introduce dwmac1000 timestamping operations
:::::: branch date: 8 hours ago
:::::: commit date: 5 days ago
config: i386-randconfig-141-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190051.So7Kx8fH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411190051.So7Kx8fH-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c:591 dwmac1000_timestamp_interrupt() error: uninitialized symbol 'ptp_time'.

vim +/ptp_time +591 drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c

477c3e1f63638a Maxime Chevallier 2024-11-12  567  
477c3e1f63638a Maxime Chevallier 2024-11-12  568  void dwmac1000_timestamp_interrupt(struct stmmac_priv *priv)
477c3e1f63638a Maxime Chevallier 2024-11-12  569  {
477c3e1f63638a Maxime Chevallier 2024-11-12  570  	struct ptp_clock_event event;
477c3e1f63638a Maxime Chevallier 2024-11-12  571  	u32 ts_status, num_snapshot;
477c3e1f63638a Maxime Chevallier 2024-11-12  572  	unsigned long flags;
477c3e1f63638a Maxime Chevallier 2024-11-12  573  	u64 ptp_time;
477c3e1f63638a Maxime Chevallier 2024-11-12  574  	int i;
477c3e1f63638a Maxime Chevallier 2024-11-12  575  
477c3e1f63638a Maxime Chevallier 2024-11-12  576  	/* Clears the timestamp interrupt */
477c3e1f63638a Maxime Chevallier 2024-11-12  577  	ts_status = readl(priv->ptpaddr + GMAC3_X_TIMESTAMP_STATUS);
477c3e1f63638a Maxime Chevallier 2024-11-12  578  
477c3e1f63638a Maxime Chevallier 2024-11-12  579  	if (!(priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN))
477c3e1f63638a Maxime Chevallier 2024-11-12  580  		return;
477c3e1f63638a Maxime Chevallier 2024-11-12  581  
477c3e1f63638a Maxime Chevallier 2024-11-12  582  	num_snapshot = (ts_status & GMAC3_X_ATSNS) >> GMAC3_X_ATSNS_SHIFT;
477c3e1f63638a Maxime Chevallier 2024-11-12  583  
477c3e1f63638a Maxime Chevallier 2024-11-12  584  	for (i = 0; i < num_snapshot; i++) {
477c3e1f63638a Maxime Chevallier 2024-11-12  585  		read_lock_irqsave(&priv->ptp_lock, flags);
477c3e1f63638a Maxime Chevallier 2024-11-12  586  		stmmac_get_ptptime(priv, priv->ptpaddr, &ptp_time);
477c3e1f63638a Maxime Chevallier 2024-11-12  587  		read_unlock_irqrestore(&priv->ptp_lock, flags);
477c3e1f63638a Maxime Chevallier 2024-11-12  588  
477c3e1f63638a Maxime Chevallier 2024-11-12  589  		event.type = PTP_CLOCK_EXTTS;
477c3e1f63638a Maxime Chevallier 2024-11-12  590  		event.index = 0;
477c3e1f63638a Maxime Chevallier 2024-11-12 @591  		event.timestamp = ptp_time;
477c3e1f63638a Maxime Chevallier 2024-11-12  592  		ptp_clock_event(priv->ptp_clock, &event);
477c3e1f63638a Maxime Chevallier 2024-11-12  593  	}
477c3e1f63638a Maxime Chevallier 2024-11-12  594  }
477c3e1f63638a Maxime Chevallier 2024-11-12  595  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
