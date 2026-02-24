Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2022A37E2F5
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Feb 2026 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771936374; cv=none; b=g7NBh6cCTRkpDeqPWEDv0NvdhbbPF51KOQOZAZvkTTjuwZI9zMaPuzMlWBSsX1LFTk6hnEeS8EQUUSMQ6DtXuwLesOskOqZX0eRGbZV+jKkM7Pv0wyYe5S1slLfFkWbNs2HyxGbwL12Qwe3BqvNmwjgjt2ZIaWxaFqtGR1YIb0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771936374; c=relaxed/simple;
	bh=xux4dlMXfWf+ChcdO7QL6ds0aGLMI5He/mpduqmr014=;
	h=Date:From:To:Cc:Subject:Message-ID; b=L+2XE+EdxxlFrgWkKnWueIuZfdo8SlukXWpJnYHS0B5mtkHrqfko/GVmDLlf9a81t5Dx+3I6gVDXKUnIulcZnDKk7qv1Xl0/ljOSsg97mVEwF3eT9to5928bX9DO6MzAoIPxN6qwLBumu91d9doUZRyFsqcuSSgl5FscD++iL60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fgS/XpyV; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fgS/XpyV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771936373; x=1803472373;
  h=date:from:to:cc:subject:message-id;
  bh=xux4dlMXfWf+ChcdO7QL6ds0aGLMI5He/mpduqmr014=;
  b=fgS/XpyVv8ntfy3sAriKWk7rVfwZxfhU55zofzXj0O7Wk6wboiUsiTLi
   wHU0j0Z1v5Gu32RQOgJkJGoxTCiJmYFOrzWi224J1T6P3f6qnw2cHoa8x
   qsD59CYmrhsy89d8tTKP+bMEnA1+Yo63StODqFjRfP5CSFRvvOKehvgvy
   /SimhKYI3sZXx8kySd5/i8o5jaqMZ6GHsi5+uyfeFv3ky+W9p6WRoiCsV
   /j3Nj7OsliPyvRnA1V7KBqvf4YYE/80yjVZP56kw914ujwnMQWogn0LWv
   Sf1kSS2mNY/8933pgmwa9oCS4U5indUlVKwaD/+oUde7R4R+nxKbiVdRx
   g==;
X-CSE-ConnectionGUID: vxrIQfUISnixAio9OJY6xg==
X-CSE-MsgGUID: sF7rZFIJR5qRtLzDTFD0eg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73127722"
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="73127722"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Feb 2026 04:32:45 -0800
X-CSE-ConnectionGUID: GXMN5OKqQoKFeMwZCdl2OA==
X-CSE-MsgGUID: MyKK0yYgQF69ZnRQUIbwxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,308,1763452800"; 
   d="scan'208";a="246466226"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 24 Feb 2026 04:32:38 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuraP-000000001wL-0YtD;
	Tue, 24 Feb 2026 12:32:24 +0000
Date: Tue, 24 Feb 2026 20:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [avpatel:riscv_trace_support_v3 30/49]
 drivers/firmware/riscv/riscv_sbi_sse.c:720:6-8: ERROR: iterator variable
 bound on line 719 cannot be NULL
Message-ID: <202602242019.lkBcb1eW-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
CC: Anup Patel <anup@brainfault.org>

tree:   https://github.com/avpatel/linux.git riscv_trace_support_v3
head:   cb6e52a5cb2529ad7d25344f6c6eaea3b3b9a13a
commit: ab09840bca500d501650d79239ebbbbfbe1a553f [30/49] riscv: Add functions to register ghes having SSE notification
:::::: branch date: 6 hours ago
:::::: commit date: 7 hours ago
config: riscv-randconfig-r064-20260224 (https://download.01.org/0day-ci/archive/20260224/202602242019.lkBcb1eW-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602242019.lkBcb1eW-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/riscv/riscv_sbi_sse.c:720:6-8: ERROR: iterator variable bound on line 719 cannot be NULL

vim +720 drivers/firmware/riscv/riscv_sbi_sse.c

ab09840bca500d Himanshu Chauhan 2026-01-02  713  
ab09840bca500d Himanshu Chauhan 2026-01-02  714  static int sse_ghes_handler(u32 event_num, void *arg, struct pt_regs *regs)
ab09840bca500d Himanshu Chauhan 2026-01-02  715  {
ab09840bca500d Himanshu Chauhan 2026-01-02  716  	struct sse_ghes_event_data *ev_data = arg;
ab09840bca500d Himanshu Chauhan 2026-01-02  717  	struct sse_ghes_callback *cb = NULL;
ab09840bca500d Himanshu Chauhan 2026-01-02  718  
ab09840bca500d Himanshu Chauhan 2026-01-02 @719  	list_for_each_entry(cb, &ev_data->callback_list, head) {
ab09840bca500d Himanshu Chauhan 2026-01-02 @720  		if (cb && cb->ghes && cb->callback) {
ab09840bca500d Himanshu Chauhan 2026-01-02  721  			cb->callback(ev_data->event_num, cb->ghes, regs);
ab09840bca500d Himanshu Chauhan 2026-01-02  722  		}
ab09840bca500d Himanshu Chauhan 2026-01-02  723  	}
ab09840bca500d Himanshu Chauhan 2026-01-02  724  
ab09840bca500d Himanshu Chauhan 2026-01-02  725  	return 0;
ab09840bca500d Himanshu Chauhan 2026-01-02  726  }
ab09840bca500d Himanshu Chauhan 2026-01-02  727  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
