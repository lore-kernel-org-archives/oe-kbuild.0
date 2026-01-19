Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244757260A
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jan 2026 22:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768861164; cv=none; b=BRgD9YfXn2vOr12SwTYtHnebozzNcdqeDzWzHEwmWYBl8CQIq47zfAlMxcJOganP39cOO+H1ig94FUz8+4NTrZkPDbSU/cIPOBpUIRknWFI5ZE5HN+oiMswrJAAsuwJ3P7yRXztvgycqn9SBIGrprBPG0RAeJ91MzhkfAV8hBoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768861164; c=relaxed/simple;
	bh=u7qunNUq9XeQ0ZaSq7LDZwVNDcVj7dmOdAQVX5SlYAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pc8VHqfB1tl0bQsTCOQXnKAPKn3Q8e85ePLidKIbdparV2/pqLnqHtVw5Lo/9pl1jlGpz1BzCLCu646L6rcPN9+2YRd4da2ETzebJcZg5mQEBWC7styHp4MXqMyDNB4MfeuUIXOH57w25at4d9SHIltpaKnnzCtKujlGaw2W4OU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sb1rhVRo; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sb1rhVRo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768861162; x=1800397162;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=u7qunNUq9XeQ0ZaSq7LDZwVNDcVj7dmOdAQVX5SlYAc=;
  b=Sb1rhVRogoKTDaAeR7+WvHtJb7gFnCVNgzvyyZzyKfQXuKAl4mz3KejM
   10lqO5Tf71AFXDaysi1tm77iUM2psv3RfUNqNpz0MXG1kJxtlvaFp5cJW
   ZNu6YYXx9AXOBQu4AOkoriSDFTHy3MmrNBVE0Wua0KXudZk0KhjYMNvU9
   wTQGgM2WmDGNOBnVUTMDnu9nK5QHy6EXvO/ZrdPRvT+MS27q/q1EAAkBQ
   bmPXdJSCqG9O6v9XlZU30fqPxTFIy+0xHibqH6ChFwfqJs3eJ+S56vBqh
   debCW9Wc4Z1zsdageeVmQUNEai76HLwHIMMxzSa73ezi66f5l09gLhEwJ
   g==;
X-CSE-ConnectionGUID: wO2tv6psSWSUg0jaN6NKrw==
X-CSE-MsgGUID: knj+2qOVT9+O8dsqQTk6xg==
X-IronPort-AV: E=McAfee;i="6800,10657,11676"; a="95543598"
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="95543598"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2026 14:19:21 -0800
X-CSE-ConnectionGUID: 4c/vrVE/Sz+1v3VDkVm6Ig==
X-CSE-MsgGUID: v03nrkBSSKqLuxkL4HhJYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,239,1763452800"; 
   d="scan'208";a="205985394"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 19 Jan 2026 14:19:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vhxaf-00000000OLd-11XD;
	Mon, 19 Jan 2026 22:19:17 +0000
Date: Tue, 20 Jan 2026 06:19:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 1/3] mm: unified hmm fault and migrate device pagewalk
 paths
Message-ID: <202601200517.4rc3Hsz6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260119112502.645059-2-mpenttil@redhat.com>
References: <20260119112502.645059-2-mpenttil@redhat.com>
TO: mpenttil@redhat.com
TO: linux-mm@kvack.org
CC: linux-kernel@vger.kernel.org
CC: "Mika Penttilä" <mpenttil@redhat.com>
CC: David Hildenbrand <david@redhat.com>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: Leon Romanovsky <leonro@nvidia.com>
CC: Alistair Popple <apopple@nvidia.com>
CC: Balbir Singh <balbirs@nvidia.com>
CC: Zi Yan <ziy@nvidia.com>
CC: Matthew Brost <matthew.brost@intel.com>

Hi,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7]

url:    https://github.com/intel-lab-lkp/linux/commits/mpenttil-redhat-com/mm-unified-hmm-fault-and-migrate-device-pagewalk-paths/20260119-193100
base:   24d479d26b25bce5faea3ddd9fa8f3a6c3129ea7
patch link:    https://lore.kernel.org/r/20260119112502.645059-2-mpenttil%40redhat.com
patch subject: [PATCH v2 1/3] mm: unified hmm fault and migrate device pagewalk paths
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: powerpc-randconfig-r073-20260119 (https://download.01.org/0day-ci/archive/20260120/202601200517.4rc3Hsz6-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601200517.4rc3Hsz6-lkp@intel.com/

smatch warnings:
mm/hmm.c:70 hmm_pfns_fill() warn: bitwise AND condition is false here

vim +70 mm/hmm.c

a3eb13c1579ba97 Jason Gunthorpe 2020-03-27  52  
d28c2c9a487708b Ralph Campbell  2019-11-04  53  static int hmm_pfns_fill(unsigned long addr, unsigned long end,
adc5de787975625 Mika Penttilä   2026-01-19  54  			 struct hmm_vma_walk *hmm_vma_walk, unsigned long cpu_flags)
da4c3c735ea4dcc Jérôme Glisse   2017-09-08  55  {
adc5de787975625 Mika Penttilä   2026-01-19  56  	struct hmm_range *range = hmm_vma_walk->range;
2733ea144dcce78 Jason Gunthorpe 2020-05-01  57  	unsigned long i = (addr - range->start) >> PAGE_SHIFT;
adc5de787975625 Mika Penttilä   2026-01-19  58  	enum migrate_vma_info minfo;
adc5de787975625 Mika Penttilä   2026-01-19  59  	bool migrate = false;
adc5de787975625 Mika Penttilä   2026-01-19  60  
adc5de787975625 Mika Penttilä   2026-01-19  61  	minfo = hmm_select_migrate(range);
adc5de787975625 Mika Penttilä   2026-01-19  62  	if (cpu_flags != HMM_PFN_ERROR) {
adc5de787975625 Mika Penttilä   2026-01-19  63  		if (minfo && (vma_is_anonymous(hmm_vma_walk->vma))) {
adc5de787975625 Mika Penttilä   2026-01-19  64  			cpu_flags |= (HMM_PFN_VALID | HMM_PFN_MIGRATE);
adc5de787975625 Mika Penttilä   2026-01-19  65  			migrate = true;
adc5de787975625 Mika Penttilä   2026-01-19  66  		}
adc5de787975625 Mika Penttilä   2026-01-19  67  	}
adc5de787975625 Mika Penttilä   2026-01-19  68  
adc5de787975625 Mika Penttilä   2026-01-19  69  	if (migrate && thp_migration_supported() &&
adc5de787975625 Mika Penttilä   2026-01-19 @70  	    (minfo & MIGRATE_VMA_SELECT_COMPOUND) &&
adc5de787975625 Mika Penttilä   2026-01-19  71  	    IS_ALIGNED(addr, HPAGE_PMD_SIZE) &&
adc5de787975625 Mika Penttilä   2026-01-19  72  	    IS_ALIGNED(end, HPAGE_PMD_SIZE)) {
adc5de787975625 Mika Penttilä   2026-01-19  73  		range->hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
adc5de787975625 Mika Penttilä   2026-01-19  74  		range->hmm_pfns[i] |= cpu_flags | HMM_PFN_COMPOUND;
adc5de787975625 Mika Penttilä   2026-01-19  75  		addr += PAGE_SIZE;
adc5de787975625 Mika Penttilä   2026-01-19  76  		i++;
adc5de787975625 Mika Penttilä   2026-01-19  77  		cpu_flags = 0;
adc5de787975625 Mika Penttilä   2026-01-19  78  	}
da4c3c735ea4dcc Jérôme Glisse   2017-09-08  79  
285e871884ff3dc Leon Romanovsky 2025-04-28  80  	for (; addr < end; addr += PAGE_SIZE, i++) {
285e871884ff3dc Leon Romanovsky 2025-04-28  81  		range->hmm_pfns[i] &= HMM_PFN_INOUT_FLAGS;
285e871884ff3dc Leon Romanovsky 2025-04-28  82  		range->hmm_pfns[i] |= cpu_flags;
285e871884ff3dc Leon Romanovsky 2025-04-28  83  	}
adc5de787975625 Mika Penttilä   2026-01-19  84  
da4c3c735ea4dcc Jérôme Glisse   2017-09-08  85  	return 0;
da4c3c735ea4dcc Jérôme Glisse   2017-09-08  86  }
da4c3c735ea4dcc Jérôme Glisse   2017-09-08  87  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
