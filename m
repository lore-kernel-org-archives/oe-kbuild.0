Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 156A822FAF4
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jun 2025 12:39:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750163970; cv=none; b=JWljXkLyP0jzb/yPQqRIPpTcd2tKl6QHlG41+S/a57jGQOZhHmkPPkvXJ2Ywj84Z3B8ihjtfxHPp9/j2l5PrTTt3gDPIQyYdZm/lVoNA0JXlxKTCNATa+1RU1SwZwdzXY0yHrWNWP1W6/QfnTYkoTpDHjqvzOzBTv2W3XCzuAmk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750163970; c=relaxed/simple;
	bh=JdGb+Z5hBr+ygwBndeQJ8kKx7frhz1PC3PnEWi7EdaY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tYIQjQ6mD0Yn5IRsHVbgIM8ZKwDGFpVrVhAHo5DG/lLu3boJq90HZHc10J/c/QtNsos3XUHBsUv6Yj1s3lfx4bdNhbfOaghxEBzY7v7+utVlbrSyjlasbh1e3kE8XvxRwFACcvSoSAUTV6wDyXCE7cADOCExKczzPtdgsco6KZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iMyzOJ2Q; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iMyzOJ2Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750163969; x=1781699969;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JdGb+Z5hBr+ygwBndeQJ8kKx7frhz1PC3PnEWi7EdaY=;
  b=iMyzOJ2QV5aEmxjyv4pRwsml4ca96SBBy6M9SLOwo8/LPSXb32oxqli8
   tlpbtQFEQRG6eh0qsHDGZWV6hTOs/uzDZyp064HLDe/wLqXCOELr6ZOHp
   UbehvqO/ALPL23XxjzLOEU5Yz5j1mSBFUHIQyopIOMU4SOlIPI+2h6G9M
   U92qIkPqcVD1+a/k7KWcr9g6miGinTcUrf15nxjs3CKTAXWk7jSH2Oy1l
   UqreD/wgSU0tnQvTOHsb9mnMOs1X1PzCXPR3EauCiz6FJm4eOOwufChus
   w3PYcPAeIKfc/NzMIL2X13QFhE9lpTRr+hN1hKhVXE2KeCy9yBADkKm2f
   A==;
X-CSE-ConnectionGUID: 011qSdcpS5q5cHhWR3FCXQ==
X-CSE-MsgGUID: VhMNMfLlSwa36HMpl7ltTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="51565818"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="51565818"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 05:39:29 -0700
X-CSE-ConnectionGUID: VieMyUR4StaAgAJzJPQWEg==
X-CSE-MsgGUID: wxiI2pBgTWqSJhsiPziJoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="179771073"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 17 Jun 2025 05:39:28 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRVb3-000FyO-2U;
	Tue, 17 Jun 2025 12:39:25 +0000
Date: Tue, 17 Jun 2025 20:38:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sverdlin:snps-trng 12/23]
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/ethernet@4070000:
 failed to match any schema with compatible: ['sophgo,cv1800b-dwmac',
 'snps,dwmac-3.70a']
Message-ID: <202506172024.nig7ugVe-lkp@intel.com>
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
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: riscv-randconfig-051-20250617 (https://download.01.org/0day-ci/archive/20250617/202506172024.nig7ugVe-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506172024.nig7ugVe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506172024.nig7ugVe-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']
--
   arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']
--
   arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
