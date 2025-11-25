Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED54D2D838A
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 07:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764055062; cv=none; b=MWbs0xi6Qc7q0SJn4nw7zIx+YicC5O/F2ixI/T7Y7oWdzliUXOsrA23s8OuZOVijfLQmnHxOdHKw3cG/kbG1LoLJGzgQoeYajz8L1jB8GGwferHl7JSxMrhRnp5dXx0kKg6HffNl/dIgKNY4Kwu8q7To2lgG8c2v41RayyxxH/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764055062; c=relaxed/simple;
	bh=KnGvV1pvVdM/2Fnc9FxED/abrPUkNHWcw5TSSfNCcK4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f8cRp3VA6teD64h5FTQOFMFQXloKMTtPFSYQnOAm2+f/uk854iDcL6xotZWLMG+jcoG28fhfDzXazMzlFAnWuNBODFE61ZrAdgH/Lou3fhoMPa4DQRgwNLPTDs8PzWVxVb44r2NfWNnqhP8iMgOsNxkuOt2WAVL6l1hfPPllDnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DqPTTCLw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DqPTTCLw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764055061; x=1795591061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KnGvV1pvVdM/2Fnc9FxED/abrPUkNHWcw5TSSfNCcK4=;
  b=DqPTTCLwgvMQ36OtFxGhObuNsne/FLagScTD07EOK4fsjMMe2nIlGG+O
   l8xJcUZIVHRV+ONgMut3siP9UU52/AqrX4vSuGupzPnxl+MLIHL1Toqk6
   teyHKhwHEgJzm9OwsMefrOFfBcwXGQMjQaFM7vv2iS1XSqaOrYsg2wEz1
   g7lYx0nSvy8w4U5ETl1TpqEQJScHd0ojmAT+MM9+iSfcTXxX7gEh5OSGq
   +29ofaHaDzmW1gBS3i74qkkDsLj3Hcz1YYqhwXV/1Lcyhabrq50sMLKuH
   Sl4KFCIr1PilAAecl7NpNl3THg7+QvEhP3SsEKxL9HWKZcBrdFGFIVK5u
   Q==;
X-CSE-ConnectionGUID: pEAn/l6PTJS9T9DR8NuAmA==
X-CSE-MsgGUID: rfzdrI5YTM+vVZJZSU5hhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="66020550"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="66020550"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 23:17:41 -0800
X-CSE-ConnectionGUID: lKA/qAu5QbSHzsxni+Tfng==
X-CSE-MsgGUID: 20XfALgNTqaEBJfdUKsGwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192800784"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 24 Nov 2025 23:17:40 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNnIv-000000000S5-0meQ;
	Tue, 25 Nov 2025 07:17:37 +0000
Date: Tue, 25 Nov 2025 08:17:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-5.4 5/5] userfaultfd.c:1076:38: error:
 implicit declaration of function 'uffd_test_ctx_init'; did you mean
 'uffd_test_ctx_clear'?
Message-ID: <202511250844.nfS9qUea-lkp@intel.com>
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
commit: 2ed6377e515707a52d123b735d861a7b8305eceb [5/5] BACKPORT: FROMGIT: userfaultfd/selftests: reinitialize test context in each test
:::::: branch date: 21 hours ago
:::::: commit date: 4 years, 8 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251125/202511250844.nfS9qUea-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250844.nfS9qUea-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511250844.nfS9qUea-lkp@intel.com/

All errors (new ones prefixed by >>):

   userfaultfd.c:310:29: error: unknown type name 'uint64_t'
     310 | static int userfaultfd_open(uint64_t *features)
         |                             ^~~~~~~~
   userfaultfd.c:59:1: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
      58 | #include "../kselftest.h"
     +++ |+#include <stdint.h>
      59 | 
   userfaultfd.c:339:35: error: unknown type name 'uint64_t'
     339 | static int uffd_test_ctx_init_ext(uint64_t *features)
         |                                   ^~~~~~~~
   userfaultfd.c:339:35: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:394:38: error: unknown type name 'uint64_t'
     394 | static inline int uffd_test_ctx_init(uint64_t features)
         |                                      ^~~~~~~~
   userfaultfd.c:394:38: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: In function 'continue_range':
   userfaultfd.c:469:65: error: expected ')' before 'PRIx64'
     469 |                         "UFFDIO_CONTINUE failed for address 0x%" PRIx64 "\n",
         |                                                                 ^~~~~~~
         |                                                                 )
   userfaultfd.c:59:1: note: 'PRIx64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
      58 | #include "../kselftest.h"
     +++ |+#include <inttypes.h>
      59 | 
   userfaultfd.c:468:24: note: to match this '('
     468 |                 fprintf(stderr,
         |                        ^
   userfaultfd.c:469:63: warning: spurious trailing '%' in format [-Wformat=]
     469 |                         "UFFDIO_CONTINUE failed for address 0x%" PRIx64 "\n",
         |                                                               ^
   userfaultfd.c: In function 'uffd_handle_page_fault':
   userfaultfd.c:671:17: error: unknown type name 'uint8_t'
     671 |                 uint8_t *area;
         |                 ^~~~~~~
   userfaultfd.c:671:17: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:686:25: error: 'uint8_t' undeclared (first use in this function)
     686 |                 area = (uint8_t *)(area_dst +
         |                         ^~~~~~~
   userfaultfd.c:686:25: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:686:25: note: each undeclared identifier is reported only once for each function it appears in
   userfaultfd.c:686:34: error: expected expression before ')' token
     686 |                 area = (uint8_t *)(area_dst +
         |                                  ^
   userfaultfd.c: In function 'userfaultfd_zeropage_test':
>> userfaultfd.c:1076:38: error: implicit declaration of function 'uffd_test_ctx_init'; did you mean 'uffd_test_ctx_clear'? [-Wimplicit-function-declaration]
    1076 |         if (uffd_test_ctx_clear() || uffd_test_ctx_init(0))
         |                                      ^~~~~~~~~~~~~~~~~~
         |                                      uffd_test_ctx_clear
   userfaultfd.c: In function 'userfaultfd_minor_test':
   userfaultfd.c:1229:9: error: unknown type name 'uint8_t'
    1229 |         uint8_t expected_byte;
         |         ^~~~~~~
   userfaultfd.c:1229:9: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:1232:9: error: unknown type name 'uint64_t'
    1232 |         uint64_t features = UFFD_FEATURE_MINOR_HUGETLBFS;
         |         ^~~~~~~~
   userfaultfd.c:1232:9: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
>> userfaultfd.c:1240:38: error: implicit declaration of function 'uffd_test_ctx_init_ext'; did you mean 'uffd_test_ctx_clear'? [-Wimplicit-function-declaration]
    1240 |         if (uffd_test_ctx_clear() || uffd_test_ctx_init_ext(&features))
         |                                      ^~~~~~~~~~~~~~~~~~~~~~
         |                                      uffd_test_ctx_clear
   userfaultfd.c:1269:58: error: 'uint8_t' undeclared (first use in this function)
    1269 |                 memset(area_dst + (p * page_size), p % ((uint8_t)-1),
         |                                                          ^~~~~~~
   userfaultfd.c:1269:58: note: 'uint8_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: In function 'userfaultfd_stress':
   userfaultfd.c:1452:22: error: 'cpu' undeclared (first use in this function)
    1452 |                 for (cpu = 0; cpu < nr_cpus; cpu++)
         |                      ^~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
