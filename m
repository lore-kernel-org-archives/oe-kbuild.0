Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31C2B33D51A
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 10:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790331349; cv=none; b=UA3SwCZyCIv0f2GLZAoCQpSZMxDbsj1LPetJJAYiu1yw892RuaEgmfOUAUuxilju1J94q5ECAq/ic9v6oa9TFzjl8cP9EBEM6uRHYzxYX8xN5UtoLXXlojRw7uqtH1QyI5DtYp6RuBVXlHYgUDSeg6PMhFemJyv4e04ruFnVsfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790331349; c=relaxed/simple;
	bh=AFLkbzzN+IQmPKMuQhqolQHRo+faA7ZpOFQKmPQBtG8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uxNAUhs9T2ZHIhRm2ajuVooOIW1WGHDzZqRg3uK1OMRPbfPEd6A/wDEdtaDWIoJDyYb1cs4hF+hrTixPUfv//UWoVgNhByvl5DBaNm8fOfH0cs17OHiR4AI+nHDKHKxf+B9M9XBFIjgKtMOabAxzo8MOVIVmOZnUztLbtpcKw9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hXJUBE11; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hXJUBE11"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790331349; x=1821867349;
  h=date:from:to:cc:subject:message-id;
  bh=AFLkbzzN+IQmPKMuQhqolQHRo+faA7ZpOFQKmPQBtG8=;
  b=hXJUBE118brL4F8aLIJ7hHYTEwcwjxNI4OPjyYjvQZ/p3FIdJg+o7/lC
   5K7Y+fdw4RIyPn3S4V8sijXx5RPvd3QlzsyN761u1Hzqsk12o/XGY4D6b
   PODeXXa2nzK9XR8x10d5n6/mGFLqxHqSXwbwojd613MvMkRoRS9fw24eb
   ktwLRq9xxI+iTumRZju0P4PGMd831ykIIxYv/QoB3H0x1WYO4vWnQ6j4o
   1uyLHsh6FeW3mpBU8lduFFlIJHl5EC7nVwpChyW4EC8nnMVQLtFXVXW/0
   bkLauewuayiSD7Lxtxz4Mz4I5SjHII5jWTX33BjzkiGQhFHBKTnqINaIo
   g==;
X-CSE-ConnectionGUID: 5lPdCnrPTBS51AE4RomWnw==
X-CSE-MsgGUID: UtgkqcKrQr2WibOExvy46Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="101288392"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="101288392"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 03:15:48 -0700
X-CSE-ConnectionGUID: 1z7TB2I8TVKDiEGaOWmVJQ==
X-CSE-MsgGUID: Rc3xru4XRC2N0HQO+UxzIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="274391607"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Sep 2026 03:15:47 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA2y0-00000000KRa-329J;
	Fri, 25 Sep 2026 10:15:44 +0000
Date: Fri, 25 Sep 2026 18:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arnd-playground:randconfig-7.3-next 448/673]
 arch/um/os-Linux/sigio.c:301:13: warning: stack frame size (828) exceeds
 limit (768) in 'os_check_bugs'
Message-ID: <202609251807.OHBSfgxQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git randconfig-7.3-next
head:   0a1affa74ef2f2c5c5ee74fc604e47a1aefdd286
commit: 9c85f63886c9ecf71773bacb7ed5524bc5dfce52 [448/673] Kbuild: rework stack frame warn logic
:::::: branch date: 6 days ago
:::::: commit date: 9 days ago
config: um-allnoconfig (https://download.01.org/0day-ci/archive/20260925/202609251807.OHBSfgxQ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251807.OHBSfgxQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609251807.OHBSfgxQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/um/os-Linux/sigio.c:301:13: warning: stack frame size (828) exceeds limit (768) in 'os_check_bugs' [-Wframe-larger-than]
     301 | void __init os_check_bugs(void)
         |             ^
   1 warning generated.
--
>> arch/um/os-Linux/umid.c:253:19: warning: stack frame size (796) exceeds limit (768) in 'make_umid' [-Wframe-larger-than]
     253 | static int __init make_umid(void)
         |                   ^
   1 warning generated.


vim +/os_check_bugs +301 arch/um/os-Linux/sigio.c

c65badbdf5dc11 Jeff Dike 2007-05-06  299  
c65badbdf5dc11 Jeff Dike 2007-05-06  300  /* Here because it only does the SIGIO testing for now */
c65badbdf5dc11 Jeff Dike 2007-05-06 @301  void __init os_check_bugs(void)

:::::: The code at line 301 was first introduced by commit
:::::: c65badbdf5dc117e45873e760f807063ad59a854 uml: move SIGIO testing to sigio.c

:::::: TO: Jeff Dike <jdike@addtoit.com>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
