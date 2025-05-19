Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A0E35897
	for <oe-kbuild@lists.linux.dev>; Mon, 19 May 2025 18:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747678741; cv=none; b=gu43bcHrz/p51OH396f3Rm+aSFJ4qeSuQXehPgRwvNCYd94APwIX+bMsEEJBv6h5K26W5sEYRmeBMW65jzA5tQhgEha3ZXWJsTrxV/ypjm862ajQn6WgM8lDvEzqNqe+HfbWt62Wqtso5GSQCnVf08/oSbtKBBcjrBAn6Cz6aSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747678741; c=relaxed/simple;
	bh=mKxxFO9q4G4d7MNhUGsa6awrDPe9gzIeo0iC2y59U1w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fvk51Xa3TAFPaHX4SueRLN4J7cvyMSLLVWz3al47TdzJfUiXmm35x5zT6yh+ucGH2XjGfHxOyj4YEMo3gl80Kb83lioAd6V0YdVUmDBRFf55HHYiHdfJMXQ9Re3rqvV0aK/6wv51+IFxIOr/csTWR91qLmbIudOHpDpOkMrxEHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bp0SlNga; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bp0SlNga"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747678737; x=1779214737;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=mKxxFO9q4G4d7MNhUGsa6awrDPe9gzIeo0iC2y59U1w=;
  b=bp0SlNgaRuf1M9nfQHsyVY3L0vZy1VZOl7jPafCsa+8M7A61yrIM9ilU
   VYWrUmX52M/PGQlzcmxYLdQ4sTxJKlBnEHI/r1FmBpg3TVYyvyFFt60XR
   3pKa/udhb8MUS8NqgT8WGnj4g3saUlPMYX+tkZe4iHbkQ3TwHnLdSZRcw
   tOqstxnpEh+j3zgLlFg3CJ9MsaCtwUcv11+VaUy/fLaHjLxTmVOkWL2SG
   RRoousnLpPw62YwqWiD5rOWizHekxEg8ZZes7hholX9oS4MpTZ/2MlS/i
   b7rs4eyA3DCyVw/EcGW8dimlezRmzK9Rd6+3xQ02b2ZxTvTuv5keSEaET
   Q==;
X-CSE-ConnectionGUID: A01nMQ49SXSdOlAB4XOkog==
X-CSE-MsgGUID: JSPAOQ32S6KhMomR/Ftv7A==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49728229"
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="49728229"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 May 2025 11:18:46 -0700
X-CSE-ConnectionGUID: 3X+Z+1maQhS2PBJreV6poQ==
X-CSE-MsgGUID: gKAllk6SQ76odvZ6EQzjHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,301,1739865600"; 
   d="scan'208";a="143447367"
Received: from igk-lkp-server01.igk.intel.com (HELO a1decbf9c5f9) ([10.211.3.150])
  by fmviesa003.fm.intel.com with ESMTP; 19 May 2025 11:18:44 -0700
Received: from kbuild by a1decbf9c5f9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uH54T-0000sF-31;
	Mon, 19 May 2025 18:18:41 +0000
Date: Tue, 20 May 2025 02:18:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [krzk-github:pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
 55/83] arch/arm64/boot/dts/qcom/apq8016-sbc.dtb:
 /soc@0/power-manager@b088000: failed to match any schema with compatible:
 ['qcom,msm8916-kpss-acc']
Message-ID: <202505200253.KTboqdWA-lkp@intel.com>
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
CC: Krzysztof Kozlowski <krzk@kernel.org>

tree:   https://github.com/krzk/linux pending/dt-bindings-qcom-new-and-fixes-for-warnings-linux-next
head:   9d5f0863e401cb64a69c27af17034edd01e989b3
commit: 35f6fc60ebb2425c3947dc79c60af0c1c4962483 [55/83] arm64: dts: qcom: msm8916: Fix KPSS ACC compatible
:::::: branch date: 2 weeks ago
:::::: commit date: 10 weeks ago
config: arm64-randconfig-2051-20250516 (https://download.01.org/0day-ci/archive/20250520/202505200253.KTboqdWA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev27+g32749b3
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250520/202505200253.KTboqdWA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505200253.KTboqdWA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: bridge@39 (adi,adv7533): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
>> arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/apq8016-sbc.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dtb: bridge@39 (adi,adv7533): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
>> arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/apq8016-sbc-d3-camera-mezzanine.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/apq8016-schneider-hmibsc.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8216-samsung-fortuna3g.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-acer-a1-724.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-alcatel-idol347.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-asus-z00l.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-gplus-fl8005a.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-huawei-g7.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-lg-c50.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/i2c@78b9000/touchscreen@34: failed to match any schema with compatible: ['melfas,mip4_ts']
>> arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-lg-m216.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-longcheer-l8150.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dts:93.20-127.4: Warning (avoid_unnecessary_addr_size): /soc@0/i2c@78b6000/led-controller@30: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-longcheer-l8910.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-motorola-harpia.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-motorola-osprey.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-motorola-surnia.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-mtp.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-a3u-eur.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-a5u-eur.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-e5.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-e7.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-e7.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-e7.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-e7.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-gprimeltecan.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: touchscreen@50 (imagis,ist3038): linux,keycodes: False schema does not allow [580, 158]
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/imagis,ist3038c.yaml#
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: touchscreen@50 (imagis,ist3038): linux,keycodes: [580, 158] is too short
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/imagis,ist3038c.yaml#
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-grandmax.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-grandprimelte.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dtb: panel@0 (samsung,ltl101at01): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#
   arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-gt510.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb: panel@0 (samsung,lsl080al03): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/display/panel/samsung,s6d7aa0.yaml#
>> arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-gt58.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-j3ltetw.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-j5.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-j5x.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-j5x.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-j5x.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-j5x.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: touchscreen@50 (imagis,ist3038): linux,keycodes: False schema does not allow [580, 158]
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/imagis,ist3038c.yaml#
   arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: touchscreen@50 (imagis,ist3038): linux,keycodes: [580, 158] is too short
   	from schema $id: http://devicetree.org/schemas/input/touchscreen/imagis,ist3038c.yaml#
   arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-rossa.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-samsung-serranove.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-thwc-uf896.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-thwc-ufi001c.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-wingtech-wt88047.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1582.27-1630.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:462.26-465.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/base1@d0: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s0-p1@d0)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:477.26-480.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s1-p1@d2: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s1-p2@d2)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:490.26-493.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s2-p2@d4: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s4-p1@d4)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:502.26-505.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@5c000/s4-p2@d5: duplicate unit-address (also used in node /soc@0/qfprom@5c000/s5-p1@d5)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1569.11-1579.7: Warning (graph_child_address): /soc@0/display-subsystem@1a00000/display-controller@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/msm8916-yiming-uz801v3.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
--
   arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: bridge@39 (adi,adv7533): #sound-dai-cells: 0 was expected
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml#
   arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
>> arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']
   arch/arm64/boot/dts/qcom/apq8016-sbc-usb-host.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-kpss-acc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
