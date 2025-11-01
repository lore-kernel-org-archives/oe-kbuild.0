Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C1FF5733E
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Nov 2025 23:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762040961; cv=none; b=Cob19cf0Qpm3H/PS1n3dkCtWXMGt3yEKFgE/dw0iYEMN7VQkKfKptF7zT3kykzEu5KrMUP6RccJQDz9su8Yv6wC8Xfzi1Ocw6GNi3Ca/Sf3SO3Jj0hUKF+9jiYKNdA1hT+50YhDJJvYr4f0cQ+8Bn6l1QFTUBPXFr4TE9oZhpvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762040961; c=relaxed/simple;
	bh=nYlX1rAku0DD1L50R3IjunTxnNFch5xBxdNvjsQQNNY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hU+ZBOgsf36wsqaiX7ZUFV1hOc1JGXBB7e6wlhga+7wgGS08x8N5SlweQFC/0LXYbZzVEq8ZcJx54xC6yzbDm5w7msU5PZ9/CXyCeEiB7FydOQ8KRhNAqW2LS1KzX4oN0ZXCrcSPA1kY2aVaePorTyFNG9wllO1rZoLsy1XR+lI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZK5kjF/J; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZK5kjF/J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762040959; x=1793576959;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=nYlX1rAku0DD1L50R3IjunTxnNFch5xBxdNvjsQQNNY=;
  b=ZK5kjF/JKDpTzDtEkzWCUy6IqORd9FCLeuMX6ywSdUEV/836P/4M2u4T
   hfe4Ms5d5beXFUKjx68mj8v8XTKuskCXbD9ee0P6rhwn96Hk+GYUvbR2N
   oFa+bEFSSiSlbJvMYuT/XitbBUWuXQq13/2VK/Vn4zIkG8JYEpfeuw5I9
   JvVe3tihYokLWqoYFw+FvpXlv725opH88T4oK8gWlHk08xCxVAstoPTdG
   5cC5i5T6gudguA8Ierh25zTh7u6R4kvoQEVMydtV1bh0kglZh6k6Qm4aM
   yubOMss4Id5aZDtHfFsZDC/XVeWawikoVFTOEvAHcUkZnX5VbxYzpNglK
   Q==;
X-CSE-ConnectionGUID: GiNPxJMFTjC5XLYOkln0zw==
X-CSE-MsgGUID: szl0dRyZRdyyEGyiOClWxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11600"; a="64314417"
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="64314417"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2025 16:49:19 -0700
X-CSE-ConnectionGUID: uJ/56S/xRrmrqa562Fgilw==
X-CSE-MsgGUID: Uh0dHmjQRqOG/1QC0tFeIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,273,1754982000"; 
   d="scan'208";a="186682315"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 01 Nov 2025 16:49:18 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFLLP-000OnQ-29;
	Sat, 01 Nov 2025 23:49:15 +0000
Date: Sun, 2 Nov 2025 07:48:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 1/4] cgroup: Rename cgroup lifecycle hooks to
 cgroup_task_*()
Message-ID: <202511020700.T6Khwk6p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20251029061918.4179554-2-tj@kernel.org>
References: <20251029061918.4179554-2-tj@kernel.org>
TO: Tejun Heo <tj@kernel.org>
TO: David Vernet <void@manifault.com>
TO: Andrea Righi <arighi@nvidia.com>
TO: Changwoo Min <changwoo@igalia.com>
CC: Dan Schatzberg <dschatzberg@meta.com>
CC: Peter Zijlstra <peterz@infradead.org>
CC: linux-kernel@vger.kernel.org
CC: cgroups@vger.kernel.org
CC: sched-ext@lists.linux.dev
CC: Tejun Heo <tj@kernel.org>

Hi Tejun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tip/sched/core]
[also build test WARNING on tj-cgroup/for-next kees/for-next/execve akpm-mm/mm-everything linus/master v6.18-rc3 next-20251031]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tejun-Heo/cgroup-Move-dying_tasks-cleanup-from-cgroup_task_release-to-cgroup_task_free/20251029-151950
base:   tip/sched/core
patch link:    https://lore.kernel.org/r/20251029061918.4179554-2-tj%40kernel.org
patch subject: [PATCH 1/4] cgroup: Rename cgroup lifecycle hooks to cgroup_task_*()
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-141-20251101 (https://download.01.org/0day-ci/archive/20251102/202511020700.T6Khwk6p-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202511020700.T6Khwk6p-lkp@intel.com/

smatch warnings:
kernel/cgroup/cgroup.c:7009 cgroup_task_exit() warn: iterator 'i' not incremented

vim +/i +7009 kernel/cgroup/cgroup.c

5edee61edeaaeb kernel/cgroup.c        Tejun Heo                  2012-10-16  6974  
b4f48b6363c81c kernel/cgroup.c        Paul Menage                2007-10-18  6975  /**
e0a9a9a24088de kernel/cgroup/cgroup.c Tejun Heo                  2025-10-28  6976   * cgroup_task_exit - detach cgroup from exiting task
b4f48b6363c81c kernel/cgroup.c        Paul Menage                2007-10-18  6977   * @tsk: pointer to task_struct of exiting process
b4f48b6363c81c kernel/cgroup.c        Paul Menage                2007-10-18  6978   *
e7c7b1d85dc164 kernel/cgroup/cgroup.c Michal Koutný              2019-10-04  6979   * Description: Detach cgroup from @tsk.
b4f48b6363c81c kernel/cgroup.c        Paul Menage                2007-10-18  6980   *
b4f48b6363c81c kernel/cgroup.c        Paul Menage                2007-10-18  6981   */
e0a9a9a24088de kernel/cgroup/cgroup.c Tejun Heo                  2025-10-28  6982  void cgroup_task_exit(struct task_struct *tsk)
b4f48b6363c81c kernel/cgroup.c        Paul Menage                2007-10-18  6983  {
30159ec7a9db7f kernel/cgroup.c        Tejun Heo                  2013-06-25  6984  	struct cgroup_subsys *ss;
5abb8855734fd7 kernel/cgroup.c        Tejun Heo                  2013-06-12  6985  	struct css_set *cset;
d41d5a01631af8 kernel/cgroup.c        Peter Zijlstra             2011-02-07  6986  	int i;
817929ec274bcf kernel/cgroup.c        Paul Menage                2007-10-18  6987  
82d6489d0fed2e kernel/cgroup.c        Daniel Bristot de Oliveira 2016-06-22  6988  	spin_lock_irq(&css_set_lock);
5153faac18d293 kernel/cgroup/cgroup.c Tejun Heo                  2019-10-24  6989  
5153faac18d293 kernel/cgroup/cgroup.c Tejun Heo                  2019-10-24  6990  	WARN_ON_ONCE(list_empty(&tsk->cg_list));
5153faac18d293 kernel/cgroup/cgroup.c Tejun Heo                  2019-10-24  6991  	cset = task_css_set(tsk);
f6d7d049c17a29 kernel/cgroup.c        Tejun Heo                  2015-10-15  6992  	css_set_move_task(tsk, cset, NULL, false);
73a7242a06ff99 kernel/cgroup/cgroup.c Waiman Long                2017-06-13  6993  	cset->nr_tasks--;
6fe960147e08e9 kernel/cgroup/cgroup.c Oleg Nesterov              2024-06-17  6994  	/* matches the signal->live check in css_task_iter_advance() */
6fe960147e08e9 kernel/cgroup/cgroup.c Oleg Nesterov              2024-06-17  6995  	if (thread_group_leader(tsk) && atomic_read(&tsk->signal->live))
6fe960147e08e9 kernel/cgroup/cgroup.c Oleg Nesterov              2024-06-17  6996  		list_add_tail(&tsk->cg_list, &cset->dying_tasks);
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19  6997  
6c24849f5515e4 kernel/cgroup/cgroup.c Juri Lelli                 2023-05-08  6998  	if (dl_task(tsk))
6c24849f5515e4 kernel/cgroup/cgroup.c Juri Lelli                 2023-05-08  6999  		dec_dl_tasks_cs(tsk);
6c24849f5515e4 kernel/cgroup/cgroup.c Juri Lelli                 2023-05-08  7000  
96b9c592def5d7 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-26  7001  	WARN_ON_ONCE(cgroup_task_frozen(tsk));
f4f809f66b7545 kernel/cgroup/cgroup.c Roman Gushchin             2021-05-10  7002  	if (unlikely(!(tsk->flags & PF_KTHREAD) &&
f4f809f66b7545 kernel/cgroup/cgroup.c Roman Gushchin             2021-05-10  7003  		     test_bit(CGRP_FREEZE, &task_dfl_cgroup(tsk)->flags)))
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19  7004  		cgroup_update_frozen(task_dfl_cgroup(tsk));
76f969e8948d82 kernel/cgroup/cgroup.c Roman Gushchin             2019-04-19  7005  
82d6489d0fed2e kernel/cgroup.c        Daniel Bristot de Oliveira 2016-06-22  7006  	spin_unlock_irq(&css_set_lock);
817929ec274bcf kernel/cgroup.c        Paul Menage                2007-10-18  7007  
3ed80a62bf959d kernel/cgroup.c        Tejun Heo                  2014-02-08  7008  	/* see cgroup_post_fork() for details */
b4e0eeafba61b1 kernel/cgroup.c        Tejun Heo                  2016-02-22 @7009  	do_each_subsys_mask(ss, i, have_exit_callback) {
2e91fa7f6d451e kernel/cgroup.c        Tejun Heo                  2015-10-15  7010  		ss->exit(tsk);
b4e0eeafba61b1 kernel/cgroup.c        Tejun Heo                  2016-02-22  7011  	} while_each_subsys_mask();
d41d5a01631af8 kernel/cgroup.c        Peter Zijlstra             2011-02-07  7012  }
d41d5a01631af8 kernel/cgroup.c        Peter Zijlstra             2011-02-07  7013  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
