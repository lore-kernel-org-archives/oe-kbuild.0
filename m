Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE872A1AA
	for <oe-kbuild@lists.linux.dev>; Fri,  2 May 2025 02:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746154035; cv=none; b=A8VpdoWdM2IYQ2KMGwdFYrFZ5KtjfiHWfg4rsKyk6+An78zvNJna2sldTPU0RUpNC0dOojBJu6jnYEtAQ+8+Um0VK0quNBaSqm0weKbzhQ+vSl2aCgVP8SHxdv7a/fXY/O7qBLmFAza3MjRvvdvQs1/+kEY99ci6SL1rLuesyKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746154035; c=relaxed/simple;
	bh=FL5CFWexiRyKGoT+l2sqHfo1OzXDsoVtEVJGGWsx2vU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q6Szd+T2oQ3XPUIbwUCI161Dz2Wa/jPBNZNBpOryucFSCRjeH3Q3OxP8TtPZpW4Ohyl+GnzDzry22An2GGdSEMeEwrn0q6OwYMuMWqBEkVZYQJIix3/GrAr7wXB5XQ9DarqW7lst6g8pi9X9tdaFSJIh/30QgfCVCJZcJwIO+xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MG23Ow3X; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MG23Ow3X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746154034; x=1777690034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FL5CFWexiRyKGoT+l2sqHfo1OzXDsoVtEVJGGWsx2vU=;
  b=MG23Ow3XAiD70HRiLpPvU7N5PsJH2dyFEcotppodnICQapKnBlcy3key
   zKOIyYuPxG/HnfBxyFefnrrfpEyi/cHofo3QwYYwH+pSi8ihrQhgag2TV
   yK/7mcumDN+GeVN6vXGF832qoTW3d/RcdEuMNTzbnK6JSWkI4a8Q02go4
   G3mAXhLBZ9d2Gr0sbrW0ZBBR2C3rggF3IYl04hwJeXLhc4FKGix/vXqho
   50QPnQiiHOuW4+E5Kiwp5vRldDq1e+rV/8l1fYR2QSYuM4ftHzttatgTj
   /j/eLwNyYl4D9Hd0ReD1SQAp9fXDXC5enodKZMYQp8mHD1lqw7c5ndGHH
   A==;
X-CSE-ConnectionGUID: N1drQQOAQgi+OzobyFDAEw==
X-CSE-MsgGUID: I+g5WuDyQmeJ5BJKNcEe2A==
X-IronPort-AV: E=McAfee;i="6700,10204,11420"; a="47847339"
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="47847339"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 May 2025 19:47:13 -0700
X-CSE-ConnectionGUID: 3esJltTpSoS9xInRABDY/Q==
X-CSE-MsgGUID: m9GiEY9eQK6aSBQIklLU2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,255,1739865600"; 
   d="scan'208";a="139680626"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 01 May 2025 19:47:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uAgQf-0004Vd-0I;
	Fri, 02 May 2025 02:47:09 +0000
Date: Fri, 2 May 2025 10:46:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [isilence:tx-tstamp 5/8] io_uring/poll.c:713 io_arm_poll_handler()
 warn: if statement not indented
Message-ID: <202505021022.SUf8vLiH-lkp@intel.com>
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
TO: Pavel Begunkov <asml.silence@gmail.com>

tree:   https://github.com/isilence/linux tx-tstamp
head:   6f5b01cc66b200d99c494caaa62f429268923263
commit: 275ff22a8d4d1524bbf3b6514af8ab291d682a6b [5/8] io_uring/poll: introduce io_arm_apoll()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20250502 (https://download.01.org/0day-ci/archive/20250502/202505021022.SUf8vLiH-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505021022.SUf8vLiH-lkp@intel.com/

smatch warnings:
io_uring/poll.c:713 io_arm_poll_handler() warn: if statement not indented

vim +713 io_uring/poll.c

329061d3e2f9a0 Jens Axboe     2022-05-25  698  
275ff22a8d4d15 Pavel Begunkov 2025-04-27  699  int io_arm_poll_handler(struct io_kiocb *req, unsigned issue_flags)
275ff22a8d4d15 Pavel Begunkov 2025-04-27  700  {
275ff22a8d4d15 Pavel Begunkov 2025-04-27  701  	const struct io_issue_def *def = &io_issue_defs[req->opcode];
275ff22a8d4d15 Pavel Begunkov 2025-04-27  702  	__poll_t mask = POLLPRI | POLLERR | EPOLLET;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  703  
275ff22a8d4d15 Pavel Begunkov 2025-04-27  704  	if (!def->pollin && !def->pollout)
275ff22a8d4d15 Pavel Begunkov 2025-04-27  705  		return IO_APOLL_ABORTED;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  706  	if (!io_file_can_poll(req))
275ff22a8d4d15 Pavel Begunkov 2025-04-27  707  		return IO_APOLL_ABORTED;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  708  
275ff22a8d4d15 Pavel Begunkov 2025-04-27  709  	if (def->pollin) {
275ff22a8d4d15 Pavel Begunkov 2025-04-27  710  		mask |= EPOLLIN | EPOLLRDNORM;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  711  
275ff22a8d4d15 Pavel Begunkov 2025-04-27  712  		/* If reading from MSG_ERRQUEUE using recvmsg, ignore POLLIN */
275ff22a8d4d15 Pavel Begunkov 2025-04-27 @713  		if (req->flags & REQ_F_CLEAR_POLLIN)
275ff22a8d4d15 Pavel Begunkov 2025-04-27  714  		mask &= ~EPOLLIN;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  715  	} else {
275ff22a8d4d15 Pavel Begunkov 2025-04-27  716  		mask |= EPOLLOUT | EPOLLWRNORM;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  717  	}
275ff22a8d4d15 Pavel Begunkov 2025-04-27  718  	if (def->poll_exclusive)
275ff22a8d4d15 Pavel Begunkov 2025-04-27  719  		mask |= EPOLLEXCLUSIVE;
275ff22a8d4d15 Pavel Begunkov 2025-04-27  720  
275ff22a8d4d15 Pavel Begunkov 2025-04-27  721  	return io_arm_apoll(req, issue_flags, mask);
275ff22a8d4d15 Pavel Begunkov 2025-04-27  722  }
275ff22a8d4d15 Pavel Begunkov 2025-04-27  723  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
