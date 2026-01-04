Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7675A27B50F
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jan 2026 22:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767564813; cv=none; b=pBKnn1wTZ8SG83We7t5DM/hKbg0I3/IM1243Y92UFDjeEgQsCgV3RCZ8TYlpYcNeaN2+XdBx3rDiC1k2JDYn6hZOmcmkcy63hCZIlmewB9/cy2XhBrV6usI2uZ3iW7cLS5bUtJuviEcQtTBIQpVsMOQY5+obWroYMk19M8ybKJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767564813; c=relaxed/simple;
	bh=3NdGP0WzwZuNAc3N6rMLKPLMATMto7j1DwVCJmH4tXA=;
	h=Date:From:To:Subject:Message-ID; b=F5X7UhaUf1TGLrGSVd50SylDX/HPwB32XLRHet5i3rL3RMuhQggzTUnEJsimPidXPmRaKh63f5pkX68Mw7zIae/RAZzm50xxkiuSkCWpLVU7CVBo/hj2fYASZXEikSe/AZ7UKEaNX0hn9xkVRTsa8FC8gdyid7hqnnjsgr0oqrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gp2kT40P; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gp2kT40P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767564811; x=1799100811;
  h=date:from:to:subject:message-id;
  bh=3NdGP0WzwZuNAc3N6rMLKPLMATMto7j1DwVCJmH4tXA=;
  b=gp2kT40PqzqAQNnFzzh5MiictDavnRM8JnNt1ljsqnIr0lVVSpWu0r/F
   885onEJ6Y8RdIIC5j77gPPdwl2dKOg2AW3G1Swgg3/vTAzyyfwRCuFN73
   ATLHFyhDqFOX7kRsJIQwouJp5HtQag81YjkFtwtjIloO0LPaMChc/0KUo
   gDJLYsjk1GjzGmmw26UMF5Svde/E0NowtEpZ/876ZJvrbTUNYxFeKSiVt
   COkdQy+OKnMF9XjwqTTCLD+FM039HCfqHhoZyLI3NETExctYwgbll/w0p
   gEABxuCDFz7Z1154z9xkAbL0gh3f5gOQcr24sWMmCHFFLAsQmPUL5NJo5
   Q==;
X-CSE-ConnectionGUID: EoaLfFq8QsCHiO3ULBmSWA==
X-CSE-MsgGUID: C32rxnPOQDSuzSaHEG19jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11661"; a="79663896"
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="79663896"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2026 14:13:30 -0800
X-CSE-ConnectionGUID: Q8YrsH+6SLuUXTA24dmFfA==
X-CSE-MsgGUID: lmCq3ixuSouOlBVWF1yKHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,202,1763452800"; 
   d="scan'208";a="206398100"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 04 Jan 2026 14:13:30 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcWLn-000000000xl-415w
	for oe-kbuild@lists.linux.dev;
	Sun, 04 Jan 2026 22:13:27 +0000
Date: Sun, 04 Jan 2026 23:13:23 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [jfern:rcu/pcpu-blkd-rcutorture-exp-testing 10/18]
 checkpatch: WARNING:REPEATED_WORD: Possible repeated word: 'call'
Message-ID: <202601042357.DdjnW3oW-lkp@intel.com>
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
TO: Joel Fernandes <joelagnelf@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git rcu/pcpu-blkd-rcutorture-exp-testing
head:   93b7149fabee79b3970d81a57b4e48fb140bb0d5
commit: 2142cde88b8dc9d0d74c8152248f7f62afa1eb4a [10/18] rcu: Promote blocked tasks before QS report in rcu_gp_init()
:::::: branch date: 38 minutes ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260104/202601042357.DdjnW3oW-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'call'
#15: 
Therefore, call call rcu_promote_blocked_tasks_rdp() for each offline CPU

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
