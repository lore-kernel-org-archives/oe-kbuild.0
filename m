Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72F31C04
	for <oe-kbuild@lists.linux.dev>; Sun,  7 May 2023 07:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683445411; x=1714981411;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4L/mkFtK7cmZE7tCWcN0/jTt4r5bG9dnA2L6g3+R/GQ=;
  b=n54xj+wxSiFW23xT4oIb+GobYXZEeWvB2twEJhGZjDPiSNzIoum+LiiG
   0FgW5rrXuEBsB6UcWT4adug0ln2Nbg6rL6vm98T9bBlqiIAKmDQseLq6j
   sqasrUfHS2qhkja4wqV53Lt90ofVRJf3IWtxphMnvpgeCVSRdAhLHWScL
   L2f/rtBNh4I/eYFCqwsEIiYJxkTbW2pNAT4tx3eA5jAzl8+xWYjnzfrA1
   URyAzgFUJUJJdTNwKSQ9qvdfaTVZrUdQIJOY7LLBsSWpbLaQb1a9bg5FB
   CrNmF1Ucu5a4FuWIHc8Upy08e/fohgBCbSbyd9PcHpNvki1BzwYud1SGa
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="412716681"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="412716681"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 00:43:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="701057735"
X-IronPort-AV: E=Sophos;i="5.99,256,1677571200"; 
   d="scan'208";a="701057735"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 07 May 2023 00:43:30 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvZ3J-0000gL-1p;
	Sun, 07 May 2023 07:43:29 +0000
Date: Sun, 7 May 2023 15:43:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [mchinth:socwatch_linux_6_0 1/1]
 drivers/platform/x86/sepdk/sep/linuxos.c:1960:6-7: ERROR: iterator variable
 bound on line 1959 cannot be NULL
Message-ID: <202305071506.UiKXn0Q1-lkp@intel.com>
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
TO: Manisha Chinthapally <manisha.chinthapally@intel.com>

tree:   https://github.com/mchinth/linux socwatch_linux_6_0
head:   32b2f1b19c12122a110fa6b673c000ef6bd5ee8b
commit: 32b2f1b19c12122a110fa6b673c000ef6bd5ee8b [1/1] SEP/SOCPERF drivers updated to 5.36
:::::: branch date: 7 months ago
:::::: commit date: 7 months ago
config: i386-randconfig-c021 (https://download.01.org/0day-ci/archive/20230507/202305071506.UiKXn0Q1-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Link: https://lore.kernel.org/r/202305071506.UiKXn0Q1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/platform/x86/sepdk/sep/linuxos.c:1960:6-7: ERROR: iterator variable bound on line 1959 cannot be NULL
   drivers/platform/x86/sepdk/sep/linuxos.c:1038:6-7: ERROR: iterator variable bound on line 1029 cannot be NULL
--
>> drivers/platform/x86/sepdk/sep/linuxos.c:600:24-30: Unneeded variable: "status". Return "  0" on line 631
--
>> drivers/platform/x86/sepdk/pax/pax.c:868:22-29: WARNING: kzalloc should be used for 
   	 /* Allocate memory for the PAX control device */ 
   	 pax_control  , instead of kmalloc/memset

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
