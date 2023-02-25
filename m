Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854487B
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Feb 2023 23:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677366046; x=1708902046;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4RbK+J9SOYo1XLAvAtVL5+3eC06uKKNJBrEbwzqn24s=;
  b=AGot06oPQOBjsP0CV10qmmtnLuwKrzoenjdh4aUCfuh0QdZo2IU5gUoA
   aYwiddS9BwlNkdaHqzBelTverIxxPUATn5/RDb1+6Mp98AMreGObS1xzd
   9beV6AFuRZlEXN4wbcSqUnpnNSegAZYwjF1MVugzm6oQU8OW76AceLS5b
   K3XSystwR2uK4k0k7O0ne2X3l9BCbIFI2VBElWZkXd3UkbAUWLvNznGgy
   JRTx1Ry7xre8tp2QtlYXuAxLYsrrn2175dbsSecWeKvBRfQ8VO/3e+JXD
   VDXp3WjuWbTEfJx+5oURdkc2ngiuqPbTONce41Kzt5OIDLod0lKa9qnmc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="419935881"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="419935881"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 15:00:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="650748159"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="650748159"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 25 Feb 2023 15:00:44 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW3X1-0003Rr-2V;
	Sat, 25 Feb 2023 23:00:43 +0000
Date: Sun, 26 Feb 2023 06:59:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/perf/mpc7450-pmu.c:422 init_mpc7450_pmu() warn: masked
 condition '((pvr >> 16) & 65535) != 2147483648' is always true.
Message-ID: <202302260657.7dM9Uwev-lkp@intel.com>
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
TO: Rashmica Gupta <rashmica.g@gmail.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>
CC: Madhavan Srinivasan <maddy@linux.vnet.ibm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   116b41162f8b267987ea9a73eb7e73eaa7c2cce5
commit: ec3eb9d941a98f4c0dac263110729680a734279b powerpc/perf: Use PVR rather than oprofile field to determine CPU version
date:   7 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 months ago
config: powerpc-randconfig-m031-20230226 (https://download.01.org/0day-ci/archive/20230226/202302260657.7dM9Uwev-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302260657.7dM9Uwev-lkp@intel.com/

smatch warnings:
arch/powerpc/perf/mpc7450-pmu.c:422 init_mpc7450_pmu() warn: masked condition '((pvr >> 16) & 65535) != 2147483648' is always true.

vim +422 arch/powerpc/perf/mpc7450-pmu.c

7325927e5a20bf arch/powerpc/kernel/mpc7450-pmu.c Paul Mackerras   2009-06-17  417  
77c2342a578c11 arch/powerpc/kernel/mpc7450-pmu.c Dmitry Baryshkov 2011-06-29  418  static int __init init_mpc7450_pmu(void)
7325927e5a20bf arch/powerpc/kernel/mpc7450-pmu.c Paul Mackerras   2009-06-17  419  {
ec3eb9d941a98f arch/powerpc/perf/mpc7450-pmu.c   Rashmica Gupta   2022-07-07  420  	unsigned int pvr = mfspr(SPRN_PVR);
ec3eb9d941a98f arch/powerpc/perf/mpc7450-pmu.c   Rashmica Gupta   2022-07-07  421  
ec3eb9d941a98f arch/powerpc/perf/mpc7450-pmu.c   Rashmica Gupta   2022-07-07 @422  	if (PVR_VER(pvr) != PVR_7450)
7325927e5a20bf arch/powerpc/kernel/mpc7450-pmu.c Paul Mackerras   2009-06-17  423  		return -ENODEV;
7325927e5a20bf arch/powerpc/kernel/mpc7450-pmu.c Paul Mackerras   2009-06-17  424  
7325927e5a20bf arch/powerpc/kernel/mpc7450-pmu.c Paul Mackerras   2009-06-17  425  	return register_power_pmu(&mpc7450_pmu);
7325927e5a20bf arch/powerpc/kernel/mpc7450-pmu.c Paul Mackerras   2009-06-17  426  }
7325927e5a20bf arch/powerpc/kernel/mpc7450-pmu.c Paul Mackerras   2009-06-17  427  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
