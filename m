Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 320CB66B22
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jan 2024 10:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706612221; cv=none; b=LETl00rzmbrMNmADLZk78WHM9bhHQvW3304fleUVC/tOJHXoqdkhP0ghFAFIsg0eAd2PFb5tt1ir6gw0UERaRW79UImcu6zrnSqytIIIqndas76szYpfyfk2JdPDMR7+7O7jHrVxRdk5jUmQudNp61HS1K0OhKXipgWwJa6d1TU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706612221; c=relaxed/simple;
	bh=crdyRRP+0+tsBM3zJxOGRNfgCtEXQ8nQ7xN13vU6bhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NVjhfDvPOTBwwKH/FGtsKGbOHWomJ0Oar1TcvMEazRmq6X/T7fMV1CvOyeMaO2o/gKDM5SvuvNdIPRjci4fFBj4UFVktzleHe1pMtgqcsrzljIF+1eKWrJTA45cjTn6yIMxXPa1DTOxqlxk3Ofb4QyCdLSFGpIwymNSDapM6VM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+LjgLpe; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+LjgLpe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706612219; x=1738148219;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=crdyRRP+0+tsBM3zJxOGRNfgCtEXQ8nQ7xN13vU6bhs=;
  b=S+LjgLpemKbXm6dJOXEmU2Y/7kQABjZRlQgK3LQD9lJB0jgaRcio/uCe
   DcwnwdqwpBEGtb9361InsXvlqWGxpvYkp06hDkg/wGExGTm5aT7KcQzV8
   VErlDeYMWffJk8MhL3Xst238gJoJKjAqWpNpYnGHWclbUs1VKRMZDLTfU
   IyPrsVqWeIxNqSaOKupPdUcwS/EXPCqI1B2EsAyXqfA9nKXLBWBHLHL+o
   b+81BA53itGffN89RTVcGFRBypjL9ydW+Jo3gPMDJFWLxf0L2c6dD/EI9
   aCYIOhXIVyeEqqsJQvQ4bRwhbMYMKbU0vFzbHU3qV8kldBHwOWTgkwESQ
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="402873723"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="402873723"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2024 02:56:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="907453521"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="907453521"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 30 Jan 2024 02:56:57 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUlnT-0000D4-0L;
	Tue, 30 Jan 2024 10:56:55 +0000
Date: Tue, 30 Jan 2024 18:56:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:for-6.9/io_uring 4/7]
 include/linux/io_uring_types.h:540 io_cancel_match_sequence() warn: bitwise
 AND condition is false here
Message-ID: <202401301823.80SmzVlt-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.9/io_uring
head:   712fc7e5862c2b9af7cf37418e4b398c5493ffb5
commit: 51b5f63828afe06a6e578638fec4b3d0eba9e08f [4/7] io_uring/cancel: don't default to setting req->work.cancel_seq
:::::: branch date: 14 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20240130 (https://download.01.org/0day-ci/archive/20240130/202401301823.80SmzVlt-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401301823.80SmzVlt-lkp@intel.com/

New smatch warnings:
include/linux/io_uring_types.h:540 io_cancel_match_sequence() warn: bitwise AND condition is false here
include/linux/io_uring_types.h:540 io_cancel_match_sequence() warn: bitwise AND condition is false here

Old smatch warnings:
include/linux/io_uring_types.h:538 io_file_can_poll() warn: bitwise AND condition is false here

vim +540 include/linux/io_uring_types.h

e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  472  
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  473  enum {
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  474  	/* ctx owns file */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  475  	REQ_F_FIXED_FILE	= BIT(REQ_F_FIXED_FILE_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  476  	/* drain existing IO first */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  477  	REQ_F_IO_DRAIN		= BIT(REQ_F_IO_DRAIN_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  478  	/* linked sqes */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  479  	REQ_F_LINK		= BIT(REQ_F_LINK_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  480  	/* doesn't sever on completion < 0 */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  481  	REQ_F_HARDLINK		= BIT(REQ_F_HARDLINK_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  482  	/* IOSQE_ASYNC */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  483  	REQ_F_FORCE_ASYNC	= BIT(REQ_F_FORCE_ASYNC_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  484  	/* IOSQE_BUFFER_SELECT */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  485  	REQ_F_BUFFER_SELECT	= BIT(REQ_F_BUFFER_SELECT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  486  	/* IOSQE_CQE_SKIP_SUCCESS */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  487  	REQ_F_CQE_SKIP		= BIT(REQ_F_CQE_SKIP_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  488  
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  489  	/* fail rest of links */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  490  	REQ_F_FAIL		= BIT(REQ_F_FAIL_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  491  	/* on inflight list, should be cancelled and waited on exit reliably */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  492  	REQ_F_INFLIGHT		= BIT(REQ_F_INFLIGHT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  493  	/* read/write uses file position */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  494  	REQ_F_CUR_POS		= BIT(REQ_F_CUR_POS_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  495  	/* must not punt to workers */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  496  	REQ_F_NOWAIT		= BIT(REQ_F_NOWAIT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  497  	/* has or had linked timeout */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  498  	REQ_F_LINK_TIMEOUT	= BIT(REQ_F_LINK_TIMEOUT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  499  	/* needs cleanup */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  500  	REQ_F_NEED_CLEANUP	= BIT(REQ_F_NEED_CLEANUP_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  501  	/* already went through poll handler */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  502  	REQ_F_POLLED		= BIT(REQ_F_POLLED_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  503  	/* buffer already selected */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  504  	REQ_F_BUFFER_SELECTED	= BIT(REQ_F_BUFFER_SELECTED_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  505  	/* buffer selected from ring, needs commit */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  506  	REQ_F_BUFFER_RING	= BIT(REQ_F_BUFFER_RING_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  507  	/* caller should reissue async */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  508  	REQ_F_REISSUE		= BIT(REQ_F_REISSUE_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  509  	/* supports async reads/writes */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  510  	REQ_F_SUPPORT_NOWAIT	= BIT(REQ_F_SUPPORT_NOWAIT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  511  	/* regular file */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  512  	REQ_F_ISREG		= BIT(REQ_F_ISREG_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  513  	/* has creds assigned */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  514  	REQ_F_CREDS		= BIT(REQ_F_CREDS_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  515  	/* skip refcounting if not set */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  516  	REQ_F_REFCOUNT		= BIT(REQ_F_REFCOUNT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  517  	/* there is a linked timeout that has to be armed */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  518  	REQ_F_ARM_LTIMEOUT	= BIT(REQ_F_ARM_LTIMEOUT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  519  	/* ->async_data allocated */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  520  	REQ_F_ASYNC_DATA	= BIT(REQ_F_ASYNC_DATA_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  521  	/* don't post CQEs while failing linked requests */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  522  	REQ_F_SKIP_LINK_CQES	= BIT(REQ_F_SKIP_LINK_CQES_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  523  	/* single poll may be active */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  524  	REQ_F_SINGLE_POLL	= BIT(REQ_F_SINGLE_POLL_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  525  	/* double poll may active */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  526  	REQ_F_DOUBLE_POLL	= BIT(REQ_F_DOUBLE_POLL_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  527  	/* request has already done partial IO */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  528  	REQ_F_PARTIAL_IO	= BIT(REQ_F_PARTIAL_IO_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  529  	/* fast poll multishot mode */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  530  	REQ_F_APOLL_MULTISHOT	= BIT(REQ_F_APOLL_MULTISHOT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  531  	/* recvmsg special flag, clear EPOLLIN */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  532  	REQ_F_CLEAR_POLLIN	= BIT(REQ_F_CLEAR_POLLIN_BIT),
9ca9fb24d5febc io_uring/io_uring_types.h      Pavel Begunkov 2022-06-16  533  	/* hashed into ->cancel_hash_locked, protected by ->uring_lock */
9ca9fb24d5febc io_uring/io_uring_types.h      Pavel Begunkov 2022-06-16  534  	REQ_F_HASH_LOCKED	= BIT(REQ_F_HASH_LOCKED_BIT),
595e52284d24ad include/linux/io_uring_types.h Jens Axboe     2023-12-13  535  	/* don't use lazy poll wake for this request */
595e52284d24ad include/linux/io_uring_types.h Jens Axboe     2023-12-13  536  	REQ_F_POLL_NO_LAZY	= BIT(REQ_F_POLL_NO_LAZY_BIT),
0dc648753991d5 include/linux/io_uring_types.h Jens Axboe     2024-01-28  537  	/* file is pollable */
0dc648753991d5 include/linux/io_uring_types.h Jens Axboe     2024-01-28  538  	REQ_F_CAN_POLL		= BIT(REQ_F_CAN_POLL_BIT),
51b5f63828afe0 include/linux/io_uring_types.h Jens Axboe     2024-01-28  539  	/* cancel sequence is set and valid */
51b5f63828afe0 include/linux/io_uring_types.h Jens Axboe     2024-01-28 @540  	REQ_F_CANCEL_SEQ	= BIT(REQ_F_CANCEL_SEQ_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  541  };
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  542  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
