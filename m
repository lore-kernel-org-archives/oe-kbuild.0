Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D280A31715F
	for <oe-kbuild@lists.linux.dev>; Thu,  7 May 2026 11:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778153993; cv=none; b=B7FGVpU1kIbWJD2ahcgpc0E6TW/9tZzY2V/W/JjuWWC4Mqirca1iGrJBsbVtOaHC6hQxsvytSjlVPHMMKTLDdeUahRc7gQObzu0Zju+4acsqjr0zPVDRPU0NK0cXSamWgRTNMdqbbnRSo0HFyS7DW/tKbS59wPWkXYUACsYtexE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778153993; c=relaxed/simple;
	bh=6g9M/mHWbpvaEf3JqRc+GLz0Lvi0SNdhKopceRsVqKg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ZHYOMZPvzLtqI6402CyHt6I+AubgNKsnIeht80hG2dDz+ygE1zfNx+r+yilPk1qnDZgZSjaDSBMS57WLp/F3GXF9sdrZnweQQ0mA8yt041aHiPMYrRcf0hP0dz/DNZvUXNIdDXRNMof95UssmJS/35t941RWwb4BKxJ76oxC2Ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ikq+liZw; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ikq+liZw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778153992; x=1809689992;
  h=date:from:to:cc:subject:message-id;
  bh=6g9M/mHWbpvaEf3JqRc+GLz0Lvi0SNdhKopceRsVqKg=;
  b=Ikq+liZwp7N9nJzfN+a0Uj3csp7hcJlOR4KbMRr7/9bgsBW5HekruAkE
   lsncWEdh+mNw/skD0F3/G38wlRFB+LO1+quriP2iOF0PrYePhgYLrtFz3
   00vFy2mRGH3gkJ25rKMqzk5xPyeGMX6121oqOiXnQNerNzzjqswO7vXYk
   rwbdvblz3XDHKbKbb5RU8RysZVIm2g2yHoLUGaXz57Sbf/45sz3vps2CV
   ppGl/ekFRi16rUFbauZq0efT2nx5Taia0jiQskTnKtxsv92Sy9IXn7tI5
   1QO1GbKGDO2KJohB/avnPyRLX+pmQRueOveb+7zvKKUSe1YjpMbIt7XQ3
   A==;
X-CSE-ConnectionGUID: DlFP6EPtToi5MNUJZj/vHA==
X-CSE-MsgGUID: Qs0xN+N/S2qIWNK3VxT7aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11778"; a="81671341"
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="81671341"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2026 04:39:51 -0700
X-CSE-ConnectionGUID: 5MVAnVcWScmTdl2B6Swfdw==
X-CSE-MsgGUID: Q/sxAD+MQzqtbZy9DDp6Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,221,1770624000"; 
   d="scan'208";a="230051662"
Received: from lkp-server01.sh.intel.com (HELO d6e19f2f5857) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 May 2026 04:39:50 -0700
Received: from kbuild by d6e19f2f5857 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wKx51-0000000003Z-3kLQ;
	Thu, 07 May 2026 11:39:47 +0000
Date: Thu, 07 May 2026 19:39:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ljs:project/cow-context 14/18] mm/vma.c:3281
 expand_downwards() warn: variable dereferenced before check 'vma->anon_vma'
 (see line 3263)
Message-ID: <202605071933.lpIPQ3YN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Lorenzo Stoakes <ljs@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ljs/linux.git project/cow-context
head:   e02aa02fef8128743869032cb20d26f752cd9154
commit: e6f934583c43ab0189504a82904d071b1a22b1a1 [14/18] HACK: track remap changes on merges, splits
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: arc-randconfig-r072-20260507 (https://download.01.org/0day-ci/archive/20260507/202605071933.lpIPQ3YN-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9065-ge9cc34fd

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605071933.lpIPQ3YN-lkp@intel.com/

smatch warnings:
mm/vma.c:3281 expand_downwards() warn: variable dereferenced before check 'vma->anon_vma' (see line 3263)

vim +3281 mm/vma.c

a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3216  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3217  /*
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3218   * vma is the first one with address < vma->vm_start.  Have to extend vma.
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3219   * mmap_lock held for writing.
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3220   */
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3221  int expand_downwards(struct vm_area_struct *vma, unsigned long address)
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3222  {
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3223  	struct mm_struct *mm = vma->vm_mm;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3224  	struct vm_area_struct *prev;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3225  	int error = 0;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3226  	VMA_ITERATOR(vmi, mm, vma->vm_start);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3227  
769669bd9ca4cba Lorenzo Stoakes (Oracle  2026-03-20  3228) 	if (!vma_test(vma, VMA_GROWSDOWN_BIT))
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3229  		return -EFAULT;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3230  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3231  	mmap_assert_write_locked(mm);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3232  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3233  	address &= PAGE_MASK;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3234  	if (address < mmap_min_addr || address < FIRST_USER_ADDRESS)
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3235  		return -EPERM;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3236  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3237  	/* Enforce stack_guard_gap */
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3238  	prev = vma_prev(&vmi);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3239  	/* Check that both stack segments have the same anon_vma? */
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3240  	if (prev) {
769669bd9ca4cba Lorenzo Stoakes (Oracle  2026-03-20  3241) 		if (!vma_test(prev, VMA_GROWSDOWN_BIT) &&
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3242  		    vma_is_accessible(prev) &&
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3243  		    (address - prev->vm_end < stack_guard_gap))
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3244  			return -ENOMEM;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3245  	}
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3246  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3247  	if (prev)
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3248  		vma_iter_next_range_limit(&vmi, vma->vm_start);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3249  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3250  	vma_iter_config(&vmi, address, vma->vm_end);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3251  	if (vma_iter_prealloc(&vmi, vma))
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3252  		return -ENOMEM;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3253  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3254  	/* We must make sure the anon_vma is allocated. */
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3255  	if (unlikely(anon_vma_prepare(vma))) {
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3256  		vma_iter_free(&vmi);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3257  		return -ENOMEM;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3258  	}
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3259  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3260  	/* Lock the VMA before expanding to prevent concurrent page faults */
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3261  	vma_start_write(vma);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3262  	/* We update the anon VMA tree. */
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03 @3263  	anon_vma_lock_write(vma->anon_vma);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3264  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3265  	/* Somebody else might have raced and expanded it already */
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3266  	if (address < vma->vm_start) {
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3267  		unsigned long size, grow;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3268  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3269  		size = vma->vm_end - address;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3270  		grow = (vma->vm_start - address) >> PAGE_SHIFT;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3271  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3272  		error = -ENOMEM;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3273  		if (grow <= vma->vm_pgoff) {
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3274  			error = acct_stack_growth(vma, size, grow);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3275  			if (!error) {
769669bd9ca4cba Lorenzo Stoakes (Oracle  2026-03-20  3276) 				if (vma_test(vma, VMA_LOCKED_BIT))
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3277  					mm->locked_vm += grow;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3278  				vm_stat_account(mm, vma->vm_flags, grow);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3279  				anon_vma_interval_tree_pre_update_vma(vma);
e6f934583c43ab0 Lorenzo Stoakes          2026-05-01  3280  
e6f934583c43ab0 Lorenzo Stoakes          2026-05-01 @3281  				if (vma->anon_vma)
e6f934583c43ab0 Lorenzo Stoakes          2026-05-01  3282  					cow_context_vma_adjust(vma, address, vma->vm_end);
e6f934583c43ab0 Lorenzo Stoakes          2026-05-01  3283  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3284  				vma->vm_start = address;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3285  				vma->vm_pgoff -= grow;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3286  				/* Overwrite old entry in mtree. */
55e50223bf3e06a Suren Baghdasaryan       2025-02-13  3287  				vma_iter_store_overwrite(&vmi, vma);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3288  				anon_vma_interval_tree_post_update_vma(vma);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3289  
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3290  				perf_event_mmap(vma);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3291  			}
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3292  		}
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3293  	}
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3294  	anon_vma_unlock_write(vma->anon_vma);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3295  	vma_iter_free(&vmi);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3296  	validate_mm(mm);
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3297  	return error;
a9d1f3f2d7fecbc Lorenzo Stoakes          2024-12-03  3298  }
bef5418d1f3dee4 Lorenzo Stoakes          2024-12-03  3299  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
