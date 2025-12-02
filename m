Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0797FBF0
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Dec 2025 01:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764638150; cv=none; b=e3N3X3KQw9MfL3NnFuG5Sg+4kIwyVV9utmMi8Mx7QU9d85LQp3xckVn7Pkfc/Y/mWTCro7bpTi++mipye2GnXWIUul66jPz2nfsqkWUE+0+ZhFQiZzTrWgN6WIG9k+Vd1DiR6vWm0s3DDaBg1RLkKvh5fEh3fNGc/saLe0wDexQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764638150; c=relaxed/simple;
	bh=0iiFR9fMj5Q8oCLFupUjosJPlrncgpa2Oxel4RYZV34=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XBHlpd4Tt/cBU5/B9zpkAymTTCBLNSZ+4Hg0Ac6G3x763XPvNzE5fBqL9eM8cionoHoZHl8T1IdL5wEhS6EvOIK/+VYWa2Weww1vA7m7HbOHRoEar2m5kMLQ9CgSpHbai+dE93inpVbqbZEX1H5IZ8jcbybgGcAkH4kkjrLE/DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EGEa6QLl; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EGEa6QLl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764638149; x=1796174149;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=0iiFR9fMj5Q8oCLFupUjosJPlrncgpa2Oxel4RYZV34=;
  b=EGEa6QLlBe3lJbrExEKXftbRTlSyxGnHVx8+8Lmp20jtwKYIq3FD677y
   MPGJ3p4qqB1awlFlQsGYYj+LFH/AT+567PXg8qI5rQ2RzviUDbqu/ozwO
   ow6jGhHW+XvfzLAk+2kCjjJ881hzJjquMIv/UaOtte7IeDPA9H43AibOt
   4uDqMz4r2M/51fCBuqZ/l37NVlu45r5k+UA/ssJK3+QmxFs8hxy8LgaZK
   rs3whEA25WDaJDRNwjQZaE6xsxiFaYLCIL/E1NbaTCbhZPRinP/JldmrB
   2CuqfApNvDmH8uTVC3ly184Q2e5HM/hj3P6EzzxLLjf15jy+BoMrX6eAt
   A==;
X-CSE-ConnectionGUID: wOKRcWbYRQydq1IKHjlEQA==
X-CSE-MsgGUID: CXLkuJ/ET66jk8bcwOJNag==
X-IronPort-AV: E=McAfee;i="6800,10657,11630"; a="66759971"
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="66759971"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Dec 2025 17:15:48 -0800
X-CSE-ConnectionGUID: LbotfeXeQbuoYdjffSAlnQ==
X-CSE-MsgGUID: C708X/PAQU2qrVqIXBJNdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,241,1758610800"; 
   d="scan'208";a="199348684"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 01 Dec 2025 17:15:47 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vQEzZ-000000009Hf-0IWv;
	Tue, 02 Dec 2025 01:15:45 +0000
Date: Tue, 2 Dec 2025 09:15:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 13132/13171]
 tools/testing/selftests/../../../tools/testing/selftests/kselftest.h:53:10:
 fatal error: errno.h: No such file or directory
Message-ID: <202512020939.RjrWqk1z-lkp@intel.com>
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
TO: Alex Williamson <alex@shazbot.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a
commit: d6cc2521cb389a8c83c8610b3ff637480692dcf6 [13132/13171] Merge branch 'next' of https://github.com/awilliam/linux-vfio.git
:::::: branch date: 22 hours ago
:::::: commit date: 24 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251202/202512020939.RjrWqk1z-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251202/202512020939.RjrWqk1z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512020939.RjrWqk1z-lkp@intel.com/

Note: the linux-next/master HEAD 95cb2fd6ce0ad61af54191fe5ef271d7177f9c3a builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from tools/testing/selftests/vfio/lib/vfio_pci_driver.c:2:
>> tools/testing/selftests/../../../tools/testing/selftests/kselftest.h:53:10: fatal error: errno.h: No such file or directory
      53 | #include <errno.h>
         |          ^~~~~~~~~
   compilation terminated.


vim +53 tools/testing/selftests/../../../tools/testing/selftests/kselftest.h

7fb2c3ea28bf7b Shuah Khan     2014-10-03  51  
9e38be732da8fe Mark Brown     2023-04-06  52  #ifndef NOLIBC
fc2e634e997d84 Aleksa Sarai   2019-07-20 @53  #include <errno.h>
7fb2c3ea28bf7b Shuah Khan     2014-10-03  54  #include <stdlib.h>
7fb2c3ea28bf7b Shuah Khan     2014-10-03  55  #include <unistd.h>
151b2732111f07 Paul Elder     2017-06-28  56  #include <stdarg.h>
f2662ec26b26ad André Almeida  2025-09-17  57  #include <stdbool.h>
907f33028871fa Mark Brown     2023-09-28  58  #include <string.h>
a18261d71bbc62 Tycho Andersen 2019-01-18  59  #include <stdio.h>
6d029c25b71f2d Oleg Nesterov  2024-04-09  60  #include <sys/utsname.h>
9e38be732da8fe Mark Brown     2023-04-06  61  #endif
7fb2c3ea28bf7b Shuah Khan     2014-10-03  62  

:::::: The code at line 53 was first introduced by commit
:::::: fc2e634e997d84f2610a482b500865ef2c04fcde kselftest: save-and-restore errno to allow for %m formatting

:::::: TO: Aleksa Sarai <cyphar@cyphar.com>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
