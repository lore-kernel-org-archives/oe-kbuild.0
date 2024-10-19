Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87CB8AD52
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Oct 2024 13:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729343436; cv=none; b=L9WwCvT8wiD8696fKuDD3rTV0ketz/lSt8XrYetKKq4gaPdEv0CRgGj/8QMUQqKcXN8udtnTUw8d6fmVXCdZPnGS73+j9gyqLR7WdQXnARVAiJlNIJRtFSqdflIWJ9SpkQ7ksCupvjGCVwsZHP9myerJsawnPu8wFLT6ZUeKZpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729343436; c=relaxed/simple;
	bh=Lzqj7kddrXNWEuQJoXnVoD4NjHl+PCXtJVSpCNrdoT0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=amb1bgyxJILQ23XulGCMz5ENPlh3Rcgfz+V7DJcfXP7dlJ5hoK1jvSdJsvWWt2nkNFqV5IVvX2tMzBLDEY4P43xj8kJSFSS5RgPbECug57KcDuq35T68Ni8XjkztL3idcn8LNJ2mx2iNWc+QZk6Y+2ToA62vdK8sVx6YWe6Jy8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FODbnNjD; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FODbnNjD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729343435; x=1760879435;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Lzqj7kddrXNWEuQJoXnVoD4NjHl+PCXtJVSpCNrdoT0=;
  b=FODbnNjDmMixGkI85eb38tlqkYUxiI7aRnW5czr505Z8xAHgKUAvoOon
   KAkCms0aNxlNnmnxnBj06RNbEjviTBcpf+fpddC+w9pNrZfXu87FZTS0U
   /fiiERUuyj+8851H9ContyRpBd3QAAQQUigdTz0olW02i9LVtawaIDGJx
   HHLACQUQ2O6kbRl9Z/LPDTutaAqSJgdoHYIMtI+oy52vP0wAIcZDga3Ru
   Pj1q731DWIsXbgbWbrYN27dTWO1rRCpF4Zlp1lgxxrYB92MIf78ZRgPgt
   CHAo4EBC78k5+sbmXKTWzw1ajkvr4WTkqKd/aV1ak8++QZLfTD/KVQac5
   w==;
X-CSE-ConnectionGUID: C8p41PHOTrC+LmHn4pRmwQ==
X-CSE-MsgGUID: +wC1q3FiSXCGdt1ve+jbbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11230"; a="54284832"
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="54284832"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2024 06:10:34 -0700
X-CSE-ConnectionGUID: 7sumAD73Qum/hnZ5IZJF5A==
X-CSE-MsgGUID: AIS5RRcZSlO8CSoG8JYzVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,216,1725346800"; 
   d="scan'208";a="79130765"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 19 Oct 2024 06:10:33 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t29Dy-000P1R-2q;
	Sat, 19 Oct 2024 13:10:30 +0000
Date: Sat, 19 Oct 2024 21:10:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: kernel/cgroup/misc.c:385 __misc_events_show() warn: we never enter
 this loop
Message-ID: <202410192128.SLQHUGv7-lkp@intel.com>
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
TO: Xiu Jianfeng <xiujianfeng@huawei.com>
CC: Tejun Heo <tj@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3d5ad2d4eca337e80f38df77de89614aa5aaceb9
commit: 6a26f9c68901797261bc145975a02f85be0c1d8f cgroup/misc: Introduce misc.events.local
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
config: xtensa-randconfig-r071-20241015 (https://download.01.org/0day-ci/archive/20241019/202410192128.SLQHUGv7-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410192128.SLQHUGv7-lkp@intel.com/

smatch warnings:
kernel/cgroup/misc.c:385 __misc_events_show() warn: we never enter this loop

vim +385 kernel/cgroup/misc.c

a72232eabdfcfe Vipin Sharma 2021-03-29  378  
6a26f9c6890179 Xiu Jianfeng 2024-07-11  379  static int __misc_events_show(struct seq_file *sf, bool local)
f279294b329363 Chunguang Xu 2021-09-17  380  {
f279294b329363 Chunguang Xu 2021-09-17  381  	struct misc_cg *cg = css_misc(seq_css(sf));
32bf85c60ca358 Haitao Huang 2023-07-17  382  	u64 events;
32bf85c60ca358 Haitao Huang 2023-07-17  383  	int i;
f279294b329363 Chunguang Xu 2021-09-17  384  
f279294b329363 Chunguang Xu 2021-09-17 @385  	for (i = 0; i < MISC_CG_RES_TYPES; i++) {
6a26f9c6890179 Xiu Jianfeng 2024-07-11  386  		if (local)
6a26f9c6890179 Xiu Jianfeng 2024-07-11  387  			events = atomic64_read(&cg->res[i].events_local);
6a26f9c6890179 Xiu Jianfeng 2024-07-11  388  		else
32bf85c60ca358 Haitao Huang 2023-07-17  389  			events = atomic64_read(&cg->res[i].events);
f279294b329363 Chunguang Xu 2021-09-17  390  		if (READ_ONCE(misc_res_capacity[i]) || events)
32bf85c60ca358 Haitao Huang 2023-07-17  391  			seq_printf(sf, "%s.max %llu\n", misc_res_name[i], events);
f279294b329363 Chunguang Xu 2021-09-17  392  	}
f279294b329363 Chunguang Xu 2021-09-17  393  	return 0;
f279294b329363 Chunguang Xu 2021-09-17  394  }
f279294b329363 Chunguang Xu 2021-09-17  395  

:::::: The code at line 385 was first introduced by commit
:::::: f279294b329363eb6ada568e494d609ef78e3e8e misc_cgroup: introduce misc.events to count failures

:::::: TO: Chunguang Xu <brookxu@tencent.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
