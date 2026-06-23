Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D39036F90C
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jun 2026 10:13:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782209583; cv=none; b=tJozI6+D+gljgPtMJHbX/IOWbr7HSN8vcEMh/40saAftLGUOeLO8Iy36E5m9feIe1m+fWgT8titGagaJ2l6WfawBVQY4L5Yhvg1nMbdoOsNmqDNS9p5xG/aF68kQrHTceyGl1eDC7cxZU01FAXkSx9m6PeyXEAy2mcKq/IxhXrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782209583; c=relaxed/simple;
	bh=5Xjr3iZp9fS3l4r+vr8GmXfteGQIkX1hpr95WrpSQeo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=FShGRF/iwi3GrAR3/zQ9MenAhV1O30xPoV+Xjz8yIgHMIBGNFoTzrKcNnX41CC3rhQF/GrorWD7nx75yNWCx/17kiT/ur4fXLG2BtvxA0boQh6LB6FIS1VjuIRFrt1gN5I2ByMqC3Dd6A3q8oKoeVlMS3s84ysYOb1l8FvrWEmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fOwssXQq; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fOwssXQq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782209582; x=1813745582;
  h=date:from:to:cc:subject:message-id;
  bh=5Xjr3iZp9fS3l4r+vr8GmXfteGQIkX1hpr95WrpSQeo=;
  b=fOwssXQqsm4j2WwR8zWjyDD6rSfOCXptBTvyG49wCFBL0ivbbjXp2Vg/
   dNRho2JQ2cKt24n3AwZr+EcHDsRC3TgArP92NfSS1xwdhaWZz12CXiG+6
   6AxMhJMhjchNzDJQ7HAtVZhKUmf+Uw2aYfB2a+QLWSqu1iXv92wpxDKMi
   ZYo6Hmewk4aeVsAvsnAUppwS5CugxzUWM9VnnsNQVcbFmZHpy0BfGflMe
   8Dz1TOSfak7fcVADCwfXD8O7sFvqvHepAB2NWFJyQFuCnUeobmrfq9heg
   nweltlX5DdTSsGYIAkiWcVI7uQRVhqwycwUel2+FJWO3whiNGor7DQZRb
   w==;
X-CSE-ConnectionGUID: AHzwKJ/RTC6ofP3Mkb3oXA==
X-CSE-MsgGUID: 37q3w/hYRlKkVPN8dfcsyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82817809"
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="82817809"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2026 03:13:01 -0700
X-CSE-ConnectionGUID: A8LxrT5HTpetYbDUF0AGJw==
X-CSE-MsgGUID: W9ekkTYWQJuLd9/2GKTS3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,220,1774335600"; 
   d="scan'208";a="253359313"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 23 Jun 2026 03:13:00 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wby7l-000000006BJ-2bis;
	Tue, 23 Jun 2026 10:12:57 +0000
Date: Tue, 23 Jun 2026 12:12:35 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: riscv/mmio_test.c:40:9: error: impossible constraint in
 'asm'
Message-ID: <202606231259.RnRXckPo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Charlie Jenkins <thecharlesjenkins@gmail.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Charlie-Jenkins-via-B4-Relay/riscv-Introduce-instruction-table-generation/20260622-233907
head:   0a20b3c57eced1789d7fe0d60aef35fb55dec1f0
commit: 323ee78f0df1f082442e03ba2bb04d7adb59eb3e KVM: riscv: selftests: Add mmio test
date:   19 hours ago
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260623/202606231259.RnRXckPo-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606231259.RnRXckPo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606231259.RnRXckPo-lkp@intel.com/

All errors (new ones prefixed by >>):

   riscv/mmio_test.c: In function 'test_c_ldsp':
>> riscv/mmio_test.c:40:9: error: impossible constraint in 'asm'
      40 |         asm volatile (                                                                          \
         |         ^~~
   riscv/mmio_test.c:70:1: note: in expansion of macro 'test_sp_read'
      70 | test_sp_read(8, c.ldsp, c_ldsp)
         | ^~~~~~~~~~~~
   At top level:
   cc1: note: unrecognized command-line option '-Wno-gnu-variable-sized-type-not-at-end' may have been intended to silence earlier diagnostics

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
