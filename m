Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2578F8635B
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 01:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750209223; cv=none; b=nouYvruamVDGHZ417C0Xgj12PUakLztP5L2hzlWE2Uew1Jk3qNIjrXXT/6vvWD6r8SO2CZBw920JyuQfGjC4j6d2rEABjXf5pYxNoFtCr21ALxE42HtHTehVEDQH+YZCINM7aml5J1mHj5UyOmSUmevAIWZNzUnS8DyNDYLI4Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750209223; c=relaxed/simple;
	bh=WgVqypFaLNjsRN7QKrbjckUoAzCFYfiOXbQ3pF5jwE0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qbe26ZhP8IyylNpXsJ5IhfI36buKqyoDlHlyYuL00QOGj+b2ppeqEWHIjOyRhhDeIKXgvB5ldHcgX3kvQrQsYp1WRRPQQYXeF2cSGk9SKzbcR2TLDtNDcMvG0y+3uOXpOpKjkjCm7ZPWSd1+i/uYXP3xlJlMPXq0isV+JQYYnyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O4LmDLb9; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O4LmDLb9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750209221; x=1781745221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WgVqypFaLNjsRN7QKrbjckUoAzCFYfiOXbQ3pF5jwE0=;
  b=O4LmDLb932/zQ/9E1FzVHg1KJDBTOg9WaXaxvWcXbZEOLMnqCmQwMy0k
   wxGyZ1GWh1FeoHq3ud0AKXw3NBTM0O7xo1ZEmhiP8rlL2koh+KZG28i5G
   XCL7MpKhEhEGlnPX+Fkj1SYBNLwf9c2pIODMrGCjAwIVabn756RH+NxJu
   /JlZKaPZNZ3yW2dNWwTk7b/inXoHKjSLqCJGF6OXW+L1jd3bR9OFPZaDu
   BpubzwhhDgcvNKdZiTR6Ozw7uzaRlMGZ7stMGH3++fdpZgJrFItz87OVM
   1BXNY+QlqUSYQF2+thajxiRCw5oJ3OF39PknpTz90kQiMw47Ej6Wukrri
   w==;
X-CSE-ConnectionGUID: wZ+B8BwjRPm00WVaPiouSg==
X-CSE-MsgGUID: ni5RDIwTQmmKPwCrzgfRKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="69858427"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="69858427"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 18:13:40 -0700
X-CSE-ConnectionGUID: zD30TVa6TE6QUJ6HHTtYIQ==
X-CSE-MsgGUID: AFT1Pt+dShKl7rajWvw4Yw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="180001752"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jun 2025 18:13:40 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRhMu-000JHG-1R;
	Wed, 18 Jun 2025 01:13:36 +0000
Date: Wed, 18 Jun 2025 09:13:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sverdlin:snps-trng 12/23]
 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb:
 /soc/ethernet@4070000: failed to match any schema with compatible:
 ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']
Message-ID: <202506180936.s5yxlawh-lkp@intel.com>
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
TO: Inochi Amaoto <inochiama@gmail.com>
CC: Alexander Sverdlin <alexander.sverdlin@gmail.com>

tree:   https://github.com/sverdlin/linux snps-trng
head:   21e232768cb64142db24034d3dceffbc48c2447e
commit: b032091ddac7766c3083e34ca48029a173a17282 [12/23] riscv: dts: sophgo: Add ethernet device for cv18xx
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm64-randconfig-052-20250617 (https://download.01.org/0day-ci/archive/20250618/202506180936.s5yxlawh-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506180936.s5yxlawh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506180936.s5yxlawh-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
>> arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
