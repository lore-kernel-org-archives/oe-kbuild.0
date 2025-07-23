Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C840923B623
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Jul 2025 23:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753314277; cv=none; b=pCdPBGJf7ORTTFQ7THto2RRmO6VxYf4ViZBL/Wfu4GpJnQRxAUvVSb94324t8SsdwhdP547cVKJiq2i0Cl2LowKH8ans1YLtX6F1lIx/lM0ie+qMk2OLWkL/Ms7z8vY/hOF85i11wUeEXSRZk7Bbb+WXgI/KwvBDECrbcOyJknM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753314277; c=relaxed/simple;
	bh=/j0ZzvoGWK/uhst/XRH64Fnvl+SE4ZUNB/gxVMoQG+o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QStzdAFY5Z9dWYB/N5+DVBwzaqzNwlziW1mv0AC6jh6LgRd5K/thQmjLMzmTYpG1R4+mPm8rF36DEKAKFW+1V1/Avm/0JUzCp3bWS/vHw/S7lM4bkTfYz1E2P0XFL9KRoxvGknZJ1vTH86Di0N9d5RO4Gj4b1XTMeJKTi+5RGD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dpr28f+l; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dpr28f+l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753314276; x=1784850276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/j0ZzvoGWK/uhst/XRH64Fnvl+SE4ZUNB/gxVMoQG+o=;
  b=Dpr28f+lV06HxjVxtwv/EeZLougRMqvXwvc0Kby1G0dzNMVGXOEYoUvz
   FRulxVx/tJZi7GCciz6GWtfmtfC7mjZt2G3szOaJEI+ABwXY8ryvVBkva
   1l2tBvVWDU9sibJLrpZ7sPqyEsFdMzHb1t/OW5wR02ri9nhuF0pWZnM85
   rLFDFYAnLfBsAawlJEnFB3xtbAX6gaw5Vl5TQ5z+U1QOHvSJpdRKpVf+2
   718vPUBLVcsYMB7y9ZNzl1UyzbgjGHuLxlBpEVNFn41+13gHzQErSZk2c
   J7ZSU2YHMcoq883KD0Xj7FHXw0mLnrgeh2a/kkNA2vU35kYDFsMF092cr
   Q==;
X-CSE-ConnectionGUID: TVhSZ4TdT3yMf6j+fEIIXA==
X-CSE-MsgGUID: hP0NLKzjSTSULwIWM3qDFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="55555160"
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="55555160"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 16:44:36 -0700
X-CSE-ConnectionGUID: 9YVJw2gKQsqLQwyJIyUb+w==
X-CSE-MsgGUID: tFDyOdkDRzeCrLih6aPMJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,335,1744095600"; 
   d="scan'208";a="159844701"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 23 Jul 2025 16:44:35 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uej8S-000JtL-20;
	Wed, 23 Jul 2025 23:44:32 +0000
Date: Thu, 24 Jul 2025 07:44:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000
 (ralink,rt3050-usb): Unevaluated properties are not allowed ('compatible'
 was unexpected)
Message-ID: <202507240700.OVZDRMcD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: too old problem, older than 3 months"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Neil Armstrong <neil.armstrong@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f9af7b5d9349bf92cc4d0a0baa8a151295f12f4b
commit: b38aa697bcdc6529a912c18ddd093b1329b3d8b1 dt-bindings: usb: dwc2: switch to unevaluatedProperties
date:   1 year, 1 month ago
:::::: branch date: 2 hours ago
:::::: commit date: 1 year, 1 month ago
config: mips-randconfig-051-20250724 (https://download.01.org/0day-ci/archive/20250724/202507240700.OVZDRMcD-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507240700.OVZDRMcD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507240700.OVZDRMcD-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'st,stm32f7-hsotg' was expected
   	'st,stm32mp15-fsotg' was expected
   	'st,stm32mp15-hsotg' was expected
   	'samsung,s3c6400-hsotg' was expected
   	'intel,socfpga-agilex-hsotg' was expected
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000 (ralink,rt3050-usb): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000 (ralink,rt3050-usb): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
>> arch/mips/boot/dts/ralink/rt3052_eval.dtb: usb@101c0000 (ralink,rt3050-usb): Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/dwc2.yaml#
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: /usb@101c0000: failed to match any schema with compatible: ['ralink,rt3050-usb', 'snps,dwc2']
   arch/mips/boot/dts/ralink/rt3052_eval.dtb: cfi@1f000000 (cfi-flash): $nodename:0: 'cfi@1f000000' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
