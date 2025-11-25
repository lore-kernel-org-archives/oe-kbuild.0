Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9A91DF985
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 15:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764085127; cv=none; b=siG0JMNZCd756/0Favac1h6GO0sAndpPska3RkxSaTzrUuMgcFy/G4rwzwFpHPskcH66rXvYg7/jDa2PseQXdyCJ85ggP/RtS/vp1p6v0FAJfy6XlC0o3h9QbI+cC7grEYnx/dAHGf10LMLAAeAXBPeqgd1Z+yNl5hdKjFGSNJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764085127; c=relaxed/simple;
	bh=CQiLcxn7ZHPhRgAtoraKoEZ0mCxA4gP/5lSK119+bhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qiB7XtkZoSCEgS6G/PuAU+NQ1MIu7NGTiYqSXlMDppFpBlrQWntTSWon3AtGylPBfZaXuRu6NMlJ7/DaJv4fyH45d3IkLDPMqRXb1yNR4tKLTFJqvxJm1B457Kk4LGivYbJ+aTFY1dzbgTHncgMgtlc5Ut1ptFMbIOiGYBv0CnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Iq49bJvJ; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Iq49bJvJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764085125; x=1795621125;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CQiLcxn7ZHPhRgAtoraKoEZ0mCxA4gP/5lSK119+bhs=;
  b=Iq49bJvJFlO0A6PHg2ZA53JMmiF+HKLRyx28Hro6SNar5g3Mq6DbMLmK
   d0hTNYr3QnEyOJgDj9FGb8JccIBVnPKFdvu3UniKXs2/KcSXDjsyMT1nC
   BloqN/8bKPygJusQeL18Zbl7VJuQXOLz4/H4nq7/BFhysKEodAEUY9SHW
   wXibTGXFkXV4z4904G2OMpiljZJoc6MDKZqr/cWtFYUdZ6J2O5sZTX2IP
   vftlRZMhdN2h0De+SCKvX15BFGdquuh6E+zaLdh2pNzOgCgU6sPLx4cxG
   tJ1E7LeAbLe/Og3E5w7h2I7E7n9v3y6oY7xrOb5VQzW6kcei8x1GLk9GQ
   w==;
X-CSE-ConnectionGUID: WKwp07XKTY6ZbbFWjAF6aA==
X-CSE-MsgGUID: +73ZVUewRvqxbI0Gx/QYcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="69964226"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="69964226"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 07:38:44 -0800
X-CSE-ConnectionGUID: dsfizpTdTN2f7Og6lp4kGg==
X-CSE-MsgGUID: L9LQmiXVR3a3xNOiqrgdDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="229939141"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Nov 2025 07:38:43 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNv7p-000000000Wz-1QKy;
	Tue, 25 Nov 2025 15:38:41 +0000
Date: Tue, 25 Nov 2025 16:38:02 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-5.4 5/5] userfaultfd.c:142:33: warning:
 format '%d' expects a matching 'int' argument
Message-ID: <202511251633.Pd4mLjfD-lkp@intel.com>
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
commit: 101b9932058607b1a28ca6ea205d7cd05f46fcab [5/5] FROMGIT: userfaultfd/selftests: exercise minor fault handling shmem support
:::::: branch date: 30 hours ago
:::::: commit date: 4 years, 6 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251125/202511251633.Pd4mLjfD-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251633.Pd4mLjfD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511251633.Pd4mLjfD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   userfaultfd.c:326:30: error: unknown type name 'uint64_t'
     326 | static void userfaultfd_open(uint64_t *features)
         |                              ^~~~~~~~
   userfaultfd.c:59:1: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
      58 | #include "../kselftest.h"
     +++ |+#include <stdint.h>
      59 | 
   userfaultfd.c:386:36: error: unknown type name 'uint64_t'
     386 | static void uffd_test_ctx_init_ext(uint64_t *features)
         |                                    ^~~~~~~~
   userfaultfd.c:386:36: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c:426:39: error: unknown type name 'uint64_t'
     426 | static inline void uffd_test_ctx_init(uint64_t features)
         |                                       ^~~~~~~~
   userfaultfd.c:426:39: note: 'uint64_t' is defined in header '<stdint.h>'; this is probably fixable by adding '#include <stdint.h>'
   userfaultfd.c: In function 'continue_range':
   userfaultfd.c:450:62: error: expected ')' before 'PRIx64'
     450 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                                                              ^~~~~~
   userfaultfd.c:142:43: note: in definition of macro '_err'
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:450:17: note: in expansion of macro 'err'
     450 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:59:1: note: 'PRIx64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
      58 | #include "../kselftest.h"
     +++ |+#include <inttypes.h>
      59 | 
   userfaultfd.c:142:24: note: to match this '('
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:149:17: note: in expansion of macro '_err'
     149 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:450:17: note: in expansion of macro 'err'
     450 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:142:33: warning: spurious trailing '%' in format [-Wformat=]
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:149:17: note: in expansion of macro '_err'
     149 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:450:17: note: in expansion of macro 'err'
     450 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:461:91: error: expected ')' before 'PRId64'
     461 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                                                                                           ^~~~~~
   userfaultfd.c:142:43: note: in definition of macro '_err'
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:461:17: note: in expansion of macro 'err'
     461 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c:461:91: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     461 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                                                                                           ^~~~~~
   userfaultfd.c:142:43: note: in definition of macro '_err'
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:461:17: note: in expansion of macro 'err'
     461 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c:142:24: note: to match this '('
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:149:17: note: in expansion of macro '_err'
     149 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:461:17: note: in expansion of macro 'err'
     461 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
>> userfaultfd.c:142:33: warning: format '%d' expects a matching 'int' argument [-Wformat=]
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:149:17: note: in expansion of macro '_err'
     149 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:461:17: note: in expansion of macro 'err'
     461 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c:142:33: warning: spurious trailing '%' in format [-Wformat=]
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:149:17: note: in expansion of macro '_err'
     149 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:461:17: note: in expansion of macro 'err'
     461 |                 err("failed to exercise UFFDIO_CONTINUE error handling, ret=%d, mapped=%" PRId64,
         |                 ^~~
   userfaultfd.c: In function 'retry_copy_page':
   userfaultfd.c:525:57: error: expected ')' before 'PRId64'
     525 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                                                         ^~~~~~
   userfaultfd.c:142:43: note: in definition of macro '_err'
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:525:25: note: in expansion of macro 'err'
     525 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:525:57: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     525 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                                                         ^~~~~~
   userfaultfd.c:142:43: note: in definition of macro '_err'
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:525:25: note: in expansion of macro 'err'
     525 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:142:24: note: to match this '('
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:149:17: note: in expansion of macro '_err'
     149 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:525:25: note: in expansion of macro 'err'
     525 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:142:33: warning: spurious trailing '%' in format [-Wformat=]
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:149:17: note: in expansion of macro '_err'
     149 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:525:25: note: in expansion of macro 'err'
     525 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:528:54: error: expected ')' before 'PRId64'
     528 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                                                      ^~~~~~
   userfaultfd.c:142:43: note: in definition of macro '_err'
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:528:17: note: in expansion of macro 'err'
     528 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:528:54: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     528 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                                                      ^~~~~~
   userfaultfd.c:142:43: note: in definition of macro '_err'
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:528:17: note: in expansion of macro 'err'
     528 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:142:24: note: to match this '('
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:149:17: note: in expansion of macro '_err'
     149 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:528:17: note: in expansion of macro 'err'
     528 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:142:33: warning: spurious trailing '%' in format [-Wformat=]
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:149:17: note: in expansion of macro '_err'
     149 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:528:17: note: in expansion of macro 'err'
     528 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c: In function '__copy_page':
   userfaultfd.c:547:51: error: expected ')' before 'PRId64'
     547 |                         err("UFFDIO_COPY error: %"PRId64,
         |                                                   ^~~~~~
   userfaultfd.c:142:43: note: in definition of macro '_err'
     142 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:547:25: note: in expansion of macro 'err'
     547 |                         err("UFFDIO_COPY error: %"PRId64,
         |                         ^~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
