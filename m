Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1582A21CFFA
	for <oe-kbuild@lists.linux.dev>; Mon, 22 Dec 2025 08:04:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766390656; cv=none; b=QcoTY75g4zBKLXhJiIfMmj6kyfTHaB6aHWrtundR5vq238UeRkVY5YJG0AthmWG8J8LozhlGIMa+yLBghUOsiE9SANAWMvHnaAn+HpqofOhQCoOgI4llrPtE8rMnQFURh1byWzw5JWL2tKw7ajjLiipVgxqwh3kBs7VFDYTiN3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766390656; c=relaxed/simple;
	bh=HnTKARGQhbg2fxQ/O9RnwTIBk7hrBSQR2lWm+MduAVE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ddM3nlzDAvaj+IE2vcZpf6Hr0W/lnWXGukESwW9dWjxKe8g+Op0G0NX4E1vSETNfHClXb47mE1wPaq/nrdGhGWfJ9wMd4TE1Gu8Q5icdHnFDkOEgnoDC8/D3HcriKyeJW6Mu5egrIfrIKkxJ2dlqwDJ5QFj4sMZN8581i4jW2OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ee93G9El; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ee93G9El"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766390654; x=1797926654;
  h=date:from:to:cc:subject:message-id;
  bh=HnTKARGQhbg2fxQ/O9RnwTIBk7hrBSQR2lWm+MduAVE=;
  b=Ee93G9ElmgPeH58bn2xPSUGJjmZwwTu3pwqcDVdzOBQyml3MMBYufsmn
   I2JaGR3F+22BGowrXnov3JtwHsL2x7w2a4LGc1DJGIq14c8HAma9TJfgo
   /7jYLvF1Z9pdwMIJAh2ZLiv+KP3qlLnwSXtijxlvhNuECDVSBllCDyGhy
   8jZhPO45BjxCu22OOTSzfuwyMnMwyjSrwV6OiMBnGOvq9PNpXlIS8ncxz
   t1Vta/PEIbqZRpVSZ7pI59GPxfJnzXL8x0GOyyN+vgiNubdeRCTEQq5lA
   sQayKk53c6XQL8ucJ1s1vjRf0Ves+Jz0flyDsTxqfJTD7WGiWNsBpX+PX
   A==;
X-CSE-ConnectionGUID: SurkfvNARIu8YhCnWNN3Pg==
X-CSE-MsgGUID: wVvJ6/SsT0OZDfqrbkYQxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="68287511"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="68287511"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2025 00:04:12 -0800
X-CSE-ConnectionGUID: sAUqUACpSNGuNZtoDMSRMQ==
X-CSE-MsgGUID: EcMJCVxWSgKkkzwsGsjtLA==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 22 Dec 2025 00:04:11 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXasz-000000000FI-2vsY;
	Mon, 22 Dec 2025 08:03:51 +0000
Date: Mon, 22 Dec 2025 16:02:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android-mainline 5/5]
 kernel/kexec_handover.c:941 kho_preserve_vmalloc() warn: missing error code
 'err'
Message-ID: <202512221523.4WsnhR3e-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android-mainline
head:   3ce6827ad16244f83976f3267e13d63da0613660
commit: a667300bd53f272a3055238bcefe108f88836270 [5/5] kho: add support for preserving vmalloc allocations
:::::: branch date: 26 hours ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-r073-20251222 (https://download.01.org/0day-ci/archive/20251222/202512221523.4WsnhR3e-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512221523.4WsnhR3e-lkp@intel.com/

smatch warnings:
kernel/kexec_handover.c:941 kho_preserve_vmalloc() warn: missing error code 'err'

vim +/err +941 kernel/kexec_handover.c

a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  891) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  892) /**
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  893)  * kho_preserve_vmalloc - preserve memory allocated with vmalloc() across kexec
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  894)  * @ptr: pointer to the area in vmalloc address space
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  895)  * @preservation: placeholder for preservation metadata
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  896)  *
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  897)  * Instructs KHO to preserve the area in vmalloc address space at @ptr. The
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  898)  * physical pages mapped at @ptr will be preserved and on successful return
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  899)  * @preservation will hold the physical address of a structure that describes
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  900)  * the preservation.
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  901)  *
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  902)  * NOTE: The memory allocated with vmalloc_node() variants cannot be reliably
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  903)  * restored on the same node
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  904)  *
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  905)  * Return: 0 on success, error code on failure
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  906)  */
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  907) int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  908) {
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  909) 	struct kho_vmalloc_chunk *chunk;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  910) 	struct vm_struct *vm = find_vm_area(ptr);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  911) 	unsigned int order, flags, nr_contig_pages;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  912) 	unsigned int idx = 0;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  913) 	int err;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  914) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  915) 	if (!vm)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  916) 		return -EINVAL;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  917) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  918) 	if (vm->flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  919) 		return -EOPNOTSUPP;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  920) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  921) 	flags = vmalloc_flags_to_kho(vm->flags);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  922) 	order = get_vm_area_page_order(vm);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  923) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  924) 	chunk = new_vmalloc_chunk(NULL);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  925) 	if (!chunk)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  926) 		return -ENOMEM;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  927) 	KHOSER_STORE_PTR(preservation->first, chunk);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  928) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  929) 	nr_contig_pages = (1 << order);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  930) 	for (int i = 0; i < vm->nr_pages; i += nr_contig_pages) {
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  931) 		phys_addr_t phys = page_to_phys(vm->pages[i]);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  932) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  933) 		err = kho_preserve_pages(vm->pages[i], nr_contig_pages);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  934) 		if (err)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  935) 			goto err_free;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  936) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  937) 		chunk->phys[idx++] = phys;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  938) 		if (idx == ARRAY_SIZE(chunk->phys)) {
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  939) 			chunk = new_vmalloc_chunk(chunk);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  940) 			if (!chunk)
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21 @941) 				goto err_free;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  942) 			idx = 0;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  943) 		}
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  944) 	}
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  945) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  946) 	preservation->total_pages = vm->nr_pages;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  947) 	preservation->flags = flags;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  948) 	preservation->order = order;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  949) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  950) 	return 0;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  951) 
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  952) err_free:
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  953) 	kho_vmalloc_free_chunks(preservation);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  954) 	return err;
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  955) }
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  956) EXPORT_SYMBOL_GPL(kho_preserve_vmalloc);
a667300bd53f27 Mike Rapoport (Microsoft  2025-09-21  957) 

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
