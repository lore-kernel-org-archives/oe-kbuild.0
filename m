Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD9E362
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 09:02:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677402180; x=1708938180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MpE5eDcl86FSG9gfmEL/Bnn+829znjDeTpi8qtUhgtM=;
  b=itxkcSq+j0jxWEIcePG/TK0YIy+skUdVz4XUcw16ezwOg+xJKN95sNpV
   BwPTtubz6XyXc0Qtg/7fihvi4KPnpIRSi2YoDC+pGAQeNbEf0gy5P78yk
   p+JNsyirHKWgjDvRhOPI7tHNfg2zy9aTq5fAmX+dJ+lnxNEw9kn039Lwf
   q6nQrnGPK+rDb5xrP4ZrUCq2VjynDaasekpEDuuq/GVJifk3L/Rx5uRLF
   Ll2E/kxE+eza5/ODJbP9ACJK+o/RqjiMayYgnMHRGTpzH71pJoV37g8V5
   pEbRHUrveuRSlluJKqjRHseB7Rd5T2sKqXGVaFDzTbc0qiMBTRb/MNtDd
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="335172235"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="335172235"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 01:02:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="650849041"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="650849041"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 26 Feb 2023 01:02:53 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWCvk-0003fH-1c;
	Sun, 26 Feb 2023 09:02:52 +0000
Date: Sun, 26 Feb 2023 17:01:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/mlock.c:515 apply_vma_lock_flags() error: uninitialized symbol
 'error'.
Message-ID: <202302261649.qeG80JDH-lkp@intel.com>
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
TO: "Liam R. Howlett" <Liam.Howlett@Oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2fcd07b7ccd5fd10b2120d298363e4e6c53ccf9c
commit: 37598f5a9d8b63b91cce0cb6bac5f6374ed1bb80 mlock: convert mlock to vma iterator
date:   2 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 2 weeks ago
config: powerpc-randconfig-m031-20230226 (https://download.01.org/0day-ci/archive/20230226/202302261649.qeG80JDH-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302261649.qeG80JDH-lkp@intel.com/

smatch warnings:
mm/mlock.c:515 apply_vma_lock_flags() error: uninitialized symbol 'error'.

vim +/error +515 mm/mlock.c

^1da177e4c3f41 Linus Torvalds          2005-04-16  468  
1aab92ec3de552 Eric B Munson           2015-11-05  469  static int apply_vma_lock_flags(unsigned long start, size_t len,
1aab92ec3de552 Eric B Munson           2015-11-05  470  				vm_flags_t flags)
^1da177e4c3f41 Linus Torvalds          2005-04-16  471  {
^1da177e4c3f41 Linus Torvalds          2005-04-16  472  	unsigned long nstart, end, tmp;
^1da177e4c3f41 Linus Torvalds          2005-04-16  473  	struct vm_area_struct *vma, *prev;
^1da177e4c3f41 Linus Torvalds          2005-04-16  474  	int error;
37598f5a9d8b63 Liam R. Howlett         2023-01-20  475  	VMA_ITERATOR(vmi, current->mm, start);
^1da177e4c3f41 Linus Torvalds          2005-04-16  476  
8fd9e4883a2b08 Alexander Kuleshov      2015-11-05  477  	VM_BUG_ON(offset_in_page(start));
fed067da46ad3b Michel Lespinasse       2011-01-13  478  	VM_BUG_ON(len != PAGE_ALIGN(len));
^1da177e4c3f41 Linus Torvalds          2005-04-16  479  	end = start + len;
^1da177e4c3f41 Linus Torvalds          2005-04-16  480  	if (end < start)
^1da177e4c3f41 Linus Torvalds          2005-04-16  481  		return -EINVAL;
^1da177e4c3f41 Linus Torvalds          2005-04-16  482  	if (end == start)
^1da177e4c3f41 Linus Torvalds          2005-04-16  483  		return 0;
37598f5a9d8b63 Liam R. Howlett         2023-01-20  484  	vma = vma_iter_load(&vmi);
33108b05f39b78 Matthew Wilcox (Oracle  2022-09-06  485) 	if (!vma)
^1da177e4c3f41 Linus Torvalds          2005-04-16  486  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds          2005-04-16  487  
37598f5a9d8b63 Liam R. Howlett         2023-01-20  488  	prev = vma_prev(&vmi);
^1da177e4c3f41 Linus Torvalds          2005-04-16  489  	if (start > vma->vm_start)
^1da177e4c3f41 Linus Torvalds          2005-04-16  490  		prev = vma;
^1da177e4c3f41 Linus Torvalds          2005-04-16  491  
37598f5a9d8b63 Liam R. Howlett         2023-01-20  492  	nstart = start;
37598f5a9d8b63 Liam R. Howlett         2023-01-20  493  	tmp = vma->vm_start;
37598f5a9d8b63 Liam R. Howlett         2023-01-20  494  	for_each_vma_range(vmi, vma, end) {
37598f5a9d8b63 Liam R. Howlett         2023-01-20  495  		vm_flags_t newflags;
37598f5a9d8b63 Liam R. Howlett         2023-01-20  496  
37598f5a9d8b63 Liam R. Howlett         2023-01-20  497  		if (vma->vm_start != tmp)
37598f5a9d8b63 Liam R. Howlett         2023-01-20  498  			return -ENOMEM;
^1da177e4c3f41 Linus Torvalds          2005-04-16  499  
37598f5a9d8b63 Liam R. Howlett         2023-01-20  500  		newflags = vma->vm_flags & VM_LOCKED_CLEAR_MASK;
1aab92ec3de552 Eric B Munson           2015-11-05  501  		newflags |= flags;
1aab92ec3de552 Eric B Munson           2015-11-05  502  		/* Here we know that  vma->vm_start <= nstart < vma->vm_end. */
^1da177e4c3f41 Linus Torvalds          2005-04-16  503  		tmp = vma->vm_end;
^1da177e4c3f41 Linus Torvalds          2005-04-16  504  		if (tmp > end)
^1da177e4c3f41 Linus Torvalds          2005-04-16  505  			tmp = end;
37598f5a9d8b63 Liam R. Howlett         2023-01-20  506  		error = mlock_fixup(&vmi, vma, &prev, nstart, tmp, newflags);
^1da177e4c3f41 Linus Torvalds          2005-04-16  507  		if (error)
^1da177e4c3f41 Linus Torvalds          2005-04-16  508  			break;
^1da177e4c3f41 Linus Torvalds          2005-04-16  509  		nstart = tmp;
^1da177e4c3f41 Linus Torvalds          2005-04-16  510  	}
37598f5a9d8b63 Liam R. Howlett         2023-01-20  511  
37598f5a9d8b63 Liam R. Howlett         2023-01-20  512  	if (vma_iter_end(&vmi) < end)
37598f5a9d8b63 Liam R. Howlett         2023-01-20  513  		return -ENOMEM;
37598f5a9d8b63 Liam R. Howlett         2023-01-20  514  
^1da177e4c3f41 Linus Torvalds          2005-04-16 @515  	return error;
^1da177e4c3f41 Linus Torvalds          2005-04-16  516  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  517  

:::::: The code at line 515 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
