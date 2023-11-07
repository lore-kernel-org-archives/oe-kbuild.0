Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E6C36AE3
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 19:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bbXDwOy9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699384872; x=1730920872;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4CFKz0GkW0M+Vlzszu8QjpEQaiNC/MQi7qN6S3OroUg=;
  b=bbXDwOy997EzMKByXPewg4JCyw/eJRTKoZrzDF32JLBeQrTQxI1xyanN
   q7V6bMylNLGJ155QLz0vCa6NC059yKFWiKQk0m7rmkiDiqFVoIhH5KT58
   ARl2rP1J5zzZAEHXLx71Cv8zzilKZyQSWweaCyzk7kArz/Vw4zxwBuBIf
   DsaqBVlXdhnfMZdxAvqVLPeUB72qR/qW2ZC8M2Oxqv/LxIRynJdvW0QvP
   C3bfTTL1rssyOY91tjFrtXoDIwRDB+WKVX6YBmuao3yO7/mJQxFWqhZtm
   AfCl839SF8Po5SWbKKr7oSnT7/WGT+wHg1ZwOI6wglZ+gZ4Tze6FXc7Ia
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="369781910"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="369781910"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2023 11:21:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="828717471"
X-IronPort-AV: E=Sophos;i="6.03,284,1694761200"; 
   d="scan'208";a="828717471"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 07 Nov 2023 11:21:10 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0RdL-0007Lc-1M;
	Tue, 07 Nov 2023 19:21:07 +0000
Date: Wed, 8 Nov 2023 03:19:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
Message-ID: <202311080358.vXtrht0W-lkp@intel.com>
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
TO: Marc Zyngier <maz@kernel.org>
CC: Gavin Shan <gshan@redhat.com>
CC: Peter Xu <peterx@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: 17601bfed909fa080fcfd227b57da2bd4dc2d2a6 KVM: Add KVM_CAP_DIRTY_LOG_RING_ACQ_REL capability and config option
date:   1 year, 1 month ago
:::::: branch date: 20 hours ago
:::::: commit date: 1 year, 1 month ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231108/202311080358.vXtrht0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311080358.vXtrht0W-lkp@intel.com/

All errors (new ones prefixed by >>):

   Warning: Kernel ABI header at 'tools/include/uapi/linux/kvm.h' differs from latest version at 'include/uapi/linux/kvm.h'
>> diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
   Warning: Kernel ABI header at 'tools/include/uapi/linux/perf_event.h' differs from latest version at 'include/uapi/linux/perf_event.h'
   diff -u tools/include/uapi/linux/perf_event.h include/uapi/linux/perf_event.h
   Warning: Kernel ABI header at 'tools/arch/x86/include/asm/cpufeatures.h' differs from latest version at 'arch/x86/include/asm/cpufeatures.h'
   diff -u tools/arch/x86/include/asm/cpufeatures.h arch/x86/include/asm/cpufeatures.h
   Warning: Kernel ABI header at 'tools/arch/arm64/include/uapi/asm/perf_regs.h' differs from latest version at 'arch/arm64/include/uapi/asm/perf_regs.h'
   diff -u tools/arch/arm64/include/uapi/asm/perf_regs.h arch/arm64/include/uapi/asm/perf_regs.h
     PERF_VERSION = 6.0.rc3.g17601bfed909
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
