Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4F6639B947
	for <oe-kbuild@lists.linux.dev>; Sat, 30 May 2026 09:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780133090; cv=none; b=WURubmzC957MUiFehjjqpE3tLYUxr3yejW7u1JNLxhK56BgnKxDUtZGfEc07w8LBA6RE7Xgs6UHEYLA3w6XOmteAMvdMoVTUubQKgZAF97Z9hWgti0iLsrnccuanFDaVlKA9A0GHnnagbGvzJMohaNLDyDDTu/k+nL5Bws+pUbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780133090; c=relaxed/simple;
	bh=jj+TgNmD43lwUCEPa56eKyldnsBs9lh83EZsoXpJKUY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tx56ahz3AWpEagXVNFpk22JH22/qW8yTBs/P1lAkDKRKUNe0QVKvhjJgC5JGvaBQFsW+Nzf32ytxTiiTMGclw4gz8yVAyTlYpqNsco5WApWyDLM7thdGbnH1u80kRZp1li0GGINrk8oORMQI5tDrlhov9nitVhdidImDcXXJTqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V7lETFPh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V7lETFPh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780133089; x=1811669089;
  h=date:from:to:cc:subject:message-id;
  bh=jj+TgNmD43lwUCEPa56eKyldnsBs9lh83EZsoXpJKUY=;
  b=V7lETFPhHubnyjdvZxwOxwm0u4z8vBlyj3uxwTvXPv+5ItA0ppgf977A
   TMBFpx53FFsgnUjHIgTwmILpz+qEFaTN6jGbPqZJn0aMhCf9IJuqLfEPA
   S2LXEUNwUvWHlNfjzOscEpPgb4kfUAUKMKc1ZmS1661qqT1/pG48ETTYV
   3xWvZVow5vwwXa7adfKtovFvfQCGi/8ccaxZwLLA5lxolsl5HLIchLzp9
   Gv96M4J6riugQYkTF1rK0Aa8XCAzD4+qPN6FRPa9/ee23nnk5x0emQZel
   AbHNj4qj0bQinqDyuBlDjcjxBe0aOiwzcz2VUzm5pM3Mz7OZ7FVmi8OH8
   A==;
X-CSE-ConnectionGUID: OXJmxOhwT9S7k84yZssVQA==
X-CSE-MsgGUID: 0ZyJHzMzRxKC0nsn3H1G5Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11801"; a="68505409"
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="68505409"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2026 02:24:48 -0700
X-CSE-ConnectionGUID: KlVNPX+HRkOJgvLcs4Gcmg==
X-CSE-MsgGUID: yApslgIkS+eT0Ig5w002Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,177,1774335600"; 
   d="scan'208";a="238682016"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 30 May 2026 02:24:47 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTFvx-0000000016H-19gi;
	Sat, 30 May 2026 09:24:45 +0000
Date: Sat, 30 May 2026 11:23:48 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:mirror-chromeos-5.10-arcvm 1/1]
 userfaultfd.c:146:33: warning: format '%d' expects a matching 'int' argument
Message-ID: <202605301122.uOJHx6ug-lkp@intel.com>
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
commit: 72863addaa15829a3fb85b34053b2620db0dbb10 [1/1] FROMGIT: userfaultfd/selftests: exercise minor fault handling shmem support
:::::: branch date: 19 hours ago
:::::: commit date: 5 years ago
config: x86_64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260530/202605301122.uOJHx6ug-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260530/202605301122.uOJHx6ug-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605301122.uOJHx6ug-lkp@intel.com/

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
