Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC5A1C27
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Feb 2023 07:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675496078; x=1707032078;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X8wJwE7paCH5BhTDiSuYoG+wh1VUNywcumoSgu+A5p8=;
  b=VyUllPAtqd5B9dgsynjk117KaS80hRhXS3g2vSnfMH+B+4aBTiRKHHy1
   pAhGLbiqoanWSwo/W9b4MGOJvUXVDavI+/T764gwfS+uJM7jQ1bZsZtoy
   PFSl0o1Z5b1WpbCNFG74zOLRu+OYToneWD1Xu5GeJITfPfCm3qV+jrcH4
   7X0+dHb6qMrGd5d7SnqOFCAIggXaJyfFHM+BCszQr5Ns00xHqCZ+Es/eC
   vRAMFASpv4yN+7gscRmaCwOYI5H4MTkvcJW6bgQfKEF6XVg8jkBDb/GgS
   lslsGsMvtQKeO80ICjB3z7rSx25O7gQJEgphPQjYWtUww2dvErvHiotxx
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="331054947"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="331054947"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2023 23:34:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10610"; a="696367444"
X-IronPort-AV: E=Sophos;i="5.97,272,1669104000"; 
   d="scan'208";a="696367444"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 03 Feb 2023 23:34:36 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pOD4F-00018P-37;
	Sat, 04 Feb 2023 07:34:35 +0000
Date: Sat, 4 Feb 2023 15:34:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jsarha:topic/cros-sof-v4.19 949/6555] mm/low-mem-notify.c:87:16:
 sparse: sparse: incorrect type in return expression (different base types)
Message-ID: <202302041536.YTzRxwes-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "mm/low-mem-notify.c: fbc_errors <3> is not larger than parent_errors <4>"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Guenter Roeck <groeck@chromium.org>
CC: Luigi Semenzato <semenzato@chromium.org>

tree:   https://github.com/jsarha/linux topic/cros-sof-v4.19
head:   d7a3e91d8d16d1ef8653deec5a1fffc4de034a0c
commit: b7ec7fb624dfc8d07e722cf2e0e72ff82ebaec7b [949/6555] CHROMIUM: low-mem: Fix return type of low_mem_notify_poll
:::::: branch date: 3 years, 10 months ago
:::::: commit date: 4 years, 3 months ago
config: i386-randconfig-s002 (https://download.01.org/0day-ci/archive/20230204/202302041536.YTzRxwes-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/b7ec7fb624dfc8d07e722cf2e0e72ff82ebaec7b
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/cros-sof-v4.19
        git checkout b7ec7fb624dfc8d07e722cf2e0e72ff82ebaec7b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> mm/low-mem-notify.c:87:16: sparse: sparse: incorrect type in return expression (different base types) @@     expected restricted __poll_t @@     got unsigned int [assigned] ret @@
   mm/low-mem-notify.c:87:16: sparse:     expected restricted __poll_t
   mm/low-mem-notify.c:87:16: sparse:     got unsigned int [assigned] ret

vim +87 mm/low-mem-notify.c

89587e9d1c30b5 Luigi Semenzato 2014-04-03  74  
b7ec7fb624dfc8 Guenter Roeck   2018-11-01  75  static __poll_t low_mem_notify_poll(struct file *file, poll_table *wait)
89587e9d1c30b5 Luigi Semenzato 2014-04-03  76  {
89587e9d1c30b5 Luigi Semenzato 2014-04-03  77  	unsigned int ret = 0;
89587e9d1c30b5 Luigi Semenzato 2014-04-03  78  
89587e9d1c30b5 Luigi Semenzato 2014-04-03  79  	/* Update state to reflect any recent freeing. */
89587e9d1c30b5 Luigi Semenzato 2014-04-03  80  	atomic_set(&low_mem_state, is_low_mem_situation());
89587e9d1c30b5 Luigi Semenzato 2014-04-03  81  
89587e9d1c30b5 Luigi Semenzato 2014-04-03  82  	poll_wait(file, &low_mem_wait, wait);
89587e9d1c30b5 Luigi Semenzato 2014-04-03  83  
1fa6b9516423e6 Luigi Semenzato 2012-04-18  84  	if (low_mem_margin_enabled && atomic_read(&low_mem_state) != 0)
89587e9d1c30b5 Luigi Semenzato 2014-04-03  85  		ret = POLLIN;
89587e9d1c30b5 Luigi Semenzato 2014-04-03  86  
89587e9d1c30b5 Luigi Semenzato 2014-04-03 @87  	return ret;
89587e9d1c30b5 Luigi Semenzato 2014-04-03  88  }
89587e9d1c30b5 Luigi Semenzato 2014-04-03  89  

:::::: The code at line 87 was first introduced by commit
:::::: 89587e9d1c30b5f908d4bfe5f2ee0b920c156c14 CHROMIUM: Add /dev/low-mem device for low-memory notification.

:::::: TO: Luigi Semenzato <semenzato@chromium.org>
:::::: CC: Guenter Roeck <groeck@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
