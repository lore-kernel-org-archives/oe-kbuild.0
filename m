Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4521213C8FE
	for <oe-kbuild@lists.linux.dev>; Tue, 23 Jul 2024 06:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721715922; cv=none; b=phieXroovvyVIrI5WXYfihGjsjbbhVYla8fmBCwl6x8nwJadeyTyvyiuAdaLFJSrtGeGCMpwiNi++VlbpfTKSQgz4aHNLNMi/AM72eRni+L4qErwn7RbBYyBxvpynNZ9LjP52vqFTwimG8h0UAPM0WEYrhDPpsD4qRcWuq1AF9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721715922; c=relaxed/simple;
	bh=jj6PmKKi+P5t4PSGKTQMRRkUiixhCzQR5wCoJcy6Sfc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cjsaZprUkyM2yXzZ1KtfqyQa1hrqWYqJRIb+BTKsI/YP+XeSDBHGtg/QCbK8p2OxbmOncSXUffH8QzQFrte6Ntud5CF9gAGB3QD3abY3/tNPjorsX93UWJXtOGGJ9fi+0SQ7kcO5mbB0YQ20QeQy2Xu7GkIT2Pi9y80w+XIqvdo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLhH8WdX; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLhH8WdX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721715921; x=1753251921;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jj6PmKKi+P5t4PSGKTQMRRkUiixhCzQR5wCoJcy6Sfc=;
  b=bLhH8WdXISlO8+btQc9Dgpm3v0JBx47qkCtQEKsDAK6ktFIPMcKJRyir
   A8LFs3387+cAHZ/5Jd2T5OxfQ/IlRFpY/iWDM9WUgkjx3LhWIYtKdc5VI
   oe+Qq8IQGAd9hLXm2jwlet/YDFk4rFwgVNi/LPSsZ3ecLawHAfz+gpgWh
   zqXaJay/NpEQ3Qe28EVO4nBQQwv6ohsdHu/g7XCezVLzREHOAF8M2flUs
   g6ZRUGyjABqYmP2M0fqnJEkU1xAsyrdB6bSP4UeSlV3HxwCkVTlyXKad4
   O0eUSvvoBkVQQJ31x9vy43XQUmONRbJqgllQVrNdwNk0v8HZO5kmREBDJ
   w==;
X-CSE-ConnectionGUID: CNdL+POfQ9y+D/QEXhrQQA==
X-CSE-MsgGUID: NfBH29lTSTCNDcelzaiNEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11141"; a="30706031"
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="30706031"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2024 23:25:20 -0700
X-CSE-ConnectionGUID: nVyXwYpaRJSyYqnffj45vA==
X-CSE-MsgGUID: Mlz8XQFYTq6ZUtG5wzCQaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,230,1716274800"; 
   d="scan'208";a="52018401"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 22 Jul 2024 23:25:18 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sW8xY-000lhs-20;
	Tue, 23 Jul 2024 06:25:16 +0000
Date: Tue, 23 Jul 2024 14:24:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 13299/13550]
 drivers/gpu/drm/xe/xe_guc_submit.c:1417 guc_exec_queue_process_msg() error:
 dereferencing freed memory 'msg'
Message-ID: <202407231445.rpisd1vA-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Matthew Brost <matthew.brost@intel.com>
CC: Matthew Auld <matthew.auld@intel.com>
CC: Nirmoy Das <nirmoy.das@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2347b4c79f5e6cd3f4996e80c2d3c15f53006bf5
commit: d930c19fdff3109e97b610fa10943b7602efcabd [13299/13550] drm/xe: Build PM into GuC CT layer
:::::: branch date: 2 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240722 (https://download.01.org/0day-ci/archive/20240723/202407231445.rpisd1vA-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202407231445.rpisd1vA-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_guc_submit.c:1417 guc_exec_queue_process_msg() error: dereferencing freed memory 'msg'

vim +/msg +1417 drivers/gpu/drm/xe/xe_guc_submit.c

dd08ebf6c3525a Matthew Brost   2023-03-30  1395  
9b9529ce379a08 Francois Dugast 2023-07-31  1396  static void guc_exec_queue_process_msg(struct xe_sched_msg *msg)
dd08ebf6c3525a Matthew Brost   2023-03-30  1397  {
dd08ebf6c3525a Matthew Brost   2023-03-30  1398  	trace_xe_sched_msg_recv(msg);
dd08ebf6c3525a Matthew Brost   2023-03-30  1399  
dd08ebf6c3525a Matthew Brost   2023-03-30  1400  	switch (msg->opcode) {
dd08ebf6c3525a Matthew Brost   2023-03-30  1401  	case CLEANUP:
9b9529ce379a08 Francois Dugast 2023-07-31  1402  		__guc_exec_queue_process_msg_cleanup(msg);
dd08ebf6c3525a Matthew Brost   2023-03-30  1403  		break;
dd08ebf6c3525a Matthew Brost   2023-03-30  1404  	case SET_SCHED_PROPS:
9b9529ce379a08 Francois Dugast 2023-07-31  1405  		__guc_exec_queue_process_msg_set_sched_props(msg);
dd08ebf6c3525a Matthew Brost   2023-03-30  1406  		break;
dd08ebf6c3525a Matthew Brost   2023-03-30  1407  	case SUSPEND:
9b9529ce379a08 Francois Dugast 2023-07-31  1408  		__guc_exec_queue_process_msg_suspend(msg);
dd08ebf6c3525a Matthew Brost   2023-03-30  1409  		break;
dd08ebf6c3525a Matthew Brost   2023-03-30  1410  	case RESUME:
9b9529ce379a08 Francois Dugast 2023-07-31  1411  		__guc_exec_queue_process_msg_resume(msg);
dd08ebf6c3525a Matthew Brost   2023-03-30  1412  		break;
dd08ebf6c3525a Matthew Brost   2023-03-30  1413  	default:
99fea682887938 Francois Dugast 2023-07-27  1414  		XE_WARN_ON("Unknown message type");
dd08ebf6c3525a Matthew Brost   2023-03-30  1415  	}
d930c19fdff310 Matthew Brost   2024-07-19  1416  
d930c19fdff310 Matthew Brost   2024-07-19 @1417  	xe_pm_runtime_put(guc_to_xe(exec_queue_to_guc(msg->private_data)));
dd08ebf6c3525a Matthew Brost   2023-03-30  1418  }
dd08ebf6c3525a Matthew Brost   2023-03-30  1419  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
