Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744686;
	b=BvGbxdmWa03vIDJjlNjFbJNArEce5ixp0jVhd/gdAV8FzpmLziqJltSEA+e6jOlVcPu3
	 sqfHumYCyGM/FqXkq19K+4Z+8c2zWiybsjOpT+qfSwjk0jQYLW72apTX5dBlpSjDc2wwN
	 cowCbvWwzmsa6G3OoEZO0V1ZthIxNku/35RroADWfpgA46Ka0mbXSdTQAG8Yy/dgGthD6
	 AalNtEjCWEDE8Z6ZGw3v5kOrSD2YXMxXq6+rLwj2AiIu1vwu8aAaa93nFzkiMew0av6zB
	 XXjyoyEkOlkjPlHVi8zRz/oqrUyLrrJK/7uOkYcwOUPyMwCdFWamnLHU56qBE2cX0SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744686;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=snkm4Uqeu84uTxgoqjcdhk7zkJ9EPwdy11SLKbscVfw=;
	b=DVKWvIyBupVk/s9SymIs+XZRqZsAM5PWR4Lse0Oc/DBA7w4iRGCZYv8XihaYpn8vbzMV
	 QXttAs2RfLUish1V1/my8Vdtc4lIw3gouXyN4uwl7uL+Xyc0bZZ2nX8aeaS6NIzrjQ+fN
	 u8Lah8gFMFWgVksM7zacIUmghqAPr5XEwwX109gSn0CWgCTEEyTcnFJ4+Ji0gZ2wexIXC
	 e8cslfOJuiX5nzwBzG7edYjJwLQFIdqgsS4ZpqglJtwvN/S+BwTZYXtFktx1zdMs4TmoL
	 U10gcosWkRnhPOjefkGwiR7VCZFWjH8wJhtxsJB2zMS8XgBgOn5nGHjRvxRzpFSOwGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qvjx6Oaq;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07218606A31F
	for <oe-kbuild@lists.linux.dev>; Sun, 15 Nov 2026 12:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07218606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Qvjx6Oaq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794744686; x=1826280686;
  h=date:from:to:cc:subject:message-id;
  bh=MASnsNyNvJcyJUEWeHFYcFM9/bwR5Z3+9VvQS4nz1ZU=;
  b=Qvjx6OaqmCUoBNxI6Qj8xI64ceD0N2f9GY+vNOz0YTussQIoV2SudsUa
   EfkUvNB3hHpzD9Tbu7og/wyno/ekCttD0sPUkKL4dq0JEZ8JGbGA8pu/l
   vgjSUvYyCQaEDGmNBOvqXBfYdPnTgeUfPy8Oc9mt2+T7Gkk9ZjpFXPxHR
   R2dVwOiHJ+eb0GDpdocS2iqwKBPOLRGKV1z3XEwhc/7XdDIxnypvoOgxH
   I4kGhpbrHub4V303CKH/JTfTtcodroYo80meAtRedojB+bOpXjdR/7qVc
   DUCq3ppQKdkzTFmTOqkFhTrh+cH6nbNMW67Ied8M42o3tgSMlflS4p2tD
   w==;
X-CSE-ConnectionGUID: RsSF4jjzRpC8WDAmZ7MGJQ==
X-CSE-MsgGUID: SkZhQiD5SCK+kx9JFrXgmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11966"; a="3362549"
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="3362549"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2026 04:11:26 -0800
X-CSE-ConnectionGUID: 1V/nBQGcR1imBU1lkFRFKQ==
X-CSE-MsgGUID: dOGtZv/BS+2VZ5RlpntFBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,214,1787036400"; 
   d="scan'208";a="9480792"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 15 Nov 2026 04:11:25 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSZ4s-000000002Ab-1kJR;
	Sun, 15 Nov 2026 12:11:22 +0000
Date: Sun, 15 Nov 2026 13:10:55 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bvanassche:thread-safety 230/458]
 include/linux/mman.h:138:43: sparse: sparse: division by zero
Message-ID: <202611151311.vKQtRhty-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/mman.h:138:43: sparse: sparse: division by zero"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Bart Van Assche <bvanassche@acm.org>

tree:   https://github.com/bvanassche/linux thread-safety
head:   6a8743e9201f9d942f7c93093bf7ce69b48a7eea
commit: 6dd8e7dff124c22b8b54c7a99b53471f6a78f87b [230/458] mm: Convert _calc_vm_trans() into an inline function
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: mips-randconfig-r2310-20261115 (https://download.01.org/0day-ci/archive/20261115/202611151311.vKQtRhty-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 8.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261115/202611151311.vKQtRhty-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611151311.vKQtRhty-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/mmap.c: note: in included file:
>> include/linux/mman.h:138:43: sparse: sparse: division by zero
>> include/linux/mman.h:138:43: sparse: sparse: division by zero
>> include/linux/mman.h:138:43: sparse: sparse: division by zero

vim +138 include/linux/mman.h

c462ac288f2c97 Catalin Marinas 2019-11-25  125  
^1da177e4c3f41 Linus Torvalds  2005-04-16  126  /*
6dd8e7dff124c2 Bart Van Assche 2026-11-02  127   * Optimisation helper.  It is equivalent to:
^1da177e4c3f41 Linus Torvalds  2005-04-16  128   *      (x & bit1) ? bit2 : 0
^1da177e4c3f41 Linus Torvalds  2005-04-16  129   * but this version is faster.
^1da177e4c3f41 Linus Torvalds  2005-04-16  130   * ("bit1" and "bit2" must be single bits)
^1da177e4c3f41 Linus Torvalds  2005-04-16  131   */
6dd8e7dff124c2 Bart Van Assche 2026-11-02  132  static inline unsigned long _calc_vm_trans(unsigned long x, unsigned long bit1,
6dd8e7dff124c2 Bart Van Assche 2026-11-02  133  					   unsigned long bit2)
6dd8e7dff124c2 Bart Van Assche 2026-11-02  134  {
6dd8e7dff124c2 Bart Van Assche 2026-11-02  135  	if (!bit1 || !bit2)
6dd8e7dff124c2 Bart Van Assche 2026-11-02  136  		return 0;
6dd8e7dff124c2 Bart Van Assche 2026-11-02  137  	else if (bit1 <= bit2)
6dd8e7dff124c2 Bart Van Assche 2026-11-02 @138  		return (x & bit1) * (bit2 / bit1);
6dd8e7dff124c2 Bart Van Assche 2026-11-02  139  	else
6dd8e7dff124c2 Bart Van Assche 2026-11-02  140  		return (x & bit1) / (bit1 / bit2);
6dd8e7dff124c2 Bart Van Assche 2026-11-02  141  }
^1da177e4c3f41 Linus Torvalds  2005-04-16  142  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
