Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 334951F8F08
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jan 2025 22:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736461360; cv=none; b=n6mHFmMZt3sFisk/Ros1aHjAdiTckVIWQ9ZdPR7e4N8NRInT9L0HZtx3eK4MLLTka09NFM12uxE0MBdLGKQN0lr+KYGZMO6eBfBAy2hw6biJVXeQR6Hy56itOxn9SitwIZfCStxxLZWCERW0gG2Ki7eUQFCaeyC7aGqS/NWALCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736461360; c=relaxed/simple;
	bh=l4sC1dvvphhkx2X9hkSxM26AhQIhs76A6xtm0Nt93vE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T3uYJUY5JIevYSZmpm4/TwCrdKQpiknhYdfAp9S/IfKfIc5AlAxnPU482cTD0d590vm/lle5cyjgpcvFE0FIdtfDtUFKWGO7TuGYBctRmWuXg+aZWnB4dYKZGWm0XwKOQHCViykRkKshLtjCYhBW+9BBVozyrqRmrgn5M3ImDNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P+j2MH/9; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P+j2MH/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736461357; x=1767997357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l4sC1dvvphhkx2X9hkSxM26AhQIhs76A6xtm0Nt93vE=;
  b=P+j2MH/9fd1wYE/tsFewg606LU0tU6gO4In3kPiDKiteUQrhYI8/O/Of
   O6tvZJtwbonwwXQt72biqG7ALz0IfMo3GctorOcZC/Pp85d7SGeBq7Oiu
   kxf1+ttE995wLhpi9hl1qG6xz5gBSMB9IVohTayhCbp+stnFTUVyB5DPD
   Qzzf9qF3VRXPy0JDjI+AecU1EIY8e0Oon1AblHfaYdQRShkLZHHZagQvb
   s+4GDjwNrTSoQ1Qc9mAg6txjgcW8+myWllPU+YwUMlKro+R1O3hjcQGhY
   46Bh+OAXEYM17HGvy+PanwcjLu4UX6LUq5K+Lw3+zfkBzSwltyr4ahTQF
   Q==;
X-CSE-ConnectionGUID: WaTkpvC2RSKG0ly0E/Grdw==
X-CSE-MsgGUID: 6xvAPUhFQL6PmcFC8u/0xg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36768587"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36768587"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 14:22:31 -0800
X-CSE-ConnectionGUID: jgl84MnXSLOTyffBfyc9Fw==
X-CSE-MsgGUID: kYmupN9ETXSgUhl5rpgMNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="108162174"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Jan 2025 14:22:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW0v5-000ICZ-2d;
	Thu, 09 Jan 2025 22:22:27 +0000
Date: Fri, 10 Jan 2025 06:21:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 7/7] arm64: dts: mediatek: add display support for
 mt8365-evk
Message-ID: <202501100653.AZraYf4f-lkp@intel.com>
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
In-Reply-To: <20231023-display-support-v5-7-3905f1e4b835@baylibre.com>
References: <20231023-display-support-v5-7-3905f1e4b835@baylibre.com>
TO: Alexandre Mergnat <amergnat@baylibre.com>
TO: "Chun-Kuang Hu" <chunkuang.hu@kernel.org>
TO: Philipp Zabel <p.zabel@pengutronix.de>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: David Airlie <airlied@gmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Jitao Shi <jitao.shi@mediatek.com>
TO: CK Hu <ck.hu@mediatek.com>
TO: Catalin Marinas <catalin.marinas@arm.com>
TO: Will Deacon <will@kernel.org>
TO: Simona Vetter <simona@ffwll.ch>
CC: dri-devel@lists.freedesktop.org
CC: linux-mediatek@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: Alexandre Mergnat <amergnat@baylibre.com>

Hi Alexandre,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9d89551994a430b50c4fffcb1e617a057fa76e20]

url:    https://github.com/intel-lab-lkp/linux/commits/amergnat-baylibre-com/dt-bindings-display-mediatek-dpi-add-power-domains-property/20250109-002152
base:   9d89551994a430b50c4fffcb1e617a057fa76e20
patch link:    https://lore.kernel.org/r/20231023-display-support-v5-7-3905f1e4b835%40baylibre.com
patch subject: [PATCH v5 7/7] arm64: dts: mediatek: add display support for mt8365-evk
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: arm64-randconfig-001-20250109 (https://download.01.org/0day-ci/archive/20250110/202501100653.AZraYf4f-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100653.AZraYf4f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501100653.AZraYf4f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dts:297.11-306.6: Warning (graph_child_address): /soc/i2c@11008000/hdmi@4c/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:308.11-316.6: Warning (graph_child_address): /soc/i2c@11008000/hdmi@4c/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:822.12-830.7: Warning (graph_child_address): /soc/ovl@1400b000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:832.12-840.7: Warning (graph_child_address): /soc/ovl@1400b000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:856.12-864.7: Warning (graph_child_address): /soc/rdma@1400d000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:866.12-874.7: Warning (graph_child_address): /soc/rdma@1400d000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:888.12-896.7: Warning (graph_child_address): /soc/color@1400f000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:898.12-906.7: Warning (graph_child_address): /soc/color@1400f000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:920.12-928.7: Warning (graph_child_address): /soc/ccorr@14010000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:930.12-938.7: Warning (graph_child_address): /soc/ccorr@14010000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:952.12-960.7: Warning (graph_child_address): /soc/aal@14011000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:962.12-970.7: Warning (graph_child_address): /soc/aal@14011000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:984.12-992.7: Warning (graph_child_address): /soc/gamma@14012000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:994.12-1002.7: Warning (graph_child_address): /soc/gamma@14012000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1016.12-1024.7: Warning (graph_child_address): /soc/dither@14013000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365.dtsi:1026.12-1033.7: Warning (graph_child_address): /soc/dither@14013000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dts:206.8-213.5: Warning (graph_child_address): /soc/dsi@14014000/panel@0/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dts:219.10-227.5: Warning (graph_child_address): /soc/dsi@14014000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8365-evk.dts:229.10-237.5: Warning (graph_child_address): /soc/dsi@14014000/ports/port@1: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/mediatek/mt8365-evk.dts:35.8-42.5: Warning (graph_child_address): /connector/port: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary

vim +297 arch/arm64/boot/dts/mediatek/mt8365-evk.dts

1a61d17219e027 Alexandre Mergnat 2025-01-08  192  
1a61d17219e027 Alexandre Mergnat 2025-01-08  193  &dsi0 {
1a61d17219e027 Alexandre Mergnat 2025-01-08  194  	#address-cells = <1>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  195  	#size-cells = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  196  	status = "okay";
1a61d17219e027 Alexandre Mergnat 2025-01-08  197  
1a61d17219e027 Alexandre Mergnat 2025-01-08  198  	panel@0 {
1a61d17219e027 Alexandre Mergnat 2025-01-08  199  		compatible = "startek,kd070fhfid015";
1a61d17219e027 Alexandre Mergnat 2025-01-08  200  		reg = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  201  		enable-gpios = <&pio 67 GPIO_ACTIVE_HIGH>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  202  		reset-gpios = <&pio 20 GPIO_ACTIVE_HIGH>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  203  		iovcc-supply = <&mt6357_vsim1_reg>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  204  		power-supply = <&vsys_lcm_reg>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  205  
1a61d17219e027 Alexandre Mergnat 2025-01-08 @206  		port {
1a61d17219e027 Alexandre Mergnat 2025-01-08  207  			#address-cells = <1>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  208  			#size-cells = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  209  			panel_in: endpoint@0 {
1a61d17219e027 Alexandre Mergnat 2025-01-08  210  				reg = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  211  				remote-endpoint = <&dsi0_out>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  212  			};
1a61d17219e027 Alexandre Mergnat 2025-01-08  213  		};
1a61d17219e027 Alexandre Mergnat 2025-01-08  214  	};
1a61d17219e027 Alexandre Mergnat 2025-01-08  215  	ports {
1a61d17219e027 Alexandre Mergnat 2025-01-08  216  		#address-cells = <1>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  217  		#size-cells = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  218  
1a61d17219e027 Alexandre Mergnat 2025-01-08 @219  		port@0 {
1a61d17219e027 Alexandre Mergnat 2025-01-08  220  			#address-cells = <1>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  221  			#size-cells = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  222  			reg = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  223  			dsi0_in: endpoint@0 {
1a61d17219e027 Alexandre Mergnat 2025-01-08  224  				reg = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  225  				remote-endpoint = <&dither0_out>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  226  			};
1a61d17219e027 Alexandre Mergnat 2025-01-08  227  		};
1a61d17219e027 Alexandre Mergnat 2025-01-08  228  
1a61d17219e027 Alexandre Mergnat 2025-01-08  229  		port@1 {
1a61d17219e027 Alexandre Mergnat 2025-01-08  230  			#address-cells = <1>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  231  			#size-cells = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  232  			reg = <1>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  233  			dsi0_out: endpoint@0 {
1a61d17219e027 Alexandre Mergnat 2025-01-08  234  				reg = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  235  				remote-endpoint = <&panel_in>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  236  			};
1a61d17219e027 Alexandre Mergnat 2025-01-08  237  		};
1a61d17219e027 Alexandre Mergnat 2025-01-08  238  	};
1a61d17219e027 Alexandre Mergnat 2025-01-08  239  };
1a61d17219e027 Alexandre Mergnat 2025-01-08  240  
2c3df90c20727e Alexandre Mergnat 2023-05-25  241  &ethernet {
2c3df90c20727e Alexandre Mergnat 2023-05-25  242  	pinctrl-0 = <&ethernet_pins>;
2c3df90c20727e Alexandre Mergnat 2023-05-25  243  	pinctrl-names = "default";
2c3df90c20727e Alexandre Mergnat 2023-05-25  244  	phy-handle = <&eth_phy>;
2c3df90c20727e Alexandre Mergnat 2023-05-25  245  	phy-mode = "rmii";
2c3df90c20727e Alexandre Mergnat 2023-05-25  246  	/*
2c3df90c20727e Alexandre Mergnat 2023-05-25  247  	 * Ethernet and HDMI (DSI0) are sharing pins.
2c3df90c20727e Alexandre Mergnat 2023-05-25  248  	 * Only one can be enabled at a time and require the physical switch
2c3df90c20727e Alexandre Mergnat 2023-05-25  249  	 * SW2101 to be set on LAN position
2c3df90c20727e Alexandre Mergnat 2023-05-25  250  	 * mt6357_vibr_reg and mt6357_vsim2_reg are needed to supply ethernet
2c3df90c20727e Alexandre Mergnat 2023-05-25  251  	 */
2c3df90c20727e Alexandre Mergnat 2023-05-25  252  	status = "disabled";
2c3df90c20727e Alexandre Mergnat 2023-05-25  253  
2c3df90c20727e Alexandre Mergnat 2023-05-25  254  	mdio {
2c3df90c20727e Alexandre Mergnat 2023-05-25  255  		#address-cells = <1>;
2c3df90c20727e Alexandre Mergnat 2023-05-25  256  		#size-cells = <0>;
2c3df90c20727e Alexandre Mergnat 2023-05-25  257  
2c3df90c20727e Alexandre Mergnat 2023-05-25  258  		eth_phy: ethernet-phy@0 {
2c3df90c20727e Alexandre Mergnat 2023-05-25  259  			reg = <0>;
2c3df90c20727e Alexandre Mergnat 2023-05-25  260  		};
2c3df90c20727e Alexandre Mergnat 2023-05-25  261  	};
2c3df90c20727e Alexandre Mergnat 2023-05-25  262  };
2c3df90c20727e Alexandre Mergnat 2023-05-25  263  
988eff6543618d Alexandre Mergnat 2023-03-28  264  &i2c0 {
988eff6543618d Alexandre Mergnat 2023-03-28  265  	clock-frequency = <100000>;
988eff6543618d Alexandre Mergnat 2023-03-28  266  	pinctrl-0 = <&i2c0_pins>;
988eff6543618d Alexandre Mergnat 2023-03-28  267  	pinctrl-names = "default";
988eff6543618d Alexandre Mergnat 2023-03-28  268  	status = "okay";
988eff6543618d Alexandre Mergnat 2023-03-28  269  };
988eff6543618d Alexandre Mergnat 2023-03-28  270  
1a61d17219e027 Alexandre Mergnat 2025-01-08  271  &i2c1 {
1a61d17219e027 Alexandre Mergnat 2025-01-08  272  	#address-cells = <1>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  273  	#size-cells = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  274  	clock-div = <2>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  275  	clock-frequency = <100000>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  276  	pinctrl-0 = <&i2c1_pins>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  277  	pinctrl-names = "default";
1a61d17219e027 Alexandre Mergnat 2025-01-08  278  	status = "okay";
1a61d17219e027 Alexandre Mergnat 2025-01-08  279  
1a61d17219e027 Alexandre Mergnat 2025-01-08  280  	it66121_hdmi: hdmi@4c {
1a61d17219e027 Alexandre Mergnat 2025-01-08  281  		#sound-dai-cells = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  282  		compatible = "ite,it66121";
1a61d17219e027 Alexandre Mergnat 2025-01-08  283  		interrupt-parent = <&pio>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  284  		interrupts = <68 IRQ_TYPE_LEVEL_LOW>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  285  		pinctrl-0 = <&ite_pins>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  286  		pinctrl-names = "default";
1a61d17219e027 Alexandre Mergnat 2025-01-08  287  		reg = <0x4c>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  288  		reset-gpios = <&pio 69 GPIO_ACTIVE_LOW>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  289  		vcn18-supply = <&mt6357_vsim2_reg>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  290  		vcn33-supply = <&mt6357_vibr_reg>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  291  		vrf12-supply = <&mt6357_vrf12_reg>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  292  
1a61d17219e027 Alexandre Mergnat 2025-01-08  293  		ports {
1a61d17219e027 Alexandre Mergnat 2025-01-08  294  			#address-cells = <1>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  295  			#size-cells = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  296  
1a61d17219e027 Alexandre Mergnat 2025-01-08 @297  			port@0 {
1a61d17219e027 Alexandre Mergnat 2025-01-08  298  				#address-cells = <1>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  299  				#size-cells = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  300  				reg = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  301  				it66121_in: endpoint@0 {
1a61d17219e027 Alexandre Mergnat 2025-01-08  302  					reg = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  303  					bus-width = <12>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  304  					remote-endpoint = <&dpi0_out>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  305  				};
1a61d17219e027 Alexandre Mergnat 2025-01-08  306  			};
1a61d17219e027 Alexandre Mergnat 2025-01-08  307  
1a61d17219e027 Alexandre Mergnat 2025-01-08  308  			port@1 {
1a61d17219e027 Alexandre Mergnat 2025-01-08  309  				#address-cells = <1>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  310  				#size-cells = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  311  				reg = <1>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  312  				hdmi_connector_out: endpoint@0 {
1a61d17219e027 Alexandre Mergnat 2025-01-08  313  					reg = <0>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  314  					remote-endpoint = <&hdmi_connector_in>;
1a61d17219e027 Alexandre Mergnat 2025-01-08  315  				};
1a61d17219e027 Alexandre Mergnat 2025-01-08  316  			};
1a61d17219e027 Alexandre Mergnat 2025-01-08  317  		};
1a61d17219e027 Alexandre Mergnat 2025-01-08  318  	};
1a61d17219e027 Alexandre Mergnat 2025-01-08  319  };
1a61d17219e027 Alexandre Mergnat 2025-01-08  320  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
