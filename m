Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D841C3BED43
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 10:08:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773310087; cv=none; b=Nqd3EJ5KYHYjqmu3Y4Dc4Q1ng2Z+hy52OtnaVwcNEMS0GeJxzZmkMrYnmMyCdmznrUxtDhjnQh3H/3MEPDqbGtLzptDG3OPhtF+MSYJkM8teLU9GjMyn0YeHoow66gVPcDXLcMG9q7iRE8z9RHVM+56OPmH+D+bYRAyBvTlQXQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773310087; c=relaxed/simple;
	bh=r1n2RXgx4nV0bH5y1ROFL1cCjdzpl4RtfoEq5XAK988=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BFmwczlbAQuUrVa13JE6zxa4AsbNGuu42hCM+2+lRZlzRPKtyrGh03dMBPVOgZrW6Rf6RLPAO8EQ7qBh+lA76JT7IuiaOixw7iw2tv1zJdDtMFbIkeTvQuhEP4aneJDGJB1gFQyDw77v7fQ02xFmsuBXqnE2UJpKHBt8A7hN2A0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mu2tL2Qa; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mu2tL2Qa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773310085; x=1804846085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r1n2RXgx4nV0bH5y1ROFL1cCjdzpl4RtfoEq5XAK988=;
  b=Mu2tL2QaZjUuyORmQQ+J6by9pyaJxCm5AD7KV5v1yRPMsToQb7J7iEhn
   BoTAauZ5lSb+ZNA+w3UIyTbNY/Nb6UIsjuYvPaWcDN1UeyEAgyZ0W7kIp
   e2NroIgVYkNVqQeefsRmEnDBRcGMupamCIm//dHdR9Shn1VBFX93wbKmR
   ksaP+BkUbHtxtEMGidBcAqUfTj8rqFYqCyUKLaKH9/oG3Hixnb5Z4X4Y2
   u1KkFo+/i2QrvvYYTolZEyuQUG5+m1pVG+wts0Kx8VaKB6/zNqw9jOwdB
   RVUWoCfBIV8z7JgWuzysPHHYkR0cr/97JwoaCpjxJ8R91LU9kOAtSn2Ud
   g==;
X-CSE-ConnectionGUID: c4CEPbtBSiamZZEdjjgUPg==
X-CSE-MsgGUID: zYoZFRvJSsu9xXJhI6ybJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74276320"
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="74276320"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 03:08:05 -0700
X-CSE-ConnectionGUID: KsLl9VaLQSyb5EGThHaRQw==
X-CSE-MsgGUID: 9AKuSKKHQvmwJortciZ/dA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,116,1770624000"; 
   d="scan'208";a="216911728"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2026 03:08:03 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0cxV-000000002Kl-0DlZ;
	Thu, 12 Mar 2026 10:08:01 +0000
Date: Thu, 12 Mar 2026 18:07:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] mm: switch deferred split shrinker to list_lru
Message-ID: <202603121741.Y8GG0oCq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260311154358.150977-1-hannes@cmpxchg.org>
References: <20260311154358.150977-1-hannes@cmpxchg.org>
TO: Johannes Weiner <hannes@cmpxchg.org>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: David Hildenbrand <david@redhat.com>
CC: Zi Yan <ziy@nvidia.com>
CC: "Liam R. Howlett" <Liam.Howlett@oracle.com>
CC: Usama Arif <usama.arif@linux.dev>
CC: Kiryl Shutsemau <kas@kernel.org>
CC: Dave Chinner <david@fromorbit.com>
CC: Roman Gushchin <roman.gushchin@linux.dev>
CC: linux-kernel@vger.kernel.org

Hi Johannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Weiner/mm-switch-deferred-split-shrinker-to-list_lru/20260312-000508
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20260311154358.150977-1-hannes%40cmpxchg.org
patch subject: [PATCH] mm: switch deferred split shrinker to list_lru
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: parisc-randconfig-r073-20260312 (https://download.01.org/0day-ci/archive/20260312/202603121741.Y8GG0oCq-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603121741.Y8GG0oCq-lkp@intel.com/

smatch warnings:
mm/list_lru.c:24 lock_list_lru() warn: mixing irqsave and irq
mm/list_lru.c:35 unlock_list_lru() warn: mixing irqsave and irq

vim +24 mm/list_lru.c

c0a5b560938a0f2 Vladimir Davydov 2015-02-12  17  
09adc9da498223d Johannes Weiner  2026-03-11  18  static inline void lock_list_lru(struct list_lru_one *l, bool irq,
09adc9da498223d Johannes Weiner  2026-03-11  19  				 unsigned long *irq_flags)
09adc9da498223d Johannes Weiner  2026-03-11  20  {
09adc9da498223d Johannes Weiner  2026-03-11  21  	if (irq_flags)
09adc9da498223d Johannes Weiner  2026-03-11  22  		spin_lock_irqsave(&l->lock, *irq_flags);
09adc9da498223d Johannes Weiner  2026-03-11  23  	else if (irq)
09adc9da498223d Johannes Weiner  2026-03-11 @24  		spin_lock_irq(&l->lock);
09adc9da498223d Johannes Weiner  2026-03-11  25  	else
09adc9da498223d Johannes Weiner  2026-03-11  26  		spin_lock(&l->lock);
09adc9da498223d Johannes Weiner  2026-03-11  27  }
09adc9da498223d Johannes Weiner  2026-03-11  28  
09adc9da498223d Johannes Weiner  2026-03-11  29  static inline void unlock_list_lru(struct list_lru_one *l, bool irq,
09adc9da498223d Johannes Weiner  2026-03-11  30  				   unsigned long *irq_flags)
09adc9da498223d Johannes Weiner  2026-03-11  31  {
09adc9da498223d Johannes Weiner  2026-03-11  32  	if (irq_flags)
09adc9da498223d Johannes Weiner  2026-03-11  33  		spin_unlock_irqrestore(&l->lock, *irq_flags);
09adc9da498223d Johannes Weiner  2026-03-11  34  	else if (irq)
09adc9da498223d Johannes Weiner  2026-03-11 @35  		spin_unlock_irq(&l->lock);
09adc9da498223d Johannes Weiner  2026-03-11  36  	else
09adc9da498223d Johannes Weiner  2026-03-11  37  		spin_unlock(&l->lock);
09adc9da498223d Johannes Weiner  2026-03-11  38  }
09adc9da498223d Johannes Weiner  2026-03-11  39  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
