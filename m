Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A580A937
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 21:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731877236; cv=none; b=R2B4yboYMBWiHqUBST9cXlk/fWozVZNt4vuoxNLQePEmqpbDa3/Vof7c2dBtKAQHG3lfaxR1ykLEPUo+iJitT+kfSYvbAiJ1YOtfHkMAmFFbLmOl5rqUl2bzPgRXp1PwtVkCfEQR/7bmZN85Ql6H6Vpj218ZZN2SiRgGzb6dgNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731877236; c=relaxed/simple;
	bh=gWtxJgHjz9Zqnl8Rui9AP9RMPrkj6efQAeA7RllES2U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DqzK4qdPOmKMMZAt19UgZHXX2/0+0k5DNRRGPD7WLiTsntmnwAHvGTsnW5YRFVYE2sAGimq4nje3txAceCsVNpIvpOTM/b2xxAdmsORnpLKJGQztd38kH0IpcnYymvEEBUhtezO0NtO/xD1Gi+7PIphazmrbGHz/ARXW74s2RtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FJIJT2FT; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FJIJT2FT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731877235; x=1763413235;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gWtxJgHjz9Zqnl8Rui9AP9RMPrkj6efQAeA7RllES2U=;
  b=FJIJT2FTsQVxvGqbmeiuKLMLN12K4ZIiBsxuSiSJooPewhCV2w/GDxAo
   RkRc2s9QNYP63mpLLLuh6GOxwmBUa3SEISVSxysgrgeuAtYcGGG/gk75I
   J4rpsOH6xz6xrOI1AElvr5Np3EPBjNF4d1avVrAypNps28AKdN2IbUCZ7
   uBsPyoOSPrjFHkPHXW7gdtzNy52Vy3Cv3IhzvHoFrbbj/v/sRJCP1h1J9
   H2tND971uox16RdCJAb+mT8wStEIZHGqKHTBJgZyKbtzt2Yrk3RYeUufP
   NFQmKzM9SQ4myFVPsfhv03BV9sB07f3n/JYprA4ukCTibra6sQj0sEo8+
   w==;
X-CSE-ConnectionGUID: AxISOgroSX2teYWIn9DouQ==
X-CSE-MsgGUID: BKamIOFRTzatYvXnNDNv2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="31578061"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="31578061"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2024 13:00:34 -0800
X-CSE-ConnectionGUID: vMlN4DcRTxSV4WpJzVFP8w==
X-CSE-MsgGUID: 9oecoW/BSeKEy/3SLgOTrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; 
   d="scan'208";a="89825330"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Nov 2024 13:00:33 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCmNi-00022P-1H;
	Sun, 17 Nov 2024 21:00:30 +0000
Date: Mon, 18 Nov 2024 05:00:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] arm64: dts: sprd: Remove unused and undocumented
 "constant_charge_voltage_max_microvolt" property
Message-ID: <202411180405.XcaybC5t-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20241115193409.3618257-1-robh@kernel.org>
References: <20241115193409.3618257-1-robh@kernel.org>
TO: "Rob Herring (Arm)" <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Orson Zhai <orsonzhai@gmail.com>
TO: Baolin Wang <baolin.wang@linux.alibaba.com>
TO: Chunyan Zhang <zhang.lyra@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Rob,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on krzk/for-next krzk-dt/for-next linus/master v6.12-rc7 next-20241115]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring-Arm/arm64-dts-sprd-Remove-unused-and-undocumented-constant_charge_voltage_max_microvolt-property/20241116-234553
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20241115193409.3618257-1-robh%40kernel.org
patch subject: [PATCH] arm64: dts: sprd: Remove unused and undocumented "constant_charge_voltage_max_microvolt" property
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: arm64-randconfig-051-20241117 (https://download.01.org/0day-ci/archive/20241118/202411180405.XcaybC5t-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)
dtschema version: 2024.12.dev1+gcabb5b9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241118/202411180405.XcaybC5t-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202411180405.XcaybC5t-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: fuel-gauge@a00: 'bat-detect-gpio' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/supply/sc27xx-fg.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: /soc/aon/pinctrl@402a0000: failed to match any schema with compatible: ['sprd,sc9860-pinctrl']
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: agcp: $nodename:0: 'agcp' does not match '^([a-z][a-z0-9\\-]+-bus|bus|localbus|soc|axi|ahb|apb)(@.+)?$'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: etb@10003000: 'in-ports' is a required property
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-tmc.yaml#
   arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: idle-states: 'cluster_pd', 'core_pd' do not match any of the regexes: '^(cpu|cluster)-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/cpu/idle-states.yaml#
>> arch/arm64/boot/dts/sprd/sp9860g-1h10.dtb: battery: 'internal-resistance-micro-ohms' does not match any of the regexes: '^ocv-capacity-table-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/power/supply/battery.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
