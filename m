Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29E8A214409
	for <oe-kbuild@lists.linux.dev>; Wed, 30 Oct 2024 16:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730304322; cv=none; b=mdT/Pi5C5e+Nekno3TDmxyQJkHiyv/pv4fVBkDXn6GK2XKsGL6dN57G/2kmerbzI72kgorPO6e74JCSTiFjCUCIVbzsSGz2Y3Pz1zc1P3kl6w5JaoOiYyJBGt1d9TZlpBKzNg3AP6liNgSExVcUq2YXI/P1y3Dyl8yv3OM7R6YI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730304322; c=relaxed/simple;
	bh=17MbwZNbcbuLpjIWUCnBiSloyFbwLTJBA1g/GTtrwec=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uyPaRg+uNDGGMssOl8LyZEBXxqCBFkdtndcRdctcPmkaXSdni0e6yIdjBnfbpDZrriqBruKcy8GoxZeGsgI7NfPKIu6/taUbpbf1W8OcCS9zvuDkjorGKmayahqImtlhHvAKl6mkcSnFh8jBvqK4eThH8Oga4s92cef+NbzEEqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nN+kreDy; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nN+kreDy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730304320; x=1761840320;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=17MbwZNbcbuLpjIWUCnBiSloyFbwLTJBA1g/GTtrwec=;
  b=nN+kreDyFKPe1u/wkKyBGs6dFYSpv8iz6I63TnUw+sujj4nQ8wNS/UNd
   K0QPPIvn+rr9+BwWHvOtV2wL/9AH0BkwTqKjBGS95qpLswQ3plT0sLeb+
   BMijdFMBShPClKgV4wroOhTA67xqEb4DYIxcMavcp9I2viThrw+Ewe8x+
   EFdqQUR0Z+rxIKL1kfjg4CRqZ0rJDPKJj9rNNZmtC7nw+tawS/mlTBueO
   cdEm3i+IALhix8WU7pYsnZ9RKE4uOdsGHhfegYU0tr1yqYmJ+NgbxoOSY
   Xnt6Exbf0vrQNj1Sr2Ve+ycRN1RJ3er0gnqSXKH7MtuUgRHqCYQTx3aOO
   w==;
X-CSE-ConnectionGUID: fzG+wpuESGu09Gv0d8jZCw==
X-CSE-MsgGUID: bCe+DkswSge68p43Atho+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11241"; a="40586626"
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="40586626"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2024 09:05:19 -0700
X-CSE-ConnectionGUID: JnPbQkYiRn2tOuvU4xnIWw==
X-CSE-MsgGUID: vg3eOAiUQ/630Bupd9rEhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,245,1725346800"; 
   d="scan'208";a="82678230"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Oct 2024 09:05:18 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t6BC8-000f2a-16;
	Wed, 30 Oct 2024 16:05:16 +0000
Date: Thu, 31 Oct 2024 00:04:50 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/module.c:644 process_accumulated_relocations()
 error: uninitialized symbol 'curr_type'.
Message-ID: <202410310040.RtNqUQ1z-lkp@intel.com>
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
TO: Palmer Dabbelt <palmer@rivosinc.com>
CC: Charlie Jenkins <charlie@rivosinc.com>

Hi Palmer,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c1e939a21eb111a6d6067b38e8e04b8809b64c4e
commit: 28ea54bade76e2d47cb8cdb96e427cfb90d3eea7 RISC-V: Don't rely on positional structure initialization
date:   12 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 12 months ago
config: riscv-randconfig-r071-20241030 (https://download.01.org/0day-ci/archive/20241031/202410310040.RtNqUQ1z-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410310040.RtNqUQ1z-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/module.c:644 process_accumulated_relocations() error: uninitialized symbol 'curr_type'.

Old smatch warnings:
arch/riscv/kernel/module.c:637 process_accumulated_relocations() error: dereferencing freed memory 'rel_entry_iter'
arch/riscv/kernel/module.c:634 process_accumulated_relocations() error: dereferencing freed memory 'rel_head_iter'
arch/riscv/kernel/module.c:633 process_accumulated_relocations() error: dereferencing freed memory 'bucket_iter'

vim +/curr_type +644 arch/riscv/kernel/module.c

e2c0cdfba7f699 Palmer Dabbelt  2017-07-10  606  
8fd6c5142395a1 Charlie Jenkins 2023-11-01  607  void process_accumulated_relocations(struct module *me)
8fd6c5142395a1 Charlie Jenkins 2023-11-01  608  {
8fd6c5142395a1 Charlie Jenkins 2023-11-01  609  	/*
8fd6c5142395a1 Charlie Jenkins 2023-11-01  610  	 * Only ADD/SUB/SET/ULEB128 should end up here.
8fd6c5142395a1 Charlie Jenkins 2023-11-01  611  	 *
8fd6c5142395a1 Charlie Jenkins 2023-11-01  612  	 * Each bucket may have more than one relocation location. All
8fd6c5142395a1 Charlie Jenkins 2023-11-01  613  	 * relocations for a location are stored in a list in a bucket.
8fd6c5142395a1 Charlie Jenkins 2023-11-01  614  	 *
8fd6c5142395a1 Charlie Jenkins 2023-11-01  615  	 * Relocations are applied to a temp variable before being stored to the
8fd6c5142395a1 Charlie Jenkins 2023-11-01  616  	 * provided location to check for overflow. This also allows ULEB128 to
8fd6c5142395a1 Charlie Jenkins 2023-11-01  617  	 * properly decide how many entries are needed before storing to
8fd6c5142395a1 Charlie Jenkins 2023-11-01  618  	 * location. The final value is stored into location using the handler
8fd6c5142395a1 Charlie Jenkins 2023-11-01  619  	 * for the last relocation to an address.
8fd6c5142395a1 Charlie Jenkins 2023-11-01  620  	 *
8fd6c5142395a1 Charlie Jenkins 2023-11-01  621  	 * Three layers of indexing:
8fd6c5142395a1 Charlie Jenkins 2023-11-01  622  	 *	- Each of the buckets in use
8fd6c5142395a1 Charlie Jenkins 2023-11-01  623  	 *	- Groups of relocations in each bucket by location address
8fd6c5142395a1 Charlie Jenkins 2023-11-01  624  	 *	- Each relocation entry for a location address
8fd6c5142395a1 Charlie Jenkins 2023-11-01  625  	 */
8fd6c5142395a1 Charlie Jenkins 2023-11-01  626  	struct used_bucket *bucket_iter;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  627  	struct relocation_head *rel_head_iter;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  628  	struct relocation_entry *rel_entry_iter;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  629  	int curr_type;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  630  	void *location;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  631  	long buffer;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  632  
8fd6c5142395a1 Charlie Jenkins 2023-11-01  633  	list_for_each_entry(bucket_iter, &used_buckets_list, head) {
8fd6c5142395a1 Charlie Jenkins 2023-11-01  634  		hlist_for_each_entry(rel_head_iter, bucket_iter->bucket, node) {
8fd6c5142395a1 Charlie Jenkins 2023-11-01  635  			buffer = 0;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  636  			location = rel_head_iter->location;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  637  			list_for_each_entry(rel_entry_iter,
8fd6c5142395a1 Charlie Jenkins 2023-11-01  638  					    rel_head_iter->rel_entry, head) {
8fd6c5142395a1 Charlie Jenkins 2023-11-01  639  				curr_type = rel_entry_iter->type;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  640  				reloc_handlers[curr_type].reloc_handler(
8fd6c5142395a1 Charlie Jenkins 2023-11-01  641  					me, &buffer, rel_entry_iter->value);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  642  				kfree(rel_entry_iter);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  643  			}
8fd6c5142395a1 Charlie Jenkins 2023-11-01 @644  			reloc_handlers[curr_type].accumulate_handler(
8fd6c5142395a1 Charlie Jenkins 2023-11-01  645  				me, location, buffer);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  646  			kfree(rel_head_iter);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  647  		}
8fd6c5142395a1 Charlie Jenkins 2023-11-01  648  		kfree(bucket_iter);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  649  	}
8fd6c5142395a1 Charlie Jenkins 2023-11-01  650  
8fd6c5142395a1 Charlie Jenkins 2023-11-01  651  	kfree(relocation_hashtable);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  652  }
8fd6c5142395a1 Charlie Jenkins 2023-11-01  653  

:::::: The code at line 644 was first introduced by commit
:::::: 8fd6c5142395a106b63c8668e9f4a7106b6a0772 riscv: Add remaining module relocations

:::::: TO: Charlie Jenkins <charlie@rivosinc.com>
:::::: CC: Palmer Dabbelt <palmer@rivosinc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
