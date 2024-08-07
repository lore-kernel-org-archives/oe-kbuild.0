Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A6C6132117
	for <oe-kbuild@lists.linux.dev>; Wed,  7 Aug 2024 15:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723043968; cv=none; b=emq0CfwRVH/9Ig12GjXCjxz25MMw8AxVuwgPNM8R14rSYS7ztGyyfo1/LsvtUa9EZLZ/hkcSP/WZsy1qXOkxT2Hsjf5nT+xOYXCXRi4qX097XasWBX5SyZ9FV+XW/pY2RTuyzGRoiLdOkhJ9Q+FX+hbslsPCoc8ZiKKE7jTCN4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723043968; c=relaxed/simple;
	bh=yl/ZSYm4ysK0KeqB1I5NdG4kI0IkJgcAwu24LkpuF9I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OG9okv1mr47ncIPE4auuaL5jl9jWBLbNyZaIkjV2M5vpg8SQViFqjMRmzos3UjVP959i6KDzwn8qbmJKOe4QGdVkQFAg6Gxt5leJk/02c4aFo9l1KwwKvIwcC8pnidkRNucBYFYk3vWfZsN4RwM8eNB9UXqSjLGBz8dFLCE/YQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j/7hvYzV; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j/7hvYzV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723043960; x=1754579960;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yl/ZSYm4ysK0KeqB1I5NdG4kI0IkJgcAwu24LkpuF9I=;
  b=j/7hvYzVNcglf71hgAcAC1aZSd0xTvOiLvc1gkFzDGorqNy8xje8Lcrl
   LBcamn/qeh/LFGHZmWKbKkQHPTpZ5+Q72hsWYZLFEQlVbthVesyQpLF7u
   99GzdnMfktpLyVBm0ju6xbBOgLe1FAazcEOJKstGq8q8uZQvRboS5RlFw
   8RPvKSnfd0CS26czSo4SwqVRb9ic1N/r0cwf0YK0OllHQXse8GzRnPGOM
   wS06UH8O+mgSJYrnHUXV51AsbYl8U9EFAlre/KSaP2weK0ZpmUypFMTB+
   1Ub1fjccW1b/QOF76nmUaBgxHf8VbtY7XJXC5LkkD/AVXUULHGuR7X/bY
   Q==;
X-CSE-ConnectionGUID: dQxPzGhgSUqx3JwZ2iUcZg==
X-CSE-MsgGUID: JNVgsTiRSFWwloN2InHvmg==
X-IronPort-AV: E=McAfee;i="6700,10204,11157"; a="43643314"
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="43643314"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2024 08:19:19 -0700
X-CSE-ConnectionGUID: NM+HnRGLQrm+j1rFQXa1hQ==
X-CSE-MsgGUID: I+gzLnUyTpyZRl4nmQsDwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,270,1716274800"; 
   d="scan'208";a="56975846"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 07 Aug 2024 08:19:16 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbiRW-0005UO-2L;
	Wed, 07 Aug 2024 15:19:14 +0000
Date: Wed, 7 Aug 2024 23:19:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:wip/debug/soundwire-wsa884x-interrupts 29895/30000]
 arch/arm64/boot/dts/qcom/sm8550.dtsi:2728.30-2800.5: Warning
 (avoid_unnecessary_addr_size): /soc@0/video-codec@aa00000: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202408072329.UqKaF5pn-lkp@intel.com>
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
TO: Dikshita Agarwal <quic_dikshita@quicinc.com>
CC: Abel Vesa <abel.vesa@linaro.org>
CC: Vikash Garodia <quic_vgarodia@quicinc.com>

tree:   https://github.com/krzk/linux wip/debug/soundwire-wsa884x-interrupts
head:   77aa965762ad9c8711d005628b5c471007e0df82
commit: 59e8e44e2f75d999550ec17a4379877db6d36014 [29895/30000] arm64: dts: qcom: sm8550: add changes to enable video
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
config: arm64-randconfig-051-20240807 (https://download.01.org/0day-ci/archive/20240807/202408072329.UqKaF5pn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.6.dev8+gf13c181
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408072329.UqKaF5pn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408072329.UqKaF5pn-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:2728.30-2800.5: Warning (avoid_unnecessary_addr_size): /soc@0/video-codec@aa00000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3016.27-3090.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3111.27-3166.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: phy@1c0e000: #clock-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: video-codec@aa00000: reg: [[0, 178257920, 0, 983040]] is too short
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: video-codec@aa00000: 'non-secure-cb' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: video-codec@aa00000: '#address-cells', '#size-cells', 'non_securei_cb' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:2728.30-2800.5: Warning (avoid_unnecessary_addr_size): /soc@0/video-codec@aa00000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3111.27-3166.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: phy@1c0e000: #clock-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: video-codec@aa00000: reg: [[0, 178257920, 0, 983040]] is too short
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: video-codec@aa00000: 'non-secure-cb' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: video-codec@aa00000: '#address-cells', '#size-cells', 'non_securei_cb' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:2728.30-2800.5: Warning (avoid_unnecessary_addr_size): /soc@0/video-codec@aa00000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3111.27-3166.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: phy@1c0e000: #clock-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: video-codec@aa00000: reg: [[0, 178257920, 0, 983040]] is too short
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: video-codec@aa00000: 'non-secure-cb' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: video-codec@aa00000: '#address-cells', '#size-cells', 'non_securei_cb' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
--
>> arch/arm64/boot/dts/qcom/sm8550.dtsi:2728.30-2800.5: Warning (avoid_unnecessary_addr_size): /soc@0/video-codec@aa00000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3016.27-3090.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3111.27-3166.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pcie-1-phy-aux-clk: 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: phy@1c0e000: #clock-cells: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: video-codec@aa00000: reg: [[0, 178257920, 0, 983040]] is too short
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: video-codec@aa00000: 'non-secure-cb' is a required property
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: video-codec@aa00000: '#address-cells', '#size-cells', 'non_securei_cb' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/media/qcom,sm8550-iris.yaml#

vim +2728 arch/arm64/boot/dts/qcom/sm8550.dtsi

ffc50b2d382879 Abel Vesa             2023-01-06    26  
ffc50b2d382879 Abel Vesa             2023-01-06    27  / {
ffc50b2d382879 Abel Vesa             2023-01-06    28  	interrupt-parent = <&intc>;
ffc50b2d382879 Abel Vesa             2023-01-06    29  
ffc50b2d382879 Abel Vesa             2023-01-06    30  	#address-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06    31  	#size-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06    32  
ffc50b2d382879 Abel Vesa             2023-01-06    33  	chosen { };
ffc50b2d382879 Abel Vesa             2023-01-06    34  
ffc50b2d382879 Abel Vesa             2023-01-06    35  	clocks {
ffc50b2d382879 Abel Vesa             2023-01-06    36  		xo_board: xo-board {
ffc50b2d382879 Abel Vesa             2023-01-06    37  			compatible = "fixed-clock";
ffc50b2d382879 Abel Vesa             2023-01-06    38  			#clock-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06    39  		};
ffc50b2d382879 Abel Vesa             2023-01-06    40  
ffc50b2d382879 Abel Vesa             2023-01-06    41  		sleep_clk: sleep-clk {
ffc50b2d382879 Abel Vesa             2023-01-06    42  			compatible = "fixed-clock";
ffc50b2d382879 Abel Vesa             2023-01-06    43  			#clock-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06    44  		};
ffc50b2d382879 Abel Vesa             2023-01-06    45  
ffc50b2d382879 Abel Vesa             2023-01-06    46  		bi_tcxo_div2: bi-tcxo-div2-clk {
ffc50b2d382879 Abel Vesa             2023-01-06    47  			#clock-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06    48  			compatible = "fixed-factor-clock";
ffc50b2d382879 Abel Vesa             2023-01-06    49  			clocks = <&rpmhcc RPMH_CXO_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06    50  			clock-mult = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06    51  			clock-div = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06    52  		};
ffc50b2d382879 Abel Vesa             2023-01-06    53  
ffc50b2d382879 Abel Vesa             2023-01-06    54  		bi_tcxo_ao_div2: bi-tcxo-ao-div2-clk {
ffc50b2d382879 Abel Vesa             2023-01-06    55  			#clock-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06    56  			compatible = "fixed-factor-clock";
ffc50b2d382879 Abel Vesa             2023-01-06    57  			clocks = <&rpmhcc RPMH_CXO_CLK_A>;
ffc50b2d382879 Abel Vesa             2023-01-06    58  			clock-mult = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06    59  			clock-div = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06    60  		};
ffc50b2d382879 Abel Vesa             2023-01-06    61  
ffc50b2d382879 Abel Vesa             2023-01-06    62  		pcie_1_phy_aux_clk: pcie-1-phy-aux-clk {
ffc50b2d382879 Abel Vesa             2023-01-06    63  			compatible = "fixed-clock";
ffc50b2d382879 Abel Vesa             2023-01-06    64  			#clock-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06    65  		};
ffc50b2d382879 Abel Vesa             2023-01-06    66  	};
ffc50b2d382879 Abel Vesa             2023-01-06    67  
ffc50b2d382879 Abel Vesa             2023-01-06    68  	cpus {
ffc50b2d382879 Abel Vesa             2023-01-06    69  		#address-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06    70  		#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06    71  
ffc50b2d382879 Abel Vesa             2023-01-06    72  		CPU0: cpu@0 {
ffc50b2d382879 Abel Vesa             2023-01-06    73  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16    74  			compatible = "arm,cortex-a510";
ffc50b2d382879 Abel Vesa             2023-01-06    75  			reg = <0 0>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15    76  			clocks = <&cpufreq_hw 0>;
ffc50b2d382879 Abel Vesa             2023-01-06    77  			enable-method = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06    78  			next-level-cache = <&L2_0>;
ffc50b2d382879 Abel Vesa             2023-01-06    79  			power-domains = <&CPU_PD0>;
ffc50b2d382879 Abel Vesa             2023-01-06    80  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06    81  			qcom,freq-domain = <&cpufreq_hw 0>;
ffc50b2d382879 Abel Vesa             2023-01-06    82  			capacity-dmips-mhz = <1024>;
ffc50b2d382879 Abel Vesa             2023-01-06    83  			dynamic-power-coefficient = <100>;
ffc50b2d382879 Abel Vesa             2023-01-06    84  			#cooling-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06    85  			L2_0: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06    86  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06    87  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16    88  				cache-unified;
ffc50b2d382879 Abel Vesa             2023-01-06    89  				next-level-cache = <&L3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06    90  				L3_0: l3-cache {
ffc50b2d382879 Abel Vesa             2023-01-06    91  					compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06    92  					cache-level = <3>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16    93  					cache-unified;
ffc50b2d382879 Abel Vesa             2023-01-06    94  				};
ffc50b2d382879 Abel Vesa             2023-01-06    95  			};
ffc50b2d382879 Abel Vesa             2023-01-06    96  		};
ffc50b2d382879 Abel Vesa             2023-01-06    97  
ffc50b2d382879 Abel Vesa             2023-01-06    98  		CPU1: cpu@100 {
ffc50b2d382879 Abel Vesa             2023-01-06    99  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16   100  			compatible = "arm,cortex-a510";
ffc50b2d382879 Abel Vesa             2023-01-06   101  			reg = <0 0x100>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15   102  			clocks = <&cpufreq_hw 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   103  			enable-method = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   104  			next-level-cache = <&L2_100>;
ffc50b2d382879 Abel Vesa             2023-01-06   105  			power-domains = <&CPU_PD1>;
ffc50b2d382879 Abel Vesa             2023-01-06   106  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   107  			qcom,freq-domain = <&cpufreq_hw 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   108  			capacity-dmips-mhz = <1024>;
ffc50b2d382879 Abel Vesa             2023-01-06   109  			dynamic-power-coefficient = <100>;
ffc50b2d382879 Abel Vesa             2023-01-06   110  			#cooling-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   111  			L2_100: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   112  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   113  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   114  				cache-unified;
ffc50b2d382879 Abel Vesa             2023-01-06   115  				next-level-cache = <&L3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   116  			};
ffc50b2d382879 Abel Vesa             2023-01-06   117  		};
ffc50b2d382879 Abel Vesa             2023-01-06   118  
ffc50b2d382879 Abel Vesa             2023-01-06   119  		CPU2: cpu@200 {
ffc50b2d382879 Abel Vesa             2023-01-06   120  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16   121  			compatible = "arm,cortex-a510";
ffc50b2d382879 Abel Vesa             2023-01-06   122  			reg = <0 0x200>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15   123  			clocks = <&cpufreq_hw 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   124  			enable-method = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   125  			next-level-cache = <&L2_200>;
ffc50b2d382879 Abel Vesa             2023-01-06   126  			power-domains = <&CPU_PD2>;
ffc50b2d382879 Abel Vesa             2023-01-06   127  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   128  			qcom,freq-domain = <&cpufreq_hw 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   129  			capacity-dmips-mhz = <1024>;
ffc50b2d382879 Abel Vesa             2023-01-06   130  			dynamic-power-coefficient = <100>;
ffc50b2d382879 Abel Vesa             2023-01-06   131  			#cooling-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   132  			L2_200: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   133  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   134  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   135  				cache-unified;
ffc50b2d382879 Abel Vesa             2023-01-06   136  				next-level-cache = <&L3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   137  			};
ffc50b2d382879 Abel Vesa             2023-01-06   138  		};
ffc50b2d382879 Abel Vesa             2023-01-06   139  
ffc50b2d382879 Abel Vesa             2023-01-06   140  		CPU3: cpu@300 {
ffc50b2d382879 Abel Vesa             2023-01-06   141  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16   142  			compatible = "arm,cortex-a715";
ffc50b2d382879 Abel Vesa             2023-01-06   143  			reg = <0 0x300>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15   144  			clocks = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   145  			enable-method = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   146  			next-level-cache = <&L2_300>;
ffc50b2d382879 Abel Vesa             2023-01-06   147  			power-domains = <&CPU_PD3>;
ffc50b2d382879 Abel Vesa             2023-01-06   148  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   149  			qcom,freq-domain = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   150  			capacity-dmips-mhz = <1792>;
ffc50b2d382879 Abel Vesa             2023-01-06   151  			dynamic-power-coefficient = <270>;
ffc50b2d382879 Abel Vesa             2023-01-06   152  			#cooling-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   153  			L2_300: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   154  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   155  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   156  				cache-unified;
ffc50b2d382879 Abel Vesa             2023-01-06   157  				next-level-cache = <&L3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   158  			};
ffc50b2d382879 Abel Vesa             2023-01-06   159  		};
ffc50b2d382879 Abel Vesa             2023-01-06   160  
ffc50b2d382879 Abel Vesa             2023-01-06   161  		CPU4: cpu@400 {
ffc50b2d382879 Abel Vesa             2023-01-06   162  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16   163  			compatible = "arm,cortex-a715";
ffc50b2d382879 Abel Vesa             2023-01-06   164  			reg = <0 0x400>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15   165  			clocks = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   166  			enable-method = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   167  			next-level-cache = <&L2_400>;
ffc50b2d382879 Abel Vesa             2023-01-06   168  			power-domains = <&CPU_PD4>;
ffc50b2d382879 Abel Vesa             2023-01-06   169  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   170  			qcom,freq-domain = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   171  			capacity-dmips-mhz = <1792>;
ffc50b2d382879 Abel Vesa             2023-01-06   172  			dynamic-power-coefficient = <270>;
ffc50b2d382879 Abel Vesa             2023-01-06   173  			#cooling-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   174  			L2_400: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   175  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   176  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   177  				cache-unified;
ffc50b2d382879 Abel Vesa             2023-01-06   178  				next-level-cache = <&L3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   179  			};
ffc50b2d382879 Abel Vesa             2023-01-06   180  		};
ffc50b2d382879 Abel Vesa             2023-01-06   181  
ffc50b2d382879 Abel Vesa             2023-01-06   182  		CPU5: cpu@500 {
ffc50b2d382879 Abel Vesa             2023-01-06   183  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16   184  			compatible = "arm,cortex-a710";
ffc50b2d382879 Abel Vesa             2023-01-06   185  			reg = <0 0x500>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15   186  			clocks = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   187  			enable-method = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   188  			next-level-cache = <&L2_500>;
ffc50b2d382879 Abel Vesa             2023-01-06   189  			power-domains = <&CPU_PD5>;
ffc50b2d382879 Abel Vesa             2023-01-06   190  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   191  			qcom,freq-domain = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   192  			capacity-dmips-mhz = <1792>;
ffc50b2d382879 Abel Vesa             2023-01-06   193  			dynamic-power-coefficient = <270>;
ffc50b2d382879 Abel Vesa             2023-01-06   194  			#cooling-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   195  			L2_500: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   196  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   197  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   198  				cache-unified;
ffc50b2d382879 Abel Vesa             2023-01-06   199  				next-level-cache = <&L3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   200  			};
ffc50b2d382879 Abel Vesa             2023-01-06   201  		};
ffc50b2d382879 Abel Vesa             2023-01-06   202  
ffc50b2d382879 Abel Vesa             2023-01-06   203  		CPU6: cpu@600 {
ffc50b2d382879 Abel Vesa             2023-01-06   204  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16   205  			compatible = "arm,cortex-a710";
ffc50b2d382879 Abel Vesa             2023-01-06   206  			reg = <0 0x600>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15   207  			clocks = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   208  			enable-method = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   209  			next-level-cache = <&L2_600>;
ffc50b2d382879 Abel Vesa             2023-01-06   210  			power-domains = <&CPU_PD6>;
ffc50b2d382879 Abel Vesa             2023-01-06   211  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   212  			qcom,freq-domain = <&cpufreq_hw 1>;
ffc50b2d382879 Abel Vesa             2023-01-06   213  			capacity-dmips-mhz = <1792>;
ffc50b2d382879 Abel Vesa             2023-01-06   214  			dynamic-power-coefficient = <270>;
ffc50b2d382879 Abel Vesa             2023-01-06   215  			#cooling-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   216  			L2_600: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   217  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   218  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   219  				cache-unified;
ffc50b2d382879 Abel Vesa             2023-01-06   220  				next-level-cache = <&L3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   221  			};
ffc50b2d382879 Abel Vesa             2023-01-06   222  		};
ffc50b2d382879 Abel Vesa             2023-01-06   223  
ffc50b2d382879 Abel Vesa             2023-01-06   224  		CPU7: cpu@700 {
ffc50b2d382879 Abel Vesa             2023-01-06   225  			device_type = "cpu";
27072f2ffb2928 Konrad Dybcio         2023-02-16   226  			compatible = "arm,cortex-x3";
ffc50b2d382879 Abel Vesa             2023-01-06   227  			reg = <0 0x700>;
1b0911fe3edb08 Manivannan Sadhasivam 2023-02-15   228  			clocks = <&cpufreq_hw 2>;
ffc50b2d382879 Abel Vesa             2023-01-06   229  			enable-method = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   230  			next-level-cache = <&L2_700>;
ffc50b2d382879 Abel Vesa             2023-01-06   231  			power-domains = <&CPU_PD7>;
ffc50b2d382879 Abel Vesa             2023-01-06   232  			power-domain-names = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   233  			qcom,freq-domain = <&cpufreq_hw 2>;
ffc50b2d382879 Abel Vesa             2023-01-06   234  			capacity-dmips-mhz = <1894>;
ffc50b2d382879 Abel Vesa             2023-01-06   235  			dynamic-power-coefficient = <588>;
ffc50b2d382879 Abel Vesa             2023-01-06   236  			#cooling-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   237  			L2_700: l2-cache {
ffc50b2d382879 Abel Vesa             2023-01-06   238  				compatible = "cache";
ffc50b2d382879 Abel Vesa             2023-01-06   239  				cache-level = <2>;
9c6e72fb2058dc Krzysztof Kozlowski   2023-04-16   240  				cache-unified;
ffc50b2d382879 Abel Vesa             2023-01-06   241  				next-level-cache = <&L3_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   242  			};
ffc50b2d382879 Abel Vesa             2023-01-06   243  		};
ffc50b2d382879 Abel Vesa             2023-01-06   244  
ffc50b2d382879 Abel Vesa             2023-01-06   245  		cpu-map {
ffc50b2d382879 Abel Vesa             2023-01-06   246  			cluster0 {
ffc50b2d382879 Abel Vesa             2023-01-06   247  				core0 {
ffc50b2d382879 Abel Vesa             2023-01-06   248  					cpu = <&CPU0>;
ffc50b2d382879 Abel Vesa             2023-01-06   249  				};
ffc50b2d382879 Abel Vesa             2023-01-06   250  
ffc50b2d382879 Abel Vesa             2023-01-06   251  				core1 {
ffc50b2d382879 Abel Vesa             2023-01-06   252  					cpu = <&CPU1>;
ffc50b2d382879 Abel Vesa             2023-01-06   253  				};
ffc50b2d382879 Abel Vesa             2023-01-06   254  
ffc50b2d382879 Abel Vesa             2023-01-06   255  				core2 {
ffc50b2d382879 Abel Vesa             2023-01-06   256  					cpu = <&CPU2>;
ffc50b2d382879 Abel Vesa             2023-01-06   257  				};
ffc50b2d382879 Abel Vesa             2023-01-06   258  
ffc50b2d382879 Abel Vesa             2023-01-06   259  				core3 {
ffc50b2d382879 Abel Vesa             2023-01-06   260  					cpu = <&CPU3>;
ffc50b2d382879 Abel Vesa             2023-01-06   261  				};
ffc50b2d382879 Abel Vesa             2023-01-06   262  
ffc50b2d382879 Abel Vesa             2023-01-06   263  				core4 {
ffc50b2d382879 Abel Vesa             2023-01-06   264  					cpu = <&CPU4>;
ffc50b2d382879 Abel Vesa             2023-01-06   265  				};
ffc50b2d382879 Abel Vesa             2023-01-06   266  
ffc50b2d382879 Abel Vesa             2023-01-06   267  				core5 {
ffc50b2d382879 Abel Vesa             2023-01-06   268  					cpu = <&CPU5>;
ffc50b2d382879 Abel Vesa             2023-01-06   269  				};
ffc50b2d382879 Abel Vesa             2023-01-06   270  
ffc50b2d382879 Abel Vesa             2023-01-06   271  				core6 {
ffc50b2d382879 Abel Vesa             2023-01-06   272  					cpu = <&CPU6>;
ffc50b2d382879 Abel Vesa             2023-01-06   273  				};
ffc50b2d382879 Abel Vesa             2023-01-06   274  
ffc50b2d382879 Abel Vesa             2023-01-06   275  				core7 {
ffc50b2d382879 Abel Vesa             2023-01-06   276  					cpu = <&CPU7>;
ffc50b2d382879 Abel Vesa             2023-01-06   277  				};
ffc50b2d382879 Abel Vesa             2023-01-06   278  			};
ffc50b2d382879 Abel Vesa             2023-01-06   279  		};
ffc50b2d382879 Abel Vesa             2023-01-06   280  
ffc50b2d382879 Abel Vesa             2023-01-06   281  		idle-states {
ffc50b2d382879 Abel Vesa             2023-01-06   282  			entry-method = "psci";
ffc50b2d382879 Abel Vesa             2023-01-06   283  
ffc50b2d382879 Abel Vesa             2023-01-06   284  			LITTLE_CPU_SLEEP_0: cpu-sleep-0-0 {
ffc50b2d382879 Abel Vesa             2023-01-06   285  				compatible = "arm,idle-state";
ffc50b2d382879 Abel Vesa             2023-01-06   286  				idle-state-name = "silver-rail-power-collapse";
ffc50b2d382879 Abel Vesa             2023-01-06   287  				arm,psci-suspend-param = <0x40000004>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   288  				entry-latency-us = <550>;
ffc50b2d382879 Abel Vesa             2023-01-06   289  				exit-latency-us = <750>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   290  				min-residency-us = <6700>;
ffc50b2d382879 Abel Vesa             2023-01-06   291  				local-timer-stop;
ffc50b2d382879 Abel Vesa             2023-01-06   292  			};
ffc50b2d382879 Abel Vesa             2023-01-06   293  
ffc50b2d382879 Abel Vesa             2023-01-06   294  			BIG_CPU_SLEEP_0: cpu-sleep-1-0 {
ffc50b2d382879 Abel Vesa             2023-01-06   295  				compatible = "arm,idle-state";
ffc50b2d382879 Abel Vesa             2023-01-06   296  				idle-state-name = "gold-rail-power-collapse";
ffc50b2d382879 Abel Vesa             2023-01-06   297  				arm,psci-suspend-param = <0x40000004>;
ffc50b2d382879 Abel Vesa             2023-01-06   298  				entry-latency-us = <600>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   299  				exit-latency-us = <1300>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   300  				min-residency-us = <8136>;
ffc50b2d382879 Abel Vesa             2023-01-06   301  				local-timer-stop;
ffc50b2d382879 Abel Vesa             2023-01-06   302  			};
28b735232d5e16 Konrad Dybcio         2023-12-18   303  
28b735232d5e16 Konrad Dybcio         2023-12-18   304  			PRIME_CPU_SLEEP_0: cpu-sleep-2-0 {
28b735232d5e16 Konrad Dybcio         2023-12-18   305  				compatible = "arm,idle-state";
28b735232d5e16 Konrad Dybcio         2023-12-18   306  				idle-state-name = "goldplus-rail-power-collapse";
28b735232d5e16 Konrad Dybcio         2023-12-18   307  				arm,psci-suspend-param = <0x40000004>;
28b735232d5e16 Konrad Dybcio         2023-12-18   308  				entry-latency-us = <500>;
28b735232d5e16 Konrad Dybcio         2023-12-18   309  				exit-latency-us = <1350>;
28b735232d5e16 Konrad Dybcio         2023-12-18   310  				min-residency-us = <7480>;
28b735232d5e16 Konrad Dybcio         2023-12-18   311  				local-timer-stop;
28b735232d5e16 Konrad Dybcio         2023-12-18   312  			};
ffc50b2d382879 Abel Vesa             2023-01-06   313  		};
ffc50b2d382879 Abel Vesa             2023-01-06   314  
ffc50b2d382879 Abel Vesa             2023-01-06   315  		domain-idle-states {
ffc50b2d382879 Abel Vesa             2023-01-06   316  			CLUSTER_SLEEP_0: cluster-sleep-0 {
ffc50b2d382879 Abel Vesa             2023-01-06   317  				compatible = "domain-idle-state";
ffc50b2d382879 Abel Vesa             2023-01-06   318  				arm,psci-suspend-param = <0x41000044>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   319  				entry-latency-us = <750>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   320  				exit-latency-us = <2350>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   321  				min-residency-us = <9144>;
ffc50b2d382879 Abel Vesa             2023-01-06   322  			};
ffc50b2d382879 Abel Vesa             2023-01-06   323  
ffc50b2d382879 Abel Vesa             2023-01-06   324  			CLUSTER_SLEEP_1: cluster-sleep-1 {
ffc50b2d382879 Abel Vesa             2023-01-06   325  				compatible = "domain-idle-state";
ffc50b2d382879 Abel Vesa             2023-01-06   326  				arm,psci-suspend-param = <0x4100c344>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   327  				entry-latency-us = <2800>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   328  				exit-latency-us = <4400>;
ad6556fb45d4ab Konrad Dybcio         2023-12-18   329  				min-residency-us = <10150>;
ffc50b2d382879 Abel Vesa             2023-01-06   330  			};
ffc50b2d382879 Abel Vesa             2023-01-06   331  		};
ffc50b2d382879 Abel Vesa             2023-01-06   332  	};
ffc50b2d382879 Abel Vesa             2023-01-06   333  
ffc50b2d382879 Abel Vesa             2023-01-06   334  	firmware {
ffc50b2d382879 Abel Vesa             2023-01-06   335  		scm: scm {
ffc50b2d382879 Abel Vesa             2023-01-06   336  			compatible = "qcom,scm-sm8550", "qcom,scm";
44b1f64cad5703 Mukesh Ojha           2023-10-25   337  			qcom,dload-mode = <&tcsr 0x19000>;
2e3790de9b18f1 Abel Vesa             2023-01-18   338  			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   339  		};
ffc50b2d382879 Abel Vesa             2023-01-06   340  	};
ffc50b2d382879 Abel Vesa             2023-01-06   341  
ffc50b2d382879 Abel Vesa             2023-01-06   342  	clk_virt: interconnect-0 {
ffc50b2d382879 Abel Vesa             2023-01-06   343  		compatible = "qcom,sm8550-clk-virt";
ffc50b2d382879 Abel Vesa             2023-01-06   344  		#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   345  		qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06   346  	};
ffc50b2d382879 Abel Vesa             2023-01-06   347  
ffc50b2d382879 Abel Vesa             2023-01-06   348  	mc_virt: interconnect-1 {
ffc50b2d382879 Abel Vesa             2023-01-06   349  		compatible = "qcom,sm8550-mc-virt";
ffc50b2d382879 Abel Vesa             2023-01-06   350  		#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   351  		qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06   352  	};
ffc50b2d382879 Abel Vesa             2023-01-06   353  
ffc50b2d382879 Abel Vesa             2023-01-06   354  	memory@a0000000 {
ffc50b2d382879 Abel Vesa             2023-01-06   355  		device_type = "memory";
ffc50b2d382879 Abel Vesa             2023-01-06   356  		/* We expect the bootloader to fill in the size */
ffc50b2d382879 Abel Vesa             2023-01-06   357  		reg = <0 0xa0000000 0 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   358  	};
ffc50b2d382879 Abel Vesa             2023-01-06   359  
ffc50b2d382879 Abel Vesa             2023-01-06   360  	pmu {
ffc50b2d382879 Abel Vesa             2023-01-06   361  		compatible = "arm,armv8-pmuv3";
ffc50b2d382879 Abel Vesa             2023-01-06   362  		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
ffc50b2d382879 Abel Vesa             2023-01-06   363  	};
ffc50b2d382879 Abel Vesa             2023-01-06   364  
ffc50b2d382879 Abel Vesa             2023-01-06   365  	psci {
ffc50b2d382879 Abel Vesa             2023-01-06   366  		compatible = "arm,psci-1.0";
ffc50b2d382879 Abel Vesa             2023-01-06   367  		method = "smc";
ffc50b2d382879 Abel Vesa             2023-01-06   368  
ffc50b2d382879 Abel Vesa             2023-01-06   369  		CPU_PD0: power-domain-cpu0 {
ffc50b2d382879 Abel Vesa             2023-01-06   370  			#power-domain-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   371  			power-domains = <&CLUSTER_PD>;
ffc50b2d382879 Abel Vesa             2023-01-06   372  			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   373  		};
ffc50b2d382879 Abel Vesa             2023-01-06   374  
ffc50b2d382879 Abel Vesa             2023-01-06   375  		CPU_PD1: power-domain-cpu1 {
ffc50b2d382879 Abel Vesa             2023-01-06   376  			#power-domain-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   377  			power-domains = <&CLUSTER_PD>;
ffc50b2d382879 Abel Vesa             2023-01-06   378  			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   379  		};
ffc50b2d382879 Abel Vesa             2023-01-06   380  
ffc50b2d382879 Abel Vesa             2023-01-06   381  		CPU_PD2: power-domain-cpu2 {
ffc50b2d382879 Abel Vesa             2023-01-06   382  			#power-domain-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   383  			power-domains = <&CLUSTER_PD>;
ffc50b2d382879 Abel Vesa             2023-01-06   384  			domain-idle-states = <&LITTLE_CPU_SLEEP_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   385  		};
ffc50b2d382879 Abel Vesa             2023-01-06   386  
ffc50b2d382879 Abel Vesa             2023-01-06   387  		CPU_PD3: power-domain-cpu3 {
ffc50b2d382879 Abel Vesa             2023-01-06   388  			#power-domain-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   389  			power-domains = <&CLUSTER_PD>;
ffc50b2d382879 Abel Vesa             2023-01-06   390  			domain-idle-states = <&BIG_CPU_SLEEP_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   391  		};
ffc50b2d382879 Abel Vesa             2023-01-06   392  
ffc50b2d382879 Abel Vesa             2023-01-06   393  		CPU_PD4: power-domain-cpu4 {
ffc50b2d382879 Abel Vesa             2023-01-06   394  			#power-domain-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   395  			power-domains = <&CLUSTER_PD>;
ffc50b2d382879 Abel Vesa             2023-01-06   396  			domain-idle-states = <&BIG_CPU_SLEEP_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   397  		};
ffc50b2d382879 Abel Vesa             2023-01-06   398  
ffc50b2d382879 Abel Vesa             2023-01-06   399  		CPU_PD5: power-domain-cpu5 {
ffc50b2d382879 Abel Vesa             2023-01-06   400  			#power-domain-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   401  			power-domains = <&CLUSTER_PD>;
ffc50b2d382879 Abel Vesa             2023-01-06   402  			domain-idle-states = <&BIG_CPU_SLEEP_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   403  		};
ffc50b2d382879 Abel Vesa             2023-01-06   404  
ffc50b2d382879 Abel Vesa             2023-01-06   405  		CPU_PD6: power-domain-cpu6 {
ffc50b2d382879 Abel Vesa             2023-01-06   406  			#power-domain-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   407  			power-domains = <&CLUSTER_PD>;
ffc50b2d382879 Abel Vesa             2023-01-06   408  			domain-idle-states = <&BIG_CPU_SLEEP_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   409  		};
ffc50b2d382879 Abel Vesa             2023-01-06   410  
ffc50b2d382879 Abel Vesa             2023-01-06   411  		CPU_PD7: power-domain-cpu7 {
ffc50b2d382879 Abel Vesa             2023-01-06   412  			#power-domain-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   413  			power-domains = <&CLUSTER_PD>;
28b735232d5e16 Konrad Dybcio         2023-12-18   414  			domain-idle-states = <&PRIME_CPU_SLEEP_0>;
ffc50b2d382879 Abel Vesa             2023-01-06   415  		};
ffc50b2d382879 Abel Vesa             2023-01-06   416  
ffc50b2d382879 Abel Vesa             2023-01-06   417  		CLUSTER_PD: power-domain-cluster {
ffc50b2d382879 Abel Vesa             2023-01-06   418  			#power-domain-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   419  			domain-idle-states = <&CLUSTER_SLEEP_0>, <&CLUSTER_SLEEP_1>;
ffc50b2d382879 Abel Vesa             2023-01-06   420  		};
ffc50b2d382879 Abel Vesa             2023-01-06   421  	};
ffc50b2d382879 Abel Vesa             2023-01-06   422  
ffc50b2d382879 Abel Vesa             2023-01-06   423  	reserved_memory: reserved-memory {
ffc50b2d382879 Abel Vesa             2023-01-06   424  		#address-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   425  		#size-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   426  		ranges;
ffc50b2d382879 Abel Vesa             2023-01-06   427  
ffc50b2d382879 Abel Vesa             2023-01-06   428  		hyp_mem: hyp-region@80000000 {
ffc50b2d382879 Abel Vesa             2023-01-06   429  			reg = <0 0x80000000 0 0xa00000>;
ffc50b2d382879 Abel Vesa             2023-01-06   430  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   431  		};
ffc50b2d382879 Abel Vesa             2023-01-06   432  
ffc50b2d382879 Abel Vesa             2023-01-06   433  		cpusys_vm_mem: cpusys-vm-region@80a00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   434  			reg = <0 0x80a00000 0 0x400000>;
ffc50b2d382879 Abel Vesa             2023-01-06   435  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   436  		};
ffc50b2d382879 Abel Vesa             2023-01-06   437  
ffc50b2d382879 Abel Vesa             2023-01-06   438  		hyp_tags_mem: hyp-tags-region@80e00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   439  			reg = <0 0x80e00000 0 0x3d0000>;
ffc50b2d382879 Abel Vesa             2023-01-06   440  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   441  		};
ffc50b2d382879 Abel Vesa             2023-01-06   442  
ffc50b2d382879 Abel Vesa             2023-01-06   443  		xbl_sc_mem: xbl-sc-region@d8100000 {
ffc50b2d382879 Abel Vesa             2023-01-06   444  			reg = <0 0xd8100000 0 0x40000>;
ffc50b2d382879 Abel Vesa             2023-01-06   445  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   446  		};
ffc50b2d382879 Abel Vesa             2023-01-06   447  
ffc50b2d382879 Abel Vesa             2023-01-06   448  		hyp_tags_reserved_mem: hyp-tags-reserved-region@811d0000 {
ffc50b2d382879 Abel Vesa             2023-01-06   449  			reg = <0 0x811d0000 0 0x30000>;
ffc50b2d382879 Abel Vesa             2023-01-06   450  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   451  		};
ffc50b2d382879 Abel Vesa             2023-01-06   452  
ffc50b2d382879 Abel Vesa             2023-01-06   453  		/* merged xbl_dt_log, xbl_ramdump, aop_image */
ffc50b2d382879 Abel Vesa             2023-01-06   454  		xbl_dt_log_merged_mem: xbl-dt-log-merged-region@81a00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   455  			reg = <0 0x81a00000 0 0x260000>;
ffc50b2d382879 Abel Vesa             2023-01-06   456  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   457  		};
ffc50b2d382879 Abel Vesa             2023-01-06   458  
ffc50b2d382879 Abel Vesa             2023-01-06   459  		aop_cmd_db_mem: aop-cmd-db-region@81c60000 {
ffc50b2d382879 Abel Vesa             2023-01-06   460  			compatible = "qcom,cmd-db";
ffc50b2d382879 Abel Vesa             2023-01-06   461  			reg = <0 0x81c60000 0 0x20000>;
ffc50b2d382879 Abel Vesa             2023-01-06   462  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   463  		};
ffc50b2d382879 Abel Vesa             2023-01-06   464  
ffc50b2d382879 Abel Vesa             2023-01-06   465  		/* merged aop_config, tme_crash_dump, tme_log, uefi_log */
ffc50b2d382879 Abel Vesa             2023-01-06   466  		aop_config_merged_mem: aop-config-merged-region@81c80000 {
ffc50b2d382879 Abel Vesa             2023-01-06   467  			reg = <0 0x81c80000 0 0x74000>;
ffc50b2d382879 Abel Vesa             2023-01-06   468  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   469  		};
ffc50b2d382879 Abel Vesa             2023-01-06   470  
ffc50b2d382879 Abel Vesa             2023-01-06   471  		/* secdata region can be reused by apps */
ffc50b2d382879 Abel Vesa             2023-01-06   472  		smem: smem@81d00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   473  			compatible = "qcom,smem";
ffc50b2d382879 Abel Vesa             2023-01-06   474  			reg = <0 0x81d00000 0 0x200000>;
ffc50b2d382879 Abel Vesa             2023-01-06   475  			hwlocks = <&tcsr_mutex 3>;
ffc50b2d382879 Abel Vesa             2023-01-06   476  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   477  		};
ffc50b2d382879 Abel Vesa             2023-01-06   478  
ffc50b2d382879 Abel Vesa             2023-01-06   479  		adsp_mhi_mem: adsp-mhi-region@81f00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   480  			reg = <0 0x81f00000 0 0x20000>;
ffc50b2d382879 Abel Vesa             2023-01-06   481  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   482  		};
ffc50b2d382879 Abel Vesa             2023-01-06   483  
ffc50b2d382879 Abel Vesa             2023-01-06   484  		global_sync_mem: global-sync-region@82600000 {
ffc50b2d382879 Abel Vesa             2023-01-06   485  			reg = <0 0x82600000 0 0x100000>;
ffc50b2d382879 Abel Vesa             2023-01-06   486  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   487  		};
ffc50b2d382879 Abel Vesa             2023-01-06   488  
ffc50b2d382879 Abel Vesa             2023-01-06   489  		tz_stat_mem: tz-stat-region@82700000 {
ffc50b2d382879 Abel Vesa             2023-01-06   490  			reg = <0 0x82700000 0 0x100000>;
ffc50b2d382879 Abel Vesa             2023-01-06   491  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   492  		};
ffc50b2d382879 Abel Vesa             2023-01-06   493  
ffc50b2d382879 Abel Vesa             2023-01-06   494  		cdsp_secure_heap_mem: cdsp-secure-heap-region@82800000 {
ffc50b2d382879 Abel Vesa             2023-01-06   495  			reg = <0 0x82800000 0 0x4600000>;
ffc50b2d382879 Abel Vesa             2023-01-06   496  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   497  		};
ffc50b2d382879 Abel Vesa             2023-01-06   498  
ffc50b2d382879 Abel Vesa             2023-01-06   499  		mpss_mem: mpss-region@8a800000 {
ffc50b2d382879 Abel Vesa             2023-01-06   500  			reg = <0 0x8a800000 0 0x10800000>;
ffc50b2d382879 Abel Vesa             2023-01-06   501  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   502  		};
ffc50b2d382879 Abel Vesa             2023-01-06   503  
ffc50b2d382879 Abel Vesa             2023-01-06   504  		q6_mpss_dtb_mem: q6-mpss-dtb-region@9b000000 {
ffc50b2d382879 Abel Vesa             2023-01-06   505  			reg = <0 0x9b000000 0 0x80000>;
ffc50b2d382879 Abel Vesa             2023-01-06   506  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   507  		};
ffc50b2d382879 Abel Vesa             2023-01-06   508  
ffc50b2d382879 Abel Vesa             2023-01-06   509  		ipa_fw_mem: ipa-fw-region@9b080000 {
ffc50b2d382879 Abel Vesa             2023-01-06   510  			reg = <0 0x9b080000 0 0x10000>;
ffc50b2d382879 Abel Vesa             2023-01-06   511  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   512  		};
ffc50b2d382879 Abel Vesa             2023-01-06   513  
ffc50b2d382879 Abel Vesa             2023-01-06   514  		ipa_gsi_mem: ipa-gsi-region@9b090000 {
ffc50b2d382879 Abel Vesa             2023-01-06   515  			reg = <0 0x9b090000 0 0xa000>;
ffc50b2d382879 Abel Vesa             2023-01-06   516  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   517  		};
ffc50b2d382879 Abel Vesa             2023-01-06   518  
ffc50b2d382879 Abel Vesa             2023-01-06   519  		gpu_micro_code_mem: gpu-micro-code-region@9b09a000 {
ffc50b2d382879 Abel Vesa             2023-01-06   520  			reg = <0 0x9b09a000 0 0x2000>;
ffc50b2d382879 Abel Vesa             2023-01-06   521  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   522  		};
ffc50b2d382879 Abel Vesa             2023-01-06   523  
ffc50b2d382879 Abel Vesa             2023-01-06   524  		spss_region_mem: spss-region@9b100000 {
ffc50b2d382879 Abel Vesa             2023-01-06   525  			reg = <0 0x9b100000 0 0x180000>;
ffc50b2d382879 Abel Vesa             2023-01-06   526  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   527  		};
ffc50b2d382879 Abel Vesa             2023-01-06   528  
ffc50b2d382879 Abel Vesa             2023-01-06   529  		/* First part of the "SPU secure shared memory" region */
ffc50b2d382879 Abel Vesa             2023-01-06   530  		spu_tz_shared_mem: spu-tz-shared-region@9b280000 {
ffc50b2d382879 Abel Vesa             2023-01-06   531  			reg = <0 0x9b280000 0 0x60000>;
ffc50b2d382879 Abel Vesa             2023-01-06   532  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   533  		};
ffc50b2d382879 Abel Vesa             2023-01-06   534  
ffc50b2d382879 Abel Vesa             2023-01-06   535  		/* Second part of the "SPU secure shared memory" region */
ffc50b2d382879 Abel Vesa             2023-01-06   536  		spu_modem_shared_mem: spu-modem-shared-region@9b2e0000 {
ffc50b2d382879 Abel Vesa             2023-01-06   537  			reg = <0 0x9b2e0000 0 0x20000>;
ffc50b2d382879 Abel Vesa             2023-01-06   538  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   539  		};
ffc50b2d382879 Abel Vesa             2023-01-06   540  
ffc50b2d382879 Abel Vesa             2023-01-06   541  		camera_mem: camera-region@9b300000 {
ffc50b2d382879 Abel Vesa             2023-01-06   542  			reg = <0 0x9b300000 0 0x800000>;
ffc50b2d382879 Abel Vesa             2023-01-06   543  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   544  		};
ffc50b2d382879 Abel Vesa             2023-01-06   545  
ffc50b2d382879 Abel Vesa             2023-01-06   546  		video_mem: video-region@9bb00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   547  			reg = <0 0x9bb00000 0 0x700000>;
ffc50b2d382879 Abel Vesa             2023-01-06   548  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   549  		};
ffc50b2d382879 Abel Vesa             2023-01-06   550  
ffc50b2d382879 Abel Vesa             2023-01-06   551  		cvp_mem: cvp-region@9c200000 {
ffc50b2d382879 Abel Vesa             2023-01-06   552  			reg = <0 0x9c200000 0 0x700000>;
ffc50b2d382879 Abel Vesa             2023-01-06   553  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   554  		};
ffc50b2d382879 Abel Vesa             2023-01-06   555  
ffc50b2d382879 Abel Vesa             2023-01-06   556  		cdsp_mem: cdsp-region@9c900000 {
ffc50b2d382879 Abel Vesa             2023-01-06   557  			reg = <0 0x9c900000 0 0x2000000>;
ffc50b2d382879 Abel Vesa             2023-01-06   558  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   559  		};
ffc50b2d382879 Abel Vesa             2023-01-06   560  
ffc50b2d382879 Abel Vesa             2023-01-06   561  		q6_cdsp_dtb_mem: q6-cdsp-dtb-region@9e900000 {
ffc50b2d382879 Abel Vesa             2023-01-06   562  			reg = <0 0x9e900000 0 0x80000>;
ffc50b2d382879 Abel Vesa             2023-01-06   563  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   564  		};
ffc50b2d382879 Abel Vesa             2023-01-06   565  
ffc50b2d382879 Abel Vesa             2023-01-06   566  		q6_adsp_dtb_mem: q6-adsp-dtb-region@9e980000 {
ffc50b2d382879 Abel Vesa             2023-01-06   567  			reg = <0 0x9e980000 0 0x80000>;
ffc50b2d382879 Abel Vesa             2023-01-06   568  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   569  		};
ffc50b2d382879 Abel Vesa             2023-01-06   570  
ffc50b2d382879 Abel Vesa             2023-01-06   571  		adspslpi_mem: adspslpi-region@9ea00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   572  			reg = <0 0x9ea00000 0 0x4080000>;
ffc50b2d382879 Abel Vesa             2023-01-06   573  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   574  		};
ffc50b2d382879 Abel Vesa             2023-01-06   575  
ffc50b2d382879 Abel Vesa             2023-01-06   576  		/* uefi region can be reused by apps */
ffc50b2d382879 Abel Vesa             2023-01-06   577  
ffc50b2d382879 Abel Vesa             2023-01-06   578  		/* Linux kernel image is loaded at 0xa8000000 */
ffc50b2d382879 Abel Vesa             2023-01-06   579  
d0c061e366ed55 Neil Armstrong        2023-01-18   580  		rmtfs_mem: rmtfs-region@d4a80000 {
d0c061e366ed55 Neil Armstrong        2023-01-18   581  			compatible = "qcom,rmtfs-mem";
d0c061e366ed55 Neil Armstrong        2023-01-18   582  			reg = <0x0 0xd4a80000 0x0 0x280000>;
d0c061e366ed55 Neil Armstrong        2023-01-18   583  			no-map;
d0c061e366ed55 Neil Armstrong        2023-01-18   584  
d0c061e366ed55 Neil Armstrong        2023-01-18   585  			qcom,client-id = <1>;
018c949b32df9f Luca Weiss            2023-08-18   586  			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
d0c061e366ed55 Neil Armstrong        2023-01-18   587  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   588  
ffc50b2d382879 Abel Vesa             2023-01-06   589  		mpss_dsm_mem: mpss-dsm-region@d4d00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   590  			reg = <0 0xd4d00000 0 0x3300000>;
ffc50b2d382879 Abel Vesa             2023-01-06   591  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   592  		};
ffc50b2d382879 Abel Vesa             2023-01-06   593  
ffc50b2d382879 Abel Vesa             2023-01-06   594  		tz_reserved_mem: tz-reserved-region@d8000000 {
ffc50b2d382879 Abel Vesa             2023-01-06   595  			reg = <0 0xd8000000 0 0x100000>;
ffc50b2d382879 Abel Vesa             2023-01-06   596  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   597  		};
ffc50b2d382879 Abel Vesa             2023-01-06   598  
ffc50b2d382879 Abel Vesa             2023-01-06   599  		cpucp_fw_mem: cpucp-fw-region@d8140000 {
ffc50b2d382879 Abel Vesa             2023-01-06   600  			reg = <0 0xd8140000 0 0x1c0000>;
ffc50b2d382879 Abel Vesa             2023-01-06   601  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   602  		};
ffc50b2d382879 Abel Vesa             2023-01-06   603  
ffc50b2d382879 Abel Vesa             2023-01-06   604  		qtee_mem: qtee-region@d8300000 {
ffc50b2d382879 Abel Vesa             2023-01-06   605  			reg = <0 0xd8300000 0 0x500000>;
ffc50b2d382879 Abel Vesa             2023-01-06   606  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   607  		};
ffc50b2d382879 Abel Vesa             2023-01-06   608  
ffc50b2d382879 Abel Vesa             2023-01-06   609  		ta_mem: ta-region@d8800000 {
ffc50b2d382879 Abel Vesa             2023-01-06   610  			reg = <0 0xd8800000 0 0x8a00000>;
ffc50b2d382879 Abel Vesa             2023-01-06   611  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   612  		};
ffc50b2d382879 Abel Vesa             2023-01-06   613  
ffc50b2d382879 Abel Vesa             2023-01-06   614  		tz_tags_mem: tz-tags-region@e1200000 {
ffc50b2d382879 Abel Vesa             2023-01-06   615  			reg = <0 0xe1200000 0 0x2740000>;
ffc50b2d382879 Abel Vesa             2023-01-06   616  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   617  		};
ffc50b2d382879 Abel Vesa             2023-01-06   618  
ffc50b2d382879 Abel Vesa             2023-01-06   619  		hwfence_shbuf: hwfence-shbuf-region@e6440000 {
ffc50b2d382879 Abel Vesa             2023-01-06   620  			reg = <0 0xe6440000 0 0x279000>;
ffc50b2d382879 Abel Vesa             2023-01-06   621  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   622  		};
ffc50b2d382879 Abel Vesa             2023-01-06   623  
ffc50b2d382879 Abel Vesa             2023-01-06   624  		trust_ui_vm_mem: trust-ui-vm-region@f3600000 {
ffc50b2d382879 Abel Vesa             2023-01-06   625  			reg = <0 0xf3600000 0 0x4aee000>;
ffc50b2d382879 Abel Vesa             2023-01-06   626  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   627  		};
ffc50b2d382879 Abel Vesa             2023-01-06   628  
ffc50b2d382879 Abel Vesa             2023-01-06   629  		trust_ui_vm_dump: trust-ui-vm-dump-region@f80ee000 {
ffc50b2d382879 Abel Vesa             2023-01-06   630  			reg = <0 0xf80ee000 0 0x1000>;
ffc50b2d382879 Abel Vesa             2023-01-06   631  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   632  		};
ffc50b2d382879 Abel Vesa             2023-01-06   633  
ffc50b2d382879 Abel Vesa             2023-01-06   634  		trust_ui_vm_qrtr: trust-ui-vm-qrt-region@f80ef000 {
ffc50b2d382879 Abel Vesa             2023-01-06   635  			reg = <0 0xf80ef000 0 0x9000>;
ffc50b2d382879 Abel Vesa             2023-01-06   636  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   637  		};
ffc50b2d382879 Abel Vesa             2023-01-06   638  
ffc50b2d382879 Abel Vesa             2023-01-06   639  		trust_ui_vm_vblk0_ring: trust-ui-vm-vblk0-ring-region@f80f8000 {
ffc50b2d382879 Abel Vesa             2023-01-06   640  			reg = <0 0xf80f8000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   641  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   642  		};
ffc50b2d382879 Abel Vesa             2023-01-06   643  
ffc50b2d382879 Abel Vesa             2023-01-06   644  		trust_ui_vm_vblk1_ring: trust-ui-vm-vblk1-ring-region@f80fc000 {
ffc50b2d382879 Abel Vesa             2023-01-06   645  			reg = <0 0xf80fc000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   646  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   647  		};
ffc50b2d382879 Abel Vesa             2023-01-06   648  
ffc50b2d382879 Abel Vesa             2023-01-06   649  		trust_ui_vm_swiotlb: trust-ui-vm-swiotlb-region@f8100000 {
ffc50b2d382879 Abel Vesa             2023-01-06   650  			reg = <0 0xf8100000 0 0x100000>;
ffc50b2d382879 Abel Vesa             2023-01-06   651  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   652  		};
ffc50b2d382879 Abel Vesa             2023-01-06   653  
ffc50b2d382879 Abel Vesa             2023-01-06   654  		oem_vm_mem: oem-vm-region@f8400000 {
ffc50b2d382879 Abel Vesa             2023-01-06   655  			reg = <0 0xf8400000 0 0x4800000>;
ffc50b2d382879 Abel Vesa             2023-01-06   656  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   657  		};
ffc50b2d382879 Abel Vesa             2023-01-06   658  
ffc50b2d382879 Abel Vesa             2023-01-06   659  		oem_vm_vblk0_ring: oem-vm-vblk0-ring-region@fcc00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   660  			reg = <0 0xfcc00000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   661  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   662  		};
ffc50b2d382879 Abel Vesa             2023-01-06   663  
ffc50b2d382879 Abel Vesa             2023-01-06   664  		oem_vm_swiotlb: oem-vm-swiotlb-region@fcc04000 {
ffc50b2d382879 Abel Vesa             2023-01-06   665  			reg = <0 0xfcc04000 0 0x100000>;
ffc50b2d382879 Abel Vesa             2023-01-06   666  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   667  		};
ffc50b2d382879 Abel Vesa             2023-01-06   668  
ffc50b2d382879 Abel Vesa             2023-01-06   669  		hyp_ext_tags_mem: hyp-ext-tags-region@fce00000 {
ffc50b2d382879 Abel Vesa             2023-01-06   670  			reg = <0 0xfce00000 0 0x2900000>;
ffc50b2d382879 Abel Vesa             2023-01-06   671  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   672  		};
ffc50b2d382879 Abel Vesa             2023-01-06   673  
ffc50b2d382879 Abel Vesa             2023-01-06   674  		hyp_ext_reserved_mem: hyp-ext-reserved-region@ff700000 {
ffc50b2d382879 Abel Vesa             2023-01-06   675  			reg = <0 0xff700000 0 0x100000>;
ffc50b2d382879 Abel Vesa             2023-01-06   676  			no-map;
ffc50b2d382879 Abel Vesa             2023-01-06   677  		};
ffc50b2d382879 Abel Vesa             2023-01-06   678  	};
ffc50b2d382879 Abel Vesa             2023-01-06   679  
d0c061e366ed55 Neil Armstrong        2023-01-18   680  	smp2p-adsp {
d0c061e366ed55 Neil Armstrong        2023-01-18   681  		compatible = "qcom,smp2p";
d0c061e366ed55 Neil Armstrong        2023-01-18   682  		qcom,smem = <443>, <429>;
d0c061e366ed55 Neil Armstrong        2023-01-18   683  		interrupts-extended = <&ipcc IPCC_CLIENT_LPASS
d0c061e366ed55 Neil Armstrong        2023-01-18   684  					     IPCC_MPROC_SIGNAL_SMP2P
d0c061e366ed55 Neil Armstrong        2023-01-18   685  					     IRQ_TYPE_EDGE_RISING>;
d0c061e366ed55 Neil Armstrong        2023-01-18   686  		mboxes = <&ipcc IPCC_CLIENT_LPASS
d0c061e366ed55 Neil Armstrong        2023-01-18   687  				IPCC_MPROC_SIGNAL_SMP2P>;
d0c061e366ed55 Neil Armstrong        2023-01-18   688  
d0c061e366ed55 Neil Armstrong        2023-01-18   689  		qcom,local-pid = <0>;
d0c061e366ed55 Neil Armstrong        2023-01-18   690  		qcom,remote-pid = <2>;
d0c061e366ed55 Neil Armstrong        2023-01-18   691  
d0c061e366ed55 Neil Armstrong        2023-01-18   692  		smp2p_adsp_out: master-kernel {
d0c061e366ed55 Neil Armstrong        2023-01-18   693  			qcom,entry-name = "master-kernel";
d0c061e366ed55 Neil Armstrong        2023-01-18   694  			#qcom,smem-state-cells = <1>;
d0c061e366ed55 Neil Armstrong        2023-01-18   695  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   696  
d0c061e366ed55 Neil Armstrong        2023-01-18   697  		smp2p_adsp_in: slave-kernel {
d0c061e366ed55 Neil Armstrong        2023-01-18   698  			qcom,entry-name = "slave-kernel";
d0c061e366ed55 Neil Armstrong        2023-01-18   699  			interrupt-controller;
d0c061e366ed55 Neil Armstrong        2023-01-18   700  			#interrupt-cells = <2>;
d0c061e366ed55 Neil Armstrong        2023-01-18   701  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   702  	};
d0c061e366ed55 Neil Armstrong        2023-01-18   703  
d0c061e366ed55 Neil Armstrong        2023-01-18   704  	smp2p-cdsp {
d0c061e366ed55 Neil Armstrong        2023-01-18   705  		compatible = "qcom,smp2p";
d0c061e366ed55 Neil Armstrong        2023-01-18   706  		qcom,smem = <94>, <432>;
d0c061e366ed55 Neil Armstrong        2023-01-18   707  		interrupts-extended = <&ipcc IPCC_CLIENT_CDSP
d0c061e366ed55 Neil Armstrong        2023-01-18   708  					     IPCC_MPROC_SIGNAL_SMP2P
d0c061e366ed55 Neil Armstrong        2023-01-18   709  					     IRQ_TYPE_EDGE_RISING>;
d0c061e366ed55 Neil Armstrong        2023-01-18   710  		mboxes = <&ipcc IPCC_CLIENT_CDSP
d0c061e366ed55 Neil Armstrong        2023-01-18   711  				IPCC_MPROC_SIGNAL_SMP2P>;
d0c061e366ed55 Neil Armstrong        2023-01-18   712  
d0c061e366ed55 Neil Armstrong        2023-01-18   713  		qcom,local-pid = <0>;
d0c061e366ed55 Neil Armstrong        2023-01-18   714  		qcom,remote-pid = <5>;
d0c061e366ed55 Neil Armstrong        2023-01-18   715  
d0c061e366ed55 Neil Armstrong        2023-01-18   716  		smp2p_cdsp_out: master-kernel {
d0c061e366ed55 Neil Armstrong        2023-01-18   717  			qcom,entry-name = "master-kernel";
d0c061e366ed55 Neil Armstrong        2023-01-18   718  			#qcom,smem-state-cells = <1>;
d0c061e366ed55 Neil Armstrong        2023-01-18   719  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   720  
d0c061e366ed55 Neil Armstrong        2023-01-18   721  		smp2p_cdsp_in: slave-kernel {
d0c061e366ed55 Neil Armstrong        2023-01-18   722  			qcom,entry-name = "slave-kernel";
d0c061e366ed55 Neil Armstrong        2023-01-18   723  			interrupt-controller;
d0c061e366ed55 Neil Armstrong        2023-01-18   724  			#interrupt-cells = <2>;
d0c061e366ed55 Neil Armstrong        2023-01-18   725  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   726  	};
d0c061e366ed55 Neil Armstrong        2023-01-18   727  
d0c061e366ed55 Neil Armstrong        2023-01-18   728  	smp2p-modem {
d0c061e366ed55 Neil Armstrong        2023-01-18   729  		compatible = "qcom,smp2p";
d0c061e366ed55 Neil Armstrong        2023-01-18   730  		qcom,smem = <435>, <428>;
d0c061e366ed55 Neil Armstrong        2023-01-18   731  		interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
d0c061e366ed55 Neil Armstrong        2023-01-18   732  					     IPCC_MPROC_SIGNAL_SMP2P
d0c061e366ed55 Neil Armstrong        2023-01-18   733  					     IRQ_TYPE_EDGE_RISING>;
d0c061e366ed55 Neil Armstrong        2023-01-18   734  		mboxes = <&ipcc IPCC_CLIENT_MPSS
d0c061e366ed55 Neil Armstrong        2023-01-18   735  				IPCC_MPROC_SIGNAL_SMP2P>;
d0c061e366ed55 Neil Armstrong        2023-01-18   736  
d0c061e366ed55 Neil Armstrong        2023-01-18   737  		qcom,local-pid = <0>;
d0c061e366ed55 Neil Armstrong        2023-01-18   738  		qcom,remote-pid = <1>;
d0c061e366ed55 Neil Armstrong        2023-01-18   739  
d0c061e366ed55 Neil Armstrong        2023-01-18   740  		smp2p_modem_out: master-kernel {
d0c061e366ed55 Neil Armstrong        2023-01-18   741  			qcom,entry-name = "master-kernel";
d0c061e366ed55 Neil Armstrong        2023-01-18   742  			#qcom,smem-state-cells = <1>;
d0c061e366ed55 Neil Armstrong        2023-01-18   743  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   744  
d0c061e366ed55 Neil Armstrong        2023-01-18   745  		smp2p_modem_in: slave-kernel {
d0c061e366ed55 Neil Armstrong        2023-01-18   746  			qcom,entry-name = "slave-kernel";
d0c061e366ed55 Neil Armstrong        2023-01-18   747  			interrupt-controller;
d0c061e366ed55 Neil Armstrong        2023-01-18   748  			#interrupt-cells = <2>;
d0c061e366ed55 Neil Armstrong        2023-01-18   749  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   750  
d0c061e366ed55 Neil Armstrong        2023-01-18   751  		ipa_smp2p_out: ipa-ap-to-modem {
d0c061e366ed55 Neil Armstrong        2023-01-18   752  			qcom,entry-name = "ipa";
d0c061e366ed55 Neil Armstrong        2023-01-18   753  			#qcom,smem-state-cells = <1>;
d0c061e366ed55 Neil Armstrong        2023-01-18   754  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   755  
d0c061e366ed55 Neil Armstrong        2023-01-18   756  		ipa_smp2p_in: ipa-modem-to-ap {
d0c061e366ed55 Neil Armstrong        2023-01-18   757  			qcom,entry-name = "ipa";
d0c061e366ed55 Neil Armstrong        2023-01-18   758  			interrupt-controller;
d0c061e366ed55 Neil Armstrong        2023-01-18   759  			#interrupt-cells = <2>;
d0c061e366ed55 Neil Armstrong        2023-01-18   760  		};
d0c061e366ed55 Neil Armstrong        2023-01-18   761  	};
d0c061e366ed55 Neil Armstrong        2023-01-18   762  
ffc50b2d382879 Abel Vesa             2023-01-06   763  	soc: soc@0 {
ffc50b2d382879 Abel Vesa             2023-01-06   764  		compatible = "simple-bus";
ffc50b2d382879 Abel Vesa             2023-01-06   765  		ranges = <0 0 0 0 0x10 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   766  		dma-ranges = <0 0 0 0 0x10 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   767  
ffc50b2d382879 Abel Vesa             2023-01-06   768  		#address-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   769  		#size-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   770  
ffc50b2d382879 Abel Vesa             2023-01-06   771  		gcc: clock-controller@100000 {
ffc50b2d382879 Abel Vesa             2023-01-06   772  			compatible = "qcom,sm8550-gcc";
ffc50b2d382879 Abel Vesa             2023-01-06   773  			reg = <0 0x00100000 0 0x1f4200>;
ffc50b2d382879 Abel Vesa             2023-01-06   774  			#clock-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   775  			#reset-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   776  			#power-domain-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   777  			clocks = <&bi_tcxo_div2>, <&sleep_clk>,
7d1158c984d37e Abel Vesa             2023-01-19   778  				 <&pcie0_phy>,
7d1158c984d37e Abel Vesa             2023-01-19   779  				 <&pcie1_phy>,
7d1158c984d37e Abel Vesa             2023-01-19   780  				 <&pcie_1_phy_aux_clk>,
35cf1aaab169e0 Abel Vesa             2023-01-16   781  				 <&ufs_mem_phy 0>,
35cf1aaab169e0 Abel Vesa             2023-01-16   782  				 <&ufs_mem_phy 1>,
35cf1aaab169e0 Abel Vesa             2023-01-16   783  				 <&ufs_mem_phy 2>,
7f7e5c1b037fc3 Abel Vesa             2023-01-19   784  				 <&usb_dp_qmpphy QMP_USB43DP_USB3_PIPE_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   785  		};
ffc50b2d382879 Abel Vesa             2023-01-06   786  
ffc50b2d382879 Abel Vesa             2023-01-06   787  		ipcc: mailbox@408000 {
ffc50b2d382879 Abel Vesa             2023-01-06   788  			compatible = "qcom,sm8550-ipcc", "qcom,ipcc";
ffc50b2d382879 Abel Vesa             2023-01-06   789  			reg = <0 0x00408000 0 0x1000>;
ffc50b2d382879 Abel Vesa             2023-01-06   790  			interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   791  			interrupt-controller;
ffc50b2d382879 Abel Vesa             2023-01-06   792  			#interrupt-cells = <3>;
ffc50b2d382879 Abel Vesa             2023-01-06   793  			#mbox-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   794  		};
ffc50b2d382879 Abel Vesa             2023-01-06   795  
ffc50b2d382879 Abel Vesa             2023-01-06   796  		gpi_dma2: dma-controller@800000 {
ffc50b2d382879 Abel Vesa             2023-01-06   797  			compatible = "qcom,sm8550-gpi-dma", "qcom,sm6350-gpi-dma";
ffc50b2d382879 Abel Vesa             2023-01-06   798  			#dma-cells = <3>;
ffc50b2d382879 Abel Vesa             2023-01-06   799  			reg = <0 0x00800000 0 0x60000>;
ffc50b2d382879 Abel Vesa             2023-01-06   800  			interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   801  				     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   802  				     <GIC_SPI 590 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   803  				     <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   804  				     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   805  				     <GIC_SPI 593 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   806  				     <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   807  				     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   808  				     <GIC_SPI 596 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   809  				     <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   810  				     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06   811  				     <GIC_SPI 599 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   812  			dma-channels = <12>;
ffc50b2d382879 Abel Vesa             2023-01-06   813  			dma-channel-mask = <0x3e>;
ffc50b2d382879 Abel Vesa             2023-01-06   814  			iommus = <&apps_smmu 0x436 0>;
91fc74458d833d Konrad Dybcio         2024-02-12   815  			dma-coherent;
ffc50b2d382879 Abel Vesa             2023-01-06   816  			status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   817  		};
ffc50b2d382879 Abel Vesa             2023-01-06   818  
ffc50b2d382879 Abel Vesa             2023-01-06   819  		qupv3_id_1: geniqup@8c0000 {
ffc50b2d382879 Abel Vesa             2023-01-06   820  			compatible = "qcom,geni-se-qup";
ffc50b2d382879 Abel Vesa             2023-01-06   821  			reg = <0 0x008c0000 0 0x2000>;
ffc50b2d382879 Abel Vesa             2023-01-06   822  			ranges;
ffc50b2d382879 Abel Vesa             2023-01-06   823  			clock-names = "m-ahb", "s-ahb";
ffc50b2d382879 Abel Vesa             2023-01-06   824  			clocks = <&gcc GCC_QUPV3_WRAP_2_M_AHB_CLK>,
ffc50b2d382879 Abel Vesa             2023-01-06   825  				 <&gcc GCC_QUPV3_WRAP_2_S_AHB_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   826  			iommus = <&apps_smmu 0x423 0>;
91fc74458d833d Konrad Dybcio         2024-02-12   827  			dma-coherent;
ffc50b2d382879 Abel Vesa             2023-01-06   828  			#address-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   829  			#size-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06   830  			status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   831  
ffc50b2d382879 Abel Vesa             2023-01-06   832  			i2c8: i2c@880000 {
ffc50b2d382879 Abel Vesa             2023-01-06   833  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06   834  				reg = <0 0x00880000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   835  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   836  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   837  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   838  				pinctrl-0 = <&qup_i2c8_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06   839  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   840  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   841  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   842  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   843  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   844  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   845  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06   846  				dmas = <&gpi_dma2 0 0 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06   847  				       <&gpi_dma2 1 0 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06   848  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06   849  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   850  			};
ffc50b2d382879 Abel Vesa             2023-01-06   851  
ffc50b2d382879 Abel Vesa             2023-01-06   852  			spi8: spi@880000 {
ffc50b2d382879 Abel Vesa             2023-01-06   853  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06   854  				reg = <0 0x00880000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   855  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   856  				clocks = <&gcc GCC_QUPV3_WRAP2_S0_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   857  				interrupts = <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   858  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   859  				pinctrl-0 = <&qup_spi8_data_clk>, <&qup_spi8_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06   860  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   861  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   862  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   863  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06   864  				dmas = <&gpi_dma2 0 0 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06   865  				       <&gpi_dma2 1 0 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06   866  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06   867  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   868  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   869  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   870  			};
ffc50b2d382879 Abel Vesa             2023-01-06   871  
ffc50b2d382879 Abel Vesa             2023-01-06   872  			i2c9: i2c@884000 {
ffc50b2d382879 Abel Vesa             2023-01-06   873  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06   874  				reg = <0 0x00884000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   875  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   876  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   877  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   878  				pinctrl-0 = <&qup_i2c9_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06   879  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   880  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   881  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   882  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   883  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   884  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   885  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06   886  				dmas = <&gpi_dma2 0 1 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06   887  				       <&gpi_dma2 1 1 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06   888  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06   889  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   890  			};
ffc50b2d382879 Abel Vesa             2023-01-06   891  
ffc50b2d382879 Abel Vesa             2023-01-06   892  			spi9: spi@884000 {
ffc50b2d382879 Abel Vesa             2023-01-06   893  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06   894  				reg = <0 0x00884000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   895  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   896  				clocks = <&gcc GCC_QUPV3_WRAP2_S1_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   897  				interrupts = <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   898  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   899  				pinctrl-0 = <&qup_spi9_data_clk>, <&qup_spi9_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06   900  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   901  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   902  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   903  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06   904  				dmas = <&gpi_dma2 0 1 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06   905  				       <&gpi_dma2 1 1 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06   906  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06   907  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   908  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   909  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   910  			};
ffc50b2d382879 Abel Vesa             2023-01-06   911  
ffc50b2d382879 Abel Vesa             2023-01-06   912  			i2c10: i2c@888000 {
ffc50b2d382879 Abel Vesa             2023-01-06   913  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06   914  				reg = <0 0x00888000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   915  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   916  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   917  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   918  				pinctrl-0 = <&qup_i2c10_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06   919  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   920  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   921  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   922  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   923  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   924  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   925  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06   926  				dmas = <&gpi_dma2 0 2 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06   927  				       <&gpi_dma2 1 2 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06   928  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06   929  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   930  			};
ffc50b2d382879 Abel Vesa             2023-01-06   931  
ffc50b2d382879 Abel Vesa             2023-01-06   932  			spi10: spi@888000 {
ffc50b2d382879 Abel Vesa             2023-01-06   933  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06   934  				reg = <0 0x00888000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   935  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   936  				clocks = <&gcc GCC_QUPV3_WRAP2_S2_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   937  				interrupts = <GIC_SPI 584 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   938  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   939  				pinctrl-0 = <&qup_spi10_data_clk>, <&qup_spi10_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06   940  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   941  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   942  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   943  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06   944  				dmas = <&gpi_dma2 0 2 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06   945  				       <&gpi_dma2 1 2 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06   946  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06   947  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   948  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   949  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   950  			};
ffc50b2d382879 Abel Vesa             2023-01-06   951  
ffc50b2d382879 Abel Vesa             2023-01-06   952  			i2c11: i2c@88c000 {
ffc50b2d382879 Abel Vesa             2023-01-06   953  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06   954  				reg = <0 0x0088c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   955  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   956  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   957  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   958  				pinctrl-0 = <&qup_i2c11_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06   959  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   960  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   961  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   962  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   963  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   964  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   965  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06   966  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06   967  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06   968  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06   969  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   970  			};
ffc50b2d382879 Abel Vesa             2023-01-06   971  
ffc50b2d382879 Abel Vesa             2023-01-06   972  			spi11: spi@88c000 {
ffc50b2d382879 Abel Vesa             2023-01-06   973  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06   974  				reg = <0 0x0088c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   975  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   976  				clocks = <&gcc GCC_QUPV3_WRAP2_S3_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   977  				interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06   978  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   979  				pinctrl-0 = <&qup_spi11_data_clk>, <&qup_spi11_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06   980  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   981  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06   982  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06   983  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06   984  				dmas = <&gpi_dma2 0 3 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06   985  				       <&gpi_dma2 1 3 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06   986  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06   987  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06   988  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06   989  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06   990  			};
ffc50b2d382879 Abel Vesa             2023-01-06   991  
ffc50b2d382879 Abel Vesa             2023-01-06   992  			i2c12: i2c@890000 {
ffc50b2d382879 Abel Vesa             2023-01-06   993  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06   994  				reg = <0 0x00890000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06   995  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06   996  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06   997  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06   998  				pinctrl-0 = <&qup_i2c12_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06   999  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1000  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1001  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1002  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1003  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1004  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1005  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1006  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1007  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1008  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1009  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1010  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1011  
ffc50b2d382879 Abel Vesa             2023-01-06  1012  			spi12: spi@890000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1013  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1014  				reg = <0 0x00890000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1015  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1016  				clocks = <&gcc GCC_QUPV3_WRAP2_S4_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1017  				interrupts = <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1018  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1019  				pinctrl-0 = <&qup_spi12_data_clk>, <&qup_spi12_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06  1020  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1021  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1022  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1023  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1024  				dmas = <&gpi_dma2 0 4 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1025  				       <&gpi_dma2 1 4 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1026  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1027  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1028  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1029  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1030  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1031  
ffc50b2d382879 Abel Vesa             2023-01-06  1032  			i2c13: i2c@894000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1033  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1034  				reg = <0 0x00894000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1035  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1036  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1037  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1038  				pinctrl-0 = <&qup_i2c13_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1039  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1040  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1041  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1042  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1043  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1044  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1045  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1046  				dmas = <&gpi_dma2 0 5 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1047  				       <&gpi_dma2 1 5 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1048  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1049  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1050  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1051  
ffc50b2d382879 Abel Vesa             2023-01-06  1052  			spi13: spi@894000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1053  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1054  				reg = <0 0x00894000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1055  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1056  				clocks = <&gcc GCC_QUPV3_WRAP2_S5_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1057  				interrupts = <GIC_SPI 587 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1058  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1059  				pinctrl-0 = <&qup_spi13_data_clk>, <&qup_spi13_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06  1060  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1061  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1062  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1063  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1064  				dmas = <&gpi_dma2 0 5 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1065  				       <&gpi_dma2 1 5 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1066  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1067  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1068  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1069  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1070  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1071  
75cac709029897 Neil Armstrong        2023-09-11  1072  			uart14: serial@898000 {
75cac709029897 Neil Armstrong        2023-09-11  1073  				compatible = "qcom,geni-uart";
75cac709029897 Neil Armstrong        2023-09-11  1074  				reg = <0 0x898000 0 0x4000>;
75cac709029897 Neil Armstrong        2023-09-11  1075  				clock-names = "se";
75cac709029897 Neil Armstrong        2023-09-11  1076  				clocks = <&gcc GCC_QUPV3_WRAP2_S6_CLK>;
75cac709029897 Neil Armstrong        2023-09-11  1077  				pinctrl-names = "default";
75cac709029897 Neil Armstrong        2023-09-11  1078  				pinctrl-0 = <&qup_uart14_default>, <&qup_uart14_cts_rts>;
75cac709029897 Neil Armstrong        2023-09-11  1079  				interrupts = <GIC_SPI 461 IRQ_TYPE_LEVEL_HIGH>;
75cac709029897 Neil Armstrong        2023-09-11  1080  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
75cac709029897 Neil Armstrong        2023-09-11  1081  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>;
75cac709029897 Neil Armstrong        2023-09-11  1082  				interconnect-names = "qup-core", "qup-config";
75cac709029897 Neil Armstrong        2023-09-11  1083  				status = "disabled";
75cac709029897 Neil Armstrong        2023-09-11  1084  			};
75cac709029897 Neil Armstrong        2023-09-11  1085  
ffc50b2d382879 Abel Vesa             2023-01-06  1086  			i2c15: i2c@89c000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1087  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1088  				reg = <0 0x0089c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1089  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1090  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1091  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1092  				pinctrl-0 = <&qup_i2c15_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1093  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1094  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1095  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1096  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1097  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1098  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1099  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1100  				dmas = <&gpi_dma2 0 7 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1101  				       <&gpi_dma2 1 7 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1102  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1103  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1104  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1105  
ffc50b2d382879 Abel Vesa             2023-01-06  1106  			spi15: spi@89c000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1107  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1108  				reg = <0 0x0089c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1109  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1110  				clocks = <&gcc GCC_QUPV3_WRAP2_S7_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1111  				interrupts = <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1112  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1113  				pinctrl-0 = <&qup_spi15_data_clk>, <&qup_spi15_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06  1114  				interconnects = <&clk_virt MASTER_QUP_CORE_2 0 &clk_virt SLAVE_QUP_CORE_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1115  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_2 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1116  						<&aggre2_noc MASTER_QUP_2 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1117  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1118  				dmas = <&gpi_dma2 0 7 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1119  				       <&gpi_dma2 1 7 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1120  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1121  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1122  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1123  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1124  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1125  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1126  
377972ac743f54 Neil Armstrong        2022-11-16  1127  		i2c_master_hub_0: geniqup@9c0000 {
377972ac743f54 Neil Armstrong        2022-11-16  1128  			compatible = "qcom,geni-se-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1129  			reg = <0x0 0x009c0000 0x0 0x2000>;
377972ac743f54 Neil Armstrong        2022-11-16  1130  			clock-names = "s-ahb";
377972ac743f54 Neil Armstrong        2022-11-16  1131  			clocks = <&gcc GCC_QUPV3_I2C_S_AHB_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1132  			#address-cells = <2>;
377972ac743f54 Neil Armstrong        2022-11-16  1133  			#size-cells = <2>;
377972ac743f54 Neil Armstrong        2022-11-16  1134  			ranges;
377972ac743f54 Neil Armstrong        2022-11-16  1135  			status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1136  
377972ac743f54 Neil Armstrong        2022-11-16  1137  			i2c_hub_0: i2c@980000 {
377972ac743f54 Neil Armstrong        2022-11-16  1138  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1139  				reg = <0x0 0x00980000 0x0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1140  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1141  				clocks = <&gcc GCC_QUPV3_I2C_S0_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1142  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1143  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1144  				pinctrl-0 = <&hub_i2c0_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1145  				interrupts = <GIC_SPI 464 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1146  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1147  				#size-cells = <0>;
377972ac743f54 Neil Armstrong        2022-11-16  1148  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
377972ac743f54 Neil Armstrong        2022-11-16  1149  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
377972ac743f54 Neil Armstrong        2022-11-16  1150  				interconnect-names = "qup-core", "qup-config";
377972ac743f54 Neil Armstrong        2022-11-16  1151  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1152  			};
377972ac743f54 Neil Armstrong        2022-11-16  1153  
377972ac743f54 Neil Armstrong        2022-11-16  1154  			i2c_hub_1: i2c@984000 {
377972ac743f54 Neil Armstrong        2022-11-16  1155  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1156  				reg = <0x0 0x00984000 0x0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1157  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1158  				clocks = <&gcc GCC_QUPV3_I2C_S1_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1159  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1160  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1161  				pinctrl-0 = <&hub_i2c1_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1162  				interrupts = <GIC_SPI 465 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1163  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1164  				#size-cells = <0>;
377972ac743f54 Neil Armstrong        2022-11-16  1165  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
377972ac743f54 Neil Armstrong        2022-11-16  1166  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
377972ac743f54 Neil Armstrong        2022-11-16  1167  				interconnect-names = "qup-core", "qup-config";
377972ac743f54 Neil Armstrong        2022-11-16  1168  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1169  			};
377972ac743f54 Neil Armstrong        2022-11-16  1170  
377972ac743f54 Neil Armstrong        2022-11-16  1171  			i2c_hub_2: i2c@988000 {
377972ac743f54 Neil Armstrong        2022-11-16  1172  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1173  				reg = <0x0 0x00988000 0x0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1174  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1175  				clocks = <&gcc GCC_QUPV3_I2C_S2_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1176  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1177  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1178  				pinctrl-0 = <&hub_i2c2_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1179  				interrupts = <GIC_SPI 466 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1180  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1181  				#size-cells = <0>;
377972ac743f54 Neil Armstrong        2022-11-16  1182  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
377972ac743f54 Neil Armstrong        2022-11-16  1183  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
377972ac743f54 Neil Armstrong        2022-11-16  1184  				interconnect-names = "qup-core", "qup-config";
377972ac743f54 Neil Armstrong        2022-11-16  1185  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1186  			};
377972ac743f54 Neil Armstrong        2022-11-16  1187  
377972ac743f54 Neil Armstrong        2022-11-16  1188  			i2c_hub_3: i2c@98c000 {
377972ac743f54 Neil Armstrong        2022-11-16  1189  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1190  				reg = <0x0 0x0098c000 0x0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1191  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1192  				clocks = <&gcc GCC_QUPV3_I2C_S3_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1193  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1194  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1195  				pinctrl-0 = <&hub_i2c3_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1196  				interrupts = <GIC_SPI 467 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1197  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1198  				#size-cells = <0>;
377972ac743f54 Neil Armstrong        2022-11-16  1199  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
377972ac743f54 Neil Armstrong        2022-11-16  1200  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
377972ac743f54 Neil Armstrong        2022-11-16  1201  				interconnect-names = "qup-core", "qup-config";
377972ac743f54 Neil Armstrong        2022-11-16  1202  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1203  			};
377972ac743f54 Neil Armstrong        2022-11-16  1204  
377972ac743f54 Neil Armstrong        2022-11-16  1205  			i2c_hub_4: i2c@990000 {
377972ac743f54 Neil Armstrong        2022-11-16  1206  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1207  				reg = <0x0 0x00990000 0x0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1208  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1209  				clocks = <&gcc GCC_QUPV3_I2C_S4_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1210  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1211  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1212  				pinctrl-0 = <&hub_i2c4_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1213  				interrupts = <GIC_SPI 468 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1214  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1215  				#size-cells = <0>;
377972ac743f54 Neil Armstrong        2022-11-16  1216  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
377972ac743f54 Neil Armstrong        2022-11-16  1217  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
377972ac743f54 Neil Armstrong        2022-11-16  1218  				interconnect-names = "qup-core", "qup-config";
377972ac743f54 Neil Armstrong        2022-11-16  1219  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1220  			};
377972ac743f54 Neil Armstrong        2022-11-16  1221  
377972ac743f54 Neil Armstrong        2022-11-16  1222  			i2c_hub_5: i2c@994000 {
377972ac743f54 Neil Armstrong        2022-11-16  1223  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1224  				reg = <0 0x00994000 0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1225  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1226  				clocks = <&gcc GCC_QUPV3_I2C_S5_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1227  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1228  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1229  				pinctrl-0 = <&hub_i2c5_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1230  				interrupts = <GIC_SPI 469 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1231  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1232  				#size-cells = <0>;
377972ac743f54 Neil Armstrong        2022-11-16  1233  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
377972ac743f54 Neil Armstrong        2022-11-16  1234  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
377972ac743f54 Neil Armstrong        2022-11-16  1235  				interconnect-names = "qup-core", "qup-config";
377972ac743f54 Neil Armstrong        2022-11-16  1236  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1237  			};
377972ac743f54 Neil Armstrong        2022-11-16  1238  
377972ac743f54 Neil Armstrong        2022-11-16  1239  			i2c_hub_6: i2c@998000 {
377972ac743f54 Neil Armstrong        2022-11-16  1240  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1241  				reg = <0 0x00998000 0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1242  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1243  				clocks = <&gcc GCC_QUPV3_I2C_S6_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1244  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1245  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1246  				pinctrl-0 = <&hub_i2c6_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1247  				interrupts = <GIC_SPI 470 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1248  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1249  				#size-cells = <0>;
377972ac743f54 Neil Armstrong        2022-11-16  1250  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
377972ac743f54 Neil Armstrong        2022-11-16  1251  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
377972ac743f54 Neil Armstrong        2022-11-16  1252  				interconnect-names = "qup-core", "qup-config";
377972ac743f54 Neil Armstrong        2022-11-16  1253  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1254  			};
377972ac743f54 Neil Armstrong        2022-11-16  1255  
377972ac743f54 Neil Armstrong        2022-11-16  1256  			i2c_hub_7: i2c@99c000 {
377972ac743f54 Neil Armstrong        2022-11-16  1257  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1258  				reg = <0 0x0099c000 0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1259  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1260  				clocks = <&gcc GCC_QUPV3_I2C_S7_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1261  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1262  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1263  				pinctrl-0 = <&hub_i2c7_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1264  				interrupts = <GIC_SPI 471 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1265  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1266  				#size-cells = <0>;
377972ac743f54 Neil Armstrong        2022-11-16  1267  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
377972ac743f54 Neil Armstrong        2022-11-16  1268  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
377972ac743f54 Neil Armstrong        2022-11-16  1269  				interconnect-names = "qup-core", "qup-config";
377972ac743f54 Neil Armstrong        2022-11-16  1270  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1271  			};
377972ac743f54 Neil Armstrong        2022-11-16  1272  
377972ac743f54 Neil Armstrong        2022-11-16  1273  			i2c_hub_8: i2c@9a0000 {
377972ac743f54 Neil Armstrong        2022-11-16  1274  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1275  				reg = <0 0x009a0000 0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1276  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1277  				clocks = <&gcc GCC_QUPV3_I2C_S8_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1278  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1279  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1280  				pinctrl-0 = <&hub_i2c8_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1281  				interrupts = <GIC_SPI 472 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1282  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1283  				#size-cells = <0>;
377972ac743f54 Neil Armstrong        2022-11-16  1284  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
377972ac743f54 Neil Armstrong        2022-11-16  1285  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
377972ac743f54 Neil Armstrong        2022-11-16  1286  				interconnect-names = "qup-core", "qup-config";
377972ac743f54 Neil Armstrong        2022-11-16  1287  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1288  			};
377972ac743f54 Neil Armstrong        2022-11-16  1289  
377972ac743f54 Neil Armstrong        2022-11-16  1290  			i2c_hub_9: i2c@9a4000 {
377972ac743f54 Neil Armstrong        2022-11-16  1291  				compatible = "qcom,geni-i2c-master-hub";
377972ac743f54 Neil Armstrong        2022-11-16  1292  				reg = <0 0x009a4000 0 0x4000>;
377972ac743f54 Neil Armstrong        2022-11-16  1293  				clock-names = "se", "core";
377972ac743f54 Neil Armstrong        2022-11-16  1294  				clocks = <&gcc GCC_QUPV3_I2C_S9_CLK>,
377972ac743f54 Neil Armstrong        2022-11-16  1295  					 <&gcc GCC_QUPV3_I2C_CORE_CLK>;
377972ac743f54 Neil Armstrong        2022-11-16  1296  				pinctrl-names = "default";
377972ac743f54 Neil Armstrong        2022-11-16  1297  				pinctrl-0 = <&hub_i2c9_data_clk>;
377972ac743f54 Neil Armstrong        2022-11-16  1298  				interrupts = <GIC_SPI 473 IRQ_TYPE_LEVEL_HIGH>;
377972ac743f54 Neil Armstrong        2022-11-16  1299  				#address-cells = <1>;
377972ac743f54 Neil Armstrong        2022-11-16  1300  				#size-cells = <0>;
377972ac743f54 Neil Armstrong        2022-11-16  1301  				interconnects = <&clk_virt MASTER_QUP_CORE_0 0 &clk_virt SLAVE_QUP_CORE_0 0>,
377972ac743f54 Neil Armstrong        2022-11-16  1302  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_I2C 0>;
377972ac743f54 Neil Armstrong        2022-11-16  1303  				interconnect-names = "qup-core", "qup-config";
377972ac743f54 Neil Armstrong        2022-11-16  1304  				status = "disabled";
377972ac743f54 Neil Armstrong        2022-11-16  1305  			};
377972ac743f54 Neil Armstrong        2022-11-16  1306  		};
377972ac743f54 Neil Armstrong        2022-11-16  1307  
ffc50b2d382879 Abel Vesa             2023-01-06  1308  		gpi_dma1: dma-controller@a00000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1309  			compatible = "qcom,sm8550-gpi-dma", "qcom,sm6350-gpi-dma";
ffc50b2d382879 Abel Vesa             2023-01-06  1310  			#dma-cells = <3>;
ffc50b2d382879 Abel Vesa             2023-01-06  1311  			reg = <0 0x00a00000 0 0x60000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1312  			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1313  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1314  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1315  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1316  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1317  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1318  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1319  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1320  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1321  				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1322  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  1323  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1324  			dma-channels = <12>;
ffc50b2d382879 Abel Vesa             2023-01-06  1325  			dma-channel-mask = <0x1e>;
ffc50b2d382879 Abel Vesa             2023-01-06  1326  			iommus = <&apps_smmu 0xb6 0>;
91fc74458d833d Konrad Dybcio         2024-02-12  1327  			dma-coherent;
ffc50b2d382879 Abel Vesa             2023-01-06  1328  			status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1329  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1330  
ffc50b2d382879 Abel Vesa             2023-01-06  1331  		qupv3_id_0: geniqup@ac0000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1332  			compatible = "qcom,geni-se-qup";
ffc50b2d382879 Abel Vesa             2023-01-06  1333  			reg = <0 0x00ac0000 0 0x2000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1334  			ranges;
ffc50b2d382879 Abel Vesa             2023-01-06  1335  			clock-names = "m-ahb", "s-ahb";
ffc50b2d382879 Abel Vesa             2023-01-06  1336  			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
ffc50b2d382879 Abel Vesa             2023-01-06  1337  				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1338  			iommus = <&apps_smmu 0xa3 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1339  			interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1340  			interconnect-names = "qup-core";
91fc74458d833d Konrad Dybcio         2024-02-12  1341  			dma-coherent;
ffc50b2d382879 Abel Vesa             2023-01-06  1342  			#address-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1343  			#size-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1344  			status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1345  
ffc50b2d382879 Abel Vesa             2023-01-06  1346  			i2c0: i2c@a80000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1347  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1348  				reg = <0 0x00a80000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1349  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1350  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1351  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1352  				pinctrl-0 = <&qup_i2c0_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1353  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1354  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1355  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1356  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1357  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1358  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1359  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1360  				dmas = <&gpi_dma1 0 0 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1361  				       <&gpi_dma1 1 0 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1362  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1363  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1364  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1365  
ffc50b2d382879 Abel Vesa             2023-01-06  1366  			spi0: spi@a80000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1367  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1368  				reg = <0 0x00a80000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1369  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1370  				clocks = <&gcc GCC_QUPV3_WRAP1_S0_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1371  				interrupts = <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1372  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1373  				pinctrl-0 = <&qup_spi0_data_clk>, <&qup_spi0_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06  1374  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1375  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1376  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1377  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1378  				dmas = <&gpi_dma1 0 0 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1379  				       <&gpi_dma1 1 0 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1380  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1381  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1382  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1383  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1384  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1385  
ffc50b2d382879 Abel Vesa             2023-01-06  1386  			i2c1: i2c@a84000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1387  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1388  				reg = <0 0x00a84000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1389  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1390  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1391  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1392  				pinctrl-0 = <&qup_i2c1_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1393  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1394  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1395  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1396  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1397  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1398  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1399  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1400  				dmas = <&gpi_dma1 0 1 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1401  				       <&gpi_dma1 1 1 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1402  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1403  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1404  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1405  
ffc50b2d382879 Abel Vesa             2023-01-06  1406  			spi1: spi@a84000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1407  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1408  				reg = <0 0x00a84000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1409  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1410  				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1411  				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1412  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1413  				pinctrl-0 = <&qup_spi1_data_clk>, <&qup_spi1_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06  1414  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1415  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1416  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1417  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1418  				dmas = <&gpi_dma1 0 1 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1419  				       <&gpi_dma1 1 1 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1420  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1421  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1422  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1423  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1424  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1425  
ffc50b2d382879 Abel Vesa             2023-01-06  1426  			i2c2: i2c@a88000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1427  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1428  				reg = <0 0x00a88000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1429  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1430  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1431  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1432  				pinctrl-0 = <&qup_i2c2_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1433  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1434  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1435  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1436  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1437  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1438  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1439  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1440  				dmas = <&gpi_dma1 0 2 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1441  				       <&gpi_dma1 1 2 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1442  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1443  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1444  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1445  
ffc50b2d382879 Abel Vesa             2023-01-06  1446  			spi2: spi@a88000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1447  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1448  				reg = <0 0x00a88000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1449  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1450  				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1451  				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1452  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1453  				pinctrl-0 = <&qup_spi2_data_clk>, <&qup_spi2_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06  1454  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1455  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1456  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1457  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1458  				dmas = <&gpi_dma1 0 2 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1459  				       <&gpi_dma1 1 2 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1460  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1461  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1462  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1463  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1464  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1465  
ffc50b2d382879 Abel Vesa             2023-01-06  1466  			i2c3: i2c@a8c000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1467  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1468  				reg = <0 0x00a8c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1469  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1470  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1471  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1472  				pinctrl-0 = <&qup_i2c3_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1473  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1474  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1475  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1476  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1477  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1478  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1479  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1480  				dmas = <&gpi_dma1 0 3 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1481  				       <&gpi_dma1 1 3 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1482  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1483  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1484  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1485  
ffc50b2d382879 Abel Vesa             2023-01-06  1486  			spi3: spi@a8c000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1487  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1488  				reg = <0 0x00a8c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1489  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1490  				clocks = <&gcc GCC_QUPV3_WRAP1_S3_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1491  				interrupts = <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1492  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1493  				pinctrl-0 = <&qup_spi3_data_clk>, <&qup_spi3_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06  1494  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1495  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1496  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1497  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1498  				dmas = <&gpi_dma1 0 3 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1499  				       <&gpi_dma1 1 3 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1500  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1501  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1502  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1503  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1504  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1505  
ffc50b2d382879 Abel Vesa             2023-01-06  1506  			i2c4: i2c@a90000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1507  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1508  				reg = <0 0x00a90000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1509  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1510  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1511  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1512  				pinctrl-0 = <&qup_i2c4_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1513  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1514  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1515  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1516  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1517  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1518  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1519  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1520  				dmas = <&gpi_dma1 0 4 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1521  				       <&gpi_dma1 1 4 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1522  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1523  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1524  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1525  
ffc50b2d382879 Abel Vesa             2023-01-06  1526  			spi4: spi@a90000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1527  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1528  				reg = <0 0x00a90000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1529  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1530  				clocks = <&gcc GCC_QUPV3_WRAP1_S4_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1531  				interrupts = <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1532  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1533  				pinctrl-0 = <&qup_spi4_data_clk>, <&qup_spi4_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06  1534  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1535  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1536  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1537  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1538  				dmas = <&gpi_dma1 0 4 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1539  				       <&gpi_dma1 1 4 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1540  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1541  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1542  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1543  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1544  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1545  
ffc50b2d382879 Abel Vesa             2023-01-06  1546  			i2c5: i2c@a94000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1547  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1548  				reg = <0 0x00a94000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1549  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1550  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1551  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1552  				pinctrl-0 = <&qup_i2c5_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1553  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1554  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1555  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1556  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1557  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1558  				dmas = <&gpi_dma1 0 5 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1559  				       <&gpi_dma1 1 5 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1560  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1561  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1562  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1563  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1564  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1565  
ffc50b2d382879 Abel Vesa             2023-01-06  1566  			spi5: spi@a94000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1567  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1568  				reg = <0 0x00a94000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1569  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1570  				clocks = <&gcc GCC_QUPV3_WRAP1_S5_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1571  				interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1572  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1573  				pinctrl-0 = <&qup_spi5_data_clk>, <&qup_spi5_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06  1574  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1575  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1576  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1577  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1578  				dmas = <&gpi_dma1 0 5 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1579  				       <&gpi_dma1 1 5 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1580  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1581  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1582  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1583  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1584  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1585  
ffc50b2d382879 Abel Vesa             2023-01-06  1586  			i2c6: i2c@a98000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1587  				compatible = "qcom,geni-i2c";
ffc50b2d382879 Abel Vesa             2023-01-06  1588  				reg = <0 0x00a98000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1589  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1590  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1591  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1592  				pinctrl-0 = <&qup_i2c6_data_clk>;
ffc50b2d382879 Abel Vesa             2023-01-06  1593  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1594  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1595  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1596  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1597  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1598  				dmas = <&gpi_dma1 0 6 QCOM_GPI_I2C>,
ffc50b2d382879 Abel Vesa             2023-01-06  1599  				       <&gpi_dma1 1 6 QCOM_GPI_I2C>;
ffc50b2d382879 Abel Vesa             2023-01-06  1600  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1601  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1602  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1603  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1604  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1605  
ffc50b2d382879 Abel Vesa             2023-01-06  1606  			spi6: spi@a98000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1607  				compatible = "qcom,geni-spi";
ffc50b2d382879 Abel Vesa             2023-01-06  1608  				reg = <0 0x00a98000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1609  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1610  				clocks = <&gcc GCC_QUPV3_WRAP1_S6_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1611  				interrupts = <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1612  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1613  				pinctrl-0 = <&qup_spi6_data_clk>, <&qup_spi6_cs>;
ffc50b2d382879 Abel Vesa             2023-01-06  1614  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1615  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1616  						<&aggre1_noc MASTER_QUP_1 0 &mc_virt  SLAVE_EBI1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1617  				interconnect-names = "qup-core", "qup-config", "qup-memory";
ffc50b2d382879 Abel Vesa             2023-01-06  1618  				dmas = <&gpi_dma1 0 6 QCOM_GPI_SPI>,
ffc50b2d382879 Abel Vesa             2023-01-06  1619  				       <&gpi_dma1 1 6 QCOM_GPI_SPI>;
ffc50b2d382879 Abel Vesa             2023-01-06  1620  				dma-names = "tx", "rx";
ffc50b2d382879 Abel Vesa             2023-01-06  1621  				#address-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  1622  				#size-cells = <0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1623  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1624  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1625  
ffc50b2d382879 Abel Vesa             2023-01-06  1626  			uart7: serial@a9c000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1627  				compatible = "qcom,geni-debug-uart";
ffc50b2d382879 Abel Vesa             2023-01-06  1628  				reg = <0 0x00a9c000 0 0x4000>;
ffc50b2d382879 Abel Vesa             2023-01-06  1629  				clock-names = "se";
ffc50b2d382879 Abel Vesa             2023-01-06  1630  				clocks = <&gcc GCC_QUPV3_WRAP1_S7_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1631  				pinctrl-names = "default";
ffc50b2d382879 Abel Vesa             2023-01-06  1632  				pinctrl-0 = <&qup_uart7_default>;
ffc50b2d382879 Abel Vesa             2023-01-06  1633  				interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  1634  				interconnect-names = "qup-core", "qup-config";
ffc50b2d382879 Abel Vesa             2023-01-06  1635  				interconnects = <&clk_virt MASTER_QUP_CORE_1 0 &clk_virt SLAVE_QUP_CORE_1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  1636  						<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_QUP_1 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  1637  				status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  1638  			};
ffc50b2d382879 Abel Vesa             2023-01-06  1639  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1640  
ffc50b2d382879 Abel Vesa             2023-01-06  1641  		cnoc_main: interconnect@1500000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1642  			compatible = "qcom,sm8550-cnoc-main";
ffc50b2d382879 Abel Vesa             2023-01-06  1643  			reg = <0 0x01500000 0 0x13080>;
ffc50b2d382879 Abel Vesa             2023-01-06  1644  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1645  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1646  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1647  
ffc50b2d382879 Abel Vesa             2023-01-06  1648  		config_noc: interconnect@1600000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1649  			compatible = "qcom,sm8550-config-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  1650  			reg = <0 0x01600000 0 0x6200>;
ffc50b2d382879 Abel Vesa             2023-01-06  1651  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1652  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1653  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1654  
ffc50b2d382879 Abel Vesa             2023-01-06  1655  		system_noc: interconnect@1680000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1656  			compatible = "qcom,sm8550-system-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  1657  			reg = <0 0x01680000 0 0x1d080>;
ffc50b2d382879 Abel Vesa             2023-01-06  1658  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1659  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1660  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1661  
ffc50b2d382879 Abel Vesa             2023-01-06  1662  		pcie_noc: interconnect@16c0000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1663  			compatible = "qcom,sm8550-pcie-anoc";
ffc50b2d382879 Abel Vesa             2023-01-06  1664  			reg = <0 0x016c0000 0 0x12200>;
ffc50b2d382879 Abel Vesa             2023-01-06  1665  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1666  			clocks = <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
ffc50b2d382879 Abel Vesa             2023-01-06  1667  				 <&gcc GCC_CFG_NOC_PCIE_ANOC_AHB_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1668  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1669  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1670  
ffc50b2d382879 Abel Vesa             2023-01-06  1671  		aggre1_noc: interconnect@16e0000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1672  			compatible = "qcom,sm8550-aggre1-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  1673  			reg = <0 0x016e0000 0 0x14400>;
ffc50b2d382879 Abel Vesa             2023-01-06  1674  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1675  			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
ffc50b2d382879 Abel Vesa             2023-01-06  1676  				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1677  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1678  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1679  
ffc50b2d382879 Abel Vesa             2023-01-06  1680  		aggre2_noc: interconnect@1700000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1681  			compatible = "qcom,sm8550-aggre2-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  1682  			reg = <0 0x01700000 0 0x1e400>;
ffc50b2d382879 Abel Vesa             2023-01-06  1683  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1684  			clocks = <&rpmhcc RPMH_IPA_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  1685  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1686  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1687  
ffc50b2d382879 Abel Vesa             2023-01-06  1688  		mmss_noc: interconnect@1780000 {
ffc50b2d382879 Abel Vesa             2023-01-06  1689  			compatible = "qcom,sm8550-mmss-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  1690  			reg = <0 0x01780000 0 0x5b800>;
ffc50b2d382879 Abel Vesa             2023-01-06  1691  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  1692  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  1693  		};
ffc50b2d382879 Abel Vesa             2023-01-06  1694  
3b3ba999046e24 Neil Armstrong        2023-10-03  1695  		rng: rng@10c3000 {
3b3ba999046e24 Neil Armstrong        2023-10-03  1696  			compatible = "qcom,sm8550-trng", "qcom,trng";
3b3ba999046e24 Neil Armstrong        2023-10-03  1697  			reg = <0 0x010c3000 0 0x1000>;
3b3ba999046e24 Neil Armstrong        2023-10-03  1698  		};
3b3ba999046e24 Neil Armstrong        2023-10-03  1699  
052c9a1f1400f1 Manivannan Sadhasivam 2023-12-06  1700  		pcie0: pcie@1c00000 {
7d1158c984d37e Abel Vesa             2023-01-19  1701  			device_type = "pci";
7d1158c984d37e Abel Vesa             2023-01-19  1702  			compatible = "qcom,pcie-sm8550";
7d1158c984d37e Abel Vesa             2023-01-19  1703  			reg = <0 0x01c00000 0 0x3000>,
7d1158c984d37e Abel Vesa             2023-01-19  1704  			      <0 0x60000000 0 0xf1d>,
7d1158c984d37e Abel Vesa             2023-01-19  1705  			      <0 0x60000f20 0 0xa8>,
7d1158c984d37e Abel Vesa             2023-01-19  1706  			      <0 0x60001000 0 0x1000>,
7d1158c984d37e Abel Vesa             2023-01-19  1707  			      <0 0x60100000 0 0x100000>;
7d1158c984d37e Abel Vesa             2023-01-19  1708  			reg-names = "parf", "dbi", "elbi", "atu", "config";
7d1158c984d37e Abel Vesa             2023-01-19  1709  			#address-cells = <3>;
7d1158c984d37e Abel Vesa             2023-01-19  1710  			#size-cells = <2>;
565c633940312b Manivannan Sadhasivam 2023-02-28  1711  			ranges = <0x01000000 0x0 0x00000000 0x0 0x60200000 0x0 0x100000>,
565c633940312b Manivannan Sadhasivam 2023-02-28  1712  				 <0x02000000 0x0 0x60300000 0x0 0x60300000 0x0 0x3d00000>;
7d1158c984d37e Abel Vesa             2023-01-19  1713  			bus-range = <0x00 0xff>;
7d1158c984d37e Abel Vesa             2023-01-19  1714  
7d1158c984d37e Abel Vesa             2023-01-19  1715  			dma-coherent;
7d1158c984d37e Abel Vesa             2023-01-19  1716  
7d1158c984d37e Abel Vesa             2023-01-19  1717  			linux,pci-domain = <0>;
7d1158c984d37e Abel Vesa             2023-01-19  1718  			num-lanes = <2>;
7d1158c984d37e Abel Vesa             2023-01-19  1719  
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1720  			interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1721  				     <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1722  				     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1723  				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1724  				     <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1725  				     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1726  				     <GIC_SPI 147 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1727  				     <GIC_SPI 148 IRQ_TYPE_LEVEL_HIGH>;
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1728  			interrupt-names = "msi0",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1729  					  "msi1",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1730  					  "msi2",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1731  					  "msi3",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1732  					  "msi4",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1733  					  "msi5",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1734  					  "msi6",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1735  					  "msi7";
7d1158c984d37e Abel Vesa             2023-01-19  1736  			#interrupt-cells = <1>;
7d1158c984d37e Abel Vesa             2023-01-19  1737  			interrupt-map-mask = <0 0 0 0x7>;
7d1158c984d37e Abel Vesa             2023-01-19  1738  			interrupt-map = <0 0 0 1 &intc 0 0 0 149 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
7d1158c984d37e Abel Vesa             2023-01-19  1739  					<0 0 0 2 &intc 0 0 0 150 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
7d1158c984d37e Abel Vesa             2023-01-19  1740  					<0 0 0 3 &intc 0 0 0 151 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
7d1158c984d37e Abel Vesa             2023-01-19  1741  					<0 0 0 4 &intc 0 0 0 152 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
7d1158c984d37e Abel Vesa             2023-01-19  1742  
32734bbd1802ef Abel Vesa             2023-02-08  1743  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1744  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1745  				 <&gcc GCC_PCIE_0_MSTR_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1746  				 <&gcc GCC_PCIE_0_SLV_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1747  				 <&gcc GCC_PCIE_0_SLV_Q2A_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1748  				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1749  				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>;
32734bbd1802ef Abel Vesa             2023-02-08  1750  			clock-names = "aux",
7d1158c984d37e Abel Vesa             2023-01-19  1751  				      "cfg",
7d1158c984d37e Abel Vesa             2023-01-19  1752  				      "bus_master",
7d1158c984d37e Abel Vesa             2023-01-19  1753  				      "bus_slave",
7d1158c984d37e Abel Vesa             2023-01-19  1754  				      "slave_q2a",
7d1158c984d37e Abel Vesa             2023-01-19  1755  				      "ddrss_sf_tbu",
32734bbd1802ef Abel Vesa             2023-02-08  1756  				      "noc_aggr";
7d1158c984d37e Abel Vesa             2023-01-19  1757  
32734bbd1802ef Abel Vesa             2023-02-08  1758  			interconnects = <&pcie_noc MASTER_PCIE_0 0 &mc_virt SLAVE_EBI1 0>,
32734bbd1802ef Abel Vesa             2023-02-08  1759  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc_main SLAVE_PCIE_0 0>;
32734bbd1802ef Abel Vesa             2023-02-08  1760  			interconnect-names = "pcie-mem", "cpu-pcie";
7d1158c984d37e Abel Vesa             2023-01-19  1761  
98a953fa2f4095 Manivannan Sadhasivam 2024-03-18  1762  			msi-map = <0x0 &gic_its 0x1400 0x1>,
98a953fa2f4095 Manivannan Sadhasivam 2024-03-18  1763  				  <0x100 &gic_its 0x1401 0x1>;
7d1158c984d37e Abel Vesa             2023-01-19  1764  			iommu-map = <0x0   &apps_smmu 0x1400 0x1>,
7d1158c984d37e Abel Vesa             2023-01-19  1765  				    <0x100 &apps_smmu 0x1401 0x1>;
7d1158c984d37e Abel Vesa             2023-01-19  1766  
7d1158c984d37e Abel Vesa             2023-01-19  1767  			resets = <&gcc GCC_PCIE_0_BCR>;
7d1158c984d37e Abel Vesa             2023-01-19  1768  			reset-names = "pci";
7d1158c984d37e Abel Vesa             2023-01-19  1769  
7d1158c984d37e Abel Vesa             2023-01-19  1770  			power-domains = <&gcc PCIE_0_GDSC>;
7d1158c984d37e Abel Vesa             2023-01-19  1771  
7d1158c984d37e Abel Vesa             2023-01-19  1772  			phys = <&pcie0_phy>;
7d1158c984d37e Abel Vesa             2023-01-19  1773  			phy-names = "pciephy";
7d1158c984d37e Abel Vesa             2023-01-19  1774  
7d1158c984d37e Abel Vesa             2023-01-19  1775  			status = "disabled";
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1776  
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1777  			pcie@0 {
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1778  				device_type = "pci";
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1779  				reg = <0x0 0x0 0x0 0x0 0x0>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1780  				bus-range = <0x01 0xff>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1781  
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1782  				#address-cells = <3>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1783  				#size-cells = <2>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1784  				ranges;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1785  			};
7d1158c984d37e Abel Vesa             2023-01-19  1786  		};
7d1158c984d37e Abel Vesa             2023-01-19  1787  
7d1158c984d37e Abel Vesa             2023-01-19  1788  		pcie0_phy: phy@1c06000 {
7d1158c984d37e Abel Vesa             2023-01-19  1789  			compatible = "qcom,sm8550-qmp-gen3x2-pcie-phy";
7d1158c984d37e Abel Vesa             2023-01-19  1790  			reg = <0 0x01c06000 0 0x2000>;
7d1158c984d37e Abel Vesa             2023-01-19  1791  
7d1158c984d37e Abel Vesa             2023-01-19  1792  			clocks = <&gcc GCC_PCIE_0_AUX_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1793  				 <&gcc GCC_PCIE_0_CFG_AHB_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1794  				 <&tcsr TCSR_PCIE_0_CLKREF_EN>,
7d1158c984d37e Abel Vesa             2023-01-19  1795  				 <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1796  				 <&gcc GCC_PCIE_0_PIPE_CLK>;
7d1158c984d37e Abel Vesa             2023-01-19  1797  			clock-names = "aux", "cfg_ahb", "ref", "rchng",
7d1158c984d37e Abel Vesa             2023-01-19  1798  				      "pipe";
7d1158c984d37e Abel Vesa             2023-01-19  1799  
7d1158c984d37e Abel Vesa             2023-01-19  1800  			resets = <&gcc GCC_PCIE_0_PHY_BCR>;
7d1158c984d37e Abel Vesa             2023-01-19  1801  			reset-names = "phy";
7d1158c984d37e Abel Vesa             2023-01-19  1802  
7d1158c984d37e Abel Vesa             2023-01-19  1803  			assigned-clocks = <&gcc GCC_PCIE_0_PHY_RCHNG_CLK>;
7d1158c984d37e Abel Vesa             2023-01-19  1804  			assigned-clock-rates = <100000000>;
7d1158c984d37e Abel Vesa             2023-01-19  1805  
7d1158c984d37e Abel Vesa             2023-01-19  1806  			power-domains = <&gcc PCIE_0_PHY_GDSC>;
7d1158c984d37e Abel Vesa             2023-01-19  1807  
7d1158c984d37e Abel Vesa             2023-01-19  1808  			#clock-cells = <0>;
7d1158c984d37e Abel Vesa             2023-01-19  1809  			clock-output-names = "pcie0_pipe_clk";
7d1158c984d37e Abel Vesa             2023-01-19  1810  
7d1158c984d37e Abel Vesa             2023-01-19  1811  			#phy-cells = <0>;
7d1158c984d37e Abel Vesa             2023-01-19  1812  
7d1158c984d37e Abel Vesa             2023-01-19  1813  			status = "disabled";
7d1158c984d37e Abel Vesa             2023-01-19  1814  		};
7d1158c984d37e Abel Vesa             2023-01-19  1815  
052c9a1f1400f1 Manivannan Sadhasivam 2023-12-06  1816  		pcie1: pcie@1c08000 {
7d1158c984d37e Abel Vesa             2023-01-19  1817  			device_type = "pci";
7d1158c984d37e Abel Vesa             2023-01-19  1818  			compatible = "qcom,pcie-sm8550";
7d1158c984d37e Abel Vesa             2023-01-19  1819  			reg = <0x0 0x01c08000 0x0 0x3000>,
7d1158c984d37e Abel Vesa             2023-01-19  1820  			      <0x0 0x40000000 0x0 0xf1d>,
7d1158c984d37e Abel Vesa             2023-01-19  1821  			      <0x0 0x40000f20 0x0 0xa8>,
7d1158c984d37e Abel Vesa             2023-01-19  1822  			      <0x0 0x40001000 0x0 0x1000>,
7d1158c984d37e Abel Vesa             2023-01-19  1823  			      <0x0 0x40100000 0x0 0x100000>;
7d1158c984d37e Abel Vesa             2023-01-19  1824  			reg-names = "parf", "dbi", "elbi", "atu", "config";
7d1158c984d37e Abel Vesa             2023-01-19  1825  			#address-cells = <3>;
7d1158c984d37e Abel Vesa             2023-01-19  1826  			#size-cells = <2>;
565c633940312b Manivannan Sadhasivam 2023-02-28  1827  			ranges = <0x01000000 0x0 0x00000000 0x0 0x40200000 0x0 0x100000>,
565c633940312b Manivannan Sadhasivam 2023-02-28  1828  				 <0x02000000 0x0 0x40300000 0x0 0x40300000 0x0 0x1fd00000>;
7d1158c984d37e Abel Vesa             2023-01-19  1829  			bus-range = <0x00 0xff>;
7d1158c984d37e Abel Vesa             2023-01-19  1830  
7d1158c984d37e Abel Vesa             2023-01-19  1831  			dma-coherent;
7d1158c984d37e Abel Vesa             2023-01-19  1832  
7d1158c984d37e Abel Vesa             2023-01-19  1833  			linux,pci-domain = <1>;
7d1158c984d37e Abel Vesa             2023-01-19  1834  			num-lanes = <2>;
7d1158c984d37e Abel Vesa             2023-01-19  1835  
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1836  			interrupts = <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1837  				     <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1838  				     <GIC_SPI 309 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1839  				     <GIC_SPI 312 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1840  				     <GIC_SPI 313 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1841  				     <GIC_SPI 314 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1842  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1843  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>;
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1844  			interrupt-names = "msi0",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1845  					  "msi1",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1846  					  "msi2",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1847  					  "msi3",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1848  					  "msi4",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1849  					  "msi5",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1850  					  "msi6",
79d99c74c6e865 Krzysztof Kozlowski   2024-01-26  1851  					  "msi7";
7d1158c984d37e Abel Vesa             2023-01-19  1852  			#interrupt-cells = <1>;
7d1158c984d37e Abel Vesa             2023-01-19  1853  			interrupt-map-mask = <0 0 0 0x7>;
7d1158c984d37e Abel Vesa             2023-01-19  1854  			interrupt-map = <0 0 0 1 &intc 0 0 0 434 IRQ_TYPE_LEVEL_HIGH>, /* int_a */
7d1158c984d37e Abel Vesa             2023-01-19  1855  					<0 0 0 2 &intc 0 0 0 435 IRQ_TYPE_LEVEL_HIGH>, /* int_b */
7d1158c984d37e Abel Vesa             2023-01-19  1856  					<0 0 0 3 &intc 0 0 0 438 IRQ_TYPE_LEVEL_HIGH>, /* int_c */
7d1158c984d37e Abel Vesa             2023-01-19  1857  					<0 0 0 4 &intc 0 0 0 439 IRQ_TYPE_LEVEL_HIGH>; /* int_d */
7d1158c984d37e Abel Vesa             2023-01-19  1858  
32734bbd1802ef Abel Vesa             2023-02-08  1859  			clocks = <&gcc GCC_PCIE_1_AUX_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1860  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1861  				 <&gcc GCC_PCIE_1_MSTR_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1862  				 <&gcc GCC_PCIE_1_SLV_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1863  				 <&gcc GCC_PCIE_1_SLV_Q2A_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1864  				 <&gcc GCC_DDRSS_PCIE_SF_QTB_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1865  				 <&gcc GCC_AGGRE_NOC_PCIE_AXI_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1866  				 <&gcc GCC_CNOC_PCIE_SF_AXI_CLK>;
32734bbd1802ef Abel Vesa             2023-02-08  1867  			clock-names = "aux",
7d1158c984d37e Abel Vesa             2023-01-19  1868  				      "cfg",
7d1158c984d37e Abel Vesa             2023-01-19  1869  				      "bus_master",
7d1158c984d37e Abel Vesa             2023-01-19  1870  				      "bus_slave",
7d1158c984d37e Abel Vesa             2023-01-19  1871  				      "slave_q2a",
7d1158c984d37e Abel Vesa             2023-01-19  1872  				      "ddrss_sf_tbu",
32734bbd1802ef Abel Vesa             2023-02-08  1873  				      "noc_aggr",
32734bbd1802ef Abel Vesa             2023-02-08  1874  				      "cnoc_sf_axi";
7d1158c984d37e Abel Vesa             2023-01-19  1875  
7d1158c984d37e Abel Vesa             2023-01-19  1876  			assigned-clocks = <&gcc GCC_PCIE_1_AUX_CLK>;
7d1158c984d37e Abel Vesa             2023-01-19  1877  			assigned-clock-rates = <19200000>;
7d1158c984d37e Abel Vesa             2023-01-19  1878  
32734bbd1802ef Abel Vesa             2023-02-08  1879  			interconnects = <&pcie_noc MASTER_PCIE_1 0 &mc_virt SLAVE_EBI1 0>,
32734bbd1802ef Abel Vesa             2023-02-08  1880  					<&gem_noc MASTER_APPSS_PROC 0 &cnoc_main SLAVE_PCIE_1 0>;
32734bbd1802ef Abel Vesa             2023-02-08  1881  			interconnect-names = "pcie-mem", "cpu-pcie";
7d1158c984d37e Abel Vesa             2023-01-19  1882  
98a953fa2f4095 Manivannan Sadhasivam 2024-03-18  1883  			msi-map = <0x0 &gic_its 0x1480 0x1>,
98a953fa2f4095 Manivannan Sadhasivam 2024-03-18  1884  				  <0x100 &gic_its 0x1481 0x1>;
7d1158c984d37e Abel Vesa             2023-01-19  1885  			iommu-map = <0x0   &apps_smmu 0x1480 0x1>,
7d1158c984d37e Abel Vesa             2023-01-19  1886  				    <0x100 &apps_smmu 0x1481 0x1>;
7d1158c984d37e Abel Vesa             2023-01-19  1887  
7d1158c984d37e Abel Vesa             2023-01-19  1888  			resets = <&gcc GCC_PCIE_1_BCR>,
7d1158c984d37e Abel Vesa             2023-01-19  1889  				<&gcc GCC_PCIE_1_LINK_DOWN_BCR>;
32734bbd1802ef Abel Vesa             2023-02-08  1890  			reset-names = "pci", "link_down";
7d1158c984d37e Abel Vesa             2023-01-19  1891  
7d1158c984d37e Abel Vesa             2023-01-19  1892  			power-domains = <&gcc PCIE_1_GDSC>;
7d1158c984d37e Abel Vesa             2023-01-19  1893  
7d1158c984d37e Abel Vesa             2023-01-19  1894  			phys = <&pcie1_phy>;
7d1158c984d37e Abel Vesa             2023-01-19  1895  			phy-names = "pciephy";
7d1158c984d37e Abel Vesa             2023-01-19  1896  
7d1158c984d37e Abel Vesa             2023-01-19  1897  			status = "disabled";
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1898  
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1899  			pcie@0 {
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1900  				device_type = "pci";
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1901  				reg = <0x0 0x0 0x0 0x0 0x0>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1902  				bus-range = <0x01 0xff>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1903  
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1904  				#address-cells = <3>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1905  				#size-cells = <2>;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1906  				ranges;
cc2ad77882fb9f Manivannan Sadhasivam 2024-03-21  1907  			};
7d1158c984d37e Abel Vesa             2023-01-19  1908  		};
7d1158c984d37e Abel Vesa             2023-01-19  1909  
7d1158c984d37e Abel Vesa             2023-01-19  1910  		pcie1_phy: phy@1c0e000 {
7d1158c984d37e Abel Vesa             2023-01-19  1911  			compatible = "qcom,sm8550-qmp-gen4x2-pcie-phy";
7d1158c984d37e Abel Vesa             2023-01-19  1912  			reg = <0x0 0x01c0e000 0x0 0x2000>;
7d1158c984d37e Abel Vesa             2023-01-19  1913  
32734bbd1802ef Abel Vesa             2023-02-08  1914  			clocks = <&gcc GCC_PCIE_1_PHY_AUX_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1915  				 <&gcc GCC_PCIE_1_CFG_AHB_CLK>,
7d1158c984d37e Abel Vesa             2023-01-19  1916  				 <&tcsr TCSR_PCIE_1_CLKREF_EN>,
7d1158c984d37e Abel Vesa             2023-01-19  1917  				 <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>,
32734bbd1802ef Abel Vesa             2023-02-08  1918  				 <&gcc GCC_PCIE_1_PIPE_CLK>;
7d1158c984d37e Abel Vesa             2023-01-19  1919  			clock-names = "aux", "cfg_ahb", "ref", "rchng",
32734bbd1802ef Abel Vesa             2023-02-08  1920  				      "pipe";
7d1158c984d37e Abel Vesa             2023-01-19  1921  
7d1158c984d37e Abel Vesa             2023-01-19  1922  			resets = <&gcc GCC_PCIE_1_PHY_BCR>,
7d1158c984d37e Abel Vesa             2023-01-19  1923  				 <&gcc GCC_PCIE_1_NOCSR_COM_PHY_BCR>;
32734bbd1802ef Abel Vesa             2023-02-08  1924  			reset-names = "phy", "phy_nocsr";
7d1158c984d37e Abel Vesa             2023-01-19  1925  
7d1158c984d37e Abel Vesa             2023-01-19  1926  			assigned-clocks = <&gcc GCC_PCIE_1_PHY_RCHNG_CLK>;
7d1158c984d37e Abel Vesa             2023-01-19  1927  			assigned-clock-rates = <100000000>;
7d1158c984d37e Abel Vesa             2023-01-19  1928  
7d1158c984d37e Abel Vesa             2023-01-19  1929  			power-domains = <&gcc PCIE_1_PHY_GDSC>;
7d1158c984d37e Abel Vesa             2023-01-19  1930  
7d1158c984d37e Abel Vesa             2023-01-19  1931  			#clock-cells = <0>;
7d1158c984d37e Abel Vesa             2023-01-19  1932  			clock-output-names = "pcie1_pipe_clk";
7d1158c984d37e Abel Vesa             2023-01-19  1933  
7d1158c984d37e Abel Vesa             2023-01-19  1934  			#phy-cells = <0>;
7d1158c984d37e Abel Vesa             2023-01-19  1935  
7d1158c984d37e Abel Vesa             2023-01-19  1936  			status = "disabled";
7d1158c984d37e Abel Vesa             2023-01-19  1937  		};
7d1158c984d37e Abel Vesa             2023-01-19  1938  
433477c3bf0b7f Neil Armstrong        2022-11-16  1939  		cryptobam: dma-controller@1dc4000 {
31dfb8014f6bbe Bhupesh Sharma        2023-05-27  1940  			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
433477c3bf0b7f Neil Armstrong        2022-11-16  1941  			reg = <0x0 0x01dc4000 0x0 0x28000>;
433477c3bf0b7f Neil Armstrong        2022-11-16  1942  			interrupts = <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>;
433477c3bf0b7f Neil Armstrong        2022-11-16  1943  			#dma-cells = <1>;
433477c3bf0b7f Neil Armstrong        2022-11-16  1944  			qcom,ee = <0>;
433477c3bf0b7f Neil Armstrong        2022-11-16  1945  			qcom,controlled-remotely;
433477c3bf0b7f Neil Armstrong        2022-11-16  1946  			iommus = <&apps_smmu 0x480 0x0>,
433477c3bf0b7f Neil Armstrong        2022-11-16  1947  				 <&apps_smmu 0x481 0x0>;
433477c3bf0b7f Neil Armstrong        2022-11-16  1948  		};
433477c3bf0b7f Neil Armstrong        2022-11-16  1949  
3cbf49ef16962a Krzysztof Kozlowski   2023-04-19  1950  		crypto: crypto@1dfa000 {
e47a80784306a5 Vladimir Zapolskiy    2023-02-22  1951  			compatible = "qcom,sm8550-qce", "qcom,sm8150-qce", "qcom,qce";
433477c3bf0b7f Neil Armstrong        2022-11-16  1952  			reg = <0x0 0x01dfa000 0x0 0x6000>;
433477c3bf0b7f Neil Armstrong        2022-11-16  1953  			dmas = <&cryptobam 4>, <&cryptobam 5>;
433477c3bf0b7f Neil Armstrong        2022-11-16  1954  			dma-names = "rx", "tx";
433477c3bf0b7f Neil Armstrong        2022-11-16  1955  			iommus = <&apps_smmu 0x480 0x0>,
433477c3bf0b7f Neil Armstrong        2022-11-16  1956  				 <&apps_smmu 0x481 0x0>;
433477c3bf0b7f Neil Armstrong        2022-11-16  1957  			interconnects = <&aggre2_noc MASTER_CRYPTO 0 &mc_virt SLAVE_EBI1 0>;
433477c3bf0b7f Neil Armstrong        2022-11-16  1958  			interconnect-names = "memory";
433477c3bf0b7f Neil Armstrong        2022-11-16  1959  		};
433477c3bf0b7f Neil Armstrong        2022-11-16  1960  
35cf1aaab169e0 Abel Vesa             2023-01-16  1961  		ufs_mem_phy: phy@1d80000 {
35cf1aaab169e0 Abel Vesa             2023-01-16  1962  			compatible = "qcom,sm8550-qmp-ufs-phy";
35cf1aaab169e0 Abel Vesa             2023-01-16  1963  			reg = <0x0 0x01d80000 0x0 0x2000>;
746ae23ad02004 Manivannan Sadhasivam 2024-01-31  1964  			clocks = <&rpmhcc RPMH_CXO_CLK>,
746ae23ad02004 Manivannan Sadhasivam 2024-01-31  1965  				 <&gcc GCC_UFS_PHY_PHY_AUX_CLK>,
746ae23ad02004 Manivannan Sadhasivam 2024-01-31  1966  				 <&tcsr TCSR_UFS_CLKREF_EN>;
746ae23ad02004 Manivannan Sadhasivam 2024-01-31  1967  			clock-names = "ref",
746ae23ad02004 Manivannan Sadhasivam 2024-01-31  1968  				      "ref_aux",
746ae23ad02004 Manivannan Sadhasivam 2024-01-31  1969  				      "qref";
35cf1aaab169e0 Abel Vesa             2023-01-16  1970  
35cf1aaab169e0 Abel Vesa             2023-01-16  1971  			power-domains = <&gcc UFS_MEM_PHY_GDSC>;
35cf1aaab169e0 Abel Vesa             2023-01-16  1972  
35cf1aaab169e0 Abel Vesa             2023-01-16  1973  			resets = <&ufs_mem_hc 0>;
35cf1aaab169e0 Abel Vesa             2023-01-16  1974  			reset-names = "ufsphy";
35cf1aaab169e0 Abel Vesa             2023-01-16  1975  
35cf1aaab169e0 Abel Vesa             2023-01-16  1976  			#clock-cells = <1>;
35cf1aaab169e0 Abel Vesa             2023-01-16  1977  			#phy-cells = <0>;
35cf1aaab169e0 Abel Vesa             2023-01-16  1978  
35cf1aaab169e0 Abel Vesa             2023-01-16  1979  			status = "disabled";
35cf1aaab169e0 Abel Vesa             2023-01-16  1980  		};
35cf1aaab169e0 Abel Vesa             2023-01-16  1981  
35cf1aaab169e0 Abel Vesa             2023-01-16  1982  		ufs_mem_hc: ufs@1d84000 {
35cf1aaab169e0 Abel Vesa             2023-01-16  1983  			compatible = "qcom,sm8550-ufshc", "qcom,ufshc",
35cf1aaab169e0 Abel Vesa             2023-01-16  1984  				     "jedec,ufs-2.0";
35cf1aaab169e0 Abel Vesa             2023-01-16  1985  			reg = <0x0 0x01d84000 0x0 0x3000>;
35cf1aaab169e0 Abel Vesa             2023-01-16  1986  			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
35cf1aaab169e0 Abel Vesa             2023-01-16  1987  			phys = <&ufs_mem_phy>;
35cf1aaab169e0 Abel Vesa             2023-01-16  1988  			phy-names = "ufsphy";
35cf1aaab169e0 Abel Vesa             2023-01-16  1989  			lanes-per-direction = <2>;
35cf1aaab169e0 Abel Vesa             2023-01-16  1990  			#reset-cells = <1>;
35cf1aaab169e0 Abel Vesa             2023-01-16  1991  			resets = <&gcc GCC_UFS_PHY_BCR>;
35cf1aaab169e0 Abel Vesa             2023-01-16  1992  			reset-names = "rst";
35cf1aaab169e0 Abel Vesa             2023-01-16  1993  
35cf1aaab169e0 Abel Vesa             2023-01-16  1994  			power-domains = <&gcc UFS_PHY_GDSC>;
35cf1aaab169e0 Abel Vesa             2023-01-16  1995  			required-opps = <&rpmhpd_opp_nom>;
35cf1aaab169e0 Abel Vesa             2023-01-16  1996  
35cf1aaab169e0 Abel Vesa             2023-01-16  1997  			iommus = <&apps_smmu 0x60 0x0>;
ee1d5100c37e7a Manivannan Sadhasivam 2023-03-08  1998  			dma-coherent;
35cf1aaab169e0 Abel Vesa             2023-01-16  1999  
2f7be4caacd264 Konrad Dybcio         2024-02-03  2000  			operating-points-v2 = <&ufs_opp_table>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2001  			interconnects = <&aggre1_noc MASTER_UFS_MEM 0 &mc_virt SLAVE_EBI1 0>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2002  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_UFS_MEM_CFG 0>;
35cf1aaab169e0 Abel Vesa             2023-01-16  2003  
35cf1aaab169e0 Abel Vesa             2023-01-16  2004  			interconnect-names = "ufs-ddr", "cpu-ufs";
35cf1aaab169e0 Abel Vesa             2023-01-16  2005  			clock-names = "core_clk",
35cf1aaab169e0 Abel Vesa             2023-01-16  2006  				      "bus_aggr_clk",
35cf1aaab169e0 Abel Vesa             2023-01-16  2007  				      "iface_clk",
35cf1aaab169e0 Abel Vesa             2023-01-16  2008  				      "core_clk_unipro",
35cf1aaab169e0 Abel Vesa             2023-01-16  2009  				      "ref_clk",
35cf1aaab169e0 Abel Vesa             2023-01-16  2010  				      "tx_lane0_sync_clk",
35cf1aaab169e0 Abel Vesa             2023-01-16  2011  				      "rx_lane0_sync_clk",
35cf1aaab169e0 Abel Vesa             2023-01-16  2012  				      "rx_lane1_sync_clk";
35cf1aaab169e0 Abel Vesa             2023-01-16  2013  			clocks = <&gcc GCC_UFS_PHY_AXI_CLK>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2014  				 <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2015  				 <&gcc GCC_UFS_PHY_AHB_CLK>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2016  				 <&gcc GCC_UFS_PHY_UNIPRO_CORE_CLK>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2017  				 <&tcsr TCSR_UFS_PAD_CLKREF_EN>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2018  				 <&gcc GCC_UFS_PHY_TX_SYMBOL_0_CLK>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2019  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_0_CLK>,
35cf1aaab169e0 Abel Vesa             2023-01-16  2020  				 <&gcc GCC_UFS_PHY_RX_SYMBOL_1_CLK>;
b8630c48b43fcf Abel Vesa             2023-04-07  2021  			qcom,ice = <&ice>;
b8630c48b43fcf Abel Vesa             2023-04-07  2022  
35cf1aaab169e0 Abel Vesa             2023-01-16  2023  			status = "disabled";
2f7be4caacd264 Konrad Dybcio         2024-02-03  2024  
2f7be4caacd264 Konrad Dybcio         2024-02-03  2025  			ufs_opp_table: opp-table {
2f7be4caacd264 Konrad Dybcio         2024-02-03  2026  				compatible = "operating-points-v2";
2f7be4caacd264 Konrad Dybcio         2024-02-03  2027  
2f7be4caacd264 Konrad Dybcio         2024-02-03  2028  				opp-75000000 {
2f7be4caacd264 Konrad Dybcio         2024-02-03  2029  					opp-hz = /bits/ 64 <75000000>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2030  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2031  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2032  						 /bits/ 64 <75000000>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2033  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2034  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2035  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2036  						 /bits/ 64 <0>;
2f7be4caacd264 Konrad Dybcio         2024-02-03  2037  					required-opps = <&rpmhpd_opp_low_svs>;
2f7be4caacd264 Konrad Dybcio         2024-02-03  2038  				};
2f7be4caacd264 Konrad Dybcio         2024-02-03  2039  
2f7be4caacd264 Konrad Dybcio         2024-02-03  2040  				opp-150000000 {
2f7be4caacd264 Konrad Dybcio         2024-02-03  2041  					opp-hz = /bits/ 64 <150000000>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2042  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2043  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2044  						 /bits/ 64 <150000000>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2045  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2046  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2047  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2048  						 /bits/ 64 <0>;
2f7be4caacd264 Konrad Dybcio         2024-02-03  2049  					required-opps = <&rpmhpd_opp_svs>;
2f7be4caacd264 Konrad Dybcio         2024-02-03  2050  				};
2f7be4caacd264 Konrad Dybcio         2024-02-03  2051  
2f7be4caacd264 Konrad Dybcio         2024-02-03  2052  				opp-300000000 {
2f7be4caacd264 Konrad Dybcio         2024-02-03  2053  					opp-hz = /bits/ 64 <300000000>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2054  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2055  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2056  						 /bits/ 64 <300000000>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2057  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2058  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2059  						 /bits/ 64 <0>,
2f7be4caacd264 Konrad Dybcio         2024-02-03  2060  						 /bits/ 64 <0>;
2f7be4caacd264 Konrad Dybcio         2024-02-03  2061  					required-opps = <&rpmhpd_opp_nom>;
2f7be4caacd264 Konrad Dybcio         2024-02-03  2062  				};
2f7be4caacd264 Konrad Dybcio         2024-02-03  2063  			};
35cf1aaab169e0 Abel Vesa             2023-01-16  2064  		};
35cf1aaab169e0 Abel Vesa             2023-01-16  2065  
b8630c48b43fcf Abel Vesa             2023-04-07  2066  		ice: crypto@1d88000 {
b8630c48b43fcf Abel Vesa             2023-04-07  2067  			compatible = "qcom,sm8550-inline-crypto-engine",
b8630c48b43fcf Abel Vesa             2023-04-07  2068  				     "qcom,inline-crypto-engine";
b8630c48b43fcf Abel Vesa             2023-04-07  2069  			reg = <0 0x01d88000 0 0x8000>;
b8630c48b43fcf Abel Vesa             2023-04-07  2070  			clocks = <&gcc GCC_UFS_PHY_ICE_CORE_CLK>;
b8630c48b43fcf Abel Vesa             2023-04-07  2071  		};
b8630c48b43fcf Abel Vesa             2023-04-07  2072  
ffc50b2d382879 Abel Vesa             2023-01-06  2073  		tcsr_mutex: hwlock@1f40000 {
ffc50b2d382879 Abel Vesa             2023-01-06  2074  			compatible = "qcom,tcsr-mutex";
ffc50b2d382879 Abel Vesa             2023-01-06  2075  			reg = <0 0x01f40000 0 0x20000>;
ffc50b2d382879 Abel Vesa             2023-01-06  2076  			#hwlock-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  2077  		};
ffc50b2d382879 Abel Vesa             2023-01-06  2078  
ffc50b2d382879 Abel Vesa             2023-01-06  2079  		tcsr: clock-controller@1fc0000 {
ffc50b2d382879 Abel Vesa             2023-01-06  2080  			compatible = "qcom,sm8550-tcsr", "syscon";
ffc50b2d382879 Abel Vesa             2023-01-06  2081  			reg = <0 0x01fc0000 0 0x30000>;
ffc50b2d382879 Abel Vesa             2023-01-06  2082  			clocks = <&rpmhcc RPMH_CXO_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  2083  			#clock-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  2084  			#reset-cells = <1>;
ffc50b2d382879 Abel Vesa             2023-01-06  2085  		};
ffc50b2d382879 Abel Vesa             2023-01-06  2086  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2087  		gpu: gpu@3d00000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2088  			compatible = "qcom,adreno-43050a01", "qcom,adreno";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2089  			reg = <0x0 0x03d00000 0x0 0x40000>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2090  			      <0x0 0x03d9e000 0x0 0x1000>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2091  			      <0x0 0x03d61000 0x0 0x800>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2092  			reg-names = "kgsl_3d0_reg_memory",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2093  				    "cx_mem",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2094  				    "cx_dbgc";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2095  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2096  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2097  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2098  			iommus = <&adreno_smmu 0 0x0>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2099  				 <&adreno_smmu 1 0x0>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2100  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2101  			operating-points-v2 = <&gpu_opp_table>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2102  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2103  			qcom,gmu = <&gmu>;
6a464089284a61 Konrad Dybcio         2024-01-02  2104  			#cooling-cells = <2>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2105  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2106  			status = "disabled";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2107  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2108  			zap-shader {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2109  				memory-region = <&gpu_micro_code_mem>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2110  			};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2111  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2112  			/* Speedbin needs more work on A740+, keep only lower freqs */
ef19923ae103b5 Konrad Dybcio         2023-12-04  2113  			gpu_opp_table: opp-table {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2114  				compatible = "operating-points-v2";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2115  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2116  				opp-680000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2117  					opp-hz = /bits/ 64 <680000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2118  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2119  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2120  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2121  				opp-615000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2122  					opp-hz = /bits/ 64 <615000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2123  					opp-level = <RPMH_REGULATOR_LEVEL_SVS_L0>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2124  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2125  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2126  				opp-550000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2127  					opp-hz = /bits/ 64 <550000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2128  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2129  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2130  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2131  				opp-475000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2132  					opp-hz = /bits/ 64 <475000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2133  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_L1>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2134  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2135  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2136  				opp-401000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2137  					opp-hz = /bits/ 64 <401000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2138  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2139  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2140  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2141  				opp-348000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2142  					opp-hz = /bits/ 64 <348000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2143  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2144  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2145  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2146  				opp-295000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2147  					opp-hz = /bits/ 64 <295000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2148  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2149  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2150  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2151  				opp-220000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2152  					opp-hz = /bits/ 64 <220000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2153  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2154  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2155  			};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2156  		};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2157  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2158  		gmu: gmu@3d6a000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2159  			compatible = "qcom,adreno-gmu-740.1", "qcom,adreno-gmu";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2160  			reg = <0x0 0x03d6a000 0x0 0x35000>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2161  			      <0x0 0x03d50000 0x0 0x10000>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2162  			      <0x0 0x0b280000 0x0 0x10000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2163  			reg-names = "gmu", "rscc", "gmu_pdc";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2164  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2165  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2166  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2167  			interrupt-names = "hfi", "gmu";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2168  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2169  			clocks = <&gpucc GPU_CC_AHB_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2170  				 <&gpucc GPU_CC_CX_GMU_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2171  				 <&gpucc GPU_CC_CXO_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2172  				 <&gcc GCC_DDRSS_GPU_AXI_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2173  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2174  				 <&gpucc GPU_CC_HUB_CX_INT_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2175  				 <&gpucc GPU_CC_DEMET_CLK>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2176  			clock-names = "ahb",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2177  				      "gmu",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2178  				      "cxo",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2179  				      "axi",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2180  				      "memnoc",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2181  				      "hub",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2182  				      "demet";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2183  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2184  			power-domains = <&gpucc GPU_CC_CX_GDSC>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2185  					<&gpucc GPU_CC_GX_GDSC>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2186  			power-domain-names = "cx",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2187  					     "gx";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2188  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2189  			iommus = <&adreno_smmu 5 0x0>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2190  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2191  			qcom,qmp = <&aoss_qmp>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2192  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2193  			operating-points-v2 = <&gmu_opp_table>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2194  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2195  			gmu_opp_table: opp-table {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2196  				compatible = "operating-points-v2";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2197  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2198  				opp-500000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2199  					opp-hz = /bits/ 64 <500000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2200  					opp-level = <RPMH_REGULATOR_LEVEL_SVS>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2201  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2202  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2203  				opp-200000000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2204  					opp-hz = /bits/ 64 <200000000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2205  					opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2206  				};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2207  			};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2208  		};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2209  
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2210  		gpucc: clock-controller@3d90000 {
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2211  			compatible = "qcom,sm8550-gpucc";
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2212  			reg = <0 0x03d90000 0 0xa000>;
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2213  			clocks = <&bi_tcxo_div2>,
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2214  				 <&gcc GCC_GPU_GPLL0_CLK_SRC>,
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2215  				 <&gcc GCC_GPU_GPLL0_DIV_CLK_SRC>;
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2216  			#clock-cells = <1>;
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2217  			#reset-cells = <1>;
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2218  			#power-domain-cells = <1>;
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2219  		};
9f7579423d2d61 Jagadeesh Kona        2023-05-24  2220  
ef19923ae103b5 Konrad Dybcio         2023-12-04  2221  		adreno_smmu: iommu@3da0000 {
ef19923ae103b5 Konrad Dybcio         2023-12-04  2222  			compatible = "qcom,sm8550-smmu-500", "qcom,adreno-smmu",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2223  				     "qcom,smmu-500", "arm,mmu-500";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2224  			reg = <0x0 0x03da0000 0x0 0x40000>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2225  			#iommu-cells = <2>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2226  			#global-interrupts = <1>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2227  			interrupts = <GIC_SPI 673 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2228  				     <GIC_SPI 677 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2229  				     <GIC_SPI 678 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2230  				     <GIC_SPI 679 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2231  				     <GIC_SPI 680 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2232  				     <GIC_SPI 681 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2233  				     <GIC_SPI 682 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2234  				     <GIC_SPI 683 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2235  				     <GIC_SPI 684 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2236  				     <GIC_SPI 685 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2237  				     <GIC_SPI 686 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2238  				     <GIC_SPI 687 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2239  				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2240  				     <GIC_SPI 476 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2241  				     <GIC_SPI 574 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2242  				     <GIC_SPI 575 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2243  				     <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2244  				     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2245  				     <GIC_SPI 659 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2246  				     <GIC_SPI 661 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2247  				     <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2248  				     <GIC_SPI 665 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2249  				     <GIC_SPI 666 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2250  				     <GIC_SPI 668 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2251  				     <GIC_SPI 669 IRQ_TYPE_LEVEL_HIGH>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2252  				     <GIC_SPI 699 IRQ_TYPE_LEVEL_HIGH>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2253  			clocks = <&gpucc GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2254  				 <&gcc GCC_GPU_MEMNOC_GFX_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2255  				 <&gcc GCC_GPU_SNOC_DVM_GFX_CLK>,
ef19923ae103b5 Konrad Dybcio         2023-12-04  2256  				 <&gpucc GPU_CC_AHB_CLK>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2257  			clock-names = "hlos",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2258  				      "bus",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2259  				      "iface",
ef19923ae103b5 Konrad Dybcio         2023-12-04  2260  				      "ahb";
ef19923ae103b5 Konrad Dybcio         2023-12-04  2261  			power-domains = <&gpucc GPU_CC_CX_GDSC>;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2262  			dma-coherent;
ef19923ae103b5 Konrad Dybcio         2023-12-04  2263  		};
ef19923ae103b5 Konrad Dybcio         2023-12-04  2264  
32c5a8b93ba543 Alex Elder            2023-11-24  2265  		ipa: ipa@3f40000 {
32c5a8b93ba543 Alex Elder            2023-11-24  2266  			compatible = "qcom,sm8550-ipa";
32c5a8b93ba543 Alex Elder            2023-11-24  2267  
32c5a8b93ba543 Alex Elder            2023-11-24  2268  			iommus = <&apps_smmu 0x4a0 0x0>,
32c5a8b93ba543 Alex Elder            2023-11-24  2269  				 <&apps_smmu 0x4a2 0x0>;
32c5a8b93ba543 Alex Elder            2023-11-24  2270  			reg = <0 0x3f40000 0 0x10000>,
32c5a8b93ba543 Alex Elder            2023-11-24  2271  			      <0 0x3f50000 0 0x5000>,
32c5a8b93ba543 Alex Elder            2023-11-24  2272  			      <0 0x3e04000 0 0xfc000>;
32c5a8b93ba543 Alex Elder            2023-11-24  2273  			reg-names = "ipa-reg",
32c5a8b93ba543 Alex Elder            2023-11-24  2274  				    "ipa-shared",
32c5a8b93ba543 Alex Elder            2023-11-24  2275  				    "gsi";
32c5a8b93ba543 Alex Elder            2023-11-24  2276  
32c5a8b93ba543 Alex Elder            2023-11-24  2277  			interrupts-extended = <&intc GIC_SPI 654 IRQ_TYPE_EDGE_RISING>,
32c5a8b93ba543 Alex Elder            2023-11-24  2278  					      <&intc GIC_SPI 432 IRQ_TYPE_LEVEL_HIGH>,
32c5a8b93ba543 Alex Elder            2023-11-24  2279  					      <&ipa_smp2p_in 0 IRQ_TYPE_EDGE_RISING>,
32c5a8b93ba543 Alex Elder            2023-11-24  2280  					      <&ipa_smp2p_in 1 IRQ_TYPE_EDGE_RISING>;
32c5a8b93ba543 Alex Elder            2023-11-24  2281  			interrupt-names = "ipa",
32c5a8b93ba543 Alex Elder            2023-11-24  2282  					  "gsi",
32c5a8b93ba543 Alex Elder            2023-11-24  2283  					  "ipa-clock-query",
32c5a8b93ba543 Alex Elder            2023-11-24  2284  					  "ipa-setup-ready";
32c5a8b93ba543 Alex Elder            2023-11-24  2285  
32c5a8b93ba543 Alex Elder            2023-11-24  2286  			clocks = <&rpmhcc RPMH_IPA_CLK>;
32c5a8b93ba543 Alex Elder            2023-11-24  2287  			clock-names = "core";
32c5a8b93ba543 Alex Elder            2023-11-24  2288  
32c5a8b93ba543 Alex Elder            2023-11-24  2289  			interconnects = <&aggre2_noc MASTER_IPA 0 &mc_virt SLAVE_EBI1 0>,
32c5a8b93ba543 Alex Elder            2023-11-24  2290  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_IPA_CFG 0>;
32c5a8b93ba543 Alex Elder            2023-11-24  2291  			interconnect-names = "memory",
32c5a8b93ba543 Alex Elder            2023-11-24  2292  					     "config";
32c5a8b93ba543 Alex Elder            2023-11-24  2293  
32c5a8b93ba543 Alex Elder            2023-11-24  2294  			qcom,qmp = <&aoss_qmp>;
32c5a8b93ba543 Alex Elder            2023-11-24  2295  
32c5a8b93ba543 Alex Elder            2023-11-24  2296  			qcom,smem-states = <&ipa_smp2p_out 0>,
32c5a8b93ba543 Alex Elder            2023-11-24  2297  					   <&ipa_smp2p_out 1>;
32c5a8b93ba543 Alex Elder            2023-11-24  2298  			qcom,smem-state-names = "ipa-clock-enabled-valid",
32c5a8b93ba543 Alex Elder            2023-11-24  2299  						"ipa-clock-enabled";
32c5a8b93ba543 Alex Elder            2023-11-24  2300  
32c5a8b93ba543 Alex Elder            2023-11-24  2301  			status = "disabled";
32c5a8b93ba543 Alex Elder            2023-11-24  2302  		};
32c5a8b93ba543 Alex Elder            2023-11-24  2303  
d0c061e366ed55 Neil Armstrong        2023-01-18  2304  		remoteproc_mpss: remoteproc@4080000 {
d0c061e366ed55 Neil Armstrong        2023-01-18  2305  			compatible = "qcom,sm8550-mpss-pas";
d0c061e366ed55 Neil Armstrong        2023-01-18  2306  			reg = <0x0 0x04080000 0x0 0x4040>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2307  
d0c061e366ed55 Neil Armstrong        2023-01-18  2308  			interrupts-extended = <&intc GIC_SPI 264 IRQ_TYPE_EDGE_RISING>,
d0c061e366ed55 Neil Armstrong        2023-01-18  2309  					      <&smp2p_modem_in 0 IRQ_TYPE_EDGE_RISING>,
d0c061e366ed55 Neil Armstrong        2023-01-18  2310  					      <&smp2p_modem_in 1 IRQ_TYPE_EDGE_RISING>,
d0c061e366ed55 Neil Armstrong        2023-01-18  2311  					      <&smp2p_modem_in 2 IRQ_TYPE_EDGE_RISING>,
d0c061e366ed55 Neil Armstrong        2023-01-18  2312  					      <&smp2p_modem_in 3 IRQ_TYPE_EDGE_RISING>,
d0c061e366ed55 Neil Armstrong        2023-01-18  2313  					      <&smp2p_modem_in 7 IRQ_TYPE_EDGE_RISING>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2314  			interrupt-names = "wdog", "fatal", "ready", "handover",
d0c061e366ed55 Neil Armstrong        2023-01-18  2315  					  "stop-ack", "shutdown-ack";
d0c061e366ed55 Neil Armstrong        2023-01-18  2316  
d0c061e366ed55 Neil Armstrong        2023-01-18  2317  			clocks = <&rpmhcc RPMH_CXO_CLK>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2318  			clock-names = "xo";
d0c061e366ed55 Neil Armstrong        2023-01-18  2319  
1d14bcffb49c9d Rohit Agarwal         2023-07-20  2320  			power-domains = <&rpmhpd RPMHPD_CX>,
1d14bcffb49c9d Rohit Agarwal         2023-07-20  2321  					<&rpmhpd RPMHPD_MSS>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2322  			power-domain-names = "cx", "mss";
d0c061e366ed55 Neil Armstrong        2023-01-18  2323  
d0c061e366ed55 Neil Armstrong        2023-01-18  2324  			interconnects = <&mc_virt MASTER_LLCC 0 &mc_virt SLAVE_EBI1 0>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2325  
d0c061e366ed55 Neil Armstrong        2023-01-18  2326  			memory-region = <&mpss_mem>, <&q6_mpss_dtb_mem>, <&mpss_dsm_mem>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2327  
d0c061e366ed55 Neil Armstrong        2023-01-18  2328  			qcom,qmp = <&aoss_qmp>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2329  
d0c061e366ed55 Neil Armstrong        2023-01-18  2330  			qcom,smem-states = <&smp2p_modem_out 0>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2331  			qcom,smem-state-names = "stop";
d0c061e366ed55 Neil Armstrong        2023-01-18  2332  
d0c061e366ed55 Neil Armstrong        2023-01-18  2333  			status = "disabled";
d0c061e366ed55 Neil Armstrong        2023-01-18  2334  
d0c061e366ed55 Neil Armstrong        2023-01-18  2335  			glink-edge {
d0c061e366ed55 Neil Armstrong        2023-01-18  2336  				interrupts-extended = <&ipcc IPCC_CLIENT_MPSS
d0c061e366ed55 Neil Armstrong        2023-01-18  2337  							     IPCC_MPROC_SIGNAL_GLINK_QMP
d0c061e366ed55 Neil Armstrong        2023-01-18  2338  							     IRQ_TYPE_EDGE_RISING>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2339  				mboxes = <&ipcc IPCC_CLIENT_MPSS
d0c061e366ed55 Neil Armstrong        2023-01-18  2340  						IPCC_MPROC_SIGNAL_GLINK_QMP>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2341  				label = "mpss";
d0c061e366ed55 Neil Armstrong        2023-01-18  2342  				qcom,remote-pid = <1>;
d0c061e366ed55 Neil Armstrong        2023-01-18  2343  			};
d0c061e366ed55 Neil Armstrong        2023-01-18  2344  		};
d0c061e366ed55 Neil Armstrong        2023-01-18  2345  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2346  		lpass_wsa2macro: codec@6aa0000 {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2347  			compatible = "qcom,sm8550-lpass-wsa-macro";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2348  			reg = <0 0x06aa0000 0 0x1000>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2349  			clocks = <&q6prmcc LPASS_CLK_ID_WSA2_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2350  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2351  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2352  				 <&lpass_vamacro>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2353  			clock-names = "mclk", "macro", "dcodec", "fsgen";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2354  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2355  			#clock-cells = <0>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2356  			clock-output-names = "wsa2-mclk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2357  			#sound-dai-cells = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2358  		};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2359  
07c88da81caf0e Neil Armstrong        2023-11-06  2360  		swr3: soundwire@6ab0000 {
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2361  			compatible = "qcom,soundwire-v2.0.0";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2362  			reg = <0 0x06ab0000 0 0x10000>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2363  			interrupts = <GIC_SPI 171 IRQ_TYPE_LEVEL_HIGH>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2364  			clocks = <&lpass_wsa2macro>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2365  			clock-names = "iface";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2366  			label = "WSA2";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2367  
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2368  			pinctrl-0 = <&wsa2_swr_active>;
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2369  			pinctrl-names = "default";
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2370  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2371  			qcom,din-ports = <4>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2372  			qcom,dout-ports = <9>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2373  
4c8bb2d567588c Krzysztof Kozlowski   2023-04-18  2374  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2375  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2376  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2377  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2378  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2379  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2380  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2381  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2382  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2383  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2384  			#address-cells = <2>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2385  			#size-cells = <0>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2386  			#sound-dai-cells = <1>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2387  			status = "disabled";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2388  		};
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2389  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2390  		lpass_rxmacro: codec@6ac0000 {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2391  			compatible = "qcom,sm8550-lpass-rx-macro";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2392  			reg = <0 0x06ac0000 0 0x1000>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2393  			clocks = <&q6prmcc LPASS_CLK_ID_RX_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2394  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2395  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2396  				 <&lpass_vamacro>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2397  			clock-names = "mclk", "macro", "dcodec", "fsgen";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2398  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2399  			#clock-cells = <0>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2400  			clock-output-names = "mclk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2401  			#sound-dai-cells = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2402  		};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2403  
07c88da81caf0e Neil Armstrong        2023-11-06  2404  		swr1: soundwire@6ad0000 {
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2405  			compatible = "qcom,soundwire-v2.0.0";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2406  			reg = <0 0x06ad0000 0 0x10000>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2407  			interrupts = <GIC_SPI 155 IRQ_TYPE_LEVEL_HIGH>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2408  			clocks = <&lpass_rxmacro>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2409  			clock-names = "iface";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2410  			label = "RX";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2411  
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2412  			pinctrl-0 = <&rx_swr_active>;
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2413  			pinctrl-names = "default";
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2414  
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2415  			qcom,din-ports = <1>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2416  			qcom,dout-ports = <11>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2417  
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2418  			qcom,ports-sinterval =		/bits/ 16 <0x03 0x3f 0x1f 0x07 0x00 0x18f 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2419  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x0b 0x01 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2420  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x0b 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2421  			qcom,ports-hstart =		/bits/ 8 <0xff 0x03 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2422  			qcom,ports-hstop =		/bits/ 8 <0xff 0x06 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2423  			qcom,ports-word-length =	/bits/ 8 <0x01 0x07 0x04 0xff 0xff 0x0f 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2424  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0x00 0x01 0xff 0xff 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2425  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
cf58c96c4f82cb Krzysztof Kozlowski   2023-12-12  2426  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x00 0x00 0x00 0x00 0x00 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2427  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2428  			#address-cells = <2>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2429  			#size-cells = <0>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2430  			#sound-dai-cells = <1>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2431  			status = "disabled";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2432  		};
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2433  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2434  		lpass_txmacro: codec@6ae0000 {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2435  			compatible = "qcom,sm8550-lpass-tx-macro";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2436  			reg = <0 0x06ae0000 0 0x1000>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2437  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2438  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2439  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2440  				 <&lpass_vamacro>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2441  			clock-names = "mclk", "macro", "dcodec", "fsgen";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2442  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2443  			#clock-cells = <0>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2444  			clock-output-names = "mclk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2445  			#sound-dai-cells = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2446  		};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2447  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2448  		lpass_wsamacro: codec@6b00000 {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2449  			compatible = "qcom,sm8550-lpass-wsa-macro";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2450  			reg = <0 0x06b00000 0 0x1000>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2451  			clocks = <&q6prmcc LPASS_CLK_ID_WSA_CORE_TX_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2452  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2453  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2454  				 <&lpass_vamacro>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2455  			clock-names = "mclk", "macro", "dcodec", "fsgen";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2456  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2457  			#clock-cells = <0>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2458  			clock-output-names = "mclk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2459  			#sound-dai-cells = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2460  		};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2461  
07c88da81caf0e Neil Armstrong        2023-11-06  2462  		swr0: soundwire@6b10000 {
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2463  			compatible = "qcom,soundwire-v2.0.0";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2464  			reg = <0 0x06b10000 0 0x10000>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2465  			interrupts = <GIC_SPI 170 IRQ_TYPE_LEVEL_HIGH>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2466  			clocks = <&lpass_wsamacro>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2467  			clock-names = "iface";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2468  			label = "WSA";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2469  
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2470  			pinctrl-0 = <&wsa_swr_active>;
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2471  			pinctrl-names = "default";
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2472  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2473  			qcom,din-ports = <4>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2474  			qcom,dout-ports = <9>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2475  
4c8bb2d567588c Krzysztof Kozlowski   2023-04-18  2476  			qcom,ports-sinterval =		/bits/ 16 <0x07 0x1f 0x3f 0x07 0x1f 0x3f 0x18f 0xff 0xff 0x0f 0x0f 0xff 0x31f>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2477  			qcom,ports-offset1 =		/bits/ 8 <0x01 0x03 0x05 0x02 0x04 0x15 0x00 0xff 0xff 0x06 0x0d 0xff 0x00>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2478  			qcom,ports-offset2 =		/bits/ 8 <0xff 0x07 0x1f 0xff 0x07 0x1f 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2479  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2480  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x0f>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2481  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0x08 0xff 0xff 0xff 0xff 0xff 0x18>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2482  			qcom,ports-block-pack-mode =	/bits/ 8 <0x00 0x01 0x01 0x00 0x01 0x01 0x00 0x00 0x00 0x01 0x01 0x00 0x00>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2483  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2484  			qcom,ports-lane-control =	/bits/ 8 <0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2485  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2486  			#address-cells = <2>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2487  			#size-cells = <0>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2488  			#sound-dai-cells = <1>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2489  			status = "disabled";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2490  		};
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2491  
07c88da81caf0e Neil Armstrong        2023-11-06  2492  		swr2: soundwire@6d30000 {
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2493  			compatible = "qcom,soundwire-v2.0.0";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2494  			reg = <0 0x06d30000 0 0x10000>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2495  			interrupts = <GIC_SPI 496 IRQ_TYPE_LEVEL_HIGH>,
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2496  				     <GIC_SPI 520 IRQ_TYPE_LEVEL_HIGH>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2497  			interrupt-names = "core", "wakeup";
ead0f132fc494b Krzysztof Kozlowski   2023-11-29  2498  			clocks = <&lpass_txmacro>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2499  			clock-names = "iface";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2500  			label = "TX";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2501  
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2502  			pinctrl-0 = <&tx_swr_active>;
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2503  			pinctrl-names = "default";
a25d2dbb68aab8 Krzysztof Kozlowski   2023-12-13  2504  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2505  			qcom,din-ports = <4>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2506  			qcom,dout-ports = <0>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2507  			qcom,ports-sinterval-low =	/bits/ 8 <0x01 0x01 0x03 0x03>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2508  			qcom,ports-offset1 =		/bits/ 8 <0x00 0x00 0x01 0x01>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2509  			qcom,ports-offset2 =		/bits/ 8 <0x00 0x00 0x00 0x00>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2510  			qcom,ports-hstart =		/bits/ 8 <0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2511  			qcom,ports-hstop =		/bits/ 8 <0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2512  			qcom,ports-word-length =	/bits/ 8 <0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2513  			qcom,ports-block-pack-mode =	/bits/ 8 <0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2514  			qcom,ports-block-group-count =	/bits/ 8 <0xff 0xff 0xff 0xff>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2515  			qcom,ports-lane-control =	/bits/ 8 <0x01 0x02 0x00 0x00>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2516  
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2517  			#address-cells = <2>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2518  			#size-cells = <0>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2519  			#sound-dai-cells = <1>;
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2520  			status = "disabled";
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2521  		};
61b006389bb7af Krzysztof Kozlowski   2023-04-05  2522  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2523  		lpass_vamacro: codec@6d44000 {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2524  			compatible = "qcom,sm8550-lpass-va-macro";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2525  			reg = <0 0x06d44000 0 0x1000>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2526  			clocks = <&q6prmcc LPASS_CLK_ID_TX_CORE_MCLK LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2527  				 <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2528  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2529  			clock-names = "mclk", "macro", "dcodec";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2530  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2531  			#clock-cells = <0>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2532  			clock-output-names = "fsgen";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2533  			#sound-dai-cells = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2534  		};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2535  
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  2536  		lpass_tlmm: pinctrl@6e80000 {
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  2537  			compatible = "qcom,sm8550-lpass-lpi-pinctrl";
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  2538  			reg = <0 0x06e80000 0 0x20000>,
a5982b39710071 Krzysztof Kozlowski   2023-03-02  2539  			      <0 0x07250000 0 0x10000>;
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  2540  			gpio-controller;
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  2541  			#gpio-cells = <2>;
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  2542  			gpio-ranges = <&lpass_tlmm 0 0 23>;
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  2543  
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  2544  			clocks = <&q6prmcc LPASS_HW_MACRO_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>,
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  2545  				 <&q6prmcc LPASS_HW_DCODEC_VOTE LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  2546  			clock-names = "core", "audio";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2547  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2548  			tx_swr_active: tx-swr-active-state {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2549  				clk-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2550  					pins = "gpio0";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2551  					function = "swr_tx_clk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2552  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2553  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2554  					bias-disable;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2555  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2556  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2557  				data-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2558  					pins = "gpio1", "gpio2", "gpio14";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2559  					function = "swr_tx_data";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2560  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2561  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2562  					bias-bus-hold;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2563  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2564  			};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2565  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2566  			rx_swr_active: rx-swr-active-state {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2567  				clk-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2568  					pins = "gpio3";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2569  					function = "swr_rx_clk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2570  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2571  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2572  					bias-disable;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2573  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2574  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2575  				data-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2576  					pins = "gpio4", "gpio5";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2577  					function = "swr_rx_data";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2578  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2579  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2580  					bias-bus-hold;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2581  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2582  			};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2583  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2584  			dmic01_default: dmic01-default-state {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2585  				clk-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2586  					pins = "gpio6";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2587  					function = "dmic1_clk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2588  					drive-strength = <8>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2589  					output-high;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2590  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2591  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2592  				data-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2593  					pins = "gpio7";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2594  					function = "dmic1_data";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2595  					drive-strength = <8>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2596  					input-enable;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2597  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2598  			};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2599  
c6e5bf9278749e Krzysztof Kozlowski   2024-02-12  2600  			dmic23_default: dmic23-default-state {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2601  				clk-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2602  					pins = "gpio8";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2603  					function = "dmic2_clk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2604  					drive-strength = <8>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2605  					output-high;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2606  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2607  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2608  				data-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2609  					pins = "gpio9";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2610  					function = "dmic2_data";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2611  					drive-strength = <8>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2612  					input-enable;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2613  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2614  			};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2615  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2616  			wsa_swr_active: wsa-swr-active-state {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2617  				clk-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2618  					pins = "gpio10";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2619  					function = "wsa_swr_clk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2620  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2621  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2622  					bias-disable;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2623  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2624  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2625  				data-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2626  					pins = "gpio11";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2627  					function = "wsa_swr_data";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2628  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2629  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2630  					bias-bus-hold;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2631  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2632  			};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2633  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2634  			wsa2_swr_active: wsa2-swr-active-state {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2635  				clk-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2636  					pins = "gpio15";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2637  					function = "wsa2_swr_clk";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2638  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2639  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2640  					bias-disable;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2641  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2642  
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2643  				data-pins {
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2644  					pins = "gpio16";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2645  					function = "wsa2_swr_data";
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2646  					drive-strength = <2>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2647  					slew-rate = <1>;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2648  					bias-bus-hold;
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2649  				};
a10e2244f49a83 Krzysztof Kozlowski   2023-03-10  2650  			};
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  2651  		};
6de7f9c34358ce Krzysztof Kozlowski   2023-02-06  2652  
ffc50b2d382879 Abel Vesa             2023-01-06  2653  		lpass_lpiaon_noc: interconnect@7400000 {
ffc50b2d382879 Abel Vesa             2023-01-06  2654  			compatible = "qcom,sm8550-lpass-lpiaon-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  2655  			reg = <0 0x07400000 0 0x19080>;
ffc50b2d382879 Abel Vesa             2023-01-06  2656  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  2657  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  2658  		};
ffc50b2d382879 Abel Vesa             2023-01-06  2659  
ffc50b2d382879 Abel Vesa             2023-01-06  2660  		lpass_lpicx_noc: interconnect@7430000 {
ffc50b2d382879 Abel Vesa             2023-01-06  2661  			compatible = "qcom,sm8550-lpass-lpicx-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  2662  			reg = <0 0x07430000 0 0x3a200>;
ffc50b2d382879 Abel Vesa             2023-01-06  2663  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  2664  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  2665  		};
ffc50b2d382879 Abel Vesa             2023-01-06  2666  
ffc50b2d382879 Abel Vesa             2023-01-06  2667  		lpass_ag_noc: interconnect@7e40000 {
ffc50b2d382879 Abel Vesa             2023-01-06  2668  			compatible = "qcom,sm8550-lpass-ag-noc";
ffc50b2d382879 Abel Vesa             2023-01-06  2669  			reg = <0 0x07e40000 0 0xe080>;
ffc50b2d382879 Abel Vesa             2023-01-06  2670  			#interconnect-cells = <2>;
ffc50b2d382879 Abel Vesa             2023-01-06  2671  			qcom,bcm-voters = <&apps_bcm_voter>;
ffc50b2d382879 Abel Vesa             2023-01-06  2672  		};
ffc50b2d382879 Abel Vesa             2023-01-06  2673  
ffc50b2d382879 Abel Vesa             2023-01-06  2674  		sdhc_2: mmc@8804000 {
ffc50b2d382879 Abel Vesa             2023-01-06  2675  			compatible = "qcom,sm8550-sdhci", "qcom,sdhci-msm-v5";
ffc50b2d382879 Abel Vesa             2023-01-06  2676  			reg = <0 0x08804000 0 0x1000>;
ffc50b2d382879 Abel Vesa             2023-01-06  2677  
ffc50b2d382879 Abel Vesa             2023-01-06  2678  			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
ffc50b2d382879 Abel Vesa             2023-01-06  2679  				     <GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
ffc50b2d382879 Abel Vesa             2023-01-06  2680  			interrupt-names = "hc_irq", "pwr_irq";
ffc50b2d382879 Abel Vesa             2023-01-06  2681  
ffc50b2d382879 Abel Vesa             2023-01-06  2682  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
ffc50b2d382879 Abel Vesa             2023-01-06  2683  				 <&gcc GCC_SDCC2_APPS_CLK>,
ffc50b2d382879 Abel Vesa             2023-01-06  2684  				 <&rpmhcc RPMH_CXO_CLK>;
ffc50b2d382879 Abel Vesa             2023-01-06  2685  			clock-names = "iface", "core", "xo";
ffc50b2d382879 Abel Vesa             2023-01-06  2686  			iommus = <&apps_smmu 0x540 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  2687  			qcom,dll-config = <0x0007642c>;
ffc50b2d382879 Abel Vesa             2023-01-06  2688  			qcom,ddr-config = <0x80040868>;
1d14bcffb49c9d Rohit Agarwal         2023-07-20  2689  			power-domains = <&rpmhpd RPMHPD_CX>;
ffc50b2d382879 Abel Vesa             2023-01-06  2690  			operating-points-v2 = <&sdhc2_opp_table>;
ffc50b2d382879 Abel Vesa             2023-01-06  2691  
ffc50b2d382879 Abel Vesa             2023-01-06  2692  			interconnects = <&aggre2_noc MASTER_SDCC_2 0 &mc_virt SLAVE_EBI1 0>,
ffc50b2d382879 Abel Vesa             2023-01-06  2693  					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_SDCC_2 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  2694  			interconnect-names = "sdhc-ddr", "cpu-sdhc";
ffc50b2d382879 Abel Vesa             2023-01-06  2695  			bus-width = <4>;
ffc50b2d382879 Abel Vesa             2023-01-06  2696  			dma-coherent;
ffc50b2d382879 Abel Vesa             2023-01-06  2697  
ffc50b2d382879 Abel Vesa             2023-01-06  2698  			/* Forbid SDR104/SDR50 - broken hw! */
ffc50b2d382879 Abel Vesa             2023-01-06  2699  			sdhci-caps-mask = <0x3 0>;
ffc50b2d382879 Abel Vesa             2023-01-06  2700  
ffc50b2d382879 Abel Vesa             2023-01-06  2701  			status = "disabled";
ffc50b2d382879 Abel Vesa             2023-01-06  2702  
ffc50b2d382879 Abel Vesa             2023-01-06  2703  			sdhc2_opp_table: opp-table {
ffc50b2d382879 Abel Vesa             2023-01-06  2704  				compatible = "operating-points-v2";
ffc50b2d382879 Abel Vesa             2023-01-06  2705  
ffc50b2d382879 Abel Vesa             2023-01-06  2706  				opp-19200000 {
ffc50b2d382879 Abel Vesa             2023-01-06  2707  					opp-hz = /bits/ 64 <19200000>;
ffc50b2d382879 Abel Vesa             2023-01-06  2708  					required-opps = <&rpmhpd_opp_min_svs>;
ffc50b2d382879 Abel Vesa             2023-01-06  2709  				};
ffc50b2d382879 Abel Vesa             2023-01-06  2710  
ffc50b2d382879 Abel Vesa             2023-01-06  2711  				opp-50000000 {
ffc50b2d382879 Abel Vesa             2023-01-06  2712  					opp-hz = /bits/ 64 <50000000>;
ffc50b2d382879 Abel Vesa             2023-01-06  2713  					required-opps = <&rpmhpd_opp_low_svs>;
ffc50b2d382879 Abel Vesa             2023-01-06  2714  				};
ffc50b2d382879 Abel Vesa             2023-01-06  2715  
ffc50b2d382879 Abel Vesa             2023-01-06  2716  				opp-100000000 {
ffc50b2d382879 Abel Vesa             2023-01-06  2717  					opp-hz = /bits/ 64 <100000000>;
ffc50b2d382879 Abel Vesa             2023-01-06  2718  					required-opps = <&rpmhpd_opp_svs>;
ffc50b2d382879 Abel Vesa             2023-01-06  2719  				};
ffc50b2d382879 Abel Vesa             2023-01-06  2720  
ffc50b2d382879 Abel Vesa             2023-01-06  2721  				opp-202000000 {
ffc50b2d382879 Abel Vesa             2023-01-06  2722  					opp-hz = /bits/ 64 <202000000>;
ffc50b2d382879 Abel Vesa             2023-01-06  2723  					required-opps = <&rpmhpd_opp_svs_l1>;
ffc50b2d382879 Abel Vesa             2023-01-06  2724  				};
ffc50b2d382879 Abel Vesa             2023-01-06  2725  			};
ffc50b2d382879 Abel Vesa             2023-01-06  2726  		};
ffc50b2d382879 Abel Vesa             2023-01-06  2727  
59e8e44e2f75d9 Dikshita Agarwal      2023-07-04 @2728  		venus: video-codec@aa00000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
