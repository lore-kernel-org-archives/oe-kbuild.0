Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F920A492
	for <oe-kbuild@lists.linux.dev>; Fri, 18 Nov 2022 21:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1668807938; x=1700343938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=thMpUgSn1y+q3OGTn1SMaxyvwvrfYPVYbku2oZWWoMc=;
  b=QdEjEHrOcBY/pdwzlDseyrsE7a5uzWKcDVXamyxISLXXiP577tcn9R22
   mEsoaZFaeRIZ9nzGanTvX4WADnyhOWr/x1zyGwAu9VaOeB5LjAxmUj+Zz
   2RitDqpmq4/fokjPYfg1sGQRjn1LhiiIULt2JJpd+P67srfXB8HzaDKB2
   KlrrhYjrLamExGr5xySHhQHyDnHznTJ7vo3KbfyDGI7r44TU4pc5ZAyob
   Qq1kjSL3V//51kBNwkh6NP/dAGbYTufkhTqVMNxoHwe0gifelttZnqQDK
   tsHvkRb90PCCFx0TBSc0tLiIJs/MV75l3qeHr70hUQMRu3N3X9IdCfM5l
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="399528488"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; 
   d="scan'208";a="399528488"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2022 13:45:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10535"; a="815066695"
X-IronPort-AV: E=Sophos;i="5.96,175,1665471600"; 
   d="scan'208";a="815066695"
Received: from lkp-server01.sh.intel.com (HELO 55744f5052f8) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 18 Nov 2022 13:45:09 -0800
Received: from kbuild by 55744f5052f8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ow9Ab-0001oR-0P;
	Fri, 18 Nov 2022 21:45:09 +0000
Date: Sat, 19 Nov 2022 05:44:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/hugetlbfs/inode.c:381:38: warning: Parameter 'page' can be
 declared as pointer to const [constParameter]
Message-ID: <202211190506.NqfPuhsu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: fs/hugetlbfs/inode.c:381:38: warning: Parameter 'page' can be declared as pointer to const [constParameter]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Mike Kravetz <mike.kravetz@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Miaohe Lin <linmiaohe@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   950a9f564aeade8f7b263bb8e9646c4c13ffd424
commit: 378397ccb8e5a695a42e819df545ccd28641b683 hugetlb: create hugetlb_unmap_file_folio to unmap single file folio
date:   7 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 7 weeks ago
compiler: mips64-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 378397ccb8e5a695a42e819df545ccd28641b683
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/hugetlbfs/inode.c:381:38: warning: Parameter 'page' can be declared as pointer to const [constParameter]
       unsigned long addr, struct page *page)
                                        ^

vim +/page +381 fs/hugetlbfs/inode.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  373  
378397ccb8e5a6 Mike Kravetz   2022-09-14  374  /*
378397ccb8e5a6 Mike Kravetz   2022-09-14  375   * Called with i_mmap_rwsem held for inode based vma maps.  This makes
378397ccb8e5a6 Mike Kravetz   2022-09-14  376   * sure vma (and vm_mm) will not go away.  We also hold the hugetlb fault
378397ccb8e5a6 Mike Kravetz   2022-09-14  377   * mutex for the page in the mapping.  So, we can not race with page being
378397ccb8e5a6 Mike Kravetz   2022-09-14  378   * faulted into the vma.
378397ccb8e5a6 Mike Kravetz   2022-09-14  379   */
378397ccb8e5a6 Mike Kravetz   2022-09-14  380  static bool hugetlb_vma_maps_page(struct vm_area_struct *vma,
378397ccb8e5a6 Mike Kravetz   2022-09-14 @381  				unsigned long addr, struct page *page)
378397ccb8e5a6 Mike Kravetz   2022-09-14  382  {
378397ccb8e5a6 Mike Kravetz   2022-09-14  383  	pte_t *ptep, pte;
378397ccb8e5a6 Mike Kravetz   2022-09-14  384  
378397ccb8e5a6 Mike Kravetz   2022-09-14  385  	ptep = huge_pte_offset(vma->vm_mm, addr,
378397ccb8e5a6 Mike Kravetz   2022-09-14  386  			huge_page_size(hstate_vma(vma)));
378397ccb8e5a6 Mike Kravetz   2022-09-14  387  
378397ccb8e5a6 Mike Kravetz   2022-09-14  388  	if (!ptep)
378397ccb8e5a6 Mike Kravetz   2022-09-14  389  		return false;
378397ccb8e5a6 Mike Kravetz   2022-09-14  390  
378397ccb8e5a6 Mike Kravetz   2022-09-14  391  	pte = huge_ptep_get(ptep);
378397ccb8e5a6 Mike Kravetz   2022-09-14  392  	if (huge_pte_none(pte) || !pte_present(pte))
378397ccb8e5a6 Mike Kravetz   2022-09-14  393  		return false;
378397ccb8e5a6 Mike Kravetz   2022-09-14  394  
378397ccb8e5a6 Mike Kravetz   2022-09-14  395  	if (pte_page(pte) == page)
378397ccb8e5a6 Mike Kravetz   2022-09-14  396  		return true;
378397ccb8e5a6 Mike Kravetz   2022-09-14  397  
378397ccb8e5a6 Mike Kravetz   2022-09-14  398  	return false;
378397ccb8e5a6 Mike Kravetz   2022-09-14  399  }
378397ccb8e5a6 Mike Kravetz   2022-09-14  400  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
