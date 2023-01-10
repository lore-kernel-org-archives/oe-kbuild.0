Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81286FD9
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Jan 2023 13:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673358856; x=1704894856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gKHQ00YQ4FreYoLqjxSXGZNV9XVxA2Ds84lZOtnFW/Q=;
  b=OHCVfTnXwe6GJonnU051WdDv/jQl4myfoflUtU0IuGsF4E6vdPHVNYJh
   kuUoFbgnU+iD/8mr+aGzDSXo/i8fikuGUUdzIdlwoBlg0YGMcbTQJu0CX
   jxdOt1jCq+Mpl9XsXVsUe0wW7BJ5n+q/v66Bx9wHBBidFX6Rvtq7vtcCo
   B/4zeASKyZ+KnZ3YWbJBLO5jx7mV+Od+CD5B6R7yFvJGNV4RrEEwd/JPp
   zZKEmtMuBPgtJ8/cRz7zzPNn82O3zdZU9JVRz0BS51FcoGSyzr3z4wYAE
   LcaBNBeaSjCw9Elg7owm1grT7MQQPfHROWukjOWj0whyaPmoem1Be9DpF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="306659018"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="306659018"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jan 2023 05:54:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10585"; a="985789584"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; 
   d="scan'208";a="985789584"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 10 Jan 2023 05:54:15 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pFF4v-00084e-2u;
	Tue, 10 Jan 2023 13:54:14 +0000
Date: Tue, 10 Jan 2023 21:53:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [ammarfaizi2-block:google/android/kernel/common/android14-6.1 6/10]
 arch/arm64/include/asm/alternative-macros.h: linux/types.h is included more
 than once.
Message-ID: <202301102138.fkXObPii-lkp@intel.com>
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
TO: Ammar Faizi <ammarfaizi2@gnuweeb.org>
TO: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>

tree:   https://github.com/ammarfaizi2/linux-block google/android/kernel/common/android14-6.1
head:   41d708af25a9fff133a94d80a35f71f2f0d26a88
commit: 77e257420d1ff78f2afa38db38a80badc1519355 [6/10] ANDROID: arm64: only permit certain alternatives in the FIPS140 module
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

includecheck warnings: (new ones prefixed by >>)
>> arch/arm64/include/asm/alternative-macros.h: linux/types.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
