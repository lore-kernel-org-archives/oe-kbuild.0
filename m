Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5B66331A7B
	for <oe-kbuild@lists.linux.dev>; Thu, 12 Mar 2026 07:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773300051; cv=none; b=P+FJyQQFz8tVaAx61U0zmo1pkP3GI+5BVqoBCg1WAUMkN6l/6sxKCaGnHRd03jElWmuo+kTs2FvVho5vMvJ0/tjNcI91CP9QXOJMCRJ/9Dv++Mle88wZRslgNbpV2Am5VnUWwNx8ORu+3/IM69wIbD7W1kPrkfEfxKarakBg47A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773300051; c=relaxed/simple;
	bh=dUNk9h3OmTRQ5fOeeq8FmsqFtm4IE1PONfQ4xjAmroc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZbyPTQXr6kbTu1aEYl2CcMMX7VcthShK1gbrM3bh8QsgWtU4u0V7dl0Qldu+DXOqLb1gi1A1EgYFOzK1NryiG+72eZsaGS9jOek2Vz7+nEiWPHi4WOTx1GCpMOCABbU+EChSj599k6ZqM17auXDLHI6Lgha/yRJhJl7FrYPjSZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSwpY9Pu; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSwpY9Pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773300050; x=1804836050;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dUNk9h3OmTRQ5fOeeq8FmsqFtm4IE1PONfQ4xjAmroc=;
  b=WSwpY9PuKZy7QmAxg4Eme6VurWIyG8Y+50g/49B9vx7g208zfqJB7u5f
   LQ1kL13gVFXPxx7udIXSHcHstQtri14O9NiiY36mTQlqOV/FhiwKU+aib
   ug6bg2w/I1mHUXYq/7PGtJDYfJZcru6cjIJRXewFv1v0Qdj0EYjlxQyMh
   PnmM25oZUhRdk2mGKHf4mVskY6q2KtrX8C4zO2S1hnZJKSFuZCdBnsGCL
   s/mPXMlUUKuWh16T7MwSjIOIqmfL39rqJKlCCyHnaMMgDhMoY5zreD6iV
   MI7LpKfSmQtTU46zw3/qqiHKaKdWELtEkuFaJ8DCaF0MW0Mc0dMrPSDXy
   w==;
X-CSE-ConnectionGUID: nXPq4hzdRIKQswZRSfqelQ==
X-CSE-MsgGUID: HY9PfhSmTcm1oXt9gddGTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74350098"
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="74350098"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2026 00:20:49 -0700
X-CSE-ConnectionGUID: tepmPXOkSgeoYWJd3uwCQw==
X-CSE-MsgGUID: IDyAB/vbQSqrIdh9FHsXmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,115,1770624000"; 
   d="scan'208";a="225431190"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 12 Mar 2026 00:20:47 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0aLc-000000002Bb-3xeJ;
	Thu, 12 Mar 2026 07:20:44 +0000
Date: Thu, 12 Mar 2026 15:20:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v2 1/2] mm/swap: Add VM_WARN_ON to isolate_lock_cluster()
Message-ID: <202603121537.6k2jt9WF-lkp@intel.com>
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
In-Reply-To: <25c1be6b4a54a69d4b57189fd84c7502c4412d7a.1773040982.git.zhuhui@kylinos.cn>
References: <25c1be6b4a54a69d4b57189fd84c7502c4412d7a.1773040982.git.zhuhui@kylinos.cn>
TO: Hui Zhu <hui.zhu@linux.dev>
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Chris Li <chrisl@kernel.org>
TO: Kairui Song <kasong@tencent.com>
TO: Kemeng Shi <shikemeng@huaweicloud.com>
TO: Nhat Pham <nphamcs@gmail.com>
TO: Baoquan He <bhe@redhat.com>
TO: Barry Song <baohua@kernel.org>
TO: YoungJun Park <youngjun.park@lge.com>
TO: linux-kernel@vger.kernel.org
CC: Hui Zhu <zhuhui@kylinos.cn>

Hi Hui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Hui-Zhu/mm-swap-Add-VM_WARN_ON-to-isolate_lock_cluster/20260309-160732
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/25c1be6b4a54a69d4b57189fd84c7502c4412d7a.1773040982.git.zhuhui%40kylinos.cn
patch subject: [PATCH v2 1/2] mm/swap: Add VM_WARN_ON to isolate_lock_cluster()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-053-20260312 (https://download.01.org/0day-ci/archive/20260312/202603121537.6k2jt9WF-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603121537.6k2jt9WF-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> mm/swapfile.c:623:13-15: ERROR: invalid reference to the index variable of the iterator on line 605

vim +623 mm/swapfile.c

38d8b4e6bdc872f Ying Huang  2017-07-06  589  
3b644773eefda88 Kairui Song 2025-01-14  590  /*
3b644773eefda88 Kairui Song 2025-01-14  591   * Isolate and lock the first cluster that is not contented on a list,
3b644773eefda88 Kairui Song 2025-01-14  592   * clean its flag before taken off-list. Cluster flag must be in sync
3b644773eefda88 Kairui Song 2025-01-14  593   * with list status, so cluster updaters can always know the cluster
3b644773eefda88 Kairui Song 2025-01-14  594   * list status without touching si lock.
3b644773eefda88 Kairui Song 2025-01-14  595   *
3b644773eefda88 Kairui Song 2025-01-14  596   * Note it's possible that all clusters on a list are contented so
3b644773eefda88 Kairui Song 2025-01-14  597   * this returns NULL for an non-empty list.
3b644773eefda88 Kairui Song 2025-01-14  598   */
3b644773eefda88 Kairui Song 2025-01-14  599  static struct swap_cluster_info *isolate_lock_cluster(
4fd58b51ef090e7 Kairui Song 2025-10-24  600  		struct swap_info_struct *si, struct list_head *list)
3b644773eefda88 Kairui Song 2025-01-14  601  {
07adc4cf1ecd316 Kairui Song 2025-09-17  602  	struct swap_cluster_info *ci, *found = NULL;
3b644773eefda88 Kairui Song 2025-01-14  603  
3b644773eefda88 Kairui Song 2025-01-14  604  	spin_lock(&si->lock);
3b644773eefda88 Kairui Song 2025-01-14 @605  	list_for_each_entry(ci, list, list) {
3b644773eefda88 Kairui Song 2025-01-14  606  		if (!spin_trylock(&ci->lock))
3b644773eefda88 Kairui Song 2025-01-14  607  			continue;
3b644773eefda88 Kairui Song 2025-01-14  608  
3b644773eefda88 Kairui Song 2025-01-14  609  		/* We may only isolate and clear flags of following lists */
3b644773eefda88 Kairui Song 2025-01-14  610  		VM_BUG_ON(!ci->flags);
3b644773eefda88 Kairui Song 2025-01-14  611  		VM_BUG_ON(ci->flags > CLUSTER_FLAG_USABLE &&
3b644773eefda88 Kairui Song 2025-01-14  612  			  ci->flags != CLUSTER_FLAG_FULL);
3b644773eefda88 Kairui Song 2025-01-14  613  
3b644773eefda88 Kairui Song 2025-01-14  614  		list_del(&ci->list);
3b644773eefda88 Kairui Song 2025-01-14  615  		ci->flags = CLUSTER_FLAG_NONE;
07adc4cf1ecd316 Kairui Song 2025-09-17  616  		found = ci;
3b644773eefda88 Kairui Song 2025-01-14  617  		break;
3b644773eefda88 Kairui Song 2025-01-14  618  	}
3b644773eefda88 Kairui Song 2025-01-14  619  	spin_unlock(&si->lock);
3b644773eefda88 Kairui Song 2025-01-14  620  
07adc4cf1ecd316 Kairui Song 2025-09-17  621  	if (found && !cluster_table_is_alloced(found)) {
bc49888aa80bcfb Hui Zhu     2026-03-09  622  		/* Table of full cluster must be allocated. */
bc49888aa80bcfb Hui Zhu     2026-03-09 @623  		VM_WARN_ON(ci->flags == CLUSTER_FLAG_FULL);
bc49888aa80bcfb Hui Zhu     2026-03-09  624  
07adc4cf1ecd316 Kairui Song 2025-09-17  625  		/* Only an empty free cluster's swap table can be freed. */
07adc4cf1ecd316 Kairui Song 2025-09-17  626  		VM_WARN_ON_ONCE(list != &si->free_clusters);
07adc4cf1ecd316 Kairui Song 2025-09-17  627  		VM_WARN_ON_ONCE(!cluster_is_empty(found));
07adc4cf1ecd316 Kairui Song 2025-09-17  628  		return swap_cluster_alloc_table(si, found);
07adc4cf1ecd316 Kairui Song 2025-09-17  629  	}
07adc4cf1ecd316 Kairui Song 2025-09-17  630  
07adc4cf1ecd316 Kairui Song 2025-09-17  631  	return found;
3b644773eefda88 Kairui Song 2025-01-14  632  }
3b644773eefda88 Kairui Song 2025-01-14  633  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
