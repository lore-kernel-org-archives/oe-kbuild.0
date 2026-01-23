Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CF84335BA8
	for <oe-kbuild@lists.linux.dev>; Fri, 23 Jan 2026 08:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769155366; cv=none; b=Ak7oGlgAEmmtf+uNuNoXZRgJIeAke6M4vxxKDJH/EWQoPLRg80COg1rQTV76qZJCdFIPZWBEUCT+1M/t1xZqz/T5TVMlRUcaArUhGIrot4vJTa4qyllhXCK0Jze7XokG/Wag194Dew4DFNWKxdPmY/hw/vxNaJSlzF+lJsroHZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769155366; c=relaxed/simple;
	bh=1ttreaqfvDXkP+IRgBoRip0whvvHDpw/MZASRenZAJs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fZCVllkmB1Rc/3yv2kbFlTqyNZwBUz7UAvuPZ8N2Po1Q9hHjwUhtYQQC85uZqka55pO1X93m0jnwRAwf5CCVXQLEalrzdAfOQojGmsYaJazYyZeKK/AZpaQgpLdbUgXNlMj8vWVGJqMDooZ8b3zW02nh0c1+tMC1pFzi6GUXBUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T5ARkCva; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T5ARkCva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769155365; x=1800691365;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1ttreaqfvDXkP+IRgBoRip0whvvHDpw/MZASRenZAJs=;
  b=T5ARkCvaeYJHrSeFSmZ8e97MdIp4wX6u1IbTDzmLhdgeBqvN9BpIXRTT
   jAy7GNLvLVkQwTIkw2Bvo0Go6fUGHDT3G5g9iiLH+/YnT4YdnJndd3Qn1
   JGi82pSCGCCC65vf+VDS24WAxVD64z6QGu5fYLX7GBzmIHKgmvieJwhIr
   /JpFLVYbM7wNTxLrZfwmOR1M0ad/jy9z6ukrRmO7tq1TIawbvP2omgORy
   nK29uNcUUH8Da0nX+bUe6g5U/RrVdsn3Imi2QogHl9iVdu1lpdnC+3kZR
   iD1YFL+eyc/4aukcu0bL9Uv+OM91uarsoIkVkyt4AoIftJHkA++CYLmIV
   w==;
X-CSE-ConnectionGUID: IxeTCuR2SRKDd/HsS3rYBw==
X-CSE-MsgGUID: h+cnEwUxS/enpFKUBL0q+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11679"; a="81518628"
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="81518628"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 00:02:44 -0800
X-CSE-ConnectionGUID: xZrNkB6ASHyMFXXV/Vbofg==
X-CSE-MsgGUID: H8d5dSMAQtKSx1n4H8ITUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,248,1763452800"; 
   d="scan'208";a="206078523"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 23 Jan 2026 00:02:43 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjC7s-000000000gH-2IWu;
	Fri, 23 Jan 2026 08:02:40 +0000
Date: Fri, 23 Jan 2026 09:01:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] selftests/liveupdate: add end to end test infrastructure
 and scripts
Message-ID: <202601230909.vplkbEgo-lkp@intel.com>
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
In-Reply-To: <20260122214427.3568647-1-jordanrichards@google.com>
References: <20260122214427.3568647-1-jordanrichards@google.com>
TO: Jordan Richards <jordanrichards@google.com>
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
TO: Mike Rapoport <rppt@kernel.org>
TO: Pratyush Yadav <pratyush@kernel.org>
TO: Shuah Khan <skhan@linuxfoundation.org>
CC: Jason Miu <jasonmiu@google.com>
CC: David Matlack <dmatlack@google.com>
CC: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: Jordan Richards <jordanrichards@google.com>

Hi Jordan,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0f61b1860cc3f52aef9036d7235ed1f017632193]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Richards/selftests-liveupdate-add-end-to-end-test-infrastructure-and-scripts/20260123-061926
base:   0f61b1860cc3f52aef9036d7235ed1f017632193
patch link:    https://lore.kernel.org/r/20260122214427.3568647-1-jordanrichards%40google.com
patch subject: [PATCH] selftests/liveupdate: add end to end test infrastructure and scripts
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260123/202601230909.vplkbEgo-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260123/202601230909.vplkbEgo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601230909.vplkbEgo-lkp@intel.com/

All errors (new ones prefixed by >>):

>> luo_test_utils.c:16:10: fatal error: 'sys.h' file not found
      16 | #include <sys.h>
         |          ^~~~~~~
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
