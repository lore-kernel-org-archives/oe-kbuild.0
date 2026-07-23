Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F3AB256C84
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jul 2026 05:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784782837; cv=none; b=DQeVkaSBLFWCI/k/LOyPJv/4WtDbfJQqbUZBXth6ntbAnrpzVOR7ZKPK5LBM2CdeZefbROAurpEjk5RSulLOuc2qbCE0XCevJw5J1/ue4hdF/2nIxhLRqUGJSUafV4O8lbwyw4g/+X+u5vDk8jTELq2oPdxZ+knL95sG6H8XnZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784782837; c=relaxed/simple;
	bh=Z0g/zDHEAoxA4P4zcXXi0uTHPJIJ9IcGKMDc6i0nsu4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z+uC3XQnSFWJlYvVUP2iscjTcy9f/BMDLxYRpmALOyXnP7TbG68PFciWqyHP8jkbhwH4ZfCqPezSu11H69Lvc0yf1jIZzkMrNxq788NRNWuhVQw+aOFEmZqAO/skFany6hfTMEm5ufPyYex94f1gThus4QkAx5Nzz345Y/k5jzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dMESoihL; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dMESoihL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784782835; x=1816318835;
  h=date:from:to:cc:subject:message-id;
  bh=Z0g/zDHEAoxA4P4zcXXi0uTHPJIJ9IcGKMDc6i0nsu4=;
  b=dMESoihLunPxyPx/Z19Ll+rPBgTyyHIHZg25aFgCUCFnyD2o54fMIpso
   fGT72TLi4zgoBEQ2PIGKGn+dmSXrPCGeq5GFLCkwW5Nr0wgRh55+HX5Ll
   ErduAvz4CIPkK6U2XJX4RPf8XwfixO2pcvqqvQW+cKHfeHhjFFmAJCMGb
   rw6gj5HK60LP6cK7gTYnxGA752Z0xFNaJ7DL0iPVeflM48c26GuUxUsdM
   fLMyrFRIywg/MCPYeB63074w0cC9R4Ayz9JIRSnYsLwEDkgOALcqyn+hL
   +yr3OgrxTu/cXwPmRnmKdT37LmmNNjk9zAt+OhuRO1dH41uu98eIQFxPb
   Q==;
X-CSE-ConnectionGUID: aTCms6uyTvKGpTw8afFldQ==
X-CSE-MsgGUID: v7VGjKR7QbKWJXb1/PtBbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="89251508"
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="89251508"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 22:00:35 -0700
X-CSE-ConnectionGUID: 4cITz0BXTAG7t1wQxgHXPQ==
X-CSE-MsgGUID: Z6MMLWL+TICKbknsP8rm9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,179,1779174000"; 
   d="scan'208";a="255647042"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 22 Jul 2026 22:00:34 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmlXr-000000000gw-434K;
	Thu, 23 Jul 2026 05:00:31 +0000
Date: Thu, 23 Jul 2026 07:00:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb:
 /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any
 schema with compatible: ['lg,sw49410-lh609qh1', 'lg,sw49410']
Message-ID: <202607230605.zYSNspDF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Paul Sajna <sajattack@postmarketos.org>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Amir Dahan <system64fumo@tuta.io>
CC: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
CC: Dmitry Baryshkov <lumag@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4539944e515183668109bdf4d0c3d7d228383d88
commit: c6c66aa3ef33dc3076c6dac64003b29bd9515b58 arm64: dts: qcom: sdm845-lg-judyln: Add display panel
date:   4 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 4 months ago
config: arm64-randconfig-2055-20260721 (https://download.01.org/0day-ci/archive/20260723/202607230605.zYSNspDF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 10.5.0
dtschema: 2026.7.dev1+g2203c1720
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260723/202607230605.zYSNspDF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: c6c66aa3ef33 ("arm64: dts: qcom: sdm845-lg-judyln: Add display panel")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607230605.zYSNspDF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sdm845.dtsi:4861.27-4916.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/pmi8998.dtsi:71.20-79.5: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@c440000/pmic@3/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/sdm845.dtsi:1222.44-1225.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@784000/hstx-trim-primary@1eb: duplicate unit-address (also used in node /soc@0/qfprom@784000/hstx-trim-secondary@1eb)
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: ipa@1e40000 (qcom,sdm845-ipa): 'sram' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ipa.yaml
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['lg,sw49410-lh609qh1', 'lg,sw49410']
>> arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: /soc@0/display-subsystem@ae00000/dsi@ae94000/panel@0: failed to match any schema with compatible: ['lg,sw49410-lh609qh1', 'lg,sw49410']
   arch/arm64/boot/dts/qcom/sdm845-lg-judyln.dtb: sram@14680000 (qcom,sdm845-imem): 'modem-tables@3d000' does not match any of the regexes: '^pil-reloc@[0-9a-f]+$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/sram/qcom,imem.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
