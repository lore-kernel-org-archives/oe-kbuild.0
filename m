Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0D61DD873
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Oct 2024 16:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728320225; cv=none; b=YPnD4pgLiLprKsW4ea3RL3oW1E58zGWvPnQs3ACCyf7fIcgNqT0eobKs8UraT4bx09BCgLz9Ugy0zvBFVqXrk2yKeITizp/JZjJsa9Stz0KEzuAtiTBbKMwT6IHtmVaN0+Q4kyjc8D5fGmC6sKYwJELTL8rJvVJnilD4zZcALkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728320225; c=relaxed/simple;
	bh=NLdsuGDBhkydWvmxNSRVgh9gXTR+0+bIvFgST0CDLqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=auZo28jZTSyu1sG3JzmHy2h3BC5GFz9RhEFQf+wCJcWDtDxVya6bRtGoTljcPIzbFwImGK3QHHSYe6qnWFsJwHkM08WOssstnZvpjC2Knw6KMHfIU2ObPkABKXIiCgjHajksi+O5S0l/2qKMKci3FvIxu/JUSYcL1WooM+S+Lfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UmWRfRnv; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UmWRfRnv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728320224; x=1759856224;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NLdsuGDBhkydWvmxNSRVgh9gXTR+0+bIvFgST0CDLqI=;
  b=UmWRfRnvvTjfDbNBpOBarK7wcCytPGbhHVTjpfaMjRDsKOpJLCVpSujd
   MadPR9BCHfNntz7RCRLk2PFvGX5dnmDCrtInkUnAPZCD58ybNdIeO8kK6
   8b+NQCB2uNFzuGIi+pnR+0QL3gHYExAu1nvEplVH+J7As30TE17DV9Gwc
   AYJIjvdnmVtAwjwCGbKDwD6LlvUrKtnYaD/TobVak71SpD9E9xXV2MbxC
   ub3lxNEeUV1WbiybuTal0LIMQNrKzFxYUcNQ07Vm3k/fvGnv+S21q4BAL
   RSuiSK0Fn2caSXOgcAy2NcURbbIO2ruzFsnYrO4WMymxRep/drFfAQxkw
   Q==;
X-CSE-ConnectionGUID: C7ttqF5TTiOeYCj/hDS12Q==
X-CSE-MsgGUID: ukXetIt4QfOzOeK36QiYbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="27292574"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="27292574"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2024 09:57:04 -0700
X-CSE-ConnectionGUID: xqd7HIpjRTOFviOadjZajA==
X-CSE-MsgGUID: exqMzV01SYep7n/MZOV7ZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; 
   d="scan'208";a="79954386"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 07 Oct 2024 09:57:01 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sxr2a-0005I0-0r;
	Mon, 07 Oct 2024 16:57:00 +0000
Date: Tue, 8 Oct 2024 00:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/net/dsa/mv88e6xxx/chip.c:5459:17-19: WARNING opportunity for
 min()
Message-ID: <202410080023.0f2EB9wW-lkp@intel.com>
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
TO: Tobias Waldekranz <tobias@waldekranz.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Vladimir Oltean <olteanv@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8cf0b93919e13d1e8d4466eb4080a4c4d9d66d7b
commit: 57e661aae6a823140787dbcc34d92e223e2f71c5 net: dsa: mv88e6xxx: Link aggregation support
date:   3 years, 9 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 years, 9 months ago
config: openrisc-randconfig-r052-20241007 (https://download.01.org/0day-ci/archive/20241008/202410080023.0f2EB9wW-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410080023.0f2EB9wW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/dsa/mv88e6xxx/chip.c:5459:17-19: WARNING opportunity for min()

vim +5459 drivers/net/dsa/mv88e6xxx/chip.c

57e661aae6a823 Tobias Waldekranz 2021-01-13  5452  
57e661aae6a823 Tobias Waldekranz 2021-01-13  5453  static void mv88e6xxx_lag_set_port_mask(u16 *mask, int port,
57e661aae6a823 Tobias Waldekranz 2021-01-13  5454  					int num_tx, int nth)
57e661aae6a823 Tobias Waldekranz 2021-01-13  5455  {
57e661aae6a823 Tobias Waldekranz 2021-01-13  5456  	u8 active = 0;
57e661aae6a823 Tobias Waldekranz 2021-01-13  5457  	int i;
57e661aae6a823 Tobias Waldekranz 2021-01-13  5458  
57e661aae6a823 Tobias Waldekranz 2021-01-13 @5459  	num_tx = num_tx <= 8 ? num_tx : 8;
57e661aae6a823 Tobias Waldekranz 2021-01-13  5460  	if (nth < num_tx)
57e661aae6a823 Tobias Waldekranz 2021-01-13  5461  		active = mv88e6xxx_lag_mask_table[num_tx - 1][nth];
57e661aae6a823 Tobias Waldekranz 2021-01-13  5462  
57e661aae6a823 Tobias Waldekranz 2021-01-13  5463  	for (i = 0; i < 8; i++) {
57e661aae6a823 Tobias Waldekranz 2021-01-13  5464  		if (BIT(i) & active)
57e661aae6a823 Tobias Waldekranz 2021-01-13  5465  			mask[i] |= BIT(port);
57e661aae6a823 Tobias Waldekranz 2021-01-13  5466  	}
57e661aae6a823 Tobias Waldekranz 2021-01-13  5467  }
57e661aae6a823 Tobias Waldekranz 2021-01-13  5468  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
