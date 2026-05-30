Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25099313E38
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 06:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780122050; cv=none; b=HC8E+KlItRhNtSEgtxlGcEgYJ5TdPuNj8qFH+h+AvjSqfjsCTqQyb6aKEk6ytcZIWu/0GpMgDdt8rk3T507rqpBVa4ZwikQHYetVzQPXjBfHq9Ls+snuaAXC9O65Paaa4miO45Tnn5OF3QIA8y58G4L9wdIFXjLP5uhdOikkDRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780122050; c=relaxed/simple;
	bh=ImbWAs9sAeRNok32PHxXT2Es40Q5OvNx+qOn6eE0sKE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qLeAoHW+CZOyoFzk7MUO4jG3BcsyUQhspXd4riJlrNoXmkbQZAj3t+lGHEpx3XTbneuwPccN7mvquKv+8ZWOIxLf5/uCBudzkDBtOObP5/s3CNC1YuRDWBHqrn74bRjgKmU46gITIbwP14ihJjEcxAQmegCWjJkROBxUC5st9cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zr5lEC+U; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zr5lEC+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780122047; x=1811658047;
  h=date:from:to:cc:subject:message-id;
  bh=ImbWAs9sAeRNok32PHxXT2Es40Q5OvNx+qOn6eE0sKE=;
  b=Zr5lEC+UcpNm7ihdJ/FVAR6FA9cgbLAQbv7wY0/TZC2TaLcM+sH7vFue
   w9hBbfWuv99rL2u5rIX3LREl9KrOtmtxQ6Pl+W1vUPzsvVUYrl9C/WSZ1
   U9ivf10wcHpLlI7G1dEOBHMZ1qOXkyPEwouFs0dTcm4uhongp2w88S04i
   w2MguZ/g3NgZajhAg5j+MRu/HDZiab1xLRMWsOp2EGO6OXw65uHPu6zOc
   Wvwk6CnoPNYCyJ75InWfPtZyZqnQioGZsMPtvJFxrnmBbF8V7gUx72RTD
   OgiV6gL9jQdogP8wfKbiM4o11+ilKFKfGoTRuw8FxqNrm/uc4JteFxcsj
   g==;
X-CSE-ConnectionGUID: YJCFRJlpTRK63axO27y8Sg==
X-CSE-MsgGUID: 4NYXO5gLQbKyUS3X17O/kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="106416128"
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="106416128"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2026 23:20:46 -0700
X-CSE-ConnectionGUID: uEjkR+2xSySBHmLDzFEJJA==
X-CSE-MsgGUID: fwBxo9YWSTyM52QVLJ6FwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,176,1774335600"; 
   d="scan'208";a="238657937"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 29 May 2026 23:20:45 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTD3r-0000000014L-2yNz;
	Sat, 30 May 2026 06:20:43 +0000
Date: Sat, 30 May 2026 08:20:34 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 userfaultfd.c:374:13: warning: 'uffd_test_ctx_clear' defined but not used
Message-ID: <202605300843.N5X6PZiz-lkp@intel.com>
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
commit: c2c081d009b3f82013b4c3fdcd6104340fef2201 [1/1] BACKPORT: FROMGIT: userfaultfd/selftests: reinitialize test context in each test
:::::: branch date: 16 hours ago
:::::: commit date: 5 years ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260530/202605300843.N5X6PZiz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605300843.N5X6PZiz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605300843.N5X6PZiz-lkp@intel.com/

All warnings (new ones prefixed by >>):

         |                 ^~~~
   userfaultfd.c:976:25: note: in expansion of macro 'err'
     976 |                         err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                         ^~~
   userfaultfd.c:979:47: error: expected ')' before 'PRId64'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                                               ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:979:17: note: in expansion of macro 'err'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c:979:47: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                                               ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:979:17: note: in expansion of macro 'err'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:979:17: note: in expansion of macro 'err'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:979:17: note: in expansion of macro 'err'
     979 |                 err("UFFDIO_ZEROPAGE error: %"PRId64,
         |                 ^~~
   userfaultfd.c: In function '__uffdio_zeropage':
   userfaultfd.c:1003:55: error: expected ')' before 'PRId64'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                                                       ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:1003:25: note: in expansion of macro 'err'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c:1003:55: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                                                       ^~~~~~
   userfaultfd.c:146:43: note: in definition of macro '_err'
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:1003:25: note: in expansion of macro 'err'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c:146:24: note: to match this '('
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:1003:25: note: in expansion of macro 'err'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c:146:33: warning: spurious trailing '%' in format [-Wformat=]
     146 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:153:17: note: in expansion of macro '_err'
     153 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:1003:25: note: in expansion of macro 'err'
    1003 |                         err("UFFDIO_ZEROPAGE error: %"PRId64, (int64_t)res);
         |                         ^~~
   userfaultfd.c: In function 'userfaultfd_zeropage_test':
   userfaultfd.c:1037:9: error: implicit declaration of function 'uffd_test_ctx_init'; did you mean 'uffd_test_ctx_clear'? [-Wimplicit-function-declaration]
    1037 |         uffd_test_ctx_init(0);
         |         ^~~~~~~~~~~~~~~~~~
         |         uffd_test_ctx_clear
   userfaultfd.c: In function 'userfaultfd_minor_test':
   userfaultfd.c:1180:9: error: unknown type name 'uint8_t'
    1180 |         uint8_t expected_byte;
         |         ^~~~~~~
   userfaultfd.c:1180:9: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1184:9: error: unknown type name 'uint64_t'
    1184 |         uint64_t features = UFFD_FEATURE_MINOR_HUGETLBFS;
         |         ^~~~~~~~
   userfaultfd.c:1184:9: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1192:9: error: implicit declaration of function 'uffd_test_ctx_init_ext'; did you mean 'uffd_test_ctx_clear'? [-Wimplicit-function-declaration]
    1192 |         uffd_test_ctx_init_ext(&features);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         uffd_test_ctx_clear
   userfaultfd.c:1216:58: error: 'uint8_t' undeclared (first use in this function)
    1216 |                 memset(area_dst + (p * page_size), p % ((uint8_t)-1),
         |                                                          ^~~~~~~
   userfaultfd.c:1216:58: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: At top level:
>> userfaultfd.c:374:13: warning: 'uffd_test_ctx_clear' defined but not used [-Wunused-function]
     374 | static void uffd_test_ctx_clear(void)
         |             ^~~~~~~~~~~~~~~~~~~

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
