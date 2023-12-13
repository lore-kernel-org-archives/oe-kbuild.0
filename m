Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C3B2137A
	for <oe-kbuild@lists.linux.dev>; Wed, 13 Dec 2023 09:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DfmQhqwm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702461400; x=1733997400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fKHpQDkvjHn/Tkm2AUZHA3U2luVjCKR8DE6O0ExwUo4=;
  b=DfmQhqwmlupdgBxQ2SBGnQnkAeJRLMbP1KnpLL39f40ohXksmED/SRar
   p8XsC3bRW81r4b07ux5/qrwDIL4sekSnDciMZKiZtdiWveFXSTcKxZHiu
   ZSq9YCfwSRt0FMztacd7s2yy5Slri09QE6OkE4EBfBLxqhDfrAVlk76EB
   bNNYcFSrLhGqMTuORUkDvxGjFA2Nlv3UtPrFLCFixXOIU7MYkscMCR3qs
   7fGCoEoAwxFmzHc+7wjkAUStA8sg/G0/mXwQ4K2AIBSCpRmZveihM+lFh
   rPJGE0aIXv5fQ+tGnb9YFeHscHQzHlg1DI7NFbh1+9jOY07qUOKro0h51
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="1797899"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="1797899"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 01:56:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="750059657"
X-IronPort-AV: E=Sophos;i="6.04,272,1695711600"; 
   d="scan'208";a="750059657"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Dec 2023 01:56:37 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDLyK-000KML-1c;
	Wed, 13 Dec 2023 09:56:11 +0000
Date: Wed, 13 Dec 2023 17:54:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/riscv/kernel/module.c:639 process_accumulated_relocations()
 error: uninitialized symbol 'curr_type'.
Message-ID: <202312131734.tvtEi4Aq-lkp@intel.com>
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
TO: Charlie Jenkins <charlie@rivosinc.com>
CC: Palmer Dabbelt <palmer@rivosinc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88035e5694a86a7167d490bb95e9df97a9bb162b
commit: 8fd6c5142395a106b63c8668e9f4a7106b6a0772 riscv: Add remaining module relocations
date:   5 weeks ago
:::::: branch date: 9 hours ago
:::::: commit date: 5 weeks ago
config: riscv-randconfig-r071-20231211 (https://download.01.org/0day-ci/archive/20231213/202312131734.tvtEi4Aq-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312131734.tvtEi4Aq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312131734.tvtEi4Aq-lkp@intel.com/

New smatch warnings:
arch/riscv/kernel/module.c:639 process_accumulated_relocations() error: uninitialized symbol 'curr_type'.

Old smatch warnings:
arch/riscv/kernel/module.c:632 process_accumulated_relocations() error: dereferencing freed memory 'rel_entry_iter'
arch/riscv/kernel/module.c:629 process_accumulated_relocations() error: dereferencing freed memory 'rel_head_iter'
arch/riscv/kernel/module.c:628 process_accumulated_relocations() error: dereferencing freed memory 'bucket_iter'

vim +/curr_type +639 arch/riscv/kernel/module.c

e2c0cdfba7f699 Palmer Dabbelt  2017-07-10  601  
8fd6c5142395a1 Charlie Jenkins 2023-11-01  602  void process_accumulated_relocations(struct module *me)
8fd6c5142395a1 Charlie Jenkins 2023-11-01  603  {
8fd6c5142395a1 Charlie Jenkins 2023-11-01  604  	/*
8fd6c5142395a1 Charlie Jenkins 2023-11-01  605  	 * Only ADD/SUB/SET/ULEB128 should end up here.
8fd6c5142395a1 Charlie Jenkins 2023-11-01  606  	 *
8fd6c5142395a1 Charlie Jenkins 2023-11-01  607  	 * Each bucket may have more than one relocation location. All
8fd6c5142395a1 Charlie Jenkins 2023-11-01  608  	 * relocations for a location are stored in a list in a bucket.
8fd6c5142395a1 Charlie Jenkins 2023-11-01  609  	 *
8fd6c5142395a1 Charlie Jenkins 2023-11-01  610  	 * Relocations are applied to a temp variable before being stored to the
8fd6c5142395a1 Charlie Jenkins 2023-11-01  611  	 * provided location to check for overflow. This also allows ULEB128 to
8fd6c5142395a1 Charlie Jenkins 2023-11-01  612  	 * properly decide how many entries are needed before storing to
8fd6c5142395a1 Charlie Jenkins 2023-11-01  613  	 * location. The final value is stored into location using the handler
8fd6c5142395a1 Charlie Jenkins 2023-11-01  614  	 * for the last relocation to an address.
8fd6c5142395a1 Charlie Jenkins 2023-11-01  615  	 *
8fd6c5142395a1 Charlie Jenkins 2023-11-01  616  	 * Three layers of indexing:
8fd6c5142395a1 Charlie Jenkins 2023-11-01  617  	 *	- Each of the buckets in use
8fd6c5142395a1 Charlie Jenkins 2023-11-01  618  	 *	- Groups of relocations in each bucket by location address
8fd6c5142395a1 Charlie Jenkins 2023-11-01  619  	 *	- Each relocation entry for a location address
8fd6c5142395a1 Charlie Jenkins 2023-11-01  620  	 */
8fd6c5142395a1 Charlie Jenkins 2023-11-01  621  	struct used_bucket *bucket_iter;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  622  	struct relocation_head *rel_head_iter;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  623  	struct relocation_entry *rel_entry_iter;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  624  	int curr_type;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  625  	void *location;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  626  	long buffer;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  627  
8fd6c5142395a1 Charlie Jenkins 2023-11-01  628  	list_for_each_entry(bucket_iter, &used_buckets_list, head) {
8fd6c5142395a1 Charlie Jenkins 2023-11-01  629  		hlist_for_each_entry(rel_head_iter, bucket_iter->bucket, node) {
8fd6c5142395a1 Charlie Jenkins 2023-11-01  630  			buffer = 0;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  631  			location = rel_head_iter->location;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  632  			list_for_each_entry(rel_entry_iter,
8fd6c5142395a1 Charlie Jenkins 2023-11-01  633  					    rel_head_iter->rel_entry, head) {
8fd6c5142395a1 Charlie Jenkins 2023-11-01  634  				curr_type = rel_entry_iter->type;
8fd6c5142395a1 Charlie Jenkins 2023-11-01  635  				reloc_handlers[curr_type].reloc_handler(
8fd6c5142395a1 Charlie Jenkins 2023-11-01  636  					me, &buffer, rel_entry_iter->value);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  637  				kfree(rel_entry_iter);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  638  			}
8fd6c5142395a1 Charlie Jenkins 2023-11-01 @639  			reloc_handlers[curr_type].accumulate_handler(
8fd6c5142395a1 Charlie Jenkins 2023-11-01  640  				me, location, buffer);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  641  			kfree(rel_head_iter);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  642  		}
8fd6c5142395a1 Charlie Jenkins 2023-11-01  643  		kfree(bucket_iter);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  644  	}
8fd6c5142395a1 Charlie Jenkins 2023-11-01  645  
8fd6c5142395a1 Charlie Jenkins 2023-11-01  646  	kfree(relocation_hashtable);
8fd6c5142395a1 Charlie Jenkins 2023-11-01  647  }
8fd6c5142395a1 Charlie Jenkins 2023-11-01  648  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
