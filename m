Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9086147ACCA
	for <oe-kbuild@lists.linux.dev>; Sat, 12 Sep 2026 12:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789215323; cv=none; b=mAfBey0oLfmQnrVW+LKYIbCoUUVUYFe0w2VDqWZ6B6r/c+n9h6Xc+bR6ddSJoiK0eFaPFD2AUc0l8oR/QCPfjvbuxLqLjEJVWbMJ/NuLGFYntK+QZgd3w8znFZHjOtE0Ct9KEm/WulXwZfidg8J5mnFUKWwNLNIxX+207GAYEQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789215323; c=relaxed/simple;
	bh=Z1ry30WMmDxbQSQHN9XlDqZYkoMfJzDdgoqyB5OmNAs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oV6JgIrqcRojCVubq+jCeRrlhpNvvCLEdRUiiDmnKBXYWhRqYutmchmuFsaiJH+QeKzgHG/m59g6osuGLfG8P/9jQaATGBezxkiJ8Yi/dGT4H1FKDSvEqmAGL0cUAY2RGUozW7cEUetvk39IGHbVtZBpp0eAVzWg9jpTu8gf1nY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjgXGrng; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjgXGrng"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789215321; x=1820751321;
  h=date:from:to:cc:subject:message-id;
  bh=Z1ry30WMmDxbQSQHN9XlDqZYkoMfJzDdgoqyB5OmNAs=;
  b=hjgXGrngDAylLFQ3aH7GgAQ5hy5WhsY7IIJhCiyBEIc7E6gjnaPsD7xP
   wfhkwyuxHtNer17ePauT/aBPmyEWV6gUlQD/Oh/ZxrDRaVrDrESaSrKV0
   d+c3jhZR5AVviiPWFLLvu5Yf7uG2m07OZ1Zcgq6VoSBw2ZEqH3ucB/in5
   nYkOxerBZmSsL4lxs2DUiBuC9Y+xT9iwCqdiMwCBXHTjlCfvwkTKig3JD
   wwyt+OA+mXHLTKeFWdihwCGq0cle9CXnoQrSqOx1b4dfLkQgyQw/abt7f
   ukwHrUPC9JcGj9Y3eMgXfz6jjEPyC4h969IZMNZerDNGBTi1g1tElyNed
   A==;
X-CSE-ConnectionGUID: cDikp5iGRGyaXf5B6OOa5Q==
X-CSE-MsgGUID: Ws7dS6YFTKW10jtoOD8x/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="163579"
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="163579"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Sep 2026 05:15:20 -0700
X-CSE-ConnectionGUID: q5JRD4LtQGKDh+iLnvceIA==
X-CSE-MsgGUID: iPANkVDsTcqCNQVzr9UHlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,99,1787036400"; 
   d="scan'208";a="297161118"
Received: from lkp-server02.sh.intel.com (HELO 0a3643a6ed9d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 12 Sep 2026 05:15:19 -0700
Received: from kbuild by 0a3643a6ed9d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x5Mcm-000000002uz-16CD;
	Sat, 12 Sep 2026 12:14:29 +0000
Date: Sat, 12 Sep 2026 20:13:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/extent_io.o: warning: objtool: submit_one_bio+0x44:
 unreachable instruction
Message-ID: <202609122048.ZbYfiSyx-lkp@intel.com>
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
TO: Boris Burkov <boris@bur.io>
CC: David Sterba <dsterba@suse.com>
CC: Filipe Manana <fdmanana@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   08df884136f1c1197bab2a27814404fd329d9aac
commit: f07b855c56b1fd724c018c1d4ff8d319b9afd5a9 btrfs: try to search for data csums in commit root
date:   12 months ago
:::::: branch date: 2 days ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r061-20260906 (https://download.01.org/0day-ci/archive/20260912/202609122048.ZbYfiSyx-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260912/202609122048.ZbYfiSyx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: f07b855c56b1 ("btrfs: try to search for data csums in commit root")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609122048.ZbYfiSyx-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent_io.o: warning: objtool: can_skip_one_ordered_range+0x8c: unreachable instruction
>> fs/btrfs/extent_io.o: warning: objtool: submit_one_bio+0x44: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: submit_extent_folio+0x9c: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: submit_one_sector+0x7c: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: set_delalloc_bitmap+0x108: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: assert_eb_folio_uptodate+0x4c: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: find_lock_delalloc_range+0x84: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: attach_eb_folio_to_filemap+0xa0: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: detach_extent_buffer_folio+0x13c: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: btrfs_do_readpage+0xfc: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: extent_write_locked_range+0x110: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: alloc_extent_buffer+0x188: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: btrfs_clear_buffer_dirty+0x160: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
