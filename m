Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE4A42AB7
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 00:14:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765498500; cv=none; b=C8ruk2YViKv9SKGJHRovzviDP/boMiTaWWntIoS0YwjRnhTS+vul9tSggEeJzl2zTi8ulToHtTIWXv4qt9ciR6QaFHAZuBfwvH0JApGiRocCO49aDnYyLHWeqJmtCq5l2saoR2CDvLkEbstQlbmVSVeJ5hVgV+eZOKr/9HGrKPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765498500; c=relaxed/simple;
	bh=JmuH834CglHvl1FJDneIy5H/jR0t5SFQhl+44VmiyPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U3quMrkssQOcjUqufkjiZ2lJCnq2Jq7n4hPMymOWely4PSkJH4MaVBlFFnsgEx9wBoqiB8gAOb5uS61k0qsGRKAXlpaZCGXrPTPQJZua13HQwSncJC0vnGGIyB5NjUF0aQU7Z6u7g+bx6CAzZPI9/9XcrWhDE1JfzJoOJx2ne3o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eeP1SBvQ; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eeP1SBvQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765498498; x=1797034498;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JmuH834CglHvl1FJDneIy5H/jR0t5SFQhl+44VmiyPY=;
  b=eeP1SBvQ862CW+qs9fKmq774uZkleh6zXvxHwUWjl4e/iVSwziqRK6k9
   SGGNp8gani40msrbGqFtZkYF5AjN6A6j9S5TeaGcmVOtn+4o6SAnb8yDc
   g4nntUVzhCPnd6wtmhJC9YTu2k76+EVajDkK4KhZWcIC6QembZKL6udku
   n1LdqVMTbxunFT0yONWByEfGQibh6eIFSHaLv1jt6u6Gex5vTsTsWP11F
   Fz5jREslREYbqIEca/1OspqOd37WxKZxcJlbEv2k7yvQ7Ulcn4FgB0mJT
   QZAF56G+aXEg2jjQBAEfUX8fWVpoPgq7ul/XxWAIp61OPD7gFxcjl1Upz
   A==;
X-CSE-ConnectionGUID: E9JuiTlgTICIJZBUH0tyHw==
X-CSE-MsgGUID: v4+Q7aR6RX+hKovs4KFxUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="78954369"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="78954369"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 16:14:57 -0800
X-CSE-ConnectionGUID: msBbkIqHSTKbxuQHvwdUig==
X-CSE-MsgGUID: gacbgTIESTCI1TORQ2GktQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 11 Dec 2025 16:14:55 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTqo9-000000005Df-0gCX;
	Fri, 12 Dec 2025 00:14:53 +0000
Date: Fri, 12 Dec 2025 08:14:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: vmlinux.o: warning: objtool: do_ppb_xxlock+0x166: cfi_send_gen_cmd()
 missing __noreturn in .c/.h or NORETURN() in noreturns.h
Message-ID: <202512120805.OIFpQPzB-lkp@intel.com>
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
TO: Josh Poimboeuf <jpoimboe@kernel.org>
CC: Peter Zijlstra <peterz@infradead.org>

Hi Josh,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: acae6b5bfffedc0440837c52584696dadb2fa334 objtool: Improve __noreturn annotation warning
date:   9 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 9 months ago
config: x86_64-randconfig-161-20251212 (https://download.01.org/0day-ci/archive/20251212/202512120805.OIFpQPzB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512120805.OIFpQPzB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512120805.OIFpQPzB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: fixup_sst39vf_rev_b+0x130: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_resume+0x19b: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_check_err_status+0x175: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: chip_ready+0x15e: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_panic_write_oneword+0x114: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_oneword_once+0x114: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fixup_sst38vf640x_sectorsize+0x13d: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: put_chip.constprop.0+0x2ce: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: get_chip+0x4e1: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_oneword+0x2e5: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_atmel_unlock+0x17b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_atmel_lock+0x184: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fwh_xxlock_oneblock+0x16d: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_otp_lock+0x1a1: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_erase_chip+0x32b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_buffer+0x19b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_erase_oneblock+0x32b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
>> vmlinux.o: warning: objtool: do_ppb_xxlock+0x166: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_read+0x330: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_otp_walk+0x267: cfi_qry_mode_on() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_reset.isra.0+0x188: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_amdstd_secsi_read+0x3ba: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_otp_write+0x14b: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_read_secsi_onechip+0x285: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_getlockstatus_oneblock+0xc7: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: inval_cache_and_wait_for_operation+0xac: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_suspend+0x255: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: put_chip.constprop.0+0x1e4: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: chip_ready+0xde: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_erase_oneblock+0xeb: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_oneword.constprop.0+0x135: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_buffer+0x1b2: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_reset.isra.0+0x188: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fixup_LH28F640BF+0x116: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_resume+0x1e7: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_point+0x3e1: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_intelext_read+0x34f: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: fwh_xxlock_oneblock+0x174: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_xxlock_oneblock+0x101: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: jedec_reset+0x95: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: cfi_jedec_setup+0x3c2: cfi_build_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: jedec_probe_chip+0x2ec: cfi_send_gen_cmd() missing __noreturn in .c/.h or NORETURN() in noreturns.h
   vmlinux.o: warning: objtool: do_write_buffer.cold+0x0: unreachable instruction
   vmlinux.o: warning: objtool: jedec_probe_chip.cold+0x0: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
