Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333253F9FB
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Oct 2025 02:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760062538; cv=none; b=noma10EiUMHYnS5GsnYSGNT3tar2JvK5BH++vPOZJHqYfy9bAqqI7U0eSDp8GPAnMy+h9N+2D6LXbAGkE06vXhQ7wBzMtI5D+s/xfV4Jddub9vHot1NmwsMY/q1Wzwmr3auB8rjeTzcyTaoL9cnUeSOT7VbG09novJwCrr/3rec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760062538; c=relaxed/simple;
	bh=ugO2S+xTMApQ2g7F4IQdFsAtDxYfX5UwlQC8OaGtTzY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKMklKBcZ0+avw6NyCqe2MNE2K9Jo4gY8Zm1Zb3VrVL60YQUQ31ARSYX/f/AVtifxzQw1QII58dGtf8FhKHCJ2yi+4WD4sOjFAL+Y39rlkOhxw3s72Ni+vMZN+yO6W9njvUTHiJ9w7oSySRFbxav2mzLqx4U9iFyB+7rUIlO+MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jj95o3/x; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jj95o3/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760062536; x=1791598536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ugO2S+xTMApQ2g7F4IQdFsAtDxYfX5UwlQC8OaGtTzY=;
  b=jj95o3/xQwFbNRMAlRJocHO2617CT+L4fn0XoQTKQdhxOv+6wHAqVrws
   VdlLSxRMxLygmnBSl/U/cBJlyD/2sfya7wmnWLPahBhjZ8uaCddIzP2JG
   i3f2BkFGDFReBROw6ASC91hSes8u8w/3hiaRFRxBDW586E6C6ScuK43bE
   EIQzJdZ3UyvRh1wveiVPBhyB+HGD840vx7jF8f/s94YNnpn11qIL5rA01
   T1TyzvxWlhPo41SYpo6qDH5AV8TGXj0YkeN33IOn7FoCJ8TXZY1ZXEWP1
   Vz7boi/h0Q+6q8gD2OqJK1FGUJGlrg7q3YD6QdjVn2MIxRWR/LW9Dw4Yr
   g==;
X-CSE-ConnectionGUID: 0M7PhSWKTka6d34yFzWd2Q==
X-CSE-MsgGUID: jIir4nGGTJ+TKmy7wQ87kQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="61490141"
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="61490141"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 19:15:35 -0700
X-CSE-ConnectionGUID: vE26CxG4QpCtZK7dSnaGhQ==
X-CSE-MsgGUID: vzjBwLG7Qh2Fi7FgQx2ZHQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,217,1754982000"; 
   d="scan'208";a="179971242"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Oct 2025 19:15:34 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v72fL-0001t8-1t;
	Fri, 10 Oct 2025 02:15:31 +0000
Date: Fri, 10 Oct 2025 10:15:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13427/13588]
 kernel/liveupdate/kexec_handover.c:978 kho_preserve_vmalloc() warn: missing
 error code 'err'
Message-ID: <202510100941.GZGMq64U-lkp@intel.com>
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
TO: Pasha Tatashin <pasha.tatashin@soleen.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Jason Gunthorpe <jgg@nvidia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0b2f041c47acb45db82b4e847af6e17eb66cd32d
commit: f13bb574707674d1113a40e0b6dc4d9a143d2ec1 [13427/13588] liveupdate: kho: move to kernel/liveupdate
:::::: branch date: 14 hours ago
:::::: commit date: 20 hours ago
config: x86_64-randconfig-161-20251010 (https://download.01.org/0day-ci/archive/20251010/202510100941.GZGMq64U-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510100941.GZGMq64U-lkp@intel.com/

smatch warnings:
kernel/liveupdate/kexec_handover.c:978 kho_preserve_vmalloc() warn: missing error code 'err'
kernel/liveupdate/kexec_handover.c:1335 kho_release_scratch() warn: iterator 'i' not incremented

vim +/err +978 kernel/liveupdate/kexec_handover.c

a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  928) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  929) /**
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  930)  * kho_preserve_vmalloc - preserve memory allocated with vmalloc() across kexec
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  931)  * @ptr: pointer to the area in vmalloc address space
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  932)  * @preservation: placeholder for preservation metadata
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  933)  *
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  934)  * Instructs KHO to preserve the area in vmalloc address space at @ptr. The
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  935)  * physical pages mapped at @ptr will be preserved and on successful return
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  936)  * @preservation will hold the physical address of a structure that describes
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  937)  * the preservation.
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  938)  *
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  939)  * NOTE: The memory allocated with vmalloc_node() variants cannot be reliably
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  940)  * restored on the same node
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  941)  *
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  942)  * Return: 0 on success, error code on failure
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  943)  */
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  944) int kho_preserve_vmalloc(void *ptr, struct kho_vmalloc *preservation)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  945) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  946) 	struct kho_vmalloc_chunk *chunk;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  947) 	struct vm_struct *vm = find_vm_area(ptr);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  948) 	unsigned int order, flags, nr_contig_pages;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  949) 	unsigned int idx = 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  950) 	int err;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  951) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  952) 	if (!vm)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  953) 		return -EINVAL;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  954) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  955) 	if (vm->flags & ~KHO_VMALLOC_SUPPORTED_FLAGS)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  956) 		return -EOPNOTSUPP;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  957) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  958) 	flags = vmalloc_flags_to_kho(vm->flags);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  959) 	order = get_vm_area_page_order(vm);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  960) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  961) 	chunk = new_vmalloc_chunk(NULL);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  962) 	if (!chunk)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  963) 		return -ENOMEM;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  964) 	KHOSER_STORE_PTR(preservation->first, chunk);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  965) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  966) 	nr_contig_pages = (1 << order);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  967) 	for (int i = 0; i < vm->nr_pages; i += nr_contig_pages) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  968) 		phys_addr_t phys = page_to_phys(vm->pages[i]);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  969) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  970) 		err = kho_preserve_pages(vm->pages[i], nr_contig_pages);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  971) 		if (err)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  972) 			goto err_free;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  973) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  974) 		chunk->phys[idx++] = phys;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  975) 		if (idx == ARRAY_SIZE(chunk->phys)) {
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  976) 			chunk = new_vmalloc_chunk(chunk);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  977) 			if (!chunk)
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21 @978) 				goto err_free;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  979) 			idx = 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  980) 		}
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  981) 	}
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  982) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  983) 	preservation->total_pages = vm->nr_pages;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  984) 	preservation->flags = flags;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  985) 	preservation->order = order;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  986) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  987) 	return 0;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  988) 
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  989) err_free:
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  990) 	kho_vmalloc_free_chunks(preservation);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  991) 	return err;
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  992) }
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  993) EXPORT_SYMBOL_GPL(kho_preserve_vmalloc);
a667300bd53f27 kernel/kexec_handover.c Mike Rapoport (Microsoft  2025-09-21  994) 

:::::: The code at line 978 was first introduced by commit
:::::: a667300bd53f272a3055238bcefe108f88836270 kho: add support for preserving vmalloc allocations

:::::: TO: Mike Rapoport (Microsoft) <rppt@kernel.org>
:::::: CC: Andrew Morton <akpm@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
