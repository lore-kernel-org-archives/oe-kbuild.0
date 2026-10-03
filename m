Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62299282F14
	for <oe-kbuild@lists.linux.dev>; Sat,  3 Oct 2026 02:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790993269; cv=none; b=gY1oKQ0nI5ofU+Q/uByO7JJBm+Sy9/MP5/Np6zlpNpLEQ+/kHiAOnq2ve9Q3PrYl1Cqip+Oob1g9yVJ1GsP2AOL8nwqfRNCaB0C2VVB58zSQJRkQg9eUOIfNABoqXUtDKQuis2wC2y/Vh0rTBglEMMmmQcQTBQpOpI6QZMvD95Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790993269; c=relaxed/simple;
	bh=5pfFpHIiNPZSBoOTLF9y/SGTx5AsuibCfsf1hmf0Xvo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FhBbV4NzPQiLAfrPQH1gK8EiE7X7deWid1SPkYV+xQBHtzen8ckOAR3vapRydhmlmeVOpvLM/+6c6tZmK5ndvFvMeRGppS5aIBIjaVFAdaf4vrvwp5sblZ/98QW33V5kIHpQ6eWNnhMA5hsrVXmouW1kvz83oWPQaLBeOwM1l2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RAoLWrh+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RAoLWrh+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790993268; x=1822529268;
  h=date:from:to:cc:subject:message-id;
  bh=5pfFpHIiNPZSBoOTLF9y/SGTx5AsuibCfsf1hmf0Xvo=;
  b=RAoLWrh+mggD9LNrhAq3WdcyskEPCODT8/CEthe4vD+pTvTW4vTBvYZS
   u0GgeTqFX6CgfZmzlHfnyvfqcho5wMCkEF9t6XlGnH2+P8thMYD9UIDs5
   ShCYVzmRB2T0zxs2OKz6tFEbAYrILyG7ZcbuJD5WBcvHcRTBL4Dmyi2lZ
   TwUvVhXm8inOwrdiE+MGy/PwJsE3USII7j3B7Vc/d3lECCOu5+sZFl+/j
   t3bPesySWKVjmz0r+XnTIxsuYR/21Syo31gFBS/yszbOC4nvkReRQ7Fue
   hlnKzSN2FbfISUqjC+T+zVDnAfInH1+qBxZVB+bIgJioBw1+JrMrVwNiW
   g==;
X-CSE-ConnectionGUID: m3NvyUbOQ3e7MFZkHneWFQ==
X-CSE-MsgGUID: 2D0QcrcmRnyqXaCGA6AP0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11923"; a="90617435"
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="90617435"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2026 19:07:47 -0700
X-CSE-ConnectionGUID: Ac61DxdnS6q8oq9L4P7PQg==
X-CSE-MsgGUID: KbC8QuQVTz+aRH/gEwZnyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,136,1787036400"; 
   d="scan'208";a="304327596"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 02 Oct 2026 19:07:45 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCpA7-00000000TfF-2WoA;
	Sat, 03 Oct 2026 02:07:43 +0000
Date: Sat, 03 Oct 2026 10:07:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Warning: drivers/pci/probe.c:3084 function parameter
 'bridge' not described in 'pci_hotplug_reserved_buses'
Message-ID: <202610030938.zXk8GZmt-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "bisect to a FBC not belonging to original linux-review patches: branch: linux-review/Maciej-Grochowski/PCI-Add-pci-hpreserve-to-reserve-memory-windows-for-a-hotplug-bridge/20261002-213110, commit: ba39a19e2543f3162546c8194741e7120abbf7fb"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Maciej Grochowski <maciej.grochowski@sony.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Maciej-Grochowski/PCI-Add-pci-hpreserve-to-reserve-memory-windows-for-a-hotplug-bridge/20261002-213110
head:   ba39a19e2543f3162546c8194741e7120abbf7fb
commit: ba39a19e2543f3162546c8194741e7120abbf7fb PCI: Allow pci=hpreserve= to reserve bus numbers for a hotplug bridge
date:   6 hours ago
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: sparc-defconfig (https://download.01.org/0day-ci/archive/20261003/202610030938.zXk8GZmt-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261003/202610030938.zXk8GZmt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610030938.zXk8GZmt-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/pci/probe.c:3084 function parameter 'bridge' not described in 'pci_hotplug_reserved_buses'
>> Warning: drivers/pci/probe.c:3084 expecting prototype for pci_scan_child_bus_extend(). Prototype was for pci_hotplug_reserved_buses() instead

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
