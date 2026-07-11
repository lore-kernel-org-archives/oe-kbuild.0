Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 262B52DA75C
	for <oe-kbuild@lists.linux.dev>; Sat, 11 Jul 2026 20:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783800675; cv=none; b=UgukyAVTPGZLndzvCEidwdqbo8wbBKkNu8Tf0vYHqF09UmXmU6flrObkSzVs8AkFiYSSX0MARGvXpKW3khd2zT+MDYrkbW10kKIYxBa6eH/ET0Kp6f4AwhFaHOucsuLUFPBTa0mxH7Q7ZOT0J1y/ZGtl2gDPyMEIIf//9Hagfeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783800675; c=relaxed/simple;
	bh=cVbc01b8GqFla1ezK67we7iixl+e1LGLvSDoJnEoBaY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dELRv8yCIjH90rsca3pK6Dj9GzT5/z+omdei+y90Db/6PY83siKoGsNSluE3lDvGmcfIQFW9IgCLwff3kW4PM05wZwk8qQ2jgZSealgmHWhXUKrgDlCW7bNXgSoPQaKBq4OCkAheycz/6hRY1Z3N8WkIGcElLq/ORUkUoTA4baI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c+0zwe/O; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c+0zwe/O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783800673; x=1815336673;
  h=date:from:to:cc:subject:message-id;
  bh=cVbc01b8GqFla1ezK67we7iixl+e1LGLvSDoJnEoBaY=;
  b=c+0zwe/Obfs752wZ2vKv6wN/dEoUx7TJQKbFs1ZrJUP82fwOt5Ur7Qm4
   3Nqz2hG7yo5bHDIF32KvuS8A8x2Lyo8htyQ7uTxDlyqGbcdCNTdIbqNM6
   0/14vYb0a0Su8OJvSg1XbtLDTs8LsrZ8j8534IZGI8J7FfRrvTkHG8RvS
   T488+4iN1AdMiOM7EQlhMFGs8Vf75CYgWU2XOExyuuFbfMI7J6VlMa337
   bsS29WD2Zac/mnnYgCUGGAEuDsNKeKly/VPeCazCHTHXCYTZ5XhwEMY36
   gjNCqDhmM9daQBwaKmGyJFVneZFP3PElNZqW0AalTLhRVBXbN0MnNwE0c
   g==;
X-CSE-ConnectionGUID: s3FfnHAPRW+FyzMVugPwsw==
X-CSE-MsgGUID: ihAcKCzSReymeJ4kTMmagA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95073676"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95073676"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 13:11:12 -0700
X-CSE-ConnectionGUID: JGafP3z+QIWgfX2z33SXbA==
X-CSE-MsgGUID: uw3a2lLyShWzvJm1ZBlXTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="250765168"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jul 2026 13:11:11 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wie2X-00000000KNC-0QJ0;
	Sat, 11 Jul 2026 20:11:09 +0000
Date: Sun, 12 Jul 2026 04:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [akpm-mm:mm-new 415/461] mm/hmm.c:672 hmm_do_fault() error:
 we previously assumed 'hmm_vma_walk->locked' could be null (see line 653)
Message-ID: <202607120402.clBrrZQA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: David Hildenbrand <david@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: mm-commits@vger.kernel.org
TO: Stanislav Kinsburskii <skinsburskii@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   61cccb8363fcc282d4ae0555b8739dd227f5ad0b
commit: cf5190133132cab57fb5f9ff881dddcaf748456b [415/461] mm/hmm: add hmm_range_fault_unlocked_timeout() for mmap lock-drop support
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: x86_64-randconfig-161-20260711 (https://download.01.org/0day-ci/archive/20260712/202607120402.clBrrZQA-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607120402.clBrrZQA-lkp@intel.com/

smatch warnings:
mm/hmm.c:672 hmm_do_fault() error: we previously assumed 'hmm_vma_walk->locked' could be null (see line 653)

vim +672 mm/hmm.c

7b86ac3371b70c Christoph Hellwig     2019-08-28  632  
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  633  /*
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  634   * hmm_do_fault - fault in a range recorded by a walk callback
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  635   *
cf5190133132ca Stanislav Kinsburskii 2026-07-10  636   * Called from the outer loop in hmm_range_fault_locked() after a callback
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  637   * returned HMM_FAULT_PENDING.  At this point we hold only mmap_lock;
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  638   * the page-table spinlock and any hugetlb_vma_lock acquired by the walk
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  639   * framework have already been released by the unwind.
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  640   *
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  641   * Returns -EBUSY on success (all pages faulted, caller should re-walk).
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  642   * Returns a negative errno on failure.
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  643   */
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  644  static int hmm_do_fault(struct mm_struct *mm,
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  645  			struct hmm_vma_walk *hmm_vma_walk)
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  646  {
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  647  	unsigned long addr = hmm_vma_walk->last;
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  648  	unsigned long end = hmm_vma_walk->end;
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  649  	unsigned int required_fault = hmm_vma_walk->required_fault;
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  650  	unsigned int fault_flags = FAULT_FLAG_REMOTE;
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  651  	struct vm_area_struct *vma;
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  652  
cf5190133132ca Stanislav Kinsburskii 2026-07-10 @653  	if (hmm_vma_walk->locked)
cf5190133132ca Stanislav Kinsburskii 2026-07-10  654  		fault_flags |= FAULT_FLAG_ALLOW_RETRY | FAULT_FLAG_KILLABLE;
cf5190133132ca Stanislav Kinsburskii 2026-07-10  655  
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  656  	vma = vma_lookup(mm, addr);
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  657  	if (!vma)
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  658  		return -EFAULT;
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  659  
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  660  	if (required_fault & HMM_NEED_WRITE_FAULT) {
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  661  		if (!(vma->vm_flags & VM_WRITE))
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  662  			return -EPERM;
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  663  		fault_flags |= FAULT_FLAG_WRITE;
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  664  	}
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  665  
cf5190133132ca Stanislav Kinsburskii 2026-07-10  666  	for (; addr < end; addr += PAGE_SIZE) {
cf5190133132ca Stanislav Kinsburskii 2026-07-10  667  		vm_fault_t ret;
cf5190133132ca Stanislav Kinsburskii 2026-07-10  668  
cf5190133132ca Stanislav Kinsburskii 2026-07-10  669  		ret = handle_mm_fault(vma, addr, fault_flags, NULL);
cf5190133132ca Stanislav Kinsburskii 2026-07-10  670  
cf5190133132ca Stanislav Kinsburskii 2026-07-10  671  		if (ret & (VM_FAULT_COMPLETED | VM_FAULT_RETRY)) {
cf5190133132ca Stanislav Kinsburskii 2026-07-10 @672  			*hmm_vma_walk->locked = false;
cf5190133132ca Stanislav Kinsburskii 2026-07-10  673  			return HMM_FAULT_UNLOCKED;
cf5190133132ca Stanislav Kinsburskii 2026-07-10  674  		}
cf5190133132ca Stanislav Kinsburskii 2026-07-10  675  
cf5190133132ca Stanislav Kinsburskii 2026-07-10  676  		if (ret & VM_FAULT_ERROR) {
cf5190133132ca Stanislav Kinsburskii 2026-07-10  677  			int err = vm_fault_to_errno(ret, 0);
cf5190133132ca Stanislav Kinsburskii 2026-07-10  678  
cf5190133132ca Stanislav Kinsburskii 2026-07-10  679  			if (WARN_ON(!err))
cf5190133132ca Stanislav Kinsburskii 2026-07-10  680  				err = -EINVAL;
cf5190133132ca Stanislav Kinsburskii 2026-07-10  681  
cf5190133132ca Stanislav Kinsburskii 2026-07-10  682  			return err;
cf5190133132ca Stanislav Kinsburskii 2026-07-10  683  		}
cf5190133132ca Stanislav Kinsburskii 2026-07-10  684  	}
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  685  
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  686  	return -EBUSY;
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  687  }
c10ed1c5cb4ce2 Stanislav Kinsburskii 2026-07-10  688  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
