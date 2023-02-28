Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ED5E2F2C
	for <oe-kbuild@lists.linux.dev>; Tue, 28 Feb 2023 10:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677579571; x=1709115571;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=K2dEPq97nV68bDu2soettkiKfCsoOME97XQjN22jX/E=;
  b=OGd2wAVfa2MduvT0oWPU9NP2iJTrE31VcI7SNo+qlVf/b4px1oQcjmS2
   Jr/gef8AkFUqvCVjCPP5aJIqZiZnA5k4AXSAId68BAja1Roa5IzZ+BSEr
   XWvY40FswRPNOAVw/4KuzJvm9Zl0P2LH5s3KM/QMh6Uy3tVWJI87pqv+u
   VK2bNE+tKp5U4Fx8C3piOKtFlq7DtSO71A04Pz1XGGd64y/45XeaDhsvO
   SruKBh9xVz7WpUVhV0hcMV0MsLv77u9t3Xr4IcjDjKaEVBYjd+8F4qKAf
   k00dLc00lm/UOmxD+bKYUZLLt26jQNPqFdrIxWprT685fWCK9eV2usblz
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="361664052"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="361664052"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2023 02:19:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10634"; a="667398094"
X-IronPort-AV: E=Sophos;i="5.98,221,1673942400"; 
   d="scan'208";a="667398094"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 28 Feb 2023 02:19:28 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWx4y-0005Jp-0T;
	Tue, 28 Feb 2023 10:19:28 +0000
Date: Tue, 28 Feb 2023 18:19:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [ammarfaizi2-block:akpm/mm/mm-unstable 82/99] mm/mmap.c:516
 vma_prepare() error: we previously assumed 'vp->vma' could be null (see line
 505)
Message-ID: <202302281802.J93Nma7q-lkp@intel.com>
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
CC: Ammar Faizi <ammarfaizi2@gnuweeb.org>
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://github.com/ammarfaizi2/linux-block akpm/mm/mm-unstable
head:   61edd3b68c3185673c9b05dfe48038692964c73b
commit: f517f7ae341d933856cdf4d9d773027681ed5dff [82/99] mm/mmap: write-lock VMAs in vma_prepare before modifying them
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230228/202302281802.J93Nma7q-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302281802.J93Nma7q-lkp@intel.com/

smatch warnings:
mm/mmap.c:516 vma_prepare() error: we previously assumed 'vp->vma' could be null (see line 505)

vim +516 mm/mmap.c

68cefec539206e Liam R. Howlett    2023-01-20  497  
68cefec539206e Liam R. Howlett    2023-01-20  498  
440703e082b9c7 Liam R. Howlett    2023-01-20  499  /*
440703e082b9c7 Liam R. Howlett    2023-01-20  500   * vma_prepare() - Helper function for handling locking VMAs prior to altering
440703e082b9c7 Liam R. Howlett    2023-01-20  501   * @vp: The initialized vma_prepare struct
440703e082b9c7 Liam R. Howlett    2023-01-20  502   */
440703e082b9c7 Liam R. Howlett    2023-01-20  503  static inline void vma_prepare(struct vma_prepare *vp)
440703e082b9c7 Liam R. Howlett    2023-01-20  504  {
f517f7ae341d93 Suren Baghdasaryan 2023-02-27 @505  	if (vp->vma)
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  506  		vma_start_write(vp->vma);
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  507  	if (vp->adj_next)
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  508  		vma_start_write(vp->adj_next);
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  509  	/* vp->insert is always a newly created VMA, no need for locking */
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  510  	if (vp->remove)
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  511  		vma_start_write(vp->remove);
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  512  	if (vp->remove2)
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  513  		vma_start_write(vp->remove2);
f517f7ae341d93 Suren Baghdasaryan 2023-02-27  514  
440703e082b9c7 Liam R. Howlett    2023-01-20  515  	if (vp->file) {
440703e082b9c7 Liam R. Howlett    2023-01-20 @516  		uprobe_munmap(vp->vma, vp->vma->vm_start, vp->vma->vm_end);
440703e082b9c7 Liam R. Howlett    2023-01-20  517  
440703e082b9c7 Liam R. Howlett    2023-01-20  518  		if (vp->adj_next)
440703e082b9c7 Liam R. Howlett    2023-01-20  519  			uprobe_munmap(vp->adj_next, vp->adj_next->vm_start,
440703e082b9c7 Liam R. Howlett    2023-01-20  520  				      vp->adj_next->vm_end);
440703e082b9c7 Liam R. Howlett    2023-01-20  521  
440703e082b9c7 Liam R. Howlett    2023-01-20  522  		i_mmap_lock_write(vp->mapping);
440703e082b9c7 Liam R. Howlett    2023-01-20  523  		if (vp->insert && vp->insert->vm_file) {
440703e082b9c7 Liam R. Howlett    2023-01-20  524  			/*
440703e082b9c7 Liam R. Howlett    2023-01-20  525  			 * Put into interval tree now, so instantiated pages
440703e082b9c7 Liam R. Howlett    2023-01-20  526  			 * are visible to arm/parisc __flush_dcache_page
440703e082b9c7 Liam R. Howlett    2023-01-20  527  			 * throughout; but we cannot insert into address
440703e082b9c7 Liam R. Howlett    2023-01-20  528  			 * space until vma start or end is updated.
440703e082b9c7 Liam R. Howlett    2023-01-20  529  			 */
440703e082b9c7 Liam R. Howlett    2023-01-20  530  			__vma_link_file(vp->insert,
440703e082b9c7 Liam R. Howlett    2023-01-20  531  					vp->insert->vm_file->f_mapping);
440703e082b9c7 Liam R. Howlett    2023-01-20  532  		}
440703e082b9c7 Liam R. Howlett    2023-01-20  533  	}
440703e082b9c7 Liam R. Howlett    2023-01-20  534  
440703e082b9c7 Liam R. Howlett    2023-01-20  535  	if (vp->anon_vma) {
440703e082b9c7 Liam R. Howlett    2023-01-20  536  		anon_vma_lock_write(vp->anon_vma);
440703e082b9c7 Liam R. Howlett    2023-01-20  537  		anon_vma_interval_tree_pre_update_vma(vp->vma);
440703e082b9c7 Liam R. Howlett    2023-01-20  538  		if (vp->adj_next)
440703e082b9c7 Liam R. Howlett    2023-01-20  539  			anon_vma_interval_tree_pre_update_vma(vp->adj_next);
440703e082b9c7 Liam R. Howlett    2023-01-20  540  	}
440703e082b9c7 Liam R. Howlett    2023-01-20  541  
440703e082b9c7 Liam R. Howlett    2023-01-20  542  	if (vp->file) {
440703e082b9c7 Liam R. Howlett    2023-01-20  543  		flush_dcache_mmap_lock(vp->mapping);
440703e082b9c7 Liam R. Howlett    2023-01-20  544  		vma_interval_tree_remove(vp->vma, &vp->mapping->i_mmap);
440703e082b9c7 Liam R. Howlett    2023-01-20  545  		if (vp->adj_next)
440703e082b9c7 Liam R. Howlett    2023-01-20  546  			vma_interval_tree_remove(vp->adj_next,
440703e082b9c7 Liam R. Howlett    2023-01-20  547  						 &vp->mapping->i_mmap);
440703e082b9c7 Liam R. Howlett    2023-01-20  548  	}
440703e082b9c7 Liam R. Howlett    2023-01-20  549  

:::::: The code at line 516 was first introduced by commit
:::::: 440703e082b9c79c3d4fffcca8c2dffd621e6dc5 mm/mmap: refactor locking out of __vma_adjust()

:::::: TO: Liam R. Howlett <Liam.Howlett@Oracle.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
