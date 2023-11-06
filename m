Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2098D1CF95
	for <oe-kbuild@lists.linux.dev>; Mon,  6 Nov 2023 22:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K91SroF/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699310990; x=1730846990;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RtzVn9nNaPWJqc0XMkAsZ6/CowtKo8osbVrtPA7pz0Y=;
  b=K91SroF/HvWjF6Uef2HZ/P8UVLe5NmSih2XCp3T/k8QWYBuXsnJUh8ak
   rwItRM2yjObcTTIYG7a+kfej1a+WeEnQpam1FQMGi1i4/6sCXPztQS4HY
   8uRH0uaCLD4t7uOFK6f2YSIKWXYfOgZ7H06yi5z50AWDZc2Rjg+OfieJY
   K+VwCVMtxf1H6l0LfCe/hBjDC9NfaB8voVyOF7XJ6SeK/KqjIxAMyzBkR
   5UW/ulYrF4sXSFyfW9J2hlXEcNYSLViV9tCQR+qK0qXvVHGI8SKjP8UJA
   DPYBlJe4oAUVxQsyLJTwlSk8ZA15tM8I2ZPITn3aYhwPr8xCUGHSXIakb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="374411794"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="374411794"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 14:49:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="712344698"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="712344698"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 06 Nov 2023 14:49:48 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r08Ph-0006mm-2S;
	Mon, 06 Nov 2023 22:49:45 +0000
Date: Tue, 7 Nov 2023 06:47:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/parisc/kernel/parisc_ksyms.c:39:1: sparse: sparse: '##' failed:
 concatenation is not a valid token
Message-ID: <202311070652.qPBaVKAE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem: arch/parisc/kernel/parisc_ksyms.c:39:1: sparse: sparse: '##' failed: concatenation is not a valid token"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d2f51b3516dade79269ff45eae2a7668ae711b25
commit: 481461f5109919babbb393d6f68002936b8e2493 linux/export.h: make <linux/export.h> independent of CONFIG_MODULES
date:   4 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 4 months ago
config: parisc-randconfig-r131-20231106 (https://download.01.org/0day-ci/archive/20231107/202311070652.qPBaVKAE-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311070652.qPBaVKAE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311070652.qPBaVKAE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/parisc/kernel/parisc_ksyms.c:39:1: sparse: sparse: '##' failed: concatenation is not a valid token
>> arch/parisc/kernel/parisc_ksyms.c:39:1: sparse: sparse: '##' failed: concatenation is not a valid token
>> arch/parisc/kernel/parisc_ksyms.c:39:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:71:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:71:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:72:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:72:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:73:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:73:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:74:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:74:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:75:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:75:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:76:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:76:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:77:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:77:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:78:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:78:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:79:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:79:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:80:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:80:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:81:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:81:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:82:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:82:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:83:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:83:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:84:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:84:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:85:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:85:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:86:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:86:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:87:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:87:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:88:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:88:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:89:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:89:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:90:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:90:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:91:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:91:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:92:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:92:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:93:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:93:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:124:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:124:1: sparse: sparse: '##' failed: concatenation is not a valid token
   arch/parisc/kernel/parisc_ksyms.c:38:12: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:38:12: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:39:1: sparse: sparse: expected expression after the '(' token
   arch/parisc/kernel/parisc_ksyms.c:39:1: sparse: sparse: Expected ) after typeof
   arch/parisc/kernel/parisc_ksyms.c:39:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:39:1: sparse: sparse: Expected ; at end of declaration
   arch/parisc/kernel/parisc_ksyms.c:39:1: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:47:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:47:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:48:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:48:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:49:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:49:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:50:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:50:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:51:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:51:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:52:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:52:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:53:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:53:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:54:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:54:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:55:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:55:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:56:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:56:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:57:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:57:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:58:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:58:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:59:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:59:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:60:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:60:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:61:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:61:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:62:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:62:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:63:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:63:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:64:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:64:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:65:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:65:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:66:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:66:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:67:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:67:13: sparse: sparse: got $
   arch/parisc/kernel/parisc_ksyms.c:68:13: sparse: sparse: Expected ; at the end of type declaration
   arch/parisc/kernel/parisc_ksyms.c:68:13: sparse: sparse: too many errors

vim +39 arch/parisc/kernel/parisc_ksyms.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  35  
a8f44e3889b686 Helge Deller   2007-01-28  36  #ifndef CONFIG_64BIT
^1da177e4c3f41 Linus Torvalds 2005-04-16  37  /* Needed so insmod can set dp value */
^1da177e4c3f41 Linus Torvalds 2005-04-16  38  extern int $global$;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @39  EXPORT_SYMBOL($global$);
^1da177e4c3f41 Linus Torvalds 2005-04-16  40  #endif
^1da177e4c3f41 Linus Torvalds 2005-04-16  41  

:::::: The code at line 39 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
