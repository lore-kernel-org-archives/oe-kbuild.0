Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E93A6417
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Sep 2026 05:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790745988; cv=none; b=PEdx/SFfTuRYT7QdFM73vwav9Yy4/rWDNfS6X8qz9WkXyLwTsSBCVW7nDDk+VdjGB6R4btt3ZmElV0V8algMozgsV7h3O0kudf1PjlM/MG/4+xfIUn2wFN2QbELpssst4Wfc/zGq4CGVl/Zt3AQ4nmxkWBycdfxw+G3l/Gy2J3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790745988; c=relaxed/simple;
	bh=Nf5nvwbDlZhPuMhu2hITgWWGDvrPMAaH8yx1zuJGlRk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XvTfsU6Cac3UthQBcvV0iQcI67AeoTcGbuvtutimTKFrBcPY4+mR66HqCegpWUj/NbJtIc75xuJSVIc/qZY4eJE4VUozfPO1gQkcUamO3midwB69lyDO1YnLjR5Movf3X2c8E/RUrMH9GvehTXvnBDEaU3PlfcpSfyt36g73F1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crS52vxg; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crS52vxg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790745987; x=1822281987;
  h=date:from:to:cc:subject:message-id;
  bh=Nf5nvwbDlZhPuMhu2hITgWWGDvrPMAaH8yx1zuJGlRk=;
  b=crS52vxgklRXEz2L0RiwyaT7HcKwTM4n5C1vwvu1fmO9avyglttWmcK7
   BtINKcjPVOnPcpysBOrtf5gxtVr2CwDYN5RTJvLOPmiy2oKOaqA/BwZXw
   nssxDEmQsqUU411LKpf7pZ1uta0VJJVUrcmSMfyMrgx7YPLJrAklxJvMb
   efWZ+ogd/iZmRz2MrYGgTAE4tcTuJ2YT8WmAWoaXgY2m6IivM3fyUoV24
   iFQRZnKk1c7FOxyuziqMq2bje+DZ/9IYxifatOvxGf3VNDdtYWRKEzmgW
   G+KR9vQbaljXsuhRPcphdHvJGHjSrPW3u6B14RaLE8YSfoRQYoeuXs+sM
   A==;
X-CSE-ConnectionGUID: Tf9RCwuSScSi1NpiTOMovg==
X-CSE-MsgGUID: vfjMoSFWRX2bmLdHJQElIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11920"; a="90692772"
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="90692772"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Sep 2026 22:26:26 -0700
X-CSE-ConnectionGUID: AgsPEvj8SBeDVQVuFiVA/A==
X-CSE-MsgGUID: xKm1sAZ6Q2Gc2faU/sj3SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,132,1787036400"; 
   d="scan'208";a="303522582"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 29 Sep 2026 22:26:25 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xBmpi-000000001kt-3On5;
	Wed, 30 Sep 2026 05:26:22 +0000
Date: Wed, 30 Sep 2026 07:25:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [clk:clk-pile 38/39]
 arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-can
 (fixed-clock): 'clock-frequency' is a required property
Message-ID: <202609300718.zVoaMB62-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-clk@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
TO: Junhui Liu <junhui.liu@pigmoral.tech>
CC: Brian Masney <bmasney@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git clk-pile
head:   5795c6059d10afbc0fbcfe3cd95676be69b30bcb
commit: 7849521aaac26b17820642010ab7f7a222ec73d1 [38/39] riscv: dts: anlogic: add clocks and CRU for DR1V90
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: riscv-randconfig-2401-20260930 (https://download.01.org/0day-ci/archive/20260930/202609300718.zVoaMB62-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7615da10b75c57286a4032eac8bb43c1b8d2ba46)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260930/202609300718.zVoaMB62-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609300718.zVoaMB62-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-can (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
>> arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-wdt (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
