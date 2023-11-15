Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A812FC20
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 19:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fENPvTf5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700074913; x=1731610913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=P+YThSijshEuPRBhAhf1eyXO9Z2aa0mqc8rpB35hf/s=;
  b=fENPvTf5am1CW21SebLv+thRe12d1BAeoSV5EtXaQAV4bG7H0BPCor26
   34Qi30O+R4oSgHdgVQSfhuTnbrqcNfbU9doJbG2w+5ONFmnErNkJcBuYm
   CMlBKOU4RRg6C40hU904Pb58XCncLsdqTtpHju1rXoMXO/cwxrVEbXpCw
   BqrT3eqznfq3RvtQ2+VYq26zsb5RX5GzUMZ9qbpTatip5o4EXeQOkswGH
   ZQ+dhURC/Y1sbsgwME8zUtt86ikvOyV52C7d356/5/7oxG64XS21Qt6+f
   GTF18lhfdYIhQ35oWgVU9wGXxXTRgw4ndfQbhUic5GSW3BHOB5ySvsM5k
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="389789991"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="389789991"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 11:01:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="908862485"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="908862485"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 15 Nov 2023 11:01:51 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3L93-0000jD-1Z;
	Wed, 15 Nov 2023 19:01:49 +0000
Date: Thu, 16 Nov 2023 03:01:35 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: diff -u tools/arch/arm64/include/asm/cputype.h
 arch/arm64/include/asm/cputype.h
Message-ID: <202311160239.txwHJJzc-lkp@intel.com>
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
TO: D Scott Phillips <scott@os.amperecomputing.com>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: James Morse <james.morse@arm.com>

Hi Scott,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 0e5d5ae837c8ce04d2ddb874ec5f920118bd9d31 arm64: Add AMPERE1 to the Spectre-BHB affected list
date:   1 year, 1 month ago
:::::: branch date: 14 hours ago
:::::: commit date: 1 year, 1 month ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160239.txwHJJzc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160239.txwHJJzc-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/linux/perf_event.h' differs from latest version at 'include/uapi/linux/perf_event.h'
   diff -u tools/include/uapi/linux/perf_event.h include/uapi/linux/perf_event.h
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h' differs from latest version at 'arch/x86/include/asm/cpufeatures.h'
   diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/perf_regs.h' differs from latest version at 'arch/arm64/include/uapi/asm/perf_regs.h'
   diff -u tools/arch/arm64/include/uapi/asm/perf_regs.h arch/arm64/include/uapi/asm/perf_regs.h
   Warning: Kernel ABI header at 'tools/arch/arm64/include/asm/cputype.h' differs from latest version at 'arch/arm64/include/asm/cputype.h'
>> diff -u tools/arch/arm64/include/asm/cputype.h arch/arm64/include/asm/cputype.h
     PERF_VERSION = 6.0.rc3.g0e5d5ae837c8
   util/scripting-engines/trace-event-python.c: In function 'python_start_script':
   util/scripting-engines/trace-event-python.c:1908:9: warning: 'PySys_SetArgv' is deprecated [-Wdeprecated-declarations]
    1908 |         PySys_SetArgv(argc + 1, command_line);
         |         ^~~~~~~~~~~~~
   In file included from /usr/include/python3.11/Python.h:96,
                    from util/scripting-engines/trace-event-python.c:22:
   /usr/include/python3.11/sysmodule.h:13:38: note: declared here
      13 | Py_DEPRECATED(3.11) PyAPI_FUNC(void) PySys_SetArgv(int, wchar_t **);
         |                                      ^~~~~~~~~~~~~

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
