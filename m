Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11D13BB57
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Oct 2026 01:38:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792114717; cv=none; b=LXWU7Ey7lTQpYvcuX2mAdSwtarP2Opp3YH7mtGbTfyaw6FLp0qqJSflGSp4qvFrq3jdFKKJ4z+SYuE7IuRv4unYlUSex9enNjP/pGvSzr4r121P/nftU0nSYke8yOV1AloajFlvGJS+4vJf6Fzvw4gaaWqn+1EVr9E2vIu3t2nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792114717; c=relaxed/simple;
	bh=YHp83D35KNFmWIUkmS9etl96JC0nHUmdyl5kiV7aE/g=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Z4Ju3XhieJ5bvJxth3H+ivEAW0yYDCyxN0x1npFXD7olbMGgXOzWM+lCoONfHWQkGESTOyJ6h9jSk4JEnt3/ZdagYCrG7EVVvJSwVPIPjHx8t7OdZ3UNTywbA8yoFt5G+2f14BxnUgYZ15kcafkoCBxGtASZNNcIQLN1JuzA85s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pj9WJIxT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pj9WJIxT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792114716; x=1823650716;
  h=date:from:to:cc:subject:message-id;
  bh=YHp83D35KNFmWIUkmS9etl96JC0nHUmdyl5kiV7aE/g=;
  b=Pj9WJIxTut0D8YIOa4Kxy1b4VZUW9dITSCW/5665R9DcWrf4alCpuc3H
   21HE0dedq8OA7aS1oKQqUeVDHmhCBPtr/JWpoa+scGjYGgjvlm0X0To9P
   iY06lK3xD3PRKkP7IWKSS5OyFWFgEyP0h9jLbKvZ6UegmGgapYaIL4+Hl
   YdiSr1pvFzTQEZIHxhVUlHTh46AjOPBU/vA9C2BZfuRJK735mevdU0wHb
   TUpkHyMRQl8Lsac8RJ7tgkWBY4pSdIH/XqwhBvFCn7hCR07uMC9gIOB2R
   3gXW1+RId15g1mFMnBu85LEm0xu3myFRZ9FO7JVvYmUKe+/bveaqL3fpS
   A==;
X-CSE-ConnectionGUID: zw2gKHFkTKeKz6DO2XYgiA==
X-CSE-MsgGUID: 9qKe7olzRbmKojBd5OKc0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="790192"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="790192"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 18:38:35 -0700
X-CSE-ConnectionGUID: 7NPC7SBYRcGdQxYcTTbIhg==
X-CSE-MsgGUID: fV5psOwJQeybzgvjaB9dcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1905523"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 15 Oct 2026 18:38:34 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHWu0-00000000Byh-0C51;
	Fri, 16 Oct 2026 01:38:32 +0000
Date: Fri, 16 Oct 2026 03:38:23 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tytso-ext4:dev 40/41] fs/ext4/inode.c:4518
 ext4_iomap_writepages() warn: missing error code? 'ret'
Message-ID: <202610160314.PLMEXaOJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-ext4@vger.kernel.org
TO: Zhang Yi <yi.zhang@huawei.com>
CC: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
head:   8c4f6e3376348fc3162eed86a05b933921c8f9ed
commit: bdcbb0f19e921c7ea3241f55922032dff23d1d26 [40/41] ext4: partially enable iomap for the buffered I/O path of regular files
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
config: x86_64-randconfig-2200-20261016 (https://download.01.org/0day-ci/archive/20261016/202610160314.PLMEXaOJ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610160314.PLMEXaOJ-lkp@intel.com/

New smatch warnings:
fs/ext4/inode.c:4518 ext4_iomap_writepages() warn: missing error code? 'ret'

Old smatch warnings:
fs/ext4/inode.c:2785 mpage_prepare_extent_to_map() warn: missing error code 'err'
fs/ext4/inode.c:6085 check_igot_inode() warn: missing unwind goto?

vim +/ret +4518 fs/ext4/inode.c

53fe71a6bcad0f Zhang Yi 2026-10-09  4487  
a304299a40d92c Zhang Yi 2026-10-09  4488  static int ext4_iomap_writepages(struct address_space *mapping,
a304299a40d92c Zhang Yi 2026-10-09  4489  				 struct writeback_control *wbc)
a304299a40d92c Zhang Yi 2026-10-09  4490  {
a2e096bf59634f Zhang Yi 2026-10-09  4491  	struct inode *inode = mapping->host;
a2e096bf59634f Zhang Yi 2026-10-09  4492  	struct super_block *sb = inode->i_sb;
a2e096bf59634f Zhang Yi 2026-10-09  4493  	long nr = wbc->nr_to_write;
a2e096bf59634f Zhang Yi 2026-10-09  4494  	int alloc_ctx, ret;
a2e096bf59634f Zhang Yi 2026-10-09  4495  	struct iomap_writepage_ctx wpc = {
a2e096bf59634f Zhang Yi 2026-10-09  4496  		.inode = inode,
a2e096bf59634f Zhang Yi 2026-10-09  4497  		.wbc = wbc,
a2e096bf59634f Zhang Yi 2026-10-09  4498  		.ops = &ext4_writeback_ops,
a2e096bf59634f Zhang Yi 2026-10-09  4499  	};
a2e096bf59634f Zhang Yi 2026-10-09  4500  
a2e096bf59634f Zhang Yi 2026-10-09  4501  	ret = ext4_emergency_state(sb);
a2e096bf59634f Zhang Yi 2026-10-09  4502  	if (unlikely(ret))
a2e096bf59634f Zhang Yi 2026-10-09  4503  		return ret;
a2e096bf59634f Zhang Yi 2026-10-09  4504  
53fe71a6bcad0f Zhang Yi 2026-10-09  4505  	/*
53fe71a6bcad0f Zhang Yi 2026-10-09  4506  	 * Submit the pending zeroed EOF block range if the entire
53fe71a6bcad0f Zhang Yi 2026-10-09  4507  	 * writeback range lies beyond it.
53fe71a6bcad0f Zhang Yi 2026-10-09  4508  	 */
53fe71a6bcad0f Zhang Yi 2026-10-09  4509  	ext4_iomap_wb_submit_zeroed_eof(inode, wbc);
53fe71a6bcad0f Zhang Yi 2026-10-09  4510  
a2e096bf59634f Zhang Yi 2026-10-09  4511  	alloc_ctx = ext4_writepages_down_read(sb);
bdcbb0f19e921c Zhang Yi 2026-10-09  4512  	/*
bdcbb0f19e921c Zhang Yi 2026-10-09  4513  	 * Does ext4_change_inode_journal_flag() change the inode's
bdcbb0f19e921c Zhang Yi 2026-10-09  4514  	 * buffered I/O path?
bdcbb0f19e921c Zhang Yi 2026-10-09  4515  	 */
bdcbb0f19e921c Zhang Yi 2026-10-09  4516  	if (!ext4_inode_buffered_iomap(inode)) {
bdcbb0f19e921c Zhang Yi 2026-10-09  4517  		ext4_writepages_up_read(sb, alloc_ctx);
bdcbb0f19e921c Zhang Yi 2026-10-09 @4518  		return ret;
bdcbb0f19e921c Zhang Yi 2026-10-09  4519  	}
bdcbb0f19e921c Zhang Yi 2026-10-09  4520  
a2e096bf59634f Zhang Yi 2026-10-09  4521  	trace_ext4_writepages(inode, wbc);
a2e096bf59634f Zhang Yi 2026-10-09  4522  	ret = iomap_writepages(&wpc);
a2e096bf59634f Zhang Yi 2026-10-09  4523  	trace_ext4_writepages_result(inode, wbc, ret, nr - wbc->nr_to_write);
a2e096bf59634f Zhang Yi 2026-10-09  4524  	ext4_writepages_up_read(sb, alloc_ctx);
a2e096bf59634f Zhang Yi 2026-10-09  4525  
a2e096bf59634f Zhang Yi 2026-10-09  4526  	return ret;
a304299a40d92c Zhang Yi 2026-10-09  4527  }
a304299a40d92c Zhang Yi 2026-10-09  4528  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
