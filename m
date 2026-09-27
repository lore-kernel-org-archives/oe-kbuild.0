Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 323D53CFF5E
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Sep 2026 12:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510609; cv=none; b=lVZidEanqwKreO/MtaRQZ3g7EO6Dz9QbNe7j05qMDJZYsyy4u7OoDKIwDMzfzfVFIBf0W9tHG3F3T+6wEBRj56UlJDZ5NPPjmw8qyrcyWOHuTsw7HzJYcEOyYJmDs3ESAF4oXeJKgE1AVSoQ1rmKNYfQDj8jLD6Is/hFETtrevo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510609; c=relaxed/simple;
	bh=D4zS/u/syOBU0OiqCEeinKn6ahxtmBebB7ZGeTKs3Tw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=pG2DccYdCSaBXpttzgvLypb/eDtcTWWSA8BW8h7FEjVlSAtfQM6wS4RlePyOuiDW7Y2BrDozw1MV7CWhrJ608FPFwI15taGMQgKxbUTYEFECvDWim5kXo0IgucENIWgb3ZfYVXPOxIMagBgw8+RZftswjhCk7EZjc81vKRVvKR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2Dlf23l; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2Dlf23l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790510607; x=1822046607;
  h=date:from:to:cc:subject:message-id;
  bh=D4zS/u/syOBU0OiqCEeinKn6ahxtmBebB7ZGeTKs3Tw=;
  b=T2Dlf23lJRhRucdDrfHVgmw5Wbf0megikRCQz68pzjZrx8481zX/UTNt
   IHdbjp5aCXrZ+y3K1wvhNELMMfeq84ICNBylPcsjpSVuZzpbXoZFStCx5
   YqQ8HqaUvVD37OSuT3hOly1QjcIeRoXkihat/sLWUXrg2OdBNH6UcZbOp
   LoMG4dS1OCxItM8ATMzpE5QPly47qfmP7HJeuBQpsEqYhigkW2qA6oILT
   F3LL8WGikg4SEj/4g1jl53rLScfpSQPOblweIWn6UW82EVPzjP+I2ioGi
   w/0u9ZnU50ob80cc1e3RdQcwqR9e3i/eZ/MwnX+MJDVeeclgpb8Bnf2+4
   Q==;
X-CSE-ConnectionGUID: G/blGP6cRp+CSg0nZttMgA==
X-CSE-MsgGUID: 40ini6ofSHys4W9wOxc2xw==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="78791579"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="78791579"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 05:03:27 -0700
X-CSE-ConnectionGUID: KrbNh5mOQR653GRTgWpsJw==
X-CSE-MsgGUID: nJfXnpGJSVSbsClo2Xu+uQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="274325556"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 27 Sep 2026 05:03:25 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAnbG-000000000ZL-1rGE;
	Sun, 27 Sep 2026 12:03:22 +0000
Date: Sun, 27 Sep 2026 14:02:37 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-kiwi-5.10 284/284]
 userfaultfd.c:146:33: warning: format '%d' expects a matching 'int' argument
Message-ID: <202609271344.2fAjNUNu-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android12-kiwi-5.10
head:   9b45a047ff0f19af584920a93cd8020b8538a5c3
commit: 72863addaa15829a3fb85b34053b2620db0dbb10 [284/284] FROMGIT: userfaultfd/selftests: exercise minor fault handling shmem support
:::::: branch date: 2 days ago
:::::: commit date: 5 years ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260927/202609271344.2fAjNUNu-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271344.2fAjNUNu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609271344.2fAjNUNu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   userfaultfd.c:445:39: error: unknown type name 'uint64_t'
     445 | static inline void uffd_test_ctx_init(uint64_t features)
         |                                       ^~~~~~~~
   userfaultfd.c:445:39: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: In function 'wp_range':
   userfaultfd.c:470:51: error: expected ')' before 'PRIx64'
     470 |                 err("clear WP failed: address=0x%"PRIx64, (uint64_t)start);
         |                                                   ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:470:17: note: in expansion of macro 'err'
     470 |                 err("clear WP failed: address=0x%"PRIx64, (uint64_t)start);
         |                 ^~~
   userfaultfd.c:60:1: note: 'PRIx64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
      59 | #include "../kselftest.h"
     +++ |+#include <inttypes.h>
      60 | 
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:470:17: note: in expansion of macro 'err'
     470 |                 err("clear WP failed: address=0x%"PRIx64, (uint64_t)start);
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:470:17: note: in expansion of macro 'err'
     470 |                 err("clear WP failed: address=0x%"PRIx64, (uint64_t)start);
         |                 ^~~
   userfaultfd.c: In function 'continue_range':
   userfaultfd.c:483:62: error: expected ')' before 'PRIx64'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                                                              ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:483:17: note: in expansion of macro 'err'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:483:62: note: 'PRIx64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                                                              ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:483:17: note: in expansion of macro 'err'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:483:17: note: in expansion of macro 'err'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:483:17: note: in expansion of macro 'err'
     483 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:494:91: error: expected ')' before 'PRId64'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                                                                                           ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c:494:91: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                                                                                           ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
>> userfaultfd.c:146:33: warning: format '%d' expects a matching 'int' argument [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:494:17: note: in expansion of macro 'err'
     494 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c: In function 'retry_copy_page':
   userfaultfd.c:558:57: error: expected ')' before 'PRId64'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                                                         ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:558:25: note: in expansion of macro 'err'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:558:57: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                                                         ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:558:25: note: in expansion of macro 'err'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:558:25: note: in expansion of macro 'err'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:558:25: note: in expansion of macro 'err'
     558 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:561:54: error: expected ')' before 'PRId64'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                                                      ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:561:17: note: in expansion of macro 'err'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:561:54: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                                                      ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:561:17: note: in expansion of macro 'err'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:561:17: note: in expansion of macro 'err'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:561:17: note: in expansion of macro 'err'
     561 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c: In function '__copy_page':
   userfaultfd.c:583:51: error: expected ')' before 'PRId64'
     583 |                         err("UFFDIO_COPY error: %"PRId64,
         |                                                   ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:583:25: note: in expansion of macro 'err'
     583 |                         err("UFFDIO_COPY error: %"PRId64,
         |                         ^~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
