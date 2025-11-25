Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F0D30BBB7
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 10:30:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764066645; cv=none; b=KpTSNOUNwjVEkaIQcENE9eSkK4jlfVi+BN+koEqg9nRTdQcgqBcel7TXgWVZR7wC0dVn0G7sFmuDxecCRdnwGBtdZhpPdOP5O/biSyuFgBARhPjT5B6NEPWBw8A9kBfRU1p8DbStZvtq30N4MdbH5hGhBPpekPRZKvqBIjcramU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764066645; c=relaxed/simple;
	bh=7XfLwujMOYrnuWxXCFwN8awg2Pyxb+h26Zj5Zo188Sw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QYPQoyAzCyHycCxjwFEP1NSAglBU4b7syx9H1B+47J6D/5k7me2AaTvjeNWsSdtBpJCuuhuzuz0isdYWmC4BdgsUkcCCOXBRcyjj0oCjSwpSvsSchwK6VQxdMCsKki20HlKf0BmcR5LkmxCRPd2xgXY1Uzg1GL0bCi74/9fa0Zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DidY/6qH; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DidY/6qH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764066643; x=1795602643;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7XfLwujMOYrnuWxXCFwN8awg2Pyxb+h26Zj5Zo188Sw=;
  b=DidY/6qHIhn3lFQflxLdBeYggpQw9vpX6OV2Ed0XpmQNb2vnk+UnqmhG
   YaYoIvFIHrfp1F80QRo8/H/5bWmkErXkJUCpN9BjNWA4i2XPtI1cshtrm
   8dTPl7EHGMd5KHt2dn+hJQccqVLihpL9aOfLEBiRB3hXU+5VWghgTaJzL
   obKAJchdlclQT4WFLoyJi+THGkaIjpM6xZp4uyMZlxvuiZ1kjUM2onzE8
   XD7pTRjPMUB0xK5/KeaW12FsGcO5gp5d4t+5+7/7JsbYXyTaE6l5O8/Fg
   G7uZGvFH/wjUY/sseprki1qwPM6/S90pLxoXV4YhpZItu6bdOmHSuQKSh
   g==;
X-CSE-ConnectionGUID: KFj7aIn3ROiTD6vk/HHRuQ==
X-CSE-MsgGUID: u9sTBxytTbeD9Pd+vw908A==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="83472548"
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="83472548"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 02:30:43 -0800
X-CSE-ConnectionGUID: BxWiX2toSLKnl6q0gOHmnQ==
X-CSE-MsgGUID: VGg5DQPZTyWSdGLpvkbqGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,225,1758610800"; 
   d="scan'208";a="223279026"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 25 Nov 2025 02:30:42 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNqJi-000000000U5-3IaX;
	Tue, 25 Nov 2025 10:30:38 +0000
Date: Tue, 25 Nov 2025 11:30:38 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android12-5.4 5/5] userfaultfd.c:387:57: error:
 expected ')' before 'PRId64'
Message-ID: <202511251113.VCGL6onp-lkp@intel.com>
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
commit: 42e354c78fb00fb12774ed0b676eb80bf86425fd [5/5] BACKPORT: FROMGIT: userfaultfd/selftests: unify error handling
:::::: branch date: 25 hours ago
:::::: commit date: 4 years, 6 months ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251125/202511251113.VCGL6onp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511251113.VCGL6onp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511251113.VCGL6onp-lkp@intel.com/

All errors (new ones prefixed by >>):

   userfaultfd.c: In function 'continue_range':
   userfaultfd.c:323:62: error: expected ')' before 'PRIx64'
     323 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                                                              ^~~~~~
   userfaultfd.c:140:43: note: in definition of macro '_err'
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:323:17: note: in expansion of macro 'err'
     323 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:59:1: note: 'PRIx64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
      58 | #include "../kselftest.h"
     +++ |+#include <inttypes.h>
      59 | 
   userfaultfd.c:140:24: note: to match this '('
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:147:17: note: in expansion of macro '_err'
     147 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:323:17: note: in expansion of macro 'err'
     323 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c:140:33: warning: spurious trailing '%' in format [-Wformat=]
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:147:17: note: in expansion of macro '_err'
     147 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:323:17: note: in expansion of macro 'err'
     323 |                 err("UFFDIO_CONTINUE failed for address 0x%" PRIx64,
         |                 ^~~
   userfaultfd.c: In function 'retry_copy_page':
>> userfaultfd.c:387:57: error: expected ')' before 'PRId64'
     387 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                                                         ^~~~~~
   userfaultfd.c:140:43: note: in definition of macro '_err'
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:387:25: note: in expansion of macro 'err'
     387 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:387:57: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     387 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                                                         ^~~~~~
   userfaultfd.c:140:43: note: in definition of macro '_err'
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:387:25: note: in expansion of macro 'err'
     387 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:140:24: note: to match this '('
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:147:17: note: in expansion of macro '_err'
     147 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:387:25: note: in expansion of macro 'err'
     387 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:140:33: warning: spurious trailing '%' in format [-Wformat=]
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:147:17: note: in expansion of macro '_err'
     147 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:387:25: note: in expansion of macro 'err'
     387 |                         err("UFFDIO_COPY retry error: %"PRId64,
         |                         ^~~
   userfaultfd.c:390:54: error: expected ')' before 'PRId64'
     390 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                                                      ^~~~~~
   userfaultfd.c:140:43: note: in definition of macro '_err'
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:390:17: note: in expansion of macro 'err'
     390 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:390:54: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     390 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                                                      ^~~~~~
   userfaultfd.c:140:43: note: in definition of macro '_err'
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:390:17: note: in expansion of macro 'err'
     390 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:140:24: note: to match this '('
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:147:17: note: in expansion of macro '_err'
     147 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:390:17: note: in expansion of macro 'err'
     390 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c:140:33: warning: spurious trailing '%' in format [-Wformat=]
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                 ^~~~~~~~~
   userfaultfd.c:147:17: note: in expansion of macro '_err'
     147 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:390:17: note: in expansion of macro 'err'
     390 |                 err("UFFDIO_COPY retry unexpected: %"PRId64,
         |                 ^~~
   userfaultfd.c: In function '__copy_page':
   userfaultfd.c:409:51: error: expected ')' before 'PRId64'
     409 |                         err("UFFDIO_COPY error: %"PRId64,
         |                                                   ^~~~~~
   userfaultfd.c:140:43: note: in definition of macro '_err'
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:409:25: note: in expansion of macro 'err'
     409 |                         err("UFFDIO_COPY error: %"PRId64,
         |                         ^~~
   userfaultfd.c:409:51: note: 'PRId64' is defined in header '<inttypes.h>'; this is probably fixable by adding '#include <inttypes.h>'
     409 |                         err("UFFDIO_COPY error: %"PRId64,
         |                                                   ^~~~~~
   userfaultfd.c:140:43: note: in definition of macro '_err'
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                                           ^~~
   userfaultfd.c:409:25: note: in expansion of macro 'err'
     409 |                         err("UFFDIO_COPY error: %"PRId64,
         |                         ^~~
   userfaultfd.c:140:24: note: to match this '('
     140 |                 fprintf(stderr, "ERROR: " fmt, ##__VA_ARGS__);  \
         |                        ^
   userfaultfd.c:147:17: note: in expansion of macro '_err'
     147 |                 _err(fmt, ##__VA_ARGS__);       \
         |                 ^~~~
   userfaultfd.c:409:25: note: in expansion of macro 'err'
     409 |                         err("UFFDIO_COPY error: %"PRId64,
         |                         ^~~
   userfaultfd.c:140:33: warning: spurious trailing '%' in format [-Wformat=]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
