Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EE41F03D2
	for <oe-kbuild@lists.linux.dev>; Sun, 25 Jan 2026 09:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769334669; cv=none; b=a3toVBTJc7r0mvQRT7YPEa7/L1fKDPUrdfoXc2CFIqw2i0FKvL91UJkESaIhxTdJJMd85uXoq3pWRhnHiU90S0rNEV24zs5QN2FqqXMKgvFGhc8j6r3m+sPuc+UAjOa+JB9+9lutDOvjlz71vq5BY53Tfx7NsmvUo97/G1dffX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769334669; c=relaxed/simple;
	bh=xXbmTpxkNVE3CmXuBy+wY35WVZyY9ywpEVYecYcpIQo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=u8aTGKMOlPieUYxjK3Swaxy7xic0+d9DUmoU5KXksYdM4Ftz8bSmM58NRd85HYHSJYu8sXMOltOQyA1XvalLJdi+QMdoXhV5nwErBzKfhh/1DbNnDi0Rw7EKL6fDE0teg2iXx+/ec1jPtxwSaLwxGDCvhsSk36Q+q0XG66dqo40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R2qsyx0A; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R2qsyx0A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769334666; x=1800870666;
  h=date:from:to:cc:subject:message-id;
  bh=xXbmTpxkNVE3CmXuBy+wY35WVZyY9ywpEVYecYcpIQo=;
  b=R2qsyx0AZmiyFkeSOmC/2sDugIzkN05PAImBqkPAQg7ATedcnNHftb7i
   WL4JUwDuo70RlxmC492Ts39p8WgoA0f09um+VI28m+MPF1qxkR8Cynq/a
   O3V3WJwKNlegNLJbOsWOJcpIPmQayofGvz93LkIawHyiyLZBMgiH7wAUV
   ZKnphboA2aOaPvYhSAoxZgzbvxQGxwjqJvpYvuZtb8MMqGshK7jNwn6LT
   063WYDKUiGOzpMb2TUF5emMC1KKx8UsgnFaIyN0JVCghgV7tUH6wX8WbA
   GM7tf8G0JPEFkj4koJNHJyPWURUeb2Y/j7ZwbWJkALz9MSW0s5xtJMar9
   w==;
X-CSE-ConnectionGUID: cODGEaM9QF2L171Nhy2WTg==
X-CSE-MsgGUID: vLEx3DvwTRqzJoOJpZWF0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11681"; a="69726795"
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="69726795"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 01:51:06 -0800
X-CSE-ConnectionGUID: /bRGeXSrQSae/KKTAMLqZg==
X-CSE-MsgGUID: q0rzvaU2QJmJ7zWKJ+5RBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,252,1763452800"; 
   d="scan'208";a="211893560"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 25 Jan 2026 01:51:05 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjwlr-000000001BV-157j;
	Sun, 25 Jan 2026 09:51:03 +0000
Date: Sun, 25 Jan 2026 10:50:10 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [akpm-mm:mm-new 321/330] ../kselftest_harness.h:57:10: fatal
 error: ctype.h: No such file or directory
Message-ID: <202601251039.3LsxuyM1-lkp@intel.com>
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
CC: David Hildenbrand <david@kernel.org>
TO: Miaohe Lin <linmiaohe@huawei.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   5a3704ed2dce0b54a7f038b765bb752b87ee8cc2
commit: f9ac07aede73e2d379cbdd9e634d422f835586f4 [321/330] selftests/mm: add memory failure anonymous page test
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260125/202601251039.3LsxuyM1-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251039.3LsxuyM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601251039.3LsxuyM1-lkp@intel.com/

Note: the akpm-mm/mm-new HEAD 5a3704ed2dce0b54a7f038b765bb752b87ee8cc2 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from memory-failure.c:8:
>> ../kselftest_harness.h:57:10: fatal error: ctype.h: No such file or directory
      57 | #include <ctype.h>
         |          ^~~~~~~~~
   compilation terminated.
   vm_util.c:2:10: fatal error: string.h: No such file or directory
       2 | #include <string.h>
         |          ^~~~~~~~~~
   compilation terminated.
   thp_settings.c:2:10: fatal error: fcntl.h: No such file or directory
       2 | #include <fcntl.h>
         |          ^~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
