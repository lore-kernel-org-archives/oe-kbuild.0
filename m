Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F023BB48
	for <oe-kbuild@lists.linux.dev>; Thu, 14 Dec 2023 21:27:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gPJMxnHO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702589236; x=1734125236;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z6njOj+MQI+Js1Y3l0uy2ze3FQkw93ebARSeO0MVKYA=;
  b=gPJMxnHOqDaX5GppYpxMDV1Nv6gG53iVpQmb5MNdu47VwxsFQGluZlUF
   izS7m00IhIwQd0DY1Wy7CKHPp9YC/jsTj4LUbR0XIFQdTQn1PshpkNP4C
   xoCeahlshtyBD1A9h1vYKYIkq4SfyLGoTGiaYpuq8uC+2Ik0pvM/nmVyT
   x29P2DIoKcyushgVPejg0ioirEJ+Qwy4Nfu/h8kGFE9NBSFAsH8IJ/S01
   w5Tho0i3pdDWoCEdec9fe4y2vvC1lqDLQ9TTzUXxjOe5VDh34W0zyijvZ
   fo/cNtRPDW6kqkuI24BuTJA6cWQBv50KgpMFpDoyPZKFSWRFiI8+KgnAY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="2344407"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="2344407"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 13:27:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="724212350"
X-IronPort-AV: E=Sophos;i="6.04,276,1695711600"; 
   d="scan'208";a="724212350"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 14 Dec 2023 13:27:14 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDtEe-000Mcn-0f;
	Thu, 14 Dec 2023 21:27:12 +0000
Date: Fri, 15 Dec 2023 05:26:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/arm64/lib/xor-neon.c:312:17: sparse:    int [addressable]
 [toplevel] xor_block_inner_neon
Message-ID: <202312150532.9kCWWKnz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: arch/arm64/lib/xor-neon.c:312:17: sparse:    int [addressable] [toplevel] xor_block_inner_neon"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>
CC: Catalin Marinas <catalin.marinas@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5bd7ef53ffe5ca580e93e74eb8c81ed191ddc4bd
commit: 2c54b423cf85baed5ad9f9546f6c8ea741774a06 arm64/xor: use EOR3 instructions when available
date:   2 years ago
:::::: branch date: 26 hours ago
:::::: commit date: 2 years ago
config: arm64-randconfig-r122-20231130 (https://download.01.org/0day-ci/archive/20231215/202312150532.9kCWWKnz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312150532.9kCWWKnz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312150532.9kCWWKnz-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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
   arch/arm64/lib/xor-neon.c:229:18: sparse: sparse: symbol 'dp4' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:229:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp4
   arch/arm64/lib/xor-neon.c:165:17: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:165:17: sparse:    int [addressable] [toplevel] dp4
   arch/arm64/lib/xor-neon.c:232:22: sparse: sparse: undefined identifier 'bytes'
   arch/arm64/lib/xor-neon.c:232:14: sparse: sparse: symbol 'lines' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:197)
   arch/arm64/lib/xor-neon.c:238:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:238:17: sparse: sparse: symbol 'v1' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:203)
   arch/arm64/lib/xor-neon.c:240:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:240:17: sparse: sparse: symbol 'v2' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:205)
   arch/arm64/lib/xor-neon.c:242:22: sparse: sparse: undefined identifier 'eor3'
   arch/arm64/lib/xor-neon.c:242:17: sparse: sparse: symbol 'v3' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:207)
   arch/arm64/lib/xor-neon.c:246:22: sparse: sparse: undefined identifier 'veorq_u64'
   arch/arm64/lib/xor-neon.c:246:17: sparse: sparse: symbol 'v0' has multiple initializers (originally initialized at arch/arm64/lib/xor-neon.c:151)
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
   arch/arm64/lib/xor-neon.c:272:18: sparse: sparse: symbol 'dp5' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:272:18: sparse:    unsigned long long [usertype] *[addressable] [toplevel] dp5
   arch/arm64/lib/xor-neon.c:166:17: sparse: note: previously declared as:
   arch/arm64/lib/xor-neon.c:166:17: sparse:    int [addressable] [toplevel] dp5
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
>> arch/arm64/lib/xor-neon.c:312:17: sparse:    int [addressable] [toplevel] xor_block_inner_neon
   arch/arm64/lib/xor-neon.c:177:1: sparse: note: previously declared as:
>> arch/arm64/lib/xor-neon.c:177:1: sparse:    bad type extern [addressable] [toplevel] xor_block_inner_neon
   arch/arm64/lib/xor-neon.c:313:17: sparse: sparse: symbol 'xor_block_inner_neon' redeclared with different type (different base types):
   arch/arm64/lib/xor-neon.c:313:17: sparse:    int [addressable] [toplevel] xor_block_inner_neon
   arch/arm64/lib/xor-neon.c:177:1: sparse: note: previously declared as:
>> arch/arm64/lib/xor-neon.c:177:1: sparse:    bad type extern [addressable] [toplevel] xor_block_inner_neon

vim +312 arch/arm64/lib/xor-neon.c

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
2c54b423cf85ba Ard Biesheuvel 2021-12-13  179  static inline uint64x2_t eor3(uint64x2_t p, uint64x2_t q, uint64x2_t r)
2c54b423cf85ba Ard Biesheuvel 2021-12-13  180  {
2c54b423cf85ba Ard Biesheuvel 2021-12-13  181  	uint64x2_t res;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  182  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  183  	asm(ARM64_ASM_PREAMBLE ".arch_extension sha3\n"
2c54b423cf85ba Ard Biesheuvel 2021-12-13  184  	    "eor3 %0.16b, %1.16b, %2.16b, %3.16b"
2c54b423cf85ba Ard Biesheuvel 2021-12-13  185  	    : "=w"(res) : "w"(p), "w"(q), "w"(r));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  186  	return res;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  187  }
2c54b423cf85ba Ard Biesheuvel 2021-12-13  188  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  189  static void xor_arm64_eor3_3(unsigned long bytes, unsigned long *p1,
2c54b423cf85ba Ard Biesheuvel 2021-12-13  190  			     unsigned long *p2, unsigned long *p3)
2c54b423cf85ba Ard Biesheuvel 2021-12-13  191  {
2c54b423cf85ba Ard Biesheuvel 2021-12-13  192  	uint64_t *dp1 = (uint64_t *)p1;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  193  	uint64_t *dp2 = (uint64_t *)p2;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  194  	uint64_t *dp3 = (uint64_t *)p3;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  195  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  196  	register uint64x2_t v0, v1, v2, v3;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  197  	long lines = bytes / (sizeof(uint64x2_t) * 4);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  198  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  199  	do {
2c54b423cf85ba Ard Biesheuvel 2021-12-13  200  		/* p1 ^= p2 ^ p3 */
2c54b423cf85ba Ard Biesheuvel 2021-12-13  201  		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
2c54b423cf85ba Ard Biesheuvel 2021-12-13  202  			  vld1q_u64(dp3 + 0));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  203  		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
2c54b423cf85ba Ard Biesheuvel 2021-12-13  204  			  vld1q_u64(dp3 + 2));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  205  		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
2c54b423cf85ba Ard Biesheuvel 2021-12-13  206  			  vld1q_u64(dp3 + 4));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  207  		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
2c54b423cf85ba Ard Biesheuvel 2021-12-13  208  			  vld1q_u64(dp3 + 6));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  209  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  210  		/* store */
2c54b423cf85ba Ard Biesheuvel 2021-12-13  211  		vst1q_u64(dp1 + 0, v0);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  212  		vst1q_u64(dp1 + 2, v1);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  213  		vst1q_u64(dp1 + 4, v2);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  214  		vst1q_u64(dp1 + 6, v3);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  215  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  216  		dp1 += 8;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  217  		dp2 += 8;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  218  		dp3 += 8;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  219  	} while (--lines > 0);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  220  }
2c54b423cf85ba Ard Biesheuvel 2021-12-13  221  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  222  static void xor_arm64_eor3_4(unsigned long bytes, unsigned long *p1,
2c54b423cf85ba Ard Biesheuvel 2021-12-13  223  			     unsigned long *p2, unsigned long *p3,
2c54b423cf85ba Ard Biesheuvel 2021-12-13  224  			     unsigned long *p4)
2c54b423cf85ba Ard Biesheuvel 2021-12-13  225  {
2c54b423cf85ba Ard Biesheuvel 2021-12-13  226  	uint64_t *dp1 = (uint64_t *)p1;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  227  	uint64_t *dp2 = (uint64_t *)p2;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  228  	uint64_t *dp3 = (uint64_t *)p3;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  229  	uint64_t *dp4 = (uint64_t *)p4;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  230  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  231  	register uint64x2_t v0, v1, v2, v3;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  232  	long lines = bytes / (sizeof(uint64x2_t) * 4);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  233  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  234  	do {
2c54b423cf85ba Ard Biesheuvel 2021-12-13  235  		/* p1 ^= p2 ^ p3 */
2c54b423cf85ba Ard Biesheuvel 2021-12-13  236  		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
2c54b423cf85ba Ard Biesheuvel 2021-12-13  237  			  vld1q_u64(dp3 + 0));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  238  		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
2c54b423cf85ba Ard Biesheuvel 2021-12-13  239  			  vld1q_u64(dp3 + 2));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  240  		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
2c54b423cf85ba Ard Biesheuvel 2021-12-13  241  			  vld1q_u64(dp3 + 4));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  242  		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
2c54b423cf85ba Ard Biesheuvel 2021-12-13  243  			  vld1q_u64(dp3 + 6));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  244  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  245  		/* p1 ^= p4 */
2c54b423cf85ba Ard Biesheuvel 2021-12-13  246  		v0 = veorq_u64(v0, vld1q_u64(dp4 + 0));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  247  		v1 = veorq_u64(v1, vld1q_u64(dp4 + 2));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  248  		v2 = veorq_u64(v2, vld1q_u64(dp4 + 4));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  249  		v3 = veorq_u64(v3, vld1q_u64(dp4 + 6));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  250  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  251  		/* store */
2c54b423cf85ba Ard Biesheuvel 2021-12-13  252  		vst1q_u64(dp1 + 0, v0);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  253  		vst1q_u64(dp1 + 2, v1);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  254  		vst1q_u64(dp1 + 4, v2);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  255  		vst1q_u64(dp1 + 6, v3);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  256  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  257  		dp1 += 8;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  258  		dp2 += 8;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  259  		dp3 += 8;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  260  		dp4 += 8;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  261  	} while (--lines > 0);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  262  }
2c54b423cf85ba Ard Biesheuvel 2021-12-13  263  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  264  static void xor_arm64_eor3_5(unsigned long bytes, unsigned long *p1,
2c54b423cf85ba Ard Biesheuvel 2021-12-13  265  			     unsigned long *p2, unsigned long *p3,
2c54b423cf85ba Ard Biesheuvel 2021-12-13  266  			     unsigned long *p4, unsigned long *p5)
2c54b423cf85ba Ard Biesheuvel 2021-12-13  267  {
2c54b423cf85ba Ard Biesheuvel 2021-12-13  268  	uint64_t *dp1 = (uint64_t *)p1;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  269  	uint64_t *dp2 = (uint64_t *)p2;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  270  	uint64_t *dp3 = (uint64_t *)p3;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  271  	uint64_t *dp4 = (uint64_t *)p4;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  272  	uint64_t *dp5 = (uint64_t *)p5;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  273  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  274  	register uint64x2_t v0, v1, v2, v3;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  275  	long lines = bytes / (sizeof(uint64x2_t) * 4);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  276  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  277  	do {
2c54b423cf85ba Ard Biesheuvel 2021-12-13  278  		/* p1 ^= p2 ^ p3 */
2c54b423cf85ba Ard Biesheuvel 2021-12-13  279  		v0 = eor3(vld1q_u64(dp1 + 0), vld1q_u64(dp2 + 0),
2c54b423cf85ba Ard Biesheuvel 2021-12-13  280  			  vld1q_u64(dp3 + 0));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  281  		v1 = eor3(vld1q_u64(dp1 + 2), vld1q_u64(dp2 + 2),
2c54b423cf85ba Ard Biesheuvel 2021-12-13  282  			  vld1q_u64(dp3 + 2));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  283  		v2 = eor3(vld1q_u64(dp1 + 4), vld1q_u64(dp2 + 4),
2c54b423cf85ba Ard Biesheuvel 2021-12-13  284  			  vld1q_u64(dp3 + 4));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  285  		v3 = eor3(vld1q_u64(dp1 + 6), vld1q_u64(dp2 + 6),
2c54b423cf85ba Ard Biesheuvel 2021-12-13  286  			  vld1q_u64(dp3 + 6));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  287  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  288  		/* p1 ^= p4 ^ p5 */
2c54b423cf85ba Ard Biesheuvel 2021-12-13  289  		v0 = eor3(v0, vld1q_u64(dp4 + 0), vld1q_u64(dp5 + 0));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  290  		v1 = eor3(v1, vld1q_u64(dp4 + 2), vld1q_u64(dp5 + 2));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  291  		v2 = eor3(v2, vld1q_u64(dp4 + 4), vld1q_u64(dp5 + 4));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  292  		v3 = eor3(v3, vld1q_u64(dp4 + 6), vld1q_u64(dp5 + 6));
2c54b423cf85ba Ard Biesheuvel 2021-12-13  293  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  294  		/* store */
2c54b423cf85ba Ard Biesheuvel 2021-12-13  295  		vst1q_u64(dp1 + 0, v0);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  296  		vst1q_u64(dp1 + 2, v1);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  297  		vst1q_u64(dp1 + 4, v2);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  298  		vst1q_u64(dp1 + 6, v3);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  299  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  300  		dp1 += 8;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  301  		dp2 += 8;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  302  		dp3 += 8;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  303  		dp4 += 8;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  304  		dp5 += 8;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  305  	} while (--lines > 0);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  306  }
2c54b423cf85ba Ard Biesheuvel 2021-12-13  307  
2c54b423cf85ba Ard Biesheuvel 2021-12-13  308  static int __init xor_neon_init(void)
2c54b423cf85ba Ard Biesheuvel 2021-12-13  309  {
2c54b423cf85ba Ard Biesheuvel 2021-12-13  310  	if (IS_ENABLED(CONFIG_AS_HAS_SHA3) && cpu_have_named_feature(SHA3)) {
2c54b423cf85ba Ard Biesheuvel 2021-12-13  311  		xor_block_inner_neon.do_3 = xor_arm64_eor3_3;
2c54b423cf85ba Ard Biesheuvel 2021-12-13 @312  		xor_block_inner_neon.do_4 = xor_arm64_eor3_4;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  313  		xor_block_inner_neon.do_5 = xor_arm64_eor3_5;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  314  	}
2c54b423cf85ba Ard Biesheuvel 2021-12-13  315  	return 0;
2c54b423cf85ba Ard Biesheuvel 2021-12-13  316  }
2c54b423cf85ba Ard Biesheuvel 2021-12-13  317  module_init(xor_neon_init);
2c54b423cf85ba Ard Biesheuvel 2021-12-13  318  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
