Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC76A175A7F
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Sep 2026 08:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790496854; cv=none; b=eKRwBdqUAWgpPtZx9f+brSKVnUCKDn0xOVr2ERigcIyYUN/hBFj9y8Xf1jhOvuRY/Y1TBwfCZQS61HrHj2JSP37UQzCBnaf/cOfLwwRGuRNdFqA57QV5n6X6gJvFngipLpiSCUoTydyYCSkBMolJBbzjBYCPpYNI8PmYPLfd8VU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790496854; c=relaxed/simple;
	bh=2NjsjCAncKrFf2sChJvwKz5iQ/dkd1sxgsYO0YsaBrI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=APJnshhJVvBPzsi/fxaOaYMUEjV53Hvfuf/Cfm/+XdCN/xfIzpHWCVBME5Fayl/cId5xXBef1XzB4cMEvaBnWpxVpswH+5lmpCNMXd9CTL2fcsiwwloB88HxlNosvKFfp/EHhEQN19LjnMl9f9tqwkBgPCqVDjohsWGJ5SaCRys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bBcQolWm; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bBcQolWm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790496852; x=1822032852;
  h=date:from:to:cc:subject:message-id;
  bh=2NjsjCAncKrFf2sChJvwKz5iQ/dkd1sxgsYO0YsaBrI=;
  b=bBcQolWmUfCetUfOAdQ33Mo5W36b92evyftyg8bCRlCNqeauKToSlK/O
   BbIrBKrYgujsIARnAJO0U+QjsMq3pCqjxs1d+/8a+MbfbBia5cb8RoeQ+
   Y4Ix+7/puumAPDXWhAekyc9loU1D8K/KWdt9bc6d1StY0s7dL9i6Rnxhf
   0VqiQea1ChxYdBWXWghqwO+QXz3+EduoCoMlqvHXPA4hIjWAAAkX8XJTa
   y2QlvNCSqLbXCJCesyikh4Tg8+WKvKh/YkG4PEiDZ9TP6FILGKS9v/lc0
   xFZH951ys4kYhmQz8rGipDmu69AJpl5bDCd0kcveE4GFQ1kSZP9fu6XHW
   Q==;
X-CSE-ConnectionGUID: q7tx+c8JT86qwIwTFB54+A==
X-CSE-MsgGUID: eW9TXYqeTCqteMmNLss4Fw==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="107602639"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="107602639"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 01:14:11 -0700
X-CSE-ConnectionGUID: sa1zP50AQju/30slBBReiw==
X-CSE-MsgGUID: Rfdb0fxZTWuoo57ZJejuuQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="279489692"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 27 Sep 2026 01:14:09 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAk1O-000000000VL-1hkR;
	Sun, 27 Sep 2026 08:14:06 +0000
Date: Sun, 27 Sep 2026 10:13:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-kiwi-5.10 284/284]
 userfaultfd.c:374:13: warning: 'uffd_test_ctx_clear' defined but not used
Message-ID: <202609271024.F2KgGL4a-lkp@intel.com>
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
commit: c2c081d009b3f82013b4c3fdcd6104340fef2201 [284/284] BACKPORT: FROMGIT: userfaultfd/selftests: reinitialize test context in each test
:::::: branch date: 2 days ago
:::::: commit date: 5 years ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260927/202609271024.F2KgGL4a-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271024.F2KgGL4a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609271024.F2KgGL4a-lkp@intel.com/

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
