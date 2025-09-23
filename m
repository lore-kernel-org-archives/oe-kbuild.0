Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FB9926E6E8
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Sep 2025 01:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758592102; cv=none; b=sDcvwb1vloqBa9w6s1qa8XiY2HfbPf8YEWG+GI4MJMjcJ4w+qpSoTHCXpFliAY7hRB40+cQNcAdRRibzjA5scTtNGLI57eSAB1rlvnB5SOBIhKVFxA4oob1naREXEFoCEUHOGuhgnIfX92ueQgNSk5mg3WgIVaSivWg2OCS8ojA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758592102; c=relaxed/simple;
	bh=l+fKm1S30CCq5rG/q0ZlgVd/gIhjL1EoLck74ek2lKg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CPc+ewHN3EppgTSziYF46VhIhhnO2MbtIIGnTOOhEq7fbkyfCE2qHwZpgziTW6tmpTTICcUcjAiwVIBn2j6FePuMOiHrD7IaRTFyme1bSJI9AKCjVZeU9/hcqxKygFW90EK0vZwJvsfNSC0+TQCsvLghI5EL2TIcbD0oWvfM9VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cDx9dWNZ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cDx9dWNZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758592101; x=1790128101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=l+fKm1S30CCq5rG/q0ZlgVd/gIhjL1EoLck74ek2lKg=;
  b=cDx9dWNZUcuILtTB3zQySPEX1Xvpl8OO0FgpNiHqm4DnTLkbMoD38zsT
   DEMBM/72f5SVlHT5wjcm6iJhW/qhSJ9c6F+qXTcb1ByJu7Nysp7DLSsd4
   BiVDI0aJNeSkB5PzcbCdQwrjgYG4D7dPH/27PRIlvUaKZGM/s2nKsfDjH
   Oyekho3fQ25xMG1TerZDIfbBBQPZXhay8RXkfUs5EPI3NO1eINrUaNYZQ
   BC3pVroLtrTL6U4I2pRhBLnlydGLfFtUwmDEXFoegJiPV+A6gfUMiF8LV
   kEACBnpGphDYES7yJghXRbgN6tUp3cY6BFWOr2RxxdwNkbrO8OK6j9JpV
   Q==;
X-CSE-ConnectionGUID: 63+zVKpQTtiJ6S9T4oqKxQ==
X-CSE-MsgGUID: ASqbLMWjQeGmP5m0/R7vPg==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60981505"
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="60981505"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 18:48:19 -0700
X-CSE-ConnectionGUID: Y8kuOcf7RB+Zn45H4MnHrg==
X-CSE-MsgGUID: fkBXfuezTd2UyKOb2UBrYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,286,1751266800"; 
   d="scan'208";a="175910990"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Sep 2025 18:48:18 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0s8X-0002dL-1v;
	Tue, 23 Sep 2025 01:48:11 +0000
Date: Tue, 23 Sep 2025 09:47:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [Patch v2 1/2] mm/ksm: get mm_slot by mm_slot_entry() when slot
 is !NULL
Message-ID: <202509230945.Au1k2GbH-lkp@intel.com>
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
In-Reply-To: <20250919071244.17020-2-richard.weiyang@gmail.com>
References: <20250919071244.17020-2-richard.weiyang@gmail.com>
TO: Wei Yang <richard.weiyang@gmail.com>

Hi Wei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.17-rc7 next-20250922]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wei-Yang/mm-ksm-get-mm_slot-by-mm_slot_entry-when-slot-is-NULL/20250919-151547
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20250919071244.17020-2-richard.weiyang%40gmail.com
patch subject: [Patch v2 1/2] mm/ksm: get mm_slot by mm_slot_entry() when slot is !NULL
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: microblaze-randconfig-r073-20250921 (https://download.01.org/0day-ci/archive/20250923/202509230945.Au1k2GbH-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202509230945.Au1k2GbH-lkp@intel.com/

New smatch warnings:
mm/ksm.c:2959 __ksm_exit() error: uninitialized symbol 'mm_slot'.

Old smatch warnings:
arch/microblaze/include/asm/thread_info.h:85 current_thread_info() error: uninitialized symbol 'sp'.

vim +/mm_slot +2959 mm/ksm.c

f8af4da3b4c14e Hugh Dickins      2009-09-21  2921  
1c2fb7a4c2ca7a Andrea Arcangeli  2009-09-21  2922  void __ksm_exit(struct mm_struct *mm)
f8af4da3b4c14e Hugh Dickins      2009-09-21  2923  {
21fbd59136e077 Qi Zheng          2022-08-31  2924  	struct ksm_mm_slot *mm_slot;
58730ab6c7cab4 Qi Zheng          2022-08-31  2925  	struct mm_slot *slot;
9ba6929480088a Hugh Dickins      2009-09-21  2926  	int easy_to_free = 0;
cd551f97519d35 Hugh Dickins      2009-09-21  2927  
31dbd01f314364 Izik Eidus        2009-09-21  2928  	/*
9ba6929480088a Hugh Dickins      2009-09-21  2929  	 * This process is exiting: if it's straightforward (as is the
9ba6929480088a Hugh Dickins      2009-09-21  2930  	 * case when ksmd was never running), free mm_slot immediately.
9ba6929480088a Hugh Dickins      2009-09-21  2931  	 * But if it's at the cursor or has rmap_items linked to it, use
c1e8d7c6a7a682 Michel Lespinasse 2020-06-08  2932  	 * mmap_lock to synchronize with any break_cows before pagetables
9ba6929480088a Hugh Dickins      2009-09-21  2933  	 * are freed, and leave the mm_slot on the list for ksmd to free.
9ba6929480088a Hugh Dickins      2009-09-21  2934  	 * Beware: ksm may already have noticed it exiting and freed the slot.
31dbd01f314364 Izik Eidus        2009-09-21  2935  	 */
9ba6929480088a Hugh Dickins      2009-09-21  2936  
cd551f97519d35 Hugh Dickins      2009-09-21  2937  	spin_lock(&ksm_mmlist_lock);
58730ab6c7cab4 Qi Zheng          2022-08-31  2938  	slot = mm_slot_lookup(mm_slots_hash, mm);
de4014f857d062 Wei Yang          2025-09-19  2939  	if (slot) {
58730ab6c7cab4 Qi Zheng          2022-08-31  2940  		mm_slot = mm_slot_entry(slot, struct ksm_mm_slot, slot);
de4014f857d062 Wei Yang          2025-09-19  2941  		if (ksm_scan.mm_slot != mm_slot) {
6514d511dbe5a7 Hugh Dickins      2009-12-14  2942  			if (!mm_slot->rmap_list) {
58730ab6c7cab4 Qi Zheng          2022-08-31  2943  				hash_del(&slot->hash);
58730ab6c7cab4 Qi Zheng          2022-08-31  2944  				list_del(&slot->mm_node);
9ba6929480088a Hugh Dickins      2009-09-21  2945  				easy_to_free = 1;
9ba6929480088a Hugh Dickins      2009-09-21  2946  			} else {
58730ab6c7cab4 Qi Zheng          2022-08-31  2947  				list_move(&slot->mm_node,
58730ab6c7cab4 Qi Zheng          2022-08-31  2948  					  &ksm_scan.mm_slot->slot.mm_node);
9ba6929480088a Hugh Dickins      2009-09-21  2949  			}
9ba6929480088a Hugh Dickins      2009-09-21  2950  		}
de4014f857d062 Wei Yang          2025-09-19  2951  	}
cd551f97519d35 Hugh Dickins      2009-09-21  2952  	spin_unlock(&ksm_mmlist_lock);
cd551f97519d35 Hugh Dickins      2009-09-21  2953  
9ba6929480088a Hugh Dickins      2009-09-21  2954  	if (easy_to_free) {
58730ab6c7cab4 Qi Zheng          2022-08-31  2955  		mm_slot_free(mm_slot_cache, mm_slot);
12e423ba4eaed7 Lorenzo Stoakes   2025-08-12  2956  		mm_flags_clear(MMF_VM_MERGE_ANY, mm);
12e423ba4eaed7 Lorenzo Stoakes   2025-08-12  2957  		mm_flags_clear(MMF_VM_MERGEABLE, mm);
9ba6929480088a Hugh Dickins      2009-09-21  2958  		mmdrop(mm);
9ba6929480088a Hugh Dickins      2009-09-21 @2959  	} else if (mm_slot) {
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  2960  		mmap_write_lock(mm);
d8ed45c5dcd455 Michel Lespinasse 2020-06-08  2961  		mmap_write_unlock(mm);
9ba6929480088a Hugh Dickins      2009-09-21  2962  	}
739100c88f49a6 Stefan Roesch     2023-02-10  2963  
739100c88f49a6 Stefan Roesch     2023-02-10  2964  	trace_ksm_exit(mm);
31dbd01f314364 Izik Eidus        2009-09-21  2965  }
31dbd01f314364 Izik Eidus        2009-09-21  2966  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
