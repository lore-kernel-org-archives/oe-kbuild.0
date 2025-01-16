Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ED5A13B58C
	for <oe-kbuild@lists.linux.dev>; Thu, 16 Jan 2025 22:18:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737065889; cv=none; b=CG9b2fpNcJ4ufWBdp4WllDVXu3D7IZ4esPJtuHsITgBKYDsazMjgjeQ+0z2Etqcn3UE+a2vMdaDTHVoua4iqW0DOSLLnJOh3Ltx9eTeIm+ccWHuf8DZme7BKn1iHlRNluWjH6433xrP/d3bsEj/bhRe6c984mM9apocnwObf/hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737065889; c=relaxed/simple;
	bh=GDh7PKY6Y3Bc5V5blvLc/79iztOunkuKVkryUZRSNRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AbeeMfMd2T2DfdTTQzpkDr7fT9RHDoCQDpYT/0ExJlixGepbdj/PiZxQw25rcAk/UmtL60SZmDXdB438sLaRoGI9wmGbCJxwbJuxX+Rvb/mSji4ksUNFEq9Vf3RbKAMVTlwiijX1h3iddL22sEvIEIluMRvU6BztVsj5/qnqtpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Buo5ENiV; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Buo5ENiV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737065886; x=1768601886;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GDh7PKY6Y3Bc5V5blvLc/79iztOunkuKVkryUZRSNRs=;
  b=Buo5ENiVb/bgnCMA/oUTo6AfOv4PjDCYKZQ6Qzpv5SBT6w9NoWCv5bRJ
   xVqipF4L453CS36Ul3h7xxOkgUhs/pdN81jnBrDut8eoVyNl6hGQJi6HD
   lNKk+m+msVuFiJJ1SsMEG7q0YOW28tyLcyoM7gUtPY0t3YmGcV1Tnl+bk
   JdtqNBtFeb33p76LRDWer/qnUiCCRVtFzdTgiORULhVwr6ybzOVsO/re6
   qs362efqNEnasDClCwPQPCttMJJRAeFY3qft7N5MXlwyxX1Kd3i+QmqEZ
   LGaXaB90Ti9NUYR6f/XhsYMb7fLW03puAZbumjhI+U1SSqfuqyQU1Xqdw
   Q==;
X-CSE-ConnectionGUID: N4019qplTpaNYG3+EyY9QQ==
X-CSE-MsgGUID: F0Vt7ctURoer8EqXno1fqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11317"; a="47968685"
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="47968685"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jan 2025 14:18:06 -0800
X-CSE-ConnectionGUID: WlLcdwoxRW2+XpYuLEq+Lw==
X-CSE-MsgGUID: rpbzDEdGTTKAQmAtZH3laA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,210,1732608000"; 
   d="scan'208";a="106170266"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Jan 2025 14:18:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tYYBe-000SRk-0r;
	Thu, 16 Jan 2025 22:18:02 +0000
Date: Fri, 17 Jan 2025 06:18:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/powerpc/boot/dts/adder875-uboot.dts:77.12-90.5: Warning
 (unique_unit_address_if_enabled): /soc@ff000000/mdio@e00: duplicate
 unit-address (also used in node /soc@ff000000/ethernet@e00)
Message-ID: <202501170625.y3ACLyqJ-lkp@intel.com>
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
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ce69b4019001407f9cd738dd2ba217b3a8ab831b
commit: c5aebb53b32460bc52680dd4e2a2f6b84d5ea521 powerpc: Force inlining of arch_vmap_p{u/m}d_supported()
date:   11 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 11 months ago
config: powerpc-buildonly-randconfig-r001-20230115 (https://download.01.org/0day-ci/archive/20250117/202501170625.y3ACLyqJ-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250117/202501170625.y3ACLyqJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501170625.y3ACLyqJ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/powerpc/boot/dts/adder875-uboot.dts:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/adder875-uboot.dts:132.10-141.6: Warning (unit_address_vs_reg): /soc@ff000000/cpm@9c0/muram: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/adder875-uboot.dts:57.13-62.5: Warning (simple_bus_reg): /localbus@ff000100/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/adder875-uboot.dts:132.10-141.6: Warning (simple_bus_reg): /soc@ff000000/cpm@9c0/muram: simple-bus unit address format error, expected "2000"
>> arch/powerpc/boot/dts/adder875-uboot.dts:77.12-90.5: Warning (unique_unit_address_if_enabled): /soc@ff000000/mdio@e00: duplicate unit-address (also used in node /soc@ff000000/ethernet@e00)
--
   arch/powerpc/boot/dts/adder875-redboot.dts:41.9-44.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/adder875-redboot.dts:133.10-142.6: Warning (unit_address_vs_reg): /soc@fa200000/cpm@9c0/muram: node has a reg or ranges property, but no unit name
   arch/powerpc/boot/dts/adder875-redboot.dts:58.13-63.5: Warning (simple_bus_reg): /localbus@fa200100/flash@0,0: simple-bus unit address format error, expected "0"
   arch/powerpc/boot/dts/adder875-redboot.dts:133.10-142.6: Warning (simple_bus_reg): /soc@fa200000/cpm@9c0/muram: simple-bus unit address format error, expected "2000"
>> arch/powerpc/boot/dts/adder875-redboot.dts:78.12-91.5: Warning (unique_unit_address_if_enabled): /soc@fa200000/mdio@e00: duplicate unit-address (also used in node /soc@fa200000/ethernet@e00)

vim +77 arch/powerpc/boot/dts/adder875-uboot.dts

b09c16440eb39c Scott Wood 2008-01-17 @77  		mdio@e00 {

:::::: The code at line 77 was first introduced by commit
:::::: b09c16440eb39c12cc91aea5b572c753a5567d57 [POWERPC] 8xx: Analogue & Micro Adder875 board support.

:::::: TO: Scott Wood <scottwood@freescale.com>
:::::: CC: Kumar Gala <galak@kernel.crashing.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
