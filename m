Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A16931750
	for <oe-kbuild@lists.linux.dev>; Mon,  4 Dec 2023 19:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4D8zfCk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701718897; x=1733254897;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=afqDKGOOnL0/u7FqxLdQYBU8SKyeXySzuHwW6VI+Fd8=;
  b=B4D8zfCkKCa2XK3fNGR8tUbwyP8CNPGNLsrG5qVOLwQDwu4++FkICcUV
   LAjeHqrFd2CiGkQQadZgW5c1csDThTvcm9pYU2zwtE45FYkvxw54wI5yB
   C4PIzyu30swh/W4IfOL34jw53JhlpmVAat5PunkMV7UajPHnkatZj0YAW
   k/tw00zUGWizDDRq5A9tHaOeRjkPm89FIpu+aavwcZrlT7+958ojoabZa
   wLCn+LvTcUCJdVbbMw4r7OOeZ5HX0SiYWEC8yLSVAjc0HNVr+m6mjmqVP
   P7iClbKjLfW1Bi2ABs2psD9ZKOAGIIc7Ezt9UuWnP40tGj9qwinBJsbnv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="855467"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="855467"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2023 11:41:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="861492990"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; 
   d="scan'208";a="861492990"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 04 Dec 2023 11:41:35 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAEoo-00081r-32;
	Mon, 04 Dec 2023 19:41:28 +0000
Date: Tue, 5 Dec 2023 03:40:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/lib/xor-neon.c:177:1: sparse:    struct
 xor_block_template extern [addressable] [toplevel] xor_block_inner_neon
Message-ID: <202312050351.LRZSVgeZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/lib/xor-neon.c:177:1: sparse:    struct xor_block_template extern [addressable] [toplevel] xor_block_inner_neon"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 2c54b423cf85baed5ad9f9546f6c8ea741774a06 arm64/xor: use EOR3 instructions when available
date:   2 years ago
:::::: branch date: 33 hours ago
:::::: commit date: 2 years ago
config: arm64-randconfig-r132-20231130 (https://download.01.org/0day-ci/archive/20231205/202312050351.LRZSVgeZ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20231205/202312050351.LRZSVgeZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312050351.LRZSVgeZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/lib/xor-neon.c:203:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:205:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:207:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:217:17: sparse: sparse: symbol 'dp2' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:217:17: sparse:    int [addressable] [toplevel] dp2
   arch/arm64/lib/xor-neon.c:193:18: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:193:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp2
   arch/arm64/lib/xor-neon.c:218:17: sparse: sparse: symbol 'dp3' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:218:17: sparse:    int [addressable] [toplevel] dp3
   arch/arm64/lib/xor-neon.c:194:18: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:194:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp3
   arch/arm64/lib/xor-neon.c:227:37: sparse: sparse: undefined identifier 'p2'
   arch/arm64/lib/xor-neon.c:227:18: sparse: sparse: symbol 'dp2' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:227:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp2
   arch/arm64/lib/xor-neon.c:217:17: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:217:17: sparse:    int [addressable] [toplevel] dp2
   arch/arm64/lib/xor-neon.c:228:37: sparse: sparse: undefined identifier 'p3'
   arch/arm64/lib/xor-neon.c:228:18: sparse: sparse: symbol 'dp3' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:228:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp3
   arch/arm64/lib/xor-neon.c:218:17: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:218:17: sparse:    int [addressable] [toplevel] dp3
   arch/arm64/lib/xor-neon.c:229:37: sparse: sparse: undefined identifier 'p4'
   arch/arm64/lib/xor-neon.c:232:22: sparse: sparse: undefined identifier 'bytes'
   arch/arm64/lib/xor-neon.c:232:14: sparse: sparse: symbol 'lines' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:197)
   arch/arm64/lib/xor-neon.c:238:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:238:17: sparse: sparse: symbol 'v1' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:203)
   arch/arm64/lib/xor-neon.c:240:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:240:17: sparse: sparse: symbol 'v2' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:205)
   arch/arm64/lib/xor-neon.c:242:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:242:17: sparse: sparse: symbol 'v3' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:207)
   arch/arm64/lib/xor-neon.c:246:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:247:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:247:17: sparse: sparse: symbol 'v1' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:238)
   arch/arm64/lib/xor-neon.c:248:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:248:17: sparse: sparse: symbol 'v2' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:240)
   arch/arm64/lib/xor-neon.c:249:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:249:17: sparse: sparse: symbol 'v3' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:242)
   arch/arm64/lib/xor-neon.c:258:17: sparse: sparse: symbol 'dp2' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:258:17: sparse:    int [addressable] [toplevel] dp2
   arch/arm64/lib/xor-neon.c:227:18: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:227:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp2
   arch/arm64/lib/xor-neon.c:259:17: sparse: sparse: symbol 'dp3' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:259:17: sparse:    int [addressable] [toplevel] dp3
   arch/arm64/lib/xor-neon.c:228:18: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:228:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp3
   arch/arm64/lib/xor-neon.c:260:17: sparse: sparse: symbol 'dp4' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:260:17: sparse:    int [addressable] [toplevel] dp4
   arch/arm64/lib/xor-neon.c:229:18: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:229:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp4
   arch/arm64/lib/xor-neon.c:269:37: sparse: sparse: undefined identifier 'p2'
   arch/arm64/lib/xor-neon.c:269:18: sparse: sparse: symbol 'dp2' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:269:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp2
   arch/arm64/lib/xor-neon.c:258:17: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:258:17: sparse:    int [addressable] [toplevel] dp2
   arch/arm64/lib/xor-neon.c:270:37: sparse: sparse: undefined identifier 'p3'
   arch/arm64/lib/xor-neon.c:270:18: sparse: sparse: symbol 'dp3' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:270:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp3
   arch/arm64/lib/xor-neon.c:259:17: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:259:17: sparse:    int [addressable] [toplevel] dp3
   arch/arm64/lib/xor-neon.c:271:37: sparse: sparse: undefined identifier 'p4'
   arch/arm64/lib/xor-neon.c:271:18: sparse: sparse: symbol 'dp4' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:271:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp4
   arch/arm64/lib/xor-neon.c:260:17: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:260:17: sparse:    int [addressable] [toplevel] dp4
   arch/arm64/lib/xor-neon.c:272:37: sparse: sparse: undefined identifier 'p5'
   arch/arm64/lib/xor-neon.c:275:22: sparse: sparse: undefined identifier 'bytes'
   arch/arm64/lib/xor-neon.c:275:14: sparse: sparse: symbol 'lines' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:232)
   arch/arm64/lib/xor-neon.c:281:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:281:17: sparse: sparse: symbol 'v1' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:247)
   arch/arm64/lib/xor-neon.c:283:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:283:17: sparse: sparse: symbol 'v2' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:248)
   arch/arm64/lib/xor-neon.c:285:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:285:17: sparse: sparse: symbol 'v3' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:249)
   arch/arm64/lib/xor-neon.c:289:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:289:17: sparse: sparse: symbol 'v0' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:246)
   arch/arm64/lib/xor-neon.c:290:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:290:17: sparse: sparse: symbol 'v1' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:281)
   arch/arm64/lib/xor-neon.c:291:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:291:17: sparse: sparse: symbol 'v2' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:283)
   arch/arm64/lib/xor-neon.c:292:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:292:17: sparse: sparse: symbol 'v3' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:285)
   arch/arm64/lib/xor-neon.c:301:17: sparse: sparse: symbol 'dp2' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:301:17: sparse:    int [addressable] [toplevel] dp2
   arch/arm64/lib/xor-neon.c:269:18: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:269:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp2
   arch/arm64/lib/xor-neon.c:302:17: sparse: sparse: symbol 'dp3' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:302:17: sparse:    int [addressable] [toplevel] dp3
   arch/arm64/lib/xor-neon.c:270:18: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:270:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp3
   arch/arm64/lib/xor-neon.c:303:17: sparse: sparse: symbol 'dp4' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:303:17: sparse:    int [addressable] [toplevel] dp4
   arch/arm64/lib/xor-neon.c:271:18: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:271:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp4
   arch/arm64/lib/xor-neon.c:304:17: sparse: sparse: symbol 'dp5' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:304:17: sparse:    int [addressable] [toplevel] dp5
   arch/arm64/lib/xor-neon.c:272:18: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:272:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp5
   arch/arm64/lib/xor-neon.c:312:17: sparse: sparse: symbol 'xor_block_inner_neon' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:312:17: sparse:    int [addressable] [toplevel] xor_block_inner_neon
   arch/arm64/lib/xor-neon.c:177:1: sparse: note: previously declared as:
>> arch/arm64/lib/xor-neon.c:177:1: sparse:    struct xor_block_template extern [addressable] [toplevel] xor_block_inner_neon
   arch/arm64/lib/xor-neon.c:313:17: sparse: sparse: symbol 'xor_block_inner_neon' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:313:17: sparse:    int [addressable] [toplevel] xor_block_inner_neon
   arch/arm64/lib/xor-neon.c:177:1: sparse: note: previously declared as:
>> arch/arm64/lib/xor-neon.c:177:1: sparse:    struct xor_block_template extern [addressable] [toplevel] xor_block_inner_neon

vim +177 arch/arm64/lib/xor-neon.c

cc9f8349cb3396 Jackie Liu     2018-12-04  169  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  170  struct xor_block_template xor_block_inner_neon __ro_after_init = {
cc9f8349cb3396 Jackie Liu     2018-12-04  171  	.name	= "__inner_neon__",
cc9f8349cb3396 Jackie Liu     2018-12-04  172  	.do_2	= xor_arm64_neon_2,
cc9f8349cb3396 Jackie Liu     2018-12-04  173  	.do_3	= xor_arm64_neon_3,
cc9f8349cb3396 Jackie Liu     2018-12-04  174  	.do_4	= xor_arm64_neon_4,
cc9f8349cb3396 Jackie Liu     2018-12-04  175  	.do_5	= xor_arm64_neon_5,
cc9f8349cb3396 Jackie Liu     2018-12-04  176  };
cc9f8349cb3396 Jackie Liu     2018-12-04 @177  EXPORT_SYMBOL(xor_block_inner_neon);
cc9f8349cb3396 Jackie Liu     2018-12-04  178  

:::::: The code at line 177 was first introduced by commit
:::::: cc9f8349cb33965120a96c12e05d00676162eb7f arm64: crypto: add NEON accelerated XOR implementation

:::::: TO: Jackie Liu <liuyun01@kylinos.cn>
:::::: CC: Will Deacon <will.deacon@arm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
