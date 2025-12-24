Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ECB23EA87
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 02:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766542830; cv=none; b=lS3H5VkRev09zBUDCq09feiFH/ZCaYhoYTk6tqMYT1QTSIfJZcxpHuJHCxJTGDZKHZ6i0Jz3SEY0Ts4HultYlHXNNT+quzANDiYa6Utm/DS4u9IAXF03Mu+wspl9t+bs4jlypP3Y4zNsHLQlMBztrepOfCNKu2yASWnxnf1j7fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766542830; c=relaxed/simple;
	bh=lr1ySvydKnppRPobhL0lTy+jgwuLOf4ZlQOpOsc4BoI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ADyaA3m4YsrQtyWAS6+l9KCG3LgXdbseWuWPrTDqW2htnU1W5bJ4muMWvOoH4KydgcLB00sBQAEa3oBKn/f2SB99OwLeDW9wgsz5ULnCgV6HH0VytYg9WMD3vgx4qW4Ma/xPJDe2p6UIBUnJ/3RqZDeZslkKWKWgsiQ0HTZjWNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqE0bREE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqE0bREE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766542828; x=1798078828;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lr1ySvydKnppRPobhL0lTy+jgwuLOf4ZlQOpOsc4BoI=;
  b=fqE0bREE3MV8QTT+IihApKhi/horRieDAdKQmvsJR7Ym3b3kfTHJjUSO
   D3B6jdO77EjlEhrK9x9oDR8HjPL8wSt0ZUJZli0mI0gkVRgmYE3BoQc1F
   l/BsRD850KgfXC+xo5onmJzAjqqqyNtK/cTs6QHPVIlMx90MgO49AzK6U
   irJYYy2DaXFIjeLN3fGZaV2SzGIhNhg/3buHUgQWJ46PLn5eNnWt0Ygqo
   v3KSx62WdstKTaqu8pEATkR0X3JSy/q+zRaPHnyJkt/mqNryqmf4jlLyd
   L594QPrvC0NeP+y+wqeY0OE8w7GCmTjq/NoDlMcTa05sjfkQq9xlOAF3Z
   w==;
X-CSE-ConnectionGUID: SDYhJn2bQ12JpUUrVTiW9g==
X-CSE-MsgGUID: 13g4DNC5QvS8xZ40hxVdcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="78696138"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="78696138"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 18:20:28 -0800
X-CSE-ConnectionGUID: nqiGzy/+SmOlBZk2gj1o1Q==
X-CSE-MsgGUID: mMBLMFiKT/aVmXBDb5T18w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="200803519"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 23 Dec 2025 18:20:26 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYEU6-000000002aD-1dqd;
	Wed, 24 Dec 2025 02:20:21 +0000
Date: Wed, 24 Dec 2025 10:19:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/3] test_bitmap: extract benchmark module
Message-ID: <202512240906.xLkpixHL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: lib/bitmap_benchmark.c:87:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251222-bitmap-kunit-convert-v2-1-6a61a5330eff@gmail.com>
References: <20251222-bitmap-kunit-convert-v2-1-6a61a5330eff@gmail.com>
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
CC: Alexander Potapenko <glider@google.com>

Hi Tamir,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 8f0b4cce4481fb22653697cced8d0d04027cb1e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Tamir-Duberstein/test_bitmap-extract-benchmark-module/20251222-214306
base:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
patch link:    https://lore.kernel.org/r/20251222-bitmap-kunit-convert-v2-1-6a61a5330eff%40gmail.com
patch subject: [PATCH v2 1/3] test_bitmap: extract benchmark module
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: microblaze-randconfig-r111-20251224 (https://download.01.org/0day-ci/archive/20251224/202512240906.xLkpixHL-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251224/202512240906.xLkpixHL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512240906.xLkpixHL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/bitmap_benchmark.c:87:1: sparse: sparse: bad integer constant expression
   lib/bitmap_benchmark.c:87:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   lib/bitmap_benchmark.c:88:1: sparse: sparse: bad integer constant expression
   lib/bitmap_benchmark.c:88:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   lib/bitmap_benchmark.c:89:1: sparse: sparse: bad integer constant expression
   lib/bitmap_benchmark.c:89:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   lib/bitmap_benchmark.c:89:1: sparse: sparse: bad integer constant expression
   lib/bitmap_benchmark.c:89:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +87 lib/bitmap_benchmark.c

98008eee3b7dd0 Tamir Duberstein 2025-12-22  86  
98008eee3b7dd0 Tamir Duberstein 2025-12-22 @87  MODULE_AUTHOR("Alexander Potapenko <glider@google.com>");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
