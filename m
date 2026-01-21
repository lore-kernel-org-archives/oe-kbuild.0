Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA72B2C026F
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 08:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768985808; cv=none; b=Vjc8OOVULUzXa6uNqJ9MkjgAZ3+KWmpUo6XzkGMeNE3IXufxbHgszA2BPnYI+a3MknH4vMFUocwcfPHm7QZyqIusz6qGdBnjbUY7NsXKo0C8JItuL6Olos14cguQjR2CKoUWf8LcIR/uvJu5g1hPDFhpWdo7k/zAHnk2trrMhBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768985808; c=relaxed/simple;
	bh=A7HbzgnwW3i9JpFjweoyYiYp2VvxZKO0S/mjcGST7QI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Qm+wU4C4U8cayF8Cgy+tDg8gWFc3c4oQ6no9sUzzFhRoCCYOf7TCg8NwUGpdPVbl1VA2buPhgwaHtqytXbgJis3dBrj6AY6SlnLFX8TWeLZuMkjpMdQMJB4asWrg2I9RYwnHwr+GMMv5VpYKWsgh4fNuRD5bpalg33lKlV5/7a8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EAYcin3u; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EAYcin3u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768985806; x=1800521806;
  h=date:from:to:cc:subject:message-id;
  bh=A7HbzgnwW3i9JpFjweoyYiYp2VvxZKO0S/mjcGST7QI=;
  b=EAYcin3u2sxFWyfe3vLL/VS4XyU+o/S5RbmMHeAOhsvYUHhC8WHptrmE
   ixVsL3XBjyv5uvj9a8DJOTnYww3qBze8p/UaJwElNs0nfqCEhZ7Gp1nkv
   JQAGGDwt0Qarf+QS9L6XndU8LZfr7DrDjJcybXKqYcLpiMDxGouHkw6Sj
   HM4TdI2/d8/HepjiI6yyV/24PQknoWL9+7ol5h8Q0oxNLb+cBuHclpFBE
   PZXV1NfMhJ5salFB+FcyyzZR+LOrPZSFqffD1+G3lJlQqj+K61XBbNY6J
   GFMvuAJ3bG2sK5kHoabLIbtHL8RWkiWlzj6/ZyOPYwO4I/ccAtHp0ZT4/
   w==;
X-CSE-ConnectionGUID: LZyZlg7eTM29qrPMNaUXTA==
X-CSE-MsgGUID: QjGz0SYpRzSPGfAS8rxifQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="70374801"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="70374801"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2026 00:56:46 -0800
X-CSE-ConnectionGUID: AwOukx3wSBi2apiF0CD7rw==
X-CSE-MsgGUID: xkWV+T42ReO4hpCPA6tEFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="210557319"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Jan 2026 00:56:45 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viU14-00000000QBf-1lQK;
	Wed, 21 Jan 2026 08:56:42 +0000
Date: Wed, 21 Jan 2026 16:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/liveupdate/kexec_handover.c:994
 kho_preserve_vmalloc() warn: missing error code 'err'
Message-ID: <202601211636.IRaejjdw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Jason Gunthorpe <jgg@nvidia.com>
CC: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Hi Pasha,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6c790212c588fddeb0d852f2790840753bb604b1
commit: 48a1b2321d763b5edeaf20bd4576d8c4b5df772b liveupdate: kho: move to kernel/liveupdate
date:   8 weeks ago
:::::: branch date: 10 hours ago
:::::: commit date: 8 weeks ago
config: x86_64-randconfig-r071-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211636.IRaejjdw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601211636.IRaejjdw-lkp@intel.com/

smatch warnings:
kernel/liveupdate/kexec_handover.c:994 kho_preserve_vmalloc() warn: missing error code 'err'
kernel/liveupdate/kexec_handover.c:1373 kho_release_scratch() warn: iterator 'i' not incremented

vim +/err +994 kernel/liveupdate/kexec_handover.c

a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   944) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   945) /**
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   946)  * kho_preserve_vmalloc - preserve memory allocated with vmalloc() across kexec
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   947)  * @ptr: pointer to the area in vmalloc address space
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   948)  * @preservation: placeholder for preservation metadata
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   949)  *
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   950)  * Instructs KHO to preserve the area in vmalloc address space at @ptr. The
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   951)  * physical pages mapped at @ptr will be preserved and on successful return
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   952)  * @preservation will hold the physical address of a structure that describes
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   953)  * the preservation.
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   954)  *
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   955)  * NOTE: The memory allocated with vmalloc_node() variants cannot be reliably
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   956)  * restored on the same node
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   957)  *
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   958)  * Return: 0 on success, error code on failure
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   959)  */
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   960) int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   961) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   962) 	struct kho_vmalloc_chunk *chunk;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   963) 	struct vm_struct *vm = find_vm_area(ptr);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   964) 	unsigned int order, flags, nr_contig_pages;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   965) 	unsigned int idx = 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   966) 	int err;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   967) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   968) 	if (!vm)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   969) 		return -EINVAL;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   970) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   971) 	if (vm->flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   972) 		return -EOPNOTSUPP;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   973) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   974) 	flags = vmalloc_flags_to_kho(vm->flags);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   975) 	order = get_vm_area_page_order(vm);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   976) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   977) 	chunk = new_vmalloc_chunk(NULL);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   978) 	if (!chunk)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   979) 		return -ENOMEM;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   980) 	KHOSER_STORE_PTR(preservation->first, chunk);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   981) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   982) 	nr_contig_pages = (1 << order);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   983) 	for (int i = 0; i < vm->nr_pages; i += nr_contig_pages) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   984) 		phys_addr_t phys = page_to_phys(vm->pages[i]);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   985) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   986) 		err = kho_preserve_pages(vm->pages[i], nr_contig_pages);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   987) 		if (err)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   988) 			goto err_free;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   989) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   990) 		chunk->phys[idx++] = phys;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   991) 		if (idx == ARRAY_SIZE(chunk->phys)) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   992) 			chunk = new_vmalloc_chunk(chunk);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   993) 			if (!chunk)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  @994) 				goto err_free;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   995) 			idx = 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   996) 		}
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   997) 	}
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   998) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21   999) 	preservation->total_pages = vm->nr_pages;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1000) 	preservation->flags = flags;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1001) 	preservation->order = order;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1002) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1003) 	return 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1004) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1005) err_free:
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1006) 	kho_vmalloc_free_chunks(preservation);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1007) 	return err;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1008) }
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1009) EXPORT_SYMBOL_GPL(kho_preserve_vmalloc);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  1010) 

:::::: The code at line 994 was first introduced by commit
:::::: a667300bd53f272a3055238bcefe108f88836270 kho: add support for preserving vmalloc allocations

:::::: TO: Mike Rapoport (Microsoft) <rppt@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
