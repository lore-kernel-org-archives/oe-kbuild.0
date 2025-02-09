Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B56B7220693
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Feb 2025 21:12:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739135564; cv=none; b=l6ualzzsz47/8YO/Kb3C+xrmFEOFpO2bYZbsiKKkufkX4R9KsOKBuF94881FScqM3iBhKjqrPKkRUj9hMGQDz5bw5EcjXDk0SSlJ4Al4pqMlaI2hRcIzYYEc76CXybTgadq/r/K/2cFhOLC+HxLjX6JfJO4VMstunvwrGQQoGl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739135564; c=relaxed/simple;
	bh=UWbjPiN3wPx+7oiywvEfXpXTe82a5eK42da3Dz2QcDg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Be4SuOxzwIZDMbxf3kMz+78YV3+MU0o3kU6LIAXmDSOHYjLubjJQrg/J+HzB7pJsJuAQI6rJ8WY1nS39NPjiGGty/QR5KemMB8qPHL6wojilIfgGu7zDbJ7ymCsUD1bv8oxYpUC7GCHaUdSlHo835c7pMepch/m0vvo1bFxryXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nyJugmdR; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nyJugmdR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739135562; x=1770671562;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UWbjPiN3wPx+7oiywvEfXpXTe82a5eK42da3Dz2QcDg=;
  b=nyJugmdRFQD5DTmwtlWRbIA48eSlc5Db3HDkqll/AqDnQDxv7AIsFOqC
   7zcVfwn0pMwLmmptgCaYKLBUvoe8wfn3NaoxN45/baldbCqLBgYm3Z8au
   5Twkfp+lvbBklNn/Y9LmKS4vc16ZHU7JnCfbfso3HLOgNYuPgPgNNu7PX
   iMrAKdSHHAxSBbEjlSsf7h8vfv5FCY4i9iVgVGwgPFq0iaSyDhk5Y3Vs7
   0NK4GZ+JJqReFrCSN/jZ8IkcdxqWL3L0I6mUuf84lx45cR+3GIHu8TfeI
   YAG8fFPDKIzPQXiiPlRLivWFCEb9/xZh4b7mDIMzJYkNJuZseXn3cgdOB
   Q==;
X-CSE-ConnectionGUID: A2Nsk59dSv2dLQ6KlG/fnA==
X-CSE-MsgGUID: jOsNB64BTNSw12IrfEYCMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="39863583"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="39863583"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 13:12:41 -0800
X-CSE-ConnectionGUID: 9ZoYTvoySh6fQpLm2oVY0g==
X-CSE-MsgGUID: P4qMZjtcT5KWmi4NutlV7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="112652673"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 09 Feb 2025 13:12:40 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thEbW-0011uZ-05;
	Sun, 09 Feb 2025 21:12:38 +0000
Date: Mon, 10 Feb 2025 05:12:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/arm/integratorap-im-pd1.dts:57.28-64.4: Warning
 (simple_bus_reg): /bus@c0000000/bus@c0000000/clock-uart: missing or empty
 reg/ranges property
Message-ID: <202502100541.WPdpf1m0-lkp@intel.com>
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
CC: Arnd Bergmann <arnd@arndb.de>
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Sudeep Holla <sudeep.holla@arm.com>

Hi Rob,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   69b54314c975f4dfd3a29d6b9211ab68fff46682
commit: 04f08ef291d4b8d76f8d198bf2929ad43b96eecf arm/arm64: dts: arm: Use generic clock and regulator nodenames
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-r013-20230520 (https://download.01.org/0day-ci/archive/20250210/202502100541.WPdpf1m0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502100541.WPdpf1m0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502100541.WPdpf1m0-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:251.3-14: Warning (dma_ranges_format): /bus@c0000000/bus@c0000000/display@1000000:dma-ranges: empty "dma-ranges" property but its #address-cells (2) differs from /bus@c0000000/bus@c0000000 (1)
   arch/arm/boot/dts/arm/integrator.dtsi:10.9-13.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/integratorap.dts:103.9-132.4: Warning (unit_address_vs_reg): /syscon: node has a reg or ranges property, but no unit name
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:91.12-96.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/gpio_keys/button@0: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:97.12-102.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/gpio_keys/button@1: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:103.12-108.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/gpio_keys/button@2: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:109.12-114.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/gpio_keys/button@3: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:115.12-120.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/gpio_keys/button@4: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:121.12-126.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/gpio_keys/button@5: node has a unit name, but no reg or ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:253.10-262.5: Warning (unit_address_vs_reg): /bus@c0000000/bus@c0000000/display@1000000/port@0: node has a unit name, but no reg or ranges property
>> arch/arm/boot/dts/arm/integratorap-im-pd1.dts:57.28-64.4: Warning (simple_bus_reg): /bus@c0000000/bus@c0000000/clock-uart: missing or empty reg/ranges property
>> arch/arm/boot/dts/arm/integratorap-im-pd1.dts:67.26-74.4: Warning (simple_bus_reg): /bus@c0000000/bus@c0000000/clock-ssp: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:77.23-83.4: Warning (simple_bus_reg): /bus@c0000000/bus@c0000000/regulator: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:86.12-127.4: Warning (simple_bus_reg): /bus@c0000000/bus@c0000000/gpio_keys: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:130.9-151.4: Warning (simple_bus_reg): /bus@c0000000/bus@c0000000/bridge: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:153.6-162.4: Warning (simple_bus_reg): /bus@c0000000/bus@c0000000/vga: missing or empty reg/ranges property
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:86.12-127.4: Warning (avoid_unnecessary_addr_size): /bus@c0000000/bus@c0000000/gpio_keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm/boot/dts/arm/integratorap.dts:50.10-53.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/arm/integratorap.dts:50.10-53.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/arm/integratorap-im-pd1.dts:253.10-262.5: Warning (graph_child_address): /bus@c0000000/bus@c0000000/display@1000000/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +57 arch/arm/boot/dts/arm/integratorap-im-pd1.dts

d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  26  
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  27  &lm0 {
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  28  	syscon@0 {
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  29  		compatible = "arm,im-pd1-syscon", "syscon";
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  30  		reg = <0x00000000 0x1000>;
2d3de197a81886 arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  31  		ranges;
2d3de197a81886 arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  32  		#address-cells = <1>;
2d3de197a81886 arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  33  		#size-cells = <1>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  34  
2d3de197a81886 arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  35  		vco1: clock-controller@0 {
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  36  			compatible = "arm,impd1-vco1";
2d3de197a81886 arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  37  			reg = <0x00 0x04>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  38  			#clock-cells = <0>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  39  			lock-offset = <0x08>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  40  			vco-offset = <0x00>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  41  			clocks = <&sysclk>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  42  			clock-output-names = "IM-PD1-VCO1";
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  43  		};
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  44  
2d3de197a81886 arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  45  		vco2: clock-controller@4 {
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  46  			compatible = "arm,impd1-vco2";
2d3de197a81886 arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  47  			reg = <0x04 0x04>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  48  			#clock-cells = <0>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  49  			lock-offset = <0x08>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  50  			vco-offset = <0x04>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  51  			clocks = <&sysclk>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  52  			clock-output-names = "IM-PD1-VCO2";
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  53  		};
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  54  	};
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  55  
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  56  	/* Also used for the Smart Card Interface SCI */
04f08ef291d4b8 arch/arm/boot/dts/arm/integratorap-im-pd1.dts Rob Herring (Arm  2024-06-30 @57) 	impd1_uartclk: clock-uart {
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  58  		compatible = "fixed-factor-clock";
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  59  		#clock-cells = <0>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  60  		clock-div = <4>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  61  		clock-mult = <1>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  62  		clocks = <&vco2>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  63  		clock-output-names = "VCO2_DIV4";
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  64  	};
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  65  
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  66  	/* For the SSP the clock is divided by 64 */
04f08ef291d4b8 arch/arm/boot/dts/arm/integratorap-im-pd1.dts Rob Herring (Arm  2024-06-30 @67) 	impd1_sspclk: clock-ssp {
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  68  		compatible = "fixed-factor-clock";
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  69  		#clock-cells = <0>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  70  		clock-div = <64>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  71  		clock-mult = <1>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  72  		clocks = <&vco2>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  73  		clock-output-names = "VCO2_DIV64";
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  74  	};
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  75  
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  76  	/* Fixed regulator for the MMC */
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  77  	impd1_3v3: regulator {
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  78  		compatible = "regulator-fixed";
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  79  		regulator-name = "3V3";
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  80  		regulator-min-microvolt = <3300000>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  81  		regulator-max-microvolt = <3300000>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  82  		regulator-always-on;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  83  	};
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  84  
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  85  	/* Push buttons on the IM-PD1 */
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  86  	gpio_keys {
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  87  		compatible = "gpio-keys";
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  88  		#address-cells = <1>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  89  		#size-cells = <0>;
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  90  
d67ef24adf3c3f arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13 @91  		button@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
