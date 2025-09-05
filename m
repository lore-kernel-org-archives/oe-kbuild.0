Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93E72701CF
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Sep 2025 09:44:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757065500; cv=none; b=itLCNGR7aj4+0ua9uxPc95FhggooUwnsBF0MX/W7NCjvoFJVKVUbymmU1ZYzslA9jRvD1Q62BBTstArAzPqNw8XYi1xu8t2XyFFp7DX/icdys9+vgZHZAiQcU8JiLYW+LQTN8Y8aeaNyBaSg9PZk1zDnjc0rRjbI8EZiZlgEaYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757065500; c=relaxed/simple;
	bh=D8b0243uPfC1U7d+jxn5Ap2J/+n1m0dXK9fHF/P3umo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RC044P5Rr7J5R0C5rQO5U0LWlvrgFPeSR61przkMN3KOKk2+kx7vgU+nMg3K0Fte04K05UDWICjSS76zpVYLM9qXRF8Y4xwPv+W4a3CBh3En3Vb9Ce3+XBFolbVk8Dx0qFvTV+99hMf5c8zqdWRKYoGEEJWW2IkkSFVjaq15nxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cswLw9HL; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cswLw9HL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757065498; x=1788601498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D8b0243uPfC1U7d+jxn5Ap2J/+n1m0dXK9fHF/P3umo=;
  b=cswLw9HLpdyKw7f02Tstl+AM4GKK5KS5ob69cd8PEbET3pdbi5t+MZeA
   IexbJvEyBonHcom2H4UJYKWmozYspSuU4LQDg08RmkB1q3il8+G1i/XJn
   mtSB29pEExMiafsP/1ko5yL2brblzfnoPln6tl/c34C5dyOPsEP5qkTCR
   zDtrjuWbNPSlSZvwZbgIVevncfp8bUejDnUenrvxsiquEcipkFL75t7Lu
   VC+W6WGANMAMEx9nSmmFEO3Ww50ZkcH0IXbr3j4D/iuB8wR3nTIMM+8Bl
   72CJBynDDbGe2Lkh/RhVFh5IIuLte/KOAryxiy5wnypA/x5YzYozaZQPF
   Q==;
X-CSE-ConnectionGUID: HnfC++CSSV2ECMEVa13Dqg==
X-CSE-MsgGUID: /HKRszIwTUKZGXvmOjU03w==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59334841"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59334841"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 02:44:58 -0700
X-CSE-ConnectionGUID: Mcx2VjaZQqyr45FX150+3w==
X-CSE-MsgGUID: nEM/8bf5Tr+pnkLRycfGVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,240,1751266800"; 
   d="scan'208";a="176224488"
Received: from lkp-server01.sh.intel.com (HELO 114d98da2b6c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Sep 2025 02:44:57 -0700
Received: from kbuild by 114d98da2b6c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uuT01-0000H1-1Y;
	Fri, 05 Sep 2025 09:44:53 +0000
Date: Fri, 5 Sep 2025 17:44:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/2] This patch adds a new device tree binding
 documentation.
Message-ID: <202509051737.5JZH3tvV-lkp@intel.com>
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
In-Reply-To: <20250903123825.1721443-2-syyang@lontium.com>
References: <20250903123825.1721443-2-syyang@lontium.com>
TO: syyang <syyang@lontium.com>
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
TO: andrzej.hajda@intel.com
TO: neil.armstrong@linaro.org
TO: rfoss@kernel.org
CC: Laurent.pinchart@ideasonboard.com
CC: jonas@kwiboo.se
CC: jernej.skrabec@gmail.com
CC: devicetree@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: yangsunyun1993@gmail.com
CC: syyang <syyang@lontium.com>

Hi syyang,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.17-rc4 next-20250904]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/syyang/This-patch-adds-a-new-device-tree-binding-documentation/20250904-142755
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250903123825.1721443-2-syyang%40lontium.com
patch subject: [PATCH v1 1/2] This patch adds a new device tree binding documentation.
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm64-randconfig-051-20250905 (https://download.01.org/0day-ci/archive/20250905/202509051737.5JZH3tvV-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 2e122990391b2ba062e6308a12cfedf7206270ba)
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509051737.5JZH3tvV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202509051737.5JZH3tvV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4817.26-4890.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4085.10-4095.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: /soc@0/geniqup@9c0000/i2c@980000/hdmi-bridge@2b: failed to match any schema with compatible: ['lontium,lt9611uxc']
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
--
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1834.27-1907.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/qcm2290.dtsi:1792.11-1802.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /soc@0/camss@5c6e000: failed to match any schema with compatible: ['qcom,qcm2290-camss']
>> arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: /i2c/hdmi-bridge@2b: failed to match any schema with compatible: ['lontium,lt9611uxc']
--
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1950.27-2021.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@5e00000/dsi@5e94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm6115.dtsi:1908.11-1918.7: Warning (graph_child_address): /soc@0/display-subsystem@5e00000/display-controller@5e01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: /i2c/hdmi-bridge@2b: failed to match any schema with compatible: ['lontium,lt9611uxc']
--
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2166.4-2169.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2288.4-2291.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8250.dtsi:2415.4-2418.30: Warning (interrupt_map): /soc@0/pcie@1c10000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/qrb5165-rb5.dtb: /soc@0/geniqup@9c0000/i2c@994000/hdmi-bridge@2b: failed to match any schema with compatible: ['lontium,lt9611uxc']
--
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4723.27-4776.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4797.27-4850.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
>> arch/arm64/boot/dts/qcom/sdm845-db845c.dtb: /soc@0/geniqup@ac0000/i2c@a88000/hdmi-bridge@3b: failed to match any schema with compatible: ['lontium,lt9611']
--
   arch/arm64/boot/dts/qcom/pm8150b.dtsi:164.9-179.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8150.dtsi:1869.4-1872.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8150.dtsi:1984.4-1987.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8150-hdk.dtb: /soc@0/geniqup@ac0000/i2c@a84000/hdmi-bridge@3b: failed to match any schema with compatible: ['lontium,lt9611']
--
   arch/arm64/boot/dts/qcom/sm8350.dtsi:3045.27-3123.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8350.dtsi:1554.4-1557.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8350.dtsi:1554.4-1557.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8350.dtsi:1554.4-1557.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8350.dtsi:1554.4-1557.30: Warning (interrupt_map): /soc@0/pcie@1c00000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8350.dtsi:1665.4-1668.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8350.dtsi:1665.4-1668.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8350.dtsi:1665.4-1668.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
   arch/arm64/boot/dts/qcom/sm8350.dtsi:1665.4-1668.30: Warning (interrupt_map): /soc@0/pcie@1c08000:interrupt-map: Missing property '#address-cells' in node /soc@0/interrupt-controller@17a00000, using 0 as fallback
>> arch/arm64/boot/dts/qcom/sm8350-hdk.dtb: /soc@0/geniqup@8c0000/i2c@884000/hdmi-bridge@2b: failed to match any schema with compatible: ['lontium,lt9611uxc']
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3501.27-3574.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3595.27-3649.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: /soc@0/geniqup@ac0000/i2c@a84000/hdmi-bridge@2b: failed to match any schema with compatible: ['lontium,lt9611uxc']
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@aaf0000 (qcom,sm8450-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): power-domains: [[106, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: clock-controller@ade0000 (qcom,sm8450-camcc): required-opps: [[55]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3824.27-3898.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3919.27-3974.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: /soc@0/geniqup@ac0000/i2c@a80000/hdmi-bridge@2b: failed to match any schema with compatible: ['lontium,lt9611uxc']
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@aaf0000 (qcom,sm8550-videocc): Unevaluated properties are not allowed ('power-domains', 'required-opps' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): power-domains: [[56, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: clock-controller@ade0000 (qcom,sm8550-camcc): required-opps: [[33]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5295.27-5370.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:5392.27-5448.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:834.9-845.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: /soc@0/geniqup@ac0000/i2c@a98000/hdmi-bridge@2b: failed to match any schema with compatible: ['lontium,lt9611uxc']
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
--
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: /soc@0/geniqup@9c0000/i2c@980000/hdmi-bridge@2b: failed to match any schema with compatible: ['lontium,lt9611uxc']
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-industrial-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
--
>> arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: /soc@0/geniqup@9c0000/i2c@980000/hdmi-bridge@2b: failed to match any schema with compatible: ['lontium,lt9611uxc']
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
   arch/arm64/boot/dts/qcom/qcs6490-rb3gen2-vision-mezzanine.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[355, 356]] is too short
   	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
--
>> arch/arm64/boot/dts/qcom/qrb5165-rb5-vision-mezzanine.dtb: /soc@0/geniqup@9c0000/i2c@994000/hdmi-bridge@2b: failed to match any schema with compatible: ['lontium,lt9611uxc']
--
>> arch/arm64/boot/dts/qcom/sdm845-db845c-navigation-mezzanine.dtb: /soc@0/geniqup@ac0000/i2c@a88000/hdmi-bridge@3b: failed to match any schema with compatible: ['lontium,lt9611']
--
>> arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: /soc@0/geniqup@ac0000/i2c@a98000/hdmi-bridge@2b: failed to match any schema with compatible: ['lontium,lt9611uxc']
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@aaf0000 (qcom,sm8650-videocc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-videocc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): power-domains: [[79, 6]] is too short
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#
   arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtb: clock-controller@ade0000 (qcom,sm8650-camcc): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-camcc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
