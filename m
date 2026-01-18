Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EDA23B63F
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Jan 2026 18:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768759448; cv=none; b=j/5sV/+M+UJeE3w9UbJ+mfJ+VU1m0zsA0JMqhPBNYD7L2xlJEGWp4YL91pm4HrQnFd8ruAtzz7Er1E0zf1JO8pSpLw3kHkyUYGPRgWg8XUQvPLCgASd34RpzvoTQF9qsT/Vt+q9+mDZ19QB+ioWKCvXAaU9unenu5qtUqZw+TwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768759448; c=relaxed/simple;
	bh=ZZeuPJiA1b8TAW9B/n6GH1i3biYQeFS2j0a679RkPFY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=K6f6+YapMtCGcrkHHoNo7L5QnZWwtDV0VUSMUKR606zC6t3s6tALKdqiI1dsOspnueqoAlsE0RTP0Jx9b2jqexjmDKcepF0v19go69Um4VEa+aR/Os6y8ViF5sJaoGPDbve2phXiUGe9I56hjRTh42geNy472tw+80oohJgdyT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDK095M1; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDK095M1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768759445; x=1800295445;
  h=date:from:to:cc:subject:message-id;
  bh=ZZeuPJiA1b8TAW9B/n6GH1i3biYQeFS2j0a679RkPFY=;
  b=UDK095M1bciFq/uldRXbqWp3e2pBocCoAv0fiCa+I8DpWJV58LRmR/G3
   sGYnKT68uCldfqfzaR75uOR+TZm0ZxJW+TRJxeWA50fy9lShVv50EU1m7
   kZReeyvUd0Cxk96xP3udbQGSyP/Ls/rDg9eoRY9Cm/prEeaKs2XW7EnPS
   A5PCzdxbd2uPsfmVviVkHWMEym4meZQMbKeiwIKkQZzyElQtqRZeXh/qZ
   0PU1HGhhE46h9ttH7CzQKXPBAOU89PeX8Mfyx2ijBCQPUBCTYZ+yOi+6o
   msnhrDNptdDck6BWdwXNWhbetGuKOKmAQTyeiBlsJNozBht+zaXBlHOJp
   g==;
X-CSE-ConnectionGUID: QuTuUJxQTBmC5HyIsTvjEw==
X-CSE-MsgGUID: cW2WbdQbS5OZJD97HPac8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11675"; a="80623350"
X-IronPort-AV: E=Sophos;i="6.21,236,1763452800"; 
   d="scan'208";a="80623350"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2026 10:04:04 -0800
X-CSE-ConnectionGUID: FEotFbHnTbGwss5olTduVQ==
X-CSE-MsgGUID: rdQOel2PThyn7UzgM597qw==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jan 2026 10:04:04 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhX85-00000000N8k-23uZ;
	Sun, 18 Jan 2026 18:04:01 +0000
Date: Mon, 19 Jan 2026 02:03:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 1111/6849] sound/soc/sof/pm.c:17:1:
 sparse: sparse: bad integer constant expression
Message-ID: <202601190106.HkUFKPcH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

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
head:   46fe65a2c28ecf5df1a7475aba1f08ccf4c0ac1b
commit: c3e1549811747e4b4ff7e4bba691980d9dab2d9e [1111/6849] ASoC: SOF: Add support for on-demand DSP boot
:::::: branch date: 2 days ago
:::::: commit date: 5 weeks ago
config: i386-randconfig-061-20260118 (https://download.01.org/0day-ci/archive/20260119/202601190106.HkUFKPcH-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260119/202601190106.HkUFKPcH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601190106.HkUFKPcH-lkp@intel.com/

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
