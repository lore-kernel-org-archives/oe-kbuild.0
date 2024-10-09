Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7B3518FDAF
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 11:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728473812; cv=none; b=GG9LbCiOZYhM9CbM/bslkbrwAAqQdkx9ETEDWFrTZgVR0+fPs4E1eRU1Va6wLrBlgWquKbY/tU/qx3LCLe78sB2YOJ7V4tPY44PDyeNREzFgEkURXytWiRTXHr4eACVmHspdSzWO6xjHyVIyspmlZF/GAG3QTLfEzW1HNZO3RBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728473812; c=relaxed/simple;
	bh=4GaRCMsgCp1pPy3ykWsyDtbrpwIryfUKCGlypDS/hDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t+ReUqbFJjNCTA+akBm3T3DJWoSPSJl9qiyWCCqVKptSsrfwXTSsBVqOWEZ0HsiA76Vi4tIOF1KORdQPtdP2VM83fiOLP5eO7rrgp+Bf9qKPpehaqN0znEGxk6lBGas274/kFwaGCYBIwWU2CerVj752xst6g9PIQ/U3yvtcNLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrr0EI3Q; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrr0EI3Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728473811; x=1760009811;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4GaRCMsgCp1pPy3ykWsyDtbrpwIryfUKCGlypDS/hDE=;
  b=nrr0EI3QwUtjqPnEw38qoY4A+66pfTbGUnc+e4Py8x8izojD8gKqpJtJ
   ffhlQiN8eERGXmun3xqI3rgGDT/ibXAJAvmqzGmZnBDkz8wD0BQd+0mJE
   E5HausGmfWyW6M3pnygWGIE20aPm73ut3AB8YshvI5I2+IjjP2Spb4NAA
   +8W0g+0ygjUI4F1ZILwWQsDT+7puH0Lum5/K8Hl4oCzV/AMeuWoGigCEu
   orJwN2XMtSwHRhbMp8VziRA0Dv5UH6VCG5oKrARgweaUsybvoLI1/erDL
   CJ9a1l7OC0OdEgXL1zuijNd0uVliDjAllqKQq+PuEnA2aM8STUJF1iq28
   Q==;
X-CSE-ConnectionGUID: /oQ3fSqZQzuwBo5rCjAiaw==
X-CSE-MsgGUID: ZbRpuYPzT8SHr+xKCuPduw==
X-IronPort-AV: E=McAfee;i="6700,10204,11219"; a="38355298"
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="38355298"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 04:36:50 -0700
X-CSE-ConnectionGUID: 85l4FDclTxuqyR1TtDNy1A==
X-CSE-MsgGUID: sheAOCKmTj+vkV3Ek9JVEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,189,1725346800"; 
   d="scan'208";a="80729982"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 09 Oct 2024 04:36:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syUzn-00099w-0u;
	Wed, 09 Oct 2024 11:36:47 +0000
Date: Wed, 9 Oct 2024 19:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linyunsheng:net-pp-inflight-fix_v3 3/3]
 arch/riscv/include/asm/atomic.h:138:1: sparse: sparse: constant integer
 operation overflow
Message-ID: <202410091907.z1sjq363-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: arch/riscv/include/asm/atomic.h:138:1: sparse: sparse: constant integer operation overflow"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Yunsheng Lin <linyunsheng@huawei.com>

tree:   https://github.com/gestionlin/linux.git net-pp-inflight-fix_v3
head:   bd72d37cdf0449e8175e573706b55a1b5186287a
commit: bd72d37cdf0449e8175e573706b55a1b5186287a [3/3] page_pool: fix IOMMU crash when driver has already unbound
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: riscv-randconfig-r131-20241009 (https://download.01.org/0day-ci/archive/20241009/202410091907.z1sjq363-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241009/202410091907.z1sjq363-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202410091907.z1sjq363-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/core/page_pool.c: note: in included file (through include/linux/atomic.h, include/linux/cpumask.h, arch/riscv/include/asm/processor.h, ...):
>> arch/riscv/include/asm/atomic.h:138:1: sparse: sparse: constant integer operation overflow
>> arch/riscv/include/asm/atomic.h:138:1: sparse: sparse: constant integer operation overflow

vim +138 arch/riscv/include/asm/atomic.h

fab957c11efe2f Palmer Dabbelt 2017-07-10  136  
5ce6c1f3535fa8 Andrea Parri   2018-03-09  137  ATOMIC_OPS(add, add, +,  i)
5ce6c1f3535fa8 Andrea Parri   2018-03-09 @138  ATOMIC_OPS(sub, add, +, -i)
fab957c11efe2f Palmer Dabbelt 2017-07-10  139  

:::::: The code at line 138 was first introduced by commit
:::::: 5ce6c1f3535fa8d2134468547377b7b737042834 riscv/atomic: Strengthen implementations with fences

:::::: TO: Andrea Parri <parri.andrea@gmail.com>
:::::: CC: Palmer Dabbelt <palmer@sifive.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
