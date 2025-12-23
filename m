Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BC73148B3
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Dec 2025 16:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766506798; cv=none; b=HOJ3kWtxMDbYT/yMsp1Se7JDCI99Y1YrHAA5cBiDxqYwIN7xZVZ7AkXCtLvmnwuWLZ57ubvzZQ/PhoDQIV/2q4L1tMa3mLzi0TmEbfg8HP8ZTQvWIiFINmyrMwHGBffmhkyV42MAN0qAwH+sSOJaatuev77ta1tlGtMEpYFTu9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766506798; c=relaxed/simple;
	bh=YLcRvuF6mqgFL+e6ukzlCXvF2jKA07xf4t+Oftz91hM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K3U/NaoNe3I3USQfckqWJmKEsxlUn7AlmEgXMp5mKINUVWbwQl12Bhu4ptInq9fzdaZt+XcLNd2TmS2eFWCF0+2em8cFBB/XsmyP1hvDoO7JyRyhSMaW8LE835OHekZLcM96juTCx5jyWYSfsQ2UVAPPgUKyZ5kShZMXeCi4q6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=beuewWAH; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="beuewWAH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766506796; x=1798042796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YLcRvuF6mqgFL+e6ukzlCXvF2jKA07xf4t+Oftz91hM=;
  b=beuewWAH9eJJz+zwmPfU5JWjunaB6NVdCnELo3Gy5ypnEl+2ok7GZIi3
   cGOruMwG4xoLQ4F8NW4haK9LWOA8oLKV81Y0GA3RVEYGi1HvYGw73oUK9
   +lug8cnSdikZem43sYHPDYw3LMbwFHAJ3kqyVScKk2dvqSVCBPONMRlzN
   cB+IPSn81SCddyH7wiEUWF06SPcDPqFS7ba6Z6L2bS5CPCHZAGgTXg+Cs
   13EYS5EPfcWl3ihVtcNnRbDbL29KHAZQf327cMflxiNf+QwHnuBnboRJn
   vF533/UTE0TzcFl2JEytrxGHKLjNeXw/s6EdFayGy2ZCgfrFzM5p0GCmp
   A==;
X-CSE-ConnectionGUID: YzfhnJ4SSXiIBzbhN8EW2A==
X-CSE-MsgGUID: DOxdn9pxRCawXQyt20BWoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79472311"
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="79472311"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 08:19:55 -0800
X-CSE-ConnectionGUID: NupMDG97Tr+ss30hJOvDEA==
X-CSE-MsgGUID: A6D25PV4TeCjuAjJghvbxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,171,1763452800"; 
   d="scan'208";a="230475302"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 23 Dec 2025 08:19:55 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vY572-0000000028n-36Vx;
	Tue, 23 Dec 2025 16:19:52 +0000
Date: Wed, 24 Dec 2025 00:19:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 2/3] bitmap: convert self-test to KUnit
Message-ID: <202512240029.TryEP4qn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/bitmap_kunit.c:1340:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251222-bitmap-kunit-convert-v2-2-6a61a5330eff@gmail.com>
References: <20251222-bitmap-kunit-convert-v2-2-6a61a5330eff@gmail.com>
TO: Tamir Duberstein <tamird@kernel.org>
TO: David Gow <davidgow@google.com>
TO: John Hubbard <jhubbard@nvidia.com>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Geert Uytterhoeven <geert@linux-m68k.org>
TO: Madhavan Srinivasan <maddy@linux.ibm.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Nicholas Piggin <npiggin@gmail.com>
TO: Naveen N Rao <naveen@kernel.org>
TO: Yury Norov <yury.norov@gmail.com>
TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Kees Cook <kees@kernel.org>
TO: Christophe Leroy <chleroy@kernel.org>
CC: Muhammad Usama Anjum <usama.anjum@collabora.com>
CC: linux-kernel@vger.kernel.org
CC: linux-m68k@lists.linux-m68k.org
CC: linuxppc-dev@lists.ozlabs.org
CC: linux-kselftest@vger.kernel.org
CC: Tamir Duberstein <tamird@gmail.com>

Hi Tamir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/test_bitmap-extract-benchmark-module/20251222-214306
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251222-bitmap-kunit-convert-v2-2-6a61a5330eff%40gmail.com
patch subject: [PATCH v2 2/3] bitmap: convert self-test to KUnit
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: openrisc-randconfig-r133-20251223 (https://download.01.org/0day-ci/archive/20251224/202512240029.TryEP4qn-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240029.TryEP4qn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512240029.TryEP4qn-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/bitmap_kunit.c:1340:1: sparse: sparse: bad integer constant expression
   lib/bitmap_kunit.c:1340:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   lib/bitmap_kunit.c:1341:1: sparse: sparse: bad integer constant expression
   lib/bitmap_kunit.c:1341:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/bitmap_kunit.c:1342:1: sparse: sparse: bad integer constant expression
   lib/bitmap_kunit.c:1342:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/bitmap_kunit.c:1342:1: sparse: sparse: bad integer constant expression
   lib/bitmap_kunit.c:1342:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +1340 lib/bitmap_kunit.c

794fcbe4ff9460 lib/bitmap_kunit.c Tamir Duberstein 2025-12-22  1339  
5fd003f56c2c58 lib/test_bitmap.c  David Decotigny  2016-02-19 @1340  MODULE_AUTHOR("david decotigny <david.decotigny@googlers.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
