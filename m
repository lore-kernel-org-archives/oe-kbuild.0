Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 841EB1BBBE5
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Apr 2026 20:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776112672; cv=none; b=Mfk3Hs+m2yM7o2w4j3BF2+cPZJu9HJn8wmFfqdoJlxQPv/txZ/i51xmJZNfzHA1z67lzcqOcs2N27Q1qGv5EPip/5Rj1+HpzACo9niN+GzydqZp+69P/nQIk6Ck+LcqWZjTOuOcqKMhcIfDfke6O2lc8uKH9DhUOgnPfMGnZy5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776112672; c=relaxed/simple;
	bh=Df+isrnPa4WpVu8kTvurd5rfeFMxDcEFAZOWl3SlynM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RSNmZqAO+DkKe6yds6qYvBx3sFA+ZzAz6/mHwInQHMLTnnbHsBj6JCN/+Qr4utWmbpyLeNaZKm8LZ42XIAiXoZiA4jV0H8mX0tsnc+qMzAdklqGBbBEHm3ni5HMI8+jlpgsKE3im6/XD813aAlOO4d/Cw6/A0c2E/I0LBlf6KmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YvpJDyK8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YvpJDyK8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776112669; x=1807648669;
  h=date:from:to:cc:subject:message-id;
  bh=Df+isrnPa4WpVu8kTvurd5rfeFMxDcEFAZOWl3SlynM=;
  b=YvpJDyK8QMmEv5B85NfCcnNAb4s2GLdl++pKZVHQHo3MI8FgISHutqqQ
   6iXoYkHzvM1uoALESsumDcaFaoNw58E6Paketox0xLE9ikw5/E1Nd1KHj
   qgERGahx8p3ZpD9o/8/ulyB2QqaUN2UmL7eCmQ0E7cPkspkjidFA3nqQV
   4iyXV3wNUd+smnAkEZKOSeIgXOuMxJl13vKDpG1EdTnaYsDvDu4z1dhVZ
   i2860RbMTb5i9njv7+PCQxwPlRIKaiFw8WY0B1VqbW5MYp8VemiyCPS0J
   9woP3ewHsQyjloy/+o80NAtvQp59QKNJEyBzTnQT4K0XrkibV4Nvd6MVK
   A==;
X-CSE-ConnectionGUID: m2+8D8TOReq8d9l5ICeg6Q==
X-CSE-MsgGUID: jDAOpyxYRGChSSV8jASyYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="102515080"
X-IronPort-AV: E=Sophos;i="6.23,177,1770624000"; 
   d="scan'208";a="102515080"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 13:37:49 -0700
X-CSE-ConnectionGUID: Jw36+7cjSDmoxBZcKWmxQA==
X-CSE-MsgGUID: gfsdJAnURu6cuzMJOPeMdQ==
X-ExtLoop1: 1
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa003.fm.intel.com with ESMTP; 13 Apr 2026 13:37:49 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCO2U-0000000009Z-3YGr;
	Mon, 13 Apr 2026 20:37:46 +0000
Date: Mon, 13 Apr 2026 22:37:08 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: kernel/cgroup/cgroup.c:2985:17: error: implicit declaration
 of function 'proc_cgroup_migrate_connector'; did you mean
 'proc_cgrp_migrate_connector'?
Message-ID: <202604132216.KgzTydzn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Prakash Sangappa <prakash.sangappa@oracle.com>
CC: 0day robot <lkp@intel.com>

tree:   https://github.com/intel-lab-lkp/linux/commits/Prakash-Sangappa/netlink-Add-Netlink-process-event-for-cgroup-migration/20260413-212045
head:   819518d4c1d85b9d68bd1935a28a3a3ee9c46f8d
commit: 819518d4c1d85b9d68bd1935a28a3a3ee9c46f8d netlink: Add Netlink process event for cgroup migration
date:   7 hours ago
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260413/202604132216.KgzTydzn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260413/202604132216.KgzTydzn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202604132216.KgzTydzn-lkp@intel.com/

All errors (new ones prefixed by >>):

   kernel/cgroup/cgroup.c: In function 'cgroup_attach_task':
>> kernel/cgroup/cgroup.c:2985:17: error: implicit declaration of function 'proc_cgroup_migrate_connector'; did you mean 'proc_cgrp_migrate_connector'? [-Wimplicit-function-declaration]
    2985 |                 proc_cgroup_migrate_connector(leader, dst_cgrp);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 proc_cgrp_migrate_connector
--
   kernel/cgroup/cgroup-v1.c: In function 'cgroup_transfer_tasks':
>> kernel/cgroup/cgroup-v1.c:153:33: error: implicit declaration of function 'proc_cgroup_migrate_connector'; did you mean 'proc_cgrp_migrate_connector'? [-Wimplicit-function-declaration]
     153 |                                 proc_cgroup_migrate_connector(task, to);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                 proc_cgrp_migrate_connector


vim +2985 kernel/cgroup/cgroup.c

74a1166dfe1135 kernel/cgroup.c        Ben Blum                   2011-05-26  2951  
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2952  /**
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2953   * cgroup_attach_task - attach a task or a whole threadgroup to a cgroup
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2954   * @dst_cgrp: the cgroup to attach to
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2955   * @leader: the task or the leader of the threadgroup to be attached
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2956   * @threadgroup: attach the whole threadgroup?
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2957   *
1ed1328792ff46 kernel/cgroup.c        Tejun Heo                  2015-09-16  2958   * Call holding cgroup_mutex and cgroup_threadgroup_rwsem.
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2959   */
0a268dbd7932c7 kernel/cgroup/cgroup.c Tejun Heo                  2016-12-27  2960  int cgroup_attach_task(struct cgroup *dst_cgrp, struct task_struct *leader,
0a268dbd7932c7 kernel/cgroup/cgroup.c Tejun Heo                  2016-12-27  2961  		       bool threadgroup)
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2962  {
e595cd706982bf kernel/cgroup/cgroup.c Tejun Heo                  2017-01-15  2963  	DEFINE_CGROUP_MGCTX(mgctx);
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2964  	struct task_struct *task;
6df970e4f5d2c2 kernel/cgroup/cgroup.c Christian Brauner          2020-02-05  2965  	int ret = 0;
6c694c88255b20 kernel/cgroup.c        Tejun Heo                  2016-03-08  2966  
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2967  	/* look up all src csets */
82d6489d0fed2e kernel/cgroup.c        Daniel Bristot de Oliveira 2016-06-22  2968  	spin_lock_irq(&css_set_lock);
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2969  	task = leader;
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2970  	do {
e595cd706982bf kernel/cgroup/cgroup.c Tejun Heo                  2017-01-15  2971  		cgroup_migrate_add_src(task_css_set(task), dst_cgrp, &mgctx);
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2972  		if (!threadgroup)
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2973  			break;
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2974  	} while_each_thread(leader, task);
82d6489d0fed2e kernel/cgroup.c        Daniel Bristot de Oliveira 2016-06-22  2975  	spin_unlock_irq(&css_set_lock);
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2976  
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2977  	/* prepare dst csets and commit */
e595cd706982bf kernel/cgroup/cgroup.c Tejun Heo                  2017-01-15  2978  	ret = cgroup_migrate_prepare_dst(&mgctx);
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2979  	if (!ret)
bfc2cf6f61fcea kernel/cgroup/cgroup.c Tejun Heo                  2017-01-15  2980  		ret = cgroup_migrate(leader, threadgroup, &mgctx);
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2981  
e595cd706982bf kernel/cgroup/cgroup.c Tejun Heo                  2017-01-15  2982  	cgroup_migrate_finish(&mgctx);
ed1777de25e45b kernel/cgroup.c        Tejun Heo                  2016-08-10  2983  
819518d4c1d85b kernel/cgroup/cgroup.c Prakash Sangappa           2026-04-07  2984  	if (!ret) {
819518d4c1d85b kernel/cgroup/cgroup.c Prakash Sangappa           2026-04-07 @2985  		proc_cgroup_migrate_connector(leader, dst_cgrp);
e4f8d81c738db6 kernel/cgroup/cgroup.c Steven Rostedt (VMware     2018-07-09  2986) 		TRACE_CGROUP_PATH(attach_task, dst_cgrp, leader, threadgroup);
819518d4c1d85b kernel/cgroup/cgroup.c Prakash Sangappa           2026-04-07  2987  	}
ed1777de25e45b kernel/cgroup.c        Tejun Heo                  2016-08-10  2988  
1958d2d53dadbb kernel/cgroup.c        Tejun Heo                  2014-02-25  2989  	return ret;
74a1166dfe1135 kernel/cgroup.c        Ben Blum                   2011-05-26  2990  }
74a1166dfe1135 kernel/cgroup.c        Ben Blum                   2011-05-26  2991  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
