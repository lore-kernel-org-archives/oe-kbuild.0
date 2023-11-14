Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A41478813
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Nov 2023 03:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aPPVy0UD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699932151; x=1731468151;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7gLel3FbG626bfmBAX75oqD1wGxn9vPqoAW3/4EaQFU=;
  b=aPPVy0UDCGGFa685k4UaL7OXCFPkkOVFhUQUkuoXoGJRsuOmgPIaU9nA
   ScGJei2EQBFL7ByebqnxkCVn9iX8ETWBG+Fx+9VdhFWH1sy/7DcNHmCum
   5L0Rpr+SZKuXdOzGTPrgiRO8eo6XDsFDIh572/kx1frJQ5UYuiA3wwu8L
   6NDuWEC5e6cy158IS191fXQ7ZIzQiBujHXyo47ZLp/daUuBiG1zunw7Q9
   4HCqg2JLt1OwDzHfgTKQ8b6Kf5WYcgo4z6LxNSXV/VmndJe8tnyb8yeOC
   c43YyjFbvhph3w+vqOKDwekPe3hd7zAPGKdwwHBCDSn02J40tlf8zgoI9
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10893"; a="387728103"
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="387728103"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 19:22:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,299,1694761200"; 
   d="scan'208";a="12297431"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 Nov 2023 19:22:30 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2k0R-000Cna-1I;
	Tue, 14 Nov 2023 03:22:27 +0000
Date: Tue, 14 Nov 2023 11:21:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: diff -u tools/include/uapi/linux/vhost.h include/uapi/linux/vhost.h
Message-ID: <202311141111.ZY7UInHq-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: "Si-Wei Liu" <si-wei.liu@oracle.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9bacdd8996c77c42ca004440be610692275ff9d0
commit: c8068d9bae0c78e8880451b94668253449b2d71d vhost-vdpa: uAPI to get dedicated descriptor group id
date:   13 days ago
:::::: branch date: 10 hours ago
:::::: commit date: 13 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231114/202311141111.ZY7UInHq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311141111.ZY7UInHq-lkp@intel.com/

All errors (new ones prefixed by >>):

     diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
     diff -u tools/include/uapi/linux/mount.h include/uapi/linux/mount.h
>>   diff -u tools/include/uapi/linux/vhost.h include/uapi/linux/vhost.h
     diff -u tools/arch/x86/include/asm/disabled-features.h arch/x86/include/asm/disabled-features.h
     diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
     diff -u tools/arch/x86/include/asm/msr-index.h arch/x86/include/asm/msr-index.h
     diff -u tools/arch/x86/include/uapi/asm/prctl.h arch/x86/include/uapi/asm/prctl.h
     diff -u tools/arch/arm64/include/uapi/asm/perf_regs.h arch/arm64/include/uapi/asm/perf_regs.h
     diff -u tools/arch/s390/include/uapi/asm/kvm.h arch/s390/include/uapi/asm/kvm.h
     diff -u tools/arch/x86/lib/memcpy_64.S arch/x86/lib/memcpy_64.S
     diff -u tools/arch/x86/lib/memset_64.S arch/x86/lib/memset_64.S
     diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/cputype.h

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
