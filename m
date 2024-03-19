Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4843A56B6E
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Mar 2024 04:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710821665; cv=none; b=duvUUDwHk6yGlH1VPWekoeFOsjn62nfb1R+0AVOAxL0qpryzKsjdYeij5XOrwrCILflPyja1ommXxAjnj+Pt+Y6QxoYdgqCNKLU4emOUiUhP9l8aET71zUfqbOSBYhlIQg/EVPD3SgMUZBFBdw3JGCDhVzOah5WijQUIg1mm7vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710821665; c=relaxed/simple;
	bh=BPwDqI1EWYXv3uVZWLi1dQ8sOfkGsQ5w4IEr4AVIAFk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mTTFB/LMzAJ8M72om34d41bp//G2OIEAK9al5bJyGR1Z28w+jKVit4ab7rGID2tJBA/z1grzUiHC2HuHmQLC64dPGMITkZMtr1nv1ZDdeaoP0XMghlpv2TYFY2/ENX0dOGbJWv/sDAtar+k3At5HdZISt55aV7Estb8njRLuzcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NmpB5JLI; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NmpB5JLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710821663; x=1742357663;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BPwDqI1EWYXv3uVZWLi1dQ8sOfkGsQ5w4IEr4AVIAFk=;
  b=NmpB5JLIJC1Wv9NJcM28B6zHKO9BZ6ms+pWEipLWs1nLqd/+O6sG1IT7
   eYkOJNHosyto10XTq2HwgzVAYEjB7pgFX5i+FOLGe9a86ruwZ55G4pYBq
   qlWiPlJtij5dbd2O2Rxi0BDu+MvUhXwEvjSP/LgcsxAJvosyT9kQVI0OI
   c+WQP81tcjF24k1F58qMFCjj5sLztnRhQsuXEM7rdm2ZlOpDCKsB5vZUW
   tuwAoVbLe+zYN64nfH2YZCfdQuDBH0eKhWUQswclMx8lDTwPIXtcjC/NH
   /IRLMWI+ufGriNnX/9xAM7iGp1OWRqyti0WQYu105QNj4+T5buiqTadfD
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="16310501"
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="16310501"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2024 21:14:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,135,1708416000"; 
   d="scan'208";a="18159907"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Mar 2024 21:14:21 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rmQrj-000HRz-0n;
	Tue, 19 Mar 2024 04:14:19 +0000
Date: Tue, 19 Mar 2024 12:13:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/mips/kernel/smp-cps.c:128 setup_cps_vecs() error:
 __builtin_memcpy() '&excep_tlbfill' too small (4 vs 128)
Message-ID: <202403191206.Bqtwd8XQ-lkp@intel.com>
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
TO: Jiaxun Yang <jiaxun.yang@flygoat.com>
CC: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
CC: Gregory CLEMENT <gregory.clement@bootlin.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b3603fcb79b1036acae10602bffc4855a4b9af80
commit: 5e9d13bd3de8c34ee81b9db8c50887fea5b93834 MIPS: Allows relocation exception vectors everywhere
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: mips-randconfig-r071-20240318 (https://download.01.org/0day-ci/archive/20240319/202403191206.Bqtwd8XQ-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 8f68022f8e6e54d1aeae4ed301f5a015963089b7)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403191206.Bqtwd8XQ-lkp@intel.com/

smatch warnings:
arch/mips/kernel/smp-cps.c:128 setup_cps_vecs() error: __builtin_memcpy() '&excep_tlbfill' too small (4 vs 128)
arch/mips/kernel/smp-cps.c:129 setup_cps_vecs() error: __builtin_memcpy() '&excep_xtlbfill' too small (4 vs 128)
arch/mips/kernel/smp-cps.c:130 setup_cps_vecs() error: __builtin_memcpy() '&excep_cache' too small (4 vs 128)
arch/mips/kernel/smp-cps.c:131 setup_cps_vecs() error: __builtin_memcpy() '&excep_genex' too small (4 vs 128)
arch/mips/kernel/smp-cps.c:132 setup_cps_vecs() error: __builtin_memcpy() '&excep_intex' too small (4 vs 128)
arch/mips/kernel/smp-cps.c:133 setup_cps_vecs() error: __builtin_memcpy() '&excep_ejtag' too small (4 vs 128)

vim +128 arch/mips/kernel/smp-cps.c

5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  120  
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  121  static void __init setup_cps_vecs(void)
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  122  {
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  123  	void *cps_vec;
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  124  
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  125  	cps_vec = (void *)CKSEG1ADDR_OR_64BIT(cps_vec_pa);
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  126  	mips_cps_build_core_entry(cps_vec);
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  127  
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16 @128  	memcpy(cps_vec + 0x200, &excep_tlbfill, 0x80);
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16 @129  	memcpy(cps_vec + 0x280, &excep_xtlbfill, 0x80);
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16 @130  	memcpy(cps_vec + 0x300, &excep_cache, 0x80);
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16 @131  	memcpy(cps_vec + 0x380, &excep_genex, 0x80);
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16 @132  	memcpy(cps_vec + 0x400, &excep_intex, 0x80);
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16 @133  	memcpy(cps_vec + 0x480, &excep_ejtag, 0x80);
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  134  
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  135  	/* Make sure no prefetched data in cache */
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  136  	blast_inv_dcache_range(CKSEG0ADDR_OR_64BIT(cps_vec_pa), CKSEG0ADDR_OR_64BIT(cps_vec_pa) + BEV_VEC_SIZE);
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  137  	bc_inv(CKSEG0ADDR_OR_64BIT(cps_vec_pa), BEV_VEC_SIZE);
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  138  	__sync();
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  139  }
5e9d13bd3de8c3 Jiaxun Yang 2024-02-16  140  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
