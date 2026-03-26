Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC6CC390238
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Mar 2026 18:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774549128; cv=none; b=V5ej18ldw7uQfgojQ7fLbv652cqyvTSN3ZdOGYWX4XuxzYeuBsi4p1R2zb5Wqtl7eXSTdj5djDtbyPhoIna5e1uPclCC3oyZ9CHSdDiuFJBmG/gXsAE/fUGR+MDa2SsUjhAMiZ5oRlEDYL1GvKhc9FeOrM1FzeMhI48nEE29QdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774549128; c=relaxed/simple;
	bh=90Hsu7l3ffm/2AAEO4RMUmDdUgeMkkyzj5fX7D+AQvM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EC8pEqz1zCTc0mEIh57xOdoOGN8Fl1hp/2wS1Xt3hz4FPh3NHis/1ZyM9EtZ4l6/ySAnyN9Pf1PGgye1V17U0Sm9xWsRkImYkppBQcO6wD8psMSyeToXes/1+3lneLJfvDGjj6dFoQZsF53y3r79gmwXQ2MjUsn1JuVyU54u4ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RYZ9/HQ2; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RYZ9/HQ2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774549126; x=1806085126;
  h=date:from:to:cc:subject:message-id;
  bh=90Hsu7l3ffm/2AAEO4RMUmDdUgeMkkyzj5fX7D+AQvM=;
  b=RYZ9/HQ2eFFt0+SqSLDflXqs+AvbNokRWuQwdOAzCpzgc9bOPQReg1Ie
   pnWalqWb0XH5hGeyaEavM3Jkp7/zt6UB8qlDj+lrXsUP1LBTzfsZM1NJr
   khl/IPObIQ/Ffeux5QN0OToH4rhT447yMccXT0Ic9MJVASAE43hhBVWjp
   Tj8S1guYb4wURyWJKxGmxSCNH1sN9h4+IKvPqgfCSn9HQfrEHXwkdpUuR
   Oi8Nlhul80RyPse/lifL0gWUmVyAWibskIbT31Q0qDkXi/fNCpsrQ8aSA
   byjkaR/PRnQGEXstDytokX+r9xsdGYmxxVopP11218IqAbsh/68FZwiSq
   g==;
X-CSE-ConnectionGUID: crb9vrrcQKC/psn7VnIeMQ==
X-CSE-MsgGUID: Uq9R7i0YRA+dRR4Zr7rm9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75333975"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75333975"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 11:18:45 -0700
X-CSE-ConnectionGUID: YPaxIRLkQkmlg2DD86OY9A==
X-CSE-MsgGUID: tV3jb1JmTAuWoNZjZrV66A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="248456294"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Mar 2026 11:18:44 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5pI1-000000007KL-4BlJ;
	Thu, 26 Mar 2026 18:18:41 +0000
Date: Thu, 26 Mar 2026 19:18:22 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Makefile:63: warning: overriding recipe for target
 'emit_tests'
Message-ID: <202603261951.TW306BAo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   453a4a5f97f0c95b7df458e6afb98d4ab057d90b
commit: 58b33e78a31782ffe25d404d5eba9a45fe636e27 selftests/powerpc: Fix emit_tests to work with run_kselftest.sh
date:   2 years, 6 months ago
:::::: branch date: 79 minutes ago
:::::: commit date: 2 years, 6 months ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260326/202603261951.TW306BAo-lkp@intel.com/config)
compiler: riscv64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260326/202603261951.TW306BAo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603261951.TW306BAo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   make[1]: *** [Makefile:122: tools/testing/selftests/hid/host-tools/sbin/bpftool] Error 2
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets.  Stop.
   Makefile:257: warning: overriding recipe for target 'tools/testing/selftests/kvm/get-reg-list'
   Makefile:252: warning: ignoring old recipe for target 'tools/testing/selftests/kvm/get-reg-list'
>> Makefile:63: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:145: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets specified and no makefile found.  Stop.


vim +/emit_tests +63 Makefile

3812b8c5c5d527 Masahiro Yamada 2019-02-22  59  
066b7ed9558087 Michal Marek    2014-07-04  60  # Beautify output
066b7ed9558087 Michal Marek    2014-07-04  61  # ---------------------------------------------------------------------------
066b7ed9558087 Michal Marek    2014-07-04  62  #
8962b6b475bddc Masahiro Yamada 2022-12-23 @63  # Most of build commands in Kbuild start with "cmd_". You can optionally define
8962b6b475bddc Masahiro Yamada 2022-12-23  64  # "quiet_cmd_*". If defined, the short log is printed. Otherwise, no log from
8962b6b475bddc Masahiro Yamada 2022-12-23  65  # that command is printed by default.
066b7ed9558087 Michal Marek    2014-07-04  66  #
8962b6b475bddc Masahiro Yamada 2022-12-23  67  # e.g.)
8962b6b475bddc Masahiro Yamada 2022-12-23  68  #    quiet_cmd_depmod = DEPMOD  $(MODLIB)
8962b6b475bddc Masahiro Yamada 2022-12-23  69  #          cmd_depmod = $(srctree)/scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
066b7ed9558087 Michal Marek    2014-07-04  70  #
066b7ed9558087 Michal Marek    2014-07-04  71  # A simple variant is to prefix commands with $(Q) - that's useful
066b7ed9558087 Michal Marek    2014-07-04  72  # for commands that shall be hidden in non-verbose mode.
066b7ed9558087 Michal Marek    2014-07-04  73  #
8962b6b475bddc Masahiro Yamada 2022-12-23  74  #    $(Q)$(MAKE) $(build)=scripts/basic
066b7ed9558087 Michal Marek    2014-07-04  75  #
6ae4b9868a8f72 Masahiro Yamada 2022-12-23  76  # If KBUILD_VERBOSE contains 1, the whole command is echoed.
6ae4b9868a8f72 Masahiro Yamada 2022-12-23  77  # If KBUILD_VERBOSE contains 2, the reason for rebuilding is printed.
066b7ed9558087 Michal Marek    2014-07-04  78  #
^1da177e4c3f41 Linus Torvalds  2005-04-16  79  # To put more focus on warnings, be less verbose as default
^1da177e4c3f41 Linus Torvalds  2005-04-16  80  # Use 'make V=1' to see the full commands
^1da177e4c3f41 Linus Torvalds  2005-04-16  81  

:::::: The code at line 63 was first introduced by commit
:::::: 8962b6b475bddc011c414f40ffd02f0ed4e02771 kbuild: print short log in addition to the whole command with V=1

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
