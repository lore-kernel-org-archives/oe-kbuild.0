Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16EDC332ED0
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 02:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780109866; cv=none; b=WwHkCLI3NDkl0wn4BmDAabKnlxjchdsBc5plLwB9YJ6uS+uKuUJxaD2VlR6jLr9v5aMxDp9tDCEM2qurVsqFF1q76ib9ZydwO54PQ/bCc9OXUmCJoL7Pn+A5o5nvLD3NFZLbizj+1kPl2YKhCw0JyTzBLncsGMi51pyLaQ9XYoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780109866; c=relaxed/simple;
	bh=NtPo9ZrjnNqtvyax5Fo31zBwJSQaYx+TGhGE1j/49oo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kt/weKKww7r70fAEh67EP1EVchgkMTkpdrG/uEtENyu3SBAWmOc+XcdH/eMcysFuOSQ0nYMudSMHpihFKMEJllpdTrEGam5hqEj+IBWWcOQXbVu0BYVGYpIBj2bz6jd4lKbItyA9LHOUfwJGExx6SAGO9I2bXaURILkbEmVkn34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bbmzh/Zt; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbmzh/Zt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780109866; x=1811645866;
  h=date:from:to:cc:subject:message-id;
  bh=NtPo9ZrjnNqtvyax5Fo31zBwJSQaYx+TGhGE1j/49oo=;
  b=bbmzh/Zt0LELmfkne5brRaFThbvYsYP4bN1rgIxYR10LcEEtt/OyYK9j
   RAEs+wTjrXe4QCzANt4TS+xY3VT+MW+0YmeXTR7VUIcMj4dN5r321hMcT
   Z2OFZCKY17qiAIzUhSnN8K2fyOcIs/vddu8TPea/tHwxDkC/WqwlHpDtZ
   wFUYpahgXdUn3j5qb0mb7bJgNkwCSxLkMPko2C1aLs0J4Nss3bnDloBwO
   3Q4Npz5cPhECamyEZ9gjsoO1i2a9UvzSXwXwthDxruYc3L90l6Tjubns9
   b79lIWK1N/zJtmvvGed7o0zt5q3hlGkeRR5Bb3eVCtGsdUo82jZ3E+FUW
   Q==;
X-CSE-ConnectionGUID: sT3CSXduQV2jdlY1ogoA4A==
X-CSE-MsgGUID: VGFLlaidSTykqHUC+MYMXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="84848878"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="84848878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 19:57:45 -0700
X-CSE-ConnectionGUID: nbueURDjQbyNo1uTyYjrlQ==
X-CSE-MsgGUID: n+ItArf4QvuINH7BROTO9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="247021218"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2026 19:57:43 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wT9tN-0000000011x-2P05;
	Sat, 30 May 2026 02:57:41 +0000
Date: Sat, 30 May 2026 04:57:27 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 userfaultfd.c:373:63: warning: spurious trailing '%' in format
Message-ID: <202605300426.nejOAIVY-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

Hi Axel,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   d9f8937e22c70a66c2547874cec8e0e575150a8c
commit: 357700fcc3b51b66e2a790c5bb036d97916086af [1/1] FROMGIT: userfaultfd/selftests: add test exercising minor fault handling
:::::: branch date: 13 hours ago
:::::: commit date: 5 years ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260530/202605300426.nejOAIVY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300426.nejOAIVY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605300426.nejOAIVY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   userfaultfd.c: In function 'continue_range':
   userfaultfd.c:373:65: error: expected ')' before 'PRIx64'
     373 |                         "UFFDIO_CONTINUE failed for address 0x%" PRIx64 "\n",
         |                                                                 ^~~~~~~
         |                                                                 )
   userfaultfd.c:60:1: note: 'PRIx64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
      59 | #include "../kselftest.h"
     +++ |+#include <inttypes.h>
      60 | 
   userfaultfd.c:372:24: note: to match this '('
     372 |                 fprintf(stderr,
         |                        ^
>> userfaultfd.c:373:63: warning: spurious trailing '%' in format [-Wformat=]
     373 |                         "UFFDIO_CONTINUE failed for address 0x%" PRIx64 "\n",
         |                                                               ^
   userfaultfd.c: In function 'uffd_handle_page_fault':
   userfaultfd.c:597:17: error: unknown type name 'uint8_t'
     597 |                 uint8_t *area;
         |                 ^~~~~~~
   userfaultfd.c:60:1: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
      59 | #include "../kselftest.h"
     +++ |+#include <stdint.h>
      60 | 
   userfaultfd.c:612:25: error: 'uint8_t' undeclared (first use in this function)
     612 |                 area = (uint8_t *)(area_dst +
         |                         ^~~~~~~
   userfaultfd.c:612:25: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:612:25: note: each undeclared identifier is reported only once for each function it appears in
   userfaultfd.c:612:34: error: expected expression before ')' token
     612 |                 area = (uint8_t *)(area_dst +
         |                                  ^
   userfaultfd.c: At top level:
   userfaultfd.c:827:33: error: unknown type name 'uint64_t'
     827 | static int userfaultfd_open_ext(uint64_t *features)
         |                                 ^~~~~~~~
   userfaultfd.c:827:33: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:854:29: error: unknown type name 'uint64_t'
     854 | static int userfaultfd_open(uint64_t features)
         |                             ^~~~~~~~
   userfaultfd.c:854:29: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: In function 'userfaultfd_zeropage_test':
   userfaultfd.c:1097:13: error: implicit declaration of function 'userfaultfd_open' [-Wimplicit-function-declaration]
    1097 |         if (userfaultfd_open(0) < 0)
         |             ^~~~~~~~~~~~~~~~
   userfaultfd.c: In function 'userfaultfd_minor_test':
   userfaultfd.c:1288:9: error: unknown type name 'uint8_t'
    1288 |         uint8_t expected_byte;
         |         ^~~~~~~
   userfaultfd.c:1288:9: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1292:9: error: unknown type name 'uint64_t'
    1292 |         uint64_t features = UFFD_FEATURE_MINOR_HUGETLBFS;
         |         ^~~~~~~~
   userfaultfd.c:1292:9: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1303:13: error: implicit declaration of function 'userfaultfd_open_ext'; did you mean 'userfaultfd_sig_test'? [-Wimplicit-function-declaration]
    1303 |         if (userfaultfd_open_ext(&features))
         |             ^~~~~~~~~~~~~~~~~~~~
         |             userfaultfd_sig_test
   userfaultfd.c:1332:58: error: 'uint8_t' undeclared (first use in this function)
    1332 |                 memset(area_dst + (p * page_size), p % ((uint8_t)-1),
         |                                                          ^~~~~~~
   userfaultfd.c:1332:58: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
