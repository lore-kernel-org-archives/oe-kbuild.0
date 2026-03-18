Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 842FD30BF67
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 22:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773872440; cv=none; b=nQ6v5Yr4tB7Ykh5IfdwNUIGkNkkdqri9cpi6VEpZ5YaNKtDNKsBfktB7UtW5lM0AQH+Kfky2gB7Z4N+rTHuI/cN5smDMQ58nATeXQ8pvQsCrh6HdXVGazGC7KfKWm7TmmVQewaeTN7R3tsqSZ4vPncEgrucBDjXfXV+tpXjCAwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773872440; c=relaxed/simple;
	bh=700fOd07E11hiq7c6k5WI5Tsp+TycUpzE4E88+Hm8Qo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ekx/SMNHvunvmH1X+3a4tJyRvRtstMzIQFBzd2FvSBbsWLFqbVR97rNKPvjEVCizfuWsXoPN8QF79D42DiuV/JgRQ3h/c2JBncIbieRW5lTHDEpJ8s2BKkx/x0/yKgAGmyJS5Yk58Wgg1XJa2LbUCQFFm3WCJrdjabTxOu6nJY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OxWd1Po9; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OxWd1Po9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773872440; x=1805408440;
  h=date:from:to:cc:subject:message-id;
  bh=700fOd07E11hiq7c6k5WI5Tsp+TycUpzE4E88+Hm8Qo=;
  b=OxWd1Po9KdPipeH6F0Q3MY7PviNicMAji+qCCiXzzIK8CpCo+CmYdEdx
   GClnZcLdMCQUiEKW2Q7hixP+T+CYWfMrj9KY3o47oYndAxqiWp1mQV3mE
   RNyv3SVfkvRvAIGcZkbjdchxwjs0z9+VQgFyUS4qCFNqnrNYWqAPeSoaX
   ublEV9Mv/LQW7Ri6Uk1X+aLMfr+pB7HeC/RImzJ7zhwIHYjP1AdK3+AxA
   lcA6w2bu/QYGnfLWQOzGcTtZ+I31fuplyJZcKXknHLVZYKMzfpUecOlMg
   oTrnmLHCnAptex8g0r4kAFjyznzqXK7fwQYFdCW0KbuEz0IAB+O0hQ0eH
   g==;
X-CSE-ConnectionGUID: RfxuLrrbSym2/khjTPrh6g==
X-CSE-MsgGUID: EGnwBox1TW6LeQ/cQCOFQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="74830758"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="74830758"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 15:20:39 -0700
X-CSE-ConnectionGUID: JmwrK/b7S9aFX5QeU5yoFQ==
X-CSE-MsgGUID: yK4tMISbR1qdinI2ra7S0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="227723805"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 18 Mar 2026 15:20:37 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2zDQ-0000000001o-2yTX;
	Wed, 18 Mar 2026 22:18:58 +0000
Date: Thu, 19 Mar 2026 06:11:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 81/469] kernel/trace/trace_hwlat.c:688
 hwlat_mode_write() warn: potential spectre issue 'buf' [w]
Message-ID: <202603190538.j8qxjqms-lkp@intel.com>
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
head:   8714e89472ed6fb6cf9acdcc6ea34fe7154ac7af
commit: c418e1be84442f6286d218572f50889d84eec30f [81/469] tracing: convert to read/write iterators
:::::: branch date: 4 hours ago
:::::: commit date: 19 hours ago
config: openrisc-randconfig-r071-20260318 (https://download.01.org/0day-ci/archive/20260319/202603190538.j8qxjqms-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603190538.j8qxjqms-lkp@intel.com/

smatch warnings:
kernel/trace/trace_hwlat.c:688 hwlat_mode_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace_osnoise.c:2217 osnoise_options_write() warn: potential spectre issue 'buf' [w]
kernel/trace/trace_osnoise.c:2328 osnoise_cpus_write() warn: potential spectre issue 'buf' [w]

vim +/buf +688 kernel/trace/trace_hwlat.c

8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  660  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  661  /**
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  662   * hwlat_mode_write - Write function for "mode" entry
c418e1be84442f Jens Axboe                 2024-04-08  663   * @iocb: Metadata for IO
c418e1be84442f Jens Axboe                 2024-04-08  664   * @from: The user buffer that contains the value to write
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  665   *
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  666   * This function provides a write implementation for the "mode" interface
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  667   * to the hardware latency detector. hwlatd has different operation modes.
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  668   * The "none" sets the allowed cpumask for a single hwlatd thread at the
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  669   * startup and lets the scheduler handle the migration. The default mode is
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  670   * the "round-robin" one, in which a single hwlatd thread runs, migrating
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  671   * among the allowed CPUs in a round-robin fashion. The "per-cpu" mode
f46b16520a087e Daniel Bristot de Oliveira 2021-06-22  672   * creates one hwlatd thread per allowed CPU.
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  673   */
c418e1be84442f Jens Axboe                 2024-04-08  674  static ssize_t hwlat_mode_write(struct kiocb *iocb, struct iov_iter *from)
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  675  {
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  676  	struct trace_array *tr = hwlat_trace;
c418e1be84442f Jens Axboe                 2024-04-08  677  	size_t cnt = iov_iter_count(from);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  678  	const char *mode;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  679  	char buf[64];
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  680  	int ret, i;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  681  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  682  	if (cnt >= sizeof(buf))
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  683  		return -EINVAL;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  684  
c418e1be84442f Jens Axboe                 2024-04-08  685  	if (!copy_from_iter_full(buf, cnt, from))
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  686  		return -EFAULT;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  687  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22 @688  	buf[cnt] = 0;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  689  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  690  	mode = strstrip(buf);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  691  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  692  	ret = -EINVAL;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  693  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  694  	/*
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  695  	 * trace_types_lock is taken to avoid concurrency on start/stop
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  696  	 * and hwlat_busy.
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  697  	 */
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  698  	mutex_lock(&trace_types_lock);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  699  	if (hwlat_busy)
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  700  		hwlat_tracer_stop(tr);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  701  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  702  	mutex_lock(&hwlat_data.lock);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  703  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  704  	for (i = 0; i < MODE_MAX; i++) {
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  705  		if (strcmp(mode, thread_mode_str[i]) == 0) {
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  706  			hwlat_data.thread_mode = i;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  707  			ret = cnt;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  708  		}
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  709  	}
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  710  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  711  	mutex_unlock(&hwlat_data.lock);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  712  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  713  	if (hwlat_busy)
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  714  		hwlat_tracer_start(tr);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  715  	mutex_unlock(&trace_types_lock);
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  716  
c418e1be84442f Jens Axboe                 2024-04-08  717  	iocb->ki_pos += cnt;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  718  
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  719  	return ret;
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  720  }
8fa826b7344d67 Daniel Bristot de Oliveira 2021-06-22  721  

:::::: The code at line 688 was first introduced by commit
:::::: 8fa826b7344d6752f5cfd72380d9fe7bd8c6b928 trace/hwlat: Implement the mode config option

:::::: TO: Daniel Bristot de Oliveira <bristot@redhat.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
