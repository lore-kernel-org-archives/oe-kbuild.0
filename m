Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23442CCC1
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 19:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750794667; cv=none; b=T7tiD8HwdNbBTaLAB9gcboVaLMAmFg2cEMb2JFsgw87mjvcNnjfIuMOMlkjEuw8pU1cCdGmcIblT/GV8SVItQU185I78zZ4Kvixh05z+9AH55920JsdR3suKcjVDkAbiAHsQ2jazcNx1FWSpD0bvku7diaJDLhtx3f2uznng10c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750794667; c=relaxed/simple;
	bh=gjb2D1xg+DUy6XbHyjNC/+up4SXOlZqcUOv0Mr4bpHs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WiM0z+uxS+H+QMOTcGNOODzyN/ZU5f3xolkpnMFP5r86vSzFv3Px6V9oJvlX3uyu0GSQf8YjUalUh082FxpSSfeaAzk3uSPUAy80EBGP9XGXYD+4KDUMTZLDtk4gD4PJgHlOxMPuCOkiTfroOadSUIUK1VUh3oRRFY3QprgI+C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5LbRDvs; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5LbRDvs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750794661; x=1782330661;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gjb2D1xg+DUy6XbHyjNC/+up4SXOlZqcUOv0Mr4bpHs=;
  b=T5LbRDvsdKM1n93MvAUIKabuscapSGzT10QHj2xnkcCbsF97+aLiylNy
   JIzWouzW+IFL3l/kqeYWT9XBnXTocFV+Fub1N9W9aPyueOloF/D5z5sjo
   kLxGvQrv5BQTsC74esXLGWWgJQdMNXLY8ol5UCnT8OT6VC39fozAImuKW
   HSW5fMs7v4PTy2LBXmbyglyyMr02zEo4DDHcQMDrEcvw6bjS+YfaUy8N4
   H0beEQyfcNmHXJc3BqEbUgtQKVTjWO+phww9+jtNJ7hW8d6W+IKAPgjLg
   hCVmy0XPAoLNXrZEjv2zJARYZWdCxBHsC1qWvkiIcpVAhQrJsa0dq5Xh2
   w==;
X-CSE-ConnectionGUID: QtsT2r8/RKiKwVdNN9s48Q==
X-CSE-MsgGUID: fBP/2WWERSqqBPIyfOCOHA==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64106898"
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="64106898"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 12:51:00 -0700
X-CSE-ConnectionGUID: nh5Bf1iaQMuNKruumC2MAw==
X-CSE-MsgGUID: xU8gsyKfTMCiQPgpVmysbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,263,1744095600"; 
   d="scan'208";a="183052497"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 24 Jun 2025 12:50:59 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU9fV-000SSk-0d;
	Tue, 24 Jun 2025 19:50:57 +0000
Date: Wed, 25 Jun 2025 03:50:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/genexis-xg6846b-v6.16-rc1 8/10]
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts:236.20-300.4: Warning
 (avoid_unnecessary_addr_size): /bus@ff800000/mdio@2060/switch@0: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202506250310.mTrNzV0i-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-v6.16-rc1
head:   5420b6e9c9c247c32861570d0332ec5376c283a8
commit: a58c76fa47514e22d425dac1995032f23556606a [8/10] ARM: dts: bcm6846: Add Marvell switch and SFP
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arm-allmodconfig (https://download.01.org/0day-ci/archive/20250625/202506250310.mTrNzV0i-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250625/202506250310.mTrNzV0i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506250310.mTrNzV0i-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts:236.20-300.4: Warning (avoid_unnecessary_addr_size): /bus@ff800000/mdio@2060/switch@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property

vim +236 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts

618775c9007d66 Linus Walleij 2024-10-19  232  
618775c9007d66 Linus Walleij 2024-10-19  233  &mdio {
618775c9007d66 Linus Walleij 2024-10-19  234  	status = "okay";
618775c9007d66 Linus Walleij 2024-10-19  235  
a58c76fa47514e Linus Walleij 2025-06-18 @236  	switch0: switch@0 {
a58c76fa47514e Linus Walleij 2025-06-18  237  		/* Actually MV88E6320 revision 2 */
a58c76fa47514e Linus Walleij 2025-06-18  238  		compatible = "marvell,mv88e6085";
a58c76fa47514e Linus Walleij 2025-06-18  239  		#address-cells = <1>;
a58c76fa47514e Linus Walleij 2025-06-18  240  		#size-cells = <0>;
a58c76fa47514e Linus Walleij 2025-06-18  241  		reg = <0>;
a58c76fa47514e Linus Walleij 2025-06-18  242  
a58c76fa47514e Linus Walleij 2025-06-18  243  		interrupt-controller;
a58c76fa47514e Linus Walleij 2025-06-18  244  		#interrupt-cells = <2>;
a58c76fa47514e Linus Walleij 2025-06-18  245  
a58c76fa47514e Linus Walleij 2025-06-18  246  		ports {
a58c76fa47514e Linus Walleij 2025-06-18  247  			#address-cells = <1>;
a58c76fa47514e Linus Walleij 2025-06-18  248  			#size-cells = <0>;
a58c76fa47514e Linus Walleij 2025-06-18  249  
a58c76fa47514e Linus Walleij 2025-06-18  250  			port@0 {
a58c76fa47514e Linus Walleij 2025-06-18  251  				reg = <0>;
a58c76fa47514e Linus Walleij 2025-06-18  252  
a58c76fa47514e Linus Walleij 2025-06-18  253  				phy-mode = "sgmii";
a58c76fa47514e Linus Walleij 2025-06-18  254  				// ethernet = <?> the SGMII of BCM68460
a58c76fa47514e Linus Walleij 2025-06-18  255  				// also known as "serdes"
a58c76fa47514e Linus Walleij 2025-06-18  256  
a58c76fa47514e Linus Walleij 2025-06-18  257  				fixed-link {
a58c76fa47514e Linus Walleij 2025-06-18  258  					// TODO: can this do 2500?
a58c76fa47514e Linus Walleij 2025-06-18  259  					speed = <1000>;
a58c76fa47514e Linus Walleij 2025-06-18  260  					full-duplex;
a58c76fa47514e Linus Walleij 2025-06-18  261  				};
a58c76fa47514e Linus Walleij 2025-06-18  262  			};
a58c76fa47514e Linus Walleij 2025-06-18  263  
a58c76fa47514e Linus Walleij 2025-06-18  264  			port@1 {
a58c76fa47514e Linus Walleij 2025-06-18  265  				reg = <1>;
a58c76fa47514e Linus Walleij 2025-06-18  266  				label = "wan";
a58c76fa47514e Linus Walleij 2025-06-18  267  
a58c76fa47514e Linus Walleij 2025-06-18  268  				phy-mode = "rgmii-id";
a58c76fa47514e Linus Walleij 2025-06-18  269  				sfp = <&sfp0>;
a58c76fa47514e Linus Walleij 2025-06-18  270  
a58c76fa47514e Linus Walleij 2025-06-18  271  				fixed-link {
a58c76fa47514e Linus Walleij 2025-06-18  272  					// TODO: can this do 2500?
a58c76fa47514e Linus Walleij 2025-06-18  273  					speed = <1000>;
a58c76fa47514e Linus Walleij 2025-06-18  274  					full-duplex;
a58c76fa47514e Linus Walleij 2025-06-18  275  				};
a58c76fa47514e Linus Walleij 2025-06-18  276  			};
a58c76fa47514e Linus Walleij 2025-06-18  277  
a58c76fa47514e Linus Walleij 2025-06-18  278  			port@4 {
a58c76fa47514e Linus Walleij 2025-06-18  279  				reg = <4>;
a58c76fa47514e Linus Walleij 2025-06-18  280  				label = "wan/ext1";
a58c76fa47514e Linus Walleij 2025-06-18  281  				phy-mode = "rgmii";
a58c76fa47514e Linus Walleij 2025-06-18  282  				// I think the PHY adds the delay
a58c76fa47514e Linus Walleij 2025-06-18  283  				phy-handle = <&phy21>;
a58c76fa47514e Linus Walleij 2025-06-18  284  			};
a58c76fa47514e Linus Walleij 2025-06-18  285  
a58c76fa47514e Linus Walleij 2025-06-18  286  			port@6 {
a58c76fa47514e Linus Walleij 2025-06-18  287  				reg = <6>;
a58c76fa47514e Linus Walleij 2025-06-18  288  
a58c76fa47514e Linus Walleij 2025-06-18  289  				phy-mode = "rgmii-id";
a58c76fa47514e Linus Walleij 2025-06-18  290  				// ethernet = <?> the RGMII of BCM68460
a58c76fa47514e Linus Walleij 2025-06-18  291  				// From port n on the "brcm,enet"
a58c76fa47514e Linus Walleij 2025-06-18  292  				// UNIMAC driver
a58c76fa47514e Linus Walleij 2025-06-18  293  
a58c76fa47514e Linus Walleij 2025-06-18  294  				fixed-link {
a58c76fa47514e Linus Walleij 2025-06-18  295  					speed = <1000>;
a58c76fa47514e Linus Walleij 2025-06-18  296  					full-duplex;
a58c76fa47514e Linus Walleij 2025-06-18  297  				};
a58c76fa47514e Linus Walleij 2025-06-18  298  			};
a58c76fa47514e Linus Walleij 2025-06-18  299  		};
a58c76fa47514e Linus Walleij 2025-06-18  300  	};
a58c76fa47514e Linus Walleij 2025-06-18  301  
a58c76fa47514e Linus Walleij 2025-06-18  302  	/* These PHYs have ID 0xae0251e1 called "bca_phy" in the source */
618775c9007d66 Linus Walleij 2024-10-19  303  	phy1: ethernet-phy@1 {
a58c76fa47514e Linus Walleij 2025-06-18  304  		// Port 0 on the enet/UNIMAC
618775c9007d66 Linus Walleij 2024-10-19  305  		reg = <1>;
618775c9007d66 Linus Walleij 2024-10-19  306  	};
618775c9007d66 Linus Walleij 2024-10-19  307  	phy2: ethernet-phy@2 {
a58c76fa47514e Linus Walleij 2025-06-18  308  		// Port 1 on the enet/UNIMAC
618775c9007d66 Linus Walleij 2024-10-19  309  		reg = <2>;
618775c9007d66 Linus Walleij 2024-10-19  310  	};
618775c9007d66 Linus Walleij 2024-10-19  311  	phy3: ethernet-phy@3 {
a58c76fa47514e Linus Walleij 2025-06-18  312  		// Port 2 on the enet/UNIMAC
618775c9007d66 Linus Walleij 2024-10-19  313  		reg = <3>;
618775c9007d66 Linus Walleij 2024-10-19  314  	};
618775c9007d66 Linus Walleij 2024-10-19  315  	phy4: ethernet-phy@4 {
a58c76fa47514e Linus Walleij 2025-06-18  316  		// Port 3 on the enet/UNIMAC
618775c9007d66 Linus Walleij 2024-10-19  317  		reg = <4>;
618775c9007d66 Linus Walleij 2024-10-19  318  	};
a58c76fa47514e Linus Walleij 2025-06-18  319  
a58c76fa47514e Linus Walleij 2025-06-18  320  	/* This external PHY used for wan/ext1 has ID 0xff001152 */
618775c9007d66 Linus Walleij 2024-10-19  321  	phy21: ethernet-phy@21 {
a58c76fa47514e Linus Walleij 2025-06-18  322  		// Port 4 on the MV88E6320
618775c9007d66 Linus Walleij 2024-10-19  323  		reg = <21>;
a58c76fa47514e Linus Walleij 2025-06-18  324  		// Vendor device tree says RX and TX are delayed in the PHY
a58c76fa47514e Linus Walleij 2025-06-18  325  		// but not by how much.
a58c76fa47514e Linus Walleij 2025-06-18  326  		rx-internal-delay-ps = <2000>;
a58c76fa47514e Linus Walleij 2025-06-18  327  		tx-internal-delay-ps = <2000>;
a58c76fa47514e Linus Walleij 2025-06-18  328  	};
618775c9007d66 Linus Walleij 2024-10-19  329  };
a58c76fa47514e Linus Walleij 2025-06-18  330  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
