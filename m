Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6208C1C8FBA
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Nov 2025 15:31:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763566268; cv=none; b=am9lYylUYLAHDXroYUVgJM9Cr8aCMp5kCLD3JgqjJhZ6ytmaqwQqSL1lNfd3D1JUoOKC6vCZXyXpUIEWcEwYr6rc8M+e0logS4ixNNdU7S5ljELLQny29hQEo7s1VW3jDTxpQrPYDoZpDdK4ylHBqqzdvMMHY7FpeXFgoKd2Hz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763566268; c=relaxed/simple;
	bh=SDm8b91O7yy+hPVy83bdCV0MuMZLIFeBSNLjQFaAONc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B6PYfLTIozZakb6MpRnUf0CPNwZ3ezuXYcRJNHSmmi7IvJzfuRxnqDq34sUIgGKeGw6N2ZDXHTxuyNBnIqIYoWvH3j9n2LWnrX2Gu4tpGKieb5dQ+aBzA2xKGc8lDJMiUujQ0YG+5tAUuixoH1u5ofUoUyVjcxu7MQ+qFFzBE2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FpKuc28i; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FpKuc28i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763566266; x=1795102266;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SDm8b91O7yy+hPVy83bdCV0MuMZLIFeBSNLjQFaAONc=;
  b=FpKuc28iAASBWkkPK2+CjvQOTNswFQF2iAHwdkWljpWjZtnZSbdt/hIL
   OIyemSzcUqxQzS9MeqPk0I3tBFTC3m92wNHKqm7YUtJl52J1jvdgOHbIn
   js2tMPhlu8sANFeEWFHq6e9fHyA36ceOdwKjmNy5muTZZ4IHZ35HBDGra
   6UKZ2UEXZ/nQ7UHJzmFTM3bKizsaSU/JyjI/hlCfht+MdWAUQThSKPEGY
   QBpSdq1Vv6FukzE4h6pLaYG9cOmicCXaln1fmH35i0bkWphfOrCcOnaIJ
   CV2RpdTSKwAC9M2sspeobNqa0UprdkIvtuMRSDvoaRWcxsV/bHJlNKZR6
   A==;
X-CSE-ConnectionGUID: IPbG9zzwSgSK+0Cub2w/qw==
X-CSE-MsgGUID: 7NZepcxxSbmVPgJNczzTaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11618"; a="64618832"
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="64618832"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Nov 2025 07:31:04 -0800
X-CSE-ConnectionGUID: BteBwQNdSCqfJUxRlJC5QA==
X-CSE-MsgGUID: Ehgwu6yQSVKANK3ly6Wj8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,315,1754982000"; 
   d="scan'208";a="190874624"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Nov 2025 07:31:03 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLk97-00031n-1I;
	Wed, 19 Nov 2025 15:31:01 +0000
Date: Wed, 19 Nov 2025 23:30:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 1/3] efi: Wrap screen_info in efi_screen_info so
 edid_info can be added later
Message-ID: <202511192342.UzJyMpC8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "maintainer prefers to test the version of patch actually in efi/next"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251119123011.1187249-6-ardb+git@google.com>
References: <20251119123011.1187249-6-ardb+git@google.com>
TO: Ard Biesheuvel <ardb+git@google.com>
TO: linux-efi@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: Javier Martinez Canillas <javierm@redhat.com>

Hi Ard,

kernel test robot noticed the following build errors:

[auto build test ERROR on efi/next]
[also build test ERROR on tip/x86/core drm-misc/drm-misc-next linus/master v6.18-rc6 next-20251119]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ard-Biesheuvel/efi-Wrap-screen_info-in-efi_screen_info-so-edid_info-can-be-added-later/20251119-203437
base:   https://git.kernel.org/pub/scm/linux/kernel/git/efi/efi.git next
patch link:    https://lore.kernel.org/r/20251119123011.1187249-6-ardb%2Bgit%40google.com
patch subject: [PATCH 1/3] efi: Wrap screen_info in efi_screen_info so edid_info can be added later
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20251119/202511192342.UzJyMpC8-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511192342.UzJyMpC8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511192342.UzJyMpC8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/firmware/efi/efi-init.c: In function 'init_screen_info':
>> drivers/firmware/efi/efi-init.c:79:17: error: 'efi_screen_info' undeclared (first use in this function)
      79 |                 efi_screen_info = *si;
         |                 ^~~~~~~~~~~~~~~
   drivers/firmware/efi/efi-init.c:79:17: note: each undeclared identifier is reported only once for each function it appears in

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for ARCH_HAS_ELF_CORE_EFLAGS
   Depends on [n]: BINFMT_ELF [=n] && ELF_CORE [=y]
   Selected by [y]:
   - RISCV [=y]


vim +/efi_screen_info +79 drivers/firmware/efi/efi-init.c

b8466fe82b7921 drivers/firmware/efi/efi-init.c Arnd Bergmann  2023-10-17  68  
801820bee9bccb drivers/firmware/efi/arm-init.c Ard Biesheuvel 2016-04-25  69  static void __init init_screen_info(void)
801820bee9bccb drivers/firmware/efi/arm-init.c Ard Biesheuvel 2016-04-25  70  {
eb46f4cdac42fa drivers/firmware/efi/efi-init.c Ard Biesheuvel 2025-11-19  71  	struct efi_screen_info *si;
732ea9db9d8a6a drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-10-11  72  
732ea9db9d8a6a drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-10-11  73  	if (screen_info_table != EFI_INVALID_TABLE_ADDR) {
732ea9db9d8a6a drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-10-11  74  		si = early_memremap(screen_info_table, sizeof(*si));
732ea9db9d8a6a drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-10-11  75  		if (!si) {
732ea9db9d8a6a drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-10-11  76  			pr_err("Could not map screen_info config table\n");
732ea9db9d8a6a drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-10-11  77  			return;
732ea9db9d8a6a drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-10-11  78  		}
eb46f4cdac42fa drivers/firmware/efi/efi-init.c Ard Biesheuvel 2025-11-19 @79  		efi_screen_info = *si;
eb46f4cdac42fa drivers/firmware/efi/efi-init.c Ard Biesheuvel 2025-11-19  80  		si->screen_info = (struct screen_info){};
732ea9db9d8a6a drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-10-11  81  		early_memunmap(si, sizeof(*si));
732ea9db9d8a6a drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-10-11  82  
732ea9db9d8a6a drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-10-11  83  		if (memblock_is_map_memory(screen_info.lfb_base))
732ea9db9d8a6a drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-10-11  84  			memblock_mark_nomap(screen_info.lfb_base,
732ea9db9d8a6a drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-10-11  85  					    screen_info.lfb_size);
8b3a149db461d3 drivers/firmware/efi/efi-init.c Ard Biesheuvel 2023-03-12  86  
8b3a149db461d3 drivers/firmware/efi/efi-init.c Ard Biesheuvel 2023-03-12  87  		if (IS_ENABLED(CONFIG_EFI_EARLYCON))
8b3a149db461d3 drivers/firmware/efi/efi-init.c Ard Biesheuvel 2023-03-12  88  			efi_earlycon_reprobe();
732ea9db9d8a6a drivers/firmware/efi/efi-init.c Ard Biesheuvel 2022-10-11  89  	}
801820bee9bccb drivers/firmware/efi/arm-init.c Ard Biesheuvel 2016-04-25  90  }
801820bee9bccb drivers/firmware/efi/arm-init.c Ard Biesheuvel 2016-04-25  91  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
