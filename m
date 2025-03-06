Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D11A0BE0
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Mar 2025 06:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741244268; cv=none; b=gjrXPotOKNmOyiI5aTM9I4PaXRuUWDkE4ininUhArx5O0ISlygf6SJHbpD8LumrceW6+hAsb7rpwTT5IT9EPKDGKHgW0TU16osLs6VhNGxLRJ5jEQmWDhcdiz6ac7P77OO3KoywuoqunI7oLrfzcFGQsZXuqK3VCzbIVTFaIOdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741244268; c=relaxed/simple;
	bh=ThHIYyfUiZOsbdR63rFtM+ybf0exjvfNpwG1V9l+8jg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YGKfrta/AFf194QnruOZi0xReg1bJeFVgJHuXyHLRJFm9y/AEdsxs763syaoc0wc0MtflddJFPQfrWRSYG8ZFKXTZq15jmfm3WH73WHhvZxygAm4OylizYYFyRQ4psGI2RQvg6MZ4KU9kCFCB02+vexBdaURwljDF/TbwKHzq38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LSob3iPP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LSob3iPP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741244266; x=1772780266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ThHIYyfUiZOsbdR63rFtM+ybf0exjvfNpwG1V9l+8jg=;
  b=LSob3iPPNw7zl47mS526az2/n7swKqYsJEwYj4kxvkHNI/9I+TCyOrBK
   mbFMkMzWL32e+ymOeJpa/WytzkLI+RNc1C4HugyS1lw1fy2YDEcQPht8a
   1SYNSTHyGVfBcLu4KG0jTj06965VZuGhTsbwekNU0/rhhwQdik26cWjXe
   MEajwSLZKVj/NLGrXePeD/NDy1yE5o8Cs8bJY8LucSZIlv8ye8N5gkmB+
   wgAk/QGbcs4OeY4s/5yz9BMw14xnuJjrUud8I/o/4/6kav+WryejQA9+U
   +rftwIUeLjD8spisiKm3dp2OYPKcMc7nhcCzY6Nd5wHr1WNwwUbxvRKkm
   g==;
X-CSE-ConnectionGUID: 76OtcBv0Rku9oQ3DYAUshQ==
X-CSE-MsgGUID: cZXc8jo9Te68bgg0rEtpWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="41947968"
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="41947968"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 22:57:44 -0800
X-CSE-ConnectionGUID: CpDyfX0rSfuqnT3XQNZw6Q==
X-CSE-MsgGUID: fs885teqT5uFbT06POg6kQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,225,1736841600"; 
   d="scan'208";a="119624390"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Mar 2025 22:57:42 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tq5Aq-000MfS-2i;
	Thu, 06 Mar 2025 06:57:40 +0000
Date: Thu, 6 Mar 2025 14:57:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/2] dt-bindings: clock: qcom: sm8450-camcc: Allow to
 specify two power domains
Message-ID: <202503061412.rjdcyrSR-lkp@intel.com>
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
In-Reply-To: <20250303225521.1780611-2-vladimir.zapolskiy@linaro.org>
References: <20250303225521.1780611-2-vladimir.zapolskiy@linaro.org>
TO: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Jagadeesh Kona <quic_jkona@quicinc.com>
CC: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
CC: Michael Turquette <mturquette@baylibre.com>
CC: Stephen Boyd <sboyd@kernel.org>
CC: Conor Dooley <conor+dt@kernel.org>
CC: Taniya Das <quic_tdas@quicinc.com>
CC: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-clk@vger.kernel.org

Hi Vladimir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on clk/clk-next krzk/for-next krzk-dt/for-next linus/master v6.14-rc5 next-20250305]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Vladimir-Zapolskiy/dt-bindings-clock-qcom-sm8450-camcc-Allow-to-specify-two-power-domains/20250304-065726
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250303225521.1780611-2-vladimir.zapolskiy%40linaro.org
patch subject: [PATCH 1/2] dt-bindings: clock: qcom: sm8450-camcc: Allow to specify two power domains
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-051-20250305 (https://download.01.org/0day-ci/archive/20250306/202503061412.rjdcyrSR-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250306/202503061412.rjdcyrSR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503061412.rjdcyrSR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: clock-controller@ad00000: power-domains: [[54, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sa8295p-adp.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@20000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@20000: Unevaluated properties are not allowed ('max-speed', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: clock-controller@ad00000: power-domains: [[60, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8540p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('fixed-link', 'max-speed', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: clock-controller@ad00000: power-domains: [[54, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-crd.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: clock-controller@ad00000: power-domains: [[54, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp.dtsi:4074.12-4078.7: Warning (graph_child_address): /soc@0/camss@ac5a000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: clock-controller@ad00000: power-domains: [[54, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa0p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa1p2-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddpcie0p9-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
   arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: wifi@0: 'vddpcie1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/wireless/qcom,ath11k-pci.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: clock-controller@ad00000: power-domains: [[54, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-arcata.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: clock-controller@ad00000: power-domains: [[54, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: clock-controller@ad00000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3438.27-3509.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3530.27-3582.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@ade0000: power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3438.27-3509.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3530.27-3582.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: clock-controller@ade0000: power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3438.27-3509.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3530.27-3582.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@ade0000: power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3438.27-3509.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3530.27-3582.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: clock-controller@ade0000: power-domains: [[98, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3756.27-3831.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3853.27-3909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: ete0: $nodename:0: 'ete0' does not match '^ete(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000: power-domains: [[156, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: display-subsystem@ae00000: interconnects: [[208, 3, 7, 32, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3853.27-3909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: ete0: $nodename:0: 'ete0' does not match '^ete(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000: power-domains: [[138, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: clock-controller@ade0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: display-subsystem@ae00000: interconnects: [[191, 3, 7, 32, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3853.27-3909.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: ete0: $nodename:0: 'ete0' does not match '^ete(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000: power-domains: [[154, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: clock-controller@ade0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: display-subsystem@ae00000: interconnects: [[200, 3, 7, 32, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: ete0: $nodename:0: 'ete0' does not match '^ete(-[0-9]+)?$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,embedded-trace-extension.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@ade0000: power-domains: [[156, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@ade0000: Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: display-subsystem@ae00000: interconnects: [[208, 3, 7, 32, 1, 7]] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: display-subsystem@ae00000: interconnect-names: ['mdp0-mem'] is too short
   	from schema $id: http://devicetree.org/schemas/display/msm/qcom,sm8650-mdss.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
