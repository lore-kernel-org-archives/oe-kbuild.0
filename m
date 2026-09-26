Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BDC7360EFC
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Sep 2026 21:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790459094; cv=none; b=gIC69FAdgoWSUpqWr4nwa1R6rTj/aSZ6S/Sz2urLaNGqR3csICV+5iO1kYYHOM0dO5Xv6kgaYHtIHqjI1us61C1RmS0Zh8g9gmLIWVdcoLP6z5dMbzn7MV+NXybhadWjN4IUss3rPwPnftGmJBO1SDbIppUIRU+hJ7mucCXHE/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790459094; c=relaxed/simple;
	bh=Gk1730N8dzULaxEJlpMfikr6WAEwxCEKME3bJDKreWQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eBrODyUrRmY7Sr4iCyuD19cEs8vlaVZXLiA8EXIVRS4O9c7aIVXgBaoVQE/V24RsmOz4+/m/NPuinabNGahlJjP7Sj7hPblUCHKyGt8bwlUP/oiZIPBaWKsCkkBPLOBZgZTU0NhfzyzV7ya/zfeVQSq6eo5ZdQuCUGBb5cvTSRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fS9dX1Dv; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fS9dX1Dv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790459091; x=1821995091;
  h=date:from:to:cc:subject:message-id;
  bh=Gk1730N8dzULaxEJlpMfikr6WAEwxCEKME3bJDKreWQ=;
  b=fS9dX1Dv68XOz6qHvnPzIP/B4f82PV0IuxtRNTKFjCzp+lkRu4x/JZGB
   /2SrXVl1mW1GCIE0SSUmSoXwdNXQQIeKj6gpnVXzVc8v6t93FKmEXL+d8
   40I2xFYIGolb8Y/vWubZcE9AIhm7v4lDFkM9ldmiugWd+1/K+SnOa2Tqr
   ytGET/+hi5eChr/O5MOemWIWuY6uFx+OH2tX7YlsvTvavQgj+7x2fEsY0
   O9L9HCpR9egfPLzIB3W6C8Huh5tjKKZKV+4duzZ8iWj4kzjKgeeBslo2n
   NBwCDWET0KZ7i88qkXK/ZDhi1wvktRD4eKwlbaoRhpJwSGQrotKb6JogH
   Q==;
X-CSE-ConnectionGUID: O1o01+GHRHCn5UUv2PVzVw==
X-CSE-MsgGUID: 865RzAQ2Q5GRdwk8m7/XGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="107588378"
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="107588378"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2026 14:44:50 -0700
X-CSE-ConnectionGUID: BCZhf/P/TImsJltNZFlnTg==
X-CSE-MsgGUID: AxQWPUCzTwSyZPBaB5AetQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,125,1787036400"; 
   d="scan'208";a="273280149"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 26 Sep 2026 14:44:47 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAaCL-000000000Ct-069w;
	Sat, 26 Sep 2026 21:44:45 +0000
Date: Sat, 26 Sep 2026 23:44:40 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-kiwi-5.10 284/284]
 userfaultfd.c:373:63: warning: spurious trailing '%' in format
Message-ID: <202609262311.MnubqUQq-lkp@intel.com>
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
commit: 357700fcc3b51b66e2a790c5bb036d97916086af [284/284] FROMGIT: userfaultfd/selftests: add test exercising minor fault handling
:::::: branch date: 35 hours ago
:::::: commit date: 5 years ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260926/202609262311.MnubqUQq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609262311.MnubqUQq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609262311.MnubqUQq-lkp@intel.com/

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
