Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90BC52E659
	for <oe-kbuild@lists.linux.dev>; Sun, 18 May 2025 03:38:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747539533; cv=none; b=FO8WTiULdKVhHOjeF3Ri2mgVQwJVrwg/sU92Wf3vmmjky+mXbga4eBU8J4mgYaclFfmf6OWnWZXUDNkxbd8ffOuCHevbsfFC0UmT34ak7nV0tGL6UiMABryT1V6oHAETPwfg/oRAjuDIJ4nWacBro/bhtlafX51IDhqdtjQZnMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747539533; c=relaxed/simple;
	bh=Jl59+XSUYzVBWwWVN9bCii4xZ5/JaNwmn8Eev2nvSus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Jt8GzzQI/403POrglRNiOzqEAYXirJPQ6judDR8BZ1VHlUOVWJ8dZZx2V0AcyWtAtFBE+UzWcx1JAuC2ayTmA/W/qr2YoweJaVKZFC3hPo3q+n346ELs1FikGmwLZJZbxtxRv6pWpRDBob7tWvdrJU2Nw+0eRFIykrRdAmUrhu8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kozvuKaM; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kozvuKaM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747539531; x=1779075531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Jl59+XSUYzVBWwWVN9bCii4xZ5/JaNwmn8Eev2nvSus=;
  b=kozvuKaM1ReP8WK7UOAc/r022F7UjBP4U7SBx2ZeFWP+Xn0EJZ/kCE2s
   ++G5NgKw/Dfu5dJEEITGs12D7IPZThbWtaqMv4H4mEQvw3q3EcY16sF9I
   habUhsEk2CsWVnoOXTJmpTzFcUC6yB+dohmvBkDLJAV76BJgZ8qaSx0TM
   G5mVmnMqe/ZyI/EeBNhhB9Ofz5zxGyWfPOzH25Tu1C7u46GyMUaD34JC5
   b7jer+9l0ckyv+lFVEhCxxwpxkoHRH/bMXHZwuDdcVHPop1+jFPGWnkkk
   HaKc1nfx+kC9sanMbq9e36tHzDejaC7+6Rf6neYgilWfOge67MiXyHWCt
   Q==;
X-CSE-ConnectionGUID: 7/1X5etvTOyshLdZNOShKA==
X-CSE-MsgGUID: fvDtoSwCSfKv9pfg93yimA==
X-IronPort-AV: E=McAfee;i="6700,10204,11436"; a="59698952"
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="59698952"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 May 2025 20:38:50 -0700
X-CSE-ConnectionGUID: vsP0OKjUQyiBKqdlEHR9Ow==
X-CSE-MsgGUID: VgI8Kp3WTS+vj7Apfw7JWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,298,1739865600"; 
   d="scan'208";a="169981727"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 17 May 2025 20:38:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uGUrO-000KaV-2r;
	Sun, 18 May 2025 03:38:46 +0000
Date: Sun, 18 May 2025 11:38:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/extent_io.o: warning: objtool:
 btrfs_clear_buffer_dirty+0x2c4: unreachable instruction
Message-ID: <202505181108.JxBG7kX8-lkp@intel.com>
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
head:   5723cc3450bccf7f98f227b9723b5c9f6b3af1c5
commit: 7895817b31598a04f974acdd5d46a5b6c66f9f08 btrfs: simplify subpage handling of btrfs_clear_buffer_dirty()
date:   9 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 9 weeks ago
config: loongarch-randconfig-001-20250512 (https://download.01.org/0day-ci/archive/20250518/202505181108.JxBG7kX8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250518/202505181108.JxBG7kX8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202505181108.JxBG7kX8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent_io.o: warning: objtool: set_delalloc_bitmap+0x104: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: assert_eb_folio_uptodate+0xc8: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: submit_extent_folio+0xc8: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: submit_one_sector+0xc4: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: end_bbio_data_write+0x16c: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: detach_extent_buffer_folio+0x104: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: attach_eb_folio_to_filemap+0x108: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: find_lock_delalloc_range+0x124: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: writepage_delalloc+0x410: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: btrfs_do_readpage+0x200: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: extent_write_locked_range+0x220: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: alloc_extent_buffer+0x278: unreachable instruction
>> fs/btrfs/extent_io.o: warning: objtool: btrfs_clear_buffer_dirty+0x2c4: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: read_extent_buffer_pages_nowait+0x2c0: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: write_one_eb+0x420: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
