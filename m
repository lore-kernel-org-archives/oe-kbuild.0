Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CC8257D
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Aug 2024 07:54:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724486102; cv=none; b=jx2mm3R1L3YhEgF30bFgokoUeErMqOZi3JkW7mo82yyqEJFJr76/bQ2BNGS8mf4Necj82mSnDGD59vlTZmZJd6bdyXQ7T4hq3XjdLJcDmtSRObI40M43G8CeQ4KBPUCyC9F0xGtOMkXL+mBvzcHg6jMcp5Bh+zTABd5O9fYDkaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724486102; c=relaxed/simple;
	bh=U570m3c+6xaFdTu48YiVSjVhxF2FXTGRcm3tEk+Angw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f9Z+MtPbAG1sRs23ISOt2ab1n3gddPf//0XaCTVMBCA+h0q6gfRwLeoaIMZicD9IBLobPDf6yaWmDvG57pManjw4WFxigNY1ng6qn4SQjkg7iNfYJjeV06jR4b72z6u5ImnND8ZNA1ahdQrH3+xzYKwf6xM8cJQvj/W8yVQD2N8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hCRdi8Oi; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hCRdi8Oi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724486099; x=1756022099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U570m3c+6xaFdTu48YiVSjVhxF2FXTGRcm3tEk+Angw=;
  b=hCRdi8OibZfMsRGEftTt00HZ3BQOLHTyLXONBWGIOZj8mV12eBmpgdQF
   YIrsbFvDn3qJrdzyp1/5D6+Mp807rxsGety89jEsRL3Rmpm1YGIHXE9tz
   5PVfjmiESZkagMJRfvFJSvv1Ijdr+XaRklP7ARWk8UIVCvLQg7L02UN+Z
   ZuuuETXzzOAJ1ukDzNtzvLAuYB8AjBAkPJI9c5ZkpvGucKHQqXZXr+EmR
   YJhETN2idT2psyAVcrB9mdhjTFBEJyWebT1WFbWpVCv2soTFi2GSEQw6s
   +/xmBevI/UrKxijHEmIP3Y2IdUAwIi3r7hCdroFn3/FUvjIUAuFtZa9hl
   w==;
X-CSE-ConnectionGUID: RSqYcBlnRdKU8XdKMApo8w==
X-CSE-MsgGUID: wEWwNTkETrOJVKTXlx4new==
X-IronPort-AV: E=McAfee;i="6700,10204,11173"; a="26843212"
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="26843212"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2024 00:54:59 -0700
X-CSE-ConnectionGUID: ePAQO0x5Ra2AkiFv5Xl9TA==
X-CSE-MsgGUID: enjN6xDbQMmTx/1XkqhTWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,172,1719903600"; 
   d="scan'208";a="66966691"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Aug 2024 00:54:57 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shlbr-000ELL-06;
	Sat, 24 Aug 2024 07:54:55 +0000
Date: Sat, 24 Aug 2024 15:53:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [geert-renesas-devel:renesas-dts-for-v6.12 40/40]
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:169.9-178.5: Warning
 (graph_child_address): /soc/display@10890000/ports: graph node has single
 child node 'port@0', #address-cells/#size-cells are not necessary
Message-ID: <202408241539.4vBKV9F6-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-renesas-soc@vger.kernel.org
TO: Biju Das <biju.das.jz@bp.renesas.com>
CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v6.12
head:   e895a806608a1f95067d27ae3870c9b4c5a236ee
commit: e895a806608a1f95067d27ae3870c9b4c5a236ee [40/40] arm64: dts: renesas: r9a07g043u: Add DU node
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: arm64-randconfig-001-20240824 (https://download.01.org/0day-ci/archive/20240824/202408241539.4vBKV9F6-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 08e5a1de8227512d4774a534b91cb2353cef6284)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240824/202408241539.4vBKV9F6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408241539.4vBKV9F6-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:84.11-93.6: Warning (graph_child_address): /soc/video@10830000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:119.11-128.6: Warning (graph_child_address): /soc/csi2@10830400/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/renesas/r9a07g043u.dtsi:169.9-178.5: Warning (graph_child_address): /soc/display@10890000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +169 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi

b9a0be20549640 Lad Prabhakar 2022-10-25   59  
b9a0be20549640 Lad Prabhakar 2022-10-25   60  &soc {
b9a0be20549640 Lad Prabhakar 2022-10-25   61  	interrupt-parent = <&gic>;
b9a0be20549640 Lad Prabhakar 2022-10-25   62  
971c17f879352a Biju Das      2024-01-26   63  	cru: video@10830000 {
971c17f879352a Biju Das      2024-01-26   64  		compatible = "renesas,r9a07g043-cru", "renesas,rzg2l-cru";
971c17f879352a Biju Das      2024-01-26   65  		reg = <0 0x10830000 0 0x400>;
971c17f879352a Biju Das      2024-01-26   66  		clocks = <&cpg CPG_MOD R9A07G043_CRU_VCLK>,
971c17f879352a Biju Das      2024-01-26   67  			 <&cpg CPG_MOD R9A07G043_CRU_PCLK>,
971c17f879352a Biju Das      2024-01-26   68  			 <&cpg CPG_MOD R9A07G043_CRU_ACLK>;
971c17f879352a Biju Das      2024-01-26   69  		clock-names = "video", "apb", "axi";
971c17f879352a Biju Das      2024-01-26   70  		interrupts = <SOC_PERIPHERAL_IRQ(167) IRQ_TYPE_LEVEL_HIGH>,
971c17f879352a Biju Das      2024-01-26   71  			     <SOC_PERIPHERAL_IRQ(168) IRQ_TYPE_LEVEL_HIGH>,
971c17f879352a Biju Das      2024-01-26   72  			     <SOC_PERIPHERAL_IRQ(169) IRQ_TYPE_LEVEL_HIGH>;
971c17f879352a Biju Das      2024-01-26   73  		interrupt-names = "image_conv", "image_conv_err", "axi_mst_err";
971c17f879352a Biju Das      2024-01-26   74  		resets = <&cpg R9A07G043_CRU_PRESETN>,
971c17f879352a Biju Das      2024-01-26   75  			 <&cpg R9A07G043_CRU_ARESETN>;
971c17f879352a Biju Das      2024-01-26   76  		reset-names = "presetn", "aresetn";
971c17f879352a Biju Das      2024-01-26   77  		power-domains = <&cpg>;
971c17f879352a Biju Das      2024-01-26   78  		status = "disabled";
971c17f879352a Biju Das      2024-01-26   79  
971c17f879352a Biju Das      2024-01-26   80  		ports {
971c17f879352a Biju Das      2024-01-26   81  			#address-cells = <1>;
971c17f879352a Biju Das      2024-01-26   82  			#size-cells = <0>;
971c17f879352a Biju Das      2024-01-26   83  
971c17f879352a Biju Das      2024-01-26   84  			port@1 {
971c17f879352a Biju Das      2024-01-26   85  				#address-cells = <1>;
971c17f879352a Biju Das      2024-01-26   86  				#size-cells = <0>;
971c17f879352a Biju Das      2024-01-26   87  
971c17f879352a Biju Das      2024-01-26   88  				reg = <1>;
971c17f879352a Biju Das      2024-01-26   89  				crucsi2: endpoint@0 {
971c17f879352a Biju Das      2024-01-26   90  					reg = <0>;
971c17f879352a Biju Das      2024-01-26   91  					remote-endpoint = <&csi2cru>;
971c17f879352a Biju Das      2024-01-26   92  				};
971c17f879352a Biju Das      2024-01-26   93  			};
971c17f879352a Biju Das      2024-01-26   94  		};
971c17f879352a Biju Das      2024-01-26   95  	};
971c17f879352a Biju Das      2024-01-26   96  
971c17f879352a Biju Das      2024-01-26   97  	csi2: csi2@10830400 {
971c17f879352a Biju Das      2024-01-26   98  		compatible = "renesas,r9a07g043-csi2", "renesas,rzg2l-csi2";
971c17f879352a Biju Das      2024-01-26   99  		reg = <0 0x10830400 0 0xfc00>;
971c17f879352a Biju Das      2024-01-26  100  		interrupts = <SOC_PERIPHERAL_IRQ(166) IRQ_TYPE_LEVEL_HIGH>;
971c17f879352a Biju Das      2024-01-26  101  		clocks = <&cpg CPG_MOD R9A07G043_CRU_SYSCLK>,
971c17f879352a Biju Das      2024-01-26  102  			 <&cpg CPG_MOD R9A07G043_CRU_VCLK>,
971c17f879352a Biju Das      2024-01-26  103  			 <&cpg CPG_MOD R9A07G043_CRU_PCLK>;
971c17f879352a Biju Das      2024-01-26  104  		clock-names = "system", "video", "apb";
971c17f879352a Biju Das      2024-01-26  105  		resets = <&cpg R9A07G043_CRU_PRESETN>,
971c17f879352a Biju Das      2024-01-26  106  			 <&cpg R9A07G043_CRU_CMN_RSTB>;
971c17f879352a Biju Das      2024-01-26  107  		reset-names = "presetn", "cmn-rstb";
971c17f879352a Biju Das      2024-01-26  108  		power-domains = <&cpg>;
971c17f879352a Biju Das      2024-01-26  109  		status = "disabled";
971c17f879352a Biju Das      2024-01-26  110  
971c17f879352a Biju Das      2024-01-26  111  		ports {
971c17f879352a Biju Das      2024-01-26  112  			#address-cells = <1>;
971c17f879352a Biju Das      2024-01-26  113  			#size-cells = <0>;
971c17f879352a Biju Das      2024-01-26  114  
971c17f879352a Biju Das      2024-01-26  115  			port@0 {
971c17f879352a Biju Das      2024-01-26  116  				reg = <0>;
971c17f879352a Biju Das      2024-01-26  117  			};
971c17f879352a Biju Das      2024-01-26  118  
971c17f879352a Biju Das      2024-01-26  119  			port@1 {
971c17f879352a Biju Das      2024-01-26  120  				#address-cells = <1>;
971c17f879352a Biju Das      2024-01-26  121  				#size-cells = <0>;
971c17f879352a Biju Das      2024-01-26  122  				reg = <1>;
971c17f879352a Biju Das      2024-01-26  123  
971c17f879352a Biju Das      2024-01-26  124  				csi2cru: endpoint@0 {
971c17f879352a Biju Das      2024-01-26  125  					reg = <0>;
971c17f879352a Biju Das      2024-01-26  126  					remote-endpoint = <&crucsi2>;
971c17f879352a Biju Das      2024-01-26  127  				};
971c17f879352a Biju Das      2024-01-26  128  			};
971c17f879352a Biju Das      2024-01-26  129  		};
971c17f879352a Biju Das      2024-01-26  130  	};
971c17f879352a Biju Das      2024-01-26  131  
6bfd974d03a433 Biju Das      2024-08-05  132  	vspd: vsp@10870000 {
6bfd974d03a433 Biju Das      2024-08-05  133  		compatible = "renesas,r9a07g043u-vsp2", "renesas,r9a07g044-vsp2";
6bfd974d03a433 Biju Das      2024-08-05  134  		reg = <0 0x10870000 0 0x10000>;
6bfd974d03a433 Biju Das      2024-08-05  135  		interrupts = <SOC_PERIPHERAL_IRQ(149) IRQ_TYPE_LEVEL_HIGH>;
6bfd974d03a433 Biju Das      2024-08-05  136  		clocks = <&cpg CPG_MOD R9A07G043_LCDC_CLK_A>,
6bfd974d03a433 Biju Das      2024-08-05  137  			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_P>,
6bfd974d03a433 Biju Das      2024-08-05  138  			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_D>;
6bfd974d03a433 Biju Das      2024-08-05  139  		clock-names = "aclk", "pclk", "vclk";
6bfd974d03a433 Biju Das      2024-08-05  140  		power-domains = <&cpg>;
6bfd974d03a433 Biju Das      2024-08-05  141  		resets = <&cpg R9A07G043_LCDC_RESET_N>;
6bfd974d03a433 Biju Das      2024-08-05  142  		renesas,fcp = <&fcpvd>;
6bfd974d03a433 Biju Das      2024-08-05  143  	};
6bfd974d03a433 Biju Das      2024-08-05  144  
a94a244a5b1a20 Biju Das      2024-08-05  145  	fcpvd: fcp@10880000 {
a94a244a5b1a20 Biju Das      2024-08-05  146  		compatible = "renesas,r9a07g043u-fcpvd", "renesas,fcpv";
a94a244a5b1a20 Biju Das      2024-08-05  147  		reg = <0 0x10880000 0 0x10000>;
a94a244a5b1a20 Biju Das      2024-08-05  148  		clocks = <&cpg CPG_MOD R9A07G043_LCDC_CLK_A>,
a94a244a5b1a20 Biju Das      2024-08-05  149  			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_P>,
a94a244a5b1a20 Biju Das      2024-08-05  150  			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_D>;
a94a244a5b1a20 Biju Das      2024-08-05  151  		clock-names = "aclk", "pclk", "vclk";
a94a244a5b1a20 Biju Das      2024-08-05  152  		power-domains = <&cpg>;
a94a244a5b1a20 Biju Das      2024-08-05  153  		resets = <&cpg R9A07G043_LCDC_RESET_N>;
a94a244a5b1a20 Biju Das      2024-08-05  154  	};
a94a244a5b1a20 Biju Das      2024-08-05  155  
e895a806608a1f Biju Das      2024-08-22  156  	du: display@10890000 {
e895a806608a1f Biju Das      2024-08-22  157  		compatible = "renesas,r9a07g043u-du";
e895a806608a1f Biju Das      2024-08-22  158  		reg = <0 0x10890000 0 0x10000>;
e895a806608a1f Biju Das      2024-08-22  159  		interrupts = <SOC_PERIPHERAL_IRQ(152) IRQ_TYPE_LEVEL_HIGH>;
e895a806608a1f Biju Das      2024-08-22  160  		clocks = <&cpg CPG_MOD R9A07G043_LCDC_CLK_A>,
e895a806608a1f Biju Das      2024-08-22  161  			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_P>,
e895a806608a1f Biju Das      2024-08-22  162  			 <&cpg CPG_MOD R9A07G043_LCDC_CLK_D>;
e895a806608a1f Biju Das      2024-08-22  163  		clock-names = "aclk", "pclk", "vclk";
e895a806608a1f Biju Das      2024-08-22  164  		power-domains = <&cpg>;
e895a806608a1f Biju Das      2024-08-22  165  		resets = <&cpg R9A07G043_LCDC_RESET_N>;
e895a806608a1f Biju Das      2024-08-22  166  		renesas,vsps = <&vspd 0>;
e895a806608a1f Biju Das      2024-08-22  167  		status = "disabled";
e895a806608a1f Biju Das      2024-08-22  168  
e895a806608a1f Biju Das      2024-08-22 @169  		ports {
e895a806608a1f Biju Das      2024-08-22  170  			#address-cells = <1>;
e895a806608a1f Biju Das      2024-08-22  171  			#size-cells = <0>;
e895a806608a1f Biju Das      2024-08-22  172  
e895a806608a1f Biju Das      2024-08-22  173  			port@0 {
e895a806608a1f Biju Das      2024-08-22  174  				reg = <0>;
e895a806608a1f Biju Das      2024-08-22  175  				du_out_rgb: endpoint {
e895a806608a1f Biju Das      2024-08-22  176  				};
e895a806608a1f Biju Das      2024-08-22  177  			};
e895a806608a1f Biju Das      2024-08-22  178  		};
e895a806608a1f Biju Das      2024-08-22  179  	};
e895a806608a1f Biju Das      2024-08-22  180  
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  181  	irqc: interrupt-controller@110a0000 {
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  182  		compatible = "renesas,r9a07g043u-irqc",
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  183  			     "renesas,rzg2l-irqc";
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  184  		reg = <0 0x110a0000 0 0x10000>;
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  185  		#interrupt-cells = <2>;
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  186  		#address-cells = <0>;
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  187  		interrupt-controller;
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  188  		interrupts = <SOC_PERIPHERAL_IRQ(0) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  189  			     <SOC_PERIPHERAL_IRQ(1) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  190  			     <SOC_PERIPHERAL_IRQ(2) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  191  			     <SOC_PERIPHERAL_IRQ(3) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  192  			     <SOC_PERIPHERAL_IRQ(4) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  193  			     <SOC_PERIPHERAL_IRQ(5) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  194  			     <SOC_PERIPHERAL_IRQ(6) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  195  			     <SOC_PERIPHERAL_IRQ(7) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  196  			     <SOC_PERIPHERAL_IRQ(8) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  197  			     <SOC_PERIPHERAL_IRQ(444) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  198  			     <SOC_PERIPHERAL_IRQ(445) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  199  			     <SOC_PERIPHERAL_IRQ(446) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  200  			     <SOC_PERIPHERAL_IRQ(447) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  201  			     <SOC_PERIPHERAL_IRQ(448) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  202  			     <SOC_PERIPHERAL_IRQ(449) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  203  			     <SOC_PERIPHERAL_IRQ(450) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  204  			     <SOC_PERIPHERAL_IRQ(451) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  205  			     <SOC_PERIPHERAL_IRQ(452) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  206  			     <SOC_PERIPHERAL_IRQ(453) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  207  			     <SOC_PERIPHERAL_IRQ(454) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  208  			     <SOC_PERIPHERAL_IRQ(455) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  209  			     <SOC_PERIPHERAL_IRQ(456) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  210  			     <SOC_PERIPHERAL_IRQ(457) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  211  			     <SOC_PERIPHERAL_IRQ(458) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  212  			     <SOC_PERIPHERAL_IRQ(459) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  213  			     <SOC_PERIPHERAL_IRQ(460) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  214  			     <SOC_PERIPHERAL_IRQ(461) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  215  			     <SOC_PERIPHERAL_IRQ(462) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  216  			     <SOC_PERIPHERAL_IRQ(463) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  217  			     <SOC_PERIPHERAL_IRQ(464) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  218  			     <SOC_PERIPHERAL_IRQ(465) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  219  			     <SOC_PERIPHERAL_IRQ(466) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  220  			     <SOC_PERIPHERAL_IRQ(467) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  221  			     <SOC_PERIPHERAL_IRQ(468) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  222  			     <SOC_PERIPHERAL_IRQ(469) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  223  			     <SOC_PERIPHERAL_IRQ(470) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  224  			     <SOC_PERIPHERAL_IRQ(471) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  225  			     <SOC_PERIPHERAL_IRQ(472) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  226  			     <SOC_PERIPHERAL_IRQ(473) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  227  			     <SOC_PERIPHERAL_IRQ(474) IRQ_TYPE_LEVEL_HIGH>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  228  			     <SOC_PERIPHERAL_IRQ(475) IRQ_TYPE_LEVEL_HIGH>,
14fe225dd5fcd5 Lad Prabhakar 2024-02-05  229  			     <SOC_PERIPHERAL_IRQ(25) IRQ_TYPE_EDGE_RISING>,
14fe225dd5fcd5 Lad Prabhakar 2024-02-05  230  			     <SOC_PERIPHERAL_IRQ(34) IRQ_TYPE_EDGE_RISING>,
14fe225dd5fcd5 Lad Prabhakar 2024-02-05  231  			     <SOC_PERIPHERAL_IRQ(35) IRQ_TYPE_EDGE_RISING>,
14fe225dd5fcd5 Lad Prabhakar 2024-02-05  232  			     <SOC_PERIPHERAL_IRQ(36) IRQ_TYPE_EDGE_RISING>,
14fe225dd5fcd5 Lad Prabhakar 2024-02-05  233  			     <SOC_PERIPHERAL_IRQ(37) IRQ_TYPE_EDGE_RISING>,
14fe225dd5fcd5 Lad Prabhakar 2024-02-05  234  			     <SOC_PERIPHERAL_IRQ(38) IRQ_TYPE_EDGE_RISING>,
14fe225dd5fcd5 Lad Prabhakar 2024-02-05  235  			     <SOC_PERIPHERAL_IRQ(39) IRQ_TYPE_EDGE_RISING>;
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  236  		interrupt-names = "nmi",
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  237  				  "irq0", "irq1", "irq2", "irq3",
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  238  				  "irq4", "irq5", "irq6", "irq7",
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  239  				  "tint0", "tint1", "tint2", "tint3",
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  240  				  "tint4", "tint5", "tint6", "tint7",
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  241  				  "tint8", "tint9", "tint10", "tint11",
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  242  				  "tint12", "tint13", "tint14", "tint15",
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  243  				  "tint16", "tint17", "tint18", "tint19",
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  244  				  "tint20", "tint21", "tint22", "tint23",
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  245  				  "tint24", "tint25", "tint26", "tint27",
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  246  				  "tint28", "tint29", "tint30", "tint31",
14fe225dd5fcd5 Lad Prabhakar 2024-02-05  247  				  "bus-err", "ec7tie1-0", "ec7tie2-0",
14fe225dd5fcd5 Lad Prabhakar 2024-02-05  248  				  "ec7tiovf-0", "ec7tie1-1", "ec7tie2-1",
14fe225dd5fcd5 Lad Prabhakar 2024-02-05  249  				  "ec7tiovf-1";
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  250  		clocks = <&cpg CPG_MOD R9A07G043_IA55_CLK>,
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  251  			<&cpg CPG_MOD R9A07G043_IA55_PCLK>;
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  252  		clock-names = "clk", "pclk";
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  253  		power-domains = <&cpg>;
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  254  		resets = <&cpg R9A07G043_IA55_RESETN>;
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  255  	};
48ab6eddd8bbcf Lad Prabhakar 2023-01-02  256  
b9a0be20549640 Lad Prabhakar 2022-10-25  257  	gic: interrupt-controller@11900000 {
b9a0be20549640 Lad Prabhakar 2022-10-25  258  		compatible = "arm,gic-v3";
b9a0be20549640 Lad Prabhakar 2022-10-25  259  		#interrupt-cells = <3>;
b9a0be20549640 Lad Prabhakar 2022-10-25  260  		#address-cells = <0>;
b9a0be20549640 Lad Prabhakar 2022-10-25  261  		interrupt-controller;
ab39547f739236 Lad Prabhakar 2024-07-30  262  		reg = <0x0 0x11900000 0 0x20000>,
ab39547f739236 Lad Prabhakar 2024-07-30  263  		      <0x0 0x11940000 0 0x40000>;
b9a0be20549640 Lad Prabhakar 2022-10-25  264  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
b9a0be20549640 Lad Prabhakar 2022-10-25  265  	};
b9a0be20549640 Lad Prabhakar 2022-10-25  266  };
b9a0be20549640 Lad Prabhakar 2022-10-25  267  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
