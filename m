Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBAD5748E
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Feb 2023 12:28:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675945721; x=1707481721;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=WCEl3epHn12AfXGdoEo6V0NxPqYRs/gRi7sVUWGJNHQ=;
  b=DSufb/vTeNgJVSlXbmPEu5ybqm15Bobi3u86ah9829XHunDOThSLlJ9m
   JT44/gIBt2kji0hB3HUhseiXlt7GrM+e0nTx0O6vVLCB7Py+TnlKRnBLk
   rJwx3FYNZ981l75VFfom+YzPuEyniS2rmzmmbzjYM3gc+wSsLpmWmdZPM
   VdzKwdaWLiLay3YehB8swHHDWy+K+tL1vgzC8VPNOiZJXOOCuHLpH7t1H
   l2tSTrLZ7BroTx62Vje8HHYCzWFLrNttaCuLLKU8R8TU0HYeWNGiq45Sz
   5w6FDJYpaRZcgSgqRlvN8rrs2URlz2a2ZCkmeIvTorLiYnxPOkRcyM3xf
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="310446996"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="310446996"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2023 04:28:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10615"; a="669572292"
X-IronPort-AV: E=Sophos;i="5.97,283,1669104000"; 
   d="scan'208";a="669572292"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 09 Feb 2023 04:28:40 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQ62Z-00053O-20;
	Thu, 09 Feb 2023 12:28:39 +0000
Date: Thu, 9 Feb 2023 20:28:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [driver-core:kobject-const-2 28/52] drivers/base/platform.c:886:57:
 warning: Parameter 'driver' can be declared as pointer to const
 [constParameter]
Message-ID: <202302092005.L7XUme1B-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: drivers/base/platform.c:886:57: warning: Parameter 'driver' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: devel@driverdev.osuosl.org
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/driver-core.git kobject-const-2
head:   cd0a09da4605c0331fc904223ca33b4d56240ca2
commit: 40b3880dc29b89c39139eba11eba2b3107dc2e38 [28/52] driver core: platform: simplify __platform_driver_probe()
:::::: branch date: 3 hours ago
:::::: commit date: 8 days ago
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 40b3880dc29b89c39139eba11eba2b3107dc2e38
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302092005.L7XUme1B-lkp@intel.com


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/bus/mhi/host/init.c:76:16: warning: Uninitialized variable: index [uninitvar]
    if (!state || index >= ARRAY_SIZE(mhi_pm_state_str))
                  ^
   drivers/bus/mhi/host/init.c:73:6: note: Assuming condition is false
    if (state)
        ^
   drivers/bus/mhi/host/init.c:76:16: note: Uninitialized variable: index
    if (!state || index >= ARRAY_SIZE(mhi_pm_state_str))
                  ^
--
>> drivers/base/platform.c:886:57: warning: Parameter 'driver' can be declared as pointer to const [constParameter]
   static int is_bound_to_driver(struct device *dev, void *driver)
                                                           ^

vim +/driver +886 drivers/base/platform.c

e21d740a3fe5ad Uwe Kleine-König   2020-11-19  885  
40b3880dc29b89 Greg Kroah-Hartman 2023-01-31 @886  static int is_bound_to_driver(struct device *dev, void *driver)
40b3880dc29b89 Greg Kroah-Hartman 2023-01-31  887  {
40b3880dc29b89 Greg Kroah-Hartman 2023-01-31  888  	if (dev->driver == driver)
40b3880dc29b89 Greg Kroah-Hartman 2023-01-31  889  		return 1;
40b3880dc29b89 Greg Kroah-Hartman 2023-01-31  890  	return 0;
40b3880dc29b89 Greg Kroah-Hartman 2023-01-31  891  }
40b3880dc29b89 Greg Kroah-Hartman 2023-01-31  892  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
