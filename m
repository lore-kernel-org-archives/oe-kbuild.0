Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7205113C9D4
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Feb 2024 19:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709236199; cv=none; b=pi85WNYEhFeuHAZHQLF7rEpT7jl8biFHaUOU9XUuT3rOlaCBY8Sw4wsU36KUHUZvpp2S6EwAUWSezyfiCZ0QtcZT3tYLH2fwt5LYCA5RfCxVM7lC1oQJgS3km0gbR2nnTGTDknRp+lHoUxOJjND26HjKjHYC6MMh9MR120VEA+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709236199; c=relaxed/simple;
	bh=KBHWUwYcOJ0oaiXeuQ5aC44eQkGomppHNRTACJQr4aU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PFkDmKvgIGjWGut29kl4Aovk1JnzELD/uib/aKI7t9RtGqb4t4RQ/GUYC7Or65975x8q+rLKqcT327C2m8L3xvx/RwGSzJK1prdROOPwrNxuGVlIK44OomikCsQYNhFKueeoBCnxmZHeyXEKy/12c9Gp7RhmFf6jiwKjWinj7Eo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U2WrH5AG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U2WrH5AG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709236197; x=1740772197;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KBHWUwYcOJ0oaiXeuQ5aC44eQkGomppHNRTACJQr4aU=;
  b=U2WrH5AGGr64tDiLvLxr2c/xHtV8gjz2CacbTHn6cd0eYk4BtonI4NYA
   5fXYaK9LP8ifOtOSC4VSkFxrqkVdoYyi0A5btyOwt/EPFgH+UzmQVkrBb
   DGoTUleXcaBLSH+4CIhCtZqDFhbAejRONMoafY7ubnE4B37WjleN4AiV8
   CMdckSJNZv3e+ChZF+gquX38RSjnSpweQiakXeME2ABuVlprd2SFARvmx
   6+MV1oS49B78rgEzpyJq9VlPU9MZ9hfOi8XtQmox5iAX1xg2aolMkC760
   LM7lQQjegUeYi6W7z5ub8oXcB4MpHVa5FMoIL3VMKmMcfT/imX3X3+d/O
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10999"; a="3855338"
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="3855338"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Feb 2024 11:49:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,194,1705392000"; 
   d="scan'208";a="7885240"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Feb 2024 11:49:53 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rfmPe-000DFZ-2O;
	Thu, 29 Feb 2024 19:49:50 +0000
Date: Fri, 1 Mar 2024 03:49:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 10500/10830] drivers/gpu/drm/lima/lima_drv.c:125
 lima_ioctl_gem_submit() error: kvcalloc() does not make sense for no sleep
 code
Message-ID: <202403010341.RdSkDPX7-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Suren Baghdasaryan <surenb@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Kees Cook <keescook@chromium.org>
CC: Pasha Tatashin <pasha.tatashin@soleen.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f303a3e2bcfba900efb5aee55236d17030e9f882
commit: 211ec89ce404de50f19bccf444644d6b4c7d592c [10500/10830] mm: enumerate all gfp flags
:::::: branch date: 14 hours ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r081-20240229 (https://download.01.org/0day-ci/archive/20240301/202403010341.RdSkDPX7-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403010341.RdSkDPX7-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/lima/lima_drv.c:125 lima_ioctl_gem_submit() error: kvcalloc() does not make sense for no sleep code
mm/swap_slots.c:123 alloc_swap_slot_cache() error: kvcalloc() does not make sense for no sleep code
mm/swap_state.c:707 init_swap_address_space() error: kvcalloc() does not make sense for no sleep code

vim +125 drivers/gpu/drm/lima/lima_drv.c

a1d2a6339961ef Qiang Yu 2019-03-09  101  
a1d2a6339961ef Qiang Yu 2019-03-09  102  static int lima_ioctl_gem_submit(struct drm_device *dev, void *data, struct drm_file *file)
a1d2a6339961ef Qiang Yu 2019-03-09  103  {
a1d2a6339961ef Qiang Yu 2019-03-09  104  	struct drm_lima_gem_submit *args = data;
a1d2a6339961ef Qiang Yu 2019-03-09  105  	struct lima_device *ldev = to_lima_dev(dev);
a1d2a6339961ef Qiang Yu 2019-03-09  106  	struct lima_drm_priv *priv = file->driver_priv;
a1d2a6339961ef Qiang Yu 2019-03-09  107  	struct drm_lima_gem_submit_bo *bos;
a1d2a6339961ef Qiang Yu 2019-03-09  108  	struct lima_sched_pipe *pipe;
a1d2a6339961ef Qiang Yu 2019-03-09  109  	struct lima_sched_task *task;
a1d2a6339961ef Qiang Yu 2019-03-09  110  	struct lima_ctx *ctx;
a1d2a6339961ef Qiang Yu 2019-03-09  111  	struct lima_submit submit = {0};
a1d2a6339961ef Qiang Yu 2019-03-09  112  	size_t size;
a1d2a6339961ef Qiang Yu 2019-03-09  113  	int err = 0;
a1d2a6339961ef Qiang Yu 2019-03-09  114  
a1d2a6339961ef Qiang Yu 2019-03-09  115  	if (args->pipe >= lima_pipe_num || args->nr_bos == 0)
a1d2a6339961ef Qiang Yu 2019-03-09  116  		return -EINVAL;
a1d2a6339961ef Qiang Yu 2019-03-09  117  
a1d2a6339961ef Qiang Yu 2019-03-09  118  	if (args->flags & ~(LIMA_SUBMIT_FLAG_EXPLICIT_FENCE))
a1d2a6339961ef Qiang Yu 2019-03-09  119  		return -EINVAL;
a1d2a6339961ef Qiang Yu 2019-03-09  120  
a1d2a6339961ef Qiang Yu 2019-03-09  121  	pipe = ldev->pipe + args->pipe;
a1d2a6339961ef Qiang Yu 2019-03-09  122  	if (args->frame_size != pipe->frame_size)
a1d2a6339961ef Qiang Yu 2019-03-09  123  		return -EINVAL;
a1d2a6339961ef Qiang Yu 2019-03-09  124  
a1d2a6339961ef Qiang Yu 2019-03-09 @125  	bos = kvcalloc(args->nr_bos, sizeof(*submit.bos) + sizeof(*submit.lbos), GFP_KERNEL);
a1d2a6339961ef Qiang Yu 2019-03-09  126  	if (!bos)
a1d2a6339961ef Qiang Yu 2019-03-09  127  		return -ENOMEM;
a1d2a6339961ef Qiang Yu 2019-03-09  128  
a1d2a6339961ef Qiang Yu 2019-03-09  129  	size = args->nr_bos * sizeof(*submit.bos);
a1d2a6339961ef Qiang Yu 2019-03-09  130  	if (copy_from_user(bos, u64_to_user_ptr(args->bos), size)) {
a1d2a6339961ef Qiang Yu 2019-03-09  131  		err = -EFAULT;
a1d2a6339961ef Qiang Yu 2019-03-09  132  		goto out0;
a1d2a6339961ef Qiang Yu 2019-03-09  133  	}
a1d2a6339961ef Qiang Yu 2019-03-09  134  
a1d2a6339961ef Qiang Yu 2019-03-09  135  	task = kmem_cache_zalloc(pipe->task_slab, GFP_KERNEL);
a1d2a6339961ef Qiang Yu 2019-03-09  136  	if (!task) {
a1d2a6339961ef Qiang Yu 2019-03-09  137  		err = -ENOMEM;
a1d2a6339961ef Qiang Yu 2019-03-09  138  		goto out0;
a1d2a6339961ef Qiang Yu 2019-03-09  139  	}
a1d2a6339961ef Qiang Yu 2019-03-09  140  
a1d2a6339961ef Qiang Yu 2019-03-09  141  	task->frame = task + 1;
a1d2a6339961ef Qiang Yu 2019-03-09  142  	if (copy_from_user(task->frame, u64_to_user_ptr(args->frame), args->frame_size)) {
a1d2a6339961ef Qiang Yu 2019-03-09  143  		err = -EFAULT;
a1d2a6339961ef Qiang Yu 2019-03-09  144  		goto out1;
a1d2a6339961ef Qiang Yu 2019-03-09  145  	}
a1d2a6339961ef Qiang Yu 2019-03-09  146  
a1d2a6339961ef Qiang Yu 2019-03-09  147  	err = pipe->task_validate(pipe, task);
a1d2a6339961ef Qiang Yu 2019-03-09  148  	if (err)
a1d2a6339961ef Qiang Yu 2019-03-09  149  		goto out1;
a1d2a6339961ef Qiang Yu 2019-03-09  150  
a1d2a6339961ef Qiang Yu 2019-03-09  151  	ctx = lima_ctx_get(&priv->ctx_mgr, args->ctx);
a1d2a6339961ef Qiang Yu 2019-03-09  152  	if (!ctx) {
a1d2a6339961ef Qiang Yu 2019-03-09  153  		err = -ENOENT;
a1d2a6339961ef Qiang Yu 2019-03-09  154  		goto out1;
a1d2a6339961ef Qiang Yu 2019-03-09  155  	}
a1d2a6339961ef Qiang Yu 2019-03-09  156  
a1d2a6339961ef Qiang Yu 2019-03-09  157  	submit.pipe = args->pipe;
a1d2a6339961ef Qiang Yu 2019-03-09  158  	submit.bos = bos;
a1d2a6339961ef Qiang Yu 2019-03-09  159  	submit.lbos = (void *)bos + size;
a1d2a6339961ef Qiang Yu 2019-03-09  160  	submit.nr_bos = args->nr_bos;
a1d2a6339961ef Qiang Yu 2019-03-09  161  	submit.task = task;
a1d2a6339961ef Qiang Yu 2019-03-09  162  	submit.ctx = ctx;
a1d2a6339961ef Qiang Yu 2019-03-09  163  	submit.flags = args->flags;
a1d2a6339961ef Qiang Yu 2019-03-09  164  	submit.in_sync[0] = args->in_sync[0];
a1d2a6339961ef Qiang Yu 2019-03-09  165  	submit.in_sync[1] = args->in_sync[1];
a1d2a6339961ef Qiang Yu 2019-03-09  166  	submit.out_sync = args->out_sync;
a1d2a6339961ef Qiang Yu 2019-03-09  167  
a1d2a6339961ef Qiang Yu 2019-03-09  168  	err = lima_gem_submit(file, &submit);
a1d2a6339961ef Qiang Yu 2019-03-09  169  
a1d2a6339961ef Qiang Yu 2019-03-09  170  	lima_ctx_put(ctx);
a1d2a6339961ef Qiang Yu 2019-03-09  171  out1:
a1d2a6339961ef Qiang Yu 2019-03-09  172  	if (err)
a1d2a6339961ef Qiang Yu 2019-03-09  173  		kmem_cache_free(pipe->task_slab, task);
a1d2a6339961ef Qiang Yu 2019-03-09  174  out0:
a1d2a6339961ef Qiang Yu 2019-03-09  175  	kvfree(bos);
a1d2a6339961ef Qiang Yu 2019-03-09  176  	return err;
a1d2a6339961ef Qiang Yu 2019-03-09  177  }
a1d2a6339961ef Qiang Yu 2019-03-09  178  

:::::: The code at line 125 was first introduced by commit
:::::: a1d2a6339961efc078208dc3b2f006e9e9a8e119 drm/lima: driver for ARM Mali4xx GPUs

:::::: TO: Qiang Yu <yuq825@gmail.com>
:::::: CC: Eric Anholt <eric@anholt.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
