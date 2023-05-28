Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12BF77C
	for <oe-kbuild@lists.linux.dev>; Sun, 28 May 2023 08:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685260925; x=1716796925;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cp+arSrK9g3dS5s5gnus+BlIEV47SWicVYRp4dH64sk=;
  b=F4dnY2+XIi446J3zpw3yNs2PTCsZKnWC9IkpdsimWRgF2rQlldI/co1E
   YTFk1NOXclRRfthUoQSDSNfiom+dsTW0ZaU/4CTbUaO4kXAgG63TuaaZy
   Fa4VAUFlkQ8TWyiAnidf+FOlbsB73vgjT+czm0I0nQxTjR8JaouSsbZj+
   vCvHOcMEPThZF41vOgNrzOrI6ImbEoQaaRPgufiiDxapXMgG7rz8mUkOY
   nJMNkp9lG/10pCfSUf98dIhlYV63wFtdZXgWzhPIv7lEqGOu8NNTa+MTM
   cDwJt0+RATtQxn+kU1hTz6+5JYktLefyF6Gz7uWRA/wwaxxLSvzgvvWu9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="420254176"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="420254176"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2023 01:02:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="1035828213"
X-IronPort-AV: E=Sophos;i="6.00,198,1681196400"; 
   d="scan'208";a="1035828213"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 28 May 2023 01:01:59 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q3BLi-000KUQ-2w;
	Sun, 28 May 2023 08:01:58 +0000
Date: Sun, 28 May 2023 16:01:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android14-6.1 3/7] mm/page_alloc.c: trace/hooks/mm.h
 is included more than once.
Message-ID: <202305281524.S4TJufi0-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   500484f5be022b113cdfb97287e3491a149435cd
commit: 573ba7b6e66e9aca2fe4a1c982bbced96a0d1e10 [3/7] ANDROID: vendor_hooks: Add hooks for memory when debug
:::::: branch date: 31 hours ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202305281524.S4TJufi0-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> mm/page_alloc.c: trace/hooks/mm.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
