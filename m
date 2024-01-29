Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 185072E637
	for <oe-kbuild@lists.linux.dev>; Mon, 29 Jan 2024 20:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706560400; cv=none; b=Z6FGBPSpy9DxACmM05I9MzeneY81FELcJAzj75e55m8vlSKU5P9AKHg5cO0YimBja89e/aU82kYNYR1kY93FiIMN7lGuRRtJrPsvXfvBjbB7dI9vu4GaPzxAN7L5U0iWb9ns9BtpO+vs9RNjhHKdn9ZOCV0RScdBVgchQQBDteI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706560400; c=relaxed/simple;
	bh=bnTGJwe8XdinvO6q98bjydpdA6WqxDl0wh4e78A7WsM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YgH1bZugbQ2MYFxQRf5R+C+pNWiMGGWOejPNf3qkDFOHJ5MP+7Cu0HJw0XBXfr9H81ZLON4jGuTuLnGozPdyl6MNEPAVtwgWWcLq/Lo1h/xXDQd6zmSOjdK+zxbRCmgVAW8ZRdU9WAQL0aKqrXJPqHC0JkCsZibhZly1ikzNfSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UDv7Y0RG; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UDv7Y0RG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706560398; x=1738096398;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bnTGJwe8XdinvO6q98bjydpdA6WqxDl0wh4e78A7WsM=;
  b=UDv7Y0RGvqI7nbkjvZ1VpS0E9nKb8C88TEGIlMz9mlcRYTOGJCrQ3nHT
   HXlp7olUd9ej6w+I0HcblvBPvCvVNzrFi4GpyMWPl8fDAxgMJ3aGTdNkz
   B63gD0dKpiYo14EccPvhDG/f51edvi9cw7x2OSKMsRBLHnJ4ab1MNziRf
   /EF4K7UfnbE4DKXw3Uigl8QIkQ22gQ4JkbLWmwzKvMX5S2l/uSVxijyGb
   1cgJ7jZt8DuN/AcWbUYQfRckQI0I5D7HI2DW9XxA2DYzNbSB6C25tyxTM
   22HMZQJBydHhRrQaRlyCAfZbxVWmgJGINy/YCzhrKi2DSDfRZxYQOvLAh
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10968"; a="24554834"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="24554834"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jan 2024 12:33:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; 
   d="scan'208";a="29912746"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jan 2024 12:33:14 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rUYJc-0004cf-06;
	Mon, 29 Jan 2024 20:33:12 +0000
Date: Tue, 30 Jan 2024 04:32:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [axboe-block:for-6.9/io_uring 3/7]
 include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant
 expression
Message-ID: <202401300413.rfTmdw4z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git for-6.9/io_uring
head:   fbba031f8e18d90f3e5be8df48dffcc3c4decc41
commit: 0dc648753991d5a48c0b13c869548bd0f97c02b7 [3/7] io_uring: add io_file_can_poll() helper
:::::: branch date: 4 hours ago
:::::: commit date: 17 hours ago
config: i386-randconfig-061-20240129 (https://download.01.org/0day-ci/archive/20240130/202401300413.rfTmdw4z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240130/202401300413.rfTmdw4z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401300413.rfTmdw4z-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   io_uring/splice.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/fs.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/xattr.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/statx.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/sync.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/waitid.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/nop.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/fdinfo.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/advise.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/epoll.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/filetable.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/cancel.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/openclose.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/poll.c: note: in included file (through include/trace/events/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/msg_ring.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/timeout.c: note: in included file (through include/trace/events/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/tctx.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/opdef.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/kbuf.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/sqpoll.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/notif.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/futex.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/uring_cmd.c: note: in included file (through include/linux/io_uring/cmd.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/net.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/io-wq.c: note: in included file (through io_uring/io-wq.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/rsrc.c: note: in included file (through io_uring/io_uring.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/register.c: note: in included file:
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/rw.c: note: in included file (through include/linux/io_uring/cmd.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression
--
   io_uring/io_uring.c: note: in included file (through include/linux/io_uring/cmd.h):
>> include/linux/io_uring_types.h:537:35: sparse: sparse: bad constant expression

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
