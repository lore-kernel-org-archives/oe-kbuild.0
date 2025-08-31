Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2323C2F
	for <oe-kbuild@lists.linux.dev>; Sun, 31 Aug 2025 05:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756619094; cv=none; b=AJcFiy2EaRnpwOcKdHN76zdQCbM2E+/yUsrGLeYOZnKO4wpgcoGWqgiX0fyuRTXlPQWIqCBx6svHtldGChMehKRljBVZ/8qD4tsMB9LNBmYt9u5K8xVaQTX1RmINcafPbAtXNvsAJDGhS/SJDeAUrqGcmj4wPYOSTpsX5ouXB4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756619094; c=relaxed/simple;
	bh=3DeXdQ2oaum5m8cJsjuaBpV9A3FZliEbliW9kQJXMdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RlQ8uBXviYaZGp52T36qhlZv4PlC/NG0zNmFd69vq3MRVabZYVqXUn8CoIApF7SOyHSmCQxfI/mmpCrJ5dPfWTGpprWcU9eWea//u1MSDHXdkpkkx/zQnM06iMXKIzc89kyYVFps4Xg4TJtaVKhxfXLO+emMM7MwivQanm/iMxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aK9RJdh/; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aK9RJdh/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756619092; x=1788155092;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3DeXdQ2oaum5m8cJsjuaBpV9A3FZliEbliW9kQJXMdE=;
  b=aK9RJdh/MM42yo3B1pnZ+6owQMSdUw0LRh6Qbh+zysP9PVTd1IaFRd53
   hvQMJtGuyfqpCbl1SztPPW95+sYc9gIS4gMhIYnj7rSNujk6Xl/MsnhmV
   zn8WH9VgUftXXQw9EaT8guxj59nt85TWLutOmbTWMtQHKVNscLtIbpIMJ
   dMLtkLx0o33WTjfqieHhRme+C3Y84lkmtWrePh2sGCuGJ0ceQdVc8Ixy9
   47jYO3A3S89eGr1Q8u38Wxt95uBvXOAMmqgZk3YfeXiuIzY6/pGNgJp6X
   Jppa8HmBtSnUy5fQBe4yGlH+KmQECx75eHHvvI0lvFsqiNQUO0PGNaI84
   Q==;
X-CSE-ConnectionGUID: H2MjzMSrQlWgaVscG70HvA==
X-CSE-MsgGUID: Dp8Ntp/5T0qUFxLOvaTXyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="76447637"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="76447637"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2025 22:44:51 -0700
X-CSE-ConnectionGUID: 7C+o6uXWTfqzBNhTfRQteQ==
X-CSE-MsgGUID: yEk8OWyMRBKM3pFKLQmgXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170262575"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa009.jf.intel.com with ESMTP; 30 Aug 2025 22:44:50 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usarv-00034J-2Y;
	Sun, 31 Aug 2025 05:44:47 +0000
Date: Sun, 31 Aug 2025 07:44:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/genexis-xg6846b-v6.17-rc1 8/9]
 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts:236.20-300.4: Warning
 (avoid_unnecessary_addr_size): /bus@ff800000/mdio@2060/switch@0: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202508310706.2QfEVoNP-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/genexis-xg6846b-v6.17-rc1
head:   e48e1a2def8a9105cfaf3ccbf10260bde3e75f78
commit: e948b107f985bc442fba9d1327b7f9e90cc6f960 [8/9] ARM: dts: bcm6846: Add I2C bus block
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2052-20250830 (https://download.01.org/0day-ci/archive/20250831/202508310706.2QfEVoNP-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250831/202508310706.2QfEVoNP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508310706.2QfEVoNP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts:236.20-300.4: Warning (avoid_unnecessary_addr_size): /bus@ff800000/mdio@2060/switch@0: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: switch@0 (marvell,mv88e6085): Unevaluated properties are not allowed ('#address-cells', '#size-cells' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/dsa/marvell,mv88e6xxx.yaml#
   arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dtb: /bus@ff800000/i2c@2100: failed to match any schema with compatible: ['brcm,bcmbca-i2c']

vim +236 arch/arm/boot/dts/broadcom/bcm6846-genexis-xg6846b.dts

618775c9007d66 Linus Walleij 2024-10-19  232  
618775c9007d66 Linus Walleij 2024-10-19  233  &mdio {
618775c9007d66 Linus Walleij 2024-10-19  234  	status = "okay";
618775c9007d66 Linus Walleij 2024-10-19  235  
2790c39bcadee0 Linus Walleij 2025-06-18 @236  	switch0: switch@0 {
2790c39bcadee0 Linus Walleij 2025-06-18  237  		/* Actually MV88E6320 revision 2 */
2790c39bcadee0 Linus Walleij 2025-06-18  238  		compatible = "marvell,mv88e6085";
2790c39bcadee0 Linus Walleij 2025-06-18  239  		#address-cells = <1>;
2790c39bcadee0 Linus Walleij 2025-06-18  240  		#size-cells = <0>;
2790c39bcadee0 Linus Walleij 2025-06-18  241  		reg = <0>;
2790c39bcadee0 Linus Walleij 2025-06-18  242  
2790c39bcadee0 Linus Walleij 2025-06-18  243  		interrupt-controller;
2790c39bcadee0 Linus Walleij 2025-06-18  244  		#interrupt-cells = <2>;
2790c39bcadee0 Linus Walleij 2025-06-18  245  
2790c39bcadee0 Linus Walleij 2025-06-18  246  		ports {
2790c39bcadee0 Linus Walleij 2025-06-18  247  			#address-cells = <1>;
2790c39bcadee0 Linus Walleij 2025-06-18  248  			#size-cells = <0>;
2790c39bcadee0 Linus Walleij 2025-06-18  249  
2790c39bcadee0 Linus Walleij 2025-06-18  250  			port@0 {
2790c39bcadee0 Linus Walleij 2025-06-18  251  				reg = <0>;
2790c39bcadee0 Linus Walleij 2025-06-18  252  
2790c39bcadee0 Linus Walleij 2025-06-18  253  				phy-mode = "sgmii";
2790c39bcadee0 Linus Walleij 2025-06-18  254  				// ethernet = <?> the SGMII of BCM68460
2790c39bcadee0 Linus Walleij 2025-06-18  255  				// also known as "serdes"
2790c39bcadee0 Linus Walleij 2025-06-18  256  
2790c39bcadee0 Linus Walleij 2025-06-18  257  				fixed-link {
2790c39bcadee0 Linus Walleij 2025-06-18  258  					// TODO: can this do 2500?
2790c39bcadee0 Linus Walleij 2025-06-18  259  					speed = <1000>;
2790c39bcadee0 Linus Walleij 2025-06-18  260  					full-duplex;
2790c39bcadee0 Linus Walleij 2025-06-18  261  				};
2790c39bcadee0 Linus Walleij 2025-06-18  262  			};
2790c39bcadee0 Linus Walleij 2025-06-18  263  
2790c39bcadee0 Linus Walleij 2025-06-18  264  			port@1 {
2790c39bcadee0 Linus Walleij 2025-06-18  265  				reg = <1>;
2790c39bcadee0 Linus Walleij 2025-06-18  266  				label = "wan";
2790c39bcadee0 Linus Walleij 2025-06-18  267  
2790c39bcadee0 Linus Walleij 2025-06-18  268  				phy-mode = "rgmii-id";
2790c39bcadee0 Linus Walleij 2025-06-18  269  				sfp = <&sfp0>;
2790c39bcadee0 Linus Walleij 2025-06-18  270  
2790c39bcadee0 Linus Walleij 2025-06-18  271  				fixed-link {
2790c39bcadee0 Linus Walleij 2025-06-18  272  					// TODO: can this do 2500?
2790c39bcadee0 Linus Walleij 2025-06-18  273  					speed = <1000>;
2790c39bcadee0 Linus Walleij 2025-06-18  274  					full-duplex;
2790c39bcadee0 Linus Walleij 2025-06-18  275  				};
2790c39bcadee0 Linus Walleij 2025-06-18  276  			};
2790c39bcadee0 Linus Walleij 2025-06-18  277  
2790c39bcadee0 Linus Walleij 2025-06-18  278  			port@4 {
2790c39bcadee0 Linus Walleij 2025-06-18  279  				reg = <4>;
2790c39bcadee0 Linus Walleij 2025-06-18  280  				label = "wan/ext1";
2790c39bcadee0 Linus Walleij 2025-06-18  281  				phy-mode = "rgmii";
2790c39bcadee0 Linus Walleij 2025-06-18  282  				// I think the PHY adds the delay
2790c39bcadee0 Linus Walleij 2025-06-18  283  				phy-handle = <&phy21>;
2790c39bcadee0 Linus Walleij 2025-06-18  284  			};
2790c39bcadee0 Linus Walleij 2025-06-18  285  
2790c39bcadee0 Linus Walleij 2025-06-18  286  			port@6 {
2790c39bcadee0 Linus Walleij 2025-06-18  287  				reg = <6>;
2790c39bcadee0 Linus Walleij 2025-06-18  288  
2790c39bcadee0 Linus Walleij 2025-06-18  289  				phy-mode = "rgmii-id";
2790c39bcadee0 Linus Walleij 2025-06-18  290  				// ethernet = <?> the RGMII of BCM68460
2790c39bcadee0 Linus Walleij 2025-06-18  291  				// From port n on the "brcm,enet"
2790c39bcadee0 Linus Walleij 2025-06-18  292  				// UNIMAC driver
2790c39bcadee0 Linus Walleij 2025-06-18  293  
2790c39bcadee0 Linus Walleij 2025-06-18  294  				fixed-link {
2790c39bcadee0 Linus Walleij 2025-06-18  295  					speed = <1000>;
2790c39bcadee0 Linus Walleij 2025-06-18  296  					full-duplex;
2790c39bcadee0 Linus Walleij 2025-06-18  297  				};
2790c39bcadee0 Linus Walleij 2025-06-18  298  			};
2790c39bcadee0 Linus Walleij 2025-06-18  299  		};
2790c39bcadee0 Linus Walleij 2025-06-18  300  	};
2790c39bcadee0 Linus Walleij 2025-06-18  301  
2790c39bcadee0 Linus Walleij 2025-06-18  302  	/* These PHYs have ID 0xae0251e1 called "bca_phy" in the source */
618775c9007d66 Linus Walleij 2024-10-19  303  	phy1: ethernet-phy@1 {
2790c39bcadee0 Linus Walleij 2025-06-18  304  		// Port 0 on the enet/UNIMAC
618775c9007d66 Linus Walleij 2024-10-19  305  		reg = <1>;
618775c9007d66 Linus Walleij 2024-10-19  306  	};
618775c9007d66 Linus Walleij 2024-10-19  307  	phy2: ethernet-phy@2 {
2790c39bcadee0 Linus Walleij 2025-06-18  308  		// Port 1 on the enet/UNIMAC
618775c9007d66 Linus Walleij 2024-10-19  309  		reg = <2>;
618775c9007d66 Linus Walleij 2024-10-19  310  	};
618775c9007d66 Linus Walleij 2024-10-19  311  	phy3: ethernet-phy@3 {
2790c39bcadee0 Linus Walleij 2025-06-18  312  		// Port 2 on the enet/UNIMAC
618775c9007d66 Linus Walleij 2024-10-19  313  		reg = <3>;
618775c9007d66 Linus Walleij 2024-10-19  314  	};
618775c9007d66 Linus Walleij 2024-10-19  315  	phy4: ethernet-phy@4 {
2790c39bcadee0 Linus Walleij 2025-06-18  316  		// Port 3 on the enet/UNIMAC
618775c9007d66 Linus Walleij 2024-10-19  317  		reg = <4>;
618775c9007d66 Linus Walleij 2024-10-19  318  	};
2790c39bcadee0 Linus Walleij 2025-06-18  319  
2790c39bcadee0 Linus Walleij 2025-06-18  320  	/* This external PHY used for wan/ext1 has ID 0xff001152 */
618775c9007d66 Linus Walleij 2024-10-19  321  	phy21: ethernet-phy@21 {
2790c39bcadee0 Linus Walleij 2025-06-18  322  		// Port 4 on the MV88E6320
618775c9007d66 Linus Walleij 2024-10-19  323  		reg = <21>;
2790c39bcadee0 Linus Walleij 2025-06-18  324  		// Vendor device tree says RX and TX are delayed in the PHY
2790c39bcadee0 Linus Walleij 2025-06-18  325  		// but not by how much.
2790c39bcadee0 Linus Walleij 2025-06-18  326  		rx-internal-delay-ps = <2000>;
2790c39bcadee0 Linus Walleij 2025-06-18  327  		tx-internal-delay-ps = <2000>;
2790c39bcadee0 Linus Walleij 2025-06-18  328  	};
618775c9007d66 Linus Walleij 2024-10-19  329  };
2790c39bcadee0 Linus Walleij 2025-06-18  330  

:::::: The code at line 236 was first introduced by commit
:::::: 2790c39bcadee0a009f6f6809a66f94c21b2e2ca ARM: dts: bcm6846: Add Marvell switch and SFP

:::::: TO: Linus Walleij <linus.walleij@linaro.org>
:::::: CC: Linus Walleij <linus.walleij@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
