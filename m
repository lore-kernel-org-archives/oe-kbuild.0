Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60F1E2E7161
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jun 2025 13:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750166556; cv=none; b=aASYV6ZbkhP5SEbxzmDVyvU+tozjpwaZd1Aps3KSyjQEmUiGe5eYbaO7azZ6tPv90rFePYmjX0XZzDp+kQZ5dhTKF2MhsJ7qglaZ3XMH8r98tMrNmyufvkhkhS7T2k4hk0u6r+PAu8V6gQnCI8GxeOoBjJxYG5Deo+hrFBdTsus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750166556; c=relaxed/simple;
	bh=/i68XhRgt3pvX+v4YNtf4CbHbDnhjNqlmPIW/VzZSLo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=czvKYA5r+gWt96SpbuYVoBxRaozf1Lv297E/lMXX/E+WvZ2ne3hniJHM5pIGaIpwdmrUEAXNdmjQcPeXVkaxHA/fv8yW6POL6aK3/YQnTiWFiA88bfs57O7UDfITY54izTKPm4k/lvpXw3g8SLozrpDheYkH1XkNj+4UdxXQWEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ey3fNjcn; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ey3fNjcn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750166554; x=1781702554;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/i68XhRgt3pvX+v4YNtf4CbHbDnhjNqlmPIW/VzZSLo=;
  b=ey3fNjcnTBWrVpBwZyCIjOqkr4Vxz9u9y6ZDwM1WfMAZDX6TijqPKvEz
   SSnrUyh8HV5xgu5znbQgchxvMESJFkB6cUnpVg7rUpbx8a+EWZNVgUNF0
   AXNhnw3CQy04nx3L80GjBMrygtDLyDMe9c2pgG/zOiTMen1jT29F4VIwJ
   EtS59zKLTzWZ7E80r9eMSrWNBcpioqzTv+xS7aIqWFzkedqay/moz/ssY
   xdmDrDZtHd/RQ6i+RekxJ36bB0CsRPXytfzFZMNE+x0AqPpDLtLHkmYJs
   fI2ssjKUCI/ICBE/t/QZKipJkLsP+RCqBZVt+owo423Biyx9Bz0x5zUUn
   g==;
X-CSE-ConnectionGUID: uMZIu2gxT/WY8gypJYcrng==
X-CSE-MsgGUID: YQ3gyHcFQnKuhF65YUJk0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="69782148"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="69782148"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 06:22:34 -0700
X-CSE-ConnectionGUID: HWAgeoUSTW+De8e1OvwQsg==
X-CSE-MsgGUID: I56LkFzmShqRGh08dP/nPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="149321955"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jun 2025 06:22:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRWGk-000G0q-1i;
	Tue, 17 Jun 2025 13:22:30 +0000
Date: Tue, 17 Jun 2025 21:22:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sverdlin:snps-trng 13/23]
 arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/mdio@3009000: failed
 to match any schema with compatible: ['sophgo,cv1800b-mdio-mux']
Message-ID: <202506172149.ZzJWqTPz-lkp@intel.com>
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
commit: f009754bffb9d03ce00b6336391ca82eb71138c8 [13/23] riscv: dts: sophgo: Add mdio multiplexer device for cv18xx
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: riscv-randconfig-051-20250617 (https://download.01.org/0day-ci/archive/20250617/202506172149.ZzJWqTPz-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2025.3.dev28+g49451a5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506172149.ZzJWqTPz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506172149.ZzJWqTPz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
>> arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/mdio@3009000: failed to match any schema with compatible: ['sophgo,cv1800b-mdio-mux']
   arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']
--
   arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
>> arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/mdio@3009000: failed to match any schema with compatible: ['sophgo,cv1800b-mdio-mux']
   arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']
--
   arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/reset-controller@3003000: failed to match any schema with compatible: ['sophgo,cv1800b-reset']
>> arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/mdio@3009000: failed to match any schema with compatible: ['sophgo,cv1800b-mdio-mux']
   arch/riscv/boot/dts/sophgo/sg2002-licheerv-nano-b.dtb: /soc/ethernet@4070000: failed to match any schema with compatible: ['sophgo,cv1800b-dwmac', 'snps,dwmac-3.70a']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
