Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A402B9A9
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Feb 2025 07:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738395573; cv=none; b=ZDXmeCQsYJGZmrFrk52X9PHGsyXfWl7K85VflXWwQloLdYPnVAQ87Xg/0sNXPkXJx9hXJjQJ9GeX0E6xUjYCtkJpPJtoEX4F8rRQuKpBxdkT0VKG62WoRR5WdAsP793C3p3xf6wjwyHdl49gtOjXjVd2ID7SyX+lSrEjOjKZn44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738395573; c=relaxed/simple;
	bh=CT2lK7anDK62yeklJ4I4+oYSD/JbU5F0UNmjb12c9p4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k6+Ee+1Z+dkEeIXSkSBq5wg16pPtjMsWsm/fL4JyHJ4G6TikTjDRdgHysHOsIji/tZvBi5j/12SWpG3wA44/+II9BrkLoYAtRpzRGmwcR+NC85Zjrt8xPAxl4RfibJM2NVQ03Z30GRQqArtuQK1fD/thnwv3a0naGhuhcCqDtKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F2HP7vw1; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F2HP7vw1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738395571; x=1769931571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CT2lK7anDK62yeklJ4I4+oYSD/JbU5F0UNmjb12c9p4=;
  b=F2HP7vw1Wx96X/04DlMgxoVsc2GLvmwSH2fwvF5A/tJ8Bvv6P25MT+S5
   aQdCUTmq7M/yCB7voFWPoSYqsx+LTT9ChDwiYqLecbar34oU3rYap1vxA
   IpUN8in3dgvm2az4/fLA090JDhg0p3JommG8uEPyTvt5+M5+WZPLGwhqW
   r+9T6Ye5KKwYFWGH19vCiWbyEmLAW9IeGi8l53/NiJXVYISnyIGbeAzop
   pPqeJhsCnQu9nXIaa+GRl+C2FqT6oxrCj+oJEAP2sc1Dil/ZrpzI+qjYf
   nUWOmGrf9gB00EoyatPi1QQrbnE+KF2HBqV83FQyqNJ9EpKwjaGaII6T5
   w==;
X-CSE-ConnectionGUID: 0ptDygttTJm3csMsp2SCBA==
X-CSE-MsgGUID: NIkeP2DCTjerfCj6ac6P5Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11332"; a="38168437"
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="38168437"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2025 23:39:30 -0800
X-CSE-ConnectionGUID: nM8UWx8GS6S0EowSX25iAQ==
X-CSE-MsgGUID: 0V2zQX0uR6eQFwTAOwzHiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,251,1732608000"; 
   d="scan'208";a="109758395"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jan 2025 23:39:29 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1te86B-000ns3-0v;
	Sat, 01 Feb 2025 07:39:27 +0000
Date: Sat, 1 Feb 2025 15:39:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:thread-safety 28/28] clang-16: error: unknown argument:
 '-fexperimental-late-parse-attributes'
Message-ID: <202502011559.C1sRYhAi-lkp@intel.com>
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
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux thread-safety
head:   edb8f58988e23eb5e665bf55625f2461a878483b
commit: edb8f58988e23eb5e665bf55625f2461a878483b [28/28] scripts/Makefile.clang: Unconditionally enable thread-safety checking
:::::: branch date: 9 hours ago
:::::: commit date: 9 hours ago
config: arm64-randconfig-002-20250201 (https://download.01.org/0day-ci/archive/20250201/202502011559.C1sRYhAi-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250201/202502011559.C1sRYhAi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202502011559.C1sRYhAi-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/arm64/Makefile:36: Detected assembler with broken .inst; disassembly will be unreliable
>> warning: LSE atomics not supported by binutils
>> clang-16: error: unknown argument: '-fexperimental-late-parse-attributes'
>> clang-16: error: unknown argument: '-fexperimental-late-parse-attributes'
   make[3]: *** [scripts/Makefile.build:102: scripts/mod/devicetable-offsets.s] Error 1 shuffle=3024791116
   make[3]: *** [scripts/Makefile.build:194: scripts/mod/empty.o] Error 1 shuffle=3024791116
   make[3]: Target 'scripts/mod/' not remade because of errors.
   make[2]: *** [Makefile:1263: prepare0] Error 2 shuffle=3024791116
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=3024791116
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=3024791116
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
