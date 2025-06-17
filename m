Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A3DD2E7177
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Jun 2025 13:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750165894; cv=none; b=OQkuxsA2CJHselO0A+00+aDtAkq7M67UtN2SfUfaBJQf1i4JsRKuMCR42manXnHzJVz/5Jxbf3zK4Eco608Xt7xw0YJQckNUJvBNgtF9Qk3/1KTQf0A1sQutuHVi3I4aQxISv7EoCSzGPdvHwSzIAFO89Dd1WYn4rF7zCqaTiOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750165894; c=relaxed/simple;
	bh=YsbNTgGizxtEeXywB0V7Svmmd5hk19HH45Hk6Qfl/NQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NQCFXfHHRDJp9mj6ibbxvBlBFpvu/JNfBiZbOnS0FMvhRzbxowTwHVDqw5+SZB0MnXuB6FX0ShR6KkmWxki7sS88M41VmH7+rcjwuAzxAeCTy7izrTcQFMfkUAXpVhLovQ3XpAHC+KhMZ13Ija0vptls+oD9s0THC67JdAqe2pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iuniaBUw; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iuniaBUw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750165893; x=1781701893;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YsbNTgGizxtEeXywB0V7Svmmd5hk19HH45Hk6Qfl/NQ=;
  b=iuniaBUwnkvJ8dfDpo1gCTf02j3UzKtL6PzMfseVtPaHYYMVe4zDQ5dg
   07bJ6FoMaKKrkpwUvXmmtbktoqEeVy3MohSCrKnMd0bCafV8MEAzJrXXL
   xul/z0iFcr2LkdGdJLovqfgBb1CcgoS8zt1c9RuhzL0850szvDgwBX5i8
   oq5hsOV69zrKPKOaOzYqhA4yByPk8CHlexqqNHuLAbilpNmkjhzcd1Q+Q
   fpeo713rTK59asW6jdegpI0NrUJov7nXorrQlkUyL+PcaJSNObTaC4xws
   HIts8nFqbJlusS8eNv5W9FmAt2VknqvSKF74hqmyBB/gh26XE95EjJVxl
   Q==;
X-CSE-ConnectionGUID: ZPH3xV8GQuSaudqpu3MJ4A==
X-CSE-MsgGUID: 1owC26oHT8eACdnYQCRCdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52322720"
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="52322720"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 06:11:33 -0700
X-CSE-ConnectionGUID: kRV1/OrDQhWlTAF3g7+jow==
X-CSE-MsgGUID: ynGFZhqyRDSh+m5PqtpPbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,243,1744095600"; 
   d="scan'208";a="179644871"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 Jun 2025 06:11:32 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRW65-000Fzk-1F;
	Tue, 17 Jun 2025 13:11:29 +0000
Date: Tue, 17 Jun 2025 21:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/3] vdso: Switch get/put unaligned from packed struct
 to memcpy
Message-ID: <202506172035.SjQ0518f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dynamic relocations are not supported"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250617005800.1410112-2-irogers@google.com>
References: <20250617005800.1410112-2-irogers@google.com>
TO: Ian Rogers <irogers@google.com>
TO: Eric Biggers <ebiggers@google.com>
TO: Yuzhuo Jing <yuzhuo@google.com>
TO: Andy Lutomirski <luto@kernel.org>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Vincenzo Frascino <vincenzo.frascino@arm.com>
TO: Arnaldo Carvalho de Melo <acme@redhat.com>
TO: Al Viro <viro@zeniv.linux.org.uk>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: "Jason A. Donenfeld" <Jason@zx2c4.com>
TO: linux-kernel@vger.kernel.org
TO: linux-perf-users@vger.kernel.org
CC: Ian Rogers <irogers@google.com>

Hi Ian,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.16-rc2 next-20250617]
[cannot apply to tip/timers/vdso acme/perf/core]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ian-Rogers/vdso-Switch-get-put-unaligned-from-packed-struct-to-memcpy/20250617-085916
base:   linus/master
patch link:    https://lore.kernel.org/r/20250617005800.1410112-2-irogers%40google.com
patch subject: [PATCH v1 1/3] vdso: Switch get/put unaligned from packed struct to memcpy
:::::: branch date: 12 hours ago
:::::: commit date: 12 hours ago
config: riscv-alldefconfig (https://download.01.org/0day-ci/archive/20250617/202506172035.SjQ0518f-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250617/202506172035.SjQ0518f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506172035.SjQ0518f-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/kernel/vdso/vdso.so.dbg: dynamic relocations are not supported
   make[3]: *** [arch/riscv/kernel/vdso/Makefile:61: arch/riscv/kernel/vdso/vdso.so.dbg] Error 1
   make[3]: Target 'include/generated/vdso-offsets.h' not remade because of errors.
   make[2]: *** [arch/riscv/Makefile:182: vdso_prepare] Error 2
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
