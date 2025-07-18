Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F57D27453
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Jul 2025 01:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752800820; cv=none; b=YCLYSCKzZMXl06YF+OKVMbb2h9qhpvm+WyCYwGVbnG9jd7ZUGXG+peTwXy75Rw9AaWHkLRjXHqJqm56cN60YPu+dUKYs99K/C4qWTofHALCswfhSpyYdhccrC9R+NylVLYTEBbvDBPgh6epbiyPrmxim1TOz8dJulak7HBSJGBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752800820; c=relaxed/simple;
	bh=uG2+IAgqf+MO9DRaB+1scXNvn77TXR6TmExWRoHhTVA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MERMLnfAaxaVAc/mLCYYC+Z0DFuRBBjZIzImWF6eRuziBeEPk8Zdh+ouIWlZMc7evsVYm0cLVj//Fh7au9ZpcuMFBLn2SMbvVmpAufOODknYuwkBnKjEZA8UIT2BNQGvE9D5tuGPPucPUPXSd9TMnoohyY9OxDsJsEuxe8gkiGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YDbamq1k; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YDbamq1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752800818; x=1784336818;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uG2+IAgqf+MO9DRaB+1scXNvn77TXR6TmExWRoHhTVA=;
  b=YDbamq1kBmfX1gAtji8JWva4KQqzBVhVzHpvDNwDFPKXV0XxQofMwDMX
   dGvxKqgz7kaGelQ0qi5BTFwFclqxpefhGKgPuWUEErtRCJ1OrrlphGUBF
   BXjx6MCynyOG/fvzzkCtPiG5zTj/yPJAO3nSneVJL/ETiEiNBBrM3Vwi7
   /fI7490x/ye49Q+rSspRn5UkRDGLmFpiXo2ojzWtLm13l0ABJQUfCCaAz
   Y8YWaH2y/79XLx9QigUpU8aKiEgR6a1Xgol9hZ3xXdZ3AHaJ3U2QV8qa1
   jSmX1pWUae5Uj0nANfFudq208aGIXE2q3lCseobfNF7pT/8beDsQX6hTY
   A==;
X-CSE-ConnectionGUID: mO+Cx6xtSauaEWRuEqij3w==
X-CSE-MsgGUID: zXB6yulgSNSmoka82Nqctw==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="54306473"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="54306473"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 18:06:57 -0700
X-CSE-ConnectionGUID: Qdvn4eImQlGk/pxDg2M9+g==
X-CSE-MsgGUID: Bpz7GbIoTTGTCJ1w4cMYkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="158053278"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jul 2025 18:06:56 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucZYs-000ECB-1b;
	Fri, 18 Jul 2025 01:06:54 +0000
Date: Fri, 18 Jul 2025 09:06:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 3/3] ARM: tegra: Add DFLL clock support on Tegra114
Message-ID: <202507180818.X39uQq9r-lkp@intel.com>
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
In-Reply-To: <20250714081713.8409-4-clamor95@gmail.com>
References: <20250714081713.8409-4-clamor95@gmail.com>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
TO: Thierry Reding <thierry.reding@gmail.com>
TO: Jonathan Hunter <jonathanh@nvidia.com>
TO: Prashant Gaikwad <pgaikwad@nvidia.com>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Viresh Kumar <viresh.kumar@linaro.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Svyatoslav Ryhel <clamor95@gmail.com>
CC: linux-tegra@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: linux-pm@vger.kernel.org

Hi Svyatoslav,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tegra/for-next]
[also build test WARNING on rafael-pm/linux-next rafael-pm/bleeding-edge robh/for-next linus/master v6.16-rc6 next-20250715]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Svyatoslav-Ryhel/drivers-cpufreq-add-Tegra114-support/20250714-162237
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git for-next
patch link:    https://lore.kernel.org/r/20250714081713.8409-4-clamor95%40gmail.com
patch subject: [PATCH v2 3/3] ARM: tegra: Add DFLL clock support on Tegra114
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-052-20250715 (https://download.01.org/0day-ci/archive/20250718/202507180818.X39uQq9r-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 16534d19bf50bde879a83f0ae62875e2c5120e64)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180818.X39uQq9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507180818.X39uQq9r-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/extcon: failed to match any schema with compatible: ['ti,palmas-usb-vid']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/gpio: failed to match any schema with compatible: ['ti,palmas-gpio']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/palmas_clk32kg@0: failed to match any schema with compatible: ['ti,palmas-clk32kg']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: sound (asus,tegra-audio-rt5639-tf701t): nvidia,audio-routing:14: 'IN1N' is not one of ['Headphones', 'Speakers', 'Mic Jack', 'DMIC1', 'DMIC2', 'MICBIAS1', 'IN1P', 'IN1R', 'IN2P', 'IN2R', 'HPOL', 'HPOR', 'LOUTL', 'LOUTR', 'MONOP', 'MONON', 'SPOLP', 'SPOLN', 'SPORP', 'SPORN']
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: sound (asus,tegra-audio-rt5639-tf701t): nvidia,audio-routing:17: 'Int Mic' is not one of ['Headphones', 'Speakers', 'Mic Jack', 'DMIC1', 'DMIC2', 'MICBIAS1', 'IN1P', 'IN1R', 'IN2P', 'IN2R', 'HPOL', 'HPOR', 'LOUTL', 'LOUTR', 'MONOP', 'MONON', 'SPOLP', 'SPOLN', 'SPORP', 'SPORN']
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml#
   arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dtb: sound (asus,tegra-audio-rt5639-tf701t): nvidia,audio-routing:19: 'Int Mic' is not one of ['Headphones', 'Speakers', 'Mic Jack', 'DMIC1', 'DMIC2', 'MICBIAS1', 'IN1P', 'IN1R', 'IN2P', 'IN2R', 'HPOL', 'HPOR', 'LOUTL', 'LOUTR', 'MONOP', 'MONON', 'SPOLP', 'SPOLN', 'SPORP', 'SPORN']
   	from schema $id: http://devicetree.org/schemas/sound/nvidia,tegra-audio-rt5640.yaml#
--
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/gpio: failed to match any schema with compatible: ['ti,palmas-gpio']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pinmux: failed to match any schema with compatible: ['ti,tps65913-pinctrl']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /i2c@7000d000/tps65913@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']
   arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
>> arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
>> arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-dalmore.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/regulator@43: failed to match any schema with compatible: ['ti,tps51632']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/gpio: failed to match any schema with compatible: ['ti,palmas-gpio']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']
   arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
>> arch/arm/boot/dts/nvidia/tegra114-roth.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
>> arch/arm/boot/dts/nvidia/tegra114-roth.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-roth.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
--
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /dma@6000a000: failed to match any schema with compatible: ['nvidia,tegra114-apbdma']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58: failed to match any schema with compatible: ['ti,tps65913', 'ti,palmas']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/gpio: failed to match any schema with compatible: ['ti,palmas-gpio']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/pmic: failed to match any schema with compatible: ['ti,tps65913-pmic', 'ti,palmas-pmic']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /i2c@7000d000/pmic@58/rtc: failed to match any schema with compatible: ['ti,palmas-rtc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /kbc@7000e200: failed to match any schema with compatible: ['nvidia,tegra114-kbc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /memory-controller@70019000: failed to match any schema with compatible: ['nvidia,tegra114-mc']
   arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /ahub@70080000: failed to match any schema with compatible: ['nvidia,tegra114-ahub']
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: /clock@70110000: failed to match any schema with compatible: ['nvidia,tegra114-dfll']
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: cpu@0 (arm,cortex-a15): 'operating-points' is a dependency of 'clock-latency'
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#
>> arch/arm/boot/dts/nvidia/tegra114-tn7.dtb: cpu@0 (arm,cortex-a15): Unevaluated properties are not allowed ('clock-latency' was unexpected)
   	from schema $id: http://devicetree.org/schemas/arm/cpus.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
