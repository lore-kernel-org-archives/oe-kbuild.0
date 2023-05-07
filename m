Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55C5628F2
	for <oe-kbuild@lists.linux.dev>; Sun,  7 May 2023 22:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683500153; x=1715036153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HMiFX+YhEXAjewW8++tnqHlsVmfjqLX7Cjrh+ZR6ffs=;
  b=Wi9PYMO91uqGkNQxQNSXQ9ZjZhFx9Q4f2tSpDX/PyxxFKfXMPv3SvCE1
   C6TEdoOLFTfAdc8K70Ovx8HhoeftyvRrFrlpsqMLenZZt8X/XyEG33Mab
   G6+GjUf4Em4e2ih/70atABF6j8KRXI8rBW1+ztQiy6Dvr6bV/fiQP6mCV
   XEQalfDFNcX3Q6BoHRKnue24Ex0gY6vhLDie3ngyVJspVTStynAuXtYWq
   hXloRHRyokHWXgthaJDJPamOxnXZijHE8fej1XN2b0qJ60QFAR8He24b+
   tgcvBQjtWsTDvdyeRAd377a2DlN/Fjxh120AnTCHelGEQHXuVJxncnU7P
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="352572730"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="352572730"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2023 15:55:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="810042112"
X-IronPort-AV: E=Sophos;i="5.99,257,1677571200"; 
   d="scan'208";a="810042112"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 07 May 2023 15:55:51 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvnIE-0000tl-2I;
	Sun, 07 May 2023 22:55:50 +0000
Date: Mon, 8 May 2023 06:55:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC v2 4/4] mm/ptshare: Add page fault handling for page
 table shared regions
Message-ID: <202305080652.26E18YDE-lkp@intel.com>
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
In-Reply-To: <9edffd2a12a049a42d9a2c216e3f999aae7e65a4.1682453344.git.khalid.aziz@oracle.com>
References: <9edffd2a12a049a42d9a2c216e3f999aae7e65a4.1682453344.git.khalid.aziz@oracle.com>
TO: Khalid Aziz <khalid.aziz@oracle.com>

Hi Khalid,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arnd-asm-generic/master]
[also build test WARNING on vfs-idmapping/for-next linus/master v6.4-rc1 next-20230505]
[cannot apply to akpm-mm/mm-everything]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Khalid-Aziz/mm-ptshare-Add-vm-flag-for-shared-PTE/20230427-005143
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git master
patch link:    https://lore.kernel.org/r/9edffd2a12a049a42d9a2c216e3f999aae7e65a4.1682453344.git.khalid.aziz%40oracle.com
patch subject: [PATCH RFC v2 4/4] mm/ptshare: Add page fault handling for page table shared regions
:::::: branch date: 11 days ago
:::::: commit date: 11 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230508/202305080652.26E18YDE-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305080652.26E18YDE-lkp@intel.com/

smatch warnings:
mm/memory.c:5220 handle_mm_fault() warn: variable dereferenced before check 'vma' (see line 5209)

vim +/vma +5220 mm/memory.c

cdc5021cda1941 David Hildenbrand       2022-11-16  5192  
9a95f3cf7b33d6 Paul Cassella           2014-08-06  5193  /*
9a95f3cf7b33d6 Paul Cassella           2014-08-06  5194   * By the time we get here, we already hold the mm semaphore
9a95f3cf7b33d6 Paul Cassella           2014-08-06  5195   *
c1e8d7c6a7a682 Michel Lespinasse       2020-06-08  5196   * The mmap_lock may have been released depending on flags and our
9138e47ed42524 Matthew Wilcox (Oracle  2021-03-18  5197)  * return value.  See filemap_fault() and __folio_lock_or_retry().
9a95f3cf7b33d6 Paul Cassella           2014-08-06  5198   */
2b7403035459c7 Souptick Joarder        2018-08-23  5199  vm_fault_t handle_mm_fault(struct vm_area_struct *vma, unsigned long address,
bce617edecada0 Peter Xu                2020-08-11  5200  			   unsigned int flags, struct pt_regs *regs)
519e52473ebe9d Johannes Weiner         2013-09-12  5201  {
2b7403035459c7 Souptick Joarder        2018-08-23  5202  	vm_fault_t ret;
a2eef9e49f572b Khalid Aziz             2023-04-26  5203  	bool shared = false;
a2eef9e49f572b Khalid Aziz             2023-04-26  5204  	struct mm_struct *orig_mm;
519e52473ebe9d Johannes Weiner         2013-09-12  5205  
519e52473ebe9d Johannes Weiner         2013-09-12  5206  	__set_current_state(TASK_RUNNING);
519e52473ebe9d Johannes Weiner         2013-09-12  5207  
519e52473ebe9d Johannes Weiner         2013-09-12  5208  	count_vm_event(PGFAULT);
2262185c5b287f Roman Gushchin          2017-07-06 @5209  	count_memcg_event_mm(vma->vm_mm, PGFAULT);
519e52473ebe9d Johannes Weiner         2013-09-12  5210  
cdc5021cda1941 David Hildenbrand       2022-11-16  5211  	ret = sanitize_fault_flags(vma, &flags);
cdc5021cda1941 David Hildenbrand       2022-11-16  5212  	if (ret)
cdc5021cda1941 David Hildenbrand       2022-11-16  5213  		return ret;
cdc5021cda1941 David Hildenbrand       2022-11-16  5214  
a2eef9e49f572b Khalid Aziz             2023-04-26  5215  	orig_mm = vma->vm_mm;
a2eef9e49f572b Khalid Aziz             2023-04-26  5216  	if (unlikely(vma_is_shared(vma))) {
a2eef9e49f572b Khalid Aziz             2023-04-26  5217  		ret = find_shared_vma(&vma, &address, flags);
a2eef9e49f572b Khalid Aziz             2023-04-26  5218  		if (ret)
a2eef9e49f572b Khalid Aziz             2023-04-26  5219  			return ret;
a2eef9e49f572b Khalid Aziz             2023-04-26 @5220  		if (!vma)
a2eef9e49f572b Khalid Aziz             2023-04-26  5221  			return VM_FAULT_SIGSEGV;
a2eef9e49f572b Khalid Aziz             2023-04-26  5222  		shared = true;
a2eef9e49f572b Khalid Aziz             2023-04-26  5223  	}
a2eef9e49f572b Khalid Aziz             2023-04-26  5224  
de0c799bba2610 Laurent Dufour          2017-09-08  5225  	if (!arch_vma_access_permitted(vma, flags & FAULT_FLAG_WRITE,
de0c799bba2610 Laurent Dufour          2017-09-08  5226  					    flags & FAULT_FLAG_INSTRUCTION,
de0c799bba2610 Laurent Dufour          2017-09-08  5227  					    flags & FAULT_FLAG_REMOTE))
de0c799bba2610 Laurent Dufour          2017-09-08  5228  		return VM_FAULT_SIGSEGV;
de0c799bba2610 Laurent Dufour          2017-09-08  5229  
519e52473ebe9d Johannes Weiner         2013-09-12  5230  	/*
519e52473ebe9d Johannes Weiner         2013-09-12  5231  	 * Enable the memcg OOM handling for faults triggered in user
519e52473ebe9d Johannes Weiner         2013-09-12  5232  	 * space.  Kernel faults are handled more gracefully.
519e52473ebe9d Johannes Weiner         2013-09-12  5233  	 */
519e52473ebe9d Johannes Weiner         2013-09-12  5234  	if (flags & FAULT_FLAG_USER)
29ef680ae7c211 Michal Hocko            2018-08-17  5235  		mem_cgroup_enter_user_fault();
519e52473ebe9d Johannes Weiner         2013-09-12  5236  
ec1c86b25f4bdd Yu Zhao                 2022-09-18  5237  	lru_gen_enter_fault(vma);
ec1c86b25f4bdd Yu Zhao                 2022-09-18  5238  
bae473a423f65e Kirill A. Shutemov      2016-07-26  5239  	if (unlikely(is_vm_hugetlb_page(vma)))
bae473a423f65e Kirill A. Shutemov      2016-07-26  5240  		ret = hugetlb_fault(vma->vm_mm, vma, address, flags);
bae473a423f65e Kirill A. Shutemov      2016-07-26  5241  	else
dcddffd41d3f1d Kirill A. Shutemov      2016-07-26  5242  		ret = __handle_mm_fault(vma, address, flags);
519e52473ebe9d Johannes Weiner         2013-09-12  5243  
ec1c86b25f4bdd Yu Zhao                 2022-09-18  5244  	lru_gen_exit_fault();
ec1c86b25f4bdd Yu Zhao                 2022-09-18  5245  
a2eef9e49f572b Khalid Aziz             2023-04-26  5246  	/*
a2eef9e49f572b Khalid Aziz             2023-04-26  5247  	 * Release the read lock on shared VMA's parent mm unless
a2eef9e49f572b Khalid Aziz             2023-04-26  5248  	 * __handle_mm_fault released the lock already.
a2eef9e49f572b Khalid Aziz             2023-04-26  5249  	 * __handle_mm_fault sets VM_FAULT_RETRY in return value if
a2eef9e49f572b Khalid Aziz             2023-04-26  5250  	 * it released mmap lock. If lock was released, that implies
a2eef9e49f572b Khalid Aziz             2023-04-26  5251  	 * the lock would have been released on task's original mm if
a2eef9e49f572b Khalid Aziz             2023-04-26  5252  	 * this were not a shared PTE vma. To keep lock state consistent,
a2eef9e49f572b Khalid Aziz             2023-04-26  5253  	 * make sure to release the lock on task's original mm
a2eef9e49f572b Khalid Aziz             2023-04-26  5254  	 */
a2eef9e49f572b Khalid Aziz             2023-04-26  5255  	if (shared) {
a2eef9e49f572b Khalid Aziz             2023-04-26  5256  		int release_mmlock = 1;
a2eef9e49f572b Khalid Aziz             2023-04-26  5257  
a2eef9e49f572b Khalid Aziz             2023-04-26  5258  		if (!(ret & VM_FAULT_RETRY)) {
a2eef9e49f572b Khalid Aziz             2023-04-26  5259  			mmap_read_unlock(vma->vm_mm);
a2eef9e49f572b Khalid Aziz             2023-04-26  5260  			release_mmlock = 0;
a2eef9e49f572b Khalid Aziz             2023-04-26  5261  		} else if ((flags & FAULT_FLAG_ALLOW_RETRY) &&
a2eef9e49f572b Khalid Aziz             2023-04-26  5262  			(flags & FAULT_FLAG_RETRY_NOWAIT)) {
a2eef9e49f572b Khalid Aziz             2023-04-26  5263  			mmap_read_unlock(vma->vm_mm);
a2eef9e49f572b Khalid Aziz             2023-04-26  5264  			release_mmlock = 0;
a2eef9e49f572b Khalid Aziz             2023-04-26  5265  		}
a2eef9e49f572b Khalid Aziz             2023-04-26  5266  
a2eef9e49f572b Khalid Aziz             2023-04-26  5267  		/*
a2eef9e49f572b Khalid Aziz             2023-04-26  5268  		 * Reset guest vma pointers that were set up in
a2eef9e49f572b Khalid Aziz             2023-04-26  5269  		 * find_shared_vma() to process this fault.
a2eef9e49f572b Khalid Aziz             2023-04-26  5270  		 */
a2eef9e49f572b Khalid Aziz             2023-04-26  5271  		vma->vm_mm = orig_mm;
a2eef9e49f572b Khalid Aziz             2023-04-26  5272  		if (release_mmlock)
a2eef9e49f572b Khalid Aziz             2023-04-26  5273  			mmap_read_unlock(orig_mm);
a2eef9e49f572b Khalid Aziz             2023-04-26  5274  	}
a2eef9e49f572b Khalid Aziz             2023-04-26  5275  
4942642080ea82 Johannes Weiner         2013-10-16  5276  	if (flags & FAULT_FLAG_USER) {
29ef680ae7c211 Michal Hocko            2018-08-17  5277  		mem_cgroup_exit_user_fault();
4942642080ea82 Johannes Weiner         2013-10-16  5278  		/*
4942642080ea82 Johannes Weiner         2013-10-16  5279  		 * The task may have entered a memcg OOM situation but
4942642080ea82 Johannes Weiner         2013-10-16  5280  		 * if the allocation error was handled gracefully (no
4942642080ea82 Johannes Weiner         2013-10-16  5281  		 * VM_FAULT_OOM), there is no need to kill anything.
4942642080ea82 Johannes Weiner         2013-10-16  5282  		 * Just clean up the OOM state peacefully.
4942642080ea82 Johannes Weiner         2013-10-16  5283  		 */
4942642080ea82 Johannes Weiner         2013-10-16  5284  		if (task_in_memcg_oom(current) && !(ret & VM_FAULT_OOM))
4942642080ea82 Johannes Weiner         2013-10-16  5285  			mem_cgroup_oom_synchronize(false);
4942642080ea82 Johannes Weiner         2013-10-16  5286  	}
3812c8c8f39539 Johannes Weiner         2013-09-12  5287  
bce617edecada0 Peter Xu                2020-08-11  5288  	mm_account_fault(regs, address, flags, ret);
bce617edecada0 Peter Xu                2020-08-11  5289  
519e52473ebe9d Johannes Weiner         2013-09-12  5290  	return ret;
519e52473ebe9d Johannes Weiner         2013-09-12  5291  }
e1d6d01ab491be Jesse Barnes            2014-12-12  5292  EXPORT_SYMBOL_GPL(handle_mm_fault);
519e52473ebe9d Johannes Weiner         2013-09-12  5293  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
