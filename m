Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFD332C9D
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Sep 2024 05:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726982060; cv=none; b=DkoYzUupSgh/n95kc7bpNy2T9NKatSRo3suuTtLTCvlY080zVvWN3fLCNr5VvAdInD/Py46sKkwtzRgO3rlgOcoaCXfTYxOuUcXmSY++ryQMTw4EUUs9oLldRhMlHq0S8HiXFeIBfArJ+Hw4Qw3doKdzDbsZ1YSZa477cs4ctZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726982060; c=relaxed/simple;
	bh=LKEFFNgakakZuDJr2zPPCYgi181d8Fn4ckmEOkPI/AM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AAcXy/qIU9LewVCsYFyhfUjU7OOERoLJ8O+mGcpJlDtsu6TaniJv/dRVba3w5hIUdFgDLJz94Q6lgrqnkTxGPpn8cHLAXkuBA68gKU3zfWHicYNPDFKjil+QQ9aWFm9/DOIdTLLAyd3XZ+BHDCmJw5zXSPDJGfhvk2CNXth6quM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=frEmgGAv; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="frEmgGAv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726982058; x=1758518058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LKEFFNgakakZuDJr2zPPCYgi181d8Fn4ckmEOkPI/AM=;
  b=frEmgGAvhstebg6lpYOU0Dzv+QHVL0eVr2al6MPk11DL3pHOE46kpQ+H
   9cKHzs9kO1NEBt0hJ491TOgRpNBTyONYElRzEr9kRzaoIJpJ7Qt7KJyB+
   Sd462KdHMQ2NjFGw3wBWZ2Bw8FtyuDTjUKuabBITYpn6Eemb25p+VWGMi
   maArP+v0WPLF7GOH9iMOUc4Rq47rEYX3RjElFz3ZtIOVQnobJQIx0HT1v
   TkKBa3YnmekX8rhdB0PcnoriZUDEBfeM+udJOFCXG6T15m/l+XTJR//U/
   IyHPHG8ZEOQMXHarkCoKMMC+66Wn15vdMXZXYZepclaOJUxefIeRhTG1T
   w==;
X-CSE-ConnectionGUID: /E4JFxA0QI+hbxt5s1mRRg==
X-CSE-MsgGUID: zw8S5x2FSGm14sazwecy7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="29736142"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="29736142"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 22:14:17 -0700
X-CSE-ConnectionGUID: UZsPvps4T1mnrW0JQFOOYQ==
X-CSE-MsgGUID: KT3O8uNKR0yesn2i5bNzjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="101574153"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 21 Sep 2024 22:14:16 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ssEvF-000G3G-2q;
	Sun, 22 Sep 2024 05:14:13 +0000
Date: Sun, 22 Sep 2024 13:13:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe-block:rw_iter 80/448] kernel/trace/trace_hwlat.c:692
 hwlat_mode_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202409221300.j5vRTDUz-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux-block.git rw_iter
head:   4eb81ae46886ce90863b6f10c4fe8cd45c6719cf
commit: e7cfe6aa9d801c2d160c7926a63f610e8250bbb9 [80/448] tracing: convert to read/write iterators
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20240922 (https://download.01.org/0day-ci/archive/20240922/202409221300.j5vRTDUz-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409221300.j5vRTDUz-lkp@intel.com/

smatch warnings:
kernel/trace/trace_hwlat.c:692 hwlat_mode_write() warn: potential spectre issue 'buf' [w]

vim +/buf +692 kernel/trace/trace_hwlat.c

8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  664  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  665  /**
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  666   * hwlat_mode_write - Write function for "mode" entry
e7cfe6aa9d801c Jens Axboe                 2024-04-08  667   * @iocb: Metadata for IO
e7cfe6aa9d801c Jens Axboe                 2024-04-08  668   * @from: The user buffer that contains the value to write
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  669   *
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  670   * This function provides a write implementation for the "mode" interface
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  671   * to the hardware latency detector. hwlatd has different operation modes.
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  672   * The "none" sets the allowed cpumask for a single hwlatd thread at the
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  673   * startup and lets the scheduler handle the migration. The default mode is
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  674   * the "round-robin" one, in which a single hwlatd thread runs, migrating
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  675   * among the allowed CPUs in a round-robin fashion. The "per-cpu" mode
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  676   * creates one hwlatd thread per allowed CPU.
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  677   */
e7cfe6aa9d801c Jens Axboe                 2024-04-08  678  static ssize_t hwlat_mode_write(struct kiocb *iocb, struct iov_iter *from)
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  679  {
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  680  	struct trace_array *tr = hwlat_trace;
e7cfe6aa9d801c Jens Axboe                 2024-04-08  681  	size_t cnt = iov_iter_count(from);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  682  	const char *mode;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  683  	char buf[64];
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  684  	int ret, i;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  685  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  686  	if (cnt >= sizeof(buf))
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  687  		return -EINVAL;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  688  
e7cfe6aa9d801c Jens Axboe                 2024-04-08  689  	if (!copy_from_iter_full(buf, cnt, from))
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  690  		return -EFAULT;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  691  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22 @692  	buf[cnt] = 0;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  693  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  694  	mode = strstrip(buf);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  695  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  696  	ret = -EINVAL;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  697  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  698  	/*
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  699  	 * trace_types_lock is taken to avoid concurrency on start/stop
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  700  	 * and hwlat_busy.
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  701  	 */
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  702  	mutex_lock(&trace_types_lock);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  703  	if (hwlat_busy)
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  704  		hwlat_tracer_stop(tr);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  705  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  706  	mutex_lock(&hwlat_data.lock);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  707  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  708  	for (i = 0; i < MODE_MAX; i++) {
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  709  		if (strcmp(mode, thread_mode_str[i]) == 0) {
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  710  			hwlat_data.thread_mode = i;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  711  			ret = cnt;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  712  		}
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  713  	}
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  714  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  715  	mutex_unlock(&hwlat_data.lock);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  716  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  717  	if (hwlat_busy)
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  718  		hwlat_tracer_start(tr);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  719  	mutex_unlock(&trace_types_lock);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  720  
e7cfe6aa9d801c Jens Axboe                 2024-04-08  721  	iocb->ki_pos += cnt;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  722  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  723  	return ret;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  724  }
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  725  

:::::: The code at line 692 was first introduced by commit
:::::: 8fa826b7344d6752f5cfd72380d9fe7bd8c6b928 trace/hwlat: Implement the mode config option

:::::: TO: Daniel Bristot de Oliveira <bristot@redhat.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
