Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F18A223AB
	for <oe-kbuild@lists.linux.dev>; Sun,  1 Sep 2024 07:08:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725174520; cv=none; b=ceRk2/7icLkK1zNxgbiNoKXJo6ziJcNelVTDnqHOoJGucbmCKVhhSskaxnCWAB4fd3H/7cpT9sfO2chhwJF5U9WBbCJWK7I10KmPQvSIq3nHkoxpnJ1IIfx5yNv0/eTqEAkuRrpTK0owE/KPul2XVM7rm3/c0/b4wl4Ja9Pb7Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725174520; c=relaxed/simple;
	bh=4gJIRjvpLKbqJznpLmlxCDD7RSS74vNnxJEg1iXd71Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oSE2RaWCCHRDXLpT1a8D3FmAhfyN6nud5qlPK5bZcXX2cX7C/oUfsFJK50kgmZ12rvE1oP6GHGfwWrP/7plMPFNZyuaCvH3iym+knNy8VujqhYIfkfbd6dawbGbwJP5q/lnwaTTCMHljEKdjV5Ww72l+4fB5Vw8NO9UzbVvj11k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkbYNTde; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkbYNTde"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725174518; x=1756710518;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4gJIRjvpLKbqJznpLmlxCDD7RSS74vNnxJEg1iXd71Q=;
  b=FkbYNTde1I1edHGw8dI4/Zv2s6kJpoS/HbrEJlGMcmhDAbhdw/7pWSp5
   y0TDVmZrLLgkfZkeVJgiyr6dlBFKMw4ZQD+ZtaHA9IO3FRTIc5Qh+ikB3
   nQU8G7xpAeGoOI2RhaBqbSvfGu5Qwt+f2V4ARXZS0THkGU7y7YgwCxZxO
   XzA0nhE/4lhY+KTsWft6tOf8DbTgloAcsqtygBk62BtXWr8OX+E+NIaFs
   P4leFQVZw+sMh5026pcaYHdY33fAqeHcUFO3B+me88S2Na8cROk/n+jim
   V8ClngXiUloeDbKM1E8xhoRQw115A1YwRHS5C/sFX/pV/ThCzQDWngHX7
   A==;
X-CSE-ConnectionGUID: FUdBZvQQQ5WzIlcrdDgDBA==
X-CSE-MsgGUID: x9K4jPwlTCaWuIuHak7eqQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="41251871"
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="41251871"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2024 00:08:38 -0700
X-CSE-ConnectionGUID: FVcPoik3RACbpTpxcU6EVg==
X-CSE-MsgGUID: u66YIpVkSQiHW909Z6QCVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,193,1719903600"; 
   d="scan'208";a="68420514"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 01 Sep 2024 00:08:36 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skehO-0003VH-1k;
	Sun, 01 Sep 2024 07:08:34 +0000
Date: Sun, 1 Sep 2024 15:07:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [crng-random:jd/vdso-test-harness 10/16] make[1]: *** No rule to
 make target
 'tools/testing/selftests/../../../tools/arch/x86_64/vdso/vgetrandom-chacha.S',
 needed by 'kselftest/vDSO/vdso_test_chacha'.
Message-ID: <202409011438.Lwxidba3-lkp@intel.com>
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
CC: zx2c4@kernel.org
TO: "Jason A. Donenfeld" <zx2c4@kernel.org>

Hi Jason,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/crng/random.git jd/vdso-test-harness
head:   1b7d62798b85917d1c9a3214cb5bed72554774ac
commit: 31d9fc7a210b43f1c91871c994415652fe8eb3d8 [10/16] selftests/vDSO: open code basic chacha instead of linking to libsodium
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240901/202409011438.Lwxidba3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202409011438.Lwxidba3-lkp@intel.com/

All errors (new ones prefixed by >>):

   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.
>> make[1]: *** No rule to make target 'tools/testing/selftests/../../../tools/arch/x86_64/vdso/vgetrandom-chacha.S', needed by 'kselftest/vDSO/vdso_test_chacha'.
   make[1]: Target 'all' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
