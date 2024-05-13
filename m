Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23254381DE
	for <oe-kbuild@lists.linux.dev>; Mon, 13 May 2024 18:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715624810; cv=none; b=neqV/EEV5cSEgHjsF2JeYMtqnbI6zsSNRm7/zqzzcAX0aMAO4z7Vqqd2SkdGtCXMyLSy4+khtOL/QWebe7yudvdHNX/83yW+vWO0BBMw+1BXmsVEBW9SuRII40D3AyAmaNO/dUdo2geDRtdPDzOvL4brLeng/sXyoV0/wIk8xS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715624810; c=relaxed/simple;
	bh=q83kk0UlNfC7F0bZd5eSbU6HTtE339L/ZNtuHYm+JmM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oWkVWV4E9Ep8pYjQhoHI+i8t8LFVvmlyc83eATjtKGMiD5sAmYs4iw+Lac1jZCBaZLfZHDRyFtEYPd0Itos5Z5iSoezkwrFCdZAhy6K6oI7PdKtIMhm5oaRhgVsCptCmfmrKH8+pw2s6LTIWAJaozWHLD7PzvQtdFtbotDtkXyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MHSXtZoh; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MHSXtZoh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715624808; x=1747160808;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=q83kk0UlNfC7F0bZd5eSbU6HTtE339L/ZNtuHYm+JmM=;
  b=MHSXtZohGhIX/U/hsWDEBH24dPyZy1Y/GslxeZREYAlfNlplOp4/XUYM
   KfZgRif/uF5NZBnws6kKLv7ZNAfsn6gb8Qbe/MgGx00HLW6Ky+aLjE2fm
   d9U4AwdCCUQsHtew4KC1yyCWa/a0g52pUR5jdyAYo9/299ss/4yUKz8U+
   YHcW//gzw/YYG3y0SnYXM2imdK/ObwjP3hohkua4zVQgnRKTTlswBhplh
   n+m4G96QLfvqyq61n8bbNVvP4B6VKZnR6MLfZTVKgok8BZ7rimo1tDJeb
   iqlB7wwlFV82JTUzBnlrfDWO1ugysGygFiLSzvyov2pBLMybXLJn8ilnW
   Q==;
X-CSE-ConnectionGUID: utbdc9JdQmiqnKevUv7Dlw==
X-CSE-MsgGUID: 80TwjDFrSQ2gbXCc7VcLmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11072"; a="22723448"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="22723448"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2024 11:26:48 -0700
X-CSE-ConnectionGUID: JaQ/bP0LQsCmk7YlC5w75w==
X-CSE-MsgGUID: sRyoTD9JQHaxLdn6KJaRfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; 
   d="scan'208";a="61243943"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 May 2024 11:26:46 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s6aNo-000AWF-0m;
	Mon, 13 May 2024 18:26:44 +0000
Date: Tue, 14 May 2024 02:26:02 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 11868/12793] ./../kselftest_harness.h:54:15:
 error: static assertion failed: kselftest harness requires _GNU_SOURCE to be
 defined
Message-ID: <202405140209.ORIxFuOF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Edward Liaw <edliaw@google.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Muhammad Usama Anjum <usama.anjum@collabora.com>
CC: Mark Brown <broonie@kernel.org>
CC: John Hubbard <jhubbard@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ba6c795dc73c22ce2c86006f17c4aa802db2a60
commit: daef47b89efd0b745e8478d69a3ad724bd8b4dc6 [11868/12793] selftests: Compile kselftest headers with -D_GNU_SOURCE
:::::: branch date: 11 hours ago
:::::: commit date: 5 days ago
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240514/202405140209.ORIxFuOF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202405140209.ORIxFuOF-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from test-pcmtest-driver.c:10:
>> ./../kselftest_harness.h:54:15: error: static assertion failed: kselftest harness requires _GNU_SOURCE to be defined
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
         |               ^
   1 error generated.
--
   In file included from main.c:21:
>> ./../kselftest_harness.h:54:15: error: static assertion failed: kselftest harness requires _GNU_SOURCE to be defined
      54 | static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
         |               ^
   tools/testing/selftests/../../../tools/include/linux/build_bug.h:78:50: note: expanded from macro 'static_assert'
      78 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                                  ^~~~
   tools/testing/selftests/../../../tools/include/linux/build_bug.h:79:56: note: expanded from macro '__static_assert'
      79 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   1 error generated.


vim +54 tools/testing/selftests/alsa/./../kselftest_harness.h

c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  52  
e80068be21824e4 tools/testing/selftests/kselftest_harness.h    Kees Cook      2020-06-22  53  #ifndef _GNU_SOURCE
daef47b89efd0b7 tools/testing/selftests/kselftest_harness.h    Edward Liaw    2024-05-07 @54  static_assert(0, "kselftest harness requires _GNU_SOURCE to be defined");
e80068be21824e4 tools/testing/selftests/kselftest_harness.h    Kees Cook      2020-06-22  55  #endif
369130b63178e0e tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2017-08-07  56  #include <asm/types.h>
65177e47d3035c0 tools/testing/selftests/kselftest_harness.h    Jakub Kicinski 2023-01-25  57  #include <ctype.h>
369130b63178e0e tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2017-08-07  58  #include <errno.h>
369130b63178e0e tools/testing/selftests/kselftest_harness.h    Mickaël Salaün 2017-08-07  59  #include <stdbool.h>
b5bb6d3068eabb0 tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-12-10  60  #include <stdint.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  61  #include <stdio.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  62  #include <stdlib.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  63  #include <string.h>
0ef67a888375b0d tools/testing/selftests/kselftest_harness.h    Kees Cook      2020-06-22  64  #include <sys/mman.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  65  #include <sys/types.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  66  #include <sys/wait.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  67  #include <unistd.h>
63e6b2a42342c32 tools/testing/selftests/kselftest_harness.h    Kees Cook      2022-03-24  68  #include <setjmp.h>
c99ee51a9d9716f tools/testing/selftests/seccomp/test_harness.h Kees Cook      2015-06-16  69  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
