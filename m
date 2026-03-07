Received: from mgamail.intel.com (unknown [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D42E346798
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 11:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772884768; cv=none; b=KsCBWDMIvkkvWLTH2gTnvze+UrU1CSuLcgfJ2wlZo59HZ94w6sj+8kmWkOo542K6vswqyfVtTzCM61XSuo0Tmp+sSiH+4IBZ3Z1qvED0aK9459bVsBy3A5KmNFxgIROXgalP0bzjDt4fxlwu1f0pmA838nQlfV4rFtOLT2Rq0NU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772884768; c=relaxed/simple;
	bh=fRqn2wf8nDCnXGndpEJd6spGT977KZnKYpMifdAeMJ0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dc7fvmcjJuDPkt/i85l6keyZe7D5+jE/M+GWK1bw36tpIR3FwFvvoEqGAqOSIa4ep7oh9zNMMwIydexwHEBtLXjOtKiR0wFYPaoBithMgKmZ7S2CdLxl8+XKPEEKCG0+751OnFuqvazdST/zKbdp/7sLOh5gaaZxCCvb6FSOee0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4hLAbwl; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4hLAbwl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772884761; x=1804420761;
  h=date:from:to:cc:subject:message-id;
  bh=fRqn2wf8nDCnXGndpEJd6spGT977KZnKYpMifdAeMJ0=;
  b=M4hLAbwl/s+rlNhaheViLBPtxPXSP+FMxqxQZI6/fBBrMFTyR/Jc8E5J
   bmWLO23bKccJIk1+5HVPHCwr14YYR6MQy4a9+bdbGXRAxmg7oK2scqK+D
   h16V1v3Hlc6Tz5yylxAhUHlde9tcp2ERFODaYY3fPm89hV7fkZWz/0rx+
   bdtkZo4/NFi02VLbr1kZ7nbIoL5gEpXMTIARcu2DrAaWDgH1SUvwzGtcy
   yO9XqerLSlxvezsyJUCnlDpDx/8XCph4LSGzWUODNZVghR7j8qM8yc2ce
   A9++27qhYNnnwYxI8Z752URMNxmxjCBIFP3VqFrPr831nXTxIKen8/crh
   A==;
X-CSE-ConnectionGUID: NXSDW5oITaO9RRuskGUldw==
X-CSE-MsgGUID: Ew3wPhQbQ66gekw3iBuYUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="85453216"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="85453216"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 03:59:13 -0800
X-CSE-ConnectionGUID: mw/dXNKQQvGRSXaYBX+14g==
X-CSE-MsgGUID: RCl3gwctQXO1DNu1X2QNwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="219246188"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 Mar 2026 03:59:12 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyqJI-000000001xT-3gDi;
	Sat, 07 Mar 2026 11:59:08 +0000
Date: Sat, 07 Mar 2026 19:58:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 79/471]
 kernel/trace/trace_events_trigger.c:352 event_trigger_regex_write() warn:
 potential spectre issue 'buf' [w]
Message-ID: <202603071945.ARnqYo0G-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   0a49759be1c3b29207758e467fdc1a90d0716d06
commit: a6f509b8ee48800a6cc81a95554783bf4412a23a [79/471] tracing: convert to read/write iterators
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: i386-randconfig-141-20260307 (https://download.01.org/0day-ci/archive/20260307/202603071945.ARnqYo0G-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603071945.ARnqYo0G-lkp@intel.com/

smatch warnings:
kernel/trace/trace_events_trigger.c:352 event_trigger_regex_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace_events.c:2246 event_filter_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace_events.c:2404 subsystem_filter_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace.c:4406 tracing_cpumask_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace.c:4686 tracing_trace_options_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace.c:5688 tracing_set_trace_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace.c:7076 tracing_clock_write() warn: potential spectre issue 'buf' [w]

vim +/buf +352 kernel/trace/trace_events_trigger.c

85f2b08268c014 Tom Zanussi              2013-10-24  331  
a6f509b8ee4880 Jens Axboe               2024-04-08  332  static ssize_t event_trigger_regex_write(struct kiocb *iocb,
a6f509b8ee4880 Jens Axboe               2024-04-08  333  					 struct iov_iter *from)
85f2b08268c014 Tom Zanussi              2013-10-24  334  {
7f1d2f8210195c Steven Rostedt (Red Hat  2015-05-05  335) 	struct trace_event_file *event_file;
a6f509b8ee4880 Jens Axboe               2024-04-08  336  	size_t cnt = iov_iter_count(from);
85f2b08268c014 Tom Zanussi              2013-10-24  337  	ssize_t ret;
63c72641683891 Steven Rostedt           2024-12-20  338  	char *buf __free(kfree) = NULL;
85f2b08268c014 Tom Zanussi              2013-10-24  339  
85f2b08268c014 Tom Zanussi              2013-10-24  340  	if (!cnt)
85f2b08268c014 Tom Zanussi              2013-10-24  341  		return 0;
85f2b08268c014 Tom Zanussi              2013-10-24  342  
85f2b08268c014 Tom Zanussi              2013-10-24  343  	if (cnt >= PAGE_SIZE)
85f2b08268c014 Tom Zanussi              2013-10-24  344  		return -EINVAL;
85f2b08268c014 Tom Zanussi              2013-10-24  345  
a6f509b8ee4880 Jens Axboe               2024-04-08  346  	buf = kmalloc(cnt + 1, GFP_KERNEL);
a6f509b8ee4880 Jens Axboe               2024-04-08  347  	if (!buf)
a6f509b8ee4880 Jens Axboe               2024-04-08  348  		return -ENOMEM;
a6f509b8ee4880 Jens Axboe               2024-04-08  349  
a6f509b8ee4880 Jens Axboe               2024-04-08  350  	if (!copy_from_iter_full(buf, cnt, from))
a6f509b8ee4880 Jens Axboe               2024-04-08  351  		return -EFAULT;
a6f509b8ee4880 Jens Axboe               2024-04-08 @352  	buf[cnt] = '\0';
85f2b08268c014 Tom Zanussi              2013-10-24  353  
63c72641683891 Steven Rostedt           2024-12-20  354  	guard(mutex)(&event_mutex);
63c72641683891 Steven Rostedt           2024-12-20  355  
a6f509b8ee4880 Jens Axboe               2024-04-08  356  	event_file = event_file_file(iocb->ki_filp);
63c72641683891 Steven Rostedt           2024-12-20  357  	if (unlikely(!event_file))
85f2b08268c014 Tom Zanussi              2013-10-24  358  		return -ENODEV;
85f2b08268c014 Tom Zanussi              2013-10-24  359  
63c72641683891 Steven Rostedt           2024-12-20  360  	ret = trigger_process_regex(event_file, buf);
85f2b08268c014 Tom Zanussi              2013-10-24  361  	if (ret < 0)
63c72641683891 Steven Rostedt           2024-12-20  362  		return ret;
85f2b08268c014 Tom Zanussi              2013-10-24  363  
a6f509b8ee4880 Jens Axboe               2024-04-08  364  	iocb->ki_pos += cnt;
63c72641683891 Steven Rostedt           2024-12-20  365  	return cnt;
85f2b08268c014 Tom Zanussi              2013-10-24  366  }
85f2b08268c014 Tom Zanussi              2013-10-24  367  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
