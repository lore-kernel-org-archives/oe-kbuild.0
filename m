Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11BE61B26F
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Nov 2023 12:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UJHmFSRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700483547; x=1732019547;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gkHzw+H8YCssQiiIGhkqf4NhMl+71BRD709W9hx6DFM=;
  b=UJHmFSRjGnuoARnKUR/gtyeCzIZ007M47GuOxhHqnkjjHupHIiZ1z2NS
   qN9mlFUIz8QspsIwMUuBB9QqyhFkXVPAqec51/AYsoLP9d76Gn6zpcDHZ
   5vJQsvEnVT71B/0vUZNNvStShjWKn5phC5/lk+fdXuswEch9jNAoN4IdD
   U+Y+3ozMOP2zso4HzlBqoPeIBdsMNN+eqtRh5fXqlDN+CYdupVkKBsvwo
   JTD8wBTHUWR4IYaBWxcb8kYEuyL8Xv3zTV0FiRxcTlzfsBEkXsE+lL6+N
   n4dv7p1K0pb4gZqnfSASLrWii3NvxAfVZdU9/zdVByLlGM1LV4d4ZQeCl
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="13161948"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="13161948"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2023 04:32:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10899"; a="801155381"
X-IronPort-AV: E=Sophos;i="6.04,213,1695711600"; 
   d="scan'208";a="801155381"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 20 Nov 2023 04:32:24 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r53Ru-0006Rh-1M;
	Mon, 20 Nov 2023 12:32:22 +0000
Date: Mon, 20 Nov 2023 20:30:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Makefile:63: warning: overriding recipe for target 'emit_tests'
Message-ID: <202311202026.DPcREfHy-lkp@intel.com>
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
TO: Michael Ellerman <mpe@ellerman.id.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   98b1cc82c4affc16f5598d4fa14b1858671b2263
commit: 58b33e78a31782ffe25d404d5eba9a45fe636e27 selftests/powerpc: Fix emit_tests to work with run_kselftest.sh
date:   8 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 8 weeks ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231120/202311202026.DPcREfHy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311202026.DPcREfHy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Makefile:63: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:145: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** uevents: No such file or directory.  Stop.


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
