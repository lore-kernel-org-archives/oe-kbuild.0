Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658853C39
	for <oe-kbuild@lists.linux.dev>; Wed, 10 Jul 2024 05:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720590198; cv=none; b=snQFR1JfbzuwLWDaAmZYHkj54AiKwHTG9zDZdNG49vzpKz/r3KWqdzfwLMUirOfzEf/kchqWO7Zo9m9SJS3EUZNS4l0BJvdogzWwglBnd2Z+Xzbvn49ZAQOqWqB9AYBip849bdHYnno+FUAy+/oXkow/9BGlxqtLISn7Q7Fxlc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720590198; c=relaxed/simple;
	bh=buXe2PHk8zh7mCYlXZZyVNS+V4Zk9mRmllbqUB2Gblc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cYKdcsZsMwpDe1FieVuqyTuicaUZEMEFXIz7MiKVR74TAwvLboakC5Qsuima363OQ8bq76HH0gK7GkwMp4LgyMbotl11J6gGonRC90hCJF+xbsQVWHYF7LT4tEf6WtA7GG8UGpvunPtme7qgDX8I3TGV1hTvcc2Y/YUvYGcUf+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ar2zUCN9; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ar2zUCN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720590197; x=1752126197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=buXe2PHk8zh7mCYlXZZyVNS+V4Zk9mRmllbqUB2Gblc=;
  b=ar2zUCN9Dw7YG3pOVfjhBwrM2JImSd417bi/T5Kl9DKhKgDTmhLGZY9f
   8zDmI/q1FxvQIWo7fg59SZHk1bXMwBKe1ea28oV3TTVwSLpBGYUkhUdbm
   Gj8ClSuzYBTYX9zkA/mOcAnv1CYhkhazsUgNhSAuzILVcICWl5xo7McRq
   cRQcN72vHrPDKyH+t7IWzSVpwNu05+buiMEE+ZT9d5OnZbOUM5JKQ+Wz8
   ps1wzUJeKAkW/a4+sHl/eFzhAux1PZURai5QmhFVu254sDb0wTc6TZNwS
   zFgJwsC+AlMlVC3GWIZ3FXZzy3mMUIJcUqM4PSbTAyXd0ev0+Erhua1mQ
   g==;
X-CSE-ConnectionGUID: ECbSa1E1SNGTq0KA9SUGhg==
X-CSE-MsgGUID: KOMN8J8nSHGVg6XQ0tQZjQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11128"; a="21654256"
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="21654256"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2024 22:43:16 -0700
X-CSE-ConnectionGUID: Io3BNr3YRuWnL4kahrMuyQ==
X-CSE-MsgGUID: ezOR2kPeRkGdFRN3MPxI7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,197,1716274800"; 
   d="scan'208";a="52689135"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Jul 2024 22:43:14 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sRQ6i-000XUg-1u;
	Wed, 10 Jul 2024 05:43:12 +0000
Date: Wed, 10 Jul 2024 13:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [android-common:android15-6.6 13711/13775] Makefile:1012: ***
 "Enabling Rust and CFI silently changes the KMI.".  Stop.
Message-ID: <202407101315.jpMVTUp9-lkp@intel.com>
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

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c7b8a41d0f4f3bcecca0ce69965792c0fad27835
commit: 691810c3b9c0c8567ce2f409048b5db2d8890af5 [13711/13775] ANDROID: Makefile: Fail the build if RUST and CFI are both enabled
:::::: branch date: 7 hours ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-123-20240710 (https://download.01.org/0day-ci/archive/20240710/202407101315.jpMVTUp9-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240710/202407101315.jpMVTUp9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407101315.jpMVTUp9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> Makefile:1012: *** "Enabling Rust and CFI silently changes the KMI.".  Stop.
   make[1]: *** [Makefile:252: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:252: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for DRM_MIPI_DSI
   Depends on [n]: HAS_IOMEM [=y] && DRM [=n]
   Selected by [y]:
   - GKI_HIDDEN_DRM_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_VMASTER
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for CAN_RX_OFFLOAD
   Depends on [n]: NETDEVICES [=y] && CAN_DEV [=n] && CAN_NETLINK [=n]
   Selected by [y]:
   - GKI_HIDDEN_MCP251XFD_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_IEC958
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_SOC_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_JACK_INPUT_DEV
   Depends on [n]: SOUND [=y] && SND [=n] && SND_JACK [=y]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_PCM_ELD
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y]
   WARNING: unmet direct dependencies detected for SND_INTEL_NHLT
   Depends on [n]: SOUND [=y] && SND [=n]
   Selected by [y]:
   - GKI_HIDDEN_SND_CONFIGS [=y] && ACPI [=y]


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
