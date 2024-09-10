Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8B2A1A38EB
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Sep 2024 22:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726007495; cv=none; b=nuOeMngBvpnO7B7GkDknRoC0LX1pw2ixLv7Sg688eDGf+otBdcnqh1lR/qkSDfuO9RuYNPjEfzDbU+sgMcowswdnwNMUreaFLD62BJsL9vukX+w1BWADCMrYEBqGiut4fVxOLcvAHAF0quSookLcqklOW3nkNCHN1l2bWnEYQX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726007495; c=relaxed/simple;
	bh=ejOUB2gwWyCWgIniXfnlU0M2uK2Uy5mkqJh9Pl6nGfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fOMygvzLTcnWFFRoybyrKiIOczQVNXNUWt3B1nA8gMGTv0+uy2E6dPRjT8rPRgEMJDrb0uKn+nRWlcmXm1cryAPCJa6rvs2OqBJ0l16z6x8tupK3tu7/RNfFnkpF3GfiHsUDfGCc/z1XnLRHy8t7Y4cR2KTl5Aw2thShYIkD9KY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PjIetGS4; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PjIetGS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726007494; x=1757543494;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ejOUB2gwWyCWgIniXfnlU0M2uK2Uy5mkqJh9Pl6nGfk=;
  b=PjIetGS4/GY+O2rm496vV4pM3n2UyQ7BZ5UzZEi43FsylAUKfbu2x8M/
   ws1ifXoKk6m74hPZKcIUBtw1bskRJb2ArN0aMx9MRvPwBiq5NFE/DzHb+
   MpfJtEP0sNI7o0FuElQZl6TrmZy5DhQ9NfUFFmb9gUiglYMfu4s+lTBfA
   ZNY1JFzE1KhNtqrHHeFGSnrcUK15UMOhGVOS0c92UZtfzj2wZK83rLi6l
   QBDYBL05QRbQoYAN3xMfr3O0qyL9P010FUHQpsLV/ispRuZdEUVyC8ae5
   5/wrQwoGG0DJZL25+wKztsI1IfjfOkSA0/trCpALRnRMSrLEUPqtSq2wy
   g==;
X-CSE-ConnectionGUID: HsGvVsEwSuGzQhxiDtCoOw==
X-CSE-MsgGUID: YCNVJI7yQge3ejJIIsNr0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="24603549"
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="24603549"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2024 15:31:18 -0700
X-CSE-ConnectionGUID: vBLsCxwRSseRJzNcj//rBQ==
X-CSE-MsgGUID: sQPNHGciSJCNCk559JsL7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,218,1719903600"; 
   d="scan'208";a="67184386"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Sep 2024 15:31:14 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1so9OB-0002mh-2V;
	Tue, 10 Sep 2024 22:31:11 +0000
Date: Wed, 11 Sep 2024 06:30:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6-partner_predev 13711/13796]
 Makefile:1012: *** "Enabling Rust and CFI silently changes the KMI.".  Stop.
Message-ID: <202409110625.kjYILq8L-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only Makefile file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

Hi Will,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android15-6.6-partner_predev
head:   9b5dbabe32a282b68d3599efbbccd7ff6996d9c2
commit: 691810c3b9c0c8567ce2f409048b5db2d8890af5 [13711/13796] ANDROID: Makefile: Fail the build if RUST and CFI are both enabled
:::::: branch date: 14 hours ago
:::::: commit date: 10 weeks ago
config: arm64-randconfig-001-20240911 (https://download.01.org/0day-ci/archive/20240911/202409110625.kjYILq8L-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409110625.kjYILq8L-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409110625.kjYILq8L-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Makefile:1012: *** "Enabling Rust and CFI silently changes the KMI.".  Stop.
   make[1]: *** [Makefile:252: __sub-make] Error 2 shuffle=3046497905
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:252: __sub-make] Error 2 shuffle=3046497905
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for WIRELESS_EXT
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_SPY
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_CORE
   Depends on [n]: NET [=y] && WIRELESS [=n] && (CFG80211_WEXT [=n] || WIRELESS_EXT [=y])
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=n] && (ARM || ARM64 [=y] || COMPILE_TEST [=y]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for INTERCONNECT_QCOM
   Depends on [n]: INTERCONNECT [=n] && ARCH_QCOM [=y]
   Selected by [y]:
   - GKI_HIDDEN_QCOM_CONFIGS [=y] && ARCH_QCOM [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=m] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for WEXT_PROC
   Depends on [n]: NET [=y] && WIRELESS [=n] && PROC_FS [=y] && WEXT_CORE [=y]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for WEXT_PRIV
   Depends on [n]: NET [=y] && WIRELESS [=n]
   Selected by [y]:
   - GKI_LEGACY_WEXT_ALLCONFIG [=y]
   WARNING: unmet direct dependencies detected for BALLOON_COMPACTION
   Depends on [n]: COMPACTION [=n] && MEMORY_BALLOON [=y]
   Selected by [y]:
   - GKI_HIDDEN_MM_CONFIGS [=y]


vim +1012 Makefile

dc5723b02e523b Sami Tolvanen  2020-12-11  1003  
cf68fffb66d60d Sami Tolvanen  2021-04-08  1004  ifdef CONFIG_CFI_CLANG
89245600941e4e Sami Tolvanen  2022-09-08  1005  CC_FLAGS_CFI   := -fsanitize=kcfi
37e90c8aef834f Matthew Maurer 2023-09-15  1006  ifdef CONFIG_RUST
37e90c8aef834f Matthew Maurer 2023-09-15  1007  # If Rust is enabled, this flag is required to support cross-language
37e90c8aef834f Matthew Maurer 2023-09-15  1008  # integer types.
37e90c8aef834f Matthew Maurer 2023-09-15  1009  # This addresses the problem that on e.g. i686, int != long, and Rust
37e90c8aef834f Matthew Maurer 2023-09-15  1010  # maps both to i32.
37e90c8aef834f Matthew Maurer 2023-09-15  1011  # See https://rcvalle.com/docs/rust-cfi-design-doc.pdf for details.
691810c3b9c0c8 Will Deacon    2024-07-03 @1012  $(error "Enabling Rust and CFI silently changes the KMI.")
37e90c8aef834f Matthew Maurer 2023-09-15  1013  CC_FLAGS_CFI   += -fsanitize-cfi-icall-experimental-normalize-integers
37e90c8aef834f Matthew Maurer 2023-09-15  1014  RS_FLAGS_CFI   := -Zsanitizer=kcfi -Zsanitizer-cfi-normalize-integers
37e90c8aef834f Matthew Maurer 2023-09-15  1015  KBUILD_RUSTFLAGS += $(RS_FLAGS_CFI)
37e90c8aef834f Matthew Maurer 2023-09-15  1016  export RS_FLAGS_CFI
37e90c8aef834f Matthew Maurer 2023-09-15  1017  endif
cf68fffb66d60d Sami Tolvanen  2021-04-08  1018  KBUILD_CFLAGS  += $(CC_FLAGS_CFI)
cf68fffb66d60d Sami Tolvanen  2021-04-08  1019  export CC_FLAGS_CFI
cf68fffb66d60d Sami Tolvanen  2021-04-08  1020  endif
cf68fffb66d60d Sami Tolvanen  2021-04-08  1021  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
