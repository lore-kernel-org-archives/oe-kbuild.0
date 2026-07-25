Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 346032D97B9
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jul 2026 16:30:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784997003; cv=none; b=ti7OzUTvOGdjm7u4asniwNZOWhxFW2hRL55jA+sFN/fUoKzFqqwYG4dH0f+GUhv6nPWle5pipWLLNEZXFGMcaHFFjJIeEzwPlc87tduE3QA6CYcEH+T9BYMteWgixP94FStj00jg8ZInbNwCoUqblN3YC5QXhIrtEgYXejiofVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784997003; c=relaxed/simple;
	bh=FVPqVE/EySgpnj1mJHT6Wuf8+yj7tDKJSe2BNn+hRq4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oy7pRC4RIz/utg1CU2oJO2BTpYnXJnW+xi2zCPorX/8qrWLSoBoPuawEIJmLFOLSPp787vtXja6S6sIvfHHHy+6TIqUO0vdCo3Ac2TKf5BJM9RyXQQlCyFuYexpmjpn907vxjGrqDj3bqefwqNXICillXRMLx7w3Vmglfmq5ae0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rh+zxNjn; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rh+zxNjn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784997001; x=1816533001;
  h=date:from:to:cc:subject:message-id;
  bh=FVPqVE/EySgpnj1mJHT6Wuf8+yj7tDKJSe2BNn+hRq4=;
  b=Rh+zxNjnM2Opee5cPYc4G+WtiXzjrAZsMY6ktpy66oATYZrjy6+mF4GV
   sl7HrjAmS6OROe+9rBpAc0BS4x3XNHBLBQH8geH9CfUUCO+Sb/U8QWFHv
   IFVblPOjClRP9kqnWpKS4Gl2FLLiLiAWzceYF0oluULlyhHnPGU7L6kTr
   5ZIr3kKmSqBxZS3N5KxM+YC5GVU2sSxKgDH2/zREth9xTxl2kxZo6pipp
   95sX6nemvOV7gD5Or6c7GHdKRn8fFZyMWPyE8TMVEwRJd//HL8DmOW41S
   RGO8nOo60rT7ggIjtJ3CW2PN6LVDCt+qdkg6rcLQ/hHIb8kAVHA7685YB
   Q==;
X-CSE-ConnectionGUID: wEgM5K5qRSuUPGLIU81pdQ==
X-CSE-MsgGUID: TbSlAwBfTq++ubWzr9BpGA==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="96224606"
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="96224606"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 09:30:00 -0700
X-CSE-ConnectionGUID: ofE2QWcsT7aZMTP2CcYk3w==
X-CSE-MsgGUID: btzLNsCHQEytpdqICsvidQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,184,1779174000"; 
   d="scan'208";a="262763128"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 25 Jul 2026 09:29:58 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnfG8-00000000bnd-08Iz;
	Sat, 25 Jul 2026 16:29:56 +0000
Date: Sun, 26 Jul 2026 00:28:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [intel-lts:6.18/linux 1/1] kernel/kexec_handover.c:941
 kho_preserve_vmalloc() warn: missing error code 'err'
Message-ID: <202607260054.fmMWCkfT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev

tree:   https://github.com/intel/linux-intel-lts.git 6.18/linux
head:   af406d75818b912a1b72efa75a20f8bf3e9a3f01
commit: a667300bd53f272a3055238bcefe108f88836270 [1/1] kho: add support for preserving vmalloc allocations
:::::: branch date: 9 days ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20260725 (https://download.01.org/0day-ci/archive/20260726/202607260054.fmMWCkfT-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: a667300bd53f ("kho: add support for preserving vmalloc allocations")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607260054.fmMWCkfT-lkp@intel.com/

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
