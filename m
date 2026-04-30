Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A58E301471
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Apr 2026 03:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777518457; cv=none; b=PhF1pfCwg+RT9/ylMhe0wJ1eiYXq45fwV41d0olFw2FskqffUMUSBXgrwYJN6BTM52Qu3HVM6baNvtlOo27TZeurNaJy+bQUDC4eGEHm3CMuj4CiYDipb6z8WpxHNacB/gyGsbA0w9kdy1JNTwlqQqBfRMfhoIw9mC+avVGOijc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777518457; c=relaxed/simple;
	bh=k80+wuZsDgRLksm5bbw+UBLuq1qUwBAWNG7wOFqod3M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=aALaw2s5BnFAfghyguXEvMNJ7N2pCvO/arGWJ/bsTYVw3R1uZkiDe/uPiB9EJ2X99qlbgGhgETBIwfVkxpzN0OPy9/AwM+Flh/o0Op3e6S7kcwCTLhnxfKDetRtMJ4RaeTa6RHTjjcTcQD8xGlGhLN2jkaC1/9DLLzCA7y5fgJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZzlFNFAz; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZzlFNFAz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777518455; x=1809054455;
  h=date:from:to:cc:subject:message-id;
  bh=k80+wuZsDgRLksm5bbw+UBLuq1qUwBAWNG7wOFqod3M=;
  b=ZzlFNFAzA9xdC//Rm2TBK46IwNCIXPl6uo5t7RO7YRIEXBrGFO8aaiad
   vXYru7/+icEUqKdaa5cGYb0dq029KVocgfiVVDD0F+wYJc7KdadRSDZXF
   GvJFJiLpAst+j9CBRfIj7UL/bbNgiPVDUbxmFvV1eRQ+AU+oHPx8KtWF4
   67qMeeML59GD5/6ED+fQfskBjx92iUaU1sB7CMWltlijmkYyfgsWajBZh
   SHoTzEfmLaAG/QL0EpmjsBBnsxyw0q9IQvsmwPvg5qeiJ4p9dJTlD8WYV
   tteUCMBd0tLILscJmcAMBDi5wLUSnGPyq2bjGTVCXC+z4m5JfxSw5Knam
   Q==;
X-CSE-ConnectionGUID: bAYG9jbYSGmXijMm6nRUkQ==
X-CSE-MsgGUID: rvXO0jtMRByolOYzmpwLKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11771"; a="89833313"
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="89833313"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2026 20:07:34 -0700
X-CSE-ConnectionGUID: LhhcgNzzQxCr/Q04N1ifVA==
X-CSE-MsgGUID: z/RO1zY5RN6CWJKBSIPrFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,207,1770624000"; 
   d="scan'208";a="231814607"
Received: from lkp-server01.sh.intel.com (HELO aa799cca880d) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Apr 2026 20:07:34 -0700
Received: from kbuild by aa799cca880d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIHkR-00000000Bry-3ABL;
	Thu, 30 Apr 2026 03:07:31 +0000
Date: Thu, 30 Apr 2026 11:06:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 883/1114] ftrace.c:undefined reference to
 `__atomic_fetch_add_8'
Message-ID: <202604301110.k8l5TIie-lkp@intel.com>
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
TO: Konstantin Khorenko <khorenko@virtuozzo.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Peter Oberparleiter <oberpar@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0787c45ea08a13b5482e701fabc741877cf681f6
commit: 3063d5f62cb2b0dc1a94b59f783c6812953eaa5a [883/1114] gcov: use atomic counter updates to fix concurrent access crashes
:::::: branch date: 16 hours ago
:::::: commit date: 3 days ago
config: i386-buildonly-randconfig-004-20260430 (https://download.01.org/0day-ci/archive/20260430/202604301110.k8l5TIie-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260430/202604301110.k8l5TIie-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604301110.k8l5TIie-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: kernel/trace/ftrace.o: in function `symbols_cmp':
>> ftrace.c:(.text+0x18): undefined reference to `__atomic_fetch_add_8'
>> ld: ftrace.c:(.text+0x36): undefined reference to `__atomic_fetch_add_8'
   ld: kernel/trace/ftrace.o: in function `ftrace_pid_release':
   ftrace.c:(.text+0x68): undefined reference to `__atomic_fetch_add_8'
   ld: ftrace.c:(.text+0x86): undefined reference to `__atomic_fetch_add_8'
   ld: ftrace.c:(.text+0xa4): undefined reference to `__atomic_fetch_add_8'
   ld: kernel/trace/ftrace.o:ftrace.c:(.text+0xd5): more undefined references to `__atomic_fetch_add_8' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
