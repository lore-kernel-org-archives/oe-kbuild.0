Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C140440C03
	for <oe-kbuild@lists.linux.dev>; Tue, 26 Nov 2024 03:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732591239; cv=none; b=dgTpvrI+IRt+7FQ8xHHFUzXY5cYy0uTbBgyoGIroqeX7gRp5nHrli/uZjxsyypkJeIURyU5Z5qM25rrdP8iU76zBHAMYRxEKs0ur53ozCu2SnZfwfkQ9WHzcFdhjKl8qe5qCYBW3VhPRDhuUxd699W0HVlyzRpXYyzLk/7k0RKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732591239; c=relaxed/simple;
	bh=slFxsisN9o7TOIwIQtcN12/L5R33XimK95RlHNyDwAw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A3Wgint3WF5GMCSH2Fp2trVzrEZ6DVzK9umJrhemwDxh71T2jbyG6WWF7ztEGaK+/GED8627jiVnBPAODv14dfdk/W6H28Itk4dLb63r+aqWLFb9ZweUaMxnnPWfg52mOCvemPcuzc/boCKnCmKxmgY4iJCzFidjigJCcIYD1N0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPDdBpYE; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPDdBpYE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732591238; x=1764127238;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=slFxsisN9o7TOIwIQtcN12/L5R33XimK95RlHNyDwAw=;
  b=DPDdBpYEcUaxjV1wL+aJkNG0FfYtJoOhF66lYoKyvIdjpsSen8+6RzOw
   SYuguGKmlRVWVKurtzmPsLaWVHFa9fcBo8BjqBspwDjKNKIsxpvibtAVY
   hVzTb7F99SFzGKNlwTKWq26GDrEgHsG4dE3EDq3ZIp4ZwVN77n2dhlVvF
   18IPxUG/YUyRg6NfLZUq3p2GQdGQOxog/aE/1m+ukV+LnVv9zsgEvaI/2
   IugdI+FeInyOQ9kqf/VJRNkSoJzKiM7pnGf2fppSxhNoenkVmf8JKk15w
   SZJa/aSSUAnroR/Aad2jppbEgqvSR/BMxAlRJ+jk4PW9XBzOg9/UzXAgj
   Q==;
X-CSE-ConnectionGUID: MOnZOcDAR/WJ4zivEGdn5w==
X-CSE-MsgGUID: rdVJfRbWRBiLnmsDtJKiFw==
X-IronPort-AV: E=McAfee;i="6700,10204,11267"; a="36516087"
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="36516087"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2024 19:20:37 -0800
X-CSE-ConnectionGUID: tpZamNMKQUyqzzizhcxMXA==
X-CSE-MsgGUID: bG9ckjaxSWKAWIeVK+B+9w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,184,1728975600"; 
   d="scan'208";a="92285347"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 25 Nov 2024 19:20:36 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tFm7t-00071v-1G;
	Tue, 26 Nov 2024 03:20:33 +0000
Date: Tue, 26 Nov 2024 11:20:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/kthread.c:476 __kthread_create_on_node() warn:
 '&create->list' not removed from list
Message-ID: <202411261130.CSYNmiFm-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Adrian Hunter <adrian.hunter@intel.com>
CC: Thomas Gleixner <tglx@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9f16d5e6f220661f73b36a4be1b21575651d8833
commit: 5284984a4fbacb0883bfebe905902cdda2891a07 bug: Fix no-return-statement warning with !CONFIG_BUG
date:   8 months ago
:::::: branch date: 2 days ago
:::::: commit date: 8 months ago
config: hexagon-randconfig-r071-20241119 (https://download.01.org/0day-ci/archive/20241126/202411261130.CSYNmiFm-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 592c0fe55f6d9a811028b5f3507be91458ab2713)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411261130.CSYNmiFm-lkp@intel.com/

smatch warnings:
kernel/kthread.c:476 __kthread_create_on_node() warn: '&create->list' not removed from list
drivers/video/fbdev/sh_mobile_lcdcfb.c:2649 sh_mobile_lcdc_probe() warn: 'irq' from request_irq() not released on lines: 2649.

vim +476 kernel/kthread.c

^1da177e4c3f41 Linus Torvalds    2005-04-16  426  
c0b942a76361e0 Nicolas Iooss     2016-12-12  427  static __printf(4, 0)
c0b942a76361e0 Nicolas Iooss     2016-12-12  428  struct task_struct *__kthread_create_on_node(int (*threadfn)(void *data),
2a1d446019f9a5 Thomas Gleixner   2012-07-16  429  						    void *data, int node,
^1da177e4c3f41 Linus Torvalds    2005-04-16  430  						    const char namefmt[],
255451e45345bc Petr Mladek       2016-10-11  431  						    va_list args)
^1da177e4c3f41 Linus Torvalds    2005-04-16  432  {
786235eeba0e1e Tetsuo Handa      2013-11-12  433  	DECLARE_COMPLETION_ONSTACK(done);
786235eeba0e1e Tetsuo Handa      2013-11-12  434  	struct task_struct *task;
786235eeba0e1e Tetsuo Handa      2013-11-12  435  	struct kthread_create_info *create = kmalloc(sizeof(*create),
786235eeba0e1e Tetsuo Handa      2013-11-12  436  						     GFP_KERNEL);
786235eeba0e1e Tetsuo Handa      2013-11-12  437  
786235eeba0e1e Tetsuo Handa      2013-11-12  438  	if (!create)
786235eeba0e1e Tetsuo Handa      2013-11-12  439  		return ERR_PTR(-ENOMEM);
786235eeba0e1e Tetsuo Handa      2013-11-12  440  	create->threadfn = threadfn;
786235eeba0e1e Tetsuo Handa      2013-11-12  441  	create->data = data;
786235eeba0e1e Tetsuo Handa      2013-11-12  442  	create->node = node;
786235eeba0e1e Tetsuo Handa      2013-11-12  443  	create->done = &done;
73e0c116594d99 Mike Christie     2023-03-10  444  	create->full_name = kvasprintf(GFP_KERNEL, namefmt, args);
73e0c116594d99 Mike Christie     2023-03-10  445  	if (!create->full_name) {
73e0c116594d99 Mike Christie     2023-03-10  446  		task = ERR_PTR(-ENOMEM);
73e0c116594d99 Mike Christie     2023-03-10  447  		goto free_create;
73e0c116594d99 Mike Christie     2023-03-10  448  	}
^1da177e4c3f41 Linus Torvalds    2005-04-16  449  
73c279927f8956 Eric W. Biederman 2007-05-09  450  	spin_lock(&kthread_create_lock);
786235eeba0e1e Tetsuo Handa      2013-11-12  451  	list_add_tail(&create->list, &kthread_create_list);
73c279927f8956 Eric W. Biederman 2007-05-09  452  	spin_unlock(&kthread_create_lock);
73c279927f8956 Eric W. Biederman 2007-05-09  453  
cbd9b67bd3883d Dmitry Adamushko  2008-04-29  454  	wake_up_process(kthreadd_task);
786235eeba0e1e Tetsuo Handa      2013-11-12  455  	/*
786235eeba0e1e Tetsuo Handa      2013-11-12  456  	 * Wait for completion in killable state, for I might be chosen by
786235eeba0e1e Tetsuo Handa      2013-11-12  457  	 * the OOM killer while kthreadd is trying to allocate memory for
786235eeba0e1e Tetsuo Handa      2013-11-12  458  	 * new kernel thread.
786235eeba0e1e Tetsuo Handa      2013-11-12  459  	 */
786235eeba0e1e Tetsuo Handa      2013-11-12  460  	if (unlikely(wait_for_completion_killable(&done))) {
786235eeba0e1e Tetsuo Handa      2013-11-12  461  		/*
d25c83c6606ffc Petr Mladek       2022-03-15  462  		 * If I was killed by a fatal signal before kthreadd (or new
d25c83c6606ffc Petr Mladek       2022-03-15  463  		 * kernel thread) calls complete(), leave the cleanup of this
d25c83c6606ffc Petr Mladek       2022-03-15  464  		 * structure to that thread.
786235eeba0e1e Tetsuo Handa      2013-11-12  465  		 */
786235eeba0e1e Tetsuo Handa      2013-11-12  466  		if (xchg(&create->done, NULL))
8fe6929cfd43c4 Tetsuo Handa      2014-06-04  467  			return ERR_PTR(-EINTR);
786235eeba0e1e Tetsuo Handa      2013-11-12  468  		/*
786235eeba0e1e Tetsuo Handa      2013-11-12  469  		 * kthreadd (or new kernel thread) will call complete()
786235eeba0e1e Tetsuo Handa      2013-11-12  470  		 * shortly.
786235eeba0e1e Tetsuo Handa      2013-11-12  471  		 */
786235eeba0e1e Tetsuo Handa      2013-11-12  472  		wait_for_completion(&done);
786235eeba0e1e Tetsuo Handa      2013-11-12  473  	}
786235eeba0e1e Tetsuo Handa      2013-11-12  474  	task = create->result;
73e0c116594d99 Mike Christie     2023-03-10  475  free_create:
786235eeba0e1e Tetsuo Handa      2013-11-12 @476  	kfree(create);
786235eeba0e1e Tetsuo Handa      2013-11-12  477  	return task;
^1da177e4c3f41 Linus Torvalds    2005-04-16  478  }
255451e45345bc Petr Mladek       2016-10-11  479  

:::::: The code at line 476 was first introduced by commit
:::::: 786235eeba0e1e85e5cbbb9f97d1087ad03dfa21 kthread: make kthread_create() killable

:::::: TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
