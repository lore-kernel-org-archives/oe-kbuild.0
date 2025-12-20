Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AB332F0C7E
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 16:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766246950; cv=none; b=eZ4rfd8q9M6/Wqvz7pG5ylxAUjtsT8yPr+LGg8f2/tXFRb7qthV3aJdecFhE1NOnhA2/pcqgb19VYJd33ocJOmQg5XQPBiuaIqarMuL7pqCGwTC8kAl5D3Yd9GyeVzD9WV31QweZ98RhS0fzN4gC1JvLLno7XtakmCYQnz9KN4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766246950; c=relaxed/simple;
	bh=+gY/AmvxzxnnJZkoTZPGG77n+Trw6EBKa+IIPhZOH3o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D7ynLpg9WFnbF/6KgZfXHZNsEO590MvR3zpUQq4vw2Dski2Gpibk0Ch5g1r5qndnvYMCW/3bDOlLLFUNAngK64M5GLU+PDB2DLqzNi79VigFaDj3Z0nqSZv9o7ySp1T+p+ATNWuihcZI4gcPrp0qz2TS+sKiokAl/FyO12pFgYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jCFFqExm; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jCFFqExm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766246949; x=1797782949;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+gY/AmvxzxnnJZkoTZPGG77n+Trw6EBKa+IIPhZOH3o=;
  b=jCFFqExm1Ps9VCIePYYPjTaHBqcqGoKvh3Ly3ZOdKMrxywfZznLmPWia
   VD5JyQIyFjLYKoQNC7JQHvJr1ENEVrPw1GvluN9nMFYft1FXckbTyZUzX
   Q8wHW9h+B+SiLLZUk5W45IuP997GjSByNpJKq4PmZeqsXWGS5Rsc1Jcky
   0Pte6/bxk1CNoEvQp3d5O6CWFB+8pG8B0jrhXIFcevHf1+QLi0Zfqbcmz
   L9aR3rG85o4ZAD4HxEtjt1tI7GkONpKi1nsREVOVVSLG2xP/LdwnY1jv+
   wX4sMh4fkYgpksgF8HZv4xKeUT2dt0DCs8n+cHl4X5WcAB90046mkQ7be
   Q==;
X-CSE-ConnectionGUID: wtZ2tYgXSMynxRxX0ZGQzw==
X-CSE-MsgGUID: r40bh/T2QH2+tf+oqPT6ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11648"; a="68055678"
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="68055678"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 08:09:07 -0800
X-CSE-ConnectionGUID: ayaC1OpORzCZRawI8vTlfg==
X-CSE-MsgGUID: sDHQf1dST4+Gf23ipcoeag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="203264153"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 20 Dec 2025 08:08:52 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWzVZ-000000004hg-29ls;
	Sat, 20 Dec 2025 16:08:41 +0000
Date: Sat, 20 Dec 2025 17:08:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/4] selftests/mm: pass down full CC and CFLAGS to
 check_config.sh
Message-ID: <202512201709.Sf9muez8-lkp@intel.com>
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
In-Reply-To: <20251216142633.2401447-3-kevin.brodsky@arm.com>
References: <20251216142633.2401447-3-kevin.brodsky@arm.com>
TO: Kevin Brodsky <kevin.brodsky@arm.com>
TO: linux-mm@kvack.org
TO: linux-kselftest@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Kevin Brodsky <kevin.brodsky@arm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@kernel.org>
CC: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Mark Brown <broonie@kernel.org>
CC: Ryan Roberts <ryan.roberts@arm.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: John Hubbard <jhubbard@nvidia.com>

Hi Kevin,

kernel test robot noticed the following build errors:

[auto build test ERROR on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Kevin-Brodsky/selftests-mm-remove-flaky-header-check/20251216-222816
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251216142633.2401447-3-kevin.brodsky%40arm.com
patch subject: [PATCH 2/4] selftests/mm: pass down full CC and CFLAGS to check_config.sh
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: powerpc64-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251220/202512201709.Sf9muez8-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512201709.Sf9muez8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512201709.Sf9muez8-lkp@intel.com/

All errors (new ones prefixed by >>):

>> /tmp/tmp.JCMHMZBFCU.c:1:10: fatal error: sys/types.h: No such file or directory
       1 | #include <sys/types.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
