Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA712102
	for <oe-kbuild@lists.linux.dev>; Sat, 26 Aug 2023 09:58:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693043885; x=1724579885;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=L0cL4Z8A24bGYVIfRdjT3G8GYj9/PDJ9u20C03OVFhQ=;
  b=ImNg/z1X1m7DV9GYNOD7ODhi4C29ggZkv9ImM1H/f0xCqNzY7z50etZB
   sYsjotl7zMUpG2WppkwwrRopoB4sefmCeOoDZhGjMuoiy9fh8/GkHtTC/
   4mV5xD5a3MCrpyUALr1wTXb9sV9t4cTAVIcnfNmwEWfUcSxd0apTufPHU
   OW0CAE8O1so26WV5bEEyjLLjHvIyNaaXu5YMyVUJrGiwsKj0UNG9ebY8c
   b96BFSLPAJOxkDKLKky6xlHexryAQIadttcW7+f7wwC7tz6xOY4YGecV7
   7nz+S45Xco34IO//1hVr4L1+6Cn5w6JxATFJhP2Gt7ojBoPvNuBMj1ypJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="354390579"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="354390579"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 02:58:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="911539605"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="911539605"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 26 Aug 2023 02:58:02 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZq3N-0004a4-2o;
	Sat, 26 Aug 2023 09:58:01 +0000
Date: Sat, 26 Aug 2023 17:57:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: net/can/raw.c:497:2-9: WARNING: NULL check before dev_{put, hold}
 functions is not needed.
Message-ID: <202308261715.rrGbPZvu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Oliver Hartkopp <socketcan@hartkopp.net>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7d2f353b2682dcfe5f9bc71e5b61d5b61770d98e
commit: c275a176e4b69868576e543409927ae75e3a3288 can: raw: add missing refcount for memory leak fix
date:   3 days ago
:::::: branch date: 9 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-051-20230826 (https://download.01.org/0day-ci/archive/20230826/202308261715.rrGbPZvu-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308261715.rrGbPZvu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202308261715.rrGbPZvu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/can/raw.c:497:2-9: WARNING: NULL check before dev_{put, hold} functions is not needed.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
