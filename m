Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB16B3803E8
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 04:05:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776053143; cv=none; b=KcDHbGI4aCHzaFZ+8wmD/reDotMqlWaL4ywEmMvzlbBhR/HzrCur7m1N1dYkIe+avDg3Nc17VkqoLU3haLB/sPEYZspuN/aILCgJH4EFQ7Zl6g/1aKZC3rxDC5HXenTz+qzr8UcsiKvb78tzRT1Z1fCOaNn/3giCPA+4y3jLu3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776053143; c=relaxed/simple;
	bh=dm6OzpViKK6Y7fAzPVFFAQW97MSiPjlGca6poVopc1g=;
	h=Date:From:To:Subject:Message-ID; b=Xop09VSTo3iKp2vq4sEtNavOFBGRX8BQsBKtBJatyo+TuJ269OD9oxJc6Gz8CKAqmQ9yI2u7VmMFur8CY5Il+kI4deU/rupZ0t6D/PWinPPb9rJF2/6uqYUffususNEs49ZQv3DDFw81fgomxgPkopJSwfVAREW8CSuF4+VxncM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AxmZ+mPL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AxmZ+mPL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776053140; x=1807589140;
  h=date:from:to:subject:message-id;
  bh=dm6OzpViKK6Y7fAzPVFFAQW97MSiPjlGca6poVopc1g=;
  b=AxmZ+mPLMmCdplpzrfANsXpctCWSLFPBx8GuiUqMz4/k8fvgi25jVcmb
   B3Lf1tqac68b+nj+MS5e/azler82V69CYf+igUf9mG/LijskB7j3y/csb
   xZJCLnKHcLsuBlkxtAhy7uroiqnKbtvQQ7i9wm4T5tNvR/gh81ls5T47N
   lAiB8FZ3Ox75oPGvfj/y0qJ4IVnnTZ9mP/12ECI8rgDfHGYTIye431sZv
   BGrhWRuXhLEclul4o2hKQe4hyYmZdoJJ6VhaQb9Q6izCAEMuzZsC9+dMO
   unwpL0uLvnopSkaND9MT5RVQNRV564rFma/L1XW9xC4ebsHgJmAlhE7kQ
   g==;
X-CSE-ConnectionGUID: GJ/yWqItR5ie9y3juilcFA==
X-CSE-MsgGUID: B/7XSvOQRUeak9pvpVxl8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11757"; a="76858085"
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="76858085"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2026 21:05:39 -0700
X-CSE-ConnectionGUID: hnEwyPFYS+mpH38H38kQZg==
X-CSE-MsgGUID: E3kRCH1PRjqA1qzyqPdC6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,176,1770624000"; 
   d="scan'208";a="228806698"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 12 Apr 2026 21:05:39 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wC8YK-00000000BQH-1RTY
	for oe-kbuild@lists.linux.dev;
	Mon, 13 Apr 2026 04:05:36 +0000
Date: Mon, 13 Apr 2026 06:04:42 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [fustini:b4/ssqosid-cbqri-rqsc 6/12] checkpatch:
 WARNING:MINMAX: min() should probably be min_t(u64, cfg.rbwb, ctrl->bc.mrbwb)
Message-ID: <202604130544.yqAQAKeo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Drew Fustini <fustini@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b4/ssqosid-cbqri-rqsc
head:   8be3e4b5274548f46524c4c25b2324bc7e0cec63
commit: d5635584659589be81a42c6b03fdfafd27281932 [6/12] RISC-V: QoS: add resctrl arch callbacks for CBQRI controllers
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260413/202604130544.yqAQAKeo-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(u64, cfg.rbwb, ctrl->bc.mrbwb)
#347: FILE: arch/riscv/kernel/qos/qos_resctrl.c:743:
+		cfg.rbwb = min(cfg.rbwb, (u64)ctrl->bc.mrbwb);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
