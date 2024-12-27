Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B2417E0
	for <oe-kbuild@lists.linux.dev>; Fri, 27 Dec 2024 11:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735297423; cv=none; b=Pz4Iu3v5ixT4Gp0Bvg1ZgRtmmaMP/xmgk+nJKDNkGNID8JImM7rollBe+4B2CE91vVrv6bg7Ml3zgnBVFWFyL7R1RHccbeMRQyEYVvOCPLYiU13alGJMdFKHO1hkWeHV2zc/cvY2+cbCEmpCK3BjlUVV2QzBd5rIXu29FbBDDq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735297423; c=relaxed/simple;
	bh=DeDt2t7Wd+GBM34CThCxpSax4PjRo0QbUJQLX52PM7c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=L2WtrGPs+v1N2V9XHeHG8HeldiCdNjMxz11M4eRHsEqiWK2VhTITtsxJciz7G/SUx7B1hXwDndWClKSJ+AcREbrk4GAIwU2tuIqtDdfJpUdj1iBr8QErwjXzdwqaCtT32p0IuR07PW47cZvJGt7bsJeFmmbzf6V/aizJzWRIM4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c/xwk8iY; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c/xwk8iY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735297421; x=1766833421;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DeDt2t7Wd+GBM34CThCxpSax4PjRo0QbUJQLX52PM7c=;
  b=c/xwk8iY1EDjG7/K/dZlWbiMeKrbaWPJI1FSBHWklNxsbDzO6tNoNkE2
   1c26asnEKVJtCCm33wYWK2paTO7AgDqk0SwvOpTzfY0H1A8FpAaFNLNyK
   d6zVI+EIgRjRhueqeR5Y5xtTYG8Bv/3KNeBEJ+haL6wVB8+1PgUZWUhX7
   b77+CKlk3IdWH6xMZkO0Etk9mXwg1NifT7SHTV/MQX5isqsEF7jqdH8St
   yWCNokfddNpXfZpEN4BFWeNWG/OKJFw5tvxbRUH+K1qYY37lJ1ZVHpr6r
   8HVjZNZdBT8MUubK4F/hmCMRzOQ3Yd1kBCS7TZRPSSNVWIVsFFbfWxifr
   Q==;
X-CSE-ConnectionGUID: 4ESH6XfiS+yd9RV9AbwQig==
X-CSE-MsgGUID: l1L2HhhFS8yLQUoqVoz6xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="46196287"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="46196287"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 03:03:40 -0800
X-CSE-ConnectionGUID: 8sgskB4iTy+7si5JuaoV5A==
X-CSE-MsgGUID: yOTq0lPBTqKDzVpERAPpvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="105225072"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 27 Dec 2024 03:03:37 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tR87v-00039W-1O;
	Fri, 27 Dec 2024 11:03:31 +0000
Date: Fri, 27 Dec 2024 19:03:25 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.14 61/123]
 arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb:
 usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
Message-ID: <202412271814.RGc7RfHj-lkp@intel.com>
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
TO: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.14
head:   1caf6149c3bf41a2ee07869449c4ea1ec8bbc2f8
commit: c910544d2234709660d60f80345c285616e73b1c [61/123] arm64: dts: qcom: msm8994: Describe USB interrupts
:::::: branch date: 7 hours ago
:::::: commit date: 14 hours ago
config: arm64-randconfig-051-20241227 (https://download.01.org/0day-ci/archive/20241227/202412271814.RGc7RfHj-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev5+gea243eb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241227/202412271814.RGc7RfHj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202412271814.RGc7RfHj-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8994.dtsi:639.28-655.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@f9928000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-lg-bullhead-rev-10.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-lg-h815.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: /soc@0/i2c@f9924000/tas2553@40: failed to match any schema with compatible: ['ti,tas2552']
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible: ['ad,ad7147_captouch']
   arch/arm64/boot/dts/qcom/msm8992-msft-lumia-octagon-talkman.dtb: /soc@0/spi@f9966000/ice5lp2k@0: failed to match any schema with compatible: ['lattice,ice40-fpga-mgr']
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8992-xiaomi-libra.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-huawei-angler-rev-101.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: /soc@0/i2c@f9924000/tas2553@40: failed to match any schema with compatible: ['ti,tas2552']
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: /soc@0/i2c@f9963000/touch@2c: failed to match any schema with compatible: ['ad,ad7147_captouch']
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon-cityman.dtb: /soc@0/spi@f9966000/ice5lp2k@0: failed to match any schema with compatible: ['lattice,ice40-fpga-mgr']
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/msm8994.dtsi:639.28-655.5: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@f9928000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
--
   arch/arm64/boot/dts/qcom/pm8994.dtsi:131.9-150.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb: usb@f92f8800: interrupt-names:1: 'hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb: usb@f92f8800: interrupt-names:2: 'dp_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dtb: usb@f92f8800: interrupt-names:3: 'dm_hs_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
