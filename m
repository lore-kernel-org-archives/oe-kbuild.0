Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088D03ED3A3
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Jul 2026 08:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783587131; cv=none; b=VoOHe6m0Oiwgd6jz2FPfFhNQZ7DeWHgVDubM/BpWbo300wJ3aO9QpwW2qYWIzdbvwubw4VCxg84TjtfSRNiBn3QvQHebUAAZGK380+aqVpqmASETjDjsvbVBB7oP5Og1jgW5So+fXjYPzpoIGVfQRfSC6HI+Xw7kabBtOucLYbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783587131; c=relaxed/simple;
	bh=F/XOkBvji2yogQqOX+dvSqiECANTuHpNSfIfBU7FZkg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qj/PbD7Sjv5He9CRPHTVh/czFrd0Tc3oTR2egDgNsBH63QqH4Nz+f99JnmMls4dNDmxU6jDc1Jfy0z41icSkaFc9CDaZ2HKlCkeRrj6rpNjUlCVyWPN/4uos4fy7hMSC6A4F7rwwZcEtBqQoN6jeZEJHmR1bqHu0/wat/VVLOLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AVG83kqd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AVG83kqd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783587130; x=1815123130;
  h=date:from:to:cc:subject:message-id;
  bh=F/XOkBvji2yogQqOX+dvSqiECANTuHpNSfIfBU7FZkg=;
  b=AVG83kqd0w5Cs9TEKA5LmQpI1ksszc2xUP0STLiPMSFhebRHiGn6yluL
   mfPJWId47GX68tPZFJ1008NGIEU3mIBfMIdzEaEUtCwGYF9tMQ3fcP8FM
   g93huj+e/zq8vqkGD63B3qGppqEBb2Fp/ohOgw5WAWS9qrlSmu6cEBxQH
   msbni7NBwq8r0HCEjsLew8SE2H1qmKbAJq4+kT5jjW6SmU5O3+ZsgRZv5
   ghHLsnsGyuJ9LjZ70vUtXr3hPBvJuQ8qu5A6w0o9RgrdOAJgN+vT5EFh5
   QzVbwZvHuYbaHyVqhBdG49zvzc/ZrKaipfRw/EvCLAldSCvSd1vGD+Qlo
   g==;
X-CSE-ConnectionGUID: iSZOrvANTz64Sl7pnzhLfQ==
X-CSE-MsgGUID: 5mMmgDVLR8u+8rt1iggSeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="84455331"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="84455331"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2026 01:52:10 -0700
X-CSE-ConnectionGUID: pMVV4F26R3O8dNpJrPJpEQ==
X-CSE-MsgGUID: Xg1ML+KETSC8YMbkp3hIgA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="292715853"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 09 Jul 2026 01:52:09 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whkUI-000000002xh-3nla;
	Thu, 09 Jul 2026 08:52:06 +0000
Date: Thu, 09 Jul 2026 10:52:01 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: allocinfo_ioctl_test.c:92:73: warning: format '%llu' expects
 argument of type 'long long unsigned int', but argument 2 has type '__u64'
 {aka 'long unsigned int'}
Message-ID: <202607091033.chvdX3bF-lkp@intel.com>
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
TO: Abhishek Bapat <abhishekbapat@google.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Abhishek-Bapat/alloc_tag-add-ioctl-to-proc-allocinfo/20260709-020518
head:   ce2ea00e2482d8be7ac83d783dc4858153731c55
commit: 178d595eded89e9321a6349cb0a419e50315105b kselftest: alloc_tag: add kselftest for ioctl interface
date:   15 hours ago
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260709/202607091033.chvdX3bF-lkp@intel.com/config)
compiler: powerpc64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260709/202607091033.chvdX3bF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607091033.chvdX3bF-lkp@intel.com/

All warnings (new ones prefixed by >>):

   allocinfo_ioctl_test.c: In function 'match_entries':
>> allocinfo_ioctl_test.c:92:73: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
      92 |                 ksft_print_msg("Entry count mismatch. ioctl entries: %llu, proc entries: %llu\n",
         |                                                                      ~~~^
         |                                                                         |
         |                                                                         long long unsigned int
         |                                                                      %lu
      93 |                                tags->count, procfs_entries->count);
         |                                ~~~~~~~~~~~                               
         |                                    |
         |                                    __u64 {aka long unsigned int}
   allocinfo_ioctl_test.c:92:93: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 3 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
      92 |                 ksft_print_msg("Entry count mismatch. ioctl entries: %llu, proc entries: %llu\n",
         |                                                                                          ~~~^
         |                                                                                             |
         |                                                                                             long long unsigned int
         |                                                                                          %lu
      93 |                                tags->count, procfs_entries->count);
         |                                             ~~~~~~~~~~~~~~~~~~~~~                            
         |                                                           |
         |                                                           __u64 {aka long unsigned int}
   allocinfo_ioctl_test.c:100:44: warning: format '%llu' expects argument of type 'long long unsigned int', but argument 2 has type '__u64' {aka 'long unsigned int'} [-Wformat=]
     100 |                         ksft_print_msg("%lluth entry does not match.\n", i);
         |                                         ~~~^                             ~
         |                                            |                             |
         |                                            long long unsigned int        __u64 {aka long unsigned int}
         |                                         %lu
   allocinfo_ioctl_test.c: In function 'get_filtered_procfs_entries':
   allocinfo_ioctl_test.c:140:44: warning: format '%llu' expects argument of type 'long long unsigned int *', but argument 3 has type '__u64 *' {aka 'long unsigned int *'} [-Wformat=]
     140 |                 matches = sscanf(line, "%llu %llu %[^:]:%llu func:%s",
         |                                         ~~~^
         |                                            |
         |                                            long long unsigned int *
         |                                         %lu
     141 |                                  &procfs_entry.counter.bytes,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  |
         |                                  __u64 * {aka long unsigned int *}
   allocinfo_ioctl_test.c:140:49: warning: format '%llu' expects argument of type 'long long unsigned int *', but argument 4 has type '__u64 *' {aka 'long unsigned int *'} [-Wformat=]
     140 |                 matches = sscanf(line, "%llu %llu %[^:]:%llu func:%s",
         |                                              ~~~^
         |                                                 |
         |                                                 long long unsigned int *
         |                                              %lu
     141 |                                  &procfs_entry.counter.bytes,
     142 |                                  &procfs_entry.counter.calls,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                  |
         |                                  __u64 * {aka long unsigned int *}
   allocinfo_ioctl_test.c:140:60: warning: format '%llu' expects argument of type 'long long unsigned int *', but argument 6 has type '__u64 *' {aka 'long unsigned int *'} [-Wformat=]
     140 |                 matches = sscanf(line, "%llu %llu %[^:]:%llu func:%s",
         |                                                         ~~~^
         |                                                            |
         |                                                            long long unsigned int *
         |                                                         %lu
   ......
     144 |                                  &procfs_entry.tag.lineno,
         |                                  ~~~~~~~~~~~~~~~~~~~~~~~~   
         |                                  |
         |                                  __u64 * {aka long unsigned int *}

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
