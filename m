Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2912C204C3B
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Jul 2025 16:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752080396; cv=none; b=RwEJmQC2y9JidOKwYN9cFwmp8kRGtKAhcDXnF3AV7qQxJnCS91klDa7kffII8DbDp/U1ZhyFkQBgSlz+B8+a0qih0mEp8UpWACHgTxavL4d59lIfmMqPXZDDv9jycvOGRp9C5TnTr+5aHd1/rL9jBi4w1hdyvKP0pInF6B1DYfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752080396; c=relaxed/simple;
	bh=oo1mgxGIhiySMgXWm+dJ2Bc5CyeVoBcv+o2EPUFrKWg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lNd2aDMIXOV2lkH3kiXVkW3qgfJ9jGQ86Urk8jKIjQLmOYEM5bSGp/ZlxmLfKJGzlGw2Jsv77iRfi5iUrYakBzTCWbAzYJmrCtFWE5rWQy7OQqyW4uV0wE7UsijqgoU/XUN3uHrmBlAScPjUXC0cYZQKpz3zhyuuq7G9YI9SjVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ibz3DC2c; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ibz3DC2c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752080395; x=1783616395;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oo1mgxGIhiySMgXWm+dJ2Bc5CyeVoBcv+o2EPUFrKWg=;
  b=Ibz3DC2c05aLlQVrmVF/51cWMkOcxIPc4UPTKU0gB9zzK4rJz/OHKkFu
   ks3LB0nrdQqPB/Xtr6nupLirhuuluEk9UtlYlMQx39IcNLGZ+ObRY2XbA
   4BvlH0pjZs5ch7gjXMsR1NmdGlJhanUXeCS+TR2Ikf8vpTGHhR87Dz7iZ
   exfDcsbmP9CNNq4nRFoQkvDP1RQbmv4lpuPb/VMJgguayUNMznpqELcD3
   LIzuf+umEqtKkPP8GG/c1AKz289QNh1FNrHKSvIbfJuJB5X1e59bgFRxU
   9AjgON7OLOWNZnrd0tqivgT4NhG4DdXuv+EcsuR03oSRXonO5GWcxkyBS
   Q==;
X-CSE-ConnectionGUID: ox8NoWAVS8+7mTFl2p6/8g==
X-CSE-MsgGUID: 70yBKq/YQzmM/bqwVCYadA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="54277240"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54277240"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 09:59:54 -0700
X-CSE-ConnectionGUID: iFL+wSEOTP64nXW9Z/8mbg==
X-CSE-MsgGUID: 8I12zCPpQT2gcDR5EcZ8NQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155470025"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 09 Jul 2025 09:59:53 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZY99-0003mx-1X;
	Wed, 09 Jul 2025 16:59:51 +0000
Date: Thu, 10 Jul 2025 00:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [android-common:android15-6.6 6/6]
 drivers/dma-buf/dma-buf.c:185:29-39: ERROR: function new_task_dmabuf_record
 called on line 226 inside lock on line 223 but uses GFP_KERNEL
Message-ID: <202507100047.7nSTFziq-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android15-6.6
head:   c8fdc081cfa165aaa5bd87979d33b419499574cf
commit: f44d593749dcbd4e1013121fa615ecca412d1cb3 [6/6] ANDROID: Track per-process dmabuf RSS
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-r053-20250709 (https://download.01.org/0day-ci/archive/20250710/202507100047.7nSTFziq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202507100047.7nSTFziq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma-buf/dma-buf.c:185:29-39: ERROR: function new_task_dmabuf_record called on line 226 inside lock on line 223 but uses GFP_KERNEL

vim +185 drivers/dma-buf/dma-buf.c

f44d593749dcbd T.J. Mercier 2025-06-25  178  
f44d593749dcbd T.J. Mercier 2025-06-25  179  static int new_task_dmabuf_record(struct task_struct *task, struct dma_buf *dmabuf)
f44d593749dcbd T.J. Mercier 2025-06-25  180  {
f44d593749dcbd T.J. Mercier 2025-06-25  181  	struct task_dma_buf_record *rec;
f44d593749dcbd T.J. Mercier 2025-06-25  182  
f44d593749dcbd T.J. Mercier 2025-06-25  183  	lockdep_assert_held(&task->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier 2025-06-25  184  
f44d593749dcbd T.J. Mercier 2025-06-25 @185  	rec = kmalloc(sizeof(*rec), GFP_KERNEL);
f44d593749dcbd T.J. Mercier 2025-06-25  186  	if (!rec)
f44d593749dcbd T.J. Mercier 2025-06-25  187  		return -ENOMEM;
f44d593749dcbd T.J. Mercier 2025-06-25  188  
f44d593749dcbd T.J. Mercier 2025-06-25  189  	task->dmabuf_info->rss += dmabuf->size;
f44d593749dcbd T.J. Mercier 2025-06-25  190  	rec->dmabuf = dmabuf;
f44d593749dcbd T.J. Mercier 2025-06-25  191  	rec->refcnt = 1;
f44d593749dcbd T.J. Mercier 2025-06-25  192  	list_add(&rec->node, &task->dmabuf_info->dmabufs);
f44d593749dcbd T.J. Mercier 2025-06-25  193  
f44d593749dcbd T.J. Mercier 2025-06-25  194  	return 0;
f44d593749dcbd T.J. Mercier 2025-06-25  195  }
f44d593749dcbd T.J. Mercier 2025-06-25  196  
f44d593749dcbd T.J. Mercier 2025-06-25  197  /**
f44d593749dcbd T.J. Mercier 2025-06-25  198   * dma_buf_account_task - Account a dmabuf to a task
f44d593749dcbd T.J. Mercier 2025-06-25  199   * @dmabuf:	[in]	pointer to dma_buf
f44d593749dcbd T.J. Mercier 2025-06-25  200   * @task:	[in]	pointer to task_struct
f44d593749dcbd T.J. Mercier 2025-06-25  201   *
f44d593749dcbd T.J. Mercier 2025-06-25  202   * When a process obtains a dmabuf file descriptor, or maps a dmabuf, this
f44d593749dcbd T.J. Mercier 2025-06-25  203   * function attributes the provided @dmabuf to the @task. The first time @dmabuf
f44d593749dcbd T.J. Mercier 2025-06-25  204   * is attributed to @task, the buffer's size is added to the @task's dmabuf RSS.
f44d593749dcbd T.J. Mercier 2025-06-25  205   *
f44d593749dcbd T.J. Mercier 2025-06-25  206   * Return:
f44d593749dcbd T.J. Mercier 2025-06-25  207   * * 0 on success
f44d593749dcbd T.J. Mercier 2025-06-25  208   * * A negative error code upon error
f44d593749dcbd T.J. Mercier 2025-06-25  209   */
f44d593749dcbd T.J. Mercier 2025-06-25  210  int dma_buf_account_task(struct dma_buf *dmabuf, struct task_struct *task)
f44d593749dcbd T.J. Mercier 2025-06-25  211  {
f44d593749dcbd T.J. Mercier 2025-06-25  212  	struct task_dma_buf_record *rec;
f44d593749dcbd T.J. Mercier 2025-06-25  213  	int ret = 0;
f44d593749dcbd T.J. Mercier 2025-06-25  214  
f44d593749dcbd T.J. Mercier 2025-06-25  215  	if (!dmabuf || !task)
f44d593749dcbd T.J. Mercier 2025-06-25  216  		return -EINVAL;
f44d593749dcbd T.J. Mercier 2025-06-25  217  
f44d593749dcbd T.J. Mercier 2025-06-25  218  	if (!task->dmabuf_info) {
f44d593749dcbd T.J. Mercier 2025-06-25  219  	    pr_err("%s dmabuf accounting record was not allocated\n", __func__);
f44d593749dcbd T.J. Mercier 2025-06-25  220  	    return -ENOMEM;
f44d593749dcbd T.J. Mercier 2025-06-25  221  	}
f44d593749dcbd T.J. Mercier 2025-06-25  222  
f44d593749dcbd T.J. Mercier 2025-06-25 @223  	spin_lock(&task->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier 2025-06-25  224  	rec = find_task_dmabuf_record(task, dmabuf);
f44d593749dcbd T.J. Mercier 2025-06-25  225  	if (!rec)
f44d593749dcbd T.J. Mercier 2025-06-25 @226  		ret = new_task_dmabuf_record(task, dmabuf);
f44d593749dcbd T.J. Mercier 2025-06-25  227  	else
f44d593749dcbd T.J. Mercier 2025-06-25  228  		++rec->refcnt;
f44d593749dcbd T.J. Mercier 2025-06-25  229  	spin_unlock(&task->dmabuf_info->lock);
f44d593749dcbd T.J. Mercier 2025-06-25  230  
f44d593749dcbd T.J. Mercier 2025-06-25  231  	return ret;
f44d593749dcbd T.J. Mercier 2025-06-25  232  }
f44d593749dcbd T.J. Mercier 2025-06-25  233  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
