Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8B417A303
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Feb 2025 18:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740681348; cv=none; b=qi4EvsqGzfZsdOcDM/ihlEI2Y5IQ5TJCm/zhwW013AqP0BU+H42qwsm2qo8dy8Y2bHsoZ8aDx46glgtOQVwC6yvFbj936Rr4LYzO1Zqvn41rW2k7jPr5MzaKYvuYkJOPbDGxff8lIy9GKDKvVZC0gjGng9h39QojqDQ7zFbd5K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740681348; c=relaxed/simple;
	bh=Out74VhQslIC0c5dZtvFapSMg/Sgj0NKGdDGB0bFVNo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O00BEEYzfEdJgmJTmLG2gu0UAMCbSMxUld2OmP0F3aDp9O/pfs9zK/g7MPgl4hAUppKH4elSBcnedAr2pEpDorWUDywobCnGHlKheVhK3oReXo1FmCPWjbnuMxmuRvhAFc7jn9YnUROyKIhJy5Xne7bLpI2jfnDa5PZ3bYjLnvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SwXc8jiX; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SwXc8jiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740681345; x=1772217345;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Out74VhQslIC0c5dZtvFapSMg/Sgj0NKGdDGB0bFVNo=;
  b=SwXc8jiXnOcs9H6i39+PFYbUd5A0luSwaGiuyyP0xBcJbZtzQsNx8mQs
   M457B3Tpr7BZ+7mdvfL7hx95N26aEIIjsiurFfPyo8PklNRWgXl0OEY10
   nKPiCHeheH9rsDGmdI68VELtiU/5UmKGXmrs4QDEmBDt14J95TfqsEN9Y
   a2AGwozdXv6jVXICFGHumVcaaJ+NN0kCGbTfGgTnisYHppXfqgUAkWdSA
   Vtvje/PYuco9Xpv6R/d5x0i6C/7gZ2iy/6ZP8wcRejf/S+v+zrCxoghwl
   /AdQ6fd3g5atjXXVADSs905d9BrcMyKeA3Yry9xie+jRFXzQlb2Vr+9O6
   Q==;
X-CSE-ConnectionGUID: jrXtijG9RlOIpNhhLlDJmQ==
X-CSE-MsgGUID: FPhZpDMUSeqosCspkDSXDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40832346"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; 
   d="scan'208";a="40832346"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 10:35:44 -0800
X-CSE-ConnectionGUID: Pr7U7DHNTimX606RxCyvRg==
X-CSE-MsgGUID: fl8YMPd2S6CGx3a07pSMmw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="122341088"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 27 Feb 2025 10:35:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tnijU-000Ds6-12;
	Thu, 27 Feb 2025 18:35:40 +0000
Date: Fri, 28 Feb 2025 02:35:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 4/4] arm64: dts: marvell: cp11x: Add reset controller
 node
Message-ID: <202502280249.DWX7IdOX-lkp@intel.com>
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
In-Reply-To: <20250220232527.882888-5-dingwei@marvell.com>
References: <20250220232527.882888-5-dingwei@marvell.com>
TO: Wilson Ding <dingwei@marvell.com>
TO: linux-kernel@vger.kernel.org
TO: devicetree@vger.kernel.org
TO: linux-arm-kernel@lists.infradead.org
CC: andrew@lunn.ch
CC: gregory.clement@bootlin.com
CC: sebastian.hesselbarth@gmail.com
CC: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: p.zabel@pengutronix.de
CC: salee@marvell.com
CC: gakula@marvell.com
CC: Wilson Ding <dingwei@marvell.com>

Hi Wilson,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on arm64/for-next/core kvmarm/next rockchip/for-next shawnguo/for-next soc/for-next linus/master v6.14-rc4 next-20250227]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wilson-Ding/dt-bindings-reset-Add-Armada8K-reset-controller/20250221-072819
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250220232527.882888-5-dingwei%40marvell.com
patch subject: [PATCH v2 4/4] arm64: dts: marvell: cp11x: Add reset controller node
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: arm64-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250228/202502280249.DWX7IdOX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250228/202502280249.DWX7IdOX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502280249.DWX7IdOX-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:281.24-291.7: Warning (unit_address_vs_reg): /ap807/config-space@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:125.10-131.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/timer: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:133.8-137.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/pmu: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:281.24-291.7: Warning (unit_address_vs_reg): /ap807/config-space@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:125.10-131.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/timer: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:133.8-137.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/pmu: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/cn9130-crb.dtsi:177.10-200.4: Warning (avoid_unnecessary_addr_size): /cp0/config-space@f2000000/spi@700680/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:281.24-291.7: Warning (unit_address_vs_reg): /ap807/config-space@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp2/config-space@f6000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp2/config-space@f6000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp2/config-space@f6000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:125.10-131.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/timer: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:133.8-137.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/pmu: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:281.24-291.7: Warning (unit_address_vs_reg): /ap806/config-space@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:125.10-131.6: Warning (simple_bus_reg): /ap806/config-space@f0000000/timer: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:133.8-137.6: Warning (simple_bus_reg): /ap806/config-space@f0000000/pmu: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:281.24-291.7: Warning (unit_address_vs_reg): /ap807/config-space@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:125.10-131.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/timer: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:133.8-137.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/pmu: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:281.24-291.7: Warning (unit_address_vs_reg): /ap806/config-space@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:125.10-131.6: Warning (simple_bus_reg): /ap806/config-space@f0000000/timer: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:133.8-137.6: Warning (simple_bus_reg): /ap806/config-space@f0000000/pmu: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-7040-mochabin.dts:158.10-187.4: Warning (avoid_unnecessary_addr_size): /cp0/config-space@f2000000/spi@700680/flash@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:281.24-291.7: Warning (unit_address_vs_reg): /ap807/config-space@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:125.10-131.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/timer: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:133.8-137.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/pmu: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:281.24-291.7: Warning (unit_address_vs_reg): /ap807/config-space@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:125.10-131.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/timer: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:133.8-137.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/pmu: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:281.24-291.7: Warning (unit_address_vs_reg): /ap807/config-space@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:125.10-131.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/timer: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:133.8-137.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/pmu: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:281.24-291.7: Warning (unit_address_vs_reg): /ap806/config-space@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:125.10-131.6: Warning (simple_bus_reg): /ap806/config-space@f0000000/timer: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:133.8-137.6: Warning (simple_bus_reg): /ap806/config-space@f0000000/pmu: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:281.24-291.7: Warning (unit_address_vs_reg): /ap806/config-space@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:125.10-131.6: Warning (simple_bus_reg): /ap806/config-space@f0000000/timer: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:133.8-137.6: Warning (simple_bus_reg): /ap806/config-space@f0000000/pmu: missing or empty reg/ranges property
--
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:281.24-291.7: Warning (unit_address_vs_reg): /ap807/config-space@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp0/config-space@f2000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp1/config-space@f4000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:235.24-254.6: Warning (unit_address_vs_reg): /cp2/config-space@f6000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:256.24-275.6: Warning (unit_address_vs_reg): /cp2/config-space@f6000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:277.41-281.6: Warning (unit_address_vs_reg): /cp2/config-space@f6000000/system-controller@440000/reset-controller@268: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:125.10-131.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/timer: missing or empty reg/ranges property
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:133.8-137.6: Warning (simple_bus_reg): /ap807/config-space@f0000000/pmu: missing or empty reg/ranges property

vim +277 arch/arm64/boot/dts/marvell/armada-cp11x.dtsi

47cf40af64c35a6 Miquel Raynal         2019-10-04   46  
47cf40af64c35a6 Miquel Raynal         2019-10-04   47  &CP11X_NAME {
47cf40af64c35a6 Miquel Raynal         2019-10-04   48  	#address-cells = <2>;
47cf40af64c35a6 Miquel Raynal         2019-10-04   49  	#size-cells = <2>;
47cf40af64c35a6 Miquel Raynal         2019-10-04   50  	compatible = "simple-bus";
47cf40af64c35a6 Miquel Raynal         2019-10-04   51  	interrupt-parent = <&CP11X_LABEL(icu_nsr)>;
47cf40af64c35a6 Miquel Raynal         2019-10-04   52  	ranges;
47cf40af64c35a6 Miquel Raynal         2019-10-04   53  
47cf40af64c35a6 Miquel Raynal         2019-10-04   54  	config-space@CP11X_BASE {
47cf40af64c35a6 Miquel Raynal         2019-10-04   55  		#address-cells = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04   56  		#size-cells = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04   57  		compatible = "simple-bus";
47cf40af64c35a6 Miquel Raynal         2019-10-04   58  		ranges = <0x0 0x0 ADDRESSIFY(CP11X_BASE) 0x2000000>;
47cf40af64c35a6 Miquel Raynal         2019-10-04   59  
47cf40af64c35a6 Miquel Raynal         2019-10-04   60  		CP11X_LABEL(ethernet): ethernet@0 {
2994bf7705b4dca Marcin Wojtas         2022-10-14   61  			#address-cells = <1>;
2994bf7705b4dca Marcin Wojtas         2022-10-14   62  			#size-cells = <0>;
47cf40af64c35a6 Miquel Raynal         2019-10-04   63  			compatible = "marvell,armada-7k-pp22";
60523583b07cddc Konstantin Porotchkin 2021-02-11   64  			reg = <0x0 0x100000>, <0x129000 0xb000>, <0x220000 0x800>;
47cf40af64c35a6 Miquel Raynal         2019-10-04   65  			clocks = <&CP11X_LABEL(clk) 1 3>, <&CP11X_LABEL(clk) 1 9>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   66  				 <&CP11X_LABEL(clk) 1 5>, <&CP11X_LABEL(clk) 1 6>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   67  				 <&CP11X_LABEL(clk) 1 18>;
47cf40af64c35a6 Miquel Raynal         2019-10-04   68  			clock-names = "pp_clk", "gop_clk",
47cf40af64c35a6 Miquel Raynal         2019-10-04   69  				      "mg_clk", "mg_core_clk", "axi_clk";
47cf40af64c35a6 Miquel Raynal         2019-10-04   70  			marvell,system-controller = <&CP11X_LABEL(syscon0)>;
47cf40af64c35a6 Miquel Raynal         2019-10-04   71  			status = "disabled";
47cf40af64c35a6 Miquel Raynal         2019-10-04   72  			dma-coherent;
47cf40af64c35a6 Miquel Raynal         2019-10-04   73  
2994bf7705b4dca Marcin Wojtas         2022-10-14   74  			CP11X_LABEL(eth0): ethernet-port@0 {
47cf40af64c35a6 Miquel Raynal         2019-10-04   75  				interrupts = <39 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   76  					<43 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   77  					<47 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   78  					<51 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   79  					<55 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   80  					<59 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   81  					<63 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   82  					<67 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   83  					<71 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   84  					<129 IRQ_TYPE_LEVEL_HIGH>;
47cf40af64c35a6 Miquel Raynal         2019-10-04   85  				interrupt-names = "hif0", "hif1", "hif2",
47cf40af64c35a6 Miquel Raynal         2019-10-04   86  					"hif3", "hif4", "hif5", "hif6", "hif7",
47cf40af64c35a6 Miquel Raynal         2019-10-04   87  					"hif8", "link";
2994bf7705b4dca Marcin Wojtas         2022-10-14   88  				reg = <0>;
2994bf7705b4dca Marcin Wojtas         2022-10-14   89  				port-id = <0>; /* For backward compatibility. */
47cf40af64c35a6 Miquel Raynal         2019-10-04   90  				gop-port-id = <0>;
47cf40af64c35a6 Miquel Raynal         2019-10-04   91  				status = "disabled";
47cf40af64c35a6 Miquel Raynal         2019-10-04   92  			};
47cf40af64c35a6 Miquel Raynal         2019-10-04   93  
2994bf7705b4dca Marcin Wojtas         2022-10-14   94  			CP11X_LABEL(eth1): ethernet-port@1 {
47cf40af64c35a6 Miquel Raynal         2019-10-04   95  				interrupts = <40 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   96  					<44 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   97  					<48 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   98  					<52 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04   99  					<56 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  100  					<60 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  101  					<64 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  102  					<68 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  103  					<72 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  104  					<128 IRQ_TYPE_LEVEL_HIGH>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  105  				interrupt-names = "hif0", "hif1", "hif2",
47cf40af64c35a6 Miquel Raynal         2019-10-04  106  					"hif3", "hif4", "hif5", "hif6", "hif7",
47cf40af64c35a6 Miquel Raynal         2019-10-04  107  					"hif8", "link";
2994bf7705b4dca Marcin Wojtas         2022-10-14  108  				reg = <1>;
2994bf7705b4dca Marcin Wojtas         2022-10-14  109  				port-id = <1>; /* For backward compatibility. */
47cf40af64c35a6 Miquel Raynal         2019-10-04  110  				gop-port-id = <2>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  111  				status = "disabled";
47cf40af64c35a6 Miquel Raynal         2019-10-04  112  			};
47cf40af64c35a6 Miquel Raynal         2019-10-04  113  
2994bf7705b4dca Marcin Wojtas         2022-10-14  114  			CP11X_LABEL(eth2): ethernet-port@2 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  115  				interrupts = <41 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  116  					<45 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  117  					<49 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  118  					<53 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  119  					<57 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  120  					<61 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  121  					<65 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  122  					<69 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  123  					<73 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  124  					<127 IRQ_TYPE_LEVEL_HIGH>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  125  				interrupt-names = "hif0", "hif1", "hif2",
47cf40af64c35a6 Miquel Raynal         2019-10-04  126  					"hif3", "hif4", "hif5", "hif6", "hif7",
47cf40af64c35a6 Miquel Raynal         2019-10-04  127  					"hif8", "link";
2994bf7705b4dca Marcin Wojtas         2022-10-14  128  				reg = <2>;
2994bf7705b4dca Marcin Wojtas         2022-10-14  129  				port-id = <2>; /* For backward compatibility. */
47cf40af64c35a6 Miquel Raynal         2019-10-04  130  				gop-port-id = <3>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  131  				status = "disabled";
47cf40af64c35a6 Miquel Raynal         2019-10-04  132  			};
47cf40af64c35a6 Miquel Raynal         2019-10-04  133  		};
47cf40af64c35a6 Miquel Raynal         2019-10-04  134  
47cf40af64c35a6 Miquel Raynal         2019-10-04  135  		CP11X_LABEL(comphy): phy@120000 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  136  			compatible = "marvell,comphy-cp110";
47cf40af64c35a6 Miquel Raynal         2019-10-04  137  			reg = <0x120000 0x6000>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  138  			marvell,system-controller = <&CP11X_LABEL(syscon0)>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  139  			clocks = <&CP11X_LABEL(clk) 1 5>, <&CP11X_LABEL(clk) 1 6>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  140  				 <&CP11X_LABEL(clk) 1 18>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  141  			clock-names = "mg_clk", "mg_core_clk", "axi_clk";
47cf40af64c35a6 Miquel Raynal         2019-10-04  142  			#address-cells = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  143  			#size-cells = <0>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  144  
47cf40af64c35a6 Miquel Raynal         2019-10-04  145  			CP11X_LABEL(comphy0): phy@0 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  146  				reg = <0>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  147  				#phy-cells = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  148  			};
47cf40af64c35a6 Miquel Raynal         2019-10-04  149  
47cf40af64c35a6 Miquel Raynal         2019-10-04  150  			CP11X_LABEL(comphy1): phy@1 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  151  				reg = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  152  				#phy-cells = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  153  			};
47cf40af64c35a6 Miquel Raynal         2019-10-04  154  
47cf40af64c35a6 Miquel Raynal         2019-10-04  155  			CP11X_LABEL(comphy2): phy@2 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  156  				reg = <2>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  157  				#phy-cells = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  158  			};
47cf40af64c35a6 Miquel Raynal         2019-10-04  159  
47cf40af64c35a6 Miquel Raynal         2019-10-04  160  			CP11X_LABEL(comphy3): phy@3 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  161  				reg = <3>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  162  				#phy-cells = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  163  			};
47cf40af64c35a6 Miquel Raynal         2019-10-04  164  
47cf40af64c35a6 Miquel Raynal         2019-10-04  165  			CP11X_LABEL(comphy4): phy@4 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  166  				reg = <4>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  167  				#phy-cells = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  168  			};
47cf40af64c35a6 Miquel Raynal         2019-10-04  169  
47cf40af64c35a6 Miquel Raynal         2019-10-04  170  			CP11X_LABEL(comphy5): phy@5 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  171  				reg = <5>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  172  				#phy-cells = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  173  			};
47cf40af64c35a6 Miquel Raynal         2019-10-04  174  		};
47cf40af64c35a6 Miquel Raynal         2019-10-04  175  
47cf40af64c35a6 Miquel Raynal         2019-10-04  176  		CP11X_LABEL(mdio): mdio@12a200 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  177  			#address-cells = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  178  			#size-cells = <0>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  179  			compatible = "marvell,orion-mdio";
47cf40af64c35a6 Miquel Raynal         2019-10-04  180  			reg = <0x12a200 0x10>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  181  			clocks = <&CP11X_LABEL(clk) 1 9>, <&CP11X_LABEL(clk) 1 5>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  182  				 <&CP11X_LABEL(clk) 1 6>, <&CP11X_LABEL(clk) 1 18>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  183  			status = "disabled";
47cf40af64c35a6 Miquel Raynal         2019-10-04  184  		};
47cf40af64c35a6 Miquel Raynal         2019-10-04  185  
47cf40af64c35a6 Miquel Raynal         2019-10-04  186  		CP11X_LABEL(xmdio): mdio@12a600 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  187  			#address-cells = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  188  			#size-cells = <0>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  189  			compatible = "marvell,xmdio";
47cf40af64c35a6 Miquel Raynal         2019-10-04  190  			reg = <0x12a600 0x10>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  191  			clocks = <&CP11X_LABEL(clk) 1 5>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  192  				 <&CP11X_LABEL(clk) 1 6>, <&CP11X_LABEL(clk) 1 18>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  193  			status = "disabled";
47cf40af64c35a6 Miquel Raynal         2019-10-04  194  		};
47cf40af64c35a6 Miquel Raynal         2019-10-04  195  
47cf40af64c35a6 Miquel Raynal         2019-10-04  196  		CP11X_LABEL(icu): interrupt-controller@1e0000 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  197  			compatible = "marvell,cp110-icu";
47cf40af64c35a6 Miquel Raynal         2019-10-04  198  			reg = <0x1e0000 0x440>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  199  			#address-cells = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  200  			#size-cells = <1>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  201  
47cf40af64c35a6 Miquel Raynal         2019-10-04  202  			CP11X_LABEL(icu_nsr): interrupt-controller@10 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  203  				compatible = "marvell,cp110-icu-nsr";
47cf40af64c35a6 Miquel Raynal         2019-10-04  204  				reg = <0x10 0x20>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  205  				#interrupt-cells = <2>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  206  				interrupt-controller;
47cf40af64c35a6 Miquel Raynal         2019-10-04  207  				msi-parent = <&gicp>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  208  			};
47cf40af64c35a6 Miquel Raynal         2019-10-04  209  
47cf40af64c35a6 Miquel Raynal         2019-10-04  210  			CP11X_LABEL(icu_sei): interrupt-controller@50 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  211  				compatible = "marvell,cp110-icu-sei";
47cf40af64c35a6 Miquel Raynal         2019-10-04  212  				reg = <0x50 0x10>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  213  				#interrupt-cells = <2>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  214  				interrupt-controller;
47cf40af64c35a6 Miquel Raynal         2019-10-04  215  				msi-parent = <&sei>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  216  			};
47cf40af64c35a6 Miquel Raynal         2019-10-04  217  		};
47cf40af64c35a6 Miquel Raynal         2019-10-04  218  
47cf40af64c35a6 Miquel Raynal         2019-10-04  219  		CP11X_LABEL(rtc): rtc@284000 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  220  			compatible = "marvell,armada-8k-rtc";
47cf40af64c35a6 Miquel Raynal         2019-10-04  221  			reg = <0x284000 0x20>, <0x284080 0x24>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  222  			reg-names = "rtc", "rtc-soc";
47cf40af64c35a6 Miquel Raynal         2019-10-04  223  			interrupts = <77 IRQ_TYPE_LEVEL_HIGH>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  224  		};
47cf40af64c35a6 Miquel Raynal         2019-10-04  225  
47cf40af64c35a6 Miquel Raynal         2019-10-04  226  		CP11X_LABEL(syscon0): system-controller@440000 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  227  			compatible = "syscon", "simple-mfd";
47cf40af64c35a6 Miquel Raynal         2019-10-04  228  			reg = <0x440000 0x2000>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  229  
47cf40af64c35a6 Miquel Raynal         2019-10-04  230  			CP11X_LABEL(clk): clock {
47cf40af64c35a6 Miquel Raynal         2019-10-04  231  				compatible = "marvell,cp110-clock";
47cf40af64c35a6 Miquel Raynal         2019-10-04  232  				#clock-cells = <2>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  233  			};
47cf40af64c35a6 Miquel Raynal         2019-10-04  234  
47cf40af64c35a6 Miquel Raynal         2019-10-04 @235  			CP11X_LABEL(gpio1): gpio@100 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  236  				compatible = "marvell,armada-8k-gpio";
47cf40af64c35a6 Miquel Raynal         2019-10-04  237  				offset = <0x100>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  238  				ngpios = <32>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  239  				gpio-controller;
47cf40af64c35a6 Miquel Raynal         2019-10-04  240  				#gpio-cells = <2>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  241  				gpio-ranges = <&CP11X_LABEL(pinctrl) 0 0 32>;
35db5e32ebc1633 Baruch Siach          2021-01-11  242  				marvell,pwm-offset = <0x1f0>;
35db5e32ebc1633 Baruch Siach          2021-01-11  243  				#pwm-cells = <2>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  244  				interrupt-controller;
47cf40af64c35a6 Miquel Raynal         2019-10-04  245  				interrupts = <86 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  246  					<85 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  247  					<84 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  248  					<83 IRQ_TYPE_LEVEL_HIGH>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  249  				#interrupt-cells = <2>;
35db5e32ebc1633 Baruch Siach          2021-01-11  250  				clock-names = "core", "axi";
35db5e32ebc1633 Baruch Siach          2021-01-11  251  				clocks = <&CP11X_LABEL(clk) 1 21>,
35db5e32ebc1633 Baruch Siach          2021-01-11  252  					 <&CP11X_LABEL(clk) 1 17>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  253  				status = "disabled";
47cf40af64c35a6 Miquel Raynal         2019-10-04  254  			};
47cf40af64c35a6 Miquel Raynal         2019-10-04  255  
47cf40af64c35a6 Miquel Raynal         2019-10-04 @256  			CP11X_LABEL(gpio2): gpio@140 {
47cf40af64c35a6 Miquel Raynal         2019-10-04  257  				compatible = "marvell,armada-8k-gpio";
47cf40af64c35a6 Miquel Raynal         2019-10-04  258  				offset = <0x140>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  259  				ngpios = <31>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  260  				gpio-controller;
47cf40af64c35a6 Miquel Raynal         2019-10-04  261  				#gpio-cells = <2>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  262  				gpio-ranges = <&CP11X_LABEL(pinctrl) 0 32 31>;
35db5e32ebc1633 Baruch Siach          2021-01-11  263  				marvell,pwm-offset = <0x1f0>;
35db5e32ebc1633 Baruch Siach          2021-01-11  264  				#pwm-cells = <2>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  265  				interrupt-controller;
47cf40af64c35a6 Miquel Raynal         2019-10-04  266  				interrupts = <82 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  267  					<81 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  268  					<80 IRQ_TYPE_LEVEL_HIGH>,
47cf40af64c35a6 Miquel Raynal         2019-10-04  269  					<79 IRQ_TYPE_LEVEL_HIGH>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  270  				#interrupt-cells = <2>;
35db5e32ebc1633 Baruch Siach          2021-01-11  271  				clock-names = "core", "axi";
35db5e32ebc1633 Baruch Siach          2021-01-11  272  				clocks = <&CP11X_LABEL(clk) 1 21>,
35db5e32ebc1633 Baruch Siach          2021-01-11  273  					 <&CP11X_LABEL(clk) 1 17>;
47cf40af64c35a6 Miquel Raynal         2019-10-04  274  				status = "disabled";
47cf40af64c35a6 Miquel Raynal         2019-10-04  275  			};
c99c9d99348622f Wilson Ding           2025-02-20  276  
c99c9d99348622f Wilson Ding           2025-02-20 @277  			CP11X_LABEL(unit_swrst): reset-controller@268 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
