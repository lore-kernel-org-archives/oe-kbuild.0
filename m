Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FF4B199FB2
	for <oe-kbuild@lists.linux.dev>; Thu, 22 May 2025 17:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747934474; cv=none; b=QR+lxZiyJWzMNyd4b9Cd3ynTzJS5jQcTgSaTeqiUjjv321+u8S3vlbJyRPAo9BTN0XHUvan10RPqsGzduxDW2EqV4NeOSf8OHRy4e2AnkiDrwyJMI5z3lhP4Rb1UMqmuw12bSgPKLN0v3TsRZo416qpXmNQgMUq1hXMHft24JIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747934474; c=relaxed/simple;
	bh=qwgYctYg0ayS+lqj/ZWaMIH3w6cKccVNB94A31viQF4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hsGQyNm4Nfh0VZ75jT3+s+SBW0faEuKnMVpSW9uGwpdpEYRbzeWZWCyxs9cTtPBqZ4UAG4XXAhlhBx1uEj5vlcTjSv6wsp53NrCyjptUGHSt2udRH+fAQ6m65LyUWzCVB6O6i+sxmANb5Bt+SRrCXFpBJg91t8iF55faiLYvYow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Q8x4eICs; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Q8x4eICs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747934473; x=1779470473;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qwgYctYg0ayS+lqj/ZWaMIH3w6cKccVNB94A31viQF4=;
  b=Q8x4eICsqKLRD7CfKr2iDCPokMxzsA/5JdwVGyW+f6UeePMHF3Nsox8Q
   mvZZ3jEsxSUUMGy62j9k6jnaYLd5C+3JcnFwvTX/6abe1EB07Kq3V8x1i
   1rQLAEXfKL+S7CRaPNvezMofGjTT10TivWJRLu+pThJhMbOr2uyp67oP8
   2jPzdmZnSVacHVeUZYXYndxp45IR1K1JqwGGByJJ9N7gMxT3/6pUF5yNT
   YW4lEzETjUxYw2trcGBzBSAwgpoVH6Qc3wtgeFJnfQ7zmJN1+1vTaEFf5
   Tfp6mIbEJbFYAMB8kkCE298Nlmz8tsuP+SgvvqAX7tFWrr50phXGjUwTc
   g==;
X-CSE-ConnectionGUID: h1aMHU3pS7uyA+pvFyOzSQ==
X-CSE-MsgGUID: MX90iFgzR3ytkmk7x2BDDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53638996"
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="53638996"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 10:21:11 -0700
X-CSE-ConnectionGUID: vP2IbMMdQW+76cNTUw3vdg==
X-CSE-MsgGUID: IOEs+OjhSNaZ2WQOSOvSCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,306,1739865600"; 
   d="scan'208";a="140560508"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 22 May 2025 10:21:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uI9bP-000PYQ-0s;
	Thu, 22 May 2025 17:21:07 +0000
Date: Fri, 23 May 2025 01:20:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10124/12895] drivers/gpu/drm/xe/xe_pt.c:2088
 op_prepare() warn: iterator 'i' not incremented
Message-ID: <202505230113.Q7BXxqpS-lkp@intel.com>
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
TO: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   460178e842c7a1e48a06df684c66eb5fd630bcf7
commit: 09ba0a8f06cd69d93eef0dc3bee33546880e46f8 [10124/12895] drm/xe/svm: Implement prefetch support for SVM ranges
:::::: branch date: 8 hours ago
:::::: commit date: 8 days ago
config: loongarch-randconfig-r073-20250522 (https://download.01.org/0day-ci/archive/20250523/202505230113.Q7BXxqpS-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505230113.Q7BXxqpS-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/xe/xe_pt.c:2088 op_prepare() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_pt.c:2307 op_commit() warn: iterator 'i' not incremented
drivers/gpu/drm/xe/xe_vm.c:2900 prefetch_ranges() warn: iterator 'i' not incremented

Old smatch warnings:
drivers/gpu/drm/xe/xe_pt.c:762 xe_pt_stage_bind() error: we previously assumed 'bo' could be null (see line 753)
drivers/gpu/drm/xe/xe_vm.c:2471 new_vma() error: we previously assumed 'bo' could be null (see line 2445)
arch/loongarch/include/asm/atomic.h:135 arch_atomic_fetch_add_unless() warn: inconsistent indenting
drivers/gpu/drm/xe/xe_vm.c:4061 xe_vm_snapshot_print() warn: passing zero to 'PTR_ERR'

vim +/i +2088 drivers/gpu/drm/xe/xe_pt.c

d1e6efdfabf3e5 Matthew Brost         2025-03-05  2028  
e8babb280b5ef9 Matthew Brost         2024-07-03  2029  static int op_prepare(struct xe_vm *vm,
e8babb280b5ef9 Matthew Brost         2024-07-03  2030  		      struct xe_tile *tile,
e8babb280b5ef9 Matthew Brost         2024-07-03  2031  		      struct xe_vm_pgtable_update_ops *pt_update_ops,
e8babb280b5ef9 Matthew Brost         2024-07-03  2032  		      struct xe_vma_op *op)
e8babb280b5ef9 Matthew Brost         2024-07-03  2033  {
e8babb280b5ef9 Matthew Brost         2024-07-03  2034  	int err = 0;
e8babb280b5ef9 Matthew Brost         2024-07-03  2035  
e8babb280b5ef9 Matthew Brost         2024-07-03  2036  	xe_vm_assert_held(vm);
e8babb280b5ef9 Matthew Brost         2024-07-03  2037  
e8babb280b5ef9 Matthew Brost         2024-07-03  2038  	switch (op->base.op) {
e8babb280b5ef9 Matthew Brost         2024-07-03  2039  	case DRM_GPUVA_OP_MAP:
5b658b7e89c312 Oak Zeng              2025-04-03  2040  		if ((!op->map.immediate && xe_vm_in_fault_mode(vm) &&
5b658b7e89c312 Oak Zeng              2025-04-03  2041  		     !op->map.invalidate_on_bind) ||
b43e864af0d4e7 Matthew Brost         2025-03-05  2042  		    op->map.is_cpu_addr_mirror)
e8babb280b5ef9 Matthew Brost         2024-07-03  2043  			break;
e8babb280b5ef9 Matthew Brost         2024-07-03  2044  
5b658b7e89c312 Oak Zeng              2025-04-03  2045  		err = bind_op_prepare(vm, tile, pt_update_ops, op->map.vma,
5b658b7e89c312 Oak Zeng              2025-04-03  2046  				      op->map.invalidate_on_bind);
e8babb280b5ef9 Matthew Brost         2024-07-03  2047  		pt_update_ops->wait_vm_kernel = true;
e8babb280b5ef9 Matthew Brost         2024-07-03  2048  		break;
e8babb280b5ef9 Matthew Brost         2024-07-03  2049  	case DRM_GPUVA_OP_REMAP:
b43e864af0d4e7 Matthew Brost         2025-03-05  2050  	{
b43e864af0d4e7 Matthew Brost         2025-03-05  2051  		struct xe_vma *old = gpuva_to_vma(op->base.remap.unmap->va);
b43e864af0d4e7 Matthew Brost         2025-03-05  2052  
b43e864af0d4e7 Matthew Brost         2025-03-05  2053  		if (xe_vma_is_cpu_addr_mirror(old))
b43e864af0d4e7 Matthew Brost         2025-03-05  2054  			break;
b43e864af0d4e7 Matthew Brost         2025-03-05  2055  
b43e864af0d4e7 Matthew Brost         2025-03-05  2056  		err = unbind_op_prepare(tile, pt_update_ops, old);
e8babb280b5ef9 Matthew Brost         2024-07-03  2057  
e8babb280b5ef9 Matthew Brost         2024-07-03  2058  		if (!err && op->remap.prev) {
e8babb280b5ef9 Matthew Brost         2024-07-03  2059  			err = bind_op_prepare(vm, tile, pt_update_ops,
5b658b7e89c312 Oak Zeng              2025-04-03  2060  					      op->remap.prev, false);
e8babb280b5ef9 Matthew Brost         2024-07-03  2061  			pt_update_ops->wait_vm_bookkeep = true;
e8babb280b5ef9 Matthew Brost         2024-07-03  2062  		}
e8babb280b5ef9 Matthew Brost         2024-07-03  2063  		if (!err && op->remap.next) {
e8babb280b5ef9 Matthew Brost         2024-07-03  2064  			err = bind_op_prepare(vm, tile, pt_update_ops,
5b658b7e89c312 Oak Zeng              2025-04-03  2065  					      op->remap.next, false);
e8babb280b5ef9 Matthew Brost         2024-07-03  2066  			pt_update_ops->wait_vm_bookkeep = true;
e8babb280b5ef9 Matthew Brost         2024-07-03  2067  		}
e8babb280b5ef9 Matthew Brost         2024-07-03  2068  		break;
b43e864af0d4e7 Matthew Brost         2025-03-05  2069  	}
e8babb280b5ef9 Matthew Brost         2024-07-03  2070  	case DRM_GPUVA_OP_UNMAP:
b43e864af0d4e7 Matthew Brost         2025-03-05  2071  	{
b43e864af0d4e7 Matthew Brost         2025-03-05  2072  		struct xe_vma *vma = gpuva_to_vma(op->base.unmap.va);
b43e864af0d4e7 Matthew Brost         2025-03-05  2073  
b43e864af0d4e7 Matthew Brost         2025-03-05  2074  		if (xe_vma_is_cpu_addr_mirror(vma))
b43e864af0d4e7 Matthew Brost         2025-03-05  2075  			break;
b43e864af0d4e7 Matthew Brost         2025-03-05  2076  
b43e864af0d4e7 Matthew Brost         2025-03-05  2077  		err = unbind_op_prepare(tile, pt_update_ops, vma);
e8babb280b5ef9 Matthew Brost         2024-07-03  2078  		break;
b43e864af0d4e7 Matthew Brost         2025-03-05  2079  	}
e8babb280b5ef9 Matthew Brost         2024-07-03  2080  	case DRM_GPUVA_OP_PREFETCH:
b43e864af0d4e7 Matthew Brost         2025-03-05  2081  	{
b43e864af0d4e7 Matthew Brost         2025-03-05  2082  		struct xe_vma *vma = gpuva_to_vma(op->base.prefetch.va);
b43e864af0d4e7 Matthew Brost         2025-03-05  2083  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2084  		if (xe_vma_is_cpu_addr_mirror(vma)) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2085  			struct xe_svm_range *range;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2086  			unsigned long i;
b43e864af0d4e7 Matthew Brost         2025-03-05  2087  
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13 @2088  			xa_for_each(&op->prefetch_range.range, i, range) {
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2089  				err = bind_range_prepare(vm, tile, pt_update_ops,
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2090  							 vma, range);
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2091  				if (err)
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2092  					return err;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2093  			}
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2094  		} else {
5b658b7e89c312 Oak Zeng              2025-04-03  2095  			err = bind_op_prepare(vm, tile, pt_update_ops, vma, false);
e8babb280b5ef9 Matthew Brost         2024-07-03  2096  			pt_update_ops->wait_vm_kernel = true;
09ba0a8f06cd69 Himal Prasad Ghimiray 2025-05-13  2097  		}
e8babb280b5ef9 Matthew Brost         2024-07-03  2098  		break;
b43e864af0d4e7 Matthew Brost         2025-03-05  2099  	}
7d1d48fb1724b3 Matthew Brost         2025-03-05  2100  	case DRM_GPUVA_OP_DRIVER:
7d1d48fb1724b3 Matthew Brost         2025-03-05  2101  		if (op->subop == XE_VMA_SUBOP_MAP_RANGE) {
7d1d48fb1724b3 Matthew Brost         2025-03-05  2102  			xe_assert(vm->xe, xe_vma_is_cpu_addr_mirror(op->map_range.vma));
7d1d48fb1724b3 Matthew Brost         2025-03-05  2103  
7d1d48fb1724b3 Matthew Brost         2025-03-05  2104  			err = bind_range_prepare(vm, tile, pt_update_ops,
7d1d48fb1724b3 Matthew Brost         2025-03-05  2105  						 op->map_range.vma,
7d1d48fb1724b3 Matthew Brost         2025-03-05  2106  						 op->map_range.range);
d1e6efdfabf3e5 Matthew Brost         2025-03-05  2107  		} else if (op->subop == XE_VMA_SUBOP_UNMAP_RANGE) {
d1e6efdfabf3e5 Matthew Brost         2025-03-05  2108  			err = unbind_range_prepare(vm, tile, pt_update_ops,
d1e6efdfabf3e5 Matthew Brost         2025-03-05  2109  						   op->unmap_range.range);
7d1d48fb1724b3 Matthew Brost         2025-03-05  2110  		}
7d1d48fb1724b3 Matthew Brost         2025-03-05  2111  		break;
e8babb280b5ef9 Matthew Brost         2024-07-03  2112  	default:
e8babb280b5ef9 Matthew Brost         2024-07-03  2113  		drm_warn(&vm->xe->drm, "NOT POSSIBLE");
e8babb280b5ef9 Matthew Brost         2024-07-03  2114  	}
e8babb280b5ef9 Matthew Brost         2024-07-03  2115  
e8babb280b5ef9 Matthew Brost         2024-07-03  2116  	return err;
e8babb280b5ef9 Matthew Brost         2024-07-03  2117  }
e8babb280b5ef9 Matthew Brost         2024-07-03  2118  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
