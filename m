Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB67414A83
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Nov 2023 16:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jvOCtCWS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700411921; x=1731947921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4cKT0d+UBmawSYMCdQH1Z1Dn50TYYCl0R3tnqACZmZc=;
  b=jvOCtCWSWTK5gGkqhxB10CfvOc3JqqksknIu56azZx4RHf+2Oj5L9ET4
   eiB7XR9BE5S/r4Aez9punqN/TJWlTCUuX+zb6K1mpkCa4Vai0Rl/oDg3K
   IoQkl/toBpbzN2F67A+gn+9XuxqELkd9qctUlDaY6DvfqXOe4+QjWfEAb
   lm7OvWPBSorYzt8wkMMxhbdbT4W2u5ISdEwmcD9/yYr0TESw9DC04tJuU
   ALIXkJgzox4t2BlR4HRsC2gujio5UkiioHyqQYksNrQ7i0MDWjNcbq/el
   pPT/qwfP4ZLlurYPyCq9Dvi0Xe56c+LClT+3nbsvMJmSJTyz9w3+SHXvB
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="394356956"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="394356956"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2023 08:38:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="1013393201"
X-IronPort-AV: E=Sophos;i="6.04,210,1695711600"; 
   d="scan'208";a="1013393201"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 19 Nov 2023 08:38:39 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r4kof-0005Jx-39;
	Sun, 19 Nov 2023 16:38:37 +0000
Date: Mon, 20 Nov 2023 00:37:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [gerg-m68knommu:cf 1/1] lib/muldi3.c:53:28: sparse: sparse: asm
 output is not an lvalue
Message-ID: <202311200014.QZyXVVUb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-m68k@lists.linux-m68k.org
CC: uclinux-dev@uclinux.org
TO: Greg Ungerer <gerg@linux-m68k.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git cf
head:   229751a8c4e6df244bf384050c3f545f39f1ad95
commit: 229751a8c4e6df244bf384050c3f545f39f1ad95 [1/1] m68k: use kernel's generic muldi3 libgcc function
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: m68k-randconfig-r112-20231119 (https://download.01.org/0day-ci/archive/20231120/202311200014.QZyXVVUb-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231120/202311200014.QZyXVVUb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311200014.QZyXVVUb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
>> lib/muldi3.c:53:28: sparse: sparse: asm output is not an lvalue
>> lib/muldi3.c:53:28: sparse: sparse: not addressable
>> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (11)
>> lib/muldi3.c:53:28: sparse: sparse: generating address of non-lvalue (11)

vim +53 lib/muldi3.c

b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  48  
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  49  long long notrace __muldi3(long long u, long long v)
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  50  {
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  51  	const DWunion uu = {.ll = u};
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23  52  	const DWunion vv = {.ll = v};
b35cd9884fa5d8 Palmer Dabbelt 2017-05-23 @53  	DWunion w = {.ll = __umulsidi3(uu.s.low, vv.s.low)};

:::::: The code at line 53 was first introduced by commit
:::::: b35cd9884fa5d81c9d5e7f57c9d03264ae2bd835 lib: Add shared copies of some GCC library routines

:::::: TO: Palmer Dabbelt <palmer@dabbelt.com>
:::::: CC: Palmer Dabbelt <palmer@dabbelt.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
