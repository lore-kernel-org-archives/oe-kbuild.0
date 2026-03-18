Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DADB034107A
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 20:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773866384; cv=none; b=WjGEGKUdawN+72YxnaM3w4y8HRErofcf+SMpUU6kAySl/Bko0HByuKteNnEw7V298XeK/OyMj075Pvbeg7X3fcqfoXnBFw8NTjY58pr7ikLqWn9rJgt+rf/ZbsDd1zGLDhjMfBQHSbsPi8uve2m5H5ZsDoSKNYeZOJlYZD6akwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773866384; c=relaxed/simple;
	bh=52uXr0jr3ylJ3furDzkFy4/Ed9OFAgf1xp5DgVx72MQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JWkmg/I3gr8MBgE2RefHz+qSPBzkKklRqmsSYerCzyerUlbjB1vsR+MCQcpWIv5zI4ZbGMosHJ4xuCyYJWI/GhGQ+TV0UvAnTNNjgaQ/Sx2q0OajqxKaT2DLMUEk5jhj2W/maWQaVQKTeLe99nY38ekV8mNLYyI9Ql+0hzhVq3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JYwBHAfU; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JYwBHAfU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773866383; x=1805402383;
  h=date:from:to:cc:subject:message-id;
  bh=52uXr0jr3ylJ3furDzkFy4/Ed9OFAgf1xp5DgVx72MQ=;
  b=JYwBHAfUCUFy6JZ7/18a/CzK3c8PVRVSNSKb4zdyWWIQUal8/QK2/+Ko
   IeHjFuMpjLR5UZpskYfMTghkcspyppgcT5Gd5u4bmPUS5bLa7HN/eRXnX
   ef6cbMQXIYm8XcprEKBbUkwOR5JDby9FL+RQnbVkROkXUQKXQZJrrIhx/
   jfTOg+IPyZUz/seg77EG+OJwN7JoA9YLqiY3RSuVmFEq+euEuCDzNhTtz
   uvoTher87gtKdlb15rE0Po6hZTFKdM6nXnxnAguJ5ei+7h6lgjOUVhuHK
   qujxaC086fX4TLOo9AbK7y4yHgo1w+aJ+nHxz5xIfSF9GOwT7LLOhtmOQ
   g==;
X-CSE-ConnectionGUID: dwS9gUchTmCbL3bQsNOyRw==
X-CSE-MsgGUID: DMtTdaTgQKKFQMCSVj5ZvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="85636180"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="85636180"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 13:39:42 -0700
X-CSE-ConnectionGUID: EIRx2EcGTBOgxzupAwNRXQ==
X-CSE-MsgGUID: ImrFvOOIQpaAD//276z1zQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227704331"
Received: from lkp-server01.sh.intel.com (HELO 63737dd503cb) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 18 Mar 2026 13:39:38 -0700
Received: from kbuild by 63737dd503cb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2xfz-000000003LZ-3uH7;
	Wed, 18 Mar 2026 20:39:35 +0000
Date: Thu, 19 Mar 2026 04:38:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/extent_io.o: warning: objtool:
 btrfs_clear_buffer_dirty+0x2b0: unreachable instruction
Message-ID: <202603190410.1Xb93oUQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Qu Wenruo <wqu@suse.com>
CC: David Sterba <dsterba@suse.com>

Hi Qu,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   04a9f1766954687f0a1b7a0f7184dc4f86edcb30
commit: 7895817b31598a04f974acdd5d46a5b6c66f9f08 btrfs: simplify subpage handling of btrfs_clear_buffer_dirty()
date:   1 year ago
:::::: branch date: 5 hours ago
:::::: commit date: 1 year ago
config: loongarch-randconfig-r053-20260318 (https://download.01.org/0day-ci/archive/20260319/202603190410.1Xb93oUQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260319/202603190410.1Xb93oUQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202603190410.1Xb93oUQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent_io.o: warning: objtool: set_delalloc_bitmap+0x100: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: assert_eb_folio_uptodate+0xc4: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: attach_eb_folio_to_filemap+0x100: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: detach_extent_buffer_folio+0x10c: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: find_lock_delalloc_range+0x1d0: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: writepage_delalloc+0x408: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: end_bbio_data_write+0x16c: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: submit_extent_folio+0xd8: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: submit_one_sector+0xcc: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: btrfs_do_readpage+0x20c: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: extent_write_locked_range+0x228: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: alloc_extent_buffer+0x24c: unreachable instruction
>> fs/btrfs/extent_io.o: warning: objtool: btrfs_clear_buffer_dirty+0x2b0: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: read_extent_buffer_pages_nowait+0x2bc: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: write_one_eb+0x440: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
