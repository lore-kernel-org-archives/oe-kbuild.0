Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921C02576
	for <oe-kbuild@lists.linux.dev>; Mon, 12 May 2025 04:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747023454; cv=none; b=NbWolBJ/Rj64GBn1VwdtqfpUiATYWXwVK9W3NMCH82sIP2dUysqCkaIX9YvUamTaPciHZHDy/b/VFTpb+0PX9vSv/txKktxUYfuZW+tlcek+71xJGwfuMnNMOhkjxN81+sYw/gIOVDmjrd61viEWo1HAqzVea4yvpWN68z/35IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747023454; c=relaxed/simple;
	bh=vwxY58y3zDY33MJUhS1euNDghFI29AzvmfwyE0uzs5w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jEJYzpLTWpcNMQ94CJVmaDoO3MtEVSePFjr/WoNvza3PUkxmgY7Lx/cbX949IPsJ0dMpmvct/g2xSg07C7BrsE8qME+IDeY4BTCRs0TvIWf5T/rNqJbComwLmTqYmFrieAr17RqJ3F5w+dL/V2VuLuDBgxg3sOezwcGy/jM1U74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMwS7f6d; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMwS7f6d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747023453; x=1778559453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vwxY58y3zDY33MJUhS1euNDghFI29AzvmfwyE0uzs5w=;
  b=fMwS7f6dWVvmADEdqmTk4qzkT14FFSAKo1hm33f5IsRBpwuAYImddlHe
   r4dDeGOsSHhFgwoirWhQ78epjEelO4O/FV+WGt3qj0oep0XuwpLHVEbDG
   TqqNazXPsXpsCIrFcjwNN57veTiBVSOzutyYGPTzwkyXDSA0zOhrX6qxQ
   FNzJLOUUkHYWm6uzSDKBikYzK9JD4R6jPxxI/VNmLpFdSFLfPPS7niIqP
   TnXGTasCGIvkg/lVUJueNfzZFPGZzOQTow7RybSRt4lQ/SsHq2uBgb6mP
   hZFvrOV/JNUNKQkRBqtLDcJznQufYfBQ1pFm2WwXOO5q8VjsxQHwP0x33
   w==;
X-CSE-ConnectionGUID: sdfUf8oHStifLgNyOvqWBQ==
X-CSE-MsgGUID: IFknbZ75TGex3QNIapuStQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="66209174"
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="66209174"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 21:17:31 -0700
X-CSE-ConnectionGUID: DquAi+TlSyam3KIY6R1/zA==
X-CSE-MsgGUID: 1TAY2aIZQeKBHTMvy4phrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,281,1739865600"; 
   d="scan'208";a="138219001"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 11 May 2025 21:17:30 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEKbY-000EAN-0D;
	Mon, 12 May 2025 04:17:28 +0000
Date: Mon, 12 May 2025 12:17:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [brauner-vfs:vfs-6.16.misc 20/21] fs/mpage.o: warning: objtool:
 mpage_write_folio+0x3cc: unreachable instruction
Message-ID: <202505121238.YbNZv7Uq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Christian Brauner <christianvanbrauner@gmail.com>
TO: Christoph Hellwig <hch@lst.de>
CC: Christian Brauner <brauner@kernel.org>
CC: Jan Kara <jack@suse.cz>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs-6.16.misc
head:   e68ecc161fece5259aacacbe3ff597cc5b80a3e9
commit: bb01e8cc10f0c5b1151a5f047289fcfa5519e351 [20/21] fs: use writeback_iter directly in mpage_writepages
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250512/202505121238.YbNZv7Uq-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250512/202505121238.YbNZv7Uq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505121238.YbNZv7Uq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/pgtable.h:6,
                    from include/linux/mm.h:30,
                    from fs/mpage.c:18:
   include/linux/swapops.h: In function 'swp_entry_to_pmd':
   arch/loongarch/include/asm/pgtable.h:303:34: warning: missing braces around initializer [-Wmissing-braces]
     303 | #define __swp_entry_to_pmd(x)   ((pmd_t) { (x).val | _PAGE_HUGE })
         |                                  ^
   include/linux/swapops.h:559:16: note: in expansion of macro '__swp_entry_to_pmd'
     559 |         return __swp_entry_to_pmd(arch_entry);
         |                ^~~~~~~~~~~~~~~~~~
>> fs/mpage.o: warning: objtool: mpage_write_folio+0x3cc: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
