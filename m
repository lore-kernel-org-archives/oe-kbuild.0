Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA04839FDF
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 16:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U3Jmi4dr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700066741; x=1731602741;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u0Mlaw/vVG96D48wjNg/rYdU9d1RwDz/uGn2yGOwSwk=;
  b=U3Jmi4drCDx3vfIZdfZ8uE6tcYT9Tu4xhvkdvKM90DJBpsk90MdYDbIW
   aejBs5SX8zb0W8k4FTUW71deZoaIbsjSnU+pFI5xzXD7UvX+XYxu7ZFCS
   +LCJKcFn75+zO0hWyJsMW0/wP50yRzKDLSu9VPk3SaKZyhGSzXt/0IZZI
   AgXfa92Jvp1/R2fLyesPUUeyyDcgi8xcxB6ydKyyvDu/LiSrKSaYprBS+
   xbc5hayIzDJwyHP6NSLvp8BieK1EKXmyOoN/q3YLIJXyB3soN7yzahxb9
   bzqaOuku5UfGd0TZ8lxJ6o0KcVSHiOBIeuuigV7PYzqWvoYQ/znxJa26u
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="9548041"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="9548041"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 08:45:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="938534367"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="938534367"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 15 Nov 2023 08:45:38 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3J1E-0000Zz-28;
	Wed, 15 Nov 2023 16:45:36 +0000
Date: Thu, 16 Nov 2023 00:30:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: diff -u tools/include/uapi/linux/kvm.h include/uapi/linux/kvm.h
Message-ID: <202311160035.vYBmIuFJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "fbc 17601bfed909fa080fcfd227b57da2bd4dc2d2a6 and parent 8929bc9659640f35dd2ef8373263cbd885b4a072 have different kconfig"
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Marc Zyngier <maz@kernel.org>
CC: Gavin Shan <gshan@redhat.com>
CC: Peter Xu <peterx@redhat.com>

Hi Marc,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: 17601bfed909fa080fcfd227b57da2bd4dc2d2a6 KVM: Add KVM_CAP_DIRTY_LOG_RING_ACQ_REL capability and config option
date:   1 year, 2 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 1 year, 2 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231116/202311160035.vYBmIuFJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311160035.vYBmIuFJ-lkp@intel.com/

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
