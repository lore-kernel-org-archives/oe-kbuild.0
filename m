Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56C97264627
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Nov 2025 09:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763976929; cv=none; b=ODfI9bFxJkmUyNs834FacK354dswW38ZpBJhahp9xLn4PQdgkcHvuZ+gGpcDHNZuwgIYQFBOrdqdOIVti/4KSpjU+Nj9tUcFS+bxJjUDo9WCNGdAWOAGv+5FKr+caIRJrMh+hwnTPmjUm3O2kTcERjIKAJ+99Mlwi8o/Yrx+Do8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763976929; c=relaxed/simple;
	bh=hL0mE6f7iZCyry+qUcRWx3iT/2OoReor+i+Vh6kKuPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mcElbVhLHUN+r0tk/tXKCGAjI4ZkJz5H2nCOxEc+td8CtOtIUOnYls94ykyY5oxkQr+h4+lllOEUCAs8zjivDD6yGLP82pNANkq1h6ZzMRcL8s1+ihObvJVWGuHNFQhbucPdgpRJ/eCHbC6bv0/POX5Fuvb0wj1kZxT/fQVO1y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ISz5yDgz; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ISz5yDgz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763976929; x=1795512929;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hL0mE6f7iZCyry+qUcRWx3iT/2OoReor+i+Vh6kKuPY=;
  b=ISz5yDgzTtyiBkDphnptpGPrOUmbB2oBBznrb0xDjB/NqY6RWFXUgQUN
   MSyoSCXffcmzadfdpSXymZk2Y3kVsQg87z/lHRZsUU0ujctGPhJ8kRlr8
   ImJE2iZ2Do0WGPONnTgXPsGqRXsqVjEzQANTdjPQHw+kxoLmcGmizP98d
   9EE2bpCsS7g60PCk3yAXzAWlKq/xBFaAflVz+A6HdZnwswFNAPQFxXXnd
   9emlKureAzA9Kk0KcPxRSb/WaKAhKk66Hw8i6frK+EgkybLfYKNdvAL7n
   aIW/9L6YMC4qywEI5rpjKasMSHtHitUsWDf53fzFNJeH8TbXdm/qaqoY8
   Q==;
X-CSE-ConnectionGUID: ScvzQ6DgRKeRfFBmKbZpuw==
X-CSE-MsgGUID: PyYaTvfsQraZFz2C2pgeXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11622"; a="83360292"
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="83360292"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 01:35:28 -0800
X-CSE-ConnectionGUID: EUyZE0juROaMaZnNDgcOQQ==
X-CSE-MsgGUID: OsNJiqJrTMWpKbWx3iXgMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,222,1758610800"; 
   d="scan'208";a="191950034"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 24 Nov 2025 01:35:26 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNSyi-000000000CT-23pD;
	Mon, 24 Nov 2025 09:35:24 +0000
Date: Mon, 24 Nov 2025 10:35:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10976/11041]
 tools/testing/selftests/../../../tools/testing/selftests/kselftest.h:53:10:
 fatal error: errno.h: No such file or directory
Message-ID: <202511241029.klEDjUnB-lkp@intel.com>
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
TO: Janosch Frank <frankja@linux.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d724c6f85e80a23ed46b7ebc6e38b527c09d64f5
commit: 7f8441092a215913ee1f9a497ae210e348792fe2 [10976/11041] Merge branch 'next' of https://git.kernel.org/pub/scm/linux/kernel/git/kvms390/linux.git
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251124/202511241029.klEDjUnB-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251124/202511241029.klEDjUnB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511241029.klEDjUnB-lkp@intel.com/

Note: the linux-next/master HEAD d724c6f85e80a23ed46b7ebc6e38b527c09d64f5 builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   In file included from s390/user_operexec.c:9:
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
