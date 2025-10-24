Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D751C860E
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Oct 2025 17:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761328172; cv=none; b=tEj5tpa0as/vGUEE3yS2SGHT+l2w2VABd6V5+tCyXNpsMaANNncZbco8j6euky2ie28K/b9H49cwV0tR85zltdFWr6/FTy6Qb9YdYYT8cXn7M1nkdGwkUEJhDB7o2fLc8Uy2te5Z+0WG46Vs3uYkPRzBrV4ahDvHKF6Wr73anVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761328172; c=relaxed/simple;
	bh=Ism4UGiqZx0Bu50BZ5qFCM/SdXDdTPgcDQ0syY+MsLw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AC8OUsdFS9JCviHtmoneik11SHRuCvk0Eh8EejjGeCI9/UsSelqbLXYVF2Sj52ZqRmbJzcwlJtaH6APGhbe8i9rdOJVffqLvapdZ4oaKu0eQgmsoVJfnRyyZ26vaXcxeEIpmytLFln+Ek73I4aqVOM8XzjW/1jsA8OBbVRly3fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Cz+ae+Io; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Cz+ae+Io"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761328170; x=1792864170;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ism4UGiqZx0Bu50BZ5qFCM/SdXDdTPgcDQ0syY+MsLw=;
  b=Cz+ae+IoRfAyL5ASHJ8oeIWacI2gibf7eEwnaHGFkngSi3r0H90Iqso/
   r1hPbIUSvAQwCASJLdW+1nCI9ybRMd3ogguG2IldK0MKML1qjCM7uMhO2
   pK6MiwBHL7IyY9eEcgly2KyanMwq3fSmRCuGtHyqntTJEUOpbbP3jkKDr
   2ONarYJ+Yi93NDlaPKbCd5HVAOPJpMugCyAmHTFhl3LaTmT+qV8rviHIm
   stNpUqHholLsNgFiOnFW6J3ou3rDvOm4+SIgks7Xz/DN2HH7zK4v6d+PF
   OSo23qVR2Fm4MWQ2RTK92As0+3bSm7UylpcIZO4e+glUXNwpNMyxsSE3a
   Q==;
X-CSE-ConnectionGUID: LklsMA2FQxG2I+hlqwziRg==
X-CSE-MsgGUID: 9eTXTUq6Tc2RkpNx8uoRVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63549062"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="63549062"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2025 10:49:29 -0700
X-CSE-ConnectionGUID: 2FqR39HHQbulzX1nWsp2Yw==
X-CSE-MsgGUID: j0fpEqNfSie/aOeEcz9r+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; 
   d="scan'208";a="184968132"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 24 Oct 2025 10:49:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vCLun-000Ekf-2J;
	Fri, 24 Oct 2025 17:49:25 +0000
Date: Sat, 25 Oct 2025 01:49:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/resctrl/monitor.c:146:8-15: WARNING: Consider using %pe to print
 PTR_ERR()
Message-ID: <202510250130.IGTH1hEL-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: James Morse <james.morse@arm.com>
CC: "Borislav Petkov (AMD)" <bp@alien8.de>
CC: Reinette Chatre <reinette.chatre@intel.com>
CC: Fenghua Yu <fenghuay@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
commit: 7168ae330e8105296210b2b2d31d791d5c073345 x86,fs/resctrl: Move the resctrl filesystem code to live in /fs/resctrl
date:   5 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-102-20251024 (https://download.01.org/0day-ci/archive/20251025/202510250130.IGTH1hEL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202510250130.IGTH1hEL-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/resctrl/monitor.c:146:8-15: WARNING: Consider using %pe to print PTR_ERR()
   fs/resctrl/monitor.c:615:8-15: WARNING: Consider using %pe to print PTR_ERR()

vim +146 fs/resctrl/monitor.c

7168ae330e81052 James Morse 2025-05-15  126  
7168ae330e81052 James Morse 2025-05-15  127  /*
7168ae330e81052 James Morse 2025-05-15  128   * Check the RMIDs that are marked as busy for this domain. If the
7168ae330e81052 James Morse 2025-05-15  129   * reported LLC occupancy is below the threshold clear the busy bit and
7168ae330e81052 James Morse 2025-05-15  130   * decrement the count. If the busy count gets to zero on an RMID, we
7168ae330e81052 James Morse 2025-05-15  131   * free the RMID
7168ae330e81052 James Morse 2025-05-15  132   */
7168ae330e81052 James Morse 2025-05-15  133  void __check_limbo(struct rdt_mon_domain *d, bool force_free)
7168ae330e81052 James Morse 2025-05-15  134  {
7168ae330e81052 James Morse 2025-05-15  135  	struct rdt_resource *r = resctrl_arch_get_resource(RDT_RESOURCE_L3);
7168ae330e81052 James Morse 2025-05-15  136  	u32 idx_limit = resctrl_arch_system_num_rmid_idx();
7168ae330e81052 James Morse 2025-05-15  137  	struct rmid_entry *entry;
7168ae330e81052 James Morse 2025-05-15  138  	u32 idx, cur_idx = 1;
7168ae330e81052 James Morse 2025-05-15  139  	void *arch_mon_ctx;
7168ae330e81052 James Morse 2025-05-15  140  	bool rmid_dirty;
7168ae330e81052 James Morse 2025-05-15  141  	u64 val = 0;
7168ae330e81052 James Morse 2025-05-15  142  
7168ae330e81052 James Morse 2025-05-15  143  	arch_mon_ctx = resctrl_arch_mon_ctx_alloc(r, QOS_L3_OCCUP_EVENT_ID);
7168ae330e81052 James Morse 2025-05-15  144  	if (IS_ERR(arch_mon_ctx)) {
7168ae330e81052 James Morse 2025-05-15  145  		pr_warn_ratelimited("Failed to allocate monitor context: %ld",
7168ae330e81052 James Morse 2025-05-15 @146  				    PTR_ERR(arch_mon_ctx));
7168ae330e81052 James Morse 2025-05-15  147  		return;
7168ae330e81052 James Morse 2025-05-15  148  	}
7168ae330e81052 James Morse 2025-05-15  149  
7168ae330e81052 James Morse 2025-05-15  150  	/*
7168ae330e81052 James Morse 2025-05-15  151  	 * Skip RMID 0 and start from RMID 1 and check all the RMIDs that
7168ae330e81052 James Morse 2025-05-15  152  	 * are marked as busy for occupancy < threshold. If the occupancy
7168ae330e81052 James Morse 2025-05-15  153  	 * is less than the threshold decrement the busy counter of the
7168ae330e81052 James Morse 2025-05-15  154  	 * RMID and move it to the free list when the counter reaches 0.
7168ae330e81052 James Morse 2025-05-15  155  	 */
7168ae330e81052 James Morse 2025-05-15  156  	for (;;) {
7168ae330e81052 James Morse 2025-05-15  157  		idx = find_next_bit(d->rmid_busy_llc, idx_limit, cur_idx);
7168ae330e81052 James Morse 2025-05-15  158  		if (idx >= idx_limit)
7168ae330e81052 James Morse 2025-05-15  159  			break;
7168ae330e81052 James Morse 2025-05-15  160  
7168ae330e81052 James Morse 2025-05-15  161  		entry = __rmid_entry(idx);
7168ae330e81052 James Morse 2025-05-15  162  		if (resctrl_arch_rmid_read(r, d, entry->closid, entry->rmid,
7168ae330e81052 James Morse 2025-05-15  163  					   QOS_L3_OCCUP_EVENT_ID, &val,
7168ae330e81052 James Morse 2025-05-15  164  					   arch_mon_ctx)) {
7168ae330e81052 James Morse 2025-05-15  165  			rmid_dirty = true;
7168ae330e81052 James Morse 2025-05-15  166  		} else {
7168ae330e81052 James Morse 2025-05-15  167  			rmid_dirty = (val >= resctrl_rmid_realloc_threshold);
7168ae330e81052 James Morse 2025-05-15  168  
7168ae330e81052 James Morse 2025-05-15  169  			/*
7168ae330e81052 James Morse 2025-05-15  170  			 * x86's CLOSID and RMID are independent numbers, so the entry's
7168ae330e81052 James Morse 2025-05-15  171  			 * CLOSID is an empty CLOSID (X86_RESCTRL_EMPTY_CLOSID). On Arm the
7168ae330e81052 James Morse 2025-05-15  172  			 * RMID (PMG) extends the CLOSID (PARTID) space with bits that aren't
7168ae330e81052 James Morse 2025-05-15  173  			 * used to select the configuration. It is thus necessary to track both
7168ae330e81052 James Morse 2025-05-15  174  			 * CLOSID and RMID because there may be dependencies between them
7168ae330e81052 James Morse 2025-05-15  175  			 * on some architectures.
7168ae330e81052 James Morse 2025-05-15  176  			 */
7168ae330e81052 James Morse 2025-05-15  177  			trace_mon_llc_occupancy_limbo(entry->closid, entry->rmid, d->hdr.id, val);
7168ae330e81052 James Morse 2025-05-15  178  		}
7168ae330e81052 James Morse 2025-05-15  179  
7168ae330e81052 James Morse 2025-05-15  180  		if (force_free || !rmid_dirty) {
7168ae330e81052 James Morse 2025-05-15  181  			clear_bit(idx, d->rmid_busy_llc);
7168ae330e81052 James Morse 2025-05-15  182  			if (!--entry->busy)
7168ae330e81052 James Morse 2025-05-15  183  				limbo_release_entry(entry);
7168ae330e81052 James Morse 2025-05-15  184  		}
7168ae330e81052 James Morse 2025-05-15  185  		cur_idx = idx + 1;
7168ae330e81052 James Morse 2025-05-15  186  	}
7168ae330e81052 James Morse 2025-05-15  187  
7168ae330e81052 James Morse 2025-05-15  188  	resctrl_arch_mon_ctx_free(r, QOS_L3_OCCUP_EVENT_ID, arch_mon_ctx);
7168ae330e81052 James Morse 2025-05-15  189  }
7168ae330e81052 James Morse 2025-05-15  190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
