Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8EF85947
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jul 2024 15:31:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722353508; cv=none; b=tX99i4k36KdyUlVDM5vpn74F9vQGwH9BdTLbKqkHoL4irVXTj1QzV2p69+zV7NRlZltdcCLpfr7QbrViIbtdrDot7/7SgRBKoH1zxpWu3345oq1x2UsmsyHc2AowIoR9Wxylx1a6kBd0CIJVrOzn3avevCBS+PRcaklVyH/SJS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722353508; c=relaxed/simple;
	bh=8YTU3+oKknsBmi22OUP3VMi9vExv20s/9YRDGAKAuhE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DrwYMOVvqFuPZIW0N7BAFN0IEkWM2eMOLvb3glNP15/xJ+W6OGWmaempqjYdRt58WekhX3J/iMvkQhkcNAlYDtGOljq5bQD0w8dy+/kRCXbhhhzD4lQqbW4vkuTIRVb4qc/4Soe8vmFiPMlCa4VqUD+JNfxVzBDMTH2dYSIjWtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mcQsExmv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mcQsExmv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722353507; x=1753889507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8YTU3+oKknsBmi22OUP3VMi9vExv20s/9YRDGAKAuhE=;
  b=mcQsExmvv2xzMeKaQunaJ2ZNh914Vkac2olvGUbi/AszR+LutiQj6cou
   RaY/jjK522duqps2LyJE8yBFsJ6aj22xHD4koeiRfvA2ZKf6lVhVjUJC4
   s1pvOhnPcXN/eBnZv4Ix7lwAa0sPwD7UKQ8DgBOEIY9+sngCGpY6fytTb
   F7sj7FWF38Iu41G+HUZHApWvLwLMc87HdCW+ibcOVVt4P9enisbuQ6nVb
   6fowQli605YQ7WujBaC/9/5NzuoIvAw19WLBHVChzudUiS8oh2SZrwRiT
   Us3kiYU0VRBsUNiC+Ra7nM2aMU9H//Z5w+T+hzYQzfF+E4RyKM6HqDWw+
   w==;
X-CSE-ConnectionGUID: AYSRRgqUQHuKxVX/50PS5A==
X-CSE-MsgGUID: 5eWKWd52REysy3A8ODG/oQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="42705730"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="42705730"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 08:31:46 -0700
X-CSE-ConnectionGUID: wbu9hoSJTjyqHv3KSgbS5Q==
X-CSE-MsgGUID: VbeL/mSHTRmwWlN5i+ayJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54370319"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 30 Jul 2024 08:31:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYopC-000t14-0J;
	Tue, 30 Jul 2024 15:31:42 +0000
Date: Tue, 30 Jul 2024 23:31:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [kdave-btrfs-devel:misc-next 28/73] fs/btrfs/extent_io.o: warning:
 objtool: btrfs_readahead+0x78: unreachable instruction
Message-ID: <202407302357.O8hGTtOy-lkp@intel.com>
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
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   986ec0b4635da5c76d8b8b3b8a5c9f4b09fbab60
commit: f48d206842f5a4588557fc23ec81dcf965637df4 [28/73] btrfs: convert btrfs_readahead to only use folio
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: loongarch-randconfig-001-20240730 (https://download.01.org/0day-ci/archive/20240730/202407302357.O8hGTtOy-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407302357.O8hGTtOy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202407302357.O8hGTtOy-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent_io.o: warning: objtool: btree_clear_folio_dirty+0x44: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: assert_eb_folio_uptodate+0x48: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: find_lock_delalloc_range+0x90: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: detach_extent_buffer_folio+0x90: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: end_bbio_data_write+0x78: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: attach_eb_folio_to_filemap+0x64: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: submit_extent_page+0x68: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: __extent_writepage_io+0x8c: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: end_bbio_data_read+0x70: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: btrfs_do_readpage+0x128: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: extent_write_locked_range+0xec: unreachable instruction
>> fs/btrfs/extent_io.o: warning: objtool: btrfs_readahead+0x78: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: alloc_extent_buffer+0x1f8: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: write_one_eb+0x22c: unreachable instruction


objdump-func vmlinux.o btrfs_readahead:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
