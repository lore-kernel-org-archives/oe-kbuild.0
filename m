Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75A7B1E32BE
	for <oe-kbuild@lists.linux.dev>; Thu, 29 May 2025 20:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748550718; cv=none; b=JCHuDaH8LB7VzdV+Rxs5YfNKnhAUgBZmISYrI5zrY4zFOCs2w56Lx816jQesyX9yWeNQbJmYCb7uZhKqVPJ9NO3lwyO1XpYaLXPyQ1w/XzEF1N0jPP3lpp/nIpScityKtDgn/meKoKvTzVw5cfp9f1T80i6tjGRWUN57rY91DqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748550718; c=relaxed/simple;
	bh=9gU63y35s+MhsQx02DMjin3lHacBIrXpQmpY+NFK4mw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dbpHCvEgBfGGubsvFuPr2KxYBfIEu+95ltT6bI3kZgjHjCJER6P4qHaH1mA9bD4bx6guj0Rp759vjp9q5gkQ59ZSP4jSd03I26K3WYC9dhFSv7FKoymWGzhLERlnytnDxInshc7IX1Rap0aNDiIo291jDwgF0lFJTwbJgEtDf14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cQNG9kBX; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cQNG9kBX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748550716; x=1780086716;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9gU63y35s+MhsQx02DMjin3lHacBIrXpQmpY+NFK4mw=;
  b=cQNG9kBXhzlsCos+gjXIheoC3gYKHJjDp0M/SGkiuPsvPiMfR0zWYEZS
   UJsBSGEQLheyeP50woO5hGIm6KccOHrZo293ertDO64owLUZq4PH+ElGc
   v600KnbRS+KZXxDx4DNcWjJt4AdTWp8Wv07JRoCmlMPtSQ73QI1up1eK5
   H85iga2g7kRZNJlHth5B0Z25RlzALO/dhuTL3hsqfUfAKcavCuTRLGht5
   WxSKYTmXA1zfbnCxFhRfoAYCxvvG8vcb+z83snUtUSrwY7qNocdkrBZYK
   GgAyxHLI2JFeSKn2TQZMg7jQNtuVhY971j8dEYFjqEsdVutPsqSnYZIsC
   g==;
X-CSE-ConnectionGUID: hcfZPNmESBahjBDT8/l8kA==
X-CSE-MsgGUID: oLqNUy0rTMSofrY6LO3udg==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="61296602"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="61296602"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 13:31:55 -0700
X-CSE-ConnectionGUID: 7fx5kIsbRtioZUQRhiyT+g==
X-CSE-MsgGUID: Ju92TXBgRW+IN31zZossvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="143694648"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 May 2025 13:31:53 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKjup-000X4G-00;
	Thu, 29 May 2025 20:31:51 +0000
Date: Fri, 30 May 2025 04:30:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Add bpf_task_cwd_from_pid() kfunc
Message-ID: <202505300432.nZC50gOu-lkp@intel.com>
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
In-Reply-To: <tencent_97F8B56B340F51DB604B482FEBF012460505@qq.com>
References: <tencent_97F8B56B340F51DB604B482FEBF012460505@qq.com>
TO: Rong Tao <rtoax@foxmail.com>
TO: ast@kernel.org
TO: daniel@iogearbox.net
CC: rtoax@foxmail.com
CC: rongtao@cestc.cn
CC: Andrii Nakryiko <andrii@kernel.org>
CC: Martin KaFai Lau <martin.lau@linux.dev>
CC: Eduard Zingerman <eddyz87@gmail.com>
CC: Song Liu <song@kernel.org>
CC: Yonghong Song <yonghong.song@linux.dev>
CC: John Fastabend <john.fastabend@gmail.com>
CC: KP Singh <kpsingh@kernel.org>
CC: Stanislav Fomichev <sdf@fomichev.me>
CC: Hao Luo <haoluo@google.com>
CC: Jiri Olsa <jolsa@kernel.org>
CC: Mykola Lysenko <mykolal@fb.com>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Juntong Deng <juntong.deng@outlook.com>
CC: Amery Hung <amery.hung@bytedance.com>
CC: Dave Marchevsky <davemarchevsky@fb.com>
CC: Hou Tao <houtao1@huawei.com>
CC: "(open list:BPF \(Safe Dynamic Programs and Tools\))" <bpf@vger.kernel.org> (open list:BPF (Safe Dynamic Programs and Tools))
CC: linux-kernel@vger.kernel.org
CC: linux-kselftest@vger.kernel.org

Hi Rong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Rong-Tao/selftests-bpf-Add-selftests-for-bpf_task_cwd_from_pid/20250529-113933
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/tencent_97F8B56B340F51DB604B482FEBF012460505%40qq.com
patch subject: [PATCH bpf-next 1/2] bpf: Add bpf_task_cwd_from_pid() kfunc
:::::: branch date: 17 hours ago
:::::: commit date: 17 hours ago
config: x86_64-randconfig-161-20250529 (https://download.01.org/0day-ci/archive/20250530/202505300432.nZC50gOu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505300432.nZC50gOu-lkp@intel.com/

smatch warnings:
kernel/bpf/helpers.c:2687 bpf_task_cwd_from_pid() warn: inconsistent returns 'rcu_read'.

vim +/rcu_read +2687 kernel/bpf/helpers.c

675c3596ff32c0 Juntong Deng 2024-10-14  2649  
b24383bde5a454 Rong Tao     2025-05-29  2650  /**
b24383bde5a454 Rong Tao     2025-05-29  2651   * bpf_task_cwd_from_pid - Get a task's absolute pathname of the current
b24383bde5a454 Rong Tao     2025-05-29  2652   * working directory from its pid.
b24383bde5a454 Rong Tao     2025-05-29  2653   * @pid: The pid of the task being looked up.
b24383bde5a454 Rong Tao     2025-05-29  2654   * @buf: The array pointed to by buf.
b24383bde5a454 Rong Tao     2025-05-29  2655   * @buf_len: buf length.
b24383bde5a454 Rong Tao     2025-05-29  2656   */
b24383bde5a454 Rong Tao     2025-05-29  2657  __bpf_kfunc int bpf_task_cwd_from_pid(s32 pid, char *buf, u32 buf_len)
b24383bde5a454 Rong Tao     2025-05-29  2658  {
b24383bde5a454 Rong Tao     2025-05-29  2659  	struct path pwd;
b24383bde5a454 Rong Tao     2025-05-29  2660  	char kpath[256], *path;
b24383bde5a454 Rong Tao     2025-05-29  2661  	struct task_struct *task;
b24383bde5a454 Rong Tao     2025-05-29  2662  
b24383bde5a454 Rong Tao     2025-05-29  2663  	if (!buf || buf_len == 0)
b24383bde5a454 Rong Tao     2025-05-29  2664  		return -EINVAL;
b24383bde5a454 Rong Tao     2025-05-29  2665  
b24383bde5a454 Rong Tao     2025-05-29  2666  	rcu_read_lock();
b24383bde5a454 Rong Tao     2025-05-29  2667  	task = pid_task(find_vpid(pid), PIDTYPE_PID);
b24383bde5a454 Rong Tao     2025-05-29  2668  	if (!task) {
b24383bde5a454 Rong Tao     2025-05-29  2669  		rcu_read_unlock();
b24383bde5a454 Rong Tao     2025-05-29  2670  		return -ESRCH;
b24383bde5a454 Rong Tao     2025-05-29  2671  	}
b24383bde5a454 Rong Tao     2025-05-29  2672  	task_lock(task);
b24383bde5a454 Rong Tao     2025-05-29  2673  	if (!task->fs) {
b24383bde5a454 Rong Tao     2025-05-29  2674  		task_unlock(task);
b24383bde5a454 Rong Tao     2025-05-29  2675  		return -ENOENT;
b24383bde5a454 Rong Tao     2025-05-29  2676  	}
b24383bde5a454 Rong Tao     2025-05-29  2677  	get_fs_pwd(task->fs, &pwd);
b24383bde5a454 Rong Tao     2025-05-29  2678  	task_unlock(task);
b24383bde5a454 Rong Tao     2025-05-29  2679  	rcu_read_unlock();
b24383bde5a454 Rong Tao     2025-05-29  2680  
b24383bde5a454 Rong Tao     2025-05-29  2681  	path = d_path(&pwd, kpath, sizeof(kpath));
b24383bde5a454 Rong Tao     2025-05-29  2682  	path_put(&pwd);
b24383bde5a454 Rong Tao     2025-05-29  2683  	if (IS_ERR(path))
b24383bde5a454 Rong Tao     2025-05-29  2684  		return PTR_ERR(path);
b24383bde5a454 Rong Tao     2025-05-29  2685  
b24383bde5a454 Rong Tao     2025-05-29  2686  	strncpy(buf, path, buf_len);
b24383bde5a454 Rong Tao     2025-05-29 @2687  	return 0;
b24383bde5a454 Rong Tao     2025-05-29  2688  }
b24383bde5a454 Rong Tao     2025-05-29  2689  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
