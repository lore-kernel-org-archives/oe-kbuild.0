Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794768938;
	b=uSrvzsRDdcSBYoqy0QHDeS7/6F/d1UK8Qdgv4GbFGx47ilbdVPn7JJna3UTZ3DB9qNLT
	 uGCQ0VP8lvWfatqkWhT2z5EqibOQJYlF5+XBDAB1lFmgEMFdfsEWrX62gk0nsfVHFD91L
	 iv2GtLLMboD2rA/JK+QF0ScuEe7DbhmIN7B7eBkFIJRJgxb0JgSCKH/Hvj3y9/v+FOsJE
	 Fcrr6Wc6VXTCt+HWZxxsi24mXA50krqEbzb8CazG+j11pNBxozWsIk6aLIBxa2z2hNkfd
	 g2JZM8pylcmQHTxTGAN9r4qteuRPeXJvlSZ+0dWs0WPy/84NEeHJ2Y7NQ0jo4h89hCA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794768938;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=zu74YUCHbR2eNifMngWGEY+HC7mermsax+AaCNq4Sec=;
	b=5s8vOswKoLoXIhO+357NeOviB88mWJ2UppQ2LsrMBTXg1seOw9J2SSDD1NGoG/CQbwcz
	 i6XtbNys41FILAtjGqfHRGhodvNO2Z+A+LDAz38bkHRbyzC8hDGdNxo8i16QJYN/yKV08
	 PcKK8fCKWSD/fiyZM6iwfCuq2Rzhnwt3tCEkPpLDi5ZahQ+Rakd3ebb6pelY3SyL5wc3w
	 tLYAtP4NmEu85msQ59WmRNHBPK+AyCCKvvcarBiBrdleD18+zHNBnSLlFnZGrg/dfbVse
	 njKBUXgkTK7VeLoyDoMyxaKOcBfKxgHviElfrLJLjYpIdF9BCelmkVjOonp1Hgxqjeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="NdLH/XSd";
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC18E606A31A
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 18:55:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC18E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NdLH/XSd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794768938; x=1826304938;
  h=date:from:to:cc:subject:message-id;
  bh=XrnUH52kMyHbRNSPEoMwEc9zL8xB4HtzM2EFw3UVNV8=;
  b=NdLH/XSd1cYUdEAsJLYkYXgplO29rsax/8O10xcY9687T7MlZ3MbDbXU
   J/yKbRQuDCEvzq29yKvfig5UokFh0qDlh6P3JGx4r1zVfAngI3JHOICxf
   kCSf9X+3yXzUpdGBasuLtgftc5ZQ4gN5dJcE6w/IJyw1kNxA1B/95MLHo
   W47Z/AlefjvgrDzctvcFt+imLmGxao7cILrrqswNoptrffzN1C8OrXPBO
   ussSNNfv/iq7oH6GkVxW7YYmLmDll/7UrBFFPI21r+GxdPNHdbEEnBDQh
   sk5toQ5OcoO4G/Rr0vA1pdcArifzxKXSs+BnWBE6oGdGDYWC61qjWEDbN
   g==;
X-CSE-ConnectionGUID: W6tNxGzzSGGoKE/bx2iKxA==
X-CSE-MsgGUID: mf31kUzLSmS9lHq5A5upXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3494969"
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="3494969"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 10:55:38 -0800
X-CSE-ConnectionGUID: 6UTU3lFQRBWKkNA9xKPq9A==
X-CSE-MsgGUID: iOaUrmf7Sl27NU5JLknxWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,215,1787036400"; 
   d="scan'208";a="9453021"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 15 Nov 2026 10:55:36 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSfO1-000000002MB-3DMF;
	Sun, 15 Nov 2026 18:55:33 +0000
Date: Sun, 15 Nov 2026 19:55:09 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: loongarch64-linux-gcc: error: unrecognized argument in
 option '-march=la32v1.0'
Message-ID: <202611151916.C0QdxZjF-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "too many reports for this commit | /zdci/kbuild/indicators/3d/3d9aba6618d115750729bba2d1f8af180bd7d3bd-reported_build_error_fbc-error"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Jiaxun Yang <jiaxun.yang@flygoat.com>

Hi Huacai,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23c62304dde29abe92013d85910d03a77dada35d
commit: 3d9aba6618d115750729bba2d1f8af180bd7d3bd LoongArch: Adjust build infrastructure for 32BIT/64BIT
date:   7 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 7 months ago
config: loongarch-randconfig-r2303-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151916.C0QdxZjF-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151916.C0QdxZjF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 3d9aba6618d1 ("LoongArch: Adjust build infrastructure for 32BIT/64BIT")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151916.C0QdxZjF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: abi-default la464 la64v1.0 la64v1.1 la664 loongarch64 native; did you mean 'la64v1.0'?
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: abi-default la464 la64v1.0 la64v1.1 la664 loongarch64 native; did you mean 'la64v1.0'?
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
>> loongarch64-linux-gcc: error: unrecognized argument in option '-march=la32v1.0'
   loongarch64-linux-gcc: note: valid arguments to '-march=' are: abi-default la464 la64v1.0 la64v1.1 la664 loongarch64 native; did you mean 'la64v1.0'?
>> loongarch64-linux-gcc: error: unrecognized argument in option '-mabi=ilp32s'
   loongarch64-linux-gcc: note: valid arguments to '-mabi=' are: lp64d lp64f lp64s
   make[3]: *** [scripts/Makefile.build:289: scripts/mod/empty.o] Error 1 shuffle=3403728442
   make[3]: *** [scripts/Makefile.build:184: scripts/mod/devicetable-offsets.s] Error 1 shuffle=3403728442
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1336: prepare0] Error 2 shuffle=3403728442
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3403728442
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3403728442
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
