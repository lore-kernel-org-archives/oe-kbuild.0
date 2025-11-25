Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF421D435F
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764062245; cv=none; b=rpSucwOMVc6UqWNJ64MhzNGeZoNdB6R93etZjMdxwGXxTRL6VimcIs+rvic+Og2h7hafjvr2DAzu2XCU3ngs6g2sOWyZy17pmfdnhp/MabnHaDLXUkxK1WXsF1JExkuE0gJ7gfXII8CiTWL8GSYXHZQ+Jh8KpeHWyr08eXNSEE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764062245; c=relaxed/simple;
	bh=IgBqKu01DdrtGCeFbIE8si38AfLUjO8zljaTrMqzC7E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HwcjO9DnoaZTsi6N0MMxu02W5IpKw89A6UoEBs8Q6xX4+qRhG2rf52vu6rb9ZTsVwH/Eb6rNV/hquTpR23JWgMPy2tEadZlb4TMowUWgzTaqoSoNKC9AjZxU3Vn1qd2+rJ2ophDtQR26QXKD6srA82lhHtQHDEWlAekpRPZ6O2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGcofspU; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGcofspU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764062244; x=1795598244;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IgBqKu01DdrtGCeFbIE8si38AfLUjO8zljaTrMqzC7E=;
  b=XGcofspUsIObXlKmHZ40P6zZoOxcm+vDsebCt2HY2IHQpvIHYUyiBWBk
   4UPFjZUJmEWLJ2yel2QZLDkhpuOxW0n4meNs6k+NU8AhrGqiH66/ZeZzV
   m7hbRdGafQLrxFd2+0902U10VkBRUDiO3veTNf7Y1BOVDJguDvQJh8kys
   hTPutHKlcQbYfZaK6u+u6rN0PeliBoNdYEx1kuj9pilZMQ6KBCsU9hZPc
   bpCSgkByILOA2L/o1c3HvlPiCEhu0e/bKHrJ3/t8m/zTKj2WoP6vrM2R4
   5blW3OaKTVgkhOcXtHJf8qpf+pB1uhIFNW0yN9+fEXAKckzotneG89Wux
   Q==;
X-CSE-ConnectionGUID: b+MxcclNQ52qFdqrlRB6wg==
X-CSE-MsgGUID: 7OXW6ggFQWah/6iSvJ+koQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66020285"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="66020285"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 01:17:22 -0800
X-CSE-ConnectionGUID: M3wMo4e3R4uOTKem3j+PDg==
X-CSE-MsgGUID: NXu2VLWWR6ObNcYwIvmWZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="196885274"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Nov 2025 01:17:21 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNpAk-000000001ZH-2mw4;
	Tue, 25 Nov 2025 09:17:18 +0000
Date: Tue, 25 Nov 2025 17:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11410/11727] test_mremap_vdso.c:23:10: fatal
 error: kselftest.h: No such file or directory
Message-ID: <202511251734.lGNVVYBB-lkp@intel.com>
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
TO: "Bala-Vignesh-Reddy" <reddybalavignesh9979@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Wei Yang <richard.weiyang@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   422f3140bbcb657e1b86c484296972ab76f6d1ff
commit: 7edd42093cb0f33ab09c8ae317d73795466c7fa2 [11410/11727] selftests: complete kselftest include centralization
:::::: branch date: 19 hours ago
:::::: commit date: 2 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251125/202511251734.lGNVVYBB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251734.lGNVVYBB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511251734.lGNVVYBB-lkp@intel.com/

Note: the linux-next/master HEAD 422f3140bbcb657e1b86c484296972ab76f6d1ff builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from single_step_syscall.c:34:
>> helpers.h:10:10: fatal error: kselftest.h: No such file or directory
      10 | #include "kselftest.h"
         |          ^~~~~~~~~~~~~
   compilation terminated.
--
>> test_mremap_vdso.c:23:10: fatal error: kselftest.h: No such file or directory
      23 | #include "kselftest.h"
         |          ^~~~~~~~~~~~~
   compilation terminated.
--
>> syscall_numbering.c:28:10: fatal error: kselftest.h: No such file or directory
      28 | #include "kselftest.h"
         |          ^~~~~~~~~~~~~
   compilation terminated.
--
>> corrupt_xstate_header.c:20:10: fatal error: kselftest.h: No such file or directory
      20 | #include "kselftest.h" /* For __cpuid_count() */
         |          ^~~~~~~~~~~~~
   compilation terminated.
--
   In file included from amx.c:19:
>> helpers.h:10:10: fatal error: kselftest.h: No such file or directory
      10 | #include "kselftest.h"
         |          ^~~~~~~~~~~~~
   compilation terminated.
   In file included from xstate.c:15:
>> helpers.h:10:10: fatal error: kselftest.h: No such file or directory
      10 | #include "kselftest.h"
         |          ^~~~~~~~~~~~~
   compilation terminated.
--
>> lam.c:21:10: fatal error: kselftest.h: No such file or directory
      21 | #include "kselftest.h"
         |          ^~~~~~~~~~~~~
   compilation terminated.
--
   In file included from avx.c:4:
>> xstate.h:7:10: fatal error: kselftest.h: No such file or directory
       7 | #include "kselftest.h"
         |          ^~~~~~~~~~~~~
   compilation terminated.
   In file included from xstate.c:15:
>> helpers.h:10:10: fatal error: kselftest.h: No such file or directory
      10 | #include "kselftest.h"
         |          ^~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
