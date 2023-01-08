Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB2915A1
	for <oe-kbuild@lists.linux.dev>; Sun,  8 Jan 2023 01:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1673140479; x=1704676479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D/DpUNCeW68Zhz5OnnJovcu18iOeJPK3gSsIOat26cE=;
  b=ZKeDXJ1FEirdV7nHj91BrIdaMrzK//gWJD3AgLQv4Qh89hGYGt2yWlh3
   NQwOhtgJ5r+cafAarlhiP4iJWuVt4rjY/iSHtI1HCipmBSLAufVJlIF7x
   tYp/O3MHwDAa/uSmbXp8OAIaUEJF9kzPviSmB+akoO/ledHggijVheHJk
   2y99JKSpQnc7nAKlLJZcvw5Feb2JOFbzZ1vXxoZ11GKuwS6aX+auAxddC
   awEn1focHygPaM6ZRcdQEOg4D+MBMJPtsr4kNYKhcFZlmC/IWy2+9FY7p
   5fw2P/e3B2K5fdqq04CPlCuGIA6wDXd3YTx2vvwLHsP9jLHo8R7G1da+9
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="384985508"
X-IronPort-AV: E=Sophos;i="5.96,309,1665471600"; 
   d="scan'208";a="384985508"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2023 17:14:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10583"; a="688663192"
X-IronPort-AV: E=Sophos;i="5.96,309,1665471600"; 
   d="scan'208";a="688663192"
Received: from lkp-server02.sh.intel.com (HELO f1920e93ebb5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 07 Jan 2023 17:14:37 -0800
Received: from kbuild by f1920e93ebb5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pEKGi-00050g-1W;
	Sun, 08 Jan 2023 01:14:36 +0000
Date: Sun, 8 Jan 2023 09:14:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: mm/madvise.c:124:28: warning: Parameter 'anon_name' can be declared
 as pointer to const [constParameter]
Message-ID: <202301080948.n9GRPhk7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: mm/madvise.c:124:28: warning: Parameter 'anon_name' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9b43a525db125799df81e6fbef712a2ae50bfc5d
commit: 5c26f6ac9416b63d093e29c30e79b3297e425472 mm: refactor vm_area_struct::anon_vma_name usage code
date:   10 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 10 months ago
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 5c26f6ac9416b63d093e29c30e79b3297e425472
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/madvise.c:124:28: warning: Parameter 'anon_name' can be declared as pointer to const [constParameter]
        struct anon_vma_name *anon_name)
                              ^

vim +/anon_name +124 mm/madvise.c

9a10064f5625d5 Colin Cross        2022-01-14  100  
9a10064f5625d5 Colin Cross        2022-01-14  101  /* mmap_lock should be write-locked */
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  102  static int replace_anon_vma_name(struct vm_area_struct *vma,
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  103  				 struct anon_vma_name *anon_name)
9a10064f5625d5 Colin Cross        2022-01-14  104  {
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  105  	struct anon_vma_name *orig_name = anon_vma_name(vma);
78db3412833dc9 Suren Baghdasaryan 2022-01-14  106  
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  107  	if (!anon_name) {
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  108  		vma->anon_name = NULL;
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  109  		anon_vma_name_put(orig_name);
9a10064f5625d5 Colin Cross        2022-01-14  110  		return 0;
9a10064f5625d5 Colin Cross        2022-01-14  111  	}
9a10064f5625d5 Colin Cross        2022-01-14  112  
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  113  	if (anon_vma_name_eq(orig_name, anon_name))
9a10064f5625d5 Colin Cross        2022-01-14  114  		return 0;
9a10064f5625d5 Colin Cross        2022-01-14  115  
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  116  	anon_vma_name_get(anon_name);
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  117  	vma->anon_name = anon_name;
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  118  	anon_vma_name_put(orig_name);
9a10064f5625d5 Colin Cross        2022-01-14  119  
9a10064f5625d5 Colin Cross        2022-01-14  120  	return 0;
9a10064f5625d5 Colin Cross        2022-01-14  121  }
9a10064f5625d5 Colin Cross        2022-01-14  122  #else /* CONFIG_ANON_VMA_NAME */
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  123  static int replace_anon_vma_name(struct vm_area_struct *vma,
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04 @124  				 struct anon_vma_name *anon_name)
9a10064f5625d5 Colin Cross        2022-01-14  125  {
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  126  	if (anon_name)
9a10064f5625d5 Colin Cross        2022-01-14  127  		return -EINVAL;
9a10064f5625d5 Colin Cross        2022-01-14  128  
9a10064f5625d5 Colin Cross        2022-01-14  129  	return 0;
9a10064f5625d5 Colin Cross        2022-01-14  130  }
9a10064f5625d5 Colin Cross        2022-01-14  131  #endif /* CONFIG_ANON_VMA_NAME */
^1da177e4c3f41 Linus Torvalds     2005-04-16  132  /*
ac1e9acc5acf0b Colin Cross        2022-01-14  133   * Update the vm_flags on region of a vma, splitting it or merging it as
ac1e9acc5acf0b Colin Cross        2022-01-14  134   * necessary.  Must be called with mmap_sem held for writing;
^1da177e4c3f41 Linus Torvalds     2005-04-16  135   */
ac1e9acc5acf0b Colin Cross        2022-01-14  136  static int madvise_update_vma(struct vm_area_struct *vma,
ac1e9acc5acf0b Colin Cross        2022-01-14  137  			      struct vm_area_struct **prev, unsigned long start,
9a10064f5625d5 Colin Cross        2022-01-14  138  			      unsigned long end, unsigned long new_flags,
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  139  			      struct anon_vma_name *anon_name)
^1da177e4c3f41 Linus Torvalds     2005-04-16  140  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  141  	struct mm_struct *mm = vma->vm_mm;
ac1e9acc5acf0b Colin Cross        2022-01-14  142  	int error;
05b7438475ddba Prasanna Meda      2005-06-21  143  	pgoff_t pgoff;
e798c6e87b64d9 Prasanna Meda      2005-06-21  144  
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  145  	if (new_flags == vma->vm_flags && anon_vma_name_eq(anon_vma_name(vma), anon_name)) {
05b7438475ddba Prasanna Meda      2005-06-21  146  		*prev = vma;
ac1e9acc5acf0b Colin Cross        2022-01-14  147  		return 0;
05b7438475ddba Prasanna Meda      2005-06-21  148  	}
05b7438475ddba Prasanna Meda      2005-06-21  149  
05b7438475ddba Prasanna Meda      2005-06-21  150  	pgoff = vma->vm_pgoff + ((start - vma->vm_start) >> PAGE_SHIFT);
05b7438475ddba Prasanna Meda      2005-06-21  151  	*prev = vma_merge(mm, *prev, start, end, new_flags, vma->anon_vma,
19a809afe2fe08 Andrea Arcangeli   2015-09-04  152  			  vma->vm_file, pgoff, vma_policy(vma),
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  153  			  vma->vm_userfaultfd_ctx, anon_name);
05b7438475ddba Prasanna Meda      2005-06-21  154  	if (*prev) {
05b7438475ddba Prasanna Meda      2005-06-21  155  		vma = *prev;
05b7438475ddba Prasanna Meda      2005-06-21  156  		goto success;
05b7438475ddba Prasanna Meda      2005-06-21  157  	}
05b7438475ddba Prasanna Meda      2005-06-21  158  
05b7438475ddba Prasanna Meda      2005-06-21  159  	*prev = vma;
^1da177e4c3f41 Linus Torvalds     2005-04-16  160  
^1da177e4c3f41 Linus Torvalds     2005-04-16  161  	if (start != vma->vm_start) {
ac1e9acc5acf0b Colin Cross        2022-01-14  162  		if (unlikely(mm->map_count >= sysctl_max_map_count))
ac1e9acc5acf0b Colin Cross        2022-01-14  163  			return -ENOMEM;
def5efe0376501 David Rientjes     2017-02-24  164  		error = __split_vma(mm, vma, start, 1);
f3bc0dba3154fa Mike Rapoport      2019-09-23  165  		if (error)
ac1e9acc5acf0b Colin Cross        2022-01-14  166  			return error;
def5efe0376501 David Rientjes     2017-02-24  167  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  168  
^1da177e4c3f41 Linus Torvalds     2005-04-16  169  	if (end != vma->vm_end) {
ac1e9acc5acf0b Colin Cross        2022-01-14  170  		if (unlikely(mm->map_count >= sysctl_max_map_count))
ac1e9acc5acf0b Colin Cross        2022-01-14  171  			return -ENOMEM;
def5efe0376501 David Rientjes     2017-02-24  172  		error = __split_vma(mm, vma, end, 0);
f3bc0dba3154fa Mike Rapoport      2019-09-23  173  		if (error)
ac1e9acc5acf0b Colin Cross        2022-01-14  174  			return error;
def5efe0376501 David Rientjes     2017-02-24  175  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  176  
836d5ffd345509 Hugh Dickins       2005-09-03  177  success:
^1da177e4c3f41 Linus Torvalds     2005-04-16  178  	/*
c1e8d7c6a7a682 Michel Lespinasse  2020-06-08  179  	 * vm_flags is protected by the mmap_lock held in write mode.
^1da177e4c3f41 Linus Torvalds     2005-04-16  180  	 */
e798c6e87b64d9 Prasanna Meda      2005-06-21  181  	vma->vm_flags = new_flags;
9a10064f5625d5 Colin Cross        2022-01-14  182  	if (!vma->vm_file) {
5c26f6ac9416b6 Suren Baghdasaryan 2022-03-04  183  		error = replace_anon_vma_name(vma, anon_name);
9a10064f5625d5 Colin Cross        2022-01-14  184  		if (error)
9a10064f5625d5 Colin Cross        2022-01-14  185  			return error;
9a10064f5625d5 Colin Cross        2022-01-14  186  	}
f3bc0dba3154fa Mike Rapoport      2019-09-23  187  
ac1e9acc5acf0b Colin Cross        2022-01-14  188  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  189  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  190  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
