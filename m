Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AED519DF6A
	for <oe-kbuild@lists.linux.dev>; Tue, 15 Jul 2025 11:36:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752579363; cv=none; b=DZww+db0leG7yEdG9MiKiFKEyVbd8+BXrIKaH2N13krQgv9vSsHchBNjpFE12mTnvRAwge3Rb2lZJgg0YHM1p8ovooIPCy1W/XPuuOm93MO3GSlFY9Xr0ZkI2CkLUgdZMp6Kr8dAKfwMOfnTnb3fisxIOJJYIlX1yN507t2VKG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752579363; c=relaxed/simple;
	bh=nXk4LlQhRhNuRUK+0QooYNLCzYfYQbFYszuyzYKqdFA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZCOI0BuPnBPJmKJ3EEp6oEbuSH4TnJRAA8NlGDrURQZzdm6q1koc4zWrsWthqsIytn0vJEAdZvLxNPwqd5aQzi8h6EXJaq6N/yt9nDkCCqKn5Pm/bTMRZwhxOsJ83jGYnztoDNVNiAPW63x77lXUWBetZ3/KSkxIZbaf4mT/s0o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GeJ9gxo4; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GeJ9gxo4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752579361; x=1784115361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nXk4LlQhRhNuRUK+0QooYNLCzYfYQbFYszuyzYKqdFA=;
  b=GeJ9gxo4uZMlBFX8jc9Z4kVIPOoKXR933VfGY1iT7PrMhq/fdEC/iieQ
   nWlExi16xGEenpQ8Vm1PZ6MkZXnznLiF5zIrNg7PvQeetjSEXRGmZlKbZ
   qKarWIIrZOtwVPiSXcMUsuVUdKbPqYtriyIBClCpTGvDEsOnILkAvZ437
   DZTTMUh5e7VGoM+J1TDnKCdUoOinBiq/D+xOu0eJVbl+n9cMQqc2DIlrb
   m0klyPevyiMQem03krk9+qIvTZWEPLVHaPbRMxD9ZBgoK0e3MShu5PUHf
   A+7syTPa90qY+xaSI9mfDFWfdjfwpd34RM29Jcfrjw/eN2t1/QbWIL75D
   A==;
X-CSE-ConnectionGUID: 5OflwgABTvW0AP2HbrzDFQ==
X-CSE-MsgGUID: B5R2Mw4/TgCl2FLj8izTqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="58602986"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="58602986"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jul 2025 04:36:00 -0700
X-CSE-ConnectionGUID: Z7/DQB1QQ3uE3D+Nynn/6g==
X-CSE-MsgGUID: 9X3+TOEFTOiFgRAGYO36UQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; 
   d="scan'208";a="157554219"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Jul 2025 04:36:00 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubdwz-000A0n-2s;
	Tue, 15 Jul 2025 11:35:57 +0000
Date: Tue, 15 Jul 2025 19:35:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [avpatel:riscv_trace_support_v1 71/79]
 drivers/firmware/riscv/riscv_sse.c:721 sse_ghes_handler() error: we
 previously assumed 'cb' could be null (see line 722)
Message-ID: <202507151955.ROdqPmHz-lkp@intel.com>
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
TO: Himanshu Chauhan <hchauhan@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v1
head:   bbedafbba85a78dae84bbf5a5844aaab3934e316
commit: ae56cba8914ba82cf6b3318415e12a3795dcb5c9 [71/79] riscv: Add functions to register ghes having SSE notification
:::::: branch date: 27 hours ago
:::::: commit date: 28 hours ago
config: riscv-randconfig-r072-20250715 (https://download.01.org/0day-ci/archive/20250715/202507151955.ROdqPmHz-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507151955.ROdqPmHz-lkp@intel.com/

New smatch warnings:
drivers/firmware/riscv/riscv_sse.c:721 sse_ghes_handler() error: we previously assumed 'cb' could be null (see line 722)

Old smatch warnings:
drivers/firmware/riscv/riscv_sse.c:489 sse_event_register() error: uninitialized symbol 'preferred_hart'.

vim +/cb +721 drivers/firmware/riscv/riscv_sse.c

ae56cba8914ba8 Himanshu Chauhan 2025-02-27  715  
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  716  static int sse_ghes_handler(u32 event_num, void *arg, struct pt_regs *regs)
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  717  {
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  718  	struct sse_ghes_event_data *ev_data = arg;
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  719  	struct sse_ghes_callback *cb = NULL;
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  720  
ae56cba8914ba8 Himanshu Chauhan 2025-02-27 @721  	list_for_each_entry(cb, &ev_data->callback_list, head) {
ae56cba8914ba8 Himanshu Chauhan 2025-02-27 @722  		if (cb && cb->ghes && cb->callback) {
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  723  			cb->callback(ev_data->event_num, cb->ghes, regs);
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  724  		}
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  725  	}
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  726  
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  727  	return 0;
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  728  }
ae56cba8914ba8 Himanshu Chauhan 2025-02-27  729  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
