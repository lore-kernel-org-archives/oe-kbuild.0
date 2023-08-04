Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D002FBE48
	for <oe-kbuild@lists.linux.dev>; Fri,  4 Aug 2023 14:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691158048; x=1722694048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5GOZCtqMbWC0sZZwBxKBs+Ces/FXVjj25iRJihl10c8=;
  b=Y2TRuF6OVH/iiScCLoT+JlLizkHAtOGklbIzpZFbo9CBFEwxQNsQ6kpX
   pvouFi+luQeBXla+Tl2xeenkHf5Jv6EodY/GWuC1UhILY51dgRuzR6/RW
   ls36qhHbQ7pRMWgfafMuQKpaG6WOpXK/ar7gt+mkBkPnQnb0NwKfmFjEO
   O3QXvo1OHf0wfoTBAa4eiCaAZ4uenXiUl6WvqmQyid2HLq1aplBjEkBxr
   TFivvl2W5aspqPtuYmlesVCjBLV6qyMvJebvMebY3Htm1Tx44RQPDs7EB
   5KiiC5RJWX0v4h2EEACDg5LHHLirXm/aHvfmOPOves6W8ZktdV827c3vL
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="401117541"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="401117541"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 07:07:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="844099532"
X-IronPort-AV: E=Sophos;i="6.01,255,1684825200"; 
   d="scan'208";a="844099532"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 04 Aug 2023 07:07:26 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRvSg-0002sZ-0j;
	Fri, 04 Aug 2023 14:07:26 +0000
Date: Fri, 4 Aug 2023 22:06:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH 3/3] coresight: Support exclude_guest with Feat_TRF
 and nVHE
Message-ID: <202308042132.rqsif2vw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230804101317.460697-4-james.clark@arm.com>
References: <20230804101317.460697-4-james.clark@arm.com>
TO: James Clark <james.clark@arm.com>

Hi James,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kvmarm/next]
[also build test ERROR on arm64/for-next/core soc/for-next linus/master v6.5-rc4 next-20230804]
[cannot apply to arm/for-next arm/fixes]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/James-Clark/arm64-KVM-Add-support-for-exclude_guest-and-exclude_host-for-ETM/20230804-181613
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvmarm.git next
patch link:    https://lore.kernel.org/r/20230804101317.460697-4-james.clark%40arm.com
patch subject: [RFC PATCH 3/3] coresight: Support exclude_guest with Feat_TRF and nVHE
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: arm-randconfig-r012-20230731 (https://download.01.org/0day-ci/archive/20230804/202308042132.rqsif2vw-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308042132.rqsif2vw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308042132.rqsif2vw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kvm_host.h:40,
                    from drivers/hwtracing/coresight/coresight-etm-perf.c:12:
>> include/uapi/linux/kvm.h:15:10: fatal error: asm/kvm.h: No such file or directory
      15 | #include <asm/kvm.h>
         |          ^~~~~~~~~~~
   compilation terminated.


vim +15 include/uapi/linux/kvm.h

6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   4  
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   5  /*
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   6   * Userspace interface for /dev/kvm - kernel based virtual machine
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   7   *
dea8caee7b6971 include/linux/kvm.h      Rusty Russell          2007-07-17   8   * Note: you must update KVM_API_VERSION if you change this interface.
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10   9   */
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  10  
fb1070d18edb37 include/uapi/linux/kvm.h Joe Richey             2021-05-21  11  #include <linux/const.h>
00bfddaf7f68a6 include/linux/kvm.h      Jaswinder Singh Rajput 2009-01-15  12  #include <linux/types.h>
97646202bc3f19 include/linux/kvm.h      Christian Borntraeger  2008-03-12  13  #include <linux/compiler.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  14  #include <linux/ioctl.h>
f6a40e3bdf5fe0 include/linux/kvm.h      Jerone Young           2007-11-19 @15  #include <asm/kvm.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  16  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
