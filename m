Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B366C24BBE4
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Aug 2025 02:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756522156; cv=none; b=ld7iLpzOxXGogKDCouOwPv2A1JBAjTd3KD15tCwTsgSjw5gPHdbD0AMfiVCidnK7tGb5jKvqNR17NHmhRkYfkLID5CnJpTCXIr3WxlKjI/9+pDvzzekPLHvMzMbiChSbmexFIGd8h8PjCZ0p5A6sMkUt5OxVpJMheBQoHaKCelo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756522156; c=relaxed/simple;
	bh=8dRGjmjBzhnjRGZRITc1/fMWgJDV/ZTuqTYqhQEd0wc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MQw43aJYL4KaxhVzktGE4N3WkxTVCvSP7D8d1UkK9DE0/HMQzjLCJ+A2ihnAiCp5gWytIplt6AIJFUasdQWPjq1ELRWarc+dL/sOSvWqk1DORQRvr21YSdZAfSBuyX6/DIDmP0He0e+wFnoohB65ObMuVfh8Xt8mOOB9yZSDBZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtWNX8zm; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtWNX8zm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756522155; x=1788058155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8dRGjmjBzhnjRGZRITc1/fMWgJDV/ZTuqTYqhQEd0wc=;
  b=XtWNX8zmdsNy2IwiuCAjQRVuSKVtp1E7Y+F6jwKTve+AxiTn8UYv6plF
   /eury/vXFzQvf8zOTVKO+rr0xWhdxHRlkRnb02K18W3Co9z1X/FasEnMl
   CRbjkoF+EIKUhUhs+L0e/6oWzPwscZxNV+rWTYVBlq6dl7qWyzTQsQ/3e
   SDOTOBZpHgQ8sNSuDZCd1eb/VePdJMfanQzHy6RTUO2ZfgXc55l0JtCPP
   jWl7rBJJWWE7j9Y92UXfq8+unUERT+lUk1cDlQ0DWIJhp7XSFPdyOinjB
   Fc0fuYAu0SQZ7uBt2EpIbGYwjceEy+wQaebLaqUImcM95mdG6xREkQuMp
   A==;
X-CSE-ConnectionGUID: wIJb76GhS+yOjrqGBSq6pw==
X-CSE-MsgGUID: O8zN2mQ7QwalJQXrQwZFew==
X-IronPort-AV: E=McAfee;i="6800,10657,11537"; a="58665818"
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="58665818"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Aug 2025 19:49:15 -0700
X-CSE-ConnectionGUID: Io8+zbw3SBqEt382AeGxGA==
X-CSE-MsgGUID: MbGSG5WUQhWPRDLn2u4faA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,225,1751266800"; 
   d="scan'208";a="170905739"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 29 Aug 2025 19:49:13 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1usBeB-000V87-3C;
	Sat, 30 Aug 2025 02:49:06 +0000
Date: Sat, 30 Aug 2025 10:48:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:ixp4xx-dts 3/3]
 arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dtb:
 /soc/bus@c4000000/gpio@1,0: failed to match any schema with compatible:
 ['intel,ixp4xx-expansion-bus-mmio-gpio']
Message-ID: <202508301046.v8BUChqz-lkp@intel.com>
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
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git ixp4xx-dts
head:   85ac6b806993200fe117f4fd047c74784ec6b515
commit: 85ac6b806993200fe117f4fd047c74784ec6b515 [3/3] ARM: dts: Add ixp4xx Actiontec MI424WR device trees
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: arm-randconfig-051-20250830 (https://download.01.org/0day-ci/archive/20250830/202508301046.v8BUChqz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250830/202508301046.v8BUChqz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202508301046.v8BUChqz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dtb: /soc/bus@c4000000/gpio@1,0: failed to match any schema with compatible: ['intel,ixp4xx-expansion-bus-mmio-gpio']
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-ac.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']
--
>> arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dtb: /soc/bus@c4000000/gpio@1,0: failed to match any schema with compatible: ['intel,ixp4xx-expansion-bus-mmio-gpio']
   arch/arm/boot/dts/intel/ixp/intel-ixp42x-actiontec-mi424wr-d.dtb: /soc/usb@c800b000: failed to match any schema with compatible: ['intel,ixp4xx-udc']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
