Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5E2A46
	for <oe-kbuild@lists.linux.dev>; Sun, 19 Mar 2023 04:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679200863; x=1710736863;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EpS7GQ2Fp338JLwTapaSVu+4xjB3sfWK3adQZgNh/Xo=;
  b=YxMFAIjsif8wuhb4Ar1GAvwI6YL+31FU4ZNIUl9Lhh7uRhZg5KOZfmPb
   ZKkYYF218dpEbPyKRAVgqm2SRDWaUncmjvD/1k9x0GtJOXbkgCtcAMMid
   lcS/q68EFRFXz2Hx58/g5t7uHp/1/shf5T/SicGu2MFLBXZtig+WpWfwS
   DI+FPX/pl5L4b1WGOGFG2CqNTlh7E4exiwQlCQosJE6MedOjZ5K/cv7nk
   SR+LWsNhUPa+9UiynDoSxqqBgobdpFQMD+eOXmXZxuqME7/+ZO8YTolH9
   mJ/hlfIBOYTvUHSxJXI1FPunFasmBTkvREYWypuuqjUdc66jTfxOfb9V/
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="401056485"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="401056485"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2023 21:41:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10653"; a="744972935"
X-IronPort-AV: E=Sophos;i="5.98,272,1673942400"; 
   d="scan'208";a="744972935"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 18 Mar 2023 21:41:01 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pdkqq-000AOY-2r;
	Sun, 19 Mar 2023 04:41:00 +0000
Date: Sun, 19 Mar 2023 12:40:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 4/4] mm: vmalloc: convert vread() to vread_iter()
Message-ID: <202303191246.PQAdsQGK-lkp@intel.com>
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
In-Reply-To: <119871ea9507eac7be5d91db38acdb03981e049e.1679183626.git.lstoakes@gmail.com>
References: <119871ea9507eac7be5d91db38acdb03981e049e.1679183626.git.lstoakes@gmail.com>
TO: Lorenzo Stoakes <lstoakes@gmail.com>
TO: linux-mm@kvack.org
TO: linux-kernel@vger.kernel.org
TO: linux-fsdevel@vger.kernel.org
TO: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Baoquan He <bhe@redhat.com>
CC: Uladzislau Rezki <urezki@gmail.com>
CC: Matthew Wilcox <willy@infradead.org>
CC: David Hildenbrand <david@redhat.com>
CC: Liu Shixin <liushixin2@huawei.com>
CC: Jiri Olsa <jolsa@kernel.org>
CC: Lorenzo Stoakes <lstoakes@gmail.com>

Hi Lorenzo,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master v6.3-rc2 next-20230317]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/fs-proc-kcore-Avoid-bounce-buffer-for-ktext-data/20230319-082147
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/119871ea9507eac7be5d91db38acdb03981e049e.1679183626.git.lstoakes%40gmail.com
patch subject: [PATCH 4/4] mm: vmalloc: convert vread() to vread_iter()
:::::: branch date: 4 hours ago
:::::: commit date: 4 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20230319/202303191246.PQAdsQGK-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303191246.PQAdsQGK-lkp@intel.com/

smatch warnings:
mm/vmalloc.c:3641 vread_iter() error: we previously assumed 'vm' could be null (see line 3620)

vim +/vm +3641 mm/vmalloc.c

06c8994626d1b7 Baoquan He              2023-02-06  3549  
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3550  /**
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3551   * vread_iter() - read vmalloc area in a safe way to an iterator.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3552   * @addr:         vm address.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3553   * @count:        number of bytes to be read.
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3554   * @iter:         the iterator to which data should be written.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3555   *
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3556   * This function checks that addr is a valid vmalloc'ed area, and
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3557   * copy data from that area to a given buffer. If the given memory range
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3558   * of [addr...addr+count) includes some valid address, data is copied to
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3559   * proper area of @buf. If there are memory holes, they'll be zero-filled.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3560   * IOREMAP area is treated as memory hole and no copy is done.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3561   *
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3562   * If [addr...addr+count) doesn't includes any intersects with alive
a8e5202d09c1ba Cong Wang               2012-06-23  3563   * vm_struct area, returns 0. @buf should be kernel's buffer.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3564   *
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3565   * Note: In usual ops, vread() is never necessary because the caller
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3566   * should know vmalloc() area is valid and can use memcpy().
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3567   * This is for routines which have to access vmalloc area without
bbcd53c9607135 David Hildenbrand       2021-05-06  3568   * any information, as /proc/kcore.
a862f68a8b3600 Mike Rapoport           2019-03-05  3569   *
a862f68a8b3600 Mike Rapoport           2019-03-05  3570   * Return: number of bytes for which addr and buf should be increased
a862f68a8b3600 Mike Rapoport           2019-03-05  3571   * (same number as @count) or %0 if [addr...addr+count) doesn't
a862f68a8b3600 Mike Rapoport           2019-03-05  3572   * include any intersection with valid vmalloc area
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3573   */
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3574  long vread_iter(char *addr, size_t count, struct iov_iter *iter)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3575  {
e81ce85f960c2e Joonsoo Kim             2013-04-29  3576  	struct vmap_area *va;
e81ce85f960c2e Joonsoo Kim             2013-04-29  3577  	struct vm_struct *vm;
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3578  	char *vaddr;
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3579  	size_t buflen = count;
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3580  	size_t n, size, flags;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3581  
f11743b68de8fc Lorenzo Stoakes         2023-03-19  3582  	might_sleep();
f11743b68de8fc Lorenzo Stoakes         2023-03-19  3583  
4aff1dc4fb3a5a Andrey Konovalov        2022-03-24  3584  	addr = kasan_reset_tag(addr);
4aff1dc4fb3a5a Andrey Konovalov        2022-03-24  3585  
^1da177e4c3f41 Linus Torvalds          2005-04-16  3586  	/* Don't allow overflow */
^1da177e4c3f41 Linus Torvalds          2005-04-16  3587  	if ((unsigned long) addr + count < count)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3588  		count = -(unsigned long) addr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3589  
f11743b68de8fc Lorenzo Stoakes         2023-03-19  3590  	down_read(&vmap_area_lock);
f181234a5a21fd Chen Wandun             2021-09-02  3591  	va = find_vmap_area_exceed_addr((unsigned long)addr);
f608788cd2d6ca Serapheim Dimitropoulos 2021-04-29  3592  	if (!va)
f608788cd2d6ca Serapheim Dimitropoulos 2021-04-29  3593  		goto finished;
f181234a5a21fd Chen Wandun             2021-09-02  3594  
f181234a5a21fd Chen Wandun             2021-09-02  3595  	/* no intersects with alive vmap_area */
f181234a5a21fd Chen Wandun             2021-09-02  3596  	if ((unsigned long)addr + count <= va->va_start)
f181234a5a21fd Chen Wandun             2021-09-02  3597  		goto finished;
f181234a5a21fd Chen Wandun             2021-09-02  3598  
f608788cd2d6ca Serapheim Dimitropoulos 2021-04-29  3599  	list_for_each_entry_from(va, &vmap_area_list, list) {
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3600  		if (count == 0)
e81ce85f960c2e Joonsoo Kim             2013-04-29  3601  			break;
e81ce85f960c2e Joonsoo Kim             2013-04-29  3602  
06c8994626d1b7 Baoquan He              2023-02-06  3603  		vm = va->vm;
06c8994626d1b7 Baoquan He              2023-02-06  3604  		flags = va->flags & VMAP_FLAGS_MASK;
06c8994626d1b7 Baoquan He              2023-02-06  3605  		/*
06c8994626d1b7 Baoquan He              2023-02-06  3606  		 * VMAP_BLOCK indicates a sub-type of vm_map_ram area, need
06c8994626d1b7 Baoquan He              2023-02-06  3607  		 * be set together with VMAP_RAM.
06c8994626d1b7 Baoquan He              2023-02-06  3608  		 */
06c8994626d1b7 Baoquan He              2023-02-06  3609  		WARN_ON(flags == VMAP_BLOCK);
06c8994626d1b7 Baoquan He              2023-02-06  3610  
06c8994626d1b7 Baoquan He              2023-02-06  3611  		if (!vm && !flags)
e81ce85f960c2e Joonsoo Kim             2013-04-29  3612  			continue;
e81ce85f960c2e Joonsoo Kim             2013-04-29  3613  
30a7a9b17c4b03 Baoquan He              2023-02-06  3614  		if (vm && (vm->flags & VM_UNINITIALIZED))
30a7a9b17c4b03 Baoquan He              2023-02-06  3615  			continue;
30a7a9b17c4b03 Baoquan He              2023-02-06  3616  		/* Pair with smp_wmb() in clear_vm_uninitialized_flag() */
30a7a9b17c4b03 Baoquan He              2023-02-06  3617  		smp_rmb();
30a7a9b17c4b03 Baoquan He              2023-02-06  3618  
06c8994626d1b7 Baoquan He              2023-02-06  3619  		vaddr = (char *) va->va_start;
06c8994626d1b7 Baoquan He              2023-02-06 @3620  		size = vm ? get_vm_area_size(vm) : va_size(va);
06c8994626d1b7 Baoquan He              2023-02-06  3621  
06c8994626d1b7 Baoquan He              2023-02-06  3622  		if (addr >= vaddr + size)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3623  			continue;
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3624  
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3625  		if (addr < vaddr) {
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3626  			size_t to_zero = min_t(size_t, vaddr - addr, count);
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3627  
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3628  			iov_iter_zero(to_zero, iter);
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3629  			addr += to_zero;
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3630  			count -= to_zero;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3631  			if (count == 0)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3632  				goto finished;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3633  		}
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3634  
06c8994626d1b7 Baoquan He              2023-02-06  3635  		n = vaddr + size - addr;
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3636  		if (n > count)
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3637  			n = count;
06c8994626d1b7 Baoquan He              2023-02-06  3638  
06c8994626d1b7 Baoquan He              2023-02-06  3639  		if (flags & VMAP_RAM)
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3640  			vmap_ram_vread_iter(addr, n, flags, iter);
06c8994626d1b7 Baoquan He              2023-02-06 @3641  		else if (!(vm->flags & VM_IOREMAP))
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3642  			aligned_vread_iter(addr, n, iter);
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3643  		else /* IOREMAP area is treated as memory hole */
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3644  			iov_iter_zero(n, iter);
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3645  
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3646  		addr += n;
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3647  		count -= n;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3648  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  3649  finished:
f11743b68de8fc Lorenzo Stoakes         2023-03-19  3650  	up_read(&vmap_area_lock);
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3651  
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3652  	if (count == buflen)
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3653  		return 0;
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3654  	/* zero-fill memory holes */
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3655  	if (count > 0)
a28f374d35bd29 Lorenzo Stoakes         2023-03-19  3656  		iov_iter_zero(count, iter);
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3657  
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3658  	return buflen;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3659  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  3660  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
