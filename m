Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE8E112FF6B
	for <oe-kbuild@lists.linux.dev>; Fri, 17 May 2024 16:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715962254; cv=none; b=eNk9bA9wjiU4RCTxDeUnyLt4jfSs6G2QUcK80+vBFIWCYwACRUvrX1ebNArqJtQX/QJCAKoeUI8+UOmedCN9GreDAX/GSCl1CBwV/sHEegf9KY/9jI76ZbJEgPFyflkApn/QOvYQoOHkwMoGrz+g6Tkg/P5+75+UMajJhkzcCus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715962254; c=relaxed/simple;
	bh=gGCUbKR4fuQbMHISbrECLJcYujqBCLqDGJPkcwLzndM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ssNZpPNSEGGLeP1fL/lAzmy9OAtkzV5Pz+c8quTXpFOcWK+nvOAlnCC7qaASa5LSZjrBQRr1lRuJyK3s96OmcBtBGFvDkqqV9PXpmSwuawTkczz90z08GQxKBsVurBCru+pOlIJH53z5lrsFnyGaMYJrLKMjZP8js2sjxa3+nYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J61+Ux8r; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J61+Ux8r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715962253; x=1747498253;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=gGCUbKR4fuQbMHISbrECLJcYujqBCLqDGJPkcwLzndM=;
  b=J61+Ux8r81nxWOsaIf2hXXnvXYPiN8qPAuAf/EEGuQon9qzL89fIxNTr
   dfeYn2jT/uAj/aoXr7eK1gVvA5TPbmaUwla3rTeq1B6UPThUZRoaXdsqF
   LiZ1PYxsiJ3Rj+RMNhYFf2hCvB0CbQZ3OBAONFmG/y8IRRj6uobG3ua+A
   fPip0bVBML/nzXLwSwidwVSZhKAut/Cxn7IoWMdCrlk467z2K82hp55CX
   BScIqbWi6tiWq5xQCJPn2rINpDb8UGXxp1dZ8wNX6B/mmGmrai2HQ/8jG
   IJx1FlRX/S5g9CMycVJMLs3H+aer1uafMYTR+BlvFBuVuE+fsf1MvmX8k
   Q==;
X-CSE-ConnectionGUID: sD2+F4CVSFy7q9OnjXUBiA==
X-CSE-MsgGUID: SAjM1PnbSkuuuYFvpnYSnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="15977913"
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="15977913"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2024 09:10:52 -0700
X-CSE-ConnectionGUID: iE371PsdSHW/Iyu2ms+PXw==
X-CSE-MsgGUID: +9DhWfEaQm221/+65H/mNg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,168,1712646000"; 
   d="scan'208";a="31671832"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 17 May 2024 09:10:52 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s80A0-0000t2-1k;
	Fri, 17 May 2024 16:10:44 +0000
Date: Sat, 18 May 2024 00:09:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [broonie-ci:kselftest-mitigate-gnu-source 2/2]
 ../kselftest_harness.h:54:2: error: #warning kselftest harness requires
 _GNU_SOURCE to be defined
Message-ID: <202405172341.C6TNmGXU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/ci.git kselftest-mitigate-gnu-source
head:   45552542703cbd042bfdd3fe8584bd42fd0d5d7b
commit: 45552542703cbd042bfdd3fe8584bd42fd0d5d7b [2/2] kselftest: Desecalate reporting of missing _GNU_SOURCE
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240517/202405172341.C6TNmGXU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405172341.C6TNmGXU-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from hid_bpf.c:5:
>> ../kselftest_harness.h:54:2: error: #warning kselftest harness requires _GNU_SOURCE to be defined [-Werror=cpp]
      54 | #warning kselftest harness requires _GNU_SOURCE to be defined
         |  ^~~~~~~
   cc1: all warnings being treated as errors
--
   In file included from test-pcmtest-driver.c:10:
>> ../kselftest_harness.h:54:2: warning: #warning kselftest harness requires _GNU_SOURCE to be defined [-Wcpp]
      54 | #warning kselftest harness requires _GNU_SOURCE to be defined
         |  ^~~~~~~


vim +54 tools/testing/selftests/hid/../kselftest_harness.h

c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  52  
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook      2020-06-22  53  #ifndef _GNU_SOURCE
45552542703cbd tools/testing/selftests/kselftest_harness.h    Mark Brown     2024-05-16 @54  #warning kselftest harness requires _GNU_SOURCE to be defined
e80068be21824e tools/testing/selftests/kselftest_harness.h    Kees Cook      2020-06-22  55  #endif
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2017-08-07  56  #include <asm/types.h>
65177e47d3035c tools/testing/selftests/kselftest_harness.h    Jakub Kicinski 2023-01-25  57  #include <ctype.h>
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2017-08-07  58  #include <errno.h>
369130b63178e0 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2017-08-07  59  #include <stdbool.h>
b5bb6d3068eabb tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-12-10  60  #include <stdint.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  61  #include <stdio.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  62  #include <stdlib.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  63  #include <string.h>
0ef67a888375b0 tools/testing/selftests/kselftest_harness.h    Kees Cook      2020-06-22  64  #include <sys/mman.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  65  #include <sys/types.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  66  #include <sys/wait.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  67  #include <unistd.h>
63e6b2a42342c3 tools/testing/selftests/kselftest_harness.h    Kees Cook      2022-03-24  68  #include <setjmp.h>
a86f18903db921 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2024-05-11  69  #include <syscall.h>
a86f18903db921 tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2024-05-11  70  #include <linux/sched.h>
c99ee51a9d9716 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  71  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
