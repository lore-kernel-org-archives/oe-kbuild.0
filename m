Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FE83A1E9D
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 05:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766639230; cv=none; b=R9srqx+TWHShP5MF1a1BblJsoYXChUerJqK1y4b+taDmgPNxOnqtBVuwlLxB+nIefy/OFMP4t1zkBSDPxhpa5INqy0WK2hAuUBVFN4+Wuw114SIpxUiNlHw/i99dTiGK/HT29rsnmAABz+FhZgTjplfIZXzCjwbFxyHVKyfWT6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766639230; c=relaxed/simple;
	bh=W2HGpRLY+VaRylU1PLdsRm4EXeyt+hq0MfkJHGAXM9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RoT7s02qmIqwHcEevrrxSZb/6u+DnomqzSWp/mFn6ZHh09mPZfjpm6H0rVnNrT6vlVmmqKY6c0NiWFbYvayM6/vgBXfWrSnz+SsOXyLum9K3JhHLzbtxfjoEVUCcIcuyWKo1kGd4CAEkh6VWP1Zoibl9LkctItUega5TEUFKy1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d4spbJwq; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d4spbJwq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766639228; x=1798175228;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W2HGpRLY+VaRylU1PLdsRm4EXeyt+hq0MfkJHGAXM9M=;
  b=d4spbJwql0Nb1XK3J06rRCv4/vr6NN6ZioYiwbLN7ksVZk9NkVtWys9e
   YSWuqO4JhkVHhge3hmunKMYueniLG/SH/AQw7s8LvQlTzgjdYa2hEA+Lm
   rCQ7PECPuqKIlNDPmJObEHabbBLpO4wKOIchWorbkPyFrngdaqNoAzTjR
   L/30YCtgOSPXREKICT9m47E2mLhIcJdRJr9vvI3RY4QN2LjuatjmwjX9y
   5tYozJu+JgRZpuThKXdSQyUEQNJpagdES/awclaJ8hRxXu3yjDTTLydQD
   Fbfdd52HWvnlxb/KL6jA1MCt7wqEbA7r0gfia+EvUt5iXw/ywkPfX8j8E
   w==;
X-CSE-ConnectionGUID: otLZpfw5S/GVgWBNLFc72g==
X-CSE-MsgGUID: Y5WC/+4oTkylFGG+AWlnpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="68611637"
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="68611637"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2025 21:07:06 -0800
X-CSE-ConnectionGUID: zoNMRWPuT4GoPncKGHlz6Q==
X-CSE-MsgGUID: 0OwRulhwRY+fTUcKx7nRcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,175,1763452800"; 
   d="scan'208";a="204685679"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa004.jf.intel.com with ESMTP; 24 Dec 2025 21:07:05 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYdZ1-000000006UC-2aRw;
	Thu, 25 Dec 2025 05:07:03 +0000
Date: Thu, 25 Dec 2025 06:06:36 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [avpatel:riscv_sbi_dbtr_v2 55/55] breakpoint_test_riscv.c:9:10:
 fatal error: linux/perf_event.h: No such file or directory
Message-ID: <202512250605.yDGMzL6l-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Himanshu Chauhan <hchauhan@ventanamicro.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_sbi_dbtr_v2
head:   99cb6c466559dba2b0011d84701a156c252e7c59
commit: 99cb6c466559dba2b0011d84701a156c252e7c59 [55/55] riscv: Add breakpoint and watchpoint test for riscv
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20251225/202512250605.yDGMzL6l-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251225/202512250605.yDGMzL6l-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202512250605.yDGMzL6l-lkp@intel.com/

Note: the avpatel/riscv_sbi_dbtr_v2 HEAD 99cb6c466559dba2b0011d84701a156c252e7c59 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

>> breakpoint_test_riscv.c:9:10: fatal error: linux/perf_event.h: No such file or directory
       9 | #include <linux/perf_event.h>    /* Definition of PERF_* constants */
         |          ^~~~~~~~~~~~~~~~~~~~
   compilation terminated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
