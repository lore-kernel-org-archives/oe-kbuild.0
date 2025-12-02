Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D942AD35
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 03:15:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764645357; cv=none; b=qFnc/x9txd2b/6A6IcNACh8qUktcKZJIZ05v9CDdrNopm7oMO0A+YfMzJ+ChV+nZ3pS/NURILhI+fQtpB0wLKr2Lc39zthkljCVtTi9ANFYFmFEuR2m46wKAdGRH98qsEXJt07nq9/hWism+W7hi+yST0XvUL08RPoazxp4UW5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764645357; c=relaxed/simple;
	bh=vTlDRu3Os8USjKOD+5NpeW44r7JnTt09lDzrxjCx4+A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LuV1gpfyLh1SlNrVT4Rs3UDyZkfw3sBXTzbjkAgI/zgY2BRQknpsHFWgILKb4s6ckLl+tvdIdsLJb9XnfisVV/IBAhXkQkUXKB8k4L1Oqve3Nzul1wdvPeMFObLMPmjVNoqQFgGnUpD83kvsGLQi4SzpLay7m/oLhPnGxUDSlNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dBczcyC/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dBczcyC/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764645355; x=1796181355;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vTlDRu3Os8USjKOD+5NpeW44r7JnTt09lDzrxjCx4+A=;
  b=dBczcyC/tFHwUWc1rKs1buqBNPMhB3p65JZGYSxj9hqrOJAWsa3eYZ/9
   7Vmrn+2DGE/q9UKG1/mLDO8bxFzeWQJiDXtKHw+V36DjryN+sIpf/Bzym
   vuI60A/B08PrHU+nDJye/l6Zlx704k3NLH9/TQU/OOkyS99WG+h0XZcwA
   IafjTHVL3EoeotdtxA1+aW1bPFy1xs49Nb8KvWZ1mU5sZ0tA/14GdpHHk
   O6WBYFO/oorh7Og39c9/9JpT5nwJTrvUL2iTff5ky3ZXmhtAKgQciDszP
   ADZrB5W13CtjxK7T6uosDvGLvr6Hg+0a86y/3vpMmXInmTgf/VC2vDlRB
   g==;
X-CSE-ConnectionGUID: 1delttDxS0i5nL+XdGkdjQ==
X-CSE-MsgGUID: riTn0YOVSgaURyrHQGTLAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="78065892"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="78065892"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 19:15:55 -0800
X-CSE-ConnectionGUID: L2mAUQkVTUiT/04i9r+EXA==
X-CSE-MsgGUID: dyzJMNK/T+CxRPwL/tCDiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="217587083"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Dec 2025 19:15:53 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQGrm-000000009N1-3s8C;
	Tue, 02 Dec 2025 03:15:50 +0000
Date: Tue, 2 Dec 2025 11:15:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 12434/13171] test_mremap_vdso.c:23:10: fatal
 error: kselftest.h: No such file or directory
Message-ID: <202512021111.4kiXQeR1-lkp@intel.com>
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
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: e6fbd1759c9ece5044d3470f30a5e2166dc9de89 [12434/13171] selftests: complete kselftest include centralization
:::::: branch date: 24 hours ago
:::::: commit date: 4 days ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512021111.4kiXQeR1-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512021111.4kiXQeR1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512021111.4kiXQeR1-lkp@intel.com/

Note: the linux-next/master HEAD 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a builds fine.
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
