Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01244166315
	for <oe-kbuild@lists.linux.dev>; Tue,  6 Aug 2024 23:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722986269; cv=none; b=U1HkOrsOedeo9FFwftNhhRMEEd+TM+JmsT3QaEHKAQpHj9UpE3VYWRsvSO3DN9H6xL0Ex7yoPyCHiSIyDjqlXtXrB4l3J5I9iJTLNm6xDUq7IFTVTmwDVxtY+ygwWRaXyliZiCvZON+nk2Ng3mhfevzXzce38SoSOYWYvZF23ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722986269; c=relaxed/simple;
	bh=4ncLXziQS6fXhljeIltYLF1N/jnZYXX6Gz9MQ2GMpAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XnaG87sCeWltzVCcWlfYDpnu4RsZ8YOgWGe8Gr4J+JiuUaH/w5X9fQbySfjEGinwEkni8KRZMk3eKAa0J1wRsVZkTFYR7Pyggt5LlbwxiopOshiymbrMSnWLlolHqfSEgkpkZPSlddhxJFNd4Y7G6aLnlytC6zXxkTW+nPhXIec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kf6L7NSO; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kf6L7NSO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722986267; x=1754522267;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4ncLXziQS6fXhljeIltYLF1N/jnZYXX6Gz9MQ2GMpAs=;
  b=Kf6L7NSOGMOLypscOvyQxN68CGf9eQoTu1z8CqO+jMNkFQe6itJ7ivEC
   /anhJnEiiNntrGLGonjsAWErga+TrJMSx6+Dls6TedSDnFMjWCayjGd0u
   FD+hGCLoVpC4/aqkqNC8UMYAWXohUzjTRtQk5zbMcCqj09c96Dpeh+PKo
   EA/1wTTCIlQABjlh1FK82M7Jqncl5KfkDT6ApDP+H2mgdqqmApWcyorV6
   rTyXvu1BUlt7ruJFKwkiSYMbO8rC6nNZoj6Nfg29cyvIcjQygwj3Gftys
   gJih3FsyQ2Uwhe1zBU9AWP1nvTDzajFF73n8UUpG9ltNRbEC0TJi6J7nn
   g==;
X-CSE-ConnectionGUID: 3hZB6sXETGeqCH5G4ZmaKQ==
X-CSE-MsgGUID: sK0QVSD8ShOBHaTvZXS8Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21182016"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="21182016"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 16:17:46 -0700
X-CSE-ConnectionGUID: gpWFjpSlQJiUhTww+2jJEw==
X-CSE-MsgGUID: kb1ELar2T8Ol7D+F9WnIsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="57213404"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 06 Aug 2024 16:17:46 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbTR0-0004uK-38;
	Tue, 06 Aug 2024 23:17:42 +0000
Date: Wed, 7 Aug 2024 07:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/zoned.o: warning: objtool:
 btrfs_finish_ordered_zoned+0x198: unreachable instruction
Message-ID: <202408070744.v1fZufgH-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>
CC: Filipe Manana <fdmanana@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d4560686726f7a357922f300fc81f5964be8df04
commit: c77a8c61002e91d859e118008fd495efbe1d9373 btrfs: remove extent_map::block_start member
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: loongarch-randconfig-001-20240807 (https://download.01.org/0day-ci/archive/20240807/202408070744.v1fZufgH-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070744.v1fZufgH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202408070744.v1fZufgH-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/zoned.o: warning: objtool: sb_zone_number+0xb0: unreachable instruction
   fs/btrfs/zoned.o: warning: objtool: btrfs_get_dev_zone_info+0x29c: unreachable instruction
   fs/btrfs/zoned.o: warning: objtool: btrfs_find_allocatable_zones+0xdc: unreachable instruction
   fs/btrfs/zoned.o: warning: objtool: btrfs_ensure_empty_zones+0xd4: unreachable instruction
>> fs/btrfs/zoned.o: warning: objtool: btrfs_finish_ordered_zoned+0x198: unreachable instruction


objdump-func vmlinux.o btrfs_finish_ordered_zoned:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
