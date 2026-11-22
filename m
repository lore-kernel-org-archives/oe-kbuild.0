Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795359641;
	b=qb16F+WSxQFmAd7M9xGcMgGB0bmvwzCa9dZ7u8x+XFcb+2hbECyfVtOu/8RWyTV10zP3
	 IpPme44gVXGr40OXq8+BNYU5H4J8HMoN3JNp/GQtCrTiO4GXiStmDUb2gqR4c1PEyrKdE
	 uRkrnvfnpYM9JGcfsnPfe/iScl8JHzXJqtFlaWjHqf4d/38SdSvEWVJx0oWXYyjuG19O/
	 LfnfsCOaOsJOiCBYeCBhXqtFkSd1DsRoYHBDLidOFbJ+TlFtmydZRl8ZrhhVY9fdd+LY6
	 wRtvTZ8MeKUjykKI85CkTGaLWatWYiJWIAc9RLWHRnx1YDzOuZBMO9qc10nvWHIbKRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795359641;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=h6MsJRuKpq/gDw7RuJV/YwxDuAbVN3FebsalUd11TJA=;
	b=V9C2i3e7+6vCqjXVmgw2ihlRJUBM522BiVDYpvttaBQr6Ub+SS6GpD/Egk1us/QPgZuX
	 bs3RMIimj2PhzkekahwkTLScZEZ6M9uo2FvcxxyiCtW04ClfRyFo2VuPRJZ/6jb6aO5qS
	 SEjIv7901hzDNlS1738nyyB35WfQL6HKm0pIETkkOImYO+mxWG6ilgkpU7kZDUdBoEtRj
	 Dmsl5A3wpQUc6znzpIU74gLmuUWwVnbiAHxZ/BVhU7ANpi9gZ88OMRw8PdNwNsKlfSJnt
	 XUQFgu9OPYkrU6W7L1B7Qles1VEwVGg7uf63K+SYJnzhuodLTt5itPLWclHcDp0jtBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a7U4sH+x;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AB4606A320
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Nov 2026 15:00:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02AB4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=a7U4sH+x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795359640; x=1826895640;
  h=date:from:to:cc:subject:message-id;
  bh=cFfTy93TN2SutVSz67ya43NWLR0fe43egfh3SgSsMRM=;
  b=a7U4sH+xWdEmfCbRRV5Vk3+pqnsNe4Yps2OO43cZmAnfd5mK0/0AzHI4
   al289kmphp3WDfu0oojA06EQOltaqiRLvCGSBUE0zuh90p3DCqSEHSroi
   zqpg9PsOiQq1uJfAhrT/hXVjuAKki8WQdqF6rWeMi/UZkY+Qrx27fHJIQ
   kf0Z0vYWyJkjME/wSCHwCdEWf7/Wu2r9yC2B45VQG2meCo11kERiA6Wtn
   1NJJvaPZ269g8m8uxVfymEUfyeLfEG5uSDoLqJ37SC2Ucn2yg8cK3dno0
   xW+/Zyo9W5799j6KkvGrIb5l+21DEe5jDgcARNDWtphQbcckAkK0tIV8W
   w==;
X-CSE-ConnectionGUID: Cbidfu2dR9yjXMaNGWUi2Q==
X-CSE-MsgGUID: 0JmNtJenQ4CY/JOiNqncqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4208355"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4208355"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 07:00:39 -0800
X-CSE-ConnectionGUID: MclPogd/RoWXyTChRJ5kNA==
X-CSE-MsgGUID: 4PAIPBZlQV+A7wuqo2zAYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11036371"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 22 Nov 2026 07:00:38 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xV93T-000000004Ze-3aXH;
	Sun, 22 Nov 2026 15:00:35 +0000
Date: Sun, 22 Nov 2026 15:59:42 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/btrfs/extent_io.o: warning: objtool:
 extent_writepage_io+0x2ac: unreachable instruction
Message-ID: <20261122155525.mDqqBU8w-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Qu Wenruo <wqu@suse.com>
CC: Anand Jain <asj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   4843f6873f7c4835e62f2c73ba0fd538e57a2f22
commit: 18de34daa7c62c830be533aace6b7c271e8e95cf btrfs: truncate ordered extent when skipping writeback past i_size
date:   12 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 12 months ago
config: loongarch-randconfig-r2304-20261122 (https://download.01.org/0day-ci/archive/20261122/20261122155525.mDqqBU8w-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122155525.mDqqBU8w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 18de34daa7c6 ("btrfs: truncate ordered extent when skipping writeback past i_size")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261122155525.mDqqBU8w-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/extent_io.o: warning: objtool: can_skip_one_ordered_range+0x138: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: set_delalloc_bitmap+0x180: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: btree_clear_folio_dirty_tag+0xcc: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: assert_eb_folio_uptodate+0x100: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: submit_one_bio+0xe0: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: find_lock_delalloc_range+0x1c8: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: submit_extent_folio+0x150: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: submit_one_sector+0x104: unreachable instruction
>> fs/btrfs/extent_io.o: warning: objtool: extent_writepage_io+0x2ac: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: attach_eb_folio_to_filemap+0x1a0: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: detach_extent_buffer_folio+0x190: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: btrfs_do_readpage+0x260: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: extent_write_locked_range+0x290: unreachable instruction
   fs/btrfs/extent_io.o: warning: objtool: alloc_extent_buffer+0x340: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
