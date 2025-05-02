Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB861DE4E6
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 06:58:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746169102; cv=none; b=R3jgEXzZ667wjmmrJTHLwu6VFHpRBizAtOmX1gCDXX/DP8y9ZuTKvwlOmHBtofS4676TM5NEij8H882xB1GsQ7lXNkHiuK4umzcMDK/xfeW/6TyqO7J9ZJfXVR3TsAHx7+vUFO4oSqmWYueIAcaSJ7f1w1PPSsXkPf6H0eGM1rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746169102; c=relaxed/simple;
	bh=04LUMeqE6WxagW/SIFtsG6d8uTmK+GvR6xii0Gic5w0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b8+4ckHmuaP4WAepGnzHqITQZA1FH/44nG9rFnxWB/cCvaYIJwSDg+2sd9od/Ds7YoiNIOR0lnmArtRzOUWmAp7Qtf+YcoHOOG/eYyToUQMXaEhtEOUS+LTHk4nz6TSeQh0m6G4pJAU62XhBx3HlQ0euZ+4dw+Q6lJbOC3cicos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CKN8GmPK; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CKN8GmPK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746169101; x=1777705101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=04LUMeqE6WxagW/SIFtsG6d8uTmK+GvR6xii0Gic5w0=;
  b=CKN8GmPKfzbTw3ixT10BeA7j8Rjq2eXCggl6/eZDtK6R/mWnOWLuH8mV
   NZ7c8YOPjNnFTdDCRDeso+lIfmfFsI+QxqVgzO51n0hgWR8Q3q8fZwfHq
   6WoftDku3Gx9mbjLDNt8lRPTc4NzCww029pJZFK9K8bDvvqUAgPQLpSyt
   BBuXaxUIpDXmgHs6uQKPIP1VnB2wskeUhDAZOh8R/2t73JYryQAITM5ME
   wwwqdl/hwHQlu41NIb+oDMHCmVaNttCnjQxpIv/LpIEtYvFJcEd5ptNtY
   lp7jhjHqUwrDBEcEfGQ0HlmjlcE3JhKRzLRhtWDSbnjqcZfafl69TX7uU
   A==;
X-CSE-ConnectionGUID: hbaf8NfER5+P+LB1PP+uyA==
X-CSE-MsgGUID: TpjMjM7vS4S84uAYOQunvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="35465834"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="35465834"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 23:58:20 -0700
X-CSE-ConnectionGUID: XBaegJ5xQ2qxn1J4irztqw==
X-CSE-MsgGUID: O0E7eHbhQ82+WofncZUdug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="139561659"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 May 2025 23:58:18 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAkLg-0004ar-07;
	Fri, 02 May 2025 06:58:16 +0000
Date: Fri, 2 May 2025 14:57:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] gcc-plugins: Force full rebuild when plugins change
Message-ID: <202505021403.blhkPRXG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250501194826.2947101-1-kees@kernel.org>
References: <20250501194826.2947101-1-kees@kernel.org>
TO: Kees Cook <kees@kernel.org>

Hi Kees,

kernel test robot noticed the following build errors:

[auto build test ERROR on kees/for-next/hardening]
[also build test ERROR on kees/for-next/pstore linus/master v6.15-rc4 next-20250501]
[cannot apply to kees/for-next/kspp]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kees-Cook/gcc-plugins-Force-full-rebuild-when-plugins-change/20250502-035038
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git for-next/hardening
patch link:    https://lore.kernel.org/r/20250501194826.2947101-1-kees%40kernel.org
patch subject: [PATCH 1/3] gcc-plugins: Force full rebuild when plugins change
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: arm64-randconfig-002-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021403.blhkPRXG-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250502/202505021403.blhkPRXG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505021403.blhkPRXG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> aarch64-linux-gcc: fatal error: cannot specify -o with -c, -S or -E with multiple files
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:203: arch/arm64/kernel/vdso/vgettimeofday.o] Error 1 shuffle=1304459473
>> aarch64-linux-gcc: fatal error: cannot specify -o with -c, -S or -E with multiple files
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:203: arch/arm64/kernel/vdso/vgetrandom.o] Error 1 shuffle=1304459473
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[3]: Target 'arch/arm64/kernel/vdso/vdso.so' not remade because of errors.
   make[2]: *** [arch/arm64/Makefile:224: vdso_prepare] Error 2 shuffle=1304459473
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1304459473
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1304459473
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
