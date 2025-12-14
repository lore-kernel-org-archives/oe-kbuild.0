Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 530D31EB5FD
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 05:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765689940; cv=none; b=L590+wKDdfuuRC3dgZj3mWDBWYN0MqvoktR3OLPfcQA2hUtdrLQQpr40W/m/nRncRqMQ4/5hD5eOQ7OpqWjgYMYMzBqmkKutYivRaSZyUOnPdszM7bFrFpXzf0iUCUkpoju/1t4M4KYu49wtaTP03LeWRdENRtXQyxM28b42CLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765689940; c=relaxed/simple;
	bh=4hE3tFV7Qe9KcEMiwqCWPe6OCYYUTBcOx+Px2K5tEcU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o9Qf1o7CNI863SFygLPkZfF+K8lCOVSzsqveBAH8wR9XAcmQrVJzEO0eVO615kG8lZVBC5dMUBIo7UmHkAPhB8t4N+LeLZMpXveO4ndPEffZJEkiQZy5olgoSRv0uKyx1Hji0bZ3obE+zSMvJrB/lJ+WULK/4bGTRrd42VYd6g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S0N1Hw/5; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S0N1Hw/5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765689938; x=1797225938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4hE3tFV7Qe9KcEMiwqCWPe6OCYYUTBcOx+Px2K5tEcU=;
  b=S0N1Hw/5zWXuyEseo+HRq8yt77WB+QUDeobEFENmutLOsSyW1gVNV0d4
   dGNvBtaEGAvwMrez7KJ7FRdT69ogAojoOcLC5eVeq55cTfMkM1EtLcfwZ
   ssifUo9QumkTOuTYlWgZxFafuaXOsceEZ/4fwigoI1eTQAUJgfaiTZtki
   /gzuI32uorxsgvN0hWwos+6nhFg8S0OLfGjPbWoDbSM0lJOWewgiSn9Pi
   roeLdkz180Kl6yDlQHRfEtqCG86rYx7eqUK6syqI7FhE9tPw/fAZoln+3
   weBtJuSK/7DaXT5bdAKpaDlc5/FI2K2ZHzMBbIQ7SZfCpPNsIazezKmo2
   A==;
X-CSE-ConnectionGUID: l0x9Gk6MSw6g5z66KAginQ==
X-CSE-MsgGUID: pFjpTucqTqe/ZirBVrgAjw==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="71482530"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="71482530"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 21:25:37 -0800
X-CSE-ConnectionGUID: 6YJo3GJ5T2WqrqE8CgXwIw==
X-CSE-MsgGUID: 5OZUzWtNRi2augeE6q79qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="201864472"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 13 Dec 2025 21:25:36 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUebu-000000008cX-0ok1;
	Sun, 14 Dec 2025 05:25:34 +0000
Date: Sun, 14 Dec 2025 13:24:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/mm/drmem.c:438 init_drmem_v1_lmbs() warn: potentially
 one past the end of array 'drmem_info->lmbs[drmem_info->n_lmbs]'
Message-ID: <202512141356.RtdhXGff-lkp@intel.com>
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
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0dfb36b2dcb666f116ba314e631bd3bc632c44d1
commit: 07438779313caafe52ac1a1a6958d735a5938988 alloc_tag: avoid current->alloc_tag manipulations when profiling is disabled
date:   11 months ago
:::::: branch date: 2 hours ago
:::::: commit date: 11 months ago
config: powerpc64-randconfig-r073-20251213 (https://download.01.org/0day-ci/archive/20251214/202512141356.RtdhXGff-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512141356.RtdhXGff-lkp@intel.com/

smatch warnings:
arch/powerpc/mm/drmem.c:438 init_drmem_v1_lmbs() warn: potentially one past the end of array 'drmem_info->lmbs[drmem_info->n_lmbs]'
arch/powerpc/mm/drmem.c:438 init_drmem_v1_lmbs() warn: potentially one past the end of array 'drmem_info->lmbs[drmem_info->n_lmbs]'

vim +438 arch/powerpc/mm/drmem.c

514a9cb3316a08 Nathan Fontenot 2017-12-01  424  
514a9cb3316a08 Nathan Fontenot 2017-12-01  425  static void __init init_drmem_v1_lmbs(const __be32 *prop)
514a9cb3316a08 Nathan Fontenot 2017-12-01  426  {
514a9cb3316a08 Nathan Fontenot 2017-12-01  427  	struct drmem_lmb *lmb;
514a9cb3316a08 Nathan Fontenot 2017-12-01  428  
514a9cb3316a08 Nathan Fontenot 2017-12-01  429  	drmem_info->n_lmbs = of_read_number(prop++, 1);
2c10636a0b9c68 Nathan Fontenot 2018-02-15  430  	if (drmem_info->n_lmbs == 0)
2c10636a0b9c68 Nathan Fontenot 2018-02-15  431  		return;
514a9cb3316a08 Nathan Fontenot 2017-12-01  432  
514a9cb3316a08 Nathan Fontenot 2017-12-01  433  	drmem_info->lmbs = kcalloc(drmem_info->n_lmbs, sizeof(*lmb),
514a9cb3316a08 Nathan Fontenot 2017-12-01  434  				   GFP_KERNEL);
514a9cb3316a08 Nathan Fontenot 2017-12-01  435  	if (!drmem_info->lmbs)
514a9cb3316a08 Nathan Fontenot 2017-12-01  436  		return;
514a9cb3316a08 Nathan Fontenot 2017-12-01  437  
e5e179aa3a39c8 Scott Cheloha   2020-08-10 @438  	for_each_drmem_lmb(lmb)
514a9cb3316a08 Nathan Fontenot 2017-12-01  439  		read_drconf_v1_cell(lmb, &prop);
514a9cb3316a08 Nathan Fontenot 2017-12-01  440  }
514a9cb3316a08 Nathan Fontenot 2017-12-01  441  

:::::: The code at line 438 was first introduced by commit
:::::: e5e179aa3a39c818db8fbc2dce8d2cd24adaf657 pseries/drmem: don't cache node id in drmem_lmb struct

:::::: TO: Scott Cheloha <cheloha@linux.ibm.com>
:::::: CC: Michael Ellerman <mpe@ellerman.id.au>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
