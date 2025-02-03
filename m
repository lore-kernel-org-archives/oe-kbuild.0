Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F6AA1D5177
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Feb 2025 09:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738573621; cv=none; b=h2lf/spMLM6j3Vi++S+sOfQZF5YCfXVeqIDkxM0VsqhuhWaqNybzLa5BLcrg0YknarCbI5iLXNARjU+5o8r6spsaP/M46efsUWeYJvPyjP0WY9QVPUusSyndetAK+IhRsecpvNMfDCLYmKlwMtXPFSfimhAbKKruLmslxI+xG48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738573621; c=relaxed/simple;
	bh=x6goSGXh9x68wqyxXghPataPwDfhPJdL9FXKdK97BxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PN1/R3KqU4MNnZafTfi1YIdvUcE8qnrkd9UY6ymbMyclLxrASzmyK7PQYCKg9MhtAStTRiV74SQ2+0rfwUEM4d1dI2clD6+Ekf/yRSTaYaIMHgDcyG3ksiF2zmRuJ/Et1mh9YVwsZGcO1g/a7jxhbsValMSgogsH97hPRbcwBhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XRQ+undR; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XRQ+undR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738573619; x=1770109619;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=x6goSGXh9x68wqyxXghPataPwDfhPJdL9FXKdK97BxE=;
  b=XRQ+undRJk99PR7cg8wodgLilb42uCp0E2n+wA0F1NhgJK/lkahcHaRc
   36ligxuCFs8VEAd2ySzAhCMXsl5T1KxX8LF/m5WTK5jiNrOFFhG1cdwQf
   BEyowVWhowSC2vsWW+AsyTnu3DJi4QmsPua8UtI24SU0/d0s7xXAUeg0H
   78N3W5Bdq6cvxZiYF9PoqYk4qZkfj5l26cX/G6MU2kN4YRb3v3MBTp59W
   9Cp0DIjZe7ollRx+COMjUxvD2S0SF5/5nohdeGR5Ye7KCJqqu3Q9MvVXE
   ZFUUw1+ufnSSfBgqXQF0ic3pozY71pjg30OT3BCukR8h/8dqpqDT6Tvu6
   Q==;
X-CSE-ConnectionGUID: CSeM4hsnRPGkQYFjpyVMPg==
X-CSE-MsgGUID: dsxyrLxVTk6E1YlbDe46+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="49659583"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="49659583"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:06:57 -0800
X-CSE-ConnectionGUID: JN1EUVf/SSiROGTnPGSvTQ==
X-CSE-MsgGUID: ovHhFNFqQ0qPP9846TJtDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="115258177"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Feb 2025 01:06:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tesPu-000qiL-25;
	Mon, 03 Feb 2025 09:06:54 +0000
Date: Mon, 3 Feb 2025 17:06:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/arm/integratorap-im-pd1.dts:57.28-64.4: Warning
 (simple_bus_reg): /bus@c0000000/bus@c0000000/clock-uart: missing or empty
 reg/ranges property
Message-ID: <202502031726.8dwUpBHQ-lkp@intel.com>
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
head:   2014c95afecee3e76ca4a56956a936e23283f05b
commit: 04f08ef291d4b8d76f8d198bf2929ad43b96eecf arm/arm64: dts: arm: Use generic clock and regulator nodenames
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-r011-20220722 (https://download.01.org/0day-ci/archive/20250203/202502031726.8dwUpBHQ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250203/202502031726.8dwUpBHQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502031726.8dwUpBHQ-lkp@intel.com/

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

d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  26  
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  27  &lm0 {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  28  	syscon@0 {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  29  		compatible = "arm,im-pd1-syscon", "syscon";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  30  		reg = <0x00000000 0x1000>;
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  31  		ranges;
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  32  		#address-cells = <1>;
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  33  		#size-cells = <1>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  34  
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  35  		vco1: clock-controller@0 {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  36  			compatible = "arm,impd1-vco1";
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  37  			reg = <0x00 0x04>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  38  			#clock-cells = <0>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  39  			lock-offset = <0x08>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  40  			vco-offset = <0x00>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  41  			clocks = <&sysclk>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  42  			clock-output-names = "IM-PD1-VCO1";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  43  		};
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  44  
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  45  		vco2: clock-controller@4 {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  46  			compatible = "arm,impd1-vco2";
2d3de197a81886a arch/arm/boot/dts/integratorap-im-pd1.dts     Rob Herring       2021-10-25  47  			reg = <0x04 0x04>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  48  			#clock-cells = <0>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  49  			lock-offset = <0x08>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  50  			vco-offset = <0x04>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  51  			clocks = <&sysclk>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  52  			clock-output-names = "IM-PD1-VCO2";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  53  		};
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  54  	};
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  55  
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  56  	/* Also used for the Smart Card Interface SCI */
04f08ef291d4b8d arch/arm/boot/dts/arm/integratorap-im-pd1.dts Rob Herring (Arm  2024-06-30 @57) 	impd1_uartclk: clock-uart {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  58  		compatible = "fixed-factor-clock";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  59  		#clock-cells = <0>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  60  		clock-div = <4>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  61  		clock-mult = <1>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  62  		clocks = <&vco2>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  63  		clock-output-names = "VCO2_DIV4";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  64  	};
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  65  
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  66  	/* For the SSP the clock is divided by 64 */
04f08ef291d4b8d arch/arm/boot/dts/arm/integratorap-im-pd1.dts Rob Herring (Arm  2024-06-30 @67) 	impd1_sspclk: clock-ssp {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  68  		compatible = "fixed-factor-clock";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  69  		#clock-cells = <0>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  70  		clock-div = <64>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  71  		clock-mult = <1>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  72  		clocks = <&vco2>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  73  		clock-output-names = "VCO2_DIV64";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  74  	};
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  75  
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  76  	/* Fixed regulator for the MMC */
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  77  	impd1_3v3: regulator {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  78  		compatible = "regulator-fixed";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  79  		regulator-name = "3V3";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  80  		regulator-min-microvolt = <3300000>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  81  		regulator-max-microvolt = <3300000>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  82  		regulator-always-on;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  83  	};
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  84  
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  85  	/* Push buttons on the IM-PD1 */
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  86  	gpio_keys {
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  87  		compatible = "gpio-keys";
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  88  		#address-cells = <1>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  89  		#size-cells = <0>;
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13  90  
d67ef24adf3c3fb arch/arm/boot/dts/integratorap-im-pd1.dts     Linus Walleij     2020-02-13 @91  		button@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
