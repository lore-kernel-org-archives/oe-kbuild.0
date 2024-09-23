Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2652810E9
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Sep 2024 01:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727055533; cv=none; b=jO1jQ6N42tVuaB5Z8201JI42Zh5jR4Gp2a6WjQI4M68c9RbbeX1Vg//iRzV1D13DdI9hpTzg97eKBEtZrxkyXWBiPKrr9FNYmjw3PlHiDbHVJMaIOx+OGEQ+rgPrZWQQqHiFjqJw0YtHkMW1k2YmEcFBUHUvxMfHXfSHSk+Tff0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727055533; c=relaxed/simple;
	bh=QhpvWD5gGSUUCAU9IkCVH0AXiwXc/Px+f+rMjA3cbpA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FmN5Zv4hmGNu0UAVq2LGP5iZxoyTvwTdh2Z7Gu7N6OioDN7UYUl8SOLqjdOOy1KC0JbhZF6TzJOo7dL9liS1pJY9fmkizfTuuVKGQIipQnJ+5UNihJEeVuOJ/xnZJjDxA3/Qj9Kp1qyJVFfw0syT6M9q518qCxqUxpKXDKDN4e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EbU+3NNq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EbU+3NNq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727055531; x=1758591531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QhpvWD5gGSUUCAU9IkCVH0AXiwXc/Px+f+rMjA3cbpA=;
  b=EbU+3NNqnyNFiasiagNEmlHXhZNGNa1DbZOF1W9Qb674+8Au7Yh2uJwW
   fyw2yYC8tUQUFdrCEs1A7Ohh1ojrBl0AHhq+yaMhy40/9y/aSLaf1m1dT
   MKnzzy/U7kaHdUdYxikeIOpS9NABwei5M0MesV0zOzTrmFK1FQpA5hbq8
   nur9oVsU72/NnWUAWl8fZIS1Eh0z4HLOFf4QaC46F1OjzW38t6qIzkHQL
   ga3b7Q76xa8Rn0DAnCNpf8hw201o+D7U1luRqgYbV+WvLwwXYwq8hUQca
   M7vBauA0b57+A9dJ8dEuu9qiiyYlRNqKoTGpC9fU/mD9xFdzFgVNR8k6B
   Q==;
X-CSE-ConnectionGUID: k3wWzbdkRgyHsHGHzthGzg==
X-CSE-MsgGUID: FGBhzCK/RqCZjXeN/YlSXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="25812192"
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="25812192"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2024 18:38:50 -0700
X-CSE-ConnectionGUID: BoVFLncDTVCRPxDKjNx6eQ==
X-CSE-MsgGUID: rAtoRCBNTBipA1WA1x3/8A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,250,1719903600"; 
   d="scan'208";a="75464022"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 22 Sep 2024 18:38:49 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssY2J-000GoV-0E;
	Mon, 23 Sep 2024 01:38:47 +0000
Date: Mon, 23 Sep 2024 09:37:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: arch/powerpc/kexec/vmcore_info.c:14 arch_crash_save_vmcoreinfo()
 warn: argument 3 to %lx specifier is cast from pointer
Message-ID: <202409230921.MkcPHFju-lkp@intel.com>
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
TO: Baoquan He <bhe@redhat.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   de5cb0dcb74c294ec527eddfe5094acfdb21ff21
commit: 199da8714c8f4c45f46509c5eb188f5551404574 arch, crash: move arch_crash_save_vmcoreinfo() out to file vmcore_info.c
date:   7 months ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 months ago
config: powerpc64-randconfig-r072-20240923 (https://download.01.org/0day-ci/archive/20240923/202409230921.MkcPHFju-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409230921.MkcPHFju-lkp@intel.com/

New smatch warnings:
arch/powerpc/kexec/vmcore_info.c:14 arch_crash_save_vmcoreinfo() warn: argument 3 to %lx specifier is cast from pointer

Old smatch warnings:
arch/powerpc/kexec/vmcore_info.c:27 arch_crash_save_vmcoreinfo() warn: argument 3 to %lx specifier is cast from pointer

vim +14 arch/powerpc/kexec/vmcore_info.c

199da8714c8f4c Baoquan He 2024-01-29   8  
199da8714c8f4c Baoquan He 2024-01-29   9  #ifdef CONFIG_NUMA
199da8714c8f4c Baoquan He 2024-01-29  10  	VMCOREINFO_SYMBOL(node_data);
199da8714c8f4c Baoquan He 2024-01-29  11  	VMCOREINFO_LENGTH(node_data, MAX_NUMNODES);
199da8714c8f4c Baoquan He 2024-01-29  12  #endif
199da8714c8f4c Baoquan He 2024-01-29  13  #ifndef CONFIG_NUMA
199da8714c8f4c Baoquan He 2024-01-29 @14  	VMCOREINFO_SYMBOL(contig_page_data);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
