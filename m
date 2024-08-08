Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC6FE18991D
	for <oe-kbuild@lists.linux.dev>; Thu,  8 Aug 2024 08:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723107227; cv=none; b=CRiUZRHgHF9D1W3FnsA6cn8z5mWaLnsJ2+w9osCqIg6zrBGrUnj2nZCdJZ7xYgbQfFWH8BF2EQ9csDZ8LXrdqq2keXP9mVLUNGXJr9g7Daz34Nq+0fgY++62W1kPFM0bclYKh9PaHfaa2DJFu0wyu2g+on2dTtQRjH/2HQzv7G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723107227; c=relaxed/simple;
	bh=g61P4GClHmubTIuX/L7emkrs2OqNR1vEBdzysgAEmsg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QfnLd5QGtAhXff57aGnBpexpNstMUeqdJMkh//Qugub95j7AXDFs9aHYAOXkRmrHy9Y2HVUwbvSMBbH0ru/5juDN4DtlKN6Oac3uKobIJowk8dXYOyQevDE1l9I26efKyXq2RkE4NuEcO35EI10I1HNpeqJ6HolzfgTW/cUPUDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jMrrhfv/; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jMrrhfv/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723107226; x=1754643226;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=g61P4GClHmubTIuX/L7emkrs2OqNR1vEBdzysgAEmsg=;
  b=jMrrhfv/Qzi9zwXvgZ3jDJIhTUrVPbuToDJiAufwww0BLeG0aLHXs0d+
   fHWLR0JsGN49/hLpSCnAvyAn+c6mOa1n3JmzZCUYzHEgUVTAwZ2K9Q/Qs
   cM/gqNn+Tqf9UUeW3clC28ouFTbJbGsx0Ga+Y+gAOdrpGu4FFyArZkre9
   QC+e5M8xoCX06YZk4sVIHi24FVgcnED7ciBi0XLIMSa7oD7S+p5/gCROm
   cD9QSuedgxX7kxDTB8SB4ekhKrzH7m5ydnTTqMmzuoMegyTmyfbahGq0l
   1fY1iDX+NPbAvyeEJGLZEqOsS28bwjlP+Ehj5Y31NtRwx92blCgAFFAPN
   Q==;
X-CSE-ConnectionGUID: ojl3Z0ZNRbCHfL1oX3ZdQA==
X-CSE-MsgGUID: 02Yj3nL+S+umVyytYf2l5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="24981596"
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="24981596"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 01:53:46 -0700
X-CSE-ConnectionGUID: GCRIe3CJShe+koXUoIJ6jQ==
X-CSE-MsgGUID: IlzSLW5PQt6c1o1iIY6h8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,272,1716274800"; 
   d="scan'208";a="61544890"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 08 Aug 2024 01:53:44 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbytt-00064C-2C;
	Thu, 08 Aug 2024 08:53:39 +0000
Date: Thu, 8 Aug 2024 16:52:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [xilinx-xlnx:xlnx_rebase_v6.6_LTS_2024.1_update 705/1001]
 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts:92.21-94.5:
 Warning (unit_address_vs_reg): /axi/ethernet@f19f0000/mdio/ethernet-phy:
 node has a reg or ranges property, but no unit name
Message-ID: <202408081621.WK8SJpUp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: git@amd.com
TO: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6_LTS_2024.1_update
head:   5365c13a86998da06d845c918f849b30b8735538
commit: db2cebe1341f43028ac855c49238eb7244a5f75c [705/1001] arm64: versal-net: Add all missing dt files for Xilinx boards
:::::: branch date: 7 days ago
:::::: commit date: 8 months ago
config: arm64-randconfig-051-20240808 (https://download.01.org/0day-ci/archive/20240808/202408081621.WK8SJpUp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408081621.WK8SJpUp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408081621.WK8SJpUp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts:92.21-94.5: Warning (unit_address_vs_reg): /axi/ethernet@f19f0000/mdio/ethernet-phy: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/xilinx/versal-net.dtsi:439.27-446.5: Warning (avoid_unnecessary_addr_size): /axi/ethernet@f19f0000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts:132.21-157.4: Warning (avoid_unnecessary_addr_size): /axi/spi@f1010000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   Traceback (most recent call last):
     File "/usr/local/bin/dt-validate", line 8, in <module>
       sys.exit(main())
                ^^^^^^
     File "/usr/local/lib/python3.11/dist-packages/dtschema/dtb_validate.py", line 150, in main
       sg.check_dtb(filename)
     File "/usr/local/lib/python3.11/dist-packages/dtschema/dtb_validate.py", line 89, in check_dtb
       dt = self.validator.decode_dtb(f.read())
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
     File "/usr/local/lib/python3.11/dist-packages/dtschema/validator.py", line 536, in decode_dtb

vim +92 arch/arm64/boot/dts/xilinx/versal-net-vn-x-b2197-00-revA.dts

db2cebe1341f43 Michal Simek 2022-12-12   82  
db2cebe1341f43 Michal Simek 2022-12-12   83  &gem1 {
db2cebe1341f43 Michal Simek 2022-12-12   84  	status = "okay";
db2cebe1341f43 Michal Simek 2022-12-12   85  	#address-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12   86  	#size-cells = <0>;
db2cebe1341f43 Michal Simek 2022-12-12   87  	phy-handle = <&phy>;
db2cebe1341f43 Michal Simek 2022-12-12   88  	phy-mode = "rmii";
db2cebe1341f43 Michal Simek 2022-12-12   89  	mdio {
db2cebe1341f43 Michal Simek 2022-12-12   90  		#address-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12   91  		#size-cells = <0>;
db2cebe1341f43 Michal Simek 2022-12-12  @92  		phy: ethernet-phy {
db2cebe1341f43 Michal Simek 2022-12-12   93  			reg = <4>;
db2cebe1341f43 Michal Simek 2022-12-12   94  		};
db2cebe1341f43 Michal Simek 2022-12-12   95  	};
db2cebe1341f43 Michal Simek 2022-12-12   96  };
db2cebe1341f43 Michal Simek 2022-12-12   97  
db2cebe1341f43 Michal Simek 2022-12-12   98  &gpio0 {
db2cebe1341f43 Michal Simek 2022-12-12   99  	status = "okay";
db2cebe1341f43 Michal Simek 2022-12-12  100  };
db2cebe1341f43 Michal Simek 2022-12-12  101  
db2cebe1341f43 Michal Simek 2022-12-12  102  &gpio1 {
db2cebe1341f43 Michal Simek 2022-12-12  103  	status = "okay";
db2cebe1341f43 Michal Simek 2022-12-12  104  };
db2cebe1341f43 Michal Simek 2022-12-12  105  
db2cebe1341f43 Michal Simek 2022-12-12  106  &i2c0 {
db2cebe1341f43 Michal Simek 2022-12-12  107  	status = "okay";
db2cebe1341f43 Michal Simek 2022-12-12  108  	eeprom0: eeprom@51 {
db2cebe1341f43 Michal Simek 2022-12-12  109  		compatible = "st,24c128", "atmel,24c128";
db2cebe1341f43 Michal Simek 2022-12-12  110  		reg = <0x51>;
db2cebe1341f43 Michal Simek 2022-12-12  111  		bootph-all;
db2cebe1341f43 Michal Simek 2022-12-12  112  	};
db2cebe1341f43 Michal Simek 2022-12-12  113  };
db2cebe1341f43 Michal Simek 2022-12-12  114  
db2cebe1341f43 Michal Simek 2022-12-12  115  &i2c1 {
db2cebe1341f43 Michal Simek 2022-12-12  116  	status = "okay";
db2cebe1341f43 Michal Simek 2022-12-12  117  	eeprom1: eeprom@55 {
db2cebe1341f43 Michal Simek 2022-12-12  118  		compatible = "st,24c128", "atmel,24c128";
db2cebe1341f43 Michal Simek 2022-12-12  119  		reg = <0x55>;
db2cebe1341f43 Michal Simek 2022-12-12  120  		bootph-all;
db2cebe1341f43 Michal Simek 2022-12-12  121  	};
db2cebe1341f43 Michal Simek 2022-12-12  122  };
db2cebe1341f43 Michal Simek 2022-12-12  123  
db2cebe1341f43 Michal Simek 2022-12-12  124  &ospi {
db2cebe1341f43 Michal Simek 2022-12-12  125  	status = "okay";
db2cebe1341f43 Michal Simek 2022-12-12  126  	num-cs = <2>;
db2cebe1341f43 Michal Simek 2022-12-12  127  	reset-gpios = <&gpio1 12 GPIO_ACTIVE_HIGH>;
db2cebe1341f43 Michal Simek 2022-12-12  128  	reset-names = "qspi";
db2cebe1341f43 Michal Simek 2022-12-12  129  	#address-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  130  	#size-cells = <0>;
db2cebe1341f43 Michal Simek 2022-12-12  131  
db2cebe1341f43 Michal Simek 2022-12-12 @132  	mt35xu02g: flash@0 {
db2cebe1341f43 Michal Simek 2022-12-12  133  		compatible = "micron,m25p80", "jedec,spi-nor";
db2cebe1341f43 Michal Simek 2022-12-12  134  		reg = <0>, <1>;
db2cebe1341f43 Michal Simek 2022-12-12  135  		stacked-memories = /bits/ 64 <0x8000000 0x8000000>; /* 128MB */
db2cebe1341f43 Michal Simek 2022-12-12  136  		#address-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  137  		#size-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  138  		cdns,read-delay = <0>;
db2cebe1341f43 Michal Simek 2022-12-12  139  		cdns,tshsl-ns = <0>;
db2cebe1341f43 Michal Simek 2022-12-12  140  		cdns,tsd2d-ns = <0>;
db2cebe1341f43 Michal Simek 2022-12-12  141  		cdns,tchsh-ns = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  142  		cdns,tslch-ns = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  143  		spi-tx-bus-width = <8>;
db2cebe1341f43 Michal Simek 2022-12-12  144  		spi-rx-bus-width = <8>;
db2cebe1341f43 Michal Simek 2022-12-12  145  		spi-max-frequency = <5000000>;
db2cebe1341f43 Michal Simek 2022-12-12  146  		broken-flash-reset;
db2cebe1341f43 Michal Simek 2022-12-12  147  
db2cebe1341f43 Michal Simek 2022-12-12  148  		partitions {
db2cebe1341f43 Michal Simek 2022-12-12  149  			compatible = "fixed-partitions";
db2cebe1341f43 Michal Simek 2022-12-12  150  			#address-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  151  			#size-cells = <1>;
db2cebe1341f43 Michal Simek 2022-12-12  152  			partition@0 {
db2cebe1341f43 Michal Simek 2022-12-12  153  				label = "ospi-flash0";
db2cebe1341f43 Michal Simek 2022-12-12  154  				reg = <0 0x8000000>;
db2cebe1341f43 Michal Simek 2022-12-12  155  			};
db2cebe1341f43 Michal Simek 2022-12-12  156  		};
db2cebe1341f43 Michal Simek 2022-12-12  157  	};
db2cebe1341f43 Michal Simek 2022-12-12  158  };
db2cebe1341f43 Michal Simek 2022-12-12  159  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
