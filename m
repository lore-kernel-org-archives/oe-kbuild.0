Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E0429A9
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 15:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677425402; x=1708961402;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nErdiGpLXz/3EorlRmltEYJEp/qeEfgZwVTm/Hj/GlI=;
  b=iXu4k1g6KUPQGaEgJC64BmG45dSQTNMSkGbiEtEMwoiPhqf2UC0n2Cyv
   MwuJZokUJBQEJKb5pnBM+dAGZwDEAv3NiWHT8vT5wEPOBo/bhxJUKhcM/
   KqrVmtfcBxhSm+f6aasf65B5Wvz4tAFdfH363TSzYNdlIwbqlvU4ldGi7
   /cg3IeZ5r7SYO2Qgoegw2wBtGXyfUG8PEdjOuek56M7qhlk7x89wtsu7W
   Ton538Fzppb3Tx495sdNXPAKLjl6tY4o2pO/69OEYdh4fSo9DCLqEinrz
   smHlshtCu0G+8/QY8l5ZpDTXRla7pmqGSQMVyA43QKXzP/eUSLYGqdpFi
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="419988053"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="419988053"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 07:30:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="623295342"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="623295342"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 26 Feb 2023 07:30:00 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWIyN-0003nT-1l;
	Sun, 26 Feb 2023 15:29:59 +0000
Date: Sun, 26 Feb 2023 23:29:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: mm/vmalloc.c:3609 vread() error: we previously assumed 'vm' could be
 null (see line 3591)
Message-ID: <202302262345.cyAD2tEI-lkp@intel.com>
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
TO: Baoquan He <bhe@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Lorenzo Stoakes <lstoakes@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2fcd07b7ccd5fd10b2120d298363e4e6c53ccf9c
commit: 06c8994626d1b7d8c26dfd06992d67703a274054 mm/vmalloc.c: allow vread() to read out vm_map_ram areas
date:   2 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 2 weeks ago
config: powerpc-randconfig-m031-20230226 (https://download.01.org/0day-ci/archive/20230226/202302262345.cyAD2tEI-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302262345.cyAD2tEI-lkp@intel.com/

New smatch warnings:
mm/vmalloc.c:3609 vread() error: we previously assumed 'vm' could be null (see line 3591)

Old smatch warnings:
arch/powerpc/include/asm/mmu.h:265 mmu_has_feature() warn: bitwise AND condition is false here
arch/powerpc/include/asm/mmu.h:234 early_mmu_has_feature() warn: bitwise AND condition is false here

vim +/vm +3609 mm/vmalloc.c

06c8994626d1b7 Baoquan He              2023-02-06  3527  
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3528  /**
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3529   * vread() - read vmalloc area in a safe way.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3530   * @buf:     buffer for reading data
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3531   * @addr:    vm address.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3532   * @count:   number of bytes to be read.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3533   *
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3534   * This function checks that addr is a valid vmalloc'ed area, and
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3535   * copy data from that area to a given buffer. If the given memory range
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3536   * of [addr...addr+count) includes some valid address, data is copied to
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3537   * proper area of @buf. If there are memory holes, they'll be zero-filled.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3538   * IOREMAP area is treated as memory hole and no copy is done.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3539   *
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3540   * If [addr...addr+count) doesn't includes any intersects with alive
a8e5202d09c1ba Cong Wang               2012-06-23  3541   * vm_struct area, returns 0. @buf should be kernel's buffer.
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3542   *
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3543   * Note: In usual ops, vread() is never necessary because the caller
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3544   * should know vmalloc() area is valid and can use memcpy().
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3545   * This is for routines which have to access vmalloc area without
bbcd53c9607135 David Hildenbrand       2021-05-06  3546   * any information, as /proc/kcore.
a862f68a8b3600 Mike Rapoport           2019-03-05  3547   *
a862f68a8b3600 Mike Rapoport           2019-03-05  3548   * Return: number of bytes for which addr and buf should be increased
a862f68a8b3600 Mike Rapoport           2019-03-05  3549   * (same number as @count) or %0 if [addr...addr+count) doesn't
a862f68a8b3600 Mike Rapoport           2019-03-05  3550   * include any intersection with valid vmalloc area
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3551   */
^1da177e4c3f41 Linus Torvalds          2005-04-16  3552  long vread(char *buf, char *addr, unsigned long count)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3553  {
e81ce85f960c2e Joonsoo Kim             2013-04-29  3554  	struct vmap_area *va;
e81ce85f960c2e Joonsoo Kim             2013-04-29  3555  	struct vm_struct *vm;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3556  	char *vaddr, *buf_start = buf;
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3557  	unsigned long buflen = count;
06c8994626d1b7 Baoquan He              2023-02-06  3558  	unsigned long n, size, flags;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3559  
4aff1dc4fb3a5a Andrey Konovalov        2022-03-24  3560  	addr = kasan_reset_tag(addr);
4aff1dc4fb3a5a Andrey Konovalov        2022-03-24  3561  
^1da177e4c3f41 Linus Torvalds          2005-04-16  3562  	/* Don't allow overflow */
^1da177e4c3f41 Linus Torvalds          2005-04-16  3563  	if ((unsigned long) addr + count < count)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3564  		count = -(unsigned long) addr;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3565  
e81ce85f960c2e Joonsoo Kim             2013-04-29  3566  	spin_lock(&vmap_area_lock);
f181234a5a21fd Chen Wandun             2021-09-02  3567  	va = find_vmap_area_exceed_addr((unsigned long)addr);
f608788cd2d6ca Serapheim Dimitropoulos 2021-04-29  3568  	if (!va)
f608788cd2d6ca Serapheim Dimitropoulos 2021-04-29  3569  		goto finished;
f181234a5a21fd Chen Wandun             2021-09-02  3570  
f181234a5a21fd Chen Wandun             2021-09-02  3571  	/* no intersects with alive vmap_area */
f181234a5a21fd Chen Wandun             2021-09-02  3572  	if ((unsigned long)addr + count <= va->va_start)
f181234a5a21fd Chen Wandun             2021-09-02  3573  		goto finished;
f181234a5a21fd Chen Wandun             2021-09-02  3574  
f608788cd2d6ca Serapheim Dimitropoulos 2021-04-29  3575  	list_for_each_entry_from(va, &vmap_area_list, list) {
e81ce85f960c2e Joonsoo Kim             2013-04-29  3576  		if (!count)
e81ce85f960c2e Joonsoo Kim             2013-04-29  3577  			break;
e81ce85f960c2e Joonsoo Kim             2013-04-29  3578  
06c8994626d1b7 Baoquan He              2023-02-06  3579  		vm = va->vm;
06c8994626d1b7 Baoquan He              2023-02-06  3580  		flags = va->flags & VMAP_FLAGS_MASK;
06c8994626d1b7 Baoquan He              2023-02-06  3581  		/*
06c8994626d1b7 Baoquan He              2023-02-06  3582  		 * VMAP_BLOCK indicates a sub-type of vm_map_ram area, need
06c8994626d1b7 Baoquan He              2023-02-06  3583  		 * be set together with VMAP_RAM.
06c8994626d1b7 Baoquan He              2023-02-06  3584  		 */
06c8994626d1b7 Baoquan He              2023-02-06  3585  		WARN_ON(flags == VMAP_BLOCK);
06c8994626d1b7 Baoquan He              2023-02-06  3586  
06c8994626d1b7 Baoquan He              2023-02-06  3587  		if (!vm && !flags)
e81ce85f960c2e Joonsoo Kim             2013-04-29  3588  			continue;
e81ce85f960c2e Joonsoo Kim             2013-04-29  3589  
06c8994626d1b7 Baoquan He              2023-02-06  3590  		vaddr = (char *) va->va_start;
06c8994626d1b7 Baoquan He              2023-02-06 @3591  		size = vm ? get_vm_area_size(vm) : va_size(va);
06c8994626d1b7 Baoquan He              2023-02-06  3592  
06c8994626d1b7 Baoquan He              2023-02-06  3593  		if (addr >= vaddr + size)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3594  			continue;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3595  		while (addr < vaddr) {
^1da177e4c3f41 Linus Torvalds          2005-04-16  3596  			if (count == 0)
^1da177e4c3f41 Linus Torvalds          2005-04-16  3597  				goto finished;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3598  			*buf = '\0';
^1da177e4c3f41 Linus Torvalds          2005-04-16  3599  			buf++;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3600  			addr++;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3601  			count--;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3602  		}
06c8994626d1b7 Baoquan He              2023-02-06  3603  		n = vaddr + size - addr;
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3604  		if (n > count)
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3605  			n = count;
06c8994626d1b7 Baoquan He              2023-02-06  3606  
06c8994626d1b7 Baoquan He              2023-02-06  3607  		if (flags & VMAP_RAM)
06c8994626d1b7 Baoquan He              2023-02-06  3608  			vmap_ram_vread(buf, addr, n, flags);
06c8994626d1b7 Baoquan He              2023-02-06 @3609  		else if (!(vm->flags & VM_IOREMAP))
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3610  			aligned_vread(buf, addr, n);
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3611  		else /* IOREMAP area is treated as memory hole */
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3612  			memset(buf, 0, n);
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3613  		buf += n;
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3614  		addr += n;
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3615  		count -= n;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3616  	}
^1da177e4c3f41 Linus Torvalds          2005-04-16  3617  finished:
e81ce85f960c2e Joonsoo Kim             2013-04-29  3618  	spin_unlock(&vmap_area_lock);
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3619  
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3620  	if (buf == buf_start)
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3621  		return 0;
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3622  	/* zero-fill memory holes */
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3623  	if (buf != buf_start + buflen)
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3624  		memset(buf, 0, buflen - (buf - buf_start));
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3625  
d0107eb07320b5 KAMEZAWA Hiroyuki       2009-09-21  3626  	return buflen;
^1da177e4c3f41 Linus Torvalds          2005-04-16  3627  }
^1da177e4c3f41 Linus Torvalds          2005-04-16  3628  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
