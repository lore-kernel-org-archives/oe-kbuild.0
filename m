Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA1B61A2391
	for <oe-kbuild@lists.linux.dev>; Fri, 17 Jan 2025 20:59:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737147580; cv=none; b=Sr7kxI3lwzwLXl4SeK7rPdwNCaAR5IlBR8hGcTEfMJpr3+JQ0tHCiCRObp7yDM16Sz0MRMtSBpng0tblScdgRLJzSwWdJ/ed1DlDcEliYcJy+3e5ef7pG9HkjJteTuqlMpGiVDV4BNZbw24ZJSI2HjVpm3ANy6Ld3A4RPdmymQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737147580; c=relaxed/simple;
	bh=MVuOIOmoVzhDMDQvaaWEjvGZWKb81/9aWghiRXChcBk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sHJAJ9Gqm8Y/+Jo/ShimqH2qRMorNEQTp1RHPBv4VBn780zKFMiNdWRRw/6ohypoXmFcQ4CrUZvrprQAsWUc4pdsMJ1UAsDA/vdUFI0eTGxto/DeoJhbWE7Knl973+VAWbFg+YS/pse6K3HU5lFwlVmNPYFWAeR5AK15pfeBPHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OzvHqN4D; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OzvHqN4D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737147578; x=1768683578;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MVuOIOmoVzhDMDQvaaWEjvGZWKb81/9aWghiRXChcBk=;
  b=OzvHqN4DEgc/tt24/+j1bHrUNoMzCQxl5or1FYhJHzmWJyQFqRfs9e/S
   Iimnv+8QV2nXTRkdMc0ZpnXRpZHaIn02hE16+XnzrcCzW8emIadLsfJMC
   9++xrwQVLrVSJFNaMjlmWWmF4FRNPfvzEc8sBjAVoWBJDyfAe+jFymDRM
   zeKmcxaj6jfWyEDO6YT4qh6BaFsniEmQo83JrDvFrdDfU3Z+OgP10NLOW
   nV7ugwBzsfUYELMYK2tGjqxeRerM0N5Ihqf/RkSIJ0fdzqxkJ7aI5tpUN
   XCSU2OSfbj12bZ2pGX9wF0fS3UTrNxjBpQRzYQrKza6XYKZWktKft9fzC
   g==;
X-CSE-ConnectionGUID: FzuXEoIiSXGF0JQbiwAH0A==
X-CSE-MsgGUID: sqd/qpXbSfGf6mR8esCNnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11318"; a="25189352"
X-IronPort-AV: E=Sophos;i="6.13,213,1732608000"; 
   d="scan'208";a="25189352"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2025 12:59:35 -0800
X-CSE-ConnectionGUID: EyFKe741QeKxnDwp/2W5+w==
X-CSE-MsgGUID: iAIR+HUQRkCRjkjLQesZIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="136795191"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jan 2025 12:59:33 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYtRD-000ThQ-0L;
	Fri, 17 Jan 2025 20:59:31 +0000
Date: Sat, 18 Jan 2025 04:59:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [wens:mtk-wip 32/48]
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:264.22-272.5: Warning
 (graph_child_address): /soc/dsi@14014000/ports/port: graph node has single
 child node 'endpoint@0', #address-cells/#size-cells are not necessary
Message-ID: <202501180455.jxTWO2LN-lkp@intel.com>
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
TO: "Chen-Yu Tsai" <wenst@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/wens/linux.git mtk-wip
head:   a2f8143f6e1e6b3d8dac24f675646fbfdfc03202
commit: 0af51b30f86abe42aae0c8598b5286c8ebf44faf [32/48] arm64: dts: mediatek: mt8183-kukui: Merge Krane device trees
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-002-20250117 (https://download.01.org/0day-ci/archive/20250118/202501180455.jxTWO2LN-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250118/202501180455.jxTWO2LN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501180455.jxTWO2LN-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8183.dtsi:1826.22-1839.5: Warning (avoid_unnecessary_addr_size): /soc/dsi@14014000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:264.22-272.5: Warning (graph_child_address): /soc/dsi@14014000/ports/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:264.22-272.5: Warning (graph_child_address): /soc/dsi@14014000/ports/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
--
>> arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi:245.17-261.4: Warning (unique_unit_address_if_enabled): /soc/dsi@14014000/panel@0: duplicate unit-address (also used in node /soc/dsi@14014000/panel2@0)

vim +264 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi

cd894e274b74b3 Enric Balletbo i Serra 2020-06-25  240  
27eaf34df36419 Hsin-Yi Wang           2021-01-13  241  &dsi0 {
27eaf34df36419 Hsin-Yi Wang           2021-01-13  242  	status = "okay";
27eaf34df36419 Hsin-Yi Wang           2021-01-13  243  	#address-cells = <1>;
27eaf34df36419 Hsin-Yi Wang           2021-01-13  244  	#size-cells = <0>;
27eaf34df36419 Hsin-Yi Wang           2021-01-13 @245  	panel: panel@0 {
27eaf34df36419 Hsin-Yi Wang           2021-01-13  246  		/* compatible will be set in board dts */
27eaf34df36419 Hsin-Yi Wang           2021-01-13  247  		reg = <0>;
27eaf34df36419 Hsin-Yi Wang           2021-01-13  248  		enable-gpios = <&pio 45 0>;
27eaf34df36419 Hsin-Yi Wang           2021-01-13  249  		pinctrl-names = "default";
27eaf34df36419 Hsin-Yi Wang           2021-01-13  250  		pinctrl-0 = <&panel_pins_default>;
27eaf34df36419 Hsin-Yi Wang           2021-01-13  251  		avdd-supply = <&ppvarn_lcd>;
27eaf34df36419 Hsin-Yi Wang           2021-01-13  252  		avee-supply = <&ppvarp_lcd>;
27eaf34df36419 Hsin-Yi Wang           2021-01-13  253  		pp1800-supply = <&pp1800_lcd>;
27eaf34df36419 Hsin-Yi Wang           2021-01-13  254  		backlight = <&backlight_lcd0>;
9c61051561b02d Hsin-Yi Wang           2022-05-30  255  		rotation = <270>;
27eaf34df36419 Hsin-Yi Wang           2021-01-13  256  		port {
27eaf34df36419 Hsin-Yi Wang           2021-01-13  257  			panel_in: endpoint {
27eaf34df36419 Hsin-Yi Wang           2021-01-13  258  				remote-endpoint = <&dsi_out>;
27eaf34df36419 Hsin-Yi Wang           2021-01-13  259  			};
27eaf34df36419 Hsin-Yi Wang           2021-01-13  260  		};
27eaf34df36419 Hsin-Yi Wang           2021-01-13  261  	};
27eaf34df36419 Hsin-Yi Wang           2021-01-13  262  
27eaf34df36419 Hsin-Yi Wang           2021-01-13  263  	ports {
0af51b30f86abe Chen-Yu Tsai           2023-11-07 @264  		dsi_out_port: port {
0af51b30f86abe Chen-Yu Tsai           2023-11-07  265  			#address-cells = <1>;
0af51b30f86abe Chen-Yu Tsai           2023-11-07  266  			#size-cells = <0>;
0af51b30f86abe Chen-Yu Tsai           2023-11-07  267  
0af51b30f86abe Chen-Yu Tsai           2023-11-07  268  			dsi_out: endpoint@0 {
0af51b30f86abe Chen-Yu Tsai           2023-11-07  269  				reg = <0>;
27eaf34df36419 Hsin-Yi Wang           2021-01-13  270  				remote-endpoint = <&panel_in>;
27eaf34df36419 Hsin-Yi Wang           2021-01-13  271  			};
27eaf34df36419 Hsin-Yi Wang           2021-01-13  272  		};
27eaf34df36419 Hsin-Yi Wang           2021-01-13  273  	};
27eaf34df36419 Hsin-Yi Wang           2021-01-13  274  };
27eaf34df36419 Hsin-Yi Wang           2021-01-13  275  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
