Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56F53603D7
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Mar 2026 19:37:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772912227; cv=none; b=Q6g0TDEMjr5lBA5yIKkl1GuBJ1REJta+KUtjcah695uxP+Mj1OEEIzuUw37Ugj3MiGAioNuvl6mekvwsV86ex2jtIOvGYl7eQLXojaRruMlw2+BeVCkea/kPAmQOnOjLjcd7mL6xxZ++SRsHhoezhHkugyzPw1h21AploU65IIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772912227; c=relaxed/simple;
	bh=6qR1RDreGkKwP9C+ULL1GZ7pHr7ucclBZ6I+wjkjSrg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IHYGXXBPjXtrWsen4Wijw9H0DACp5A/p1iPn864l/EgkxbaoC72fMWEX7Y974RujtGgHIsiPPD3HEIq6Te2+wWlEBYqbRyV0pwhwgB4b9xcssoKHZqrUZYH/sK8XufsVyZIQtv/4w4ySqXeX9y+MhyLs+XawH9+fe3JBXoToEao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T0Sh0php; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T0Sh0php"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772912226; x=1804448226;
  h=date:from:to:cc:subject:message-id;
  bh=6qR1RDreGkKwP9C+ULL1GZ7pHr7ucclBZ6I+wjkjSrg=;
  b=T0Sh0php6VHGt1qQ0fK0Ph4VN7dnw/T5dRiIlDR9X+vxVHB6qcfip9sX
   EKv1+NkDKeTkIAWPNdI7jVLcxk5wCb2BrND9i6Rm2CqJpZkv/adneyP7A
   7g5q2eF6QPbk1xJgT4XWCdNQWYWVxkCdR9mzjyXO1v5Xp9eb9lgMu+WPM
   hPOA4993GLRHu7Zd7EBseHW2ZR1hgUzesrm0DsueaROH/pRX52zo+1WgI
   SWsq8a2kisnJiGjM/q+csktFZenr4PppftDhRQkS+UePDEIMg+IBIbXdv
   /GOpqdBlqlSNhXfk+zEqIu9yBbdTCBdZgZL8/o5Zwso6ySLLO5hAsr5CU
   Q==;
X-CSE-ConnectionGUID: 9UJJpnKESaum4mvFFhWjjg==
X-CSE-MsgGUID: QXXjcKDnRP6pGdoiXlc1Zg==
X-IronPort-AV: E=McAfee;i="6800,10657,11722"; a="77869353"
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="77869353"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2026 11:37:05 -0800
X-CSE-ConnectionGUID: 0mCl5pgvR8ma2znR7AqIFw==
X-CSE-MsgGUID: qx83ITugSUKUBeBkxItnYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,107,1770624000"; 
   d="scan'208";a="257252169"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 07 Mar 2026 11:37:04 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vyxSO-000000002aT-3J9X;
	Sat, 07 Mar 2026 19:37:00 +0000
Date: Sun, 08 Mar 2026 03:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 79/471]
 kernel/trace/trace_events_trigger.c:352 event_trigger_regex_write() warn:
 potential spectre issue 'buf' [w]
Message-ID: <202603080352.eQSp12OC-lkp@intel.com>
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
:::::: branch date: 32 hours ago
:::::: commit date: 33 hours ago
config: i386-randconfig-141-20260307 (https://download.01.org/0day-ci/archive/20260308/202603080352.eQSp12OC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603080352.eQSp12OC-lkp@intel.com/

smatch warnings:
kernel/trace/trace_events_trigger.c:352 event_trigger_regex_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace_events.c:2246 event_filter_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace_events.c:2404 subsystem_filter_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace.c:4406 tracing_cpumask_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace.c:4686 tracing_trace_options_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace.c:5688 tracing_set_trace_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace.c:7076 tracing_clock_write() warn: potential spectre issue 'buf' [w]

vim +/buf +352 kernel/trace/trace_events_trigger.c

85f2b08268c014e Tom Zanussi              2013-10-24  331  
a6f509b8ee48800 Jens Axboe               2024-04-08  332  static ssize_t event_trigger_regex_write(struct kiocb *iocb,
a6f509b8ee48800 Jens Axboe               2024-04-08  333  					 struct iov_iter *from)
85f2b08268c014e Tom Zanussi              2013-10-24  334  {
7f1d2f8210195c8 Steven Rostedt (Red Hat  2015-05-05  335) 	struct trace_event_file *event_file;
a6f509b8ee48800 Jens Axboe               2024-04-08  336  	size_t cnt = iov_iter_count(from);
85f2b08268c014e Tom Zanussi              2013-10-24  337  	ssize_t ret;
63c72641683891c Steven Rostedt           2024-12-20  338  	char *buf __free(kfree) = NULL;
85f2b08268c014e Tom Zanussi              2013-10-24  339  
85f2b08268c014e Tom Zanussi              2013-10-24  340  	if (!cnt)
85f2b08268c014e Tom Zanussi              2013-10-24  341  		return 0;
85f2b08268c014e Tom Zanussi              2013-10-24  342  
85f2b08268c014e Tom Zanussi              2013-10-24  343  	if (cnt >= PAGE_SIZE)
85f2b08268c014e Tom Zanussi              2013-10-24  344  		return -EINVAL;
85f2b08268c014e Tom Zanussi              2013-10-24  345  
a6f509b8ee48800 Jens Axboe               2024-04-08  346  	buf = kmalloc(cnt + 1, GFP_KERNEL);
a6f509b8ee48800 Jens Axboe               2024-04-08  347  	if (!buf)
a6f509b8ee48800 Jens Axboe               2024-04-08  348  		return -ENOMEM;
a6f509b8ee48800 Jens Axboe               2024-04-08  349  
a6f509b8ee48800 Jens Axboe               2024-04-08  350  	if (!copy_from_iter_full(buf, cnt, from))
a6f509b8ee48800 Jens Axboe               2024-04-08  351  		return -EFAULT;
a6f509b8ee48800 Jens Axboe               2024-04-08 @352  	buf[cnt] = '\0';
85f2b08268c014e Tom Zanussi              2013-10-24  353  
63c72641683891c Steven Rostedt           2024-12-20  354  	guard(mutex)(&event_mutex);
63c72641683891c Steven Rostedt           2024-12-20  355  
a6f509b8ee48800 Jens Axboe               2024-04-08  356  	event_file = event_file_file(iocb->ki_filp);
63c72641683891c Steven Rostedt           2024-12-20  357  	if (unlikely(!event_file))
85f2b08268c014e Tom Zanussi              2013-10-24  358  		return -ENODEV;
85f2b08268c014e Tom Zanussi              2013-10-24  359  
63c72641683891c Steven Rostedt           2024-12-20  360  	ret = trigger_process_regex(event_file, buf);
85f2b08268c014e Tom Zanussi              2013-10-24  361  	if (ret < 0)
63c72641683891c Steven Rostedt           2024-12-20  362  		return ret;
85f2b08268c014e Tom Zanussi              2013-10-24  363  
a6f509b8ee48800 Jens Axboe               2024-04-08  364  	iocb->ki_pos += cnt;
63c72641683891c Steven Rostedt           2024-12-20  365  	return cnt;
85f2b08268c014e Tom Zanussi              2013-10-24  366  }
85f2b08268c014e Tom Zanussi              2013-10-24  367  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
