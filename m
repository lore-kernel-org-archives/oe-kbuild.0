Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEC303D3A2
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Oct 2023 08:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HB7kNXvz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697531627; x=1729067627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U1z+iCQ5SbbCMxuEph0+UC0HK3ggzWVxpoVMkBZitQw=;
  b=HB7kNXvzX42UVeab0Xfx/Mbpq1p2fro9pjPws8JVvNR8rHtkZMLYDB77
   2RcLbRPNSnDy3PpO4e7L0yo/VdsdBFkjXPWOdi+l4D5fyWTjWVZga0szP
   YuVzBYOe20UVsDPf5f5lvzwhm6MROEo9K3kmFpObFVayswsYiUukGJ0nB
   O2LVHFe9DML1nvpshCMohgrvdPxBnGr9tQ2SOzzWgqTUMqlk987dPngEx
   a6Rr+rqRSLxhi9APv1Ug6rz/q9N7RjAIzkkeK8U1tcq2QjTmGywONWb+J
   OtIHXUSyQ6iAD8shF6TWO6aqv3b8gloQGw60310msVNNIhP/l5MnMasEO
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="7291682"
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="7291682"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 01:33:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,231,1694761200"; 
   d="scan'208";a="3995138"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 17 Oct 2023 01:33:50 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsfWI-0009MF-0K;
	Tue, 17 Oct 2023 08:33:42 +0000
Date: Tue, 17 Oct 2023 16:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm'
 could be null (see line 3667)
Message-ID: <202310171600.WCrsOwFj-lkp@intel.com>
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
TO: Lorenzo Stoakes <lstoakes@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Baoquan He <bhe@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   213f891525c222e8ed145ce1ce7ae1f47921cb9c
commit: 4c91c07c93bbbdd7f2d9de2beb7ee5c2a48ad8e7 mm: vmalloc: convert vread() to vread_iter()
date:   6 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 6 months ago
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20231017/202310171600.WCrsOwFj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231017/202310171600.WCrsOwFj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202310171600.WCrsOwFj-lkp@intel.com/

smatch warnings:
mm/vmalloc.c:3689 vread_iter() error: we previously assumed 'vm' could be null (see line 3667)

vim +/vm +3689 mm/vmalloc.c

06c8994626d1b7 Baoquan He              2023-02-06  3594  
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3595  /**
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3596   * vread_iter() - read vmalloc area in a safe way to an iterator.
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3597   * @iter:         the iterator to which data should be written.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3598   * @addr:         vm address.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3599   * @count:        number of bytes to be read.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3600   *
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3601   * This function checks that addr is a valid vmalloc'ed area, and
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3602   * copy data from that area to a given buffer. If the given memory range
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3603   * of [addr...addr+count) includes some valid address, data is copied to
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3604   * proper area of @buf. If there are memory holes, they'll be zero-filled.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3605   * IOREMAP area is treated as memory hole and no copy is done.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3606   *
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3607   * If [addr...addr+count) doesn't includes any intersects with alive
a8e5202d09c1ba Cong Wang               2012-06-23  3608   * vm_struct area, returns 0. @buf should be kernel's buffer.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3609   *
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3610   * Note: In usual ops, vread() is never necessary because the caller
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3611   * should know vmalloc() area is valid and can use memcpy().
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3612   * This is for routines which have to access vmalloc area without
bbcd53c9607135 David Hildenbrand       2021-05-06  3613   * any information, as /proc/kcore.
a862f68a8b3600 Mike Rapoport           2019-03-05  3614   *
a862f68a8b3600 Mike Rapoport           2019-03-05  3615   * Return: number of bytes for which addr and buf should be increased
a862f68a8b3600 Mike Rapoport           2019-03-05  3616   * (same number as @count) or %0 if [addr...addr+count) doesn't
a862f68a8b3600 Mike Rapoport           2019-03-05  3617   * include any intersection with valid vmalloc area
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3618   */
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3619  long vread_iter(struct iov_iter *iter, const char *addr, size_t count)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3620  {
e81ce85f960c2e Joonsoo Kim             2013-04-29  3621  	struct vmap_area *va;
e81ce85f960c2e Joonsoo Kim             2013-04-29  3622  	struct vm_struct *vm;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3623  	char *vaddr;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3624  	size_t n, size, flags, remains;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3625  
4aff1dc4fb3a5a Andrey Konovalov        2022-03-24  3626  	addr = kasan_reset_tag(addr);
4aff1dc4fb3a5a Andrey Konovalov        2022-03-24  3627  
^1da177e4c3f41 Linus Torvalds          2005-04-16  3628  	/* Don't allow overflow */
^1da177e4c3f41 Linus Torvalds          2005-04-16  3629  	if ((unsigned long) addr + count < count)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3630  		count = -(unsigned long) addr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3631  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3632  	remains = count;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3633  
e81ce85f960c2e Joonsoo Kim             2013-04-29  3634  	spin_lock(&vmap_area_lock);
f181234a5a21fd Chen Wandun             2021-09-02  3635  	va = find_vmap_area_exceed_addr((unsigned long)addr);
f608788cd2d6ca Serapheim Dimitropoulos 2021-04-29  3636  	if (!va)
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3637  		goto finished_zero;
f181234a5a21fd Chen Wandun             2021-09-02  3638  
f181234a5a21fd Chen Wandun             2021-09-02  3639  	/* no intersects with alive vmap_area */
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3640  	if ((unsigned long)addr + remains <= va->va_start)
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3641  		goto finished_zero;
f181234a5a21fd Chen Wandun             2021-09-02  3642  
f608788cd2d6ca Serapheim Dimitropoulos 2021-04-29  3643  	list_for_each_entry_from(va, &vmap_area_list, list) {
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3644  		size_t copied;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3645  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3646  		if (remains == 0)
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3647  			goto finished;
e81ce85f960c2e Joonsoo Kim             2013-04-29  3648  
06c8994626d1b7 Baoquan He              2023-02-06  3649  		vm = va->vm;
06c8994626d1b7 Baoquan He              2023-02-06  3650  		flags = va->flags & VMAP_FLAGS_MASK;
06c8994626d1b7 Baoquan He              2023-02-06  3651  		/*
06c8994626d1b7 Baoquan He              2023-02-06  3652  		 * VMAP_BLOCK indicates a sub-type of vm_map_ram area, need
06c8994626d1b7 Baoquan He              2023-02-06  3653  		 * be set together with VMAP_RAM.
06c8994626d1b7 Baoquan He              2023-02-06  3654  		 */
06c8994626d1b7 Baoquan He              2023-02-06  3655  		WARN_ON(flags == VMAP_BLOCK);
06c8994626d1b7 Baoquan He              2023-02-06  3656  
06c8994626d1b7 Baoquan He              2023-02-06  3657  		if (!vm && !flags)
e81ce85f960c2e Joonsoo Kim             2013-04-29  3658  			continue;
e81ce85f960c2e Joonsoo Kim             2013-04-29  3659  
30a7a9b17c4b03 Baoquan He              2023-02-06  3660  		if (vm && (vm->flags & VM_UNINITIALIZED))
30a7a9b17c4b03 Baoquan He              2023-02-06  3661  			continue;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3662  
30a7a9b17c4b03 Baoquan He              2023-02-06  3663  		/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
30a7a9b17c4b03 Baoquan He              2023-02-06  3664  		smp_rmb();
30a7a9b17c4b03 Baoquan He              2023-02-06  3665  
06c8994626d1b7 Baoquan He              2023-02-06  3666  		vaddr = (char *) va->va_start;
06c8994626d1b7 Baoquan He              2023-02-06 @3667  		size = vm ? get_vm_area_size(vm) : va_size(va);
06c8994626d1b7 Baoquan He              2023-02-06  3668  
06c8994626d1b7 Baoquan He              2023-02-06  3669  		if (addr >= vaddr + size)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3670  			continue;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3671  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3672  		if (addr < vaddr) {
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3673  			size_t to_zero = min_t(size_t, vaddr - addr, remains);
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3674  			size_t zeroed = zero_iter(iter, to_zero);
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3675  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3676  			addr += zeroed;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3677  			remains -= zeroed;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3678  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3679  			if (remains == 0 || zeroed != to_zero)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3680  				goto finished;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3681  		}
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3682  
06c8994626d1b7 Baoquan He              2023-02-06  3683  		n = vaddr + size - addr;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3684  		if (n > remains)
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3685  			n = remains;
06c8994626d1b7 Baoquan He              2023-02-06  3686  
06c8994626d1b7 Baoquan He              2023-02-06  3687  		if (flags & VMAP_RAM)
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3688  			copied = vmap_ram_vread_iter(iter, addr, n, flags);
06c8994626d1b7 Baoquan He              2023-02-06 @3689  		else if (!(vm->flags & VM_IOREMAP))
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3690  			copied = aligned_vread_iter(iter, addr, n);
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3691  		else /* IOREMAP area is treated as memory hole */
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3692  			copied = zero_iter(iter, n);
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3693  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3694  		addr += copied;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3695  		remains -= copied;
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3696  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3697  		if (copied != n)
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3698  			goto finished;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3699  	}
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3700  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3701  finished_zero:
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3702  	spin_unlock(&vmap_area_lock);
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3703  	/* zero-fill memory holes */
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3704  	return count - remains + zero_iter(iter, remains);
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3705  finished:
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3706  	/* Nothing remains, or We couldn't copy/zero everything. */
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3707  	spin_unlock(&vmap_area_lock);
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3708  
4c91c07c93bbbd Lorenzo Stoakes         2023-03-22  3709  	return count - remains;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3710  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  3711  

:::::: The code at line 3689 was first introduced by commit
:::::: 06c8994626d1b7d8c26dfd06992d67703a274054 mm/vmalloc.c: allow vread() to read out vm_map_ram areas

:::::: TO: Baoquan He <bhe@redhat.com>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
