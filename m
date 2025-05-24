Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8877E1DF27C
	for <oe-kbuild@lists.linux.dev>; Sat, 24 May 2025 12:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748088119; cv=none; b=UwgFP3HW9ejDRb7JJsBZ6n55qz8DM8AHZVm4lWxNc9f1H4Xsook8WvnvBJ0WBCfFfy7lDG9eTFhC2NJIewAFg5HS0z9pW3IVvQPi0QCq8Ovrl31czvNygdDU8Bif8mSbXU+a7yh4WceqyHr9ZRm1VLR8Yeye8qYKsrjRSECJ0RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748088119; c=relaxed/simple;
	bh=YVVyO0hOlORrFt/BT/hosyyka3ebRJTnOIX5F07jYjU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YyBECYgk3y/HG6SOHTeJep1YErHwwDAEH4rvR8LCPY7Moyn5khb6Psw7elhV/b2Ur5A7M0s+yZyKMcvzDH1ojKISxOLsG1g8ttb7dIXSyJudEmu9nySOD1nXfDPcY6BUEpw8FQ4xTrLqmpQpkaNmuRhR42DrpkwwofBkcC72W00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FWrEbxkq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FWrEbxkq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748088117; x=1779624117;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YVVyO0hOlORrFt/BT/hosyyka3ebRJTnOIX5F07jYjU=;
  b=FWrEbxkqFiVzpprOtArigc6B9yACbgnN+nt/VYl3YMXoXizdfRp2mQb1
   w/7arYgTPcind7sGZrs2orI+9KIJquJX0VSLADbEOUG19dQ6EWduuHgtz
   dWo87N2Y53ZXhTPrJArhy3QE3NoIsIuu248Bek9Ud3E8nHNJiYALmwMi+
   IM8bn+2jdev7VU43aOaY+twIJ1yTIzxJ3CRGnx/HSkX6AfEE05k69xY7R
   kMHxkjo4iSkLJZhwkqmHdJDUDh+W4lerJGQlvjchTDyZaErFOz51BifXy
   VALPaeRjsdALr81bnOKtKAQtHa1AlY3mFTPeDOOUKXq1wXcTUMmRjePhN
   A==;
X-CSE-ConnectionGUID: ObV3aE20REe8kRDIf7aPyw==
X-CSE-MsgGUID: hQ6c/vzDSzWb/Wms6v0byg==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50017502"
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="50017502"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 05:01:52 -0700
X-CSE-ConnectionGUID: bAB9OpS1RNqReY9Nx8xSJg==
X-CSE-MsgGUID: GyZ6xnVqToWm0dedX7mIfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,311,1739865600"; 
   d="scan'208";a="142103821"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 May 2025 05:01:51 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uInZU-000RBA-2k;
	Sat, 24 May 2025 12:01:48 +0000
Date: Sat, 24 May 2025 20:01:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kkdwivedi:stream 1/11] kernel/bpf/stream.c:495
 bpf_stream_stage_commit() error: uninitialized symbol 'tail'.
Message-ID: <202505241934.jY0Mju3X-lkp@intel.com>
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
TO: Kumar Kartikeya Dwivedi <memxor@gmail.com>

tree:   https://github.com/kkdwivedi/linux stream
head:   45b1ebde95a6ff0d5316fa8493d803dbbf7ded9a
commit: 531820088002848fa05840a8f2700e8aae957fac [1/11] bpf: Introduce BPF standard streams
:::::: branch date: 11 hours ago
:::::: commit date: 5 days ago
config: riscv-randconfig-r071-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241934.jY0Mju3X-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505241934.jY0Mju3X-lkp@intel.com/

smatch warnings:
kernel/bpf/stream.c:495 bpf_stream_stage_commit() error: uninitialized symbol 'tail'.

vim +/tail +495 kernel/bpf/stream.c

53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  470  
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  471  int bpf_stream_stage_commit(struct bpf_stream_stage *ss, struct bpf_prog *prog,
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  472  			    enum bpf_stream_id stream_id)
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  473  {
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  474  	struct llist_node *list, *head, *tail;
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  475  	struct bpf_stream *stream;
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  476  	int ret;
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  477  
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  478  	stream = bpf_stream_get(stream_id, prog->aux);
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  479  	if (!stream)
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  480  		return -EINVAL;
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  481  
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  482  	ret = bpf_stream_consume_capacity(stream, ss->len);
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  483  	if (ret)
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  484  		return ret;
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  485  
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  486  	list = llist_del_all(&ss->log);
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  487  	head = list;
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  488  
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  489  	if (!list)
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  490  		return 0;
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  491  	while (llist_next(list)) {
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  492  		tail = llist_next(list);
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  493  		list = tail;
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20  494  	}
53182008800284 Kumar Kartikeya Dwivedi 2025-03-20 @495  	llist_add_batch(head, tail, &stream->log);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
