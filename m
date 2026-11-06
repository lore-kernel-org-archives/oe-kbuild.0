Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794001852;
	b=MDLOEacbIDJAuzzJXUoNegKY6n/b49MldXdjT26R+bB4mts0khni11VD+zn6M3mbVnxz
	 tmVckpyfCIdYmMY1rdrLU+/2Gx07rmunIz5cHxdP2DxB2HTXwWJveEljd9rDqrrNfHvtN
	 L2+WLj2TjFaxPVZckY5LWyiGeBBmjIQwVI1VrITyzWKEytKqAl4B1Msf9jSCVqNhBxfUs
	 uEnR1DYZf93ZVBzzrJ8UTsMHzm/3fwy0jpkWYfYSGPFg8ab54PLg0bDWJY9nYF+Rs0Pyt
	 9Sryo+pRceUsHfYJqTfF5QECceiHdh2XgA+YOQwFgK7Pc7fsI95rURtIPALtWPBzTNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794001852;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=6sqhEs5fhDkwzklwm+5ZPMMNHnEwgHYUbO5oXmxRPgs=;
	b=z5OC4Dz354n+tp6kDk8YBGzNpIPHZ3qe0hH5y2GLsZNwYr/yMpMPbQfYoUMBvZfUaunJ
	 lh73PpnOi9IaRph8bS0PWRZEWPAAgxZ6mvbOlW428ZZtsr6sPwOW6EoG3xGCRHxPXf0da
	 sLhe0WGNdl54+E1f9GQ6r5OZKOp7JBbRkUwkgXcsFlwe9K8DXliZG1izaPZagPT5D8Q/A
	 02/+i7L9/EtJFaoOGDW4aebSuCSWHMQ7IoqalpXqcEJoO7ntkaMqldkKlfN3/swC1hr4R
	 iB1kMnOL5DXfiBuhV1btjN6Ol8ZygZAVGPypGvFNlmShWaIqOq5SF6yBi43fqBHAsFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PzYrp56N;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A530606A326
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 21:50:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9A530606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PzYrp56N
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794001851; x=1825537851;
  h=date:from:to:cc:subject:message-id;
  bh=vuggZI7camAQCweCa5Vfh7YVjvZgjfgph06TgHthMFw=;
  b=PzYrp56NAjafBjp7dP974gzmZ/7gNCdFNtxFu0vhP6l4C9ahl9ox1LlV
   Tkajze7Lo7qpbyteyNHfEg+KxqzptmHxdj1ZoY5jmCWmkLn6sYajRV5D0
   6N8ZnK78vdidISnvqdFyMaVJIW4lv7DVufr4RysLWMW6pwLNoZZhKWQSe
   WbAteFP3dvLzivwPw1f/3yReg47jm2sfinGwAS8Urrw4W/ybqRD7Qc9aF
   teLU+7Fheg2eVPwuZi1XdJ/PxFpyqqxWESLF69G8UFJ83ELAhOvEcL8Sw
   dGTLjYxyWKU8ToblPYvj4ybzllWLUoQ58qRZJeFUWwuuc30NEWm3yW8E0
   w==;
X-CSE-ConnectionGUID: tga18VGzRBug7pkN/bzOGw==
X-CSE-MsgGUID: DxWCFy28T7mwE/zRv2n8Bw==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2708646"
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="2708646"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 13:50:51 -0800
X-CSE-ConnectionGUID: kWZthhtVR46Xa55RuLD3rA==
X-CSE-MsgGUID: AJR1yDHFTpW8N/Ez9Jt5PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,199,1787036400"; 
   d="scan'208";a="7250541"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 06 Nov 2026 13:50:49 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPRpf-00000000AN4-28rM;
	Fri, 06 Nov 2026 21:50:47 +0000
Date: Fri, 06 Nov 2026 22:50:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kvms390:sae 8/28]
 tools/testing/selftests/../../../tools/arch/arm64/include/asm/sysreg.h:190:9:
 warning: "OSLSR_EL1_OSLK" redefined
Message-ID: <202611062215.dnnHAjRN-lkp@intel.com>
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
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-s390@vger.kernel.org
TO: Steffen Eiden <seiden@linux.ibm.com>
CC: Andreas Grapentin <gra@linux.ibm.com>

Hi Steffen,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git sae
head:   2abfa741008fd96c3684c316a2f5f37d3bb7bd8b
commit: 0833400ae8dddccd0578c240fad02598d0912a99 [8/28] arm64: sysreg: Convert OSLSR to automatic register generation
:::::: branch date: 6 hours ago
:::::: commit date: 7 hours ago
config: arm64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261106/202611062215.dnnHAjRN-lkp@intel.com/config)
compiler: aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611062215.dnnHAjRN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611062215.dnnHAjRN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from tools/testing/selftests/../../../tools/arch/arm64/include/asm/esr.h:10,
                    from include/arm64/processor.h:17,
                    from lib/guest_modes.c:8:
>> tools/testing/selftests/../../../tools/arch/arm64/include/asm/sysreg.h:190:9: warning: "OSLSR_EL1_OSLK" redefined
     190 | #define OSLSR_EL1_OSLK                  BIT(1)
         |         ^~~~~~~~~~~~~~
   In file included from tools/testing/selftests/../../../tools/arch/arm64/include/asm/sysreg.h:170:
   tools/testing/selftests/../../../tools/arch/arm64/include/generated/asm/sysreg-defs.h:254:9: note: this is the location of the previous definition
     254 | #define OSLSR_EL1_OSLK                                  GENMASK(1, 1)
         |         ^~~~~~~~~~~~~~
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics


vim +/OSLSR_EL1_OSLK +190 tools/testing/selftests/../../../tools/arch/arm64/include/asm/sysreg.h

0359c946b13153b Jing Zhang             2023-10-11  185  
272a067df3c89f6 Raghavendra Rao Ananta 2021-10-07  186  #define SYS_OSLSR_EL1			sys_reg(2, 0, 1, 1, 4)
0359c946b13153b Jing Zhang             2023-10-11  187  #define OSLSR_EL1_OSLM_MASK		(BIT(3) | BIT(0))
0359c946b13153b Jing Zhang             2023-10-11  188  #define OSLSR_EL1_OSLM_NI		0
0359c946b13153b Jing Zhang             2023-10-11  189  #define OSLSR_EL1_OSLM_IMPLEMENTED	BIT(3)
0359c946b13153b Jing Zhang             2023-10-11 @190  #define OSLSR_EL1_OSLK			BIT(1)
0359c946b13153b Jing Zhang             2023-10-11  191  

:::::: The code at line 190 was first introduced by commit
:::::: 0359c946b13153bd57fac65f4f3600ba5673e3de tools headers arm64: Update sysreg.h with kernel sources

:::::: TO: Jing Zhang <jingzhangos@google.com>
:::::: CC: Oliver Upton <oliver.upton@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
