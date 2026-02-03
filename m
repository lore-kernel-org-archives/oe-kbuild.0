Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C683126DD
	for <oe-kbuild@lists.linux.dev>; Tue,  3 Feb 2026 15:14:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770131663; cv=none; b=N+KpS7Wskashhrgb2D/UtUhZEuK4aslU8XBn/WQHyQwdiXOXvrYkqhJgpNnfGJq8v6jFIjK4b0/zmrZihstZ3piTWWP15XwoDT7dX10L3xhALneN1jnhwC+aL85TqqBmPwuVyLVTxalfvct2uyD2j0cc7WL5PdTB5nmpdHfz5rY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770131663; c=relaxed/simple;
	bh=LzsEzW9g3C+qalF8Tk2IvcKimw7DdHWF1TIgVcnFlXo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ymezgnss25ZhZ1Yz9n/txdZgpsU4SeoQHlaJ9hdVfC4mwCyb4T4GYMcRSf+F2iNrPRPMLR4zXUbcpXTij5fLr36U9AjRe1Ur9kCWO9sOsJf2XPbCigypgmxQGCeh+/Uq8KJ7NtSRs46Xk/OG6YB/HQGUySAUNquG1WqMyzcZM84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nLSxMLVA; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nLSxMLVA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770131662; x=1801667662;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LzsEzW9g3C+qalF8Tk2IvcKimw7DdHWF1TIgVcnFlXo=;
  b=nLSxMLVAspQ7wVG14k4OEji6BTdWBZGn/doefAqjYrTYqpt/taCOsOZg
   5Lt93onzhJVYsVEqQnugDt/2YVfsSdWZtbQShfqcvJyAwK4LwpzEwkhpe
   98OYKlkxS/Hn7fxyaapHiaKRiq5yisfzQ1VsKiUPuKuPRv5ZYLy0wSxTy
   rCZsdxibNcSQ03TfaZoGhxsvIGBBZE8ZJ/dzvGpd1OhHjeIY3MwlMdzfM
   tEym2yDatM+ajmXbDQAgvQKX5ph9xbBXV+df8VwR1tKLNe44vt2h6IciH
   2rnxDVPGEiEp+cXo1JcEG5egn3q6edd2awnshjiF+Ou+qjsZa5imAOwG2
   Q==;
X-CSE-ConnectionGUID: AfQLjSWVTvqfm276VVlDoA==
X-CSE-MsgGUID: uQ8GK03cTfSaSHPHLYfzoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11690"; a="88727158"
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="88727158"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2026 07:14:21 -0800
X-CSE-ConnectionGUID: UxjFbHW7Tje/34bgkPn7hg==
X-CSE-MsgGUID: jJXoRpM+TgmHoGDf6lDLfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,270,1763452800"; 
   d="scan'208";a="209296328"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Feb 2026 07:14:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnI6b-00000000glk-1OXV;
	Tue, 03 Feb 2026 15:14:17 +0000
Date: Tue, 3 Feb 2026 23:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/3] integrity: Make arch_ima_get_secureboot
 integrity-wide
Message-ID: <202602032339.B0eUnzSN-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260203041434.872784-2-coxu@redhat.com>
References: <20260203041434.872784-2-coxu@redhat.com>
TO: Coiby Xu <coxu@redhat.com>
TO: linux-integrity@vger.kernel.org
CC: Heiko Carstens <hca@linux.ibm.com>
CC: Alexander Egorenkov <egorenar@linux.ibm.com>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Dave Hansen <dave.hansen@intel.com>
CC: Mimi Zohar <zohar@linux.ibm.com>
CC: Roberto Sassu <roberto.sassu@huawei.com>
CC: Madhavan Srinivasan <maddy@linux.ibm.com>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Nicholas Piggin <npiggin@gmail.com>
CC: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
CC: Vasily Gorbik <gor@linux.ibm.com>
CC: Alexander Gordeev <agordeev@linux.ibm.com>
CC: Christian Borntraeger <borntraeger@linux.ibm.com>
CC: Sven Schnelle <svens@linux.ibm.com>
CC: Thomas Gleixner <tglx@kernel.org>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: "(maintainer:X86 ARCHITECTURE \(32-BIT AND 64-BIT\))" <x86@kernel.org>
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: Dmitry Kasatkin <dmitry.kasatkin@gmail.com>
CC: Eric Snowberg <eric.snowberg@oracle.com>
CC: Paul Moore <paul@paul-moore.com>
CC: James Morris <jmorris@namei.org>
CC: "Serge E. Hallyn" <serge@hallyn.com>
CC: Jarkko Sakkinen <jarkko@kernel.org>
CC: linux-kernel@vger.kernel.org
CC: "(open list:LINUX FOR POWERPC \(32-BIT AND 64-BIT\))" <linuxppc-dev@lists.ozlabs.org>
CC: linux-s390@vger.kernel.org
CC: "(open list:EXTENSIBLE FIRMWARE INTERFACE \(EFI\))" <linux-efi@vger.kernel.org>

Hi Coiby,

kernel test robot noticed the following build warnings:

[auto build test WARNING on zohar-integrity/next-integrity]
[also build test WARNING on s390/features powerpc/next powerpc/fixes efi/next linus/master v6.19-rc8 next-20260202]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Coiby-Xu/evm-Don-t-enable-fix-mode-when-secure-boot-is-enabled/20260203-131538
base:   https://git.kernel.org/pub/scm/linux/kernel/git/zohar/linux-integrity.git next-integrity
patch link:    https://lore.kernel.org/r/20260203041434.872784-2-coxu%40redhat.com
patch subject: [PATCH v2 1/3] integrity: Make arch_ima_get_secureboot integrity-wide
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: s390-defconfig (https://download.01.org/0day-ci/archive/20260203/202602032339.B0eUnzSN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260203/202602032339.B0eUnzSN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202602032339.B0eUnzSN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/s390/kernel/ipl.c:2507:6: warning: no previous prototype for function 'arch_get_secureboot' [-Wmissing-prototypes]
    2507 | bool arch_get_secureboot(void)
         |      ^
   arch/s390/kernel/ipl.c:2507:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
    2507 | bool arch_get_secureboot(void)
         | ^
         | static 
   1 warning generated.


vim +/arch_get_secureboot +2507 arch/s390/kernel/ipl.c

937347ac56bfca Martin Schwidefsky 2019-02-25  2506  
6a32c5e3924dac Coiby Xu           2026-02-03 @2507  bool arch_get_secureboot(void)
6a32c5e3924dac Coiby Xu           2026-02-03  2508  {
6a32c5e3924dac Coiby Xu           2026-02-03  2509  	return ipl_secure_flag;
6a32c5e3924dac Coiby Xu           2026-02-03  2510  }
6a32c5e3924dac Coiby Xu           2026-02-03  2511  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
