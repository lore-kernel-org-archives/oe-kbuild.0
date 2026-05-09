Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EB763C1F
	for <oe-kbuild@lists.linux.dev>; Sat,  9 May 2026 13:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778332649; cv=none; b=C5FsTA5Z2PupvFuMrfMLJOGfOwzBQQyVHkQ3V8DaB+ejduK8AXrMQ04lb2lSLZuKLoDDfYh8uVy2SMCl0VoqQJEDe9h2xLGGmzo7XyYmEyXPBttAmOr7PiLtyhLEfYPbKo/rQqglG6IfjqMUvPXPtbSex+pNU9Da60d6aRqf8Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778332649; c=relaxed/simple;
	bh=KftafnlxBzpEM8yJcnW2r9OaZUwwTo5D+DwJLkfT1HY=;
	h=Date:From:To:Subject:Message-ID; b=dFbFqgHyYEPX9jxBd6tp+8BoG18M3S+IcwYjisaxHnBM387J2N8+LYNUswDexfxrIEptPyAUS2wHwVp3s+tndDWa2MfoEnMjlbFawd1ei+pc26VNMMOLNIriNSjfuEYHOHXWKsWGWZIQ8ACyE1CEh2y80qHRerRh94TI5nNsYPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DHhmonVd; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DHhmonVd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778332648; x=1809868648;
  h=date:from:to:subject:message-id;
  bh=KftafnlxBzpEM8yJcnW2r9OaZUwwTo5D+DwJLkfT1HY=;
  b=DHhmonVddycbh1NPbR6w6w3Z6AoBpJEXGCAPvZykw7wCSrMlueoTPCMG
   Z/sIA6qgIbYJZwrVJiXJ/3kEeMa81knpMcol4KLWHq86QpTLs13h77H87
   TbJnNEGSv55MYRt/a6y1WI+G9thaz7WO2tQIgFvCm7NYaLl6YF6oQ9xBY
   KixyjBF3ua/o+s8Sxp7fxOaNhrZyprbZ6SbewzRxsOJEoTwUYSrrdAd5z
   Ff3J3DnSCI0+rl8iWITFnf5Iz70wBXOuN7h1nUnOM8I7jUNh3flXba46Q
   pRiQJk8d4WVErQW0EbXUQ0+eJIZAeqrtaoaGrI3+ZyQwDUIfKNhv3Vk0C
   g==;
X-CSE-ConnectionGUID: ztm3I4kuT3Oap6jxSUHzpQ==
X-CSE-MsgGUID: 6r326edsQFKBEzqLBV+kJg==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="66821815"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="66821815"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 06:17:27 -0700
X-CSE-ConnectionGUID: LOGm3GSrQC6+7Ap5mukD+g==
X-CSE-MsgGUID: 3HCMXpXlTje5/ayYvqpoog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="232513142"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 09 May 2026 06:17:27 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLhYb-000000007TF-0YBT
	for oe-kbuild@lists.linux.dev;
	Sat, 09 May 2026 13:17:25 +0000
Date: Sat, 09 May 2026 15:17:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [asahilinux:bits/080-wifi 39/45] checkpatch:
 WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
Message-ID: <202605091533.KWdqpFCk-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hector Martin <marcan@marcan.st>

tree:   https://github.com/AsahiLinux/linux bits/080-wifi
head:   78cd847ab20728e707899cbb43a3eccce2686dfd
commit: 0a0cf195ed3181654a5759e8b4a98b4163579eeb [39/45] [brcmfmac] Support new join parameter structure versions
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260509/202605091533.KWdqpFCk-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#780: FILE: drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h:710:
+	__le32 active_time; /* -1 use default, dwell time per channel for
+				 * active scanning

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#783: FILE: drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h:713:
+	__le32 passive_time; /* -1 use default, dwell time per channel
+				 * for passive scanning

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#786: FILE: drivers/net/wireless/broadcom/brcm80211/brcmfmac/fwil_types.h:716:
+	__le32 home_time; /* -1 use default, dwell time for the home
+				 * channel between channel scans

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
