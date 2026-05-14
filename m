Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D08E1519B4
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 22:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778797925; cv=none; b=jMj+yC7Ah3CcHxQ7vJLQXdxi37rZFwqHQCtTzkidxZoyDR+/rasvfKF0j35Lj2ShCnGy/kmzC+kNy4NJ/0WfLGBmkouHfDGSLnBVnzrspdGkxNed7epMyva3esk2Zf8oLVGLXNwMihZBybjIFUo3i+2J3vWubWogAagxsgNy3k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778797925; c=relaxed/simple;
	bh=kPdAOMRECLldRPjY3aNVCJGabAJ5DyRePGYPWCPbIqc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=M9rmoQ/xFg/vtN4uUaAlSc1A2f5MoDOhBmoUZEG8x3wv2wE9P7LHsgEnxGi0yURa6A40EUH5CY3TLoptK30mYKa5LmzONsaDRC5BB/d3QcxoyAmEQWu+7g3Lk2HC6nO6kdfZEpRNPiV/AFngNN8Zm0SamVp+59FM9OUoVb4Zh/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=il42YFih; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="il42YFih"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778797924; x=1810333924;
  h=date:from:to:cc:subject:message-id;
  bh=kPdAOMRECLldRPjY3aNVCJGabAJ5DyRePGYPWCPbIqc=;
  b=il42YFihVB1PGd0qJ3X57dkkOTgiLL5vhbwsdmBEnd0IVJ/KT2sgF+PZ
   GJq2TsQHoYvgT17wbXwTadtbf60Dw/VOQVasj7JR15xXncaO6gNii7R38
   It3NvzX21DcRNkCS2vDIpfjQwYtFzL/GNmYttRMWVOWSD1+zLhGKWqTK4
   kVY5PUsocnq3tpG47Ze6NMWZejTc1tFnobfMh0r5E5JcKX22YBP5vipHO
   ARNdyEmH9ZHbpxpapRLId16h4wnlTL8xSo2k0J9BacrJ0biZ/CyU9wYTV
   HNXAH+mS/3RgWZgGMq8R35zMR4pl8d+zfSDUuDxVCdIGGjKgibJaZEUli
   w==;
X-CSE-ConnectionGUID: 3kjVvno2TC6q3qnhXNwHUw==
X-CSE-MsgGUID: TlCgMvwWRCWuZS2xI1tBIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11786"; a="79706847"
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="79706847"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 15:32:03 -0700
X-CSE-ConnectionGUID: MhL/tWlvQh29JQxntq2eGw==
X-CSE-MsgGUID: pajpxhvQScugVuF89cgEcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,235,1770624000"; 
   d="scan'208";a="237518468"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2026 15:32:02 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNeb2-000000008t3-0uRy;
	Thu, 14 May 2026 22:32:00 +0000
Date: Fri, 15 May 2026 00:31:07 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb:
 clock-ext-can (fixed-clock): 'clock-frequency' is a required property
Message-ID: <202605150003.c29QlVt3-lkp@intel.com>
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
TO: Junhui Liu <junhui.liu@pigmoral.tech>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Junhui-Liu/clk-correct-clk_div_mask-return-value-for-width-32/20260514-193626
head:   c8101e2781502dbfc0888f26c6616483fc58c71d
commit: 959d134a42a126a4dc9692ddf4eff6a8b4804758 riscv: dts: anlogic: add clocks and CRU for DR1V90
date:   11 hours ago
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: riscv-randconfig-2051-20260514 (https://download.01.org/0day-ci/archive/20260515/202605150003.c29QlVt3-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 11.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260515/202605150003.c29QlVt3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605150003.c29QlVt3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-can (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml
>> arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: clock-ext-wdt (fixed-clock): 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
