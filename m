Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C898B749A
	for <oe-kbuild@lists.linux.dev>; Sat,  5 Oct 2024 21:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728164732; cv=none; b=JEqraW0kzp2mJZBr9ho2c8Duuh1G9pu0Kyjt2y89JpK7y8WE0Y0DqbXa3pH4Wx7L6bj5QV8HuB4zAiu/S0IpOdw4q9g6u6QbpVW1Tnth8Lh/xR82PHguReW37m+XHEpZcwuRlT5WoGYndSbdGG+t423SxSy7auxRNa/pl0Kn6Es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728164732; c=relaxed/simple;
	bh=SFZ3xznSKCiY48bGzu3Oe+SS1GCy6sgNw0qD75bLmcI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ixt6m4lw4QYfPYBj0uOgI9K1DVo8DIrQbaUaoGg1bCXUzipnLPVkahmHJEv6o3eSop6Cpt8BX4Z89fsc9ezncgEtJew9bmWw0Zi3Wfyq4tNnBm/6fd9JICn2EoIz2XXNlcgq9r2K8iTx4RhYg2PayPkX/zr583BRNfPIYav6Ork=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O116KB6A; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O116KB6A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728164730; x=1759700730;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SFZ3xznSKCiY48bGzu3Oe+SS1GCy6sgNw0qD75bLmcI=;
  b=O116KB6A+nmZUesfaPgJfrG5i5Ux74qWbOsEicMb/CWGZ57bIMA8qXjO
   so0FApGn99akmUyhCIitI2StVlQLAmGIIlOyyxdlvWUPxk+S8mhVWLuv1
   1VtYxhiEOOJJ5Haxc9RV/2Gc0FvRQB6YQnRurGZTC6wit5cL0v1ZanXkO
   EQEwLRGmCuaTbtu1R7Gp5nqdlLrJKr1F+qe8CI7qobTGM4YQ3HQGBgjtB
   SDeOL4z+QIZNJ7rHgmMfIpPwiFwdI3LWUGqxO2rxlQb2wa18jwzOCk1Gk
   R2wzdrVWEJOiX6mOyvWc5uTOovInbX/w8B2CzXQFdoFaIYRBqSJw02uFl
   g==;
X-CSE-ConnectionGUID: Aj1rxkJxS0Gf7F0KEv4dPg==
X-CSE-MsgGUID: vl9Sw8RiShqI+9/pFWq33A==
X-IronPort-AV: E=McAfee;i="6700,10204,11216"; a="52753611"
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="52753611"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 14:45:29 -0700
X-CSE-ConnectionGUID: xv4XOl1+Rie9Y/dtirkv2Q==
X-CSE-MsgGUID: tjRQKd1hQM2Ifk3uax+yxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,181,1725346800"; 
   d="scan'208";a="75391982"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 05 Oct 2024 14:45:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxCab-0003Na-2w;
	Sat, 05 Oct 2024 21:45:25 +0000
Date: Sun, 6 Oct 2024 05:45:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: arch/x86/kvm/mmu/tdp_mmu.c:1475:1-7: preceding lock on line 1439
Message-ID: <202410060537.9JlrUilT-lkp@intel.com>
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
TO: David Matlack <dmatlack@google.com>
CC: Sean Christopherson <seanjc@google.com>

Hi David,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc20a3e57247e21e1bd582f604b20bf898f7d111
commit: 3d4a5a45ca26f8de9e0a4f384a2fb0967b8566b5 KVM: x86/mmu: Unnest TDP MMU helpers that allocate SPs for eager splitting
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-103-20241006 (https://download.01.org/0day-ci/archive/20241006/202410060537.9JlrUilT-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410060537.9JlrUilT-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> arch/x86/kvm/mmu/tdp_mmu.c:1475:1-7: preceding lock on line 1439
>> arch/x86/kvm/mmu/tdp_mmu.c:1475:1-7: preceding lock on line 1439
   arch/x86/kvm/mmu/tdp_mmu.c:1475:1-7: preceding lock on line 1441
   arch/x86/kvm/mmu/tdp_mmu.c:1475:1-7: preceding lock on line 1441

vim +1475 arch/x86/kvm/mmu/tdp_mmu.c

a3fe5dbda0a4bb David Matlack 2022-01-19  1397  
a3fe5dbda0a4bb David Matlack 2022-01-19  1398  static int tdp_mmu_split_huge_pages_root(struct kvm *kvm,
a3fe5dbda0a4bb David Matlack 2022-01-19  1399  					 struct kvm_mmu_page *root,
a3fe5dbda0a4bb David Matlack 2022-01-19  1400  					 gfn_t start, gfn_t end,
cb00a70bd4b7e4 David Matlack 2022-01-19  1401  					 int target_level, bool shared)
a3fe5dbda0a4bb David Matlack 2022-01-19  1402  {
a3fe5dbda0a4bb David Matlack 2022-01-19  1403  	struct kvm_mmu_page *sp = NULL;
a3fe5dbda0a4bb David Matlack 2022-01-19  1404  	struct tdp_iter iter;
a3fe5dbda0a4bb David Matlack 2022-01-19  1405  	int ret = 0;
a3fe5dbda0a4bb David Matlack 2022-01-19  1406  
a3fe5dbda0a4bb David Matlack 2022-01-19  1407  	rcu_read_lock();
a3fe5dbda0a4bb David Matlack 2022-01-19  1408  
a3fe5dbda0a4bb David Matlack 2022-01-19  1409  	/*
a3fe5dbda0a4bb David Matlack 2022-01-19  1410  	 * Traverse the page table splitting all huge pages above the target
a3fe5dbda0a4bb David Matlack 2022-01-19  1411  	 * level into one lower level. For example, if we encounter a 1GB page
a3fe5dbda0a4bb David Matlack 2022-01-19  1412  	 * we split it into 512 2MB pages.
a3fe5dbda0a4bb David Matlack 2022-01-19  1413  	 *
a3fe5dbda0a4bb David Matlack 2022-01-19  1414  	 * Since the TDP iterator uses a pre-order traversal, we are guaranteed
a3fe5dbda0a4bb David Matlack 2022-01-19  1415  	 * to visit an SPTE before ever visiting its children, which means we
a3fe5dbda0a4bb David Matlack 2022-01-19  1416  	 * will correctly recursively split huge pages that are more than one
a3fe5dbda0a4bb David Matlack 2022-01-19  1417  	 * level above the target level (e.g. splitting a 1GB to 512 2MB pages,
a3fe5dbda0a4bb David Matlack 2022-01-19  1418  	 * and then splitting each of those to 512 4KB pages).
a3fe5dbda0a4bb David Matlack 2022-01-19  1419  	 */
a3fe5dbda0a4bb David Matlack 2022-01-19  1420  	for_each_tdp_pte_min_level(iter, root, target_level + 1, start, end) {
a3fe5dbda0a4bb David Matlack 2022-01-19  1421  retry:
cb00a70bd4b7e4 David Matlack 2022-01-19  1422  		if (tdp_mmu_iter_cond_resched(kvm, &iter, false, shared))
a3fe5dbda0a4bb David Matlack 2022-01-19  1423  			continue;
a3fe5dbda0a4bb David Matlack 2022-01-19  1424  
a3fe5dbda0a4bb David Matlack 2022-01-19  1425  		if (!is_shadow_present_pte(iter.old_spte) || !is_large_pte(iter.old_spte))
a3fe5dbda0a4bb David Matlack 2022-01-19  1426  			continue;
a3fe5dbda0a4bb David Matlack 2022-01-19  1427  
a3fe5dbda0a4bb David Matlack 2022-01-19  1428  		if (!sp) {
3d4a5a45ca26f8 David Matlack 2024-06-11  1429  			rcu_read_unlock();
3d4a5a45ca26f8 David Matlack 2024-06-11  1430  
3d4a5a45ca26f8 David Matlack 2024-06-11  1431  			if (shared)
3d4a5a45ca26f8 David Matlack 2024-06-11  1432  				read_unlock(&kvm->mmu_lock);
3d4a5a45ca26f8 David Matlack 2024-06-11  1433  			else
3d4a5a45ca26f8 David Matlack 2024-06-11  1434  				write_unlock(&kvm->mmu_lock);
3d4a5a45ca26f8 David Matlack 2024-06-11  1435  
3d4a5a45ca26f8 David Matlack 2024-06-11  1436  			sp = tdp_mmu_alloc_sp_for_split();
3d4a5a45ca26f8 David Matlack 2024-06-11  1437  
3d4a5a45ca26f8 David Matlack 2024-06-11  1438  			if (shared)
3d4a5a45ca26f8 David Matlack 2024-06-11 @1439  				read_lock(&kvm->mmu_lock);
3d4a5a45ca26f8 David Matlack 2024-06-11  1440  			else
3d4a5a45ca26f8 David Matlack 2024-06-11  1441  				write_lock(&kvm->mmu_lock);
3d4a5a45ca26f8 David Matlack 2024-06-11  1442  
3d4a5a45ca26f8 David Matlack 2024-06-11  1443  			rcu_read_lock();
3d4a5a45ca26f8 David Matlack 2024-06-11  1444  
a3fe5dbda0a4bb David Matlack 2022-01-19  1445  			if (!sp) {
a3fe5dbda0a4bb David Matlack 2022-01-19  1446  				ret = -ENOMEM;
e0b728b1f1a951 David Matlack 2022-01-19  1447  				trace_kvm_mmu_split_huge_page(iter.gfn,
e0b728b1f1a951 David Matlack 2022-01-19  1448  							      iter.old_spte,
e0b728b1f1a951 David Matlack 2022-01-19  1449  							      iter.level, ret);
a3fe5dbda0a4bb David Matlack 2022-01-19  1450  				break;
a3fe5dbda0a4bb David Matlack 2022-01-19  1451  			}
a3fe5dbda0a4bb David Matlack 2022-01-19  1452  
3d4a5a45ca26f8 David Matlack 2024-06-11  1453  			iter.yielded = true;
a3fe5dbda0a4bb David Matlack 2022-01-19  1454  			continue;
a3fe5dbda0a4bb David Matlack 2022-01-19  1455  		}
a3fe5dbda0a4bb David Matlack 2022-01-19  1456  
c4b33d28ea51c7 David Matlack 2022-11-09  1457  		tdp_mmu_init_child_sp(sp, &iter);
c4b33d28ea51c7 David Matlack 2022-11-09  1458  
cb00a70bd4b7e4 David Matlack 2022-01-19  1459  		if (tdp_mmu_split_huge_page(kvm, &iter, sp, shared))
a3fe5dbda0a4bb David Matlack 2022-01-19  1460  			goto retry;
a3fe5dbda0a4bb David Matlack 2022-01-19  1461  
a3fe5dbda0a4bb David Matlack 2022-01-19  1462  		sp = NULL;
a3fe5dbda0a4bb David Matlack 2022-01-19  1463  	}
a3fe5dbda0a4bb David Matlack 2022-01-19  1464  
a3fe5dbda0a4bb David Matlack 2022-01-19  1465  	rcu_read_unlock();
a3fe5dbda0a4bb David Matlack 2022-01-19  1466  
a3fe5dbda0a4bb David Matlack 2022-01-19  1467  	/*
a3fe5dbda0a4bb David Matlack 2022-01-19  1468  	 * It's possible to exit the loop having never used the last sp if, for
a3fe5dbda0a4bb David Matlack 2022-01-19  1469  	 * example, a vCPU doing HugePage NX splitting wins the race and
a3fe5dbda0a4bb David Matlack 2022-01-19  1470  	 * installs its own sp in place of the last sp we tried to split.
a3fe5dbda0a4bb David Matlack 2022-01-19  1471  	 */
a3fe5dbda0a4bb David Matlack 2022-01-19  1472  	if (sp)
a3fe5dbda0a4bb David Matlack 2022-01-19  1473  		tdp_mmu_free_sp(sp);
a3fe5dbda0a4bb David Matlack 2022-01-19  1474  
a3fe5dbda0a4bb David Matlack 2022-01-19 @1475  	return ret;
a3fe5dbda0a4bb David Matlack 2022-01-19  1476  }
a3fe5dbda0a4bb David Matlack 2022-01-19  1477  

:::::: The code at line 1475 was first introduced by commit
:::::: a3fe5dbda0a4bb7759dcd5a0ad713d347e020401 KVM: x86/mmu: Split huge pages mapped by the TDP MMU when dirty logging is enabled

:::::: TO: David Matlack <dmatlack@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
