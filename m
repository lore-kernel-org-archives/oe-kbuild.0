Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41E0225A5B
	for <oe-kbuild@lists.linux.dev>; Thu,  1 May 2025 20:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746132103; cv=none; b=Yv56GgQkATt1fsHyQTEMg1GmmA6eO8q6hsKoKkH+Enh1XAlxNp9EKd09Ewu9CtnjaklGmv9pLI2o1ckYVTudGNwwlfc6PP3w7rOy3qgA8X6mKHvSDfILhK+umjY3Fo5G9RAul7/LSRzKqaHTYqs1k4VNVVvrHna+wsidt8RJH/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746132103; c=relaxed/simple;
	bh=rMpo5lM3vB6uoxy9/Hi4BShVofLtFx4EuR2DV6niDYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gyrnUDs9N/JOghz98KiCDqXxZCSlRzhzXxvPGgyqzNDvECeV8w0W953J9xQYt3Sgg9baeyMlGPEBrA2VDs7bL+EKO3wWl4pyvETGU8BH1AIKlNow+p5p4Ar2ocJSOIqxnQlUW2lWiAS0cM1VfWG3xwO/ntnozed4axG/BxwfQqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iz8vyPwq; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iz8vyPwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746132098; x=1777668098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rMpo5lM3vB6uoxy9/Hi4BShVofLtFx4EuR2DV6niDYk=;
  b=Iz8vyPwqgo+84//+0EVxcFOTsNIIGpA9Zbdj/ZIIfdE2ah6xtAYhK+si
   btIyy0hvzXzo39q7DCk3V4I5BbDF7B3vApARxXthO/V1P1tukT4dIyHLS
   giyNYh4LfPeRVZ2nNRks0A4nUVYvXBP/QhHMtH+EtuooUCbwPPx3trbA3
   +u7O3YK5Da5KjdRApVVqb7QQPWE5aYSLu9LFDJQyusMom0mg3Vif2JVTA
   nzDaL2vN+lvg/y4WNByHr5zyf29vniTmm6iZcm+gHAN08BtSFLNQlFml+
   lIEdQ3ReUvhI60JPDQCkqCSP4TvPoC8DHxKkWEY5hWvBuHxlBpl23N2dx
   Q==;
X-CSE-ConnectionGUID: EqStNJYrTvGVrc1mOcjtgw==
X-CSE-MsgGUID: cZDlsf0cTTSe/530wI3DAQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="58442898"
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="58442898"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 13:41:38 -0700
X-CSE-ConnectionGUID: SZKHnRLuQcqycci519jXgQ==
X-CSE-MsgGUID: 42IIwZFxSgWzfJl9v0lMIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,254,1739865600"; 
   d="scan'208";a="138489639"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 May 2025 13:41:37 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAait-0004Nx-09;
	Thu, 01 May 2025 20:41:35 +0000
Date: Fri, 2 May 2025 04:41:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 04/10] ARM: dts: exynos: Add rtc clock definitions for
 MAX77686 PMIC for Exynos4412 Midas
Message-ID: <202505020431.B1C8nacY-lkp@intel.com>
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
In-Reply-To: <20250425132727.5160-5-linux.amoon@gmail.com>
References: <20250425132727.5160-5-linux.amoon@gmail.com>
TO: Anand Moon <linux.amoon@gmail.com>
TO: Chanwoo Choi <cw00.choi@samsung.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Alim Akhtar <alim.akhtar@samsung.com>
TO: linux-kernel@vger.kernel.org
TO: linux-clk@vger.kernel.org
TO: devicetree@vger.kernel.org
CC: Anand Moon <linux.amoon@gmail.com>

Hi Anand,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 02ddfb981de88a2c15621115dd7be2431252c568]

url:    https://github.com/intel-lab-lkp/linux/commits/Anand-Moon/dt-bindings-clock-Add-RTC-clock-binding-for-Maxim-MAX77686/20250425-213549
base:   02ddfb981de88a2c15621115dd7be2431252c568
patch link:    https://lore.kernel.org/r/20250425132727.5160-5-linux.amoon%40gmail.com
patch subject: [PATCH v1 04/10] ARM: dts: exynos: Add rtc clock definitions for MAX77686 PMIC for Exynos4412 Midas
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-randconfig-052-20250429 (https://download.01.org/0day-ci/archive/20250502/202505020431.B1C8nacY-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505020431.B1C8nacY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505020431.B1C8nacY-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/samsung/exynos4412-i9300.dtb: pmic@9 (maxim,max77686): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77686.yaml#
   arch/arm/boot/dts/samsung/exynos4412-i9300.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-i9300.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@66' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-i9300.dtb: i2c-gpio-3 (i2c-gpio): $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-i9300.dtb: i2c-gpio-3 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fuel-gauge@36' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-i9300.dtb: i2c-gpio-4 (i2c-gpio): $nodename:0: 'i2c-gpio-4' does not match '^i2c(@.+|-[a-z0-9]+)?$'
--
>> arch/arm/boot/dts/samsung/exynos4412-i9305.dtb: pmic@9 (maxim,max77686): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77686.yaml#
   arch/arm/boot/dts/samsung/exynos4412-i9305.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-i9305.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@66' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-i9305.dtb: i2c-gpio-3 (i2c-gpio): $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-i9305.dtb: i2c-gpio-3 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fuel-gauge@36' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-i9305.dtb: i2c-gpio-4 (i2c-gpio): $nodename:0: 'i2c-gpio-4' does not match '^i2c(@.+|-[a-z0-9]+)?$'
--
>> arch/arm/boot/dts/samsung/exynos4412-n710x.dtb: pmic@9 (maxim,max77686): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77686.yaml#
   arch/arm/boot/dts/samsung/exynos4412-n710x.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-n710x.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@66' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-n710x.dtb: i2c-gpio-3 (i2c-gpio): $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-n710x.dtb: i2c-gpio-3 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fuel-gauge@36' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-n710x.dtb: i2c-gpio-4 (i2c-gpio): $nodename:0: 'i2c-gpio-4' does not match '^i2c(@.+|-[a-z0-9]+)?$'
--
>> arch/arm/boot/dts/samsung/exynos4412-trats2.dtb: pmic@9 (maxim,max77686): 'clocks' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/mfd/maxim,max77686.yaml#
   arch/arm/boot/dts/samsung/exynos4412-trats2.dtb: i2c-gpio-1 (i2c-gpio): $nodename:0: 'i2c-gpio-1' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-trats2.dtb: i2c-gpio-1 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'pmic@66' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-trats2.dtb: i2c-gpio-3 (i2c-gpio): $nodename:0: 'i2c-gpio-3' does not match '^i2c(@.+|-[a-z0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-trats2.dtb: i2c-gpio-3 (i2c-gpio): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'fuel-gauge@36' were unexpected)
   	from schema $id: http://devicetree.org/schemas/i2c/i2c-gpio.yaml#
   arch/arm/boot/dts/samsung/exynos4412-trats2.dtb: i2c-gpio-4 (i2c-gpio): $nodename:0: 'i2c-gpio-4' does not match '^i2c(@.+|-[a-z0-9]+)?$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
