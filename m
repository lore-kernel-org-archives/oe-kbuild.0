Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1B7019D06A
	for <oe-kbuild@lists.linux.dev>; Wed,  5 Mar 2025 20:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741205573; cv=none; b=gTqSgzHPj2x2rVIXCnOHmg4gKAPmJAMnmkhyYxJwFZGzKZ6EIjxMk9xY66bkAXEI4Lb3abOW1OcOouZCkAAq/eDruNrDcoXmOG8Hno5C/dBuqW+RaAXo/A5f3B1Acz5AAkTqT8Q6Y2M1eEjccixGZ8eoqR7cM4EsQRaC1RXwf5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741205573; c=relaxed/simple;
	bh=nGEcO+Wga80KFTlWfShUxULkwej9u2D5Q546c+7qCLk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lfBaecnVIh8lYxy5qOLwPlktKEMyTTeIAkRwLACF1w66dOOqYLZ+mCH6fExYp5ovWyY4tPqvdh3Ys/eiyb33hlmM2C8iUuwFHkH3ddRCqC57MBODF3p/Mx1+ztAL65voUVwRYULiMUHqrLZ5LHe2pUJYAB8dTQ+CzjziDzh3jz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FrMbi40K; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FrMbi40K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741205572; x=1772741572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nGEcO+Wga80KFTlWfShUxULkwej9u2D5Q546c+7qCLk=;
  b=FrMbi40KF0TTOoXx3wk10kRCtlNXqAOnuhdaVb2XowINuuJoVgNAin2U
   lxlKa960B6QniTWFoxy2zWrTrXcMY997tA6cIzYR0svkxTy7Ygzfe6n6z
   qt2dZ2zlz9a3eOVc53hGom36NnKqIBPzwT8ClzYasE1LX1WaJP0FtORdh
   5fJdwKOwhZymJcfhPNkVAZ5XacEognXyAt+eO61OVarl0EzRIYHYCkANh
   JR2Qqp7fNvQQtU3OgD33yZExHKwRy4MGtFANEWfWhKgPTeY2QVGHKpLZ9
   3IR0G872y3RuOc5WkXEbH7MvOmzesKy0wEZswflmrX0gc9sxQbXIOtW28
   g==;
X-CSE-ConnectionGUID: sfBVTsOKSrqJ4GYfMaJ0RQ==
X-CSE-MsgGUID: E0qTOncaRdiWFuurnvCKnA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="64635712"
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="64635712"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2025 12:12:51 -0800
X-CSE-ConnectionGUID: QaBDVUYcSZqCeYYrMqq//w==
X-CSE-MsgGUID: mi4ZumgLQHqCEOOjPDoSpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,224,1736841600"; 
   d="scan'208";a="119492605"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 05 Mar 2025 12:12:49 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpv6l-000M9x-2n;
	Wed, 05 Mar 2025 20:12:47 +0000
Date: Thu, 6 Mar 2025 04:12:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7960/8790] mm/mremap.c:910 prep_move_vma() error:
 uninitialized symbol 'err'.
Message-ID: <202503060404.ugZVU72k-lkp@intel.com>
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
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7ec162622e66a4ff886f8f28712ea1b13069e1aa
commit: 3129f7896afb86e411c0b59a553fbb4053db4012 [7960/8790] mm/mremap: initial refactor of move_vma()
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20250305 (https://download.01.org/0day-ci/archive/20250306/202503060404.ugZVU72k-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202503060404.ugZVU72k-lkp@intel.com/

smatch warnings:
mm/mremap.c:910 prep_move_vma() error: uninitialized symbol 'err'.

vim +/err +910 mm/mremap.c

3129f7896afb86 Lorenzo Stoakes 2025-03-03  887  
3129f7896afb86 Lorenzo Stoakes 2025-03-03  888  /*
3129f7896afb86 Lorenzo Stoakes 2025-03-03  889   * Perform checks  before attempting to write a VMA prior to it being
3129f7896afb86 Lorenzo Stoakes 2025-03-03  890   * moved.
3129f7896afb86 Lorenzo Stoakes 2025-03-03  891   */
3129f7896afb86 Lorenzo Stoakes 2025-03-03  892  static unsigned long prep_move_vma(struct vma_remap_struct *vrm,
3129f7896afb86 Lorenzo Stoakes 2025-03-03  893  				   unsigned long *vm_flags_ptr)
3129f7896afb86 Lorenzo Stoakes 2025-03-03  894  {
3129f7896afb86 Lorenzo Stoakes 2025-03-03  895  	unsigned long err;
3129f7896afb86 Lorenzo Stoakes 2025-03-03  896  	struct vm_area_struct *vma = vrm->vma;
3129f7896afb86 Lorenzo Stoakes 2025-03-03  897  	unsigned long old_addr = vrm->addr;
3129f7896afb86 Lorenzo Stoakes 2025-03-03  898  	unsigned long old_len = vrm->old_len;
^1da177e4c3f41 Linus Torvalds  2005-04-16  899  
^1da177e4c3f41 Linus Torvalds  2005-04-16  900  	/*
^1da177e4c3f41 Linus Torvalds  2005-04-16  901  	 * We'd prefer to avoid failure later on in do_munmap:
^1da177e4c3f41 Linus Torvalds  2005-04-16  902  	 * which may split one vma into three before unmapping.
^1da177e4c3f41 Linus Torvalds  2005-04-16  903  	 */
3129f7896afb86 Lorenzo Stoakes 2025-03-03  904  	if (current->mm->map_count >= sysctl_max_map_count - 3)
^1da177e4c3f41 Linus Torvalds  2005-04-16  905  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds  2005-04-16  906  
73d5e06299195f Dmitry Safonov  2020-12-14  907  	if (vma->vm_ops && vma->vm_ops->may_split) {
73d5e06299195f Dmitry Safonov  2020-12-14  908  		if (vma->vm_start != old_addr)
73d5e06299195f Dmitry Safonov  2020-12-14  909  			err = vma->vm_ops->may_split(vma, old_addr);
73d5e06299195f Dmitry Safonov  2020-12-14 @910  		if (!err && vma->vm_end != old_addr + old_len)
73d5e06299195f Dmitry Safonov  2020-12-14  911  			err = vma->vm_ops->may_split(vma, old_addr + old_len);
73d5e06299195f Dmitry Safonov  2020-12-14  912  		if (err)
73d5e06299195f Dmitry Safonov  2020-12-14  913  			return err;
73d5e06299195f Dmitry Safonov  2020-12-14  914  	}
73d5e06299195f Dmitry Safonov  2020-12-14  915  
1ff82995731667 Hugh Dickins    2009-09-21  916  	/*
1ff82995731667 Hugh Dickins    2009-09-21  917  	 * Advise KSM to break any KSM pages in the area to be moved:
1ff82995731667 Hugh Dickins    2009-09-21  918  	 * it would be confusing if they were to turn up at the new
1ff82995731667 Hugh Dickins    2009-09-21  919  	 * location, where they happen to coincide with different KSM
1ff82995731667 Hugh Dickins    2009-09-21  920  	 * pages recently unmapped.  But leave vma->vm_flags as it was,
1ff82995731667 Hugh Dickins    2009-09-21  921  	 * so KSM can come around to merge on vma and new_vma afterwards.
1ff82995731667 Hugh Dickins    2009-09-21  922  	 */
7103ad323b1ae3 Hugh Dickins    2009-09-21  923  	err = ksm_madvise(vma, old_addr, old_addr + old_len,
3129f7896afb86 Lorenzo Stoakes 2025-03-03  924  			  MADV_UNMERGEABLE, vm_flags_ptr);
7103ad323b1ae3 Hugh Dickins    2009-09-21  925  	if (err)
7103ad323b1ae3 Hugh Dickins    2009-09-21  926  		return err;
1ff82995731667 Hugh Dickins    2009-09-21  927  
3129f7896afb86 Lorenzo Stoakes 2025-03-03  928  	return 0;
ad8ee77ea9db1f Dmitry Safonov  2020-12-14  929  }
ad8ee77ea9db1f Dmitry Safonov  2020-12-14  930  

:::::: The code at line 910 was first introduced by commit
:::::: 73d5e06299195f4df82832cfc4a3a0c574c1e473 mremap: check if it's possible to split original vma

:::::: TO: Dmitry Safonov <dima@arista.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
