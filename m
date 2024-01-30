Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072D7537E8
	for <oe-kbuild@lists.linux.dev>; Tue, 30 Jan 2024 06:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.55.52.115
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706597823; cv=none; b=n6tL94T+TJroZcLH9Q6bQN3CeyztaoaucCQ+OuneBilbR9ecXx2kvXuLKdRYdYb8uvkLwGv/9oWOfQismBgBtWMfL2aj3oUhhF22T92UQL71qZGux/qBdzxhkYBo6z087HXYJiJ5w6MwOVaqDBpehepgzTAsS+mUl090pZxNd5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706597823; c=relaxed/simple;
	bh=vB7EA9JM4xuBEsgzqs5JNYPJWuGtbx9CP2qbpnHb3sE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IN4UUF26aqLdEk9FrjEro1PBAGcbWRvs4au8B+Kl9OBYxDNVMiqGT+69f0qZ3QhYLAEh6HeWiJs3dD3LiKSSTFRQrB2ss0fdr8ORwniugnX6/atu7AmcCo7pWHJmxoiaOIyNa2Fzs9t5wb06XkdneMASEUmDgRbm9SeWbJeqxG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gXwexgwd; arc=none smtp.client-ip=192.55.52.115
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gXwexgwd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706597821; x=1738133821;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vB7EA9JM4xuBEsgzqs5JNYPJWuGtbx9CP2qbpnHb3sE=;
  b=gXwexgwdDUJeoGFBngbxtXHGdu32bjHJ7UhP5bTHApl3CE91tRLXhKXC
   YJfnTzeJ/YUe8K1xsp7wR0uESQ7KwHybEBOvdK61NXEf+LQB8odOVCxFf
   ky67y0GF9rCn8IW53F2Xdxqw51dTNeBGbMfjAPfyDQggRrhDDkZxpmeaG
   N/ZSxi9ANFvDwBJe+sj2DhKtEHTKiLlnOUlvOeBH5yfQsqOhcYgJQnff2
   iacvz3da/3PMzvYYjqKmMGN/0snKqhO8Wi7i5j9BE0ZVijiUAkLuq7ZC1
   R/wryzevi+iAdTrfqZc3H7dnv7s63XiI1yDrdb4i9rn2deU+4BSlVjvN6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="402819399"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="402819399"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 22:57:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="907387235"
X-IronPort-AV: E=Sophos;i="6.05,707,1701158400"; 
   d="scan'208";a="907387235"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 29 Jan 2024 22:56:58 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUi2X-00004q-15;
	Tue, 30 Jan 2024 06:56:27 +0000
Date: Tue, 30 Jan 2024 14:55:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:for-6.9/io_uring 3/7]
 include/linux/io_uring_types.h:537 io_file_can_poll() warn: bitwise AND
 condition is false here
Message-ID: <202401301447.MQwrWziC-lkp@intel.com>
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
commit: 0dc648753991d5a48c0b13c869548bd0f97c02b7 [3/7] io_uring: add io_file_can_poll() helper
:::::: branch date: 10 hours ago
:::::: commit date: 27 hours ago
config: i386-randconfig-141-20240130 (https://download.01.org/0day-ci/archive/20240130/202401301447.MQwrWziC-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401301447.MQwrWziC-lkp@intel.com/

smatch warnings:
include/linux/io_uring_types.h:537 io_file_can_poll() warn: bitwise AND condition is false here

vim +537 include/linux/io_uring_types.h

e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  471  
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  472  enum {
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  473  	/* ctx owns file */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  474  	REQ_F_FIXED_FILE	= BIT(REQ_F_FIXED_FILE_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  475  	/* drain existing IO first */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  476  	REQ_F_IO_DRAIN		= BIT(REQ_F_IO_DRAIN_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  477  	/* linked sqes */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  478  	REQ_F_LINK		= BIT(REQ_F_LINK_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  479  	/* doesn't sever on completion < 0 */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  480  	REQ_F_HARDLINK		= BIT(REQ_F_HARDLINK_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  481  	/* IOSQE_ASYNC */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  482  	REQ_F_FORCE_ASYNC	= BIT(REQ_F_FORCE_ASYNC_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  483  	/* IOSQE_BUFFER_SELECT */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  484  	REQ_F_BUFFER_SELECT	= BIT(REQ_F_BUFFER_SELECT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  485  	/* IOSQE_CQE_SKIP_SUCCESS */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  486  	REQ_F_CQE_SKIP		= BIT(REQ_F_CQE_SKIP_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  487  
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  488  	/* fail rest of links */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  489  	REQ_F_FAIL		= BIT(REQ_F_FAIL_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  490  	/* on inflight list, should be cancelled and waited on exit reliably */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  491  	REQ_F_INFLIGHT		= BIT(REQ_F_INFLIGHT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  492  	/* read/write uses file position */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  493  	REQ_F_CUR_POS		= BIT(REQ_F_CUR_POS_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  494  	/* must not punt to workers */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  495  	REQ_F_NOWAIT		= BIT(REQ_F_NOWAIT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  496  	/* has or had linked timeout */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  497  	REQ_F_LINK_TIMEOUT	= BIT(REQ_F_LINK_TIMEOUT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  498  	/* needs cleanup */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  499  	REQ_F_NEED_CLEANUP	= BIT(REQ_F_NEED_CLEANUP_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  500  	/* already went through poll handler */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  501  	REQ_F_POLLED		= BIT(REQ_F_POLLED_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  502  	/* buffer already selected */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  503  	REQ_F_BUFFER_SELECTED	= BIT(REQ_F_BUFFER_SELECTED_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  504  	/* buffer selected from ring, needs commit */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  505  	REQ_F_BUFFER_RING	= BIT(REQ_F_BUFFER_RING_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  506  	/* caller should reissue async */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  507  	REQ_F_REISSUE		= BIT(REQ_F_REISSUE_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  508  	/* supports async reads/writes */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  509  	REQ_F_SUPPORT_NOWAIT	= BIT(REQ_F_SUPPORT_NOWAIT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  510  	/* regular file */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  511  	REQ_F_ISREG		= BIT(REQ_F_ISREG_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  512  	/* has creds assigned */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  513  	REQ_F_CREDS		= BIT(REQ_F_CREDS_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  514  	/* skip refcounting if not set */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  515  	REQ_F_REFCOUNT		= BIT(REQ_F_REFCOUNT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  516  	/* there is a linked timeout that has to be armed */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  517  	REQ_F_ARM_LTIMEOUT	= BIT(REQ_F_ARM_LTIMEOUT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  518  	/* ->async_data allocated */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  519  	REQ_F_ASYNC_DATA	= BIT(REQ_F_ASYNC_DATA_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  520  	/* don't post CQEs while failing linked requests */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  521  	REQ_F_SKIP_LINK_CQES	= BIT(REQ_F_SKIP_LINK_CQES_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  522  	/* single poll may be active */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  523  	REQ_F_SINGLE_POLL	= BIT(REQ_F_SINGLE_POLL_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  524  	/* double poll may active */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  525  	REQ_F_DOUBLE_POLL	= BIT(REQ_F_DOUBLE_POLL_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  526  	/* request has already done partial IO */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  527  	REQ_F_PARTIAL_IO	= BIT(REQ_F_PARTIAL_IO_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  528  	/* fast poll multishot mode */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  529  	REQ_F_APOLL_MULTISHOT	= BIT(REQ_F_APOLL_MULTISHOT_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  530  	/* recvmsg special flag, clear EPOLLIN */
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  531  	REQ_F_CLEAR_POLLIN	= BIT(REQ_F_CLEAR_POLLIN_BIT),
9ca9fb24d5febc io_uring/io_uring_types.h      Pavel Begunkov 2022-06-16  532  	/* hashed into ->cancel_hash_locked, protected by ->uring_lock */
9ca9fb24d5febc io_uring/io_uring_types.h      Pavel Begunkov 2022-06-16  533  	REQ_F_HASH_LOCKED	= BIT(REQ_F_HASH_LOCKED_BIT),
595e52284d24ad include/linux/io_uring_types.h Jens Axboe     2023-12-13  534  	/* don't use lazy poll wake for this request */
595e52284d24ad include/linux/io_uring_types.h Jens Axboe     2023-12-13  535  	REQ_F_POLL_NO_LAZY	= BIT(REQ_F_POLL_NO_LAZY_BIT),
0dc648753991d5 include/linux/io_uring_types.h Jens Axboe     2024-01-28  536  	/* file is pollable */
0dc648753991d5 include/linux/io_uring_types.h Jens Axboe     2024-01-28 @537  	REQ_F_CAN_POLL		= BIT(REQ_F_CAN_POLL_BIT),
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  538  };
e27f928ee1cb06 io_uring/io_uring_types.h      Jens Axboe     2022-05-24  539  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
