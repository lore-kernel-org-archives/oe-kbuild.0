Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFCD725A33F
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 19:16:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766258204; cv=none; b=KuyBzr97clTHoS6SPIn8l8gYKCnsT2yJOcElVpnm7g+gedIKmtbJfCFPf+G029NekqvrsfDbsVBzUCtFNDq+4gW2lZMwoSWfLSLaA+bPAa0HwN9Fd3TMvyWxGT/Nf3IuRP3PjbfU4CQ6RNJl4zGdWYUD5gWhWvS8IBOKQI/5IaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766258204; c=relaxed/simple;
	bh=OcpWdQsf9Vytiody0nj9AKrHsyrNBGpfUDWZrPALkvE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=egz1IGhHel3t+bmRKBRdascaN0Vu39AcCfqZdkSFKf3OzVnbJgsTIwZKeq2pORvJRY/zfGKHHEk8NlEp36izkVP1Ea4Kqioj6lTv06t8l9PgqIwQ8/ROaR6YGWFx26qW1fJKQ2AMu8o4z9WAOkbe3BcuK744EFggNh7aVYQOy6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=evEYhAi0; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="evEYhAi0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766258203; x=1797794203;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OcpWdQsf9Vytiody0nj9AKrHsyrNBGpfUDWZrPALkvE=;
  b=evEYhAi0n6NuPNtK1TbN512SsOPWntosoZ71XV3V84RHBuHiEsiKsKl5
   GVQsUjUzuG5WyxZ+4c71u7XCPo9uSQkctti9wXYWyjPWphySmZAM0S6IW
   qTy3XYe0i2YPXFX39ljgSOBiXhfaYzuxRWhOpo9cnTIJqlGr7hznNOdB0
   3H1u7Lb0EgstyWTeP/bHZ22CueXmC11fsbaFMrzeVepyB2YMEIPvUau8C
   KMhPFUV4zBVDpTEd+EuZnP4Zsk3lKx0eYdHW6s3HQX+gAmcp/T8FpogWg
   ge6v2wG2Q/EoE1ScJpKtoIMErmh9edLgmgHv7i2inFk3WTrw7PbuI0gGM
   Q==;
X-CSE-ConnectionGUID: FHYKOXTEQb25hQnrVP8gBA==
X-CSE-MsgGUID: bWTCtQDjSnSvMg1+GZBKdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="78900165"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="78900165"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 11:16:42 -0800
X-CSE-ConnectionGUID: 4F176B+nQi+bkJJJ9R9GTw==
X-CSE-MsgGUID: X+dJ1gzhRRyAAjBtQcgmHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="199068935"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 20 Dec 2025 11:16:41 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vX2RS-0000000053x-43xn;
	Sat, 20 Dec 2025 19:16:38 +0000
Date: Sun, 21 Dec 2025 03:16:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1550/2671] sound/soc/sof/pm.c:17:1: sparse:
 sparse: bad integer constant expression
Message-ID: <202512210243.eBgbhrB8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: sound/soc/sof/pm.c:17:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Peter Ujfalusi <peter.ujfalusi@linux.intel.com>
CC: Mark Brown <broonie@kernel.org>
CC: Bard Liao <yung-chuan.liao@linux.intel.com>
CC: Kai Vehmanen <kai.vehmanen@linux.intel.com>
CC: Liam Girdwood <liam.r.girdwood@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
commit: c3e1549811747e4b4ff7e4bba691980d9dab2d9e [1550/2671] ASoC: SOF: Add support for on-demand DSP boot
:::::: branch date: 2 days ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-r121-20251217 (https://download.01.org/0day-ci/archive/20251221/202512210243.eBgbhrB8-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251221/202512210243.eBgbhrB8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512210243.eBgbhrB8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> sound/soc/sof/pm.c:17:1: sparse: sparse: bad integer constant expression
   sound/soc/sof/pm.c:17:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"
   sound/soc/sof/pm.c:18:1: sparse: sparse: bad integer constant expression
   sound/soc/sof/pm.c:18:1: sparse: sparse: static assertion failed: "MODULE_INFO(parm, ...) contains embedded NUL byte"

vim +17 sound/soc/sof/pm.c

8920153c6461da Liam Girdwood  2019-04-12  15  
c3e1549811747e Peter Ujfalusi 2025-12-15  16  static int override_on_demand_boot = -1;
c3e1549811747e Peter Ujfalusi 2025-12-15 @17  module_param_named(on_demand_boot, override_on_demand_boot, int, 0444);
c3e1549811747e Peter Ujfalusi 2025-12-15  18  MODULE_PARM_DESC(on_demand_boot, "Force on-demand DSP boot: 0 - disabled, 1 - enabled");
c3e1549811747e Peter Ujfalusi 2025-12-15  19  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
