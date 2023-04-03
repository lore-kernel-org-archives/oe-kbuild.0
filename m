Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8430BA925
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Apr 2023 20:29:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680553781; x=1712089781;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UG3uBC7ca0alyAQpKJGienK8rzlx/bkdpwlLcpAMb68=;
  b=g6zzsVJtLwXEC+HQ8EXI1YpVrkUNjVPw5z7eaz+wDga0vaWtLn9KJxKN
   5P/H7e7IYS7JjoFT2VrAGgTCHawp84/yyWVR6WprDqs4/EO0CM2PxFDEy
   CW7yuekpq7FPQLyOGHa+2W75MsLFokDLX1ZqMCKVjtSQKdnDGvj82nb4L
   moag/g7xPst9W3QozCgfsn3GE063UsUbbVy9zmMSeUpj/KuUAL4z4R4fI
   aqBr6esX9bGG9pfPmy1ExcOt3HNf37+WwMXwNtBxxwk4qG+x2VZ8zE9uR
   nSL15A2HWoEvP2LDs/h5HkRZoVcjojeOEqd78h835fxRao4qpYfSbErWO
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="343704014"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="343704014"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Apr 2023 13:29:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10669"; a="860335810"
X-IronPort-AV: E=Sophos;i="5.98,315,1673942400"; 
   d="scan'208";a="860335810"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Apr 2023 13:29:39 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pjQo7-000Omo-07;
	Mon, 03 Apr 2023 20:29:39 +0000
Date: Tue, 4 Apr 2023 04:29:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/proc/task_mmu.c:917:2: warning: syntax error [syntaxError]
Message-ID: <202304040424.COVhAmXe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/proc/task_mmu.c:917:2: warning: syntax error [syntaxError]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   148341f0a2f53b5e8808d093333d85170586a15d
commit: 250cb40f0afee232d8573d7b1d8bc56d4b92f63e task_mmu: convert to vma iterator
date:   8 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 weeks ago
compiler: arceb-elf-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 250cb40f0afee232d8573d7b1d8bc56d4b92f63e
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202304040424.COVhAmXe-lkp@intel.com/


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/proc/task_mmu.c:917:2: warning: syntax error [syntaxError]
    do {
    ^
>> ipc/shm.c:158:0: warning: failed to expand 'ipc_init_proc_interface', it is invalid to use a preprocessor directive as macro parameter [preprocessorErrorDirective]
   #if BITS_PER_LONG <= 32
   ^
>> mm/mprotect.c:836:3: warning: Assignment of function parameter has no effect outside the function. [uselessAssignmentArg]
     prot = reqprot;
     ^

vim +917 fs/proc/task_mmu.c

258f669e7e88c1 Vlastimil Babka         2018-08-21   884  
258f669e7e88c1 Vlastimil Babka         2018-08-21   885  static int show_smaps_rollup(struct seq_file *m, void *v)
258f669e7e88c1 Vlastimil Babka         2018-08-21   886  {
258f669e7e88c1 Vlastimil Babka         2018-08-21   887  	struct proc_maps_private *priv = m->private;
258f669e7e88c1 Vlastimil Babka         2018-08-21   888  	struct mem_size_stats mss;
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06   889) 	struct mm_struct *mm = priv->mm;
258f669e7e88c1 Vlastimil Babka         2018-08-21   890  	struct vm_area_struct *vma;
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06   891) 	unsigned long vma_start = 0, last_vma_end = 0;
258f669e7e88c1 Vlastimil Babka         2018-08-21   892  	int ret = 0;
250cb40f0afee2 Liam R. Howlett         2023-01-20   893  	VMA_ITERATOR(vmi, mm, 0);
258f669e7e88c1 Vlastimil Babka         2018-08-21   894  
258f669e7e88c1 Vlastimil Babka         2018-08-21   895  	priv->task = get_proc_task(priv->inode);
258f669e7e88c1 Vlastimil Babka         2018-08-21   896  	if (!priv->task)
258f669e7e88c1 Vlastimil Babka         2018-08-21   897  		return -ESRCH;
258f669e7e88c1 Vlastimil Babka         2018-08-21   898  
258f669e7e88c1 Vlastimil Babka         2018-08-21   899  	if (!mm || !mmget_not_zero(mm)) {
258f669e7e88c1 Vlastimil Babka         2018-08-21   900  		ret = -ESRCH;
258f669e7e88c1 Vlastimil Babka         2018-08-21   901  		goto out_put_task;
258f669e7e88c1 Vlastimil Babka         2018-08-21   902  	}
258f669e7e88c1 Vlastimil Babka         2018-08-21   903  
258f669e7e88c1 Vlastimil Babka         2018-08-21   904  	memset(&mss, 0, sizeof(mss));
258f669e7e88c1 Vlastimil Babka         2018-08-21   905  
d8ed45c5dcd455 Michel Lespinasse       2020-06-08   906  	ret = mmap_read_lock_killable(mm);
a26a9781554857 Konstantin Khlebnikov   2019-07-11   907  	if (ret)
a26a9781554857 Konstantin Khlebnikov   2019-07-11   908  		goto out_put_mm;
a26a9781554857 Konstantin Khlebnikov   2019-07-11   909  
258f669e7e88c1 Vlastimil Babka         2018-08-21   910  	hold_task_mempolicy(priv);
250cb40f0afee2 Liam R. Howlett         2023-01-20   911  	vma = vma_next(&vmi);
258f669e7e88c1 Vlastimil Babka         2018-08-21   912  
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06   913) 	if (unlikely(!vma))
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06   914) 		goto empty_set;
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06   915) 
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06   916) 	vma_start = vma->vm_start;
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06  @917) 	do {
03b4b1149308b0 Chinwen Chang           2020-10-13   918  		smap_gather_stats(vma, &mss, 0);
258f669e7e88c1 Vlastimil Babka         2018-08-21   919  		last_vma_end = vma->vm_end;
ff9f47f6f00cfe Chinwen Chang           2020-10-13   920  
ff9f47f6f00cfe Chinwen Chang           2020-10-13   921  		/*
ff9f47f6f00cfe Chinwen Chang           2020-10-13   922  		 * Release mmap_lock temporarily if someone wants to
ff9f47f6f00cfe Chinwen Chang           2020-10-13   923  		 * access it for write request.
ff9f47f6f00cfe Chinwen Chang           2020-10-13   924  		 */
ff9f47f6f00cfe Chinwen Chang           2020-10-13   925  		if (mmap_lock_is_contended(mm)) {
250cb40f0afee2 Liam R. Howlett         2023-01-20   926  			vma_iter_invalidate(&vmi);
ff9f47f6f00cfe Chinwen Chang           2020-10-13   927  			mmap_read_unlock(mm);
ff9f47f6f00cfe Chinwen Chang           2020-10-13   928  			ret = mmap_read_lock_killable(mm);
ff9f47f6f00cfe Chinwen Chang           2020-10-13   929  			if (ret) {
ff9f47f6f00cfe Chinwen Chang           2020-10-13   930  				release_task_mempolicy(priv);
ff9f47f6f00cfe Chinwen Chang           2020-10-13   931  				goto out_put_mm;
ff9f47f6f00cfe Chinwen Chang           2020-10-13   932  			}
ff9f47f6f00cfe Chinwen Chang           2020-10-13   933  
ff9f47f6f00cfe Chinwen Chang           2020-10-13   934  			/*
ff9f47f6f00cfe Chinwen Chang           2020-10-13   935  			 * After dropping the lock, there are four cases to
ff9f47f6f00cfe Chinwen Chang           2020-10-13   936  			 * consider. See the following example for explanation.
ff9f47f6f00cfe Chinwen Chang           2020-10-13   937  			 *
ff9f47f6f00cfe Chinwen Chang           2020-10-13   938  			 *   +------+------+-----------+
ff9f47f6f00cfe Chinwen Chang           2020-10-13   939  			 *   | VMA1 | VMA2 | VMA3      |
ff9f47f6f00cfe Chinwen Chang           2020-10-13   940  			 *   +------+------+-----------+
ff9f47f6f00cfe Chinwen Chang           2020-10-13   941  			 *   |      |      |           |
ff9f47f6f00cfe Chinwen Chang           2020-10-13   942  			 *  4k     8k     16k         400k
ff9f47f6f00cfe Chinwen Chang           2020-10-13   943  			 *
ff9f47f6f00cfe Chinwen Chang           2020-10-13   944  			 * Suppose we drop the lock after reading VMA2 due to
ff9f47f6f00cfe Chinwen Chang           2020-10-13   945  			 * contention, then we get:
ff9f47f6f00cfe Chinwen Chang           2020-10-13   946  			 *
ff9f47f6f00cfe Chinwen Chang           2020-10-13   947  			 *	last_vma_end = 16k
ff9f47f6f00cfe Chinwen Chang           2020-10-13   948  			 *
ff9f47f6f00cfe Chinwen Chang           2020-10-13   949  			 * 1) VMA2 is freed, but VMA3 exists:
ff9f47f6f00cfe Chinwen Chang           2020-10-13   950  			 *
250cb40f0afee2 Liam R. Howlett         2023-01-20   951  			 *    vma_next(vmi) will return VMA3.
ff9f47f6f00cfe Chinwen Chang           2020-10-13   952  			 *    In this case, just continue from VMA3.
ff9f47f6f00cfe Chinwen Chang           2020-10-13   953  			 *
ff9f47f6f00cfe Chinwen Chang           2020-10-13   954  			 * 2) VMA2 still exists:
ff9f47f6f00cfe Chinwen Chang           2020-10-13   955  			 *
250cb40f0afee2 Liam R. Howlett         2023-01-20   956  			 *    vma_next(vmi) will return VMA3.
250cb40f0afee2 Liam R. Howlett         2023-01-20   957  			 *    In this case, just continue from VMA3.
ff9f47f6f00cfe Chinwen Chang           2020-10-13   958  			 *
ff9f47f6f00cfe Chinwen Chang           2020-10-13   959  			 * 3) No more VMAs can be found:
ff9f47f6f00cfe Chinwen Chang           2020-10-13   960  			 *
250cb40f0afee2 Liam R. Howlett         2023-01-20   961  			 *    vma_next(vmi) will return NULL.
ff9f47f6f00cfe Chinwen Chang           2020-10-13   962  			 *    No more things to do, just break.
ff9f47f6f00cfe Chinwen Chang           2020-10-13   963  			 *
ff9f47f6f00cfe Chinwen Chang           2020-10-13   964  			 * 4) (last_vma_end - 1) is the middle of a vma (VMA'):
ff9f47f6f00cfe Chinwen Chang           2020-10-13   965  			 *
250cb40f0afee2 Liam R. Howlett         2023-01-20   966  			 *    vma_next(vmi) will return VMA' whose range
ff9f47f6f00cfe Chinwen Chang           2020-10-13   967  			 *    contains last_vma_end.
ff9f47f6f00cfe Chinwen Chang           2020-10-13   968  			 *    Iterate VMA' from last_vma_end.
ff9f47f6f00cfe Chinwen Chang           2020-10-13   969  			 */
250cb40f0afee2 Liam R. Howlett         2023-01-20   970  			vma = vma_next(&vmi);
ff9f47f6f00cfe Chinwen Chang           2020-10-13   971  			/* Case 3 above */
ff9f47f6f00cfe Chinwen Chang           2020-10-13   972  			if (!vma)
ff9f47f6f00cfe Chinwen Chang           2020-10-13   973  				break;
ff9f47f6f00cfe Chinwen Chang           2020-10-13   974  
250cb40f0afee2 Liam R. Howlett         2023-01-20   975  			/* Case 1 and 2 above */
ff9f47f6f00cfe Chinwen Chang           2020-10-13   976  			if (vma->vm_start >= last_vma_end)
ff9f47f6f00cfe Chinwen Chang           2020-10-13   977  				continue;
ff9f47f6f00cfe Chinwen Chang           2020-10-13   978  
ff9f47f6f00cfe Chinwen Chang           2020-10-13   979  			/* Case 4 above */
ff9f47f6f00cfe Chinwen Chang           2020-10-13   980  			if (vma->vm_end > last_vma_end)
ff9f47f6f00cfe Chinwen Chang           2020-10-13   981  				smap_gather_stats(vma, &mss, last_vma_end);
ff9f47f6f00cfe Chinwen Chang           2020-10-13   982  		}
250cb40f0afee2 Liam R. Howlett         2023-01-20   983  	} for_each_vma(vmi, vma);
258f669e7e88c1 Vlastimil Babka         2018-08-21   984  
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06   985) empty_set:
c4c84f06285e48 Matthew Wilcox (Oracle  2022-09-06   986) 	show_vma_header_prefix(m, vma_start, last_vma_end, 0, 0, 0, 0);
258f669e7e88c1 Vlastimil Babka         2018-08-21   987  	seq_pad(m, ' ');
258f669e7e88c1 Vlastimil Babka         2018-08-21   988  	seq_puts(m, "[rollup]\n");
258f669e7e88c1 Vlastimil Babka         2018-08-21   989  
ee2ad71b0756e9 Luigi Semenzato         2019-07-11   990  	__show_smap(m, &mss, true);
258f669e7e88c1 Vlastimil Babka         2018-08-21   991  
258f669e7e88c1 Vlastimil Babka         2018-08-21   992  	release_task_mempolicy(priv);
d8ed45c5dcd455 Michel Lespinasse       2020-06-08   993  	mmap_read_unlock(mm);
258f669e7e88c1 Vlastimil Babka         2018-08-21   994  
a26a9781554857 Konstantin Khlebnikov   2019-07-11   995  out_put_mm:
a26a9781554857 Konstantin Khlebnikov   2019-07-11   996  	mmput(mm);
258f669e7e88c1 Vlastimil Babka         2018-08-21   997  out_put_task:
258f669e7e88c1 Vlastimil Babka         2018-08-21   998  	put_task_struct(priv->task);
258f669e7e88c1 Vlastimil Babka         2018-08-21   999  	priv->task = NULL;
258f669e7e88c1 Vlastimil Babka         2018-08-21  1000  
493b0e9d945fa9 Daniel Colascione       2017-09-06  1001  	return ret;
e070ad49f31155 Mauricio Lin            2005-09-03  1002  }
d1be35cb6f9697 Andrei Vagin            2018-04-10  1003  #undef SEQ_PUT_DEC
e070ad49f31155 Mauricio Lin            2005-09-03  1004  

:::::: The code at line 917 was first introduced by commit
:::::: c4c84f06285e48f80e9843d0775ad92714ffc35a fs/proc/task_mmu: stop using linked list and highest_vm_end

:::::: TO: Matthew Wilcox (Oracle) <willy@infradead.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
