Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A4C71757D
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Aug 2024 11:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723376828; cv=none; b=hq/xYE/vTRPTq+FgRBlwjaA5SglvHwL+BK9OV8DwI0ORkYf6LMOqka53chlZ26n6qnmHwwzw1iNU5qGnabRO1MI3vddGT/6N5uhPVTiHzXdQIEhX1E2mMGA5rbihGUTWmg2tMGLZbb2u4QGlZAzsxJETCl7Q64+77/6W/Y21QRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723376828; c=relaxed/simple;
	bh=RsUs1woPa39zIf0FPPs9BcOrqbKfkcFf+jp0wcookQY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q2u8vCRPmpliWbwbDc/pChA1boyDjZnkmPPc0HeGlduztt/odUGHs7yDN4Ajw2bya6dd4uqDlruIiaVOJ95PiXNzYmG1vfjPj6V/JJrX8DcbHqiUkGn0YxnlbCkqwGAP9eHx6yrmRXpUIEtzyxpmZzubX2BfXALGsX8Z6CsDTYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZevPdyvu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZevPdyvu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723376826; x=1754912826;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RsUs1woPa39zIf0FPPs9BcOrqbKfkcFf+jp0wcookQY=;
  b=ZevPdyvu4fl5oMENsGzruaf1jxw8t6J5rBqXqPErnrNxyi+zFfwAez8r
   PxYGw41EqjQDOm/TcZT3XsjVKt6tl0ABJoCmzaE2nvySWKmiOQ77Ja8kk
   k1XwZAYSc1mT7hAnRznDXiedN2W1iWRb0PTBco7GTE5T8x6eaHC1xtUnk
   CIUvOh0zgguewjBzKgh0UU3EPTo6HfwumPuW06BOQqn0+UhnR9f4srSq1
   /mgO6BSAedInPO2CkXbcRcszx0Rgiu6gVMjcV/3PKC6yFdPhe4zg5KdTs
   k2n8WGi5XPDjiuaTOMrJa5q6ygdwrD+hGG3WjvT/js4NFgdIEqseBXEiH
   w==;
X-CSE-ConnectionGUID: 53GfvqqXTISjCYMEC8U9mg==
X-CSE-MsgGUID: gsmgT/PjQ1CzYqsGm9LE0Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="21635475"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="21635475"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 04:47:05 -0700
X-CSE-ConnectionGUID: N9yI3k3sT96apostO47i8g==
X-CSE-MsgGUID: K7Emb142TKKwGgfo+3xMhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="58566554"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 11 Aug 2024 04:47:04 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd72F-000Anr-2z;
	Sun, 11 Aug 2024 11:46:56 +0000
Date: Sun, 11 Aug 2024 19:46:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tobetter:odroid-6.1.y 23/91]
 arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-level'
 is a required property
Message-ID: <202408111926.kpiEbWCi-lkp@intel.com>
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
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Dongjin Kim <tobetter@gmail.com>

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   2a5f985c90ffd8f4e2de3a2fd76f00c3e322aa6f
commit: 5e5c31f1c11458aabfa51021f3e0319bb051330e [23/91] ODROID-C2: arm64/dts: add 'meson64_odroidc2.dts' for compability
:::::: branch date: 4 days ago
:::::: commit date: 1 year, 7 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240811/202408111926.kpiEbWCi-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111926.kpiEbWCi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408111926.kpiEbWCi-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:252.29-257.6: Warning (unit_address_vs_reg): /scpi/clocks/scpi_clocks@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (unit_address_vs_reg): /soc/bus@c8100000/pinctrl@14: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:534.15-537.6: Warning (unit_address_vs_reg): /soc/bus@c8834000/rng: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-719.4: Warning (unit_address_vs_reg): /soc/bus@c8834000/pinctrl@4b0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:88.28-265.4: Warning (simple_bus_reg): /soc/bus@c8100000/pinctrl@14: missing or empty reg/ranges property
   arch/arm64/boot/dts/amlogic/meson-gx.dtsi:534.15-537.6: Warning (simple_bus_reg): /soc/bus@c8834000/rng: simple-bus unit address format error, expected "0"
   arch/arm64/boot/dts/amlogic/meson-gxbb.dtsi:361.31-719.4: Warning (simple_bus_reg): /soc/bus@c8834000/pinctrl@4b0: missing or empty reg/ranges property
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-level' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: l2-cache0: 'cache-unified' is a required property
   	from schema $id: http://devicetree.org/schemas/cache.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /firmware/secure-monitor: failed to match any schema with compatible: ['amlogic,meson-gx-sm', 'amlogic,meson-gxbb-sm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /firmware/secure-monitor: failed to match any schema with compatible: ['amlogic,meson-gx-sm', 'amlogic,meson-gxbb-sm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /efuse: failed to match any schema with compatible: ['amlogic,meson-gx-efuse', 'amlogic,meson-gxbb-efuse']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /efuse: failed to match any schema with compatible: ['amlogic,meson-gx-efuse', 'amlogic,meson-gxbb-efuse']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: scpi: clocks: 'scpi_clocks@0' does not match any of the regexes: '^clocks-[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scpi.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/interrupt-controller@9880: failed to match any schema with compatible: ['amlogic,meson-gpio-intc', 'amlogic,meson-gxbb-gpio-intc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/interrupt-controller@9880: failed to match any schema with compatible: ['amlogic,meson-gpio-intc', 'amlogic,meson-gxbb-gpio-intc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8550: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8550: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8650: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@8650: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@86c0: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/pwm@86c0: failed to match any schema with compatible: ['amlogic,meson-gx-pwm', 'amlogic,meson-gxbb-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c1100000/clock-measure@8758: failed to match any schema with compatible: ['amlogic,meson-gx-clk-measure']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/sys-ctrl@0: failed to match any schema with compatible: ['amlogic,meson-gx-ao-sysctrl', 'simple-mfd', 'syscon']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/sys-ctrl@0/clock-controller: failed to match any schema with compatible: ['amlogic,meson-gxbb-aoclkc', 'amlogic,meson-gx-aoclkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/sys-ctrl@0/clock-controller: failed to match any schema with compatible: ['amlogic,meson-gxbb-aoclkc', 'amlogic,meson-gx-aoclkc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/pwm@550: failed to match any schema with compatible: ['amlogic,meson-gx-ao-pwm', 'amlogic,meson-gxbb-ao-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/pwm@550: failed to match any schema with compatible: ['amlogic,meson-gx-ao-pwm', 'amlogic,meson-gxbb-ao-pwm']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/ir@580: failed to match any schema with compatible: ['amlogic,meson-gx-ir', 'amlogic,meson-gxbb-ir']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/ir@580: failed to match any schema with compatible: ['amlogic,meson-gx-ir', 'amlogic,meson-gxbb-ir']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8100000/pinctrl@14: failed to match any schema with compatible: ['amlogic,meson-gxbb-aobus-pinctrl']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: bus@c8834000: rng: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c8834000/pinctrl@4b0: failed to match any schema with compatible: ['amlogic,meson-gxbb-periphs-pinctrl']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c883c000/system-controller@0: failed to match any schema with compatible: ['amlogic,meson-gx-hhi-sysctrl', 'simple-mfd', 'syscon']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/bus@c883c000/system-controller@0/clock-controller: failed to match any schema with compatible: ['amlogic,gxbb-clkc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: amlogic,tx-delay-ns: [2] is not of type 'integer'
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: ethernet@c9410000: Unevaluated properties are not allowed ('amlogic,tx-delay-ns' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/amlogic,meson-dwmac.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@70000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@70000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@72000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@72000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@74000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: /soc/apb@d0000000/mmc@74000: failed to match any schema with compatible: ['amlogic,meson-gx-mmc', 'amlogic,meson-gxbb-mmc']
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-0:sound-dai: [[57], [0], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-1:sound-dai: [[57], [0], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-1:codec-0:sound-dai: [[57], [1], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: dai-link-2:sound-dai: [[57], [1], [2]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
>> arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^dai-link-[0-9]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/sound/amlogic,gx-sound-card.yaml#
   arch/arm64/boot/dts/amlogic/meson64_odroidc2.dtb: sound: 'anyOf' conditional failed, one must be fixed:
   	'clocks' is a required property
   	'#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/clock.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
