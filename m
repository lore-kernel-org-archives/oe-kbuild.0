Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741C5253F11
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 02:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763778148; cv=none; b=glfjRRovYJsMyzDNzwWpztWGT2L4g0f+lbeHxIkQFYJd0G9oVEPWUH+OWbKA+8a7BFUKU0jRBzoPmUIlH57jies6akOe7OFFRKiHAkphOd1WYCfmJffR4sn7W3iR9mDhWqV7VFPfkYS5hk0PXbUvQ7kEafgOvcdXq7hr6pssnqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763778148; c=relaxed/simple;
	bh=STQ5c4FWLdxZ3YL7rOAIREvML/YkKQWPdKkXQSFv7Jk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fSESjeapranB2NHqIhkk4aHrtrYwDJSsIxg+iF9PZXffeedTVA9m1rDuR1bYOzoPVTDsTnxkFZBvYi0VCejfOzMLlz02a1lHri1DAj6V2466HLdMHmRHvH3jHMKH0wDbJrsw0vUy+z862Y9QdQ684bNI0FI0iMJYT6Ms6BAS6Qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W3c/pAxD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W3c/pAxD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763778147; x=1795314147;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=STQ5c4FWLdxZ3YL7rOAIREvML/YkKQWPdKkXQSFv7Jk=;
  b=W3c/pAxDUClCeE+NkjiCD+1jHJ0S9iE6gehaOgCh6nWAY5q2asLvfM2d
   IYOI4cBKvs9YWQbLMJNOR3jMuFkLjMEm1Xry1hagm/ZPZMGhXyJ4gghF/
   RDwwCN5OP4oAgTj248KnM0AY4c/ixke4q1x8shZ4bJ7HYD/6mFhEB9xfS
   21AjacMun6hGLmfhd4xYroGnU/Fn+byp/wTAjNUtfrw9CCEPNBJfhjwcm
   7NhmtvKrpg+/9oolIuIMvs1K0cawBjZXlCjp5PEQAFQMtlwmx8l5quEkO
   rS31hqWKR5H2xqnm1/TTmS3Tm7LOw2Xe48Wo9Ycuyibe2V3r6tpSQZd8v
   Q==;
X-CSE-ConnectionGUID: HiYX2yOrRDqzjwPsjhD9/A==
X-CSE-MsgGUID: 9wSOtOChRViE7rBrYxAO9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11620"; a="65917573"
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="65917573"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2025 18:22:26 -0800
X-CSE-ConnectionGUID: ircf4lDKQxquYPMNt81TqQ==
X-CSE-MsgGUID: csBTwSgDSZKqDNWPzqOlxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,217,1758610800"; 
   d="scan'208";a="222475620"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 21 Nov 2025 18:22:25 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMdGY-000000001zz-0XJ8;
	Sat, 22 Nov 2025 02:22:22 +0000
Date: Sat, 22 Nov 2025 03:21:49 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 9005/11041]
 tools/testing/selftests/../../../tools/include/asm-generic/bitsperlong.h:14:2:
 error: #error Inconsistent word size. Check asm/bitsperlong.h
Message-ID: <202511220329.dCluJOea-lkp@intel.com>
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
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Heiko Carstens <hca@linux.ibm.com>
CC: Arnd Bergmann <arnd@arndb.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: 3db5cf9354710c3b9268af74a0dca88514279453 [9005/11041] s390/uapi: Remove 31 bit support from uapi header files
:::::: branch date: 20 hours ago
:::::: commit date: 5 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251122/202511220329.dCluJOea-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251122/202511220329.dCluJOea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511220329.dCluJOea-lkp@intel.com/

Note: the linux-next/master HEAD d724c6f85e80a23ed46b7ebc6e38b527c09d64f5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from usr/include/asm/bitsperlong.h:7,
                    from usr/include/asm-generic/int-ll64.h:12,
                    from usr/include/asm/types.h:11,
                    from tools/testing/selftests/../../../tools/include/linux/bitops.h:5,
                    from include/s390/facility.h:14,
                    from lib/s390/facility.c:11:
>> tools/testing/selftests/../../../tools/include/asm-generic/bitsperlong.h:14:2: error: #error Inconsistent word size. Check asm/bitsperlong.h
      14 | #error Inconsistent word size. Check asm/bitsperlong.h
         |  ^~~~~
   In file included from tools/testing/selftests/../../../tools/include/linux/types.h:7,
                    from tools/testing/selftests/../../../tools/include/linux/compiler.h:157,
                    from tools/testing/selftests/../../../tools/include/linux/build_bug.h:5,
                    from tools/testing/selftests/../../../tools/include/linux/bits.h:30,
                    from tools/testing/selftests/../../../tools/include/linux/bitops.h:14:
   /opt/cross/gcc-15.1.0-nolibc/s390-linux/lib/gcc/s390-linux/15.1.0/include/stdint.h:11:16: fatal error: stdint.h: No such file or directory
      11 | # include_next <stdint.h>
         |                ^~~~~~~~~~
   compilation terminated.


vim +14 tools/testing/selftests/../../../tools/include/asm-generic/bitsperlong.h

bb9707077b4ee5 Arnaldo Carvalho de Melo 2016-07-12  12  
2a00f026a15d16 Arnaldo Carvalho de Melo 2016-07-13  13  #if BITS_PER_LONG != __BITS_PER_LONG
bb9707077b4ee5 Arnaldo Carvalho de Melo 2016-07-12 @14  #error Inconsistent word size. Check asm/bitsperlong.h
bb9707077b4ee5 Arnaldo Carvalho de Melo 2016-07-12  15  #endif
bb9707077b4ee5 Arnaldo Carvalho de Melo 2016-07-12  16  

:::::: The code at line 14 was first introduced by commit
:::::: bb9707077b4ee5f77bc9939b057ff8a0d410296f tools: Copy the bitsperlong.h files from the kernel

:::::: TO: Arnaldo Carvalho de Melo <acme@redhat.com>
:::::: CC: Arnaldo Carvalho de Melo <acme@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
