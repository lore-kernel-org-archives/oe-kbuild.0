Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916768;
	b=JhWsxetJUiEwOOKfJJEqcyr6+WOMW02bfaYgKHMinNgw3bu7NTBdBVD/S88Wg9xV2a8c
	 /msqJ7+iyflhHFCmksKBTRLupccKF41ZcMRONWfk/mrSWU9vPcIAiLHzWgvXVKwuHTAVx
	 Nto4woUeIu5wXaFG65MGZ6e698bj23/09kcsjeb15ZpbZiTKJTe10Hf2cMJ2eZ4+GiYrF
	 GYjGXQPS0cDzvw0RzrIwva9jm9+sSIrwT2kwVnpPVxHXSt/TOyP3AjCFipdCRKU1RkPN+
	 YNYBcA1YP+OCXuJf2hTld+Pv89QLfc1yNeX7Z0hqyZrM8YDdYTV5jE1DjW/+VpvKUIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916768;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=mmo/eAMyvfcCHCQJlVpm/q2ZM0c9aqAbdZV33BjLIxs=;
	b=jJNUmStrR/8FWpB7fuVlwp2HCezd5UqvhhKq9iIsqc04bL9EOxygwnJwT6NdOCGNAVm7
	 /26Lracs+//0DMD//H5MPfQKk2OlPJ/lQIgrNqSfAZV5tYweeWyLqsJmjC1L/DeR3SAkV
	 Mq3d95F1a1RGUx2SUXG6hSTVzPCJxzC6QB0ybjwV8xy5oFlGGnD454/W+eQqZfAHyo9AZ
	 b3SelGH1CmsikIVZv+PHHjoT98EySesm9rBfrtOZQrDCSyStLcwzD2YD8dnSr3BMszl4/
	 MZkIR6ISJ5PgsIcnTTsGFbCN1jD4hHTa4et9MkZQVKYYibsUHLgzQlsVqTjMLo8Sivg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mgF5MMcG;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD02606A32A
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Nov 2026 11:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BD02606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mgF5MMcG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794916768; x=1826452768;
  h=date:from:to:cc:subject:message-id;
  bh=0ach21us7S8P3mtvbCsv9+drzhX9JLWM3Xgj5TKS7YI=;
  b=mgF5MMcGMINT9avl9yWbGh3IUyIsVLLIkucJ4ylQPT4QvuLWa+ggvsdK
   aNQX9J2hYiUKKCkg9jbNnKH+1WPHUqDz2Co6N9GeG1f1Ja6kEFHGM8eeO
   kBDp1m9by2REfNMtskBVcbSamW1ECayN1Swe5ueGOo1VHi39XB6Hhah9S
   tbo7K46VqfQevVmV68YJUYNoCpOlowQEYVwhFXWu2HI7QDjCobNsvSE91
   Lav8kG19FgnDxRIBJTFdUIyfVMLCEJWA+2VKyuar5/45kOzAi0Sr1Yr+L
   wwzdLhOqap4V/965PzRml3A1xgZTarXwq/u3h+x1ShcvWQcavHugeQ9ka
   g==;
X-CSE-ConnectionGUID: 7rIBPEf0Tzqs/ZS6QdnBdA==
X-CSE-MsgGUID: OEgdTR0qTLOjR+lyKDoeaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3677445"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3677445"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 03:59:27 -0800
X-CSE-ConnectionGUID: CDwsKB8CSXSswHm2lbQICA==
X-CSE-MsgGUID: GFn60JrCTO2jDGLX0TQ/5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="10350334"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 17 Nov 2026 03:59:26 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTHqN-0000000036W-2WE5;
	Tue, 17 Nov 2026 11:59:23 +0000
Date: Tue, 17 Nov 2026 12:58:41 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [davidhildenbrand:b4/fixes_hugetlb 11/16] mm/hugetlb.c:804
 region_add_limited() warn: inconsistent returns '&resv->lock'.
Message-ID: <20261117125447.rvtxDcng-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "David Hildenbrand (Arm)" <david@kernel.org>

tree:   https://github.com/davidhildenbrand/linux b4/fixes_hugetlb
head:   dcf4d75c215f5ebca583fccfa4a1381b8c44587d
commit: 060e66d618e406e1ca768c4a56cae68f1d67159b [11/16] mm/hugetlb: count again if the reserve map shrank
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: powerpc-randconfig-2200-20261117 (https://download.01.org/0day-ci/archive/20261117/20261117125447.rvtxDcng-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261117125447.rvtxDcng-lkp@intel.com/

smatch warnings:
mm/hugetlb.c:804 region_add_limited() warn: inconsistent returns '&resv->lock'.

vim +804 mm/hugetlb.c

d75c6af9c89ac1 Mina Almasry            2019-11-30  732  
1dd308a7b49d4b Mike Kravetz            2015-06-24  733  /*
1dd308a7b49d4b Mike Kravetz            2015-06-24  734   * Add the huge page range represented by [f, t) to the reserve
0db9d74ed8845a Mina Almasry            2020-04-01  735   * map.  Regions will be taken from the cache to fill in this range.
0db9d74ed8845a Mina Almasry            2020-04-01  736   * Sufficient regions should exist in the cache due to the previous
0db9d74ed8845a Mina Almasry            2020-04-01  737   * call to region_chg with the same range, but in some cases the cache will not
0db9d74ed8845a Mina Almasry            2020-04-01  738   * have sufficient entries due to races with other code doing region_add or
0db9d74ed8845a Mina Almasry            2020-04-01  739   * region_del.  The extra needed entries will be allocated.
0db9d74ed8845a Mina Almasry            2020-04-01  740   *
0db9d74ed8845a Mina Almasry            2020-04-01  741   * regions_needed is the out value provided by a previous call to region_chg.
060e66d618e406 David Hildenbrand (Arm  2026-10-28  742)  * limit is what the caller has accounted for.  If more huge pages would have
060e66d618e406 David Hildenbrand (Arm  2026-10-28  743)  * to be added, because somebody has deleted from the range since region_chg,
060e66d618e406 David Hildenbrand (Arm  2026-10-28  744)  * nothing is added and -EAGAIN is returned.
cf3ad20bfeadda Mike Kravetz            2015-06-24  745   *
0db9d74ed8845a Mina Almasry            2020-04-01  746   * Return the number of new huge pages added to the map.  This number is greater
0db9d74ed8845a Mina Almasry            2020-04-01  747   * than or equal to zero.  If file_region entries needed to be allocated for
7c8de3588972ed Ethon Paul              2020-06-04  748   * this operation and we were not able to allocate, it returns -ENOMEM.
060e66d618e406 David Hildenbrand (Arm  2026-10-28  749)  * Ranges of length 1 never require allocating file_regions and cannot fail
060e66d618e406 David Hildenbrand (Arm  2026-10-28  750)  * if limit is at least 1; region_chg will always allocate at least 1 entry
060e66d618e406 David Hildenbrand (Arm  2026-10-28  751)  * and adding 1 page will only require at most 1 entry.
1dd308a7b49d4b Mike Kravetz            2015-06-24  752   */
060e66d618e406 David Hildenbrand (Arm  2026-10-28  753) static long region_add_limited(struct resv_map *resv, long f, long t,
075a61d07a8eca Mina Almasry            2020-04-01  754  		long in_regions_needed, struct hstate *h,
060e66d618e406 David Hildenbrand (Arm  2026-10-28  755) 		struct hugetlb_cgroup *h_cg, long limit)
9682290484370c Andy Whitcroft          2008-07-23  756  {
0db9d74ed8845a Mina Almasry            2020-04-01  757  	long add = 0, actual_regions_needed = 0;
9682290484370c Andy Whitcroft          2008-07-23  758  
7b24d8616be336 Davidlohr Bueso         2014-04-03  759  	spin_lock(&resv->lock);
0db9d74ed8845a Mina Almasry            2020-04-01  760  retry:
0db9d74ed8845a Mina Almasry            2020-04-01  761  
060e66d618e406 David Hildenbrand (Arm  2026-10-28  762) 	/*
060e66d618e406 David Hildenbrand (Arm  2026-10-28  763) 	 * Count how many regions are actually needed to execute this add.
060e66d618e406 David Hildenbrand (Arm  2026-10-28  764) 	 * Fail if the number of huge pages to add exceeds limit.
060e66d618e406 David Hildenbrand (Arm  2026-10-28  765) 	 */
060e66d618e406 David Hildenbrand (Arm  2026-10-28  766) 	add = add_reservation_in_range(resv, f, t, NULL, NULL,
972a3da355c947 Wei Yang                2020-10-13  767  				       &actual_regions_needed);
060e66d618e406 David Hildenbrand (Arm  2026-10-28  768) 	if (add > limit) {
060e66d618e406 David Hildenbrand (Arm  2026-10-28  769) 		spin_unlock(&resv->lock);
060e66d618e406 David Hildenbrand (Arm  2026-10-28  770) 		return -EAGAIN;
060e66d618e406 David Hildenbrand (Arm  2026-10-28  771) 	}
9682290484370c Andy Whitcroft          2008-07-23  772  
5e9113731a3ce6 Mike Kravetz            2015-09-08  773  	/*
0db9d74ed8845a Mina Almasry            2020-04-01  774  	 * Check for sufficient descriptors in the cache to accommodate
0db9d74ed8845a Mina Almasry            2020-04-01  775  	 * this add operation. Note that actual_regions_needed may be greater
0db9d74ed8845a Mina Almasry            2020-04-01  776  	 * than in_regions_needed, as the resv_map may have been modified since
0db9d74ed8845a Mina Almasry            2020-04-01  777  	 * the region_chg call. In this case, we need to make sure that we
0db9d74ed8845a Mina Almasry            2020-04-01  778  	 * allocate extra entries, such that we have enough for all the
0db9d74ed8845a Mina Almasry            2020-04-01  779  	 * existing adds_in_progress, plus the excess needed for this
0db9d74ed8845a Mina Almasry            2020-04-01  780  	 * operation.
5e9113731a3ce6 Mike Kravetz            2015-09-08  781  	 */
0db9d74ed8845a Mina Almasry            2020-04-01  782  	if (actual_regions_needed > in_regions_needed &&
0db9d74ed8845a Mina Almasry            2020-04-01  783  	    resv->region_cache_count <
0db9d74ed8845a Mina Almasry            2020-04-01  784  		    resv->adds_in_progress +
0db9d74ed8845a Mina Almasry            2020-04-01  785  			    (actual_regions_needed - in_regions_needed)) {
0db9d74ed8845a Mina Almasry            2020-04-01  786  		/* region_add operation of range 1 should never need to
0db9d74ed8845a Mina Almasry            2020-04-01  787  		 * allocate file_region entries.
0db9d74ed8845a Mina Almasry            2020-04-01  788  		 */
0db9d74ed8845a Mina Almasry            2020-04-01  789  		VM_BUG_ON(t - f <= 1);
5e9113731a3ce6 Mike Kravetz            2015-09-08  790  
0db9d74ed8845a Mina Almasry            2020-04-01  791  		if (allocate_file_region_entries(
0db9d74ed8845a Mina Almasry            2020-04-01  792  			    resv, actual_regions_needed - in_regions_needed)) {
0db9d74ed8845a Mina Almasry            2020-04-01  793  			return -ENOMEM;
0db9d74ed8845a Mina Almasry            2020-04-01  794  		}
5e9113731a3ce6 Mike Kravetz            2015-09-08  795  
0db9d74ed8845a Mina Almasry            2020-04-01  796  		goto retry;
5e9113731a3ce6 Mike Kravetz            2015-09-08  797  	}
5e9113731a3ce6 Mike Kravetz            2015-09-08  798  
972a3da355c947 Wei Yang                2020-10-13  799  	add = add_reservation_in_range(resv, f, t, h_cg, h, NULL);
0db9d74ed8845a Mina Almasry            2020-04-01  800  
0db9d74ed8845a Mina Almasry            2020-04-01  801  	resv->adds_in_progress -= in_regions_needed;
cf3ad20bfeadda Mike Kravetz            2015-06-24  802  
7b24d8616be336 Davidlohr Bueso         2014-04-03  803  	spin_unlock(&resv->lock);
cf3ad20bfeadda Mike Kravetz            2015-06-24 @804  	return add;
9682290484370c Andy Whitcroft          2008-07-23  805  }
9682290484370c Andy Whitcroft          2008-07-23  806  

:::::: The code at line 804 was first introduced by commit
:::::: cf3ad20bfeadda693e408d85684790714fc29b08 mm/hugetlb: compute/return the number of regions added by region_add()

:::::: TO: Mike Kravetz <mike.kravetz@oracle.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
