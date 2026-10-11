Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B84411B3925
	for <oe-kbuild@lists.linux.dev>; Sun, 11 Oct 2026 02:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791684583; cv=none; b=cLhEV/yvj/1qx6pIVOEaQZmLC66G9MK0boiH2VeM4+4jOn8JT/Ip6YeWjwRPmLqvrZ6SXd44UoIJpGMdc7loWCr646v+3KWOrGKeNUkb1Y6BFLjq+yYtqseWxNjg9b+utNYTSz6N+4qPqExKlii+rZ7jaE9aaBmRueAZUH1+Dxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791684583; c=relaxed/simple;
	bh=8Q8tCVp31SraX0PG0STbu53pm72q4Ab7v8J1Npe8JcA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lWTH4pfbusMeO1WkKDUzpnR0J0lDGtR5sM4T8dqfzhYCERRbqmV+vZOvyuRVDClgi7PVo0ZFtSJsxVXLR1+P4F11AvsHhByaco4M2YPmJYbGraOqlZ5QqYn0RTYrvp2zC+GP7aMurD59bC/8aAenaeffDWkJ4bltGYQrbipqeXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BLsNwDD4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BLsNwDD4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791684582; x=1823220582;
  h=date:from:to:cc:subject:message-id;
  bh=8Q8tCVp31SraX0PG0STbu53pm72q4Ab7v8J1Npe8JcA=;
  b=BLsNwDD4K7BYbXO45/u97jY9c8v7z/RfbBpOyXhcsOnLvNCSglXWU/xt
   OnhfECxYvqcgblAWuewYYtAqgH2cVhrP1KSW1AHw+YA53Cz7b++rLhCCQ
   J3x2KV2kJxWaQYJQSUNIeVTxL88EhuBbxEd1/trJrDjVGFFcc0HKIISb6
   FGtd1npON4AGtLsPQ3CAmnGkwvNqcuOjm+TOmoF0mKF08KVr5+XMJZEA/
   0011jAEa7GzrpS02QcRXfD8F28fmuvU2aj6Zin7KUq64f2GLO+7adO1z+
   OnsKI9URxzMFLHDGRwjCe9sO9W8xC44Ry4+XHXQ5w8rYp1NArT4y7EAIO
   Q==;
X-CSE-ConnectionGUID: d0jCZdB1TxipAp0pV029+g==
X-CSE-MsgGUID: JzpxAQlMSnivWSwspmCfTg==
X-IronPort-AV: E=McAfee;i="6800,10657,11931"; a="530459"
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="530459"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2026 19:09:41 -0700
X-CSE-ConnectionGUID: N6A/jTsXRROZpjQ4aPRReQ==
X-CSE-MsgGUID: x20kKlDgT3uGpWGP6oxg+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,150,1787036400"; 
   d="scan'208";a="586404"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 10 Oct 2026 19:09:41 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xFj0M-000000009MP-0ajs;
	Sun, 11 Oct 2026 02:09:38 +0000
Date: Sun, 11 Oct 2026 04:09:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-7.4 187/323]
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: sram@8600000
 (qcom,ipq5424-imem): compatible:1: 'syscon' was expected
Message-ID: <202610110308.CJSi3Q3Y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Dmitry Baryshkov <lumag@kernel.org>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-7.4
head:   d053e38e614fb2e383b298ce8fc308a780d7f209
commit: 6baef5b6e13d74ddda929d3a9c40b855622205a1 [187/323] arm64: dts: qcom: ipq5424: Add the IMEM node
:::::: branch date: 9 days ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-2403-20261001 (https://download.01.org/0day-ci/archive/20261011/202610110308.CJSi3Q3Y-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project d7e4505dd447d115d85fdea45cd71030ac1d86ee)
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261011/202610110308.CJSi3Q3Y-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610110308.CJSi3Q3Y-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:308.30-311.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/s10@3dd: duplicate unit-address (also used in node /soc@0/efuse@a4000/s11@3dd)
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:318.30-321.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/s12@3de: duplicate unit-address (also used in node /soc@0/efuse@a4000/s13@3de)
   arch/arm64/boot/dts/qcom/ipq5424.dtsi:338.25-341.6: Warning (unique_unit_address_if_enabled): /soc@0/efuse@a4000/mode@419: duplicate unit-address (also used in node /soc@0/efuse@a4000/base0@419)
   arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: sram@8600000 (qcom,ipq5424-imem): 'no-memory-wc' does not match any of the regexes: '^minidump-sram@[0-9a-f]+$', '^modem-tables@[0-9a-f]+$', '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
>> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: sram@8600000 (qcom,ipq5424-imem): compatible:1: 'syscon' was expected
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml
>> arch/arm64/boot/dts/qcom/ipq5424-rdp466.dtb: sram@8600000 (qcom,ipq5424-imem): compatible: ['qcom,ipq5424-imem', 'mmio-sram'] is too short
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
