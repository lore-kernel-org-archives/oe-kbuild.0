Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB68156661
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 00:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779324892; cv=none; b=bZDuM/LLfl2VigLm+bn2kIhmRX1mcsB1E7Cmlevy9KAwMP4BWuZtRnNZDGmtNzD2VZLmZ4mXlayZj+m7FwHiJGEDX204JseYTcE7JuPmZ1TkymX7voAhfiCO8QQxN/m0q45euNizyBackvEfxeopWb0Ip9iKszlhQufkEEnrDjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779324892; c=relaxed/simple;
	bh=/pEAmT1A3Q2gGlkCeuRr+dcqaMlL5jSRbiKO6UKYB1k=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NUEL8gp/7Xx/1seZ3FY8VtZJYJcO95JHmB/RvbkDFe+TmLRNEOtZLBcV+Wnz3Ls67Vqk4aV4cKHbrzRqDEeIDelj8LuELOO4IevH6ki9ODG8VD+qBrfa9NZnx4PZVjC7O/Uvo2f6ZHwZNTjklUSRWVh1/FqWeU4ZncTUOzci86A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N6MBhdW2; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N6MBhdW2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779324889; x=1810860889;
  h=date:from:to:cc:subject:message-id;
  bh=/pEAmT1A3Q2gGlkCeuRr+dcqaMlL5jSRbiKO6UKYB1k=;
  b=N6MBhdW25d6hnqmKflF5019UZcjd73IuTgEkFfnyfIwJBewX+5ImxTXF
   Uk4UlHAyz4HVbrJLzniO+Tjr5jLKQN2sBBRDmMREw7CPgyik1yDBIUyfD
   8Yz/XjoNb/q0SgclpCHuWu1Sjv1tp2AA/w7MelWlsVWhJ//y/oXOOiW+c
   bNKqJkEwbVRFjhhnqwASeezFlonaaH/ohxOahedyaa2Q0MtR7X3WfFkjE
   gBafTmHaWh4ku689NQ0sNs0lGEys6MC8RplhBz7bPAWq4YQil1dfh/5ED
   tQagCL2ExvKUhihbQVINGJxMKY9kj8WHkP4vlQjvlhBsecpjt4utTJonO
   w==;
X-CSE-ConnectionGUID: GoiRiDmySIOsma/nohHwaQ==
X-CSE-MsgGUID: 2k/9MSIzRoCUwYN00Y4aqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="80138716"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="80138716"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 17:54:49 -0700
X-CSE-ConnectionGUID: IjZSYz8ERomaOqiaeyWBJw==
X-CSE-MsgGUID: dKA4xqbRTDGEsTTbUrfwBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="245395242"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 20 May 2026 17:54:47 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPrgT-00000000Air-2EJI;
	Thu, 21 May 2026 00:54:45 +0000
Date: Thu, 21 May 2026 02:53:55 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [spacemit:dt-for-next 22/28]
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/thermal@d4018000:
 failed to match any schema with compatible: ['spacemit,k1-tsensor']
Message-ID: <202605210213.b2jLD0Aw-lkp@intel.com>
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
CC: Yixun Lan <dlan@gentoo.org>
TO: Shuwei Wu <shuwei.wu@mailbox.org>
CC: Yixun Lan <dlan@kernel.org>

tree:   https://github.com/spacemit-com/linux dt-for-next
head:   6edd9a0d32e1ef81133b8cb5b3bb3157a44da4d1
commit: 247c77ff5806bcd6a5ff802718de1f0aa2bcba6c [22/28] riscv: dts: spacemit: Add thermal sensor for K1 SoC
:::::: branch date: 16 hours ago
:::::: commit date: 17 hours ago
config: riscv-randconfig-2051 (https://download.01.org/0day-ci/archive/20260521/202605210213.b2jLD0Aw-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605210213.b2jLD0Aw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605210213.b2jLD0Aw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/thermal@d4018000: failed to match any schema with compatible: ['spacemit,k1-tsensor']
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: /soc/dma-bus/spi@d401c000: failed to match any schema with compatible: ['spacemit,k1-spi']
--
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/thermal@d4018000: failed to match any schema with compatible: ['spacemit,k1-tsensor']
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: /soc/dma-bus/spi@d401c000: failed to match any schema with compatible: ['spacemit,k1-spi']
--
>> arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /soc/thermal@d4018000: failed to match any schema with compatible: ['spacemit,k1-tsensor']
   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: /soc/dma-bus/spi@d401c000: failed to match any schema with compatible: ['spacemit,k1-spi']
--
>> arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /soc/thermal@d4018000: failed to match any schema with compatible: ['spacemit,k1-tsensor']
   arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: /soc/dma-bus/spi@d401c000: failed to match any schema with compatible: ['spacemit,k1-spi']
--
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: /soc/thermal@d4018000: failed to match any schema with compatible: ['spacemit,k1-tsensor']
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: /soc/dma-bus/spi@d401c000: failed to match any schema with compatible: ['spacemit,k1-spi']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
