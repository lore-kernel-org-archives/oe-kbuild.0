Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C93C52F22
	for <oe-kbuild@lists.linux.dev>; Mon, 10 Feb 2025 02:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739155275; cv=none; b=W/KbnvfQBD015vG1f6U8a5Jerx3H5pMi8G5kQlwgCmXe2/2U8+n7IKbooXEM+ApLKudDc7J2KsM4xshaT+I/03k1/P2GYGuOQWJetEdzunDeqfGoBSJ36aMCeqijnk3HuYPlUrcO6MD6RZ4NIUdBuvAagrcdc1pZs/bxfJj2lRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739155275; c=relaxed/simple;
	bh=dCFoIKcYvw3b5xx4SUaKyB5NWlrfNIHXjA+3N6Q3HOs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MvAchsFTayvC7HF2pmJFflixn/xrzglHGGFaOsK7JfAto8t9yQXJvbub7z01O8ZH9365Yw0TjaWubNJqNyWsiWbGd/mQqRvRf21aYFwjdbclmz5Rz4Rh4mT+XB8vxyd+++9iwKK4pnvlNNOEjrPoAqcpfRSnY5zOX3LhLwLMHHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SJ4916FV; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SJ4916FV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739155273; x=1770691273;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dCFoIKcYvw3b5xx4SUaKyB5NWlrfNIHXjA+3N6Q3HOs=;
  b=SJ4916FVH8m4R6K9g5uq6ny4UOBOEGptFvHcfok2MOqZ5s6yiATxn54Z
   IZARfH6QyCeFjoeDVMdUWJhjOBQjlhyurub7O5fE0P8drrP940Ow61tJA
   JYNprpAexT0Wm9h0uazO8BsaVZMK7akW9HAQuu16XAZUD6BSp2u1UEsNn
   iyVK8rdHRKf2NpQnoD2S+cAXnGrZ/17O0y7JxZ3nJkf6Pz5BsS6QPHD1k
   GmB+KpTMSaMiHVXO9utMaffqDZ2zfcEGz9qKtVLd3NyAOEN3R6y6A9JO5
   eTDzaOY4NGgBw59DzWajWjSy+oUXxlBPiqWtmtAVZNoSEFfXBwaJ0SglN
   w==;
X-CSE-ConnectionGUID: FtcL/95YR4OoeEGW3DYJtw==
X-CSE-MsgGUID: IpgIislGTPCSGFqhhjWTqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="57257616"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="57257616"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 18:41:12 -0800
X-CSE-ConnectionGUID: AY6m7c68SimA2ZwivtXmnw==
X-CSE-MsgGUID: SlD/eWTOSYShL+wk8C2FYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="135316240"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 09 Feb 2025 18:41:11 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1thJjQ-0012Bh-2f;
	Mon, 10 Feb 2025 02:41:08 +0000
Date: Mon, 10 Feb 2025 10:40:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm/boot/dts/arm/integratorap-im-pd1.dts:57.28-64.4: Warning
 (simple_bus_reg): /bus@c0000000/bus@c0000000/clock-uart: missing or empty
 reg/ranges property
Message-ID: <202502101048.ieC07aBE-lkp@intel.com>
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
head:   a64dcfb451e254085a7daee5fe51bf22959d52d3
commit: 04f08ef291d4b8d76f8d198bf2929ad43b96eecf arm/arm64: dts: arm: Use generic clock and regulator nodenames
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-r013-20230520 (https://download.01.org/0day-ci/archive/20250210/202502101048.ieC07aBE-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250210/202502101048.ieC07aBE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502101048.ieC07aBE-lkp@intel.com/

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
