Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7791C6BC
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Mar 2024 21:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710711341; cv=none; b=O8KiNxKTyYOkrAOaYxHJCVejaLEjQaXh55BthkCO2s5qPu4pZZh8a6c+HoVsqtJU78komAk5OWtT4/iuyTaSXYsQASzLxs0qChLY+6ryF4Wi7coDPqICIMSMvu+rw5x5vUc7x1w+aVObL9v0i0voIymfkQ6Us3DUZGyTf3itOlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710711341; c=relaxed/simple;
	bh=5zicr+uPVNioP4k/n1xTdmvgrB5Ns3t1rkLqglcWFzk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gkzuN6gdW6MA3Gu/wa4XG2UdYK2hGaukwmls+2pLo9SBUByrvUCCXdOOiMdgC5PHFoeW75Mpv0WIuVEw7alY0HsEbzD8Ounxqt2Y4Y1ME+Uc+MBSHfeTqIcYR2s8WmbYS7ut0rpjMvoQ7wCi7gDQcHrkYg+2cC7cGHC2dEykB5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Smb9Sk0a; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Smb9Sk0a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710711339; x=1742247339;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5zicr+uPVNioP4k/n1xTdmvgrB5Ns3t1rkLqglcWFzk=;
  b=Smb9Sk0aJA1k74tXGkINfI8pl4hn6c+GMs8cevHXrz0zprGVOquiiKVS
   ert3CdFYqAGdhwx0fetLHDlu9ZhZf/t0SH0+by4n1s7I6y4GGDa8/GueR
   bDWfwuxjK+hz0JfYoSjw5BaBh6flobzVoF9XTq0dbNSJ7j+zoNB4zgQ7o
   oqK74f1noEkKTww/OmcGc095Ub2GCkS2tM1SYD8yFBl5gS6Xx0ey4qZoE
   FUSZPGgf+mqK6EBUmnsNfZJm4W/F12KZJgNFXlVCLsAYuHxQgS7YdJarr
   lc993gdQngXRusXzwbearll5WwN30zlBo7BlhZFRlDRxVLnPBRbCLVZAK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11016"; a="5703314"
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="5703314"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2024 14:35:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,133,1708416000"; 
   d="scan'208";a="13314513"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Mar 2024 14:35:37 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlyAI-000GTj-12;
	Sun, 17 Mar 2024 21:35:34 +0000
Date: Mon, 18 Mar 2024 05:34:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: [axboe-block:io_uring-ring-map 6/13] io_uring/kbuf.c:265:5-24:
 WARNING: atomic_dec_and_test variation before object free at line 267.
Message-ID: <202403180550.kxH8zy3J-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

Hi Jens,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git io_uring-ring-map
head:   7e1bcabd5aaea80fc96135463497608fc11b08bf
commit: 21d6df7a19bbb482e02e74c0b8cc1dce427f3041 [6/13] io_uring/kbuf: protect io_buffer_list teardown with a reference
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: x86_64-randconfig-102-20240317 (https://download.01.org/0day-ci/archive/20240318/202403180550.kxH8zy3J-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403180550.kxH8zy3J-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> io_uring/kbuf.c:265:5-24: WARNING: atomic_dec_and_test variation before object free at line 267.

vim +265 io_uring/kbuf.c

3b77495a97239f Jens Axboe 2022-06-13  262  
21d6df7a19bbb4 Jens Axboe 2024-03-15  263  static void io_put_bl(struct io_ring_ctx *ctx, struct io_buffer_list *bl)
21d6df7a19bbb4 Jens Axboe 2024-03-15  264  {
21d6df7a19bbb4 Jens Axboe 2024-03-15 @265  	if (atomic_dec_and_test(&bl->refs)) {
21d6df7a19bbb4 Jens Axboe 2024-03-15  266  		__io_remove_buffers(ctx, bl, -1U);
21d6df7a19bbb4 Jens Axboe 2024-03-15 @267  		kfree_rcu(bl, rcu);
21d6df7a19bbb4 Jens Axboe 2024-03-15  268  	}
21d6df7a19bbb4 Jens Axboe 2024-03-15  269  }
21d6df7a19bbb4 Jens Axboe 2024-03-15  270  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
