Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D19B31A23B7
	for <oe-kbuild@lists.linux.dev>; Tue, 13 May 2025 18:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747159849; cv=none; b=TMEv7NQUcike/v0gtdCAll11KOD+Yca8OnHjoKEfq4esGFtSoVQ/7jfdmINkjQjmfOPhLmZ7BI87WbjrLS9J75buEQyhWDXYoEL3iE5Qt3XDaJX6WDzEQCi41DdeJwZrLH/0VpcqeUak1OqoFgfp9Q1yZ3l9JTxnJbifg2S1Nfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747159849; c=relaxed/simple;
	bh=plrhr2kLquKGVjos9Xv2o9RgwrL5/lzg6lLTrFTvv7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jl+5NU0XPCpg5BxTjJwGkysi++U06FIZgl736AyPJP/ksWWVRM1aonl2z+bjw7hCdh6K/YaOwaSjxhy/cd/g5IdG9XFR5F8wpwDtzTzT1UGfdBGEZlma8bNF8AvllzmOWCp1UZVIIKdVyp35U4O28RBxhQQwpXnMnMAU+vVBNaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kscZMHG8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kscZMHG8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747159848; x=1778695848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=plrhr2kLquKGVjos9Xv2o9RgwrL5/lzg6lLTrFTvv7Y=;
  b=kscZMHG8+KM/8Sn0redH4QVVzv0zFYqvX5HVZ566F+IB8q+6cUXwU2Tc
   zxlWN6bCn5wX0svfl4aCfj0FTNcQRLDvMdkwe2ecuAqgDHQlh4C+HeDno
   5vRa2o0hKIuJBKJ5E600cLR49oVpdi1j4jMCFARRLesn621VIfy4SpNz2
   zWlrL4yOwG6iUvGM8SzKjB+K7LsuG6mrCRUZAo0dOP3Fexey27stNUqHt
   0/bG3/5Azv9xT+PPTjLfO3MIIUvXO+hnedqVzaAe9pWsMDpvaF4Z6dnIC
   4v+L8lhqVovEf3kLSncQCP0dhznchBFogpKtdLXK/zgJuFSDLcFw89Ddd
   Q==;
X-CSE-ConnectionGUID: 71Ypx2RXSCGtvan4PRKq4Q==
X-CSE-MsgGUID: 9Szl7TdUTRawO9RR5GeQZw==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="59254447"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="59254447"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 11:10:47 -0700
X-CSE-ConnectionGUID: BFJDU5WNQJuIYbRIJYNtKA==
X-CSE-MsgGUID: 9o+Bbz0hTyO3eJSXYmzu2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="168719599"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 13 May 2025 11:10:47 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEu5T-000GIj-2H;
	Tue, 13 May 2025 18:10:43 +0000
Date: Wed, 14 May 2025 02:10:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/volumes.o: warning: objtool: btrfs_read_sys_array+0x178:
 unreachable instruction
Message-ID: <202505140237.Ld0jOn5s-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e9565e23cd89d4d5cd4388f8742130be1d6f182d
commit: 2a9bb78cfd367fdeff74f15b1e98969912292d9e btrfs: validate system chunk array at btrfs_validate_super()
date:   4 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250514/202505140237.Ld0jOn5s-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505140237.Ld0jOn5s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505140237.Ld0jOn5s-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/volumes.o: warning: objtool: decide_stripe_size+0x160: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: handle_ops_on_dev_replace+0x24c: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: dev_extent_hole_check+0x24c: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: find_free_dev_extent+0x39c: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: init_alloc_chunk_ctl+0x1c0: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: btrfs_create_chunk+0x174: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: btrfs_balance+0x468: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: btrfs_map_block+0x1e0: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: read_one_dev+0x4f0: unreachable instruction
>> fs/btrfs/volumes.o: warning: objtool: btrfs_read_sys_array+0x178: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: btrfs_rm_device+0x82c: unreachable instruction
   fs/btrfs/volumes.o: warning: objtool: btrfs_map_repair_block+0xec: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
