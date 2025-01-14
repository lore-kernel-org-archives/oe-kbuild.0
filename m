Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C7E0224B1A
	for <oe-kbuild@lists.linux.dev>; Tue, 14 Jan 2025 13:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736860793; cv=none; b=M2nkIuv+oToTOIygPGD72lGN6sjBOfR2F9RQXLpXnZk5UbK8jHZhv8hNnVOpr7sHTx8u86lMpFvaF0A5DViaddRXmGHPg289rlKOKLkCIwd9UfkgCfbMW+4adKKxuReF7ef631yQWlUEJ8HOIjN03UxaFNhU8CBdaYzikBZoOQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736860793; c=relaxed/simple;
	bh=1/5BeOq5SkPchgAhAkBymMSXNIHcPpHah7Mfre69kDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IQxT15l2mcrzwTFoU5xCBzUiDHV10iECp3rEt0x5GZSYtRB29FxMmo9fZz7TbefU6IhVe7WfVlMxbfzRz2bhgChIAg2y7Bg7Nu6e2DQoZtUb/etZFZlfwwNqrFgRdsTt0Z7YwtFs8HhKcaJvEsx7cVpLevZqri1cv7guWZnlDW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Jpog+on6; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Jpog+on6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736860791; x=1768396791;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1/5BeOq5SkPchgAhAkBymMSXNIHcPpHah7Mfre69kDE=;
  b=Jpog+on60GUHhtaHmKCv9YJ6G7nhBp/prsl82f7tsG1rggRbZMObhAQV
   42eFWW0NG/X82njSu3hlmCpTUbtoi0d3bVsyYKtXf1fFoUVCleKUUJdZt
   DZ2ThforCkTL4w+rCEUy9SAxsMjFSlMZzdbkyb2mwuTimcLDUwbsFjoxK
   jiqmg4kl6STqIWirEiQUJ41SkbD3B+vUwOXVq2dU/8gS3ZH0l/jVlHsw4
   0FJkXL88GjXtJm17js4iMYWpq/CU65S1pa+FTMxnJrD1MJ8ZmMOLaL4Qy
   fhDZN3nraXya9xm7KOElOID4RkYF72bFuXklPec0RAtMg+FzDhWYxcPwn
   g==;
X-CSE-ConnectionGUID: HE3NbcN/Q3SLpDJlm5D/2w==
X-CSE-MsgGUID: H/Emk9WlQ6u6Oe3XNMNezw==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="48562658"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="48562658"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jan 2025 05:19:50 -0800
X-CSE-ConnectionGUID: 3qiUVYASRCGtHtMIANNtrg==
X-CSE-MsgGUID: VJLxxnSzSimvUvfiENWzOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,314,1728975600"; 
   d="scan'208";a="104966849"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Jan 2025 05:19:50 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXgpf-000OY7-27;
	Tue, 14 Jan 2025 13:19:47 +0000
Date: Tue, 14 Jan 2025 21:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/sh/drivers/pci/fixups-rts7751r2d.c:32: multiple definition of
 `pcibios_map_platform_irq';
 arch/sh/drivers/pci/fixups-titan.o:arch/sh/drivers/pci/fixups-titan.c:29:
 first defined here
Message-ID: <202501142102.vCaQ8U3v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Arnd Bergmann <arnd@arndb.de>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Nick Desaulniers <ndesaulniers@google.com>
CC: Masahiro Yamada <masahiroy@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c45323b7560ec87c37c729b703c86ee65f136d75
commit: f9b3cd24578401e7a392974b3353277286e49cee Kconfig.debug: make DEBUG_INFO selectable from a choice
date:   2 years, 10 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 2 years, 10 months ago
config: sh-buildonly-randconfig-r006-20221110 (https://download.01.org/0day-ci/archive/20250114/202501142102.vCaQ8U3v-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250114/202501142102.vCaQ8U3v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501142102.vCaQ8U3v-lkp@intel.com/

All errors (new ones prefixed by >>):

   sh4-linux-ld: arch/sh/drivers/pci/fixups-rts7751r2d.o: in function `pcibios_map_platform_irq':
>> arch/sh/drivers/pci/fixups-rts7751r2d.c:32: multiple definition of `pcibios_map_platform_irq'; arch/sh/drivers/pci/fixups-titan.o:arch/sh/drivers/pci/fixups-titan.c:29: first defined here
   sh4-linux-ld: warning: arch/sh/lib/udivsi3_i4i-Os.o: missing .note.GNU-stack section implies executable stack
   sh4-linux-ld: NOTE: This behaviour is deprecated and will be removed in a future version of the linker


vim +32 arch/sh/drivers/pci/fixups-rts7751r2d.c

37c8ac361efdba Paul Mundt     2009-04-20  30  
2b8ff9f2769135 Matthew Minter 2017-07-31  31  int pcibios_map_platform_irq(const struct pci_dev *pdev, u8 slot, u8 pin)
37c8ac361efdba Paul Mundt     2009-04-20 @32  {
37c8ac361efdba Paul Mundt     2009-04-20  33  	if (mach_is_lboxre2())
37c8ac361efdba Paul Mundt     2009-04-20  34  		return lboxre2_irq_tab[slot];
37c8ac361efdba Paul Mundt     2009-04-20  35  	else
37c8ac361efdba Paul Mundt     2009-04-20  36  		return rts7751r2d_irq_tab[slot];
37c8ac361efdba Paul Mundt     2009-04-20  37  }
37c8ac361efdba Paul Mundt     2009-04-20  38  

:::::: The code at line 32 was first introduced by commit
:::::: 37c8ac361efdbae969eff1a603bc39412d3e873f sh: pci: Consolidate lboxre2 and r2d IRQ fixups.

:::::: TO: Paul Mundt <lethal@linux-sh.org>
:::::: CC: Paul Mundt <lethal@linux-sh.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
