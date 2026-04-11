Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D2692D5922
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Apr 2026 14:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775916093; cv=none; b=utRrQV337kGlbCPWvQb/KkpkDDdA2NyTbOglne7aG6j9j6NrUCVkwcWn+k/lpCyJw/KRcDS0JjnHn9xr+Kzv4KpSfBw8JTxo5+MqoeG2MkOaL6v5vA8ME6BLx3uROx/dQyAt1TO6zjjvI8ec2fXuG6ddtljynb8nc7HQGwPGYlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775916093; c=relaxed/simple;
	bh=bVooT22dqN7V7432UksPxnW9GMPcNtZRsAlyL5X7SLU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UuIUcB42NDd05MzIcmahreBTRSiTkJ82+RyoobHw1KFZQbVoYIuyA4aINd3cz7DywofDawYmPlEAyr0tFHoTEnHIYJhGTDgjXjbxoaz3FXcVjnbYRBzqQ7VMwEQCLPPn6Z4j2RZokIZRjFVv9B4DAb+ev41Z716/Pb3Xom9+Fp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AB9qPuAZ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AB9qPuAZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775916092; x=1807452092;
  h=date:from:to:cc:subject:message-id;
  bh=bVooT22dqN7V7432UksPxnW9GMPcNtZRsAlyL5X7SLU=;
  b=AB9qPuAZ7JjuOdUcdJdLH92EqbI1BWiOrgvN9WLGVj4JX4GMjyYXiMFa
   UlsDUwKeCZyeoXMVPcHc45r5RUmZqxwxjYlH2ASU0aXVLNETpNdV0BDPf
   x3y14O+cMpdDWXm1imFmr9xtdEq0d8J3fsLlDSsbFBWONLqBycRItb87f
   359xdDsj/5HVHZ3xFdiuu3X6txDJOlOjIGhvQxvBStQDVeCbNSiwzGNkT
   qTqY8G6645SLXlX8oZTmwGCcHETCriC6lgM9C9Y5NxBlhrmJ0oLB3/ilO
   9z1glPY/Hr6Z3i79pC51jlyWIlyUbVtr7stpR3COiPveYp+qqe58m37DG
   w==;
X-CSE-ConnectionGUID: +x3rHWdHTTu/SxXQMlR8rw==
X-CSE-MsgGUID: iw5QF3HzRXaYSDZ776+StA==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76874705"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="76874705"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 07:01:31 -0700
X-CSE-ConnectionGUID: J7/tX3EkQF+qAUNdZmpxtg==
X-CSE-MsgGUID: Z7a3rEC8Q/KtbH080foiHA==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Apr 2026 07:01:29 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBYtr-000000001BV-2zNd;
	Sat, 11 Apr 2026 14:01:27 +0000
Date: Sat, 11 Apr 2026 22:01:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [deller-parisc:for-next 9/11]
 arch/parisc/include/asm/vdso.h:10:10: fatal error:
 generated/vdso32-offsets.h: No such file or directory
Message-ID: <202604112143.RQcoJtEO-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
TO: Helge Deller <deller@gmx.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux.git for-next
head:   c3eb6db10769872a5d01efe36ab67d3814e2af24
commit: 019d4ecb3887d434d9fac718555ff38ab2a32bed [9/11] parisc: Allow to build without vdso32
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: parisc-randconfig-r061-20260411 (https://download.01.org/0day-ci/archive/20260411/202604112143.RQcoJtEO-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260411/202604112143.RQcoJtEO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604112143.RQcoJtEO-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/parisc/kernel/signal.c:32:
>> arch/parisc/include/asm/vdso.h:10:10: fatal error: generated/vdso32-offsets.h: No such file or directory
      10 | #include <generated/vdso32-offsets.h>
         |          ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   compilation terminated.


vim +10 arch/parisc/include/asm/vdso.h

df24e1783e6e0e Helge Deller 2021-12-08   6  
df24e1783e6e0e Helge Deller 2021-12-08   7  #ifdef CONFIG_64BIT
df24e1783e6e0e Helge Deller 2021-12-08   8  #include <generated/vdso64-offsets.h>
df24e1783e6e0e Helge Deller 2021-12-08   9  #endif
df24e1783e6e0e Helge Deller 2021-12-08 @10  #include <generated/vdso32-offsets.h>
df24e1783e6e0e Helge Deller 2021-12-08  11  

:::::: The code at line 10 was first introduced by commit
:::::: df24e1783e6e0eb3dc0e3ba5a8df3bb0cc537408 parisc: Add vDSO support

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
