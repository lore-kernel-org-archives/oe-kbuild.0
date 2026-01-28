Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355A92DEA6B
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 18:43:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769625832; cv=none; b=FSjN6wCmHc1/AtgmU23xn30pjxfIHYz9Q84/KX3fUpUbWI5StDILXN1EkIwoUGlkWZg5CvpFRhvq9MkXCX/JNVLD0/VUSCVUbBQkp6199vK0X7pCzQPOlQb4wdimYFt/KYTV6lrWP682e8DPibdz0ok1kK4Dt/5Svy1QKwXn9/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769625832; c=relaxed/simple;
	bh=WDQLi42En4Qf7ZnDWszxE32tl5tPy1bts7ABlSfelWo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jMAfpplksWjZyVnk8KeVQPa/+PtQt/oPQq+bM11eQHChyauYtINSj3+UrLxg24a1hj10Kj/ZrxeWsjREteDaDJVC2gI/eRNUyMNAzRR80m8XV/v7oGhtxjokzJ2y3sew6DUwTkxsmf7U/NsZ6F/MmwrmumqG3CSvPLvZVpswir4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fakyRrtr; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fakyRrtr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769625830; x=1801161830;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WDQLi42En4Qf7ZnDWszxE32tl5tPy1bts7ABlSfelWo=;
  b=fakyRrtrKcsnVQOWQyIDH0Y/BJEN5+vEVS3tjFP/SoSjdDt+Uuew93DC
   FIV1lf1FqmNLho3y7Kc94f5ynOIjIQClC4BGHxDIzBN+yNPeeLen7jgPT
   kMF7HRQIdXK79kHLECuC04ZCVQThCOxV2BkXPhKg0r6VqAtLGTtnrpCOU
   9EPHB4Iwb33v4xXlXsgm3qvKyYvw3ZZvtp/ZWquAvBdoBASjrEUYWyQa6
   e0yvYvThUeEBFm62GfZfafhaUaAi9D5Tt/GaXD+jbJXruxv4PHk99rrob
   AGYMli5DchOF8Kso0ULQ+nAKtd6U9vbzSIMNXdz7Y3KBJjo1QAigicpwq
   Q==;
X-CSE-ConnectionGUID: 7dA76GR1SHizV0lroI9MuQ==
X-CSE-MsgGUID: VoLaDG+QQOq6tUREGGb6pA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74711545"
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="74711545"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 10:43:50 -0800
X-CSE-ConnectionGUID: dkjifcz+TDWVgemEgSZWoA==
X-CSE-MsgGUID: 9xnhHscRSbe9wO6uoz+bcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,258,1763452800"; 
   d="scan'208";a="245941517"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Jan 2026 10:43:49 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlAW2-0000000026H-1AVb;
	Wed, 28 Jan 2026 18:43:46 +0000
Date: Wed, 28 Jan 2026 19:43:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/5] dt-bindings: memory: Document Tegra114 Memory
 Controller
Message-ID: <202601281922.ImZmCSOu-lkp@intel.com>
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
In-Reply-To: <20260126190755.78475-2-clamor95@gmail.com>
References: <20260126190755.78475-2-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Mikko Perttunen <mperttunen@nvidia.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Sumit Gupta <sumitg@nvidia.com>
TO: Dmitry Osipenko <digetx@gmail.com>
CC: linux-kernel@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-tegra@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on krzk-mem-ctrl/for-next]
[also build test WARNING on tegra/for-next robh/for-next linus/master v6.19-rc7 next-20260127]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/dt-bindings-memory-Document-Tegra114-Memory-Controller/20260127-045059
base:   https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux-mem-ctrl.git for-next
patch link:    https://lore.kernel.org/r/20260126190755.78475-2-clamor95%40gmail.com
patch subject: [PATCH v1 1/5] dt-bindings: memory: Document Tegra114 Memory Controller
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2051-20260127 (https://download.01.org/0day-ci/archive/20260128/202601281922.ImZmCSOu-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260128/202601281922.ImZmCSOu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601281922.ImZmCSOu-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/extcon: failed to match any schema with compatible: ['ti,palmas-usb-vid']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/palmas_clk32kg@0: failed to match any schema with compatible: ['ti,palmas-clk32kg']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: memory-controller@70019000 (nvidia,tegra114-mc): '#interconnect-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-mc.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: sound (asus,tegra-audio-rt5639-tf701t): nvidia,audio-routing:14: 'IN1N' is not one of ['Headphones', 'Speakers', 'Mic Jack', 'DMIC1', 'DMIC2', 'MICBIAS1', 'IN1P', 'IN1R', 'IN2P', 'IN2R', 'HPOL', 'HPOR', 'LOUTL', 'LOUTR', 'MONOP', 'MONON', 'SPOLP', 'SPOLN', 'SPORP', 'SPORN']
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: sound (asus,tegra-audio-rt5639-tf701t): nvidia,audio-routing:17: 'Int Mic' is not one of ['Headphones', 'Speakers', 'Mic Jack', 'DMIC1', 'DMIC2', 'MICBIAS1', 'IN1P', 'IN1R', 'IN2P', 'IN2R', 'HPOL', 'HPOR', 'LOUTL', 'LOUTR', 'MONOP', 'MONON', 'SPOLP', 'SPOLN', 'SPORP', 'SPORN']
--
   	from schema $id: http://devicetree.org/schemas/sound/realtek,rt5640.yaml
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps51632@43: failed to match any schema with compatible: ['ti,tps51632']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65090@48: failed to match any schema with compatible: ['ti,tps65090']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
>> arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: memory-controller@70019000 (nvidia,tegra114-mc): '#interconnect-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-mc.yaml
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: dma@6000a000 (nvidia,tegra114-apbdma): $nodename:0: 'dma@6000a000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/regulator@43: failed to match any schema with compatible: ['ti,tps51632']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
>> arch/arm/boot/dts/nvidia/tegra114-roth.dtb: memory-controller@70019000 (nvidia,tegra114-mc): '#interconnect-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-mc.yaml
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
--
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: panel@0 (lg,ld070wx3-sl01): 'vcc-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/lg,ld070wx3-sl01.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: dma@6000a000 (nvidia,tegra114-apbdma): $nodename:0: 'dma@6000a000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/nvidia,tegra20-apbdma.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: memory-controller@70019000 (nvidia,tegra114-mc): '#interconnect-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/memory-controllers/nvidia,tegra124-mc.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
