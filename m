Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB8C02E11DB
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Jun 2025 18:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749926724; cv=none; b=c53xQQVGBVtoZjKL/S/Zq8ErsKYxzTzCu1/lS1ui6znBhDUnxQ4s6L+CIwv+dX/aR7SeSnUApjvR0JhIxLPCPi+9+TgcL3y7hT71zRdk9yzLyXWH2KZJulmJ12SlsjsQBbmWeMSwg9HgrzxWAoIfkDkTWd8H66Q2dBF5g3SOCUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749926724; c=relaxed/simple;
	bh=ti1v1eJokOtaSNi63nkUAry4EUcZwuyiVDwIRy+jh4g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fu0Hdw28bqLexwsSmQMm/J7x+f11AJqTnSkb/vpNHSgxQ3zPWLeR29iyOnPEVkM55HrfKjWdBVjY87hVOZV6SErM2aqqYKD+hnXnJKPuoY4hhYBtgsckNC9VjfuJ6t5Xln+PqwOS5a72XzwPVmfQHaFGiNErFGIUCIxf2wOhods=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JDjNBpD7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JDjNBpD7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749926721; x=1781462721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ti1v1eJokOtaSNi63nkUAry4EUcZwuyiVDwIRy+jh4g=;
  b=JDjNBpD7lNJEh5T7LPowF3sjXdylDH713OVLKhGE7hzin+H9doUuXSXD
   K4JkA0X8GDhGTqumM7p3LaQthAK9yscShW4BBmvH1YeKHH498gpt5MBdr
   W2a+ZSES9rvPp+i8Mtu7mbiDT5RsQS61Ge5rI+qkZD41ukYJ2MyiMgLow
   IIdQgnAaKC73raYiUGpxYdR+veDIfsF+W0GIL8vd6lDxsnpPExcD6bTMW
   Tc3EexAWaa8fOPln1Bt5ScAHVYzQ07A/UZOK2MpGPUyB86duUHfDzai6I
   ILbRKNGE/bRlg4fDlSiOtK6AT21nMckJlzO2istcV1sP8POnkKVjbh+fI
   w==;
X-CSE-ConnectionGUID: UMzWSYaDQrq2Ulfxkew0RA==
X-CSE-MsgGUID: bpcWP5tVS7abZ2+ISO0aPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11464"; a="51988141"
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="51988141"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2025 11:45:21 -0700
X-CSE-ConnectionGUID: 0jvKQjkHSByZxqFGCQy2sQ==
X-CSE-MsgGUID: 8cJKP4pTQkKlQYbFaVFN1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,237,1744095600"; 
   d="scan'208";a="151921371"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 14 Jun 2025 11:45:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQVsT-000DmA-0O;
	Sat, 14 Jun 2025 18:45:17 +0000
Date: Sun, 15 Jun 2025 02:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 6/9] arm64: dts: freescale: add i.MX91 11x11 EVK basic
 support
Message-ID: <202506150254.cjUIPyJP-lkp@intel.com>
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
In-Reply-To: <20250613100255.2131800-7-joy.zou@nxp.com>
References: <20250613100255.2131800-7-joy.zou@nxp.com>
TO: Joy Zou <joy.zou@nxp.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: shawnguo@kernel.org
TO: s.hauer@pengutronix.de
TO: catalin.marinas@arm.com
TO: will@kernel.org
TO: andrew+netdev@lunn.ch
TO: davem@davemloft.net
TO: edumazet@google.com
TO: kuba@kernel.org
TO: pabeni@redhat.com
TO: mcoquelin.stm32@gmail.com
TO: alexandre.torgue@foss.st.com
TO: ulf.hansson@linaro.org
TO: richardcochran@gmail.com
TO: kernel@pengutronix.de
TO: festevam@gmail.com
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: netdev@vger.kernel.org
CC: linux-stm32@st-md-mailman.stormreply.com
CC: linux-pm@vger.kernel.org
CC: frank.li@nxp.com
CC: ye.li@nxp.com
CC: ping.bai@nxp.com
CC: peng.fan@nxp.com
CC: aisheng.dong@nxp.com

Hi Joy,

kernel test robot noticed the following build warnings:

[auto build test WARNING on shawnguo/for-next]
[also build test WARNING on robh/for-next arm64/for-next/core linus/master v6.16-rc1 next-20250613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joy-Zou/dt-bindings-arm-fsl-add-i-MX91-11x11-evk-board/20250613-181010
base:   https://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git for-next
patch link:    https://lore.kernel.org/r/20250613100255.2131800-7-joy.zou%40nxp.com
patch subject: [PATCH v5 6/9] arm64: dts: freescale: add i.MX91 11x11 EVK basic support
:::::: branch date: 33 hours ago
:::::: commit date: 33 hours ago
config: arm64-randconfig-004-20250614 (https://download.01.org/0day-ci/archive/20250615/202506150254.cjUIPyJP-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250615/202506150254.cjUIPyJP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506150254.cjUIPyJP-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts:337.10-348.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@50/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts:371.10-382.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@51/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +337 arch/arm64/boot/dts/freescale/imx91-11x11-evk.dts

95831af85acc236 Joy Zou 2025-06-13  310  
95831af85acc236 Joy Zou 2025-06-13  311  &lpi2c3 {
95831af85acc236 Joy Zou 2025-06-13  312  	#address-cells = <1>;
95831af85acc236 Joy Zou 2025-06-13  313  	#size-cells = <0>;
95831af85acc236 Joy Zou 2025-06-13  314  	clock-frequency = <400000>;
95831af85acc236 Joy Zou 2025-06-13  315  	pinctrl-0 = <&pinctrl_lpi2c3>;
95831af85acc236 Joy Zou 2025-06-13  316  	pinctrl-names = "default";
95831af85acc236 Joy Zou 2025-06-13  317  	status = "okay";
95831af85acc236 Joy Zou 2025-06-13  318  
95831af85acc236 Joy Zou 2025-06-13  319  	ptn5110: tcpc@50 {
95831af85acc236 Joy Zou 2025-06-13  320  		compatible = "nxp,ptn5110", "tcpci";
95831af85acc236 Joy Zou 2025-06-13  321  		reg = <0x50>;
95831af85acc236 Joy Zou 2025-06-13  322  		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
95831af85acc236 Joy Zou 2025-06-13  323  		interrupt-parent = <&gpio3>;
95831af85acc236 Joy Zou 2025-06-13  324  
95831af85acc236 Joy Zou 2025-06-13  325  		typec1_con: connector {
95831af85acc236 Joy Zou 2025-06-13  326  			compatible = "usb-c-connector";
95831af85acc236 Joy Zou 2025-06-13  327  			data-role = "dual";
95831af85acc236 Joy Zou 2025-06-13  328  			label = "USB-C";
95831af85acc236 Joy Zou 2025-06-13  329  			op-sink-microwatt = <15000000>;
95831af85acc236 Joy Zou 2025-06-13  330  			power-role = "dual";
95831af85acc236 Joy Zou 2025-06-13  331  			self-powered;
95831af85acc236 Joy Zou 2025-06-13  332  			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
95831af85acc236 Joy Zou 2025-06-13  333  				     PDO_VAR(5000, 20000, 3000)>;
95831af85acc236 Joy Zou 2025-06-13  334  			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
95831af85acc236 Joy Zou 2025-06-13  335  			try-power-role = "sink";
95831af85acc236 Joy Zou 2025-06-13  336  
95831af85acc236 Joy Zou 2025-06-13 @337  			ports {
95831af85acc236 Joy Zou 2025-06-13  338  				#address-cells = <1>;
95831af85acc236 Joy Zou 2025-06-13  339  				#size-cells = <0>;
95831af85acc236 Joy Zou 2025-06-13  340  
95831af85acc236 Joy Zou 2025-06-13  341  				port@0 {
95831af85acc236 Joy Zou 2025-06-13  342  					reg = <0>;
95831af85acc236 Joy Zou 2025-06-13  343  
95831af85acc236 Joy Zou 2025-06-13  344  					typec1_dr_sw: endpoint {
95831af85acc236 Joy Zou 2025-06-13  345  						remote-endpoint = <&usb1_drd_sw>;
95831af85acc236 Joy Zou 2025-06-13  346  					};
95831af85acc236 Joy Zou 2025-06-13  347  				};
95831af85acc236 Joy Zou 2025-06-13  348  			};
95831af85acc236 Joy Zou 2025-06-13  349  		};
95831af85acc236 Joy Zou 2025-06-13  350  	};
95831af85acc236 Joy Zou 2025-06-13  351  
95831af85acc236 Joy Zou 2025-06-13  352  	ptn5110_2: tcpc@51 {
95831af85acc236 Joy Zou 2025-06-13  353  		compatible = "nxp,ptn5110", "tcpci";
95831af85acc236 Joy Zou 2025-06-13  354  		reg = <0x51>;
95831af85acc236 Joy Zou 2025-06-13  355  		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
95831af85acc236 Joy Zou 2025-06-13  356  		interrupt-parent = <&gpio3>;
95831af85acc236 Joy Zou 2025-06-13  357  		status = "okay";
95831af85acc236 Joy Zou 2025-06-13  358  
95831af85acc236 Joy Zou 2025-06-13  359  		typec2_con: connector {
95831af85acc236 Joy Zou 2025-06-13  360  			compatible = "usb-c-connector";
95831af85acc236 Joy Zou 2025-06-13  361  			data-role = "dual";
95831af85acc236 Joy Zou 2025-06-13  362  			label = "USB-C";
95831af85acc236 Joy Zou 2025-06-13  363  			op-sink-microwatt = <15000000>;
95831af85acc236 Joy Zou 2025-06-13  364  			power-role = "dual";
95831af85acc236 Joy Zou 2025-06-13  365  			self-powered;
95831af85acc236 Joy Zou 2025-06-13  366  			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
95831af85acc236 Joy Zou 2025-06-13  367  				     PDO_VAR(5000, 20000, 3000)>;
95831af85acc236 Joy Zou 2025-06-13  368  			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
95831af85acc236 Joy Zou 2025-06-13  369  			try-power-role = "sink";
95831af85acc236 Joy Zou 2025-06-13  370  
95831af85acc236 Joy Zou 2025-06-13  371  			ports {
95831af85acc236 Joy Zou 2025-06-13  372  				#address-cells = <1>;
95831af85acc236 Joy Zou 2025-06-13  373  				#size-cells = <0>;
95831af85acc236 Joy Zou 2025-06-13  374  
95831af85acc236 Joy Zou 2025-06-13  375  				port@0 {
95831af85acc236 Joy Zou 2025-06-13  376  					reg = <0>;
95831af85acc236 Joy Zou 2025-06-13  377  
95831af85acc236 Joy Zou 2025-06-13  378  					typec2_dr_sw: endpoint {
95831af85acc236 Joy Zou 2025-06-13  379  						remote-endpoint = <&usb2_drd_sw>;
95831af85acc236 Joy Zou 2025-06-13  380  					};
95831af85acc236 Joy Zou 2025-06-13  381  				};
95831af85acc236 Joy Zou 2025-06-13  382  			};
95831af85acc236 Joy Zou 2025-06-13  383  		};
95831af85acc236 Joy Zou 2025-06-13  384  	};
95831af85acc236 Joy Zou 2025-06-13  385  
95831af85acc236 Joy Zou 2025-06-13  386  	pcf2131: rtc@53 {
95831af85acc236 Joy Zou 2025-06-13  387  		compatible = "nxp,pcf2131";
95831af85acc236 Joy Zou 2025-06-13  388  		reg = <0x53>;
95831af85acc236 Joy Zou 2025-06-13  389  		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
95831af85acc236 Joy Zou 2025-06-13  390  		interrupt-parent = <&pcal6524>;
95831af85acc236 Joy Zou 2025-06-13  391  		status = "okay";
95831af85acc236 Joy Zou 2025-06-13  392  	};
95831af85acc236 Joy Zou 2025-06-13  393  };
95831af85acc236 Joy Zou 2025-06-13  394  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
