Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E13A93E
	for <oe-kbuild@lists.linux.dev>; Thu, 24 Aug 2023 22:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692915255; x=1724451255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E6lcQhEPYIELf2HQkaZ1kCj68EJJMLuFD+Wfusz2xQg=;
  b=IasQ4Evab7YSALNARFRdaS06IR4P4Dl6Ff8+jB3Sg6I1vnJR705x2EoP
   IUpSWzzjsonBu8Yor3iPR1nAGetxR20OGP2H0M7Q/MN8q2sF9y+tSCWOk
   2sn6mLb/YVWwqLkkKmXBanV4u3tG0iaNRxgZsouxP89CyBXYDLcWvInZl
   pJUS/odP3w0L2SsepRmf5Onp8RxdZwNEJTIJ1svt6YTZeefhMmPRtOFKg
   PJYDc+49T+pMNME2hkB4/XOhcaLtpYUf4vBJ90erI0BXQizDMUTGXE12t
   HPxNgYhJqwYHxPjq93S9FhHjwVDyxn7D8ebLBhX3a0iEED2jgUoFGKLrV
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="405570391"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="405570391"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2023 15:14:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10812"; a="827341773"
X-IronPort-AV: E=Sophos;i="6.02,195,1688454000"; 
   d="scan'208";a="827341773"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 24 Aug 2023 15:14:10 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZIaf-0002zv-0S;
	Thu, 24 Aug 2023 22:14:09 +0000
Date: Fri, 25 Aug 2023 06:13:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android-mainline 262/4546] test_set_error_stamp: rm
 /kbuild/obj/consumer/x86_64-randconfig-122-20230825/.reduce_errors/net-socket.c:undefined-reference-to-compat_wext_handle_ioctl
Message-ID: <202308250652.VoOXmnuU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: test_set_error_stamp: rm /kbuild/obj/consumer/x86_64-randconfig-122-20230825/.reduce_errors/net-socket.c:undefined-reference-to-compat_wext_handle_ioctl"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   d5d494baf2b758b2b19326fa7ae6ccb332c00b33
commit: 8a167346a33aa28c6e422739e69abc87f57f81bc [262/4546] ANDROID: net: enable wireless core features with GKI_LEGACY_WEXT_ALLCONFIG
:::::: branch date: 31 hours ago
:::::: commit date: 3 years, 11 months ago
config: x86_64-randconfig-122-20230825 (https://download.01.org/0day-ci/archive/20230825/202308250652.VoOXmnuU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230825/202308250652.VoOXmnuU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308250652.VoOXmnuU-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: arch/x86/lib/csum-copy_64.o: missing .note.GNU-stack section implies executable stack
   ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker
   ld: warning: .tmp_vmlinux1 has a LOAD segment with RWX permissions
   ld: net/socket.o: in function `sock_ioctl':
   net/socket.c:1110: undefined reference to `wext_handle_ioctl'
   ld: net/socket.o: in function `compat_sock_ioctl':
>> net/socket.c:3478: undefined reference to `compat_wext_handle_ioctl'
   ld: net/core/net-procfs.o: in function `dev_proc_net_exit':
   net/core/net-procfs.c:305: undefined reference to `wext_proc_exit'
   ld: net/core/net-procfs.o: in function `dev_proc_net_init':
   net/core/net-procfs.c:289: undefined reference to `wext_proc_init'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for DRM_KMS_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for DRM_GEM_CMA_HELPER
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
