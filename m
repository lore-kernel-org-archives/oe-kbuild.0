Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFED3125DF
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jan 2025 03:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736478081; cv=none; b=V1GX4lHCKHQOhkzmoCWxPhPk0065q7myAfTA43l5MLZ1AqJyUrjcPMRmyRzC2TzOo5i3qVk+tWBF2xWVmndfGM3ZycJyLvWibfHbAJRsonQn3iHOnlp/ze4K2ik1gFlXLPfwrg61QIwELfBdUGLPTuhKt3r6Q3+00VYJaou4jU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736478081; c=relaxed/simple;
	bh=AJVx9iSE5xA56A5abpg5K8E8Pcmk1h4SePXeW/v5eOk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YiR+FoLVaMLTDVOgGv3hBa2Tk/l6St/rQ4uASqQMrj8sBq/6VlLVK3iqkIpSlNb+CHxUY/BpmaOlvupKgyHV4yTd9Q8wL9dURp9htBlrOWLxiHcopHt02heGBMv6zIljglAmkOq2MJAbQgItRg8so0I07MU0IBGtcbV826oU2LM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NWZnkc2q; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NWZnkc2q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736478080; x=1768014080;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AJVx9iSE5xA56A5abpg5K8E8Pcmk1h4SePXeW/v5eOk=;
  b=NWZnkc2qu/TTq5nwQTsGOhD2Me4EzZZaTOEdsma2fg9ySZ8s6VnZYJK0
   DzzARHMTEknTQ7JczudUqRwzTUmuv4X//rwQTRYmjU6xP+Xb4E4OysdXm
   fBB7jae3+pZdvsQrURzsdEWWuQ+LgO4PtaScRBIEH0hQb7oYZeKv89N0u
   jP43geij/5hL8LzXkv9nMjKoZkf6yxRfApQsj3DYWTTcZUJYjSeBpA5M+
   YO9fZg00GhciqW9fv8MWJzZtll7OCgnaDkXt5eDdjVBDiewTVOu1GViN6
   KcsDHD3FagM/vZBjO4X7zaxwOzIRicFXpfVc2ABOhiq1VuWlbW+wFzjg3
   A==;
X-CSE-ConnectionGUID: 26voit7bRimhmu+NtngtcA==
X-CSE-MsgGUID: sb0ODkldQeWJ/PQ2+SPwpA==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="54306645"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="54306645"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 19:01:19 -0800
X-CSE-ConnectionGUID: uSPkhspQQLGmsyzCp2K2sw==
X-CSE-MsgGUID: a9PcklnoQ8OPPJOLNpd0yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="104128413"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 09 Jan 2025 19:01:18 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW5Gu-000IRy-0H;
	Fri, 10 Jan 2025 03:01:16 +0000
Date: Fri, 10 Jan 2025 11:00:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: create_dsq.bpf.c:14:14: warning: declaration of 'struct
 scx_exit_task_args' will not be visible outside of this function
Message-ID: <202501101038.TgWyCFFu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Björn Töpel" <bjorn@rivosinc.com>
CC: Tejun Heo <tj@kernel.org>
CC: Shuah Khan <skhan@linuxfoundation.org>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c77cd47cee041bc1664b8e5fcd23036e5aab8e2a
commit: 7941b83bceb374c7e81061e0ebb45cd45f3e3517 selftests: sched_ext: Add sched_ext as proper selftest target
date:   3 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 3 months ago
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501101038.TgWyCFFu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501101038.TgWyCFFu-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from create_dsq.bpf.c:9:
   tools/sched_ext/include/scx/common.bpf.h:33:17: error: use of undeclared identifier 'SCX_DSQ_FLAG_BUILTIN'
      33 |         _Static_assert(SCX_DSQ_FLAG_BUILTIN,
         |                        ^
   tools/sched_ext/include/scx/common.bpf.h:44:49: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      44 | void scx_bpf_dispatch_from_dsq_set_slice(struct bpf_iter_scx_dsq *it__iter, u64 slice) __ksym __weak;
         |                                                 ^
   tools/sched_ext/include/scx/common.bpf.h:45:49: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      45 | void scx_bpf_dispatch_from_dsq_set_vtime(struct bpf_iter_scx_dsq *it__iter, u64 vtime) __ksym __weak;
         |                                                 ^
   tools/sched_ext/include/scx/common.bpf.h:46:39: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      46 | bool scx_bpf_dispatch_from_dsq(struct bpf_iter_scx_dsq *it__iter, struct task_struct *p, u64 dsq_id, u64 enq_flags) __ksym __weak;
         |                                       ^
   tools/sched_ext/include/scx/common.bpf.h:47:45: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      47 | bool scx_bpf_dispatch_vtime_from_dsq(struct bpf_iter_scx_dsq *it__iter, struct task_struct *p, u64 dsq_id, u64 enq_flags) __ksym __weak;
         |                                             ^
   tools/sched_ext/include/scx/common.bpf.h:52:33: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      52 | int bpf_iter_scx_dsq_new(struct bpf_iter_scx_dsq *it, u64 dsq_id, u64 flags) __ksym __weak;
         |                                 ^
   tools/sched_ext/include/scx/common.bpf.h:53:50: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      53 | struct task_struct *bpf_iter_scx_dsq_next(struct bpf_iter_scx_dsq *it) __ksym __weak;
         |                                                  ^
   tools/sched_ext/include/scx/common.bpf.h:54:38: warning: declaration of 'struct bpf_iter_scx_dsq' will not be visible outside of this function [-Wvisibility]
      54 | void bpf_iter_scx_dsq_destroy(struct bpf_iter_scx_dsq *it) __ksym __weak;
         |                                      ^
>> create_dsq.bpf.c:14:14: warning: declaration of 'struct scx_exit_task_args' will not be visible outside of this function [-Wvisibility]
      14 |                     struct scx_exit_task_args *args)
         |                            ^
>> create_dsq.bpf.c:14:14: warning: declaration of 'struct scx_exit_task_args' will not be visible outside of this function [-Wvisibility]
   create_dsq.bpf.c:13:6: error: conflicting types for '____create_dsq_exit_task'
      13 | void BPF_STRUCT_OPS(create_dsq_exit_task, struct task_struct *p,
         |      ^
   tools/sched_ext/include/scx/common.bpf.h:140:32: note: expanded from macro 'BPF_STRUCT_OPS'
     140 | SEC("struct_ops/"#name)                                                         \
         |                                                                                 ^
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_tracing.h:683:48: note: expanded from macro '\
   BPF_PROG'
     683 | static __always_inline typeof(name(0))                                      \
         |                                                                             ^
   <scratch space>:26:1: note: expanded from here
      26 | ____create_dsq_exit_task
         | ^
   create_dsq.bpf.c:13:6: note: previous declaration is here
   tools/sched_ext/include/scx/common.bpf.h:140:32: note: expanded from macro 'BPF_STRUCT_OPS'
     140 | SEC("struct_ops/"#name)                                                         \
         |                                                                                 ^
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_tracing.h:674:48: note: expanded from macro '\
   BPF_PROG'
     674 | static __always_inline typeof(name(0))                                      \
         |                                                                             ^
   <scratch space>:17:1: note: expanded from here
      17 | ____create_dsq_exit_task
         | ^
>> create_dsq.bpf.c:20:16: warning: declaration of 'struct scx_init_task_args' will not be visible outside of this function [-Wvisibility]
      20 |                              struct scx_init_task_args *args)
         |                                     ^
>> create_dsq.bpf.c:20:16: warning: declaration of 'struct scx_init_task_args' will not be visible outside of this function [-Wvisibility]
   create_dsq.bpf.c:19:5: error: conflicting types for '____create_dsq_init_task'
      19 | s32 BPF_STRUCT_OPS_SLEEPABLE(create_dsq_init_task, struct task_struct *p,
         |     ^
   tools/sched_ext/include/scx/common.bpf.h:144:33: note: expanded from macro 'BPF_STRUCT_OPS_SLEEPABLE'
     144 | SEC("struct_ops.s/"#name)                                                       \
         |                                                                                 ^
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_tracing.h:683:48: note: expanded from macro '\
   BPF_PROG'
     683 | static __always_inline typeof(name(0))                                      \
         |                                                                             ^
   <scratch space>:43:1: note: expanded from here
      43 | ____create_dsq_init_task
         | ^
   create_dsq.bpf.c:19:5: note: previous declaration is here
   tools/sched_ext/include/scx/common.bpf.h:144:33: note: expanded from macro 'BPF_STRUCT_OPS_SLEEPABLE'
     144 | SEC("struct_ops.s/"#name)                                                       \
         |                                                                                 ^
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_tracing.h:674:48: note: expanded from macro '\
   BPF_PROG'
     674 | static __always_inline typeof(name(0))                                      \
         |                                                                             ^
   <scratch space>:34:1: note: expanded from here
      34 | ____create_dsq_init_task
         | ^
   create_dsq.bpf.c:53:22: error: variable has incomplete type 'struct sched_ext_ops'
      53 | struct sched_ext_ops create_dsq_ops = {
         |                      ^
   create_dsq.bpf.c:53:8: note: forward declaration of 'struct sched_ext_ops'
      53 | struct sched_ext_ops create_dsq_ops = {
         |        ^
   11 warnings and 4 errors generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
