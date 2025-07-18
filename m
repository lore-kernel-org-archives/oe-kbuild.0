Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E732BA27
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Jul 2025 03:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752808784; cv=none; b=hKmcG0Ex36b0euEda/AIz4kp1Rq0X70bzUoeWzUW7GomSNkon4Grl1fXE+kkvKuKDmW51KTSuGeWnlYickSvsTkV2vGqitO6ryNQD0ppY+iv8QVGueB+0NPCEuIAw65jkskOaTXl5khR8BbeDo13/cIDqfzZpAThs434Quo9BDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752808784; c=relaxed/simple;
	bh=P9+0LnGFYuXWXIYTlsW4JtZB+NHMvbI49XjKtWv6CqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Cr9pMRJ5u0hGD+ZAOQW91ncys5KyHG1S8fSqOgV5hkrpsglC8zu6D6/TBN3VyNbObGQghnWJrngGw7VEO66Xww4TXnGe1CypWaAPCI8w5fqAPXvBcyVy2yaGaLpOy88LfBt0mS2quPhSxFxaJFCELI8YWdf+x6PPIgJayYq1N/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TwZN28vO; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TwZN28vO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752808782; x=1784344782;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P9+0LnGFYuXWXIYTlsW4JtZB+NHMvbI49XjKtWv6CqM=;
  b=TwZN28vOoOaxn972Quqfm6odkVNzJOjhi68drO3PVSQX9nbON/lRDzJ4
   conyW50G3FHdmjl8Y5U2I4Ke+sFlIpPh7y5sfsgaMuHPPw4iVUNnZVWiD
   ByZDUu+l0jIPDMMwttGsF0+CD7sCWWeQYPjcimzmWNIhAvtdWD1ptotRr
   +XpV0W70nRh8dD/znml6KjBsAmrVdj+uvQ1KZsTNggzKGYVJICvVcb2u2
   bbyWfacZcYfDgry1Qf29xkiiZWPzfxGgRvhkavJgj0FuP444gszhhNprH
   vQA3wPW8RRSYXGVx4Yup+ZSB8dceGMgZ+0mhHW+T8XbR/4RCn/vUirzmg
   A==;
X-CSE-ConnectionGUID: gSfMbhDdSW2D5ZEAUBRa2Q==
X-CSE-MsgGUID: VjwEef1QRu2KBxi1cI9Z5A==
X-IronPort-AV: E=McAfee;i="6800,10657,11495"; a="58910468"
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="58910468"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jul 2025 20:19:40 -0700
X-CSE-ConnectionGUID: 228XQa9rR9OR6sPuQi1dwA==
X-CSE-MsgGUID: CVkOsVEoS52wSzXC6xXkQw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,320,1744095600"; 
   d="scan'208";a="158072553"
Received: from igk-lkp-server01.igk.intel.com (HELO 8b57277650df) ([10.91.175.65])
  by fmviesa006.fm.intel.com with ESMTP; 17 Jul 2025 20:19:40 -0700
Received: from kbuild by 8b57277650df with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ucbdJ-0000pl-2h;
	Fri, 18 Jul 2025 03:19:37 +0000
Date: Fri, 18 Jul 2025 05:18:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [robh:imx93-ethos-v2 4/49]
 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts:298.10-309.6: Warning
 (graph_child_address):
 /soc@0/bus@42000000/i2c@42530000/tcpc@50/connector/ports: graph node has
 single child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202507180533.syTvejLp-lkp@intel.com>
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
TO: Fabian Pflug <f.pflug@pengutronix.de>
CC: Tomeu Vizoso <tomeu@tomeuvizoso.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   b81e8ee214f77950479c304b6ca560903de46c7c
commit: ab8d0290a971b84a8c79e92b987cdb5ceb04d003 [4/49] arm64: dts: freescale: add support for NXP i.MX93 FRDM
:::::: branch date: 2 days ago
:::::: commit date: 4 weeks ago
config: arm64-randconfig-2052-20250717 (https://download.01.org/0day-ci/archive/20250718/202507180533.syTvejLp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250718/202507180533.syTvejLp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507180533.syTvejLp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts:298.10-309.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@50/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: / (fsl,imx93-11x11-frdm): compatible: 'oneOf' conditional failed, one must be fixed:
   	['fsl,imx93-11x11-frdm', 'fsl,imx93'] is too short
>> 	arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: / (fsl,imx93-11x11-frdm): compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,imx93-11x11-frdm', 'fsl,imx93'] is too short
   		'fsl,imx93-11x11-frdm' is not one of ['tq,imx8dxp-tqma8xdp-mba8xx']
   		'fsl,imx93-11x11-frdm' is not one of ['tq,imx8qxp-tqma8xqp-mba8xx']
   		'tq,imx8dxp-tqma8xdp' was expected
   		'tq,imx8qxp-tqma8xqp' was expected
>> 	arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: / (fsl,imx93-11x11-frdm): compatible: 'oneOf' conditional failed, one must be fixed:
   		['fsl,imx93-11x11-frdm', 'fsl,imx93'] is too short
   		'fsl,imx93-11x11-frdm' is not one of ['tq,imx8qxp-tqma8xqps-mb-smarc-2']
   		'fsl,imx93-11x11-frdm' is not one of ['tq,imx8dxp-tqma8xdps-mb-smarc-2']
   		'tq,imx8qxp-tqma8xqps' was expected
   		'tq,imx8dxp-tqma8xdps' was expected
   	['fsl,imx93-11x11-frdm', 'fsl,imx93'] is too long
   	'fsl,imx93-11x11-frdm' is not one of ['armadeus,imx1-apf9328', 'fsl,imx1ads']
   	'fsl,imx93-11x11-frdm' is not one of ['creative,x-fi3', 'fsl,imx23-evk', 'fsl,stmp378x-devb', 'olimex,imx23-olinuxino', 'sandisk,sansa_fuze_plus']
   	'fsl,imx93-11x11-frdm' is not one of ['fsl,imx25-pdk', 'karo,imx25-tx25']
   	'fsl,imx93-11x11-frdm' is not one of ['eukrea,mbimxsd25-baseboard']
--
   	'fsl,ls2088a' was expected
   	'fsl,lx2160a' was expected
   	'solidrun,lx2160a-cex7' was expected
   	'solidrun,lx2162a-som' was expected
   	'tq,lx2160a-tqmlx2160a' was expected
   	'nxp,s32g2' was expected
   	'nxp,s32g3' was expected
   	'fsl,s32v234' was expected
   	from schema $id: http://devicetree.org/schemas/arm/fsl.yaml#
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: /: failed to match any schema with compatible: ['fsl,imx93-11x11-frdm', 'fsl,imx93']
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: sram@20480000 (mmio-sram): '#address-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: sram@20480000 (mmio-sram): '#size-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: sram@20480000 (mmio-sram): 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml#
   arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dtb: /soc@0/npu@4a900000: failed to match any schema with compatible: ['arm,ethos-u65']

vim +298 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts

ab8d0290a971b8 Fabian Pflug 2025-05-26  271  
ab8d0290a971b8 Fabian Pflug 2025-05-26  272  &lpi2c3 {
ab8d0290a971b8 Fabian Pflug 2025-05-26  273  	#address-cells = <1>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  274  	#size-cells = <0>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  275  	clock-frequency = <400000>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  276  	pinctrl-0 = <&pinctrl_lpi2c3>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  277  	pinctrl-names = "default";
ab8d0290a971b8 Fabian Pflug 2025-05-26  278  	status = "okay";
ab8d0290a971b8 Fabian Pflug 2025-05-26  279  
ab8d0290a971b8 Fabian Pflug 2025-05-26  280  	ptn5110: tcpc@50 {
ab8d0290a971b8 Fabian Pflug 2025-05-26  281  		compatible = "nxp,ptn5110", "tcpci";
ab8d0290a971b8 Fabian Pflug 2025-05-26  282  		reg = <0x50>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  283  		interrupt-parent = <&gpio3>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  284  		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  285  
ab8d0290a971b8 Fabian Pflug 2025-05-26  286  		typec1_con: connector {
ab8d0290a971b8 Fabian Pflug 2025-05-26  287  			compatible = "usb-c-connector";
ab8d0290a971b8 Fabian Pflug 2025-05-26  288  			data-role = "dual";
ab8d0290a971b8 Fabian Pflug 2025-05-26  289  			label = "USB-C";
ab8d0290a971b8 Fabian Pflug 2025-05-26  290  			op-sink-microwatt = <15000000>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  291  			power-role = "dual";
ab8d0290a971b8 Fabian Pflug 2025-05-26  292  			self-powered;
ab8d0290a971b8 Fabian Pflug 2025-05-26  293  			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
ab8d0290a971b8 Fabian Pflug 2025-05-26  294  				     PDO_VAR(5000, 20000, 3000)>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  295  			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  296  			try-power-role = "sink";
ab8d0290a971b8 Fabian Pflug 2025-05-26  297  
ab8d0290a971b8 Fabian Pflug 2025-05-26 @298  			ports {
ab8d0290a971b8 Fabian Pflug 2025-05-26  299  				#address-cells = <1>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  300  				#size-cells = <0>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  301  
ab8d0290a971b8 Fabian Pflug 2025-05-26  302  				port@0 {
ab8d0290a971b8 Fabian Pflug 2025-05-26  303  					reg = <0>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  304  
ab8d0290a971b8 Fabian Pflug 2025-05-26  305  					typec1_dr_sw: endpoint {
ab8d0290a971b8 Fabian Pflug 2025-05-26  306  						remote-endpoint = <&usb1_drd_sw>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  307  					};
ab8d0290a971b8 Fabian Pflug 2025-05-26  308  				};
ab8d0290a971b8 Fabian Pflug 2025-05-26  309  			};
ab8d0290a971b8 Fabian Pflug 2025-05-26  310  		};
ab8d0290a971b8 Fabian Pflug 2025-05-26  311  	};
ab8d0290a971b8 Fabian Pflug 2025-05-26  312  
ab8d0290a971b8 Fabian Pflug 2025-05-26  313  	pcf2131: rtc@53 {
ab8d0290a971b8 Fabian Pflug 2025-05-26  314  		compatible = "nxp,pcf2131";
ab8d0290a971b8 Fabian Pflug 2025-05-26  315  		reg = <0x53>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  316  		interrupt-parent = <&pcal6524>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  317  		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
ab8d0290a971b8 Fabian Pflug 2025-05-26  318  	};
ab8d0290a971b8 Fabian Pflug 2025-05-26  319  };
ab8d0290a971b8 Fabian Pflug 2025-05-26  320  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
