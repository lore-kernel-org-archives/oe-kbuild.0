Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844A5156230
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Dec 2025 13:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766238418; cv=none; b=TDQjVALYtaIRH6qDQUukc04FKR1kG3OTWXOVR62DhP5hRXoWvoyo7K+37dpGhQ7YzCyEiLMVGBanTzoDxv3+5TGZOihAoN7cMI2LNlUufJQzDlJ4jCY74KqgYsFfx7v8hwhHqO6WRmWI6isld/bMSz9gqEHTxJROPJGBT3jdKW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766238418; c=relaxed/simple;
	bh=eMcaJDy21qJCK47HwvdGEXrwM5nOwQmiHUEOHauBtSw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=afV3Ekfo9fvq8OEzq3Sd/SqxqSXRcOyMLtut3LIwloNeoq7ampqVMGizk5PSDmtInPDTEQxwpPc227ODlxsvaJWlz/jLWWdjTsumnR/x7UwRE+bSDHf5++HNM0L3/Rgx2RyympljY6heoh/ANezmUh0Yl70FwmJB0+E2nOe1L8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ahay/8yb; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ahay/8yb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766238417; x=1797774417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eMcaJDy21qJCK47HwvdGEXrwM5nOwQmiHUEOHauBtSw=;
  b=ahay/8ybEW9WhiYgJq8qmT07bv2DTyKMEok2qvbwoVgaiMlDi85VWRGw
   CqlgCrf6I+kljP2uqpZZQkEhOFxE7MCmx/+L8I9K0SQomDw/Y+c9Zbe8T
   T+iJA+70yeReqKHr11E4Lq/JAlKMHxyTgZ+FlaOY4AZ5Pw57g3WnUtZ/r
   L1/GV5ln+yT3tCWk6BnfYIYYzpcG7HWcwgLSXvrfsqHT7TJEyi8wtlYWd
   ph0if8tDEdSbpEDvGYivX+rwAn9MtwgWB+Qe27lTtWQ8/udBOlholxADx
   K+MaBupvPMGaO6L2ekDAYw0oKfqu/COE5y7qd797ngkbVatr/3PFfAmvV
   A==;
X-CSE-ConnectionGUID: x7a00VN2QmOW/zcJnB8ukQ==
X-CSE-MsgGUID: 967KOXwtRqSw1hOP862BYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="68110710"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="68110710"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2025 05:46:56 -0800
X-CSE-ConnectionGUID: U2A5xAO5RbSOoDOBaU87pQ==
X-CSE-MsgGUID: X07Oav+VRL62ETBZXif0mQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,164,1763452800"; 
   d="scan'208";a="198864815"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 20 Dec 2025 05:46:55 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWxIK-000000004Zv-3VQf;
	Sat, 20 Dec 2025 13:46:52 +0000
Date: Sat, 20 Dec 2025 21:46:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 2/2] mm/vmalloc: Add attempt_larger_order_alloc parameter
Message-ID: <202512202146.jHJbkIda-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/vmalloc.c:3714:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251216211921.1401147-2-urezki@gmail.com>
References: <20251216211921.1401147-2-urezki@gmail.com>
TO: "Uladzislau Rezki (Sony)" <urezki@gmail.com>
TO: linux-mm@kvack.org
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Vishal Moola <vishal.moola@gmail.com>
CC: Ryan Roberts <ryan.roberts@arm.com>
CC: Dev Jain <dev.jain@arm.com>
CC: Baoquan He <bhe@redhat.com>
CC: LKML <linux-kernel@vger.kernel.org>
CC: Uladzislau Rezki <urezki@gmail.com>

Hi Uladzislau,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Uladzislau-Rezki-Sony/mm-vmalloc-Add-attempt_larger_order_alloc-parameter/20251217-052105
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20251216211921.1401147-2-urezki%40gmail.com
patch subject: [PATCH 2/2] mm/vmalloc: Add attempt_larger_order_alloc parameter
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: openrisc-randconfig-r113-20251217 (https://download.01.org/0day-ci/archive/20251220/202512202146.jHJbkIda-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251220/202512202146.jHJbkIda-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512202146.jHJbkIda-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/vmalloc.c:3714:1: sparse: sparse: bad integer constant expression
   mm/vmalloc.c:3714:1: sparse: sparse: static assertion failed: "MODULE_INFO(parmtype, ...) contains embedded NUL byte"

vim +3714 mm/vmalloc.c

f53b3795c83eae Uladzislau Rezki (Sony  2025-12-16  3712) 
f486454c6610dd Uladzislau Rezki (Sony  2025-12-16  3713) static int attempt_larger_order_alloc;
f486454c6610dd Uladzislau Rezki (Sony  2025-12-16 @3714) module_param(attempt_larger_order_alloc, int, 0644);
f486454c6610dd Uladzislau Rezki (Sony  2025-12-16  3715) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
