Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7511938BF91
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Mar 2026 17:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773942061; cv=none; b=Zan2/dRIFQys3OQ5gRZYoyMyMGzU/rkIqUcbgLUlaVbunfDumGOgeUHxEajOqep0an22CN/ODEWo5eg5sQZL78CYtZ/I6hciGkcZNKbG11Gg3vgwPn7fC5+FlCfecskFpYbIwiITqv/UAVFODdFTqFVr5BaoZryplZ+rNtaCRxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773942061; c=relaxed/simple;
	bh=yO8qQNnaUCrh4T7hGmg2dsnf5Ejzfv8CnTkKN+UoDho=;
	h=Date:From:To:Cc:Subject:Message-ID; b=rAZ2JEWZgtQGuRenEonO9n5bRrgGS68Ka/E17b6KYEGS18cRYFZNCyuIFn4C3wpaV99OqXDdAIXw6FqndWCnpVDOUQ0SM0XS7gnauqfF5cYNhzvh8ks9zKgMEz0HA8Q+qOAEKNYwdfX0cQ/sMIxwdWwc4yfv3/wqLUyRbmKshco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D/Xn8tgW; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D/Xn8tgW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773942057; x=1805478057;
  h=date:from:to:cc:subject:message-id;
  bh=yO8qQNnaUCrh4T7hGmg2dsnf5Ejzfv8CnTkKN+UoDho=;
  b=D/Xn8tgWoKjDCNISBy/IGyg2Q/3gJoQ69l+OaBx5rO6Z/7haDwqNz8Cp
   5yX156i52ohO+E5P08W1+oGpu5CJp7JOEuZ8SHSqa/MYY9nwzGMPr3MZ8
   HrYxkwVkXR4CFSW8hVo9HCOLajwXXGzEA0LvnC56g7cMbHXAMLcGAXRxl
   QxtgY5BDEp45rBZi2KBSNp4E38g9EEoCub7q3Rvv9vnzisQ7KeoUAFlXy
   xEfL5rTUTfkH9JUzXj/btVn4r1JS6MP4e6uIGFDhibXrT1qZWKkfla5Na
   2HGWT6gKlb/cx3nYG6DFKQw+HMA5kOh6pre6gYZ214f6VDNXWn2BLW8Di
   w==;
X-CSE-ConnectionGUID: cBt3wQMfTT+0RoJ10SxsUw==
X-CSE-MsgGUID: KHLcXN8WROKxjgb/rtV8Yg==
X-IronPort-AV: E=McAfee;i="6800,10657,11734"; a="74200945"
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="74200945"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2026 10:40:56 -0700
X-CSE-ConnectionGUID: /lls5i3ASpW1KrTPtOBuzQ==
X-CSE-MsgGUID: 7I/qArizR7GcYnGcyBoIPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,129,1770624000"; 
   d="scan'208";a="227519517"
Received: from lkp-server02.sh.intel.com (HELO a51c2a36b9df) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 19 Mar 2026 10:40:55 -0700
Received: from kbuild by a51c2a36b9df with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w3HMa-000000001RN-1sGT;
	Thu, 19 Mar 2026 17:40:52 +0000
Date: Fri, 20 Mar 2026 01:34:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [axboe:rw_iter 81/539] kernel/trace/trace.c:10498
 trace_parse_run_command() warn: potential spectre issue 'kbuf' [w]
Message-ID: <202603200151.8zLDCVgN-lkp@intel.com>
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
head:   f36e0fb8d552bd827ef31f4fc1190d0149c44249
commit: 8d90a3c5d84f4f813767df5da1fc314935fcaeed [81/539] tracing: convert to read/write iterators
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: csky-randconfig-r072-20260319 (https://download.01.org/0day-ci/archive/20260320/202603200151.8zLDCVgN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.4.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603200151.8zLDCVgN-lkp@intel.com/

smatch warnings:
kernel/trace/trace.c:10498 trace_parse_run_command() warn: potential spectre issue 'kbuf' [w]

vim +/kbuf +10498 kernel/trace/trace.c

7e465baa80293e Tom Zanussi      2017-09-22  10474  
8d90a3c5d84f4f Jens Axboe       2024-04-08  10475  ssize_t trace_parse_run_command(struct file *file, struct iov_iter *from,
d262271d04830e Masami Hiramatsu 2021-02-01  10476  				int (*createfn)(const char *))
7e465baa80293e Tom Zanussi      2017-09-22  10477  {
12d5189615862a Steven Rostedt   2025-08-01  10478  	char *kbuf __free(kfree) = NULL;
12d5189615862a Steven Rostedt   2025-08-01  10479  	char *buf, *tmp;
7e465baa80293e Tom Zanussi      2017-09-22  10480  	int ret = 0;
7e465baa80293e Tom Zanussi      2017-09-22  10481  	size_t done = 0;
7e465baa80293e Tom Zanussi      2017-09-22  10482  	size_t size;
8d90a3c5d84f4f Jens Axboe       2024-04-08  10483  	size_t count = iov_iter_count(from);
7e465baa80293e Tom Zanussi      2017-09-22  10484  
7e465baa80293e Tom Zanussi      2017-09-22  10485  	kbuf = kmalloc(WRITE_BUFSIZE, GFP_KERNEL);
7e465baa80293e Tom Zanussi      2017-09-22  10486  	if (!kbuf)
7e465baa80293e Tom Zanussi      2017-09-22  10487  		return -ENOMEM;
7e465baa80293e Tom Zanussi      2017-09-22  10488  
7e465baa80293e Tom Zanussi      2017-09-22  10489  	while (done < count) {
7e465baa80293e Tom Zanussi      2017-09-22  10490  		size = count - done;
7e465baa80293e Tom Zanussi      2017-09-22  10491  
7e465baa80293e Tom Zanussi      2017-09-22  10492  		if (size >= WRITE_BUFSIZE)
7e465baa80293e Tom Zanussi      2017-09-22  10493  			size = WRITE_BUFSIZE - 1;
7e465baa80293e Tom Zanussi      2017-09-22  10494  
8d90a3c5d84f4f Jens Axboe       2024-04-08  10495  		if (!copy_from_iter_full(kbuf, size, from))
12d5189615862a Steven Rostedt   2025-08-01  10496  			return -EFAULT;
12d5189615862a Steven Rostedt   2025-08-01  10497  
7e465baa80293e Tom Zanussi      2017-09-22 @10498  		kbuf[size] = '\0';
7e465baa80293e Tom Zanussi      2017-09-22  10499  		buf = kbuf;
7e465baa80293e Tom Zanussi      2017-09-22  10500  		do {
7e465baa80293e Tom Zanussi      2017-09-22  10501  			tmp = strchr(buf, '\n');
7e465baa80293e Tom Zanussi      2017-09-22  10502  			if (tmp) {
7e465baa80293e Tom Zanussi      2017-09-22  10503  				*tmp = '\0';
7e465baa80293e Tom Zanussi      2017-09-22  10504  				size = tmp - buf + 1;
7e465baa80293e Tom Zanussi      2017-09-22  10505  			} else {
7e465baa80293e Tom Zanussi      2017-09-22  10506  				size = strlen(buf);
7e465baa80293e Tom Zanussi      2017-09-22  10507  				if (done + size < count) {
7e465baa80293e Tom Zanussi      2017-09-22  10508  					if (buf != kbuf)
7e465baa80293e Tom Zanussi      2017-09-22  10509  						break;
7e465baa80293e Tom Zanussi      2017-09-22  10510  					/* This can accept WRITE_BUFSIZE - 2 ('\n' + '\0') */
7e465baa80293e Tom Zanussi      2017-09-22  10511  					pr_warn("Line length is too long: Should be less than %d\n",
7e465baa80293e Tom Zanussi      2017-09-22  10512  						WRITE_BUFSIZE - 2);
12d5189615862a Steven Rostedt   2025-08-01  10513  					return -EINVAL;
7e465baa80293e Tom Zanussi      2017-09-22  10514  				}
7e465baa80293e Tom Zanussi      2017-09-22  10515  			}
7e465baa80293e Tom Zanussi      2017-09-22  10516  			done += size;
7e465baa80293e Tom Zanussi      2017-09-22  10517  
7e465baa80293e Tom Zanussi      2017-09-22  10518  			/* Remove comments */
7e465baa80293e Tom Zanussi      2017-09-22  10519  			tmp = strchr(buf, '#');
7e465baa80293e Tom Zanussi      2017-09-22  10520  
7e465baa80293e Tom Zanussi      2017-09-22  10521  			if (tmp)
7e465baa80293e Tom Zanussi      2017-09-22  10522  				*tmp = '\0';
7e465baa80293e Tom Zanussi      2017-09-22  10523  
d262271d04830e Masami Hiramatsu 2021-02-01  10524  			ret = createfn(buf);
7e465baa80293e Tom Zanussi      2017-09-22  10525  			if (ret)
12d5189615862a Steven Rostedt   2025-08-01  10526  				return ret;
7e465baa80293e Tom Zanussi      2017-09-22  10527  			buf += size;
7e465baa80293e Tom Zanussi      2017-09-22  10528  
7e465baa80293e Tom Zanussi      2017-09-22  10529  		} while (done < count);
7e465baa80293e Tom Zanussi      2017-09-22  10530  	}
12d5189615862a Steven Rostedt   2025-08-01  10531  	return done;
7e465baa80293e Tom Zanussi      2017-09-22  10532  }
7e465baa80293e Tom Zanussi      2017-09-22  10533  

:::::: The code at line 10498 was first introduced by commit
:::::: 7e465baa80293ed5f87fdf6405391d6f02110d4e tracing: Make traceprobe parsing code reusable

:::::: TO: Tom Zanussi <tom.zanussi@linux.intel.com>
:::::: CC: Steven Rostedt (VMware) <rostedt@goodmis.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
