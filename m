Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4AC182
	for <oe-kbuild@lists.linux.dev>; Fri, 19 Jan 2024 00:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705623869; cv=none; b=P5FTfwAE9ZggsjqprvyE3/7i5zBmjQFPK79XsCTMVZUQ9uv7pv9xDgdHBOUzYJjVdU1YXwnhkcF2lXM28Cdp1UOvwEIXaeXdOlWUg7GlfMZqCav/RHsaB2S1nerWyI1KqASuGmyyJ4Q3Bri3Q7aWXNIhDVoOV63aexein/gadrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705623869; c=relaxed/simple;
	bh=CSFlxX2LVP801APrk3HZpfvod+Oo43pcYG64ZEzt4Xc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j5ewF4ZJRV2NEq9L0396QBvO+hxbPKGG/3xY0+0mz03sO9TqRjG5ahezDnjL/w8KB9KFK1B5HCMa48Fnc6vwnu0K2M+rTyIDxipqUq3q9S1QeO0yuPINkSLXVJGAbqX97cDA/n+X6r95ehnL8K8dZMm3TR35SUccpgL0XdjFMpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G2TgJ5Nt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G2TgJ5Nt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705623867; x=1737159867;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSFlxX2LVP801APrk3HZpfvod+Oo43pcYG64ZEzt4Xc=;
  b=G2TgJ5Nt2QuHwqovJ8nwuu+MtyZKsrWmzl5SZhbmqicpJgZdEkDZajop
   PuPKWo3f5uZnCfrb8jJKpdlThbadFb9OYJeKKrxe84YUzQ34zhHB7fa4Q
   slHIMJnjfDHhIdPCZKI93sa2jycK0dft81odvGAJTYAWEKzbmGULx8d4O
   VYfLwZ59S6no+ujvrA1B3smaQKh7hirvObPCEqXnGleTEmNrSMesJsDKJ
   fcBMh0x9jehTaopXHHp+5VvHixr7o7ArCwHohb2P+Bl1MTurxEkxHt6hk
   pc/+XguFCQMLQWKAV8Wh4d4OcSuywKHCQIKBDm1uwT7uLJTQdhIRWydJC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="506458"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="506458"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2024 16:22:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="928268589"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="928268589"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 18 Jan 2024 16:22:37 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rQceZ-0003SS-1q;
	Fri, 19 Jan 2024 00:22:35 +0000
Date: Fri, 19 Jan 2024 08:22:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [arm-integrator:b4/arm32-cfi 3/6]
 kernel/trace/fgraph.c:688:undefined reference to `ftrace_stub_graph'
Message-ID: <202401190810.GrVv0sJj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git b4/arm32-cfi
head:   98f7bb8c9f58d28851e6bdf4365ac7674abd4963
commit: 44079882dc3b1b966feed92c0938e0f59d970a3f [3/6] ARM: Support CLANG CFI
:::::: branch date: 10 hours ago
:::::: commit date: 2 days ago
config: arm-bcm2835_defconfig (https://download.01.org/0day-ci/archive/20240119/202401190810.GrVv0sJj-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240119/202401190810.GrVv0sJj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202401190810.GrVv0sJj-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/trace/fgraph.o: in function `unregister_ftrace_graph':
>> kernel/trace/fgraph.c:688:(.text+0x80c): undefined reference to `ftrace_stub_graph'
>> arm-linux-gnueabi-ld: kernel/trace/fgraph.o:kernel/trace/fgraph.c:400:(.data+0xc): undefined reference to `ftrace_stub_graph'


vim +688 kernel/trace/fgraph.c

e73e679f656e67 Steven Rostedt (VMware  2018-11-15  671) 
688f7089d8851b Steven Rostedt (VMware  2018-11-15  672) void unregister_ftrace_graph(struct fgraph_ops *gops)
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  673) {
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  674) 	mutex_lock(&ftrace_lock);
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  675) 
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  676) 	if (unlikely(!ftrace_graph_active))
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  677) 		goto out;
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  678) 
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  679) 	ftrace_graph_active--;
46f9469247c6f4 Steven Rostedt (VMware  2019-11-18  680) 	ftrace_graph_return = ftrace_stub_graph;
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  681) 	ftrace_graph_entry = ftrace_graph_entry_stub;
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  682) 	__ftrace_graph_entry = ftrace_graph_entry_stub;
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  683) 	ftrace_shutdown(&graph_ops, FTRACE_STOP_FUNC_RET);
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  684) 	unregister_pm_notifier(&ftrace_suspend_notifier);
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  685) 	unregister_trace_sched_switch(ftrace_graph_probe_sched_switch, NULL);
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  686) 
e73e679f656e67 Steven Rostedt (VMware  2018-11-15  687)  out:
e73e679f656e67 Steven Rostedt (VMware  2018-11-15 @688) 	mutex_unlock(&ftrace_lock);

:::::: The code at line 688 was first introduced by commit
:::::: e73e679f656e678b0e7f8961094201f3544f4541 fgraph: Move function graph specific code into fgraph.c

:::::: TO: Steven Rostedt (VMware) <rostedt@goodmis.org>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
