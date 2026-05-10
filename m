Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 094AC4502A
	for <oe-kbuild@lists.linux.dev>; Sun, 10 May 2026 04:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778387679; cv=none; b=YW+4k/cxgiUB8iAWju1jB48DnAALYEwLXE2Zf7KBHuSMrD+mhleKli6VptHUIlMfNUxBAKlRa9ghHqBcRrh0onQrXoQGYW2XsJc40bRofJSZb7rkt0YKNE+bYjmN0U+Pnvzrjdt3yZKqb8l4OGXUjHL01bl1oRxfBhlS/yqyV0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778387679; c=relaxed/simple;
	bh=DMYcGH3WlgR4dR0raM6q24W3k4x6isp+C3p2afhkyjE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UsR2AGpVpqAIKwcMlC2fSeySrflRu9yMkSvGqFfhRUvh4QCU1espi5w3NpbbOLsoPtB8a8/iLDValsyzx5HyAORXegad3TNvxqotIki0DFuBNdqHR4kz2U6UyBLaS+X3fVy0aGDIib7k8HWKtV2hNzX7dtNnrLyMtlc3iWFjy04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGx1HkPH; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGx1HkPH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778387678; x=1809923678;
  h=date:from:to:cc:subject:message-id;
  bh=DMYcGH3WlgR4dR0raM6q24W3k4x6isp+C3p2afhkyjE=;
  b=XGx1HkPHZqzC01gsLveHYEf8f2zs8pDMYfCZuFAC9DEHKNcEbsis5cQm
   hKmpLsTKytPK31UvgWCHX11zWIyov567orp5WZVCkgCL36650X5kquRjz
   QOHSq6X/MNOEuce54Jaz/Smw6PP6HQGTrxQrJhWCr5VqjqUO7Ca2HVpqW
   p12XbeypLSyn6cy+MbRwmU1QtWhg+4udrrnZZN2gPQGjNYEK8p2BuQaAw
   vc3S5dZPkwcvgmmjHNZIe/Key4L934bMfcPUHGYfOhWcXSC+bBVnA9nHd
   UvrSp9wMx3kpmfRJqFP9XAPzPfGneTEgvxPH1ARirUPC9Nap9ASPo5kCk
   Q==;
X-CSE-ConnectionGUID: hP0eCwiATEiGQXKxncVjvw==
X-CSE-MsgGUID: 2YgYOZZBSYSlZThkysGBrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11781"; a="96879454"
X-IronPort-AV: E=Sophos;i="6.23,225,1770624000"; 
   d="scan'208";a="96879454"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2026 21:34:38 -0700
X-CSE-ConnectionGUID: 7GnuT94dQgGPUXisWjw2Qg==
X-CSE-MsgGUID: 3a/t07lYT+K9NNyA5bH0Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,227,1770624000"; 
   d="scan'208";a="260600173"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 09 May 2026 21:34:37 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wLvsA-000000007db-3S5c;
	Sun, 10 May 2026 04:34:34 +0000
Date: Sun, 10 May 2026 06:33:49 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [sunxi:sunxi/dt-for-7.2 2/4]
 arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dtb:
 /soc/hstimer@3008000: failed to match any schema with compatible:
 ['allwinner,sun20i-d1-hstimer']
Message-ID: <202605100653.y39ZaTYw-lkp@intel.com>
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
TO: Michal Piekos <michal.piekos@mmpsystems.pl>
CC: "Chen-Yu Tsai" <wens@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git sunxi/dt-for-7.2
head:   c6895beaf5eab889ebdaffeb6210ad1111f3e72e
commit: 7c86694a7b8c9a0b2e29b312b21fcaf61d54b474 [2/4] riscv: dts: allwinner: d1s-t113: add hstimer node
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-2053-20260508 (https://download.01.org/0day-ci/archive/20260510/202605100653.y39ZaTYw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
dtschema: 2026.5.dev4+g4ccc1997d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260510/202605100653.y39ZaTYw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605100653.y39ZaTYw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/allwinner/sun8i-t113s-mangopi-mq-r-t113.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']
--
>> arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']
--
>> arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dtb: /soc/hstimer@3008000: failed to match any schema with compatible: ['allwinner,sun20i-d1-hstimer']

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
