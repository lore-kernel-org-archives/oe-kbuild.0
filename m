Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42A317FE
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jan 2025 22:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735942283; cv=none; b=ZFdMZB409ctWgHHczY7PsxM//eB0UjyShBxl3OLu9O7TBjaugfAiygPSKbYJXyg+UxL8u95k8QfcJro5BRYD0f3S09/njDJDVcdfXnySvBZfZj+6fE0Lde4/sqkz1PvfQHrh1W4xQdCvV2x5Fm/EvVo5ZvVKghvZaMBDIH29uXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735942283; c=relaxed/simple;
	bh=dsn+A7x43mm7QQh52a6quII6HFpoii5cluTnuNHopuo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WqYmp5To18tLOyQAFGQLC5n2ypLowHy2tcCHxLTskfZyqKv+eokIDqo/teiIn5MRcgptLhUlNVSDEZABuToYjQP2Wask3vO0oJvs7BDRp20Vj0aVMBBf0gMRcMxYagRFGni0IEGAHvzKXx46bZeQfUm/kSZwWD0m8AJVrQJH/Bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JG6e6i8V; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JG6e6i8V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735942282; x=1767478282;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dsn+A7x43mm7QQh52a6quII6HFpoii5cluTnuNHopuo=;
  b=JG6e6i8VLZRYENakgYQHfMN8K4vYkVgk1c3G3vufnboNZAQeywJ2euML
   UyDV9J3bbYf7F/5H+FCpG9bzO7O2t28PCGcGkuX985Lfn44PIP9S9wc8o
   gcyf7uRqxyUWcT8b4AVeGFjedEMKHbkKEZ4/Fj4KHVtKmUPbCUBVqDekv
   Mt5B9xxYjCByhDk+FWj1FhWFr9A1tiJYY4xBvCxh3rGMJhMcP32VmoKLb
   D8t9Y207NaCaLGNQvaKjGtQHvobRbFNZoNNmiyMAVrNiiq2PXuf4R1ZKC
   91Z+92b6rQKKdmohR7U6bOMoUIF0tBR39cv2SjWvNsiFSvBRx36Sa1qoF
   g==;
X-CSE-ConnectionGUID: nJVqm8TQR5KdVqaMN3DF1Q==
X-CSE-MsgGUID: IPB53blMTWyUQimzursTKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11304"; a="53605323"
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="53605323"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jan 2025 14:11:21 -0800
X-CSE-ConnectionGUID: sTtim/wZRSKjInX1mZcGiQ==
X-CSE-MsgGUID: jdrBp9DQQxKcFX906oUDgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,287,1728975600"; 
   d="scan'208";a="102409263"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 03 Jan 2025 14:11:19 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tTpsz-000ALl-2n;
	Fri, 03 Jan 2025 22:11:17 +0000
Date: Sat, 4 Jan 2025 06:11:05 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/proc/inode.c:548:3-9: preceding lock on line 544
Message-ID: <202501040635.fW7PRJRt-lkp@intel.com>
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
TO: Alexey Dobriyan <adobriyan@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0bc21e701a6ffacfdde7f04f87d664d82e8a13bf
commit: 13309764720624caf2c5afba99b198f3f9fcd9f0 proc: use __auto_type more
date:   4 months ago
:::::: branch date: 27 hours ago
:::::: commit date: 4 months ago
config: hexagon-randconfig-r054-20250102 (https://download.01.org/0day-ci/archive/20250104/202501040635.fW7PRJRt-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project ed572f2003275da8e06a634b4d6658b7921e8334)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501040635.fW7PRJRt-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/proc/inode.c:548:3-9: preceding lock on line 544

vim +548 fs/proc/inode.c

786d7e1612f0b0 Alexey Dobriyan 2007-07-15  530  
786d7e1612f0b0 Alexey Dobriyan 2007-07-15  531  static int proc_reg_release(struct inode *inode, struct file *file)
786d7e1612f0b0 Alexey Dobriyan 2007-07-15  532  {
786d7e1612f0b0 Alexey Dobriyan 2007-07-15  533  	struct proc_dir_entry *pde = PDE(inode);
881adb85358309 Alexey Dobriyan 2008-07-25  534  	struct pde_opener *pdeo;
d919b33dafb3e2 Alexey Dobriyan 2020-04-06  535  
d919b33dafb3e2 Alexey Dobriyan 2020-04-06  536  	if (pde_is_permanent(pde)) {
13309764720624 Alexey Dobriyan 2024-09-08  537  		__auto_type release = pde->proc_ops->proc_release;
d919b33dafb3e2 Alexey Dobriyan 2020-04-06  538  		if (release) {
d919b33dafb3e2 Alexey Dobriyan 2020-04-06  539  			return release(inode, file);
d919b33dafb3e2 Alexey Dobriyan 2020-04-06  540  		}
d919b33dafb3e2 Alexey Dobriyan 2020-04-06  541  		return 0;
d919b33dafb3e2 Alexey Dobriyan 2020-04-06  542  	}
d919b33dafb3e2 Alexey Dobriyan 2020-04-06  543  
786d7e1612f0b0 Alexey Dobriyan 2007-07-15 @544  	spin_lock(&pde->pde_unload_lock);
ca469f35a8e9ef Al Viro         2013-04-03  545  	list_for_each_entry(pdeo, &pde->pde_openers, lh) {
ca469f35a8e9ef Al Viro         2013-04-03  546  		if (pdeo->file == file) {
ca469f35a8e9ef Al Viro         2013-04-03  547  			close_pdeo(pde, pdeo);
2f8974243507d9 Alexey Dobriyan 2018-04-10 @548  			return 0;
786d7e1612f0b0 Alexey Dobriyan 2007-07-15  549  		}
881adb85358309 Alexey Dobriyan 2008-07-25  550  	}
786d7e1612f0b0 Alexey Dobriyan 2007-07-15  551  	spin_unlock(&pde->pde_unload_lock);
ca469f35a8e9ef Al Viro         2013-04-03  552  	return 0;
786d7e1612f0b0 Alexey Dobriyan 2007-07-15  553  }
786d7e1612f0b0 Alexey Dobriyan 2007-07-15  554  

:::::: The code at line 548 was first introduced by commit
:::::: 2f8974243507d9e5b0f214d7668a59a66b93f36c proc: do less stuff under ->pde_unload_lock

:::::: TO: Alexey Dobriyan <adobriyan@gmail.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
