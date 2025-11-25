Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CE951BBBE5
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 02:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764039460; cv=none; b=G4Qo1uhtJXy3P4OBkjzDnJA63b/MRS0Z+8IA3mDxBvPOG0JFxeX7GQAMudwOV8uBHcvCP/VjPgcKAfoCZwgJvMORWPbE/imqDxH4YowWW/H5Ln6UXhbEBmFN4WZXn8nX4BD1XKtEGpaGLv/VC8vwSczH51MyVVnY0HiHaofWi98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764039460; c=relaxed/simple;
	bh=IY0u/rVgV9CV/82CHP9CD/DtWJ7NuVUf2+qmj5ZgCSk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BLqOLmQusyDM/3MzJ5aMGXl3vfcnj56zMaspIglJFY/aKl5+titoX2qGJ2/g8B+W2tsuAFz1wUVpICb6njqp4gNw1iSY5Dp1s3Pl0W4CXzADybyHTmUpqUgo/OJL6DUEq72qBwT9lK1G4TsGTxDVv7VtMgQvpWVsImB2EUibg8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BVOf5cW6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BVOf5cW6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764039459; x=1795575459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IY0u/rVgV9CV/82CHP9CD/DtWJ7NuVUf2+qmj5ZgCSk=;
  b=BVOf5cW6rWO8prl4znOmHB7Ox31y5bieRSfs2jQamQbuHdVp/CgJLhdf
   Wb5fQQEs7E8ZNGo8PDE/ff92kCQkpjOeG1wAGxRMvDf/ZVxIC16FgOYV9
   d/SiemKcS/4TTE3KqVmS77jVQSlyOp88+gafm9oQJIGwwos26kr9mBNyf
   l10hZ68hdW7oPdXrrRw2+i17qysANGyKwjuQ5pHf0Df3OchIy/Ejjrb4Z
   unV95b2jMQzL/TtaFumbBCxK1EdcliiA2dDnpa+1GEOC90z5JbRD3KNUZ
   3u1mXKy1C8oSjJDMYlCCdipiumt6HLf2Oo2GDi5v9ExO/9MtNcLDYXzO7
   g==;
X-CSE-ConnectionGUID: GJDBST9XRmCPOFHRnnRM8Q==
X-CSE-MsgGUID: KfL0clARTKmKnWSYhCn5OQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="91536483"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="91536483"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 18:57:38 -0800
X-CSE-ConnectionGUID: 8rHviMEuQ++UfOsoK7OOjw==
X-CSE-MsgGUID: XEqmGXHuRmS7PKvhBlE94g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192508936"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 24 Nov 2025 18:57:37 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNjFG-000000000OX-1toQ;
	Tue, 25 Nov 2025 02:57:34 +0000
Date: Tue, 25 Nov 2025 03:57:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-5.4 5/5] userfaultfd.c:296:65: error:
 expected ')' before 'PRIx64'
Message-ID: <202511250335.lSphn3Io-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android12-5.4
head:   7055541caeda53d6275f23b878618d609132e955
commit: 2b2f7d6a04d65c2ebd53f9e5d3de6b55635d57b6 [5/5] BACKPORT: FROMGIT: userfaultfd/selftests: add test exercising minor fault handling
:::::: branch date: 17 hours ago
:::::: commit date: 4 years, 8 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251125/202511250335.lSphn3Io-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250335.lSphn3Io-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511250335.lSphn3Io-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   userfaultfd.c: In function 'continue_range':
>> userfaultfd.c:296:65: error: expected ')' before 'PRIx64'
     296 |                         "UFFDIO_CONTINUE failed for address 0x%" PRIx64 "\n",
         |                                                                 ^~~~~~~
         |                                                                 )
   userfaultfd.c:59:1: note: 'PRIx64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
      58 | #include "../kselftest.h"
     +++ |+#include <inttypes.h>
      59 | 
   userfaultfd.c:295:24: note: to match this '('
     295 |                 fprintf(stderr,
         |                        ^
>> userfaultfd.c:296:63: warning: spurious trailing '%' in format [-Wformat=]
     296 |                         "UFFDIO_CONTINUE failed for address 0x%" PRIx64 "\n",
         |                                                               ^
   userfaultfd.c: In function 'uffd_handle_page_fault':
>> userfaultfd.c:498:17: error: unknown type name 'uint8_t'
     498 |                 uint8_t *area;
         |                 ^~~~~~~
   userfaultfd.c:59:1: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
      58 | #include "../kselftest.h"
     +++ |+#include <stdint.h>
      59 | 
>> userfaultfd.c:513:25: error: 'uint8_t' undeclared (first use in this function)
     513 |                 area = (uint8_t *)(area_dst +
         |                         ^~~~~~~
   userfaultfd.c:513:25: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:513:25: note: each undeclared identifier is reported only once for each function it appears in
>> userfaultfd.c:513:34: error: expected expression before ')' token
     513 |                 area = (uint8_t *)(area_dst +
         |                                  ^
   userfaultfd.c: At top level:
>> userfaultfd.c:699:33: error: unknown type name 'uint64_t'
     699 | static int userfaultfd_open_ext(uint64_t *features)
         |                                 ^~~~~~~~
   userfaultfd.c:699:33: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:726:29: error: unknown type name 'uint64_t'
     726 | static int userfaultfd_open(uint64_t features)
         |                             ^~~~~~~~
   userfaultfd.c:726:29: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: In function 'userfaultfd_zeropage_test':
   userfaultfd.c:934:13: error: implicit declaration of function 'userfaultfd_open' [-Wimplicit-function-declaration]
     934 |         if (userfaultfd_open(0) < 0)
         |             ^~~~~~~~~~~~~~~~
   userfaultfd.c: In function 'userfaultfd_minor_test':
   userfaultfd.c:1093:9: error: unknown type name 'uint8_t'
    1093 |         uint8_t expected_byte;
         |         ^~~~~~~
   userfaultfd.c:1093:9: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1096:9: error: unknown type name 'uint64_t'
    1096 |         uint64_t features = UFFD_FEATURE_MINOR_HUGETLBFS;
         |         ^~~~~~~~
   userfaultfd.c:1096:9: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1107:13: error: implicit declaration of function 'userfaultfd_open_ext'; did you mean 'userfaultfd_sig_test'? [-Wimplicit-function-declaration]
    1107 |         if (userfaultfd_open_ext(&features))
         |             ^~~~~~~~~~~~~~~~~~~~
         |             userfaultfd_sig_test
   userfaultfd.c:1136:58: error: 'uint8_t' undeclared (first use in this function)
    1136 |                 memset(area_dst + (p * page_size), p % ((uint8_t)-1),
         |                                                          ^~~~~~~
   userfaultfd.c:1136:58: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
