Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE25650285
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Mar 2025 00:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740961372; cv=none; b=Y10dVAWId/8ndBE0tkvwOj6ktY9cyZP6JpfRX2Rrv6HWo9jqU03I9M6pm8lrH3uHD8FcBVBCkcLKMfd22CZcv/UC0f7hMiUrnBPE7df1T9669y806KGZ2AQEj1pgFXutRGKDDu7HkIyTfJ4m99QUlcJQ3uYaxQMRTrVOFVYZYy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740961372; c=relaxed/simple;
	bh=yrBiXPnuMCRP9u373cEe1TC9Tytf372U8j81asAxKL4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tLMAnA4mtF8h/KiU8uyRB5gCnPHyT/dvUNXbKBOvUVh4YpXO2WyOlkfodQrljkxqeqk5Eyy4DQ4kmIGD67rdmSmWjwKMuwAnvxwNFCZO82nMv5H7CIxPwdXUjXSPRQ2zxkzIlnffMfDgCl6H/hjtcwmcbeQFvdrarD54COsyyp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxLh+tV2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxLh+tV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740961371; x=1772497371;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yrBiXPnuMCRP9u373cEe1TC9Tytf372U8j81asAxKL4=;
  b=NxLh+tV2cuk7lVGxoe1R7At/oiuPyYCaD6MG3+boNDDVS+IMSKslJPLB
   2m+lSM9GcbcYgvT4RWdresmNdgpycyLnclKIE3FUJ6af9MzblyzXilpTV
   mRGMfA+OBjtXeGyohtozg5KqRSs+MEXoWq1QUeNhl8qsJ6coEFtsxhlWW
   neTkt1G0l3WdT0zD+QsquvbIwkWM5eM9ywJtnGkaIKMswyNLOjmLyUuf7
   o4eB1XqAy7wVEz8w3f+DFu22ihJm4DpkutjTxcDxJz3StNJ8rrfQVp/14
   sN1Gk38MXzU0Vd3OI2gP62m4CRXN9KOzBR4M6OxgtDCUAWkHJ6BQ7f7I7
   Q==;
X-CSE-ConnectionGUID: EXnOlOiMRrOcfLLJrRgZTg==
X-CSE-MsgGUID: nEyr9FpdStGvITBhYq6fCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11361"; a="41068608"
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="41068608"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 16:22:50 -0800
X-CSE-ConnectionGUID: 7B8Rwr8URqaZJPhhvhqSPQ==
X-CSE-MsgGUID: P7v+P3PoQwOwfZqzIVG8pA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="148657575"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Mar 2025 16:22:48 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tota2-000HkY-2B;
	Mon, 03 Mar 2025 00:22:46 +0000
Date: Mon, 3 Mar 2025 08:22:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [qcom:arm64-for-6.15 36/50]
 arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: eeprom@52: compatible:
 'oneOf' conditional failed, one must be fixed:
Message-ID: <202503030835.5mComyDm-lkp@intel.com>
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
TO: Danila Tikhonov <danila@jiaxyga.com>
CC: Bjorn Andersson <andersson@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux arm64-for-6.15
head:   0e2a500eff87c710f3947926e274fd83d0cabb02
commit: 588a6d006d640fde038d794bbf8db99a2cc2646f [36/50] arm64: dts: qcom: sm7325-nothing-spacewar: Enable camera EEPROMs
:::::: branch date: 5 days ago
:::::: commit date: 5 days ago
config: arm64-randconfig-051-20250302 (https://download.01.org/0day-ci/archive/20250303/202503030835.5mComyDm-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
dtschema version: 2025.3.dev3+gabf9328
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250303/202503030835.5mComyDm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503030835.5mComyDm-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4586.26-4657.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sc7280.dtsi:4037.10-4047.6: Warning (graph_child_address): /soc@0/eud@88e0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: eeprom@52: compatible: 'oneOf' conditional failed, one must be fixed:
>> 	arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: eeprom@52: compatible: 'oneOf' conditional failed, one must be fixed:
   		'puya,p24c64f' does not match 'c00$'
   		'puya,p24c64f' does not match 'c01$'
   		'puya,p24c64f' does not match 'cs01$'
   		'puya,p24c64f' does not match 'c02$'
   		'puya,p24c64f' does not match 'cs02$'
   		'puya,p24c64f' does not match 'mac402$'
   		'puya,p24c64f' does not match 'mac602$'
   		'puya,p24c64f' does not match 'c04$'
   		'puya,p24c64f' does not match 'cs04$'
   		'puya,p24c64f' does not match 'c08$'
--
   	'st,24256e-wl' was expected
   	'puya,p24c64f' does not match '^atmel,24c(32|64)d-wl$'
   	'atmel,24c01' was expected
   	'atmel,24c02' was expected
   	'atmel,24c04' was expected
   	'atmel,24c16' was expected
   	'atmel,24c32' was expected
   	'atmel,24c128' was expected
   	'atmel,24c256' was expected
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: eeprom@52: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: /soc@0/cci@ac4a000/i2c-bus@0/eeprom@52: failed to match any schema with compatible: ['puya,p24c64f', 'atmel,24c64']
   arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: eeprom@51: compatible: 'oneOf' conditional failed, one must be fixed:
   	arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: eeprom@51: compatible: 'oneOf' conditional failed, one must be fixed:
   		'giantec,gt24p128e' does not match 'c00$'
   		'giantec,gt24p128e' does not match 'c01$'
   		'giantec,gt24p128e' does not match 'cs01$'
   		'giantec,gt24p128e' does not match 'c02$'
   		'giantec,gt24p128e' does not match 'cs02$'
   		'giantec,gt24p128e' does not match 'mac402$'
   		'giantec,gt24p128e' does not match 'mac602$'
   		'giantec,gt24p128e' does not match 'c04$'
--
   	'atmel,24c01' was expected
   	'atmel,24c02' was expected
   	'atmel,24c04' was expected
   	'atmel,24c16' was expected
   	'atmel,24c32' was expected
   	'atmel,24c64' was expected
   	'atmel,24c256' was expected
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
   arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: eeprom@51: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/eeprom/at24.yaml#
>> arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: /soc@0/cci@ac4b000/i2c-bus@0/eeprom@51: failed to match any schema with compatible: ['giantec,gt24p128e', 'atmel,24c128']
   arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: eeprom@50: compatible: 'oneOf' conditional failed, one must be fixed:
   	arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: eeprom@50: compatible: 'oneOf' conditional failed, one must be fixed:
   		'giantec,gt24p128e' does not match 'c00$'
   		'giantec,gt24p128e' does not match 'c01$'
   		'giantec,gt24p128e' does not match 'cs01$'
   		'giantec,gt24p128e' does not match 'c02$'
   		'giantec,gt24p128e' does not match 'cs02$'
   		'giantec,gt24p128e' does not match 'mac402$'
   		'giantec,gt24p128e' does not match 'mac602$'
   		'giantec,gt24p128e' does not match 'c04$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
