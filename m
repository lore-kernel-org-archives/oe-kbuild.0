Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9FE9444
	for <oe-kbuild@lists.linux.dev>; Sat, 24 May 2025 16:40:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748104819; cv=none; b=SIDt3YRBNjXkR7CIEXV11hAIei08/0vdnOh+lPlhNGn0f5izpVVB9D2jIxTXEFdLdsxXfSEebRIhmHN/sI/wsUTlsr6NBUHZJWPJwewbSuXtRZJB+O3UZKPm/8milTC+a8oY2PDlhY7zDBJkXYU9UNeU1tnPkYWvoYFACuSzb8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748104819; c=relaxed/simple;
	bh=vYbwjoX8XESyP86XbvNvkMXp7zaNnlpcUZZ63tFocGU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WBTNHIJwpbm0Ehvo9VGY1ovdIxm56ZBuSD1yPGxTgGHzoMxhvckLGLjxNzze9/qmPo/XvxZBlYBmcfy7ULb/xq4QwsL9p4GDTaelb3eqBU4KeP1kHUxDPgykRQ5wsz3MexGyS7HA4uqKi/8/LlhHbdDPS4THFJtAW48TJC09wA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nEsZWC58; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nEsZWC58"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748104817; x=1779640817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vYbwjoX8XESyP86XbvNvkMXp7zaNnlpcUZZ63tFocGU=;
  b=nEsZWC58Oiv3vp/31oBJXeCAYbkwZwHyX11JEx95pE1VrsKNsXG1BMZm
   5ruv55NZuiMlEXnE/UlSIQDTBkEzkjciNHRbNrpTU+sF0zGgXKkMF+vse
   TP5m92Hp6wrDomlXVYEw/yAs1x6xYeTvDezLPGllAFH2rPfVDk9gjXWZN
   gGSBwD0oy8vyRZIBcQeDOAeBtRxH1Mn1wdQM84FAf50WMj3nBaSbiEmdX
   BUwXD2BDg2lCc87VF5iK8NDxH/XpQ+mqLlsGENGGXYWdxJ4mlP0/g4qLS
   Dx7UMHVHDsiUCjSPjdJKaDtKZxRaeEutNjUicD2MjiHNO8RDi3FeHEfnM
   w==;
X-CSE-ConnectionGUID: lzS7o89IQTGjmcRygzDUzQ==
X-CSE-MsgGUID: lYYyPJNxTDqyg6N4eN6mng==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="60389712"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="60389712"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 09:40:15 -0700
X-CSE-ConnectionGUID: F4B5OSpvSe+wwLDROpUeIw==
X-CSE-MsgGUID: I1wk1AMVQ/GpZPvcUew/6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="146792269"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 24 May 2025 09:40:14 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIruu-000RKG-0N;
	Sat, 24 May 2025 16:40:12 +0000
Date: Sun, 25 May 2025 00:39:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] ARM: dts: freescale: add support for NXP i.MX93 FRDM
Message-ID: <202505250007.tgAypZYt-lkp@intel.com>
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
In-Reply-To: <20250523-fpg-nxp-imx93-frdm-v1-1-546b2d342855@pengutronix.de>
References: <20250523-fpg-nxp-imx93-frdm-v1-1-546b2d342855@pengutronix.de>
TO: Fabian Pflug <f.pflug@pengutronix.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: imx@lists.linux.dev
CC: linux-arm-kernel@lists.infradead.org
CC: Fabian Pflug <f.pflug@pengutronix.de>

Hi Fabian,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 94305e83eccb3120c921cd3a015cd74731140bac]

url:    https://github.com/intel-lab-lkp/linux/commits/Fabian-Pflug/ARM-dts-freescale-add-support-for-NXP-i-MX93-FRDM/20250524-022013
base:   94305e83eccb3120c921cd3a015cd74731140bac
patch link:    https://lore.kernel.org/r/20250523-fpg-nxp-imx93-frdm-v1-1-546b2d342855%40pengutronix.de
patch subject: [PATCH 1/2] ARM: dts: freescale: add support for NXP i.MX93 FRDM
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20250525/202505250007.tgAypZYt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505250007.tgAypZYt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505250007.tgAypZYt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts:315.10-326.6: Warning (graph_child_address): /soc@0/bus@42000000/i2c@42530000/tcpc@50/connector/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +315 arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts

8c7b0c9739bdd4 Fabian Pflug 2025-05-23  288  
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  289  &lpi2c3 {
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  290  	#address-cells = <1>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  291  	#size-cells = <0>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  292  	clock-frequency = <400000>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  293  	pinctrl-names = "default";
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  294  	pinctrl-0 = <&pinctrl_lpi2c3>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  295  	status = "okay";
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  296  
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  297  	ptn5110: tcpc@50 {
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  298  		compatible = "nxp,ptn5110", "tcpci";
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  299  		reg = <0x50>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  300  		interrupt-parent = <&gpio3>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  301  		interrupts = <27 IRQ_TYPE_LEVEL_LOW>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  302  
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  303  		typec1_con: connector {
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  304  			compatible = "usb-c-connector";
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  305  			label = "USB-C";
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  306  			power-role = "dual";
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  307  			data-role = "dual";
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  308  			try-power-role = "sink";
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  309  			source-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  310  			sink-pdos = <PDO_FIXED(5000, 3000, PDO_FIXED_USB_COMM)
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  311  				     PDO_VAR(5000, 20000, 3000)>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  312  			op-sink-microwatt = <15000000>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  313  			self-powered;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  314  
8c7b0c9739bdd4 Fabian Pflug 2025-05-23 @315  			ports {
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  316  				#address-cells = <1>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  317  				#size-cells = <0>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  318  
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  319  				port@0 {
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  320  					reg = <0>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  321  
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  322  					typec1_dr_sw: endpoint {
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  323  						remote-endpoint = <&usb1_drd_sw>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  324  					};
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  325  				};
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  326  			};
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  327  		};
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  328  	};
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  329  
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  330  	pcf2131: rtc@53 {
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  331  		compatible = "nxp,pcf2131";
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  332  		reg = <0x53>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  333  		interrupt-parent = <&pcal6524>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  334  		interrupts = <1 IRQ_TYPE_EDGE_FALLING>;
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  335  	};
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  336  };
8c7b0c9739bdd4 Fabian Pflug 2025-05-23  337  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
