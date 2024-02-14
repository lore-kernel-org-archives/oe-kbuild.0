Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9C1D2F2E
	for <oe-kbuild@lists.linux.dev>; Wed, 14 Feb 2024 03:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707880690; cv=none; b=aghu6FsRy23mCZzit7fa4jyreE3mrLHOaVkEq1EhQL4AMKtMDXhJeynbFa73zAN67Wpo1ogr8FCgbz1Nl3XSNEJ8ERFJCm4ItfHqenZYwsmNgXaKsTEaKbRQsRLzhE5QMpn9NLBeGFRdvf9VuVe62XV+RX5oU0cn4WP4qShUzs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707880690; c=relaxed/simple;
	bh=lSNqRN80DEwvPHlTQnqehWvJD2gu6OJfsa+14VBCeMA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RUOgePO/ZKqHV730V6Mwdrx7bbYdScyJDULbiuWYziA5VYQaG8ytQXFG06zsLRB2sr/sTmdy44UEtvkatNkQTLjRCYT5hBNYQ7GWgYamwz/2W3p6YbXoOjApoN7BWLmYkF4THaWPaaEK5hPXBrJTWQWRsKbB313wNXbuD2PR1eI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FhUl+4oL; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FhUl+4oL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707880687; x=1739416687;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lSNqRN80DEwvPHlTQnqehWvJD2gu6OJfsa+14VBCeMA=;
  b=FhUl+4oLMbwB7HL2c0YbySarbpNP35IBxM6OPC41t6tTaHeXhCtPG/e1
   hCCkWiM1OuJzloAy+Nw6eby7tyZ26Ur4FAHMX0riSee5Oz7WyflFrWOWW
   x0ZDkM9itLkKhGE2RrF5EK02ZO5LS2jt5gM1c+rxCWql1wE6N/us9o+cc
   dOEiGTPQQ/zIjzwNwle3+0IBJA7npLqsRtFXkeXebDfWz7R66TDaaWw2v
   pV+qEIXTKsqTg5wvu75WfHJJe2cnPzXkXCnQWdEyPUAldcm7BTN3FhR7E
   M0LPn/OmmDolZMWW/oJ+rRv+dunM3/ohJCS6rm/0EGetoUTRHmHoeVtHJ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="13302446"
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="13302446"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2024 19:18:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,158,1705392000"; 
   d="scan'208";a="3364525"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 13 Feb 2024 19:18:06 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ra5md-0008Fs-1b;
	Wed, 14 Feb 2024 03:18:03 +0000
Date: Wed, 14 Feb 2024 11:17:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 17/35] mm: enable page allocation tagging
Message-ID: <202402141111.yPNcLI7r-lkp@intel.com>
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
In-Reply-To: <20240212213922.783301-18-surenb@google.com>
References: <20240212213922.783301-18-surenb@google.com>
TO: Suren Baghdasaryan <surenb@google.com>
TO: akpm@linux-foundation.org
CC: kent.overstreet@linux.dev
CC: mhocko@suse.com
CC: vbabka@suse.cz
CC: hannes@cmpxchg.org
CC: roman.gushchin@linux.dev
CC: mgorman@suse.de
CC: dave@stgolabs.net
CC: willy@infradead.org
CC: liam.howlett@oracle.com
CC: corbet@lwn.net
CC: void@manifault.com
CC: peterz@infradead.org
CC: juri.lelli@redhat.com
CC: catalin.marinas@arm.com
CC: will@kernel.org
CC: arnd@arndb.de
CC: tglx@linutronix.de
CC: mingo@redhat.com
CC: dave.hansen@linux.intel.com
CC: x86@kernel.org
CC: peterx@redhat.com
CC: david@redhat.com
CC: axboe@kernel.dk
CC: mcgrof@kernel.org
CC: masahiroy@kernel.org
CC: nathan@kernel.org
CC: dennis@kernel.org
CC: tj@kernel.org
CC: muchun.song@linux.dev

Hi Suren,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-nonmm-unstable]
[also build test WARNING on linus/master v6.8-rc4]
[cannot apply to akpm-mm/mm-everything vbabka-slab/for-next next-20240213]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan/lib-string_helpers-Add-flags-param-to-string_get_size/20240213-054335
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
patch link:    https://lore.kernel.org/r/20240212213922.783301-18-surenb%40google.com
patch subject: [PATCH v3 17/35] mm: enable page allocation tagging
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: s390-randconfig-r071-20240213 (https://download.01.org/0day-ci/archive/20240214/202402141111.yPNcLI7r-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project c08b90c50bcac9f3f563c79491c8dbcbe7c3b574)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402141111.yPNcLI7r-lkp@intel.com/

smatch warnings:
mm/page_alloc.c:4502 alloc_pages_bulk_noprof() error: we previously assumed 'page_array' could be null (see line 4481)

vim +/page_array +4502 mm/page_alloc.c

187ad460b8413e Mel Gorman             2021-07-14  4433  
387ba26fb1cb9b Mel Gorman             2021-04-29  4434  	/* May set ALLOC_NOFRAGMENT, fragmentation will return 1 page. */
387ba26fb1cb9b Mel Gorman             2021-04-29  4435  	gfp &= gfp_allowed_mask;
387ba26fb1cb9b Mel Gorman             2021-04-29  4436  	alloc_gfp = gfp;
387ba26fb1cb9b Mel Gorman             2021-04-29  4437  	if (!prepare_alloc_pages(gfp, 0, preferred_nid, nodemask, &ac, &alloc_gfp, &alloc_flags))
061478438d0477 Chuck Lever            2021-07-14  4438  		goto out;
387ba26fb1cb9b Mel Gorman             2021-04-29  4439  	gfp = alloc_gfp;
387ba26fb1cb9b Mel Gorman             2021-04-29  4440  
387ba26fb1cb9b Mel Gorman             2021-04-29  4441  	/* Find an allowed local zone that meets the low watermark. */
387ba26fb1cb9b Mel Gorman             2021-04-29  4442  	for_each_zone_zonelist_nodemask(zone, z, ac.zonelist, ac.highest_zoneidx, ac.nodemask) {
387ba26fb1cb9b Mel Gorman             2021-04-29  4443  		unsigned long mark;
387ba26fb1cb9b Mel Gorman             2021-04-29  4444  
387ba26fb1cb9b Mel Gorman             2021-04-29  4445  		if (cpusets_enabled() && (alloc_flags & ALLOC_CPUSET) &&
387ba26fb1cb9b Mel Gorman             2021-04-29  4446  		    !__cpuset_zone_allowed(zone, gfp)) {
387ba26fb1cb9b Mel Gorman             2021-04-29  4447  			continue;
387ba26fb1cb9b Mel Gorman             2021-04-29  4448  		}
387ba26fb1cb9b Mel Gorman             2021-04-29  4449  
387ba26fb1cb9b Mel Gorman             2021-04-29  4450  		if (nr_online_nodes > 1 && zone != ac.preferred_zoneref->zone &&
387ba26fb1cb9b Mel Gorman             2021-04-29  4451  		    zone_to_nid(zone) != zone_to_nid(ac.preferred_zoneref->zone)) {
387ba26fb1cb9b Mel Gorman             2021-04-29  4452  			goto failed;
387ba26fb1cb9b Mel Gorman             2021-04-29  4453  		}
387ba26fb1cb9b Mel Gorman             2021-04-29  4454  
387ba26fb1cb9b Mel Gorman             2021-04-29  4455  		mark = wmark_pages(zone, alloc_flags & ALLOC_WMARK_MASK) + nr_pages;
387ba26fb1cb9b Mel Gorman             2021-04-29  4456  		if (zone_watermark_fast(zone, 0,  mark,
387ba26fb1cb9b Mel Gorman             2021-04-29  4457  				zonelist_zone_idx(ac.preferred_zoneref),
387ba26fb1cb9b Mel Gorman             2021-04-29  4458  				alloc_flags, gfp)) {
387ba26fb1cb9b Mel Gorman             2021-04-29  4459  			break;
387ba26fb1cb9b Mel Gorman             2021-04-29  4460  		}
387ba26fb1cb9b Mel Gorman             2021-04-29  4461  	}
387ba26fb1cb9b Mel Gorman             2021-04-29  4462  
387ba26fb1cb9b Mel Gorman             2021-04-29  4463  	/*
387ba26fb1cb9b Mel Gorman             2021-04-29  4464  	 * If there are no allowed local zones that meets the watermarks then
387ba26fb1cb9b Mel Gorman             2021-04-29  4465  	 * try to allocate a single page and reclaim if necessary.
387ba26fb1cb9b Mel Gorman             2021-04-29  4466  	 */
ce76f9a1d9a21c Jesper Dangaard Brouer 2021-04-29  4467  	if (unlikely(!zone))
387ba26fb1cb9b Mel Gorman             2021-04-29  4468  		goto failed;
387ba26fb1cb9b Mel Gorman             2021-04-29  4469  
5749077415994e Mel Gorman             2022-11-18  4470  	/* spin_trylock may fail due to a parallel drain or IRQ reentrancy. */
4b23a68f953628 Mel Gorman             2022-06-24  4471  	pcp_trylock_prepare(UP_flags);
5749077415994e Mel Gorman             2022-11-18  4472  	pcp = pcp_spin_trylock(zone->per_cpu_pageset);
01b44456a7aa7c Mel Gorman             2022-06-24  4473  	if (!pcp)
4b23a68f953628 Mel Gorman             2022-06-24  4474  		goto failed_irq;
387ba26fb1cb9b Mel Gorman             2021-04-29  4475  
387ba26fb1cb9b Mel Gorman             2021-04-29  4476  	/* Attempt the batch allocation */
44042b4498728f Mel Gorman             2021-06-28  4477  	pcp_list = &pcp->lists[order_to_pindex(ac.migratetype, 0)];
0f87d9d30f2139 Mel Gorman             2021-04-29  4478  	while (nr_populated < nr_pages) {
0f87d9d30f2139 Mel Gorman             2021-04-29  4479  
0f87d9d30f2139 Mel Gorman             2021-04-29  4480  		/* Skip existing pages */
0f87d9d30f2139 Mel Gorman             2021-04-29 @4481  		if (page_array && page_array[nr_populated]) {
0f87d9d30f2139 Mel Gorman             2021-04-29  4482  			nr_populated++;
0f87d9d30f2139 Mel Gorman             2021-04-29  4483  			continue;
0f87d9d30f2139 Mel Gorman             2021-04-29  4484  		}
0f87d9d30f2139 Mel Gorman             2021-04-29  4485  
44042b4498728f Mel Gorman             2021-06-28  4486  		page = __rmqueue_pcplist(zone, 0, ac.migratetype, alloc_flags,
387ba26fb1cb9b Mel Gorman             2021-04-29  4487  								pcp, pcp_list);
ce76f9a1d9a21c Jesper Dangaard Brouer 2021-04-29  4488  		if (unlikely(!page)) {
c572e4888ad1be Mel Gorman             2022-05-26  4489  			/* Try and allocate at least one page */
4b23a68f953628 Mel Gorman             2022-06-24  4490  			if (!nr_account) {
5749077415994e Mel Gorman             2022-11-18  4491  				pcp_spin_unlock(pcp);
387ba26fb1cb9b Mel Gorman             2021-04-29  4492  				goto failed_irq;
4b23a68f953628 Mel Gorman             2022-06-24  4493  			}
387ba26fb1cb9b Mel Gorman             2021-04-29  4494  			break;
387ba26fb1cb9b Mel Gorman             2021-04-29  4495  		}
3e23060b2d0b7e Mel Gorman             2021-06-28  4496  		nr_account++;
387ba26fb1cb9b Mel Gorman             2021-04-29  4497  
387ba26fb1cb9b Mel Gorman             2021-04-29  4498  		prep_new_page(page, 0, gfp, 0);
0f87d9d30f2139 Mel Gorman             2021-04-29  4499  		if (page_list)
387ba26fb1cb9b Mel Gorman             2021-04-29  4500  			list_add(&page->lru, page_list);
0f87d9d30f2139 Mel Gorman             2021-04-29  4501  		else
0f87d9d30f2139 Mel Gorman             2021-04-29 @4502  			page_array[nr_populated] = page;
0f87d9d30f2139 Mel Gorman             2021-04-29  4503  		nr_populated++;
387ba26fb1cb9b Mel Gorman             2021-04-29  4504  	}
387ba26fb1cb9b Mel Gorman             2021-04-29  4505  
5749077415994e Mel Gorman             2022-11-18  4506  	pcp_spin_unlock(pcp);
4b23a68f953628 Mel Gorman             2022-06-24  4507  	pcp_trylock_finish(UP_flags);
43c95bcc51e4e7 Mel Gorman             2021-06-28  4508  
3e23060b2d0b7e Mel Gorman             2021-06-28  4509  	__count_zid_vm_events(PGALLOC, zone_idx(zone), nr_account);
3e23060b2d0b7e Mel Gorman             2021-06-28  4510  	zone_statistics(ac.preferred_zoneref->zone, zone, nr_account);
387ba26fb1cb9b Mel Gorman             2021-04-29  4511  
061478438d0477 Chuck Lever            2021-07-14  4512  out:
0f87d9d30f2139 Mel Gorman             2021-04-29  4513  	return nr_populated;
387ba26fb1cb9b Mel Gorman             2021-04-29  4514  
387ba26fb1cb9b Mel Gorman             2021-04-29  4515  failed_irq:
4b23a68f953628 Mel Gorman             2022-06-24  4516  	pcp_trylock_finish(UP_flags);
387ba26fb1cb9b Mel Gorman             2021-04-29  4517  
387ba26fb1cb9b Mel Gorman             2021-04-29  4518  failed:
32217ecdde79fa Suren Baghdasaryan     2024-02-12  4519  	page = __alloc_pages_noprof(gfp, 0, preferred_nid, nodemask);
387ba26fb1cb9b Mel Gorman             2021-04-29  4520  	if (page) {
0f87d9d30f2139 Mel Gorman             2021-04-29  4521  		if (page_list)
387ba26fb1cb9b Mel Gorman             2021-04-29  4522  			list_add(&page->lru, page_list);
0f87d9d30f2139 Mel Gorman             2021-04-29  4523  		else
0f87d9d30f2139 Mel Gorman             2021-04-29  4524  			page_array[nr_populated] = page;
0f87d9d30f2139 Mel Gorman             2021-04-29  4525  		nr_populated++;
387ba26fb1cb9b Mel Gorman             2021-04-29  4526  	}
387ba26fb1cb9b Mel Gorman             2021-04-29  4527  
061478438d0477 Chuck Lever            2021-07-14  4528  	goto out;
387ba26fb1cb9b Mel Gorman             2021-04-29  4529  }
32217ecdde79fa Suren Baghdasaryan     2024-02-12  4530  EXPORT_SYMBOL_GPL(alloc_pages_bulk_noprof);
387ba26fb1cb9b Mel Gorman             2021-04-29  4531  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
