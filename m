Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F12EA1D63EF
	for <oe-kbuild@lists.linux.dev>; Wed, 29 Oct 2025 03:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761710173; cv=none; b=RFRYCF5NSnRX39qgPOGSQdVrJ/1bF1KvqKXccQGegAZntHzgzbxcY5v62tW29JJcaIZFkICAb8G3TRYaU4uhjYukNAhuh4UiDcktyEDMu4kpiZeEtTQLoCnVxTyUul+QdJT6O2wl04ACnS+0z10T9X+1keY5Mun/JVhFXmjFGWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761710173; c=relaxed/simple;
	bh=G0jiT0qP7ioRKxumW9Ut729Pe7cY4EFxtVFETdVeWqA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qVw2dulKe4GcyRYo79KEJkUN8WxlgTq+HdqhKGsWMqi9NFzx6gFzHkr4kA7ttpBTXfVOvFHeR0OUCQJyKxZGmicQUEMLxw1TcBWZXoeleDvXgib2ty0aHgo/2aq9iwW1Q7lstyZlAhNZectGV+5ws0HDGz6Ex056UwBMi3JWvm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R/fN5K7B; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R/fN5K7B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761710171; x=1793246171;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G0jiT0qP7ioRKxumW9Ut729Pe7cY4EFxtVFETdVeWqA=;
  b=R/fN5K7BROsymcqnw6rkkA5URY8opmOxKQECkE8ULUhpUBt5QrxNV9v7
   iF0GVnHPnpSaQRE2bYKBzsIptUeA5dr1DBj7pWHEqTL2g9rQFeA69fvlh
   VfZTPgE1QZn2T9fU0dNaHfNSZXYPxxDWlldODKuUwYRCeQBxElojpszow
   ZuuWwCf6X1DSaXGeG7jE7SGY9BTV69mLmHWgebdRlYkLU4atC8fStD5V4
   2heShMtO9X9YqXg8FPcAt8kc3uMo80oC73RMe2BH81fJMW7npzVktpn/P
   e0bSpMbbaKIPGWLHUY8wn6eu8gPdw647zPIw7womU4G6W+Fhex3NmWXx8
   g==;
X-CSE-ConnectionGUID: i0VRd1/eTiiX25Ogf/gydQ==
X-CSE-MsgGUID: 8lz1L5AIRBOnPra8hAfXvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74112620"
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="74112620"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 20:56:11 -0700
X-CSE-ConnectionGUID: rC+PZFHLRu2aHBkORivSZQ==
X-CSE-MsgGUID: kWPcqdx5QK2z8QUPRM1Zvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="185883266"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 28 Oct 2025 20:56:09 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vDxI7-000000000s4-1Isv;
	Wed, 29 Oct 2025 03:56:07 +0000
Date: Wed, 29 Oct 2025 04:55:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/nios2/boot/dts/3c120_devboard.dtb: serial@4c80 (altr,uart-1.0):
 Unevaluated properties are not allowed ('current-speed', 'interrupt-parent',
 'interrupts', 'reg' were unexpected)
Message-ID: <202510290424.bG5rtREi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e53642b87a4f4b03a8d7e5f8507fc3cd0c595ea6
commit: f75794b6077ec729f57de9a1ad24f14d288a68bb dt-bindings: serial: Convert altr,uart-1.0 to DT schema
date:   5 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 5 months ago
config: nios2-randconfig-2052-20251024 (https://download.01.org/0day-ci/archive/20251029/202510290424.bG5rtREi-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
dtschema version: 2025.9.dev12+gd6be03029
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510290424.bG5rtREi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510290424.bG5rtREi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/nios2/boot/dts/3c120_devboard.dtb: /cpus/cpu@0: failed to match any schema with compatible: ['altr,nios2-1.0']
   arch/nios2/boot/dts/3c120_devboard.dtb: sopc@0 (altr,avalon): $nodename:0: 'sopc@0' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0: failed to match any schema with compatible: ['altr,avalon', 'simple-bus']
   arch/nios2/boot/dts/3c120_devboard.dtb: bridge@8000000 (simple-bus): $nodename:0: 'bridge@8000000' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/timer@400000: failed to match any schema with compatible: ['altr,timer-1.0']
   arch/nios2/boot/dts/3c120_devboard.dtb: /sopc@0/bridge@8000000/timer@8000: failed to match any schema with compatible: ['altr,timer-1.0']
   arch/nios2/boot/dts/3c120_devboard.dtb: serial@4d50 (altr,juart-1.0): 'interrupt-parent', 'interrupts', 'reg' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/serial/altr,juart-1.0.yaml
>> arch/nios2/boot/dts/3c120_devboard.dtb: serial@4c80 (altr,uart-1.0): Unevaluated properties are not allowed ('current-speed', 'interrupt-parent', 'interrupts', 'reg' were unexpected)
   	from schema $id: http://devicetree.org/schemas/serial/altr,uart-1.0.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
