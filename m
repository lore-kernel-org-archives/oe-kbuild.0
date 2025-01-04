Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2C777F1B
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Jan 2025 13:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735998289; cv=none; b=TEXq0PS6urcYUQS0Nw4qQK0XeJq1qfWagvL4zwE9CKOxV4g3g9g28TpqJbd+BfLj63C4ezlONcqbQAyaLuGAUiCX4h+N4frsWm+pVVGEPkw3L6py9KxZEkL8++gsxSh17tRzS017Hk2p9s+sfKTJmwK7RfOBq6d25FjNkGb92Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735998289; c=relaxed/simple;
	bh=bEh7faogB/rj/6mG+v1XCjYcybQVThQAUo7pOzyaSZE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AjRQlzXsdzNTNobffe2K6Gt/x3LKI9iSl78jgld+JP4PaA8b8B3J6NcMz95W/cS5mnb0MwhE76Dsq4FwXHOGe/RZ2ju1hdBOc4CI02Xg+p4vpLToOIKXCN9HVpbBZMZKlXQBFfsi5noFkZCiQ11gaqGJf/F2X/CCsMZ/w5jkbmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NUE6X8Dd; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NUE6X8Dd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735998287; x=1767534287;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=bEh7faogB/rj/6mG+v1XCjYcybQVThQAUo7pOzyaSZE=;
  b=NUE6X8DdqAeJ64FsGobFfjNC8v12aNpDNcBDwZUSyiP7YSE/WkM1pc8N
   LK7pC04GxdhILhzZWI4uwShLg81dDsXtNS2ZNeXa+3+zXJIZnlHZCppis
   h198gMKsuJAeMeT4SvZDGSt2R0ACM7fZJ3mOvlhentR618xiy7YtetI2b
   dDTfMWSU7HMamE4HDJvP7g28Vq1tifNlGO/PlYxCllU+7t4q1XkUjMdqz
   8DeTxlnGGrqZG/5BJMtaQ4MHf1dL9Kv8M9ZtcR69GjN6n2tVEc+XuRNYM
   JHfvtUWvNDYHclPRrDgEChU8JtlCnNdMjE+Als/WjfMRHjjMdamvgRZJZ
   g==;
X-CSE-ConnectionGUID: vvvGscB8SoOEH4RvPF9r+A==
X-CSE-MsgGUID: mDvdqty2RoOzN3dZtINa/Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="40145486"
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="40145486"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2025 05:44:46 -0800
X-CSE-ConnectionGUID: 7ywjOG3/R3WR169KZ+c/Xg==
X-CSE-MsgGUID: URXLN1qsTRm1MaEv3kfvJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,288,1728975600"; 
   d="scan'208";a="101809929"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jan 2025 05:44:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tU4SJ-000AwR-0U;
	Sat, 04 Jan 2025 13:44:43 +0000
Date: Sat, 4 Jan 2025 21:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: hotplug.bpf.c:15:42: warning: declaration of 'struct scx_exit_info'
 will not be visible outside of this function
Message-ID: <202501042104.qwmnqKH5-lkp@intel.com>
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
head:   63676eefb7a026d04b51dcb7aaf54f358517a2ec
commit: 7941b83bceb374c7e81061e0ebb45cd45f3e3517 selftests: sched_ext: Add sched_ext as proper selftest target
date:   3 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 3 months ago
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250104/202501042104.qwmnqKH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501042104.qwmnqKH5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from hotplug.bpf.c:7:
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
>> hotplug.bpf.c:15:42: warning: declaration of 'struct scx_exit_info' will not be visible outside of this function [-Wvisibility]
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
>> hotplug.bpf.c:15:42: warning: declaration of 'struct scx_exit_info' will not be visible outside of this function [-Wvisibility]
   hotplug.bpf.c:15:6: error: conflicting types for '____hotplug_exit'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |      ^
   tools/sched_ext/include/scx/common.bpf.h:140:32: note: expanded from macro 'BPF_STRUCT_OPS'
     140 | SEC("struct_ops/"#name)                                                         \
         |                                                                                 ^
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_tracing.h:683:48: note: expanded from macro '\
   BPF_PROG'
     683 | static __always_inline typeof(name(0))                                      \
         |                                                                             ^
   <scratch space>:42:1: note: expanded from here
      42 | ____hotplug_exit
         | ^
   hotplug.bpf.c:15:6: note: previous declaration is here
   tools/sched_ext/include/scx/common.bpf.h:140:32: note: expanded from macro 'BPF_STRUCT_OPS'
     140 | SEC("struct_ops/"#name)                                                         \
         |                                                                                 ^
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_tracing.h:674:48: note: expanded from macro '\
   BPF_PROG'
     674 | static __always_inline typeof(name(0))                                      \
         |                                                                             ^
   <scratch space>:33:1: note: expanded from here
      33 | ____hotplug_exit
         | ^
   hotplug.bpf.c:17:2: error: incomplete definition of type 'struct scx_exit_info'
      17 |         UEI_RECORD(uei, ei);
         |         ^~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/user_exit_info.h:42:40: note: expanded from macro 'UEI_RECORD'
      42 |                                   sizeof(__uei_name.reason), (__ei)->reason);   \
         |                                                              ~~~~~~^
   hotplug.bpf.c:15:42: note: forward declaration of 'struct scx_exit_info'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
   hotplug.bpf.c:17:2: error: incomplete definition of type 'struct scx_exit_info'
      17 |         UEI_RECORD(uei, ei);
         |         ^~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/user_exit_info.h:44:37: note: expanded from macro 'UEI_RECORD'
      44 |                                   sizeof(__uei_name.msg), (__ei)->msg);         \
         |                                                           ~~~~~~^
   hotplug.bpf.c:15:42: note: forward declaration of 'struct scx_exit_info'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
   hotplug.bpf.c:17:2: error: incomplete definition of type 'struct scx_exit_info'
      17 |         UEI_RECORD(uei, ei);
         |         ^~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/user_exit_info.h:46:36: note: expanded from macro 'UEI_RECORD'
      46 |                                   __uei_name##_dump_len, (__ei)->dump);         \
         |                                                          ~~~~~~^
   hotplug.bpf.c:15:42: note: forward declaration of 'struct scx_exit_info'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
   hotplug.bpf.c:17:2: error: incomplete definition of type 'struct scx_exit_info'
      17 |         UEI_RECORD(uei, ei);
         |         ^~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/user_exit_info.h:47:34: note: expanded from macro 'UEI_RECORD'
      47 |         if (bpf_core_field_exists((__ei)->exit_code))                           \
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_core_read.h:188:49: note: expanded from macro 'bpf_core_field_exists'
     188 |         __builtin_preserve_field_info(___bpf_field_ref(field), BPF_FIELD_EXISTS)
         |                                       ~~~~~~~~~~~~~~~~~^~~~~~
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_core_read.h:173:52: note: expanded from macro '___bpf_field_ref'
     173 |         ___bpf_apply(___bpf_field_ref, ___bpf_narg(args))(args)
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~
   tools/testing/selftests/sched_ext/build/include/bpf/bpf_core_read.h:166:35: note: expanded from macro '___bpf_field_ref1'
     166 | #define ___bpf_field_ref1(field)        (field)
         |                                          ^~~~~
   hotplug.bpf.c:15:42: note: forward declaration of 'struct scx_exit_info'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
   hotplug.bpf.c:17:2: error: incomplete definition of type 'struct scx_exit_info'
      17 |         UEI_RECORD(uei, ei);
         |         ^~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/user_exit_info.h:48:32: note: expanded from macro 'UEI_RECORD'
      48 |                 __uei_name.exit_code = (__ei)->exit_code;                       \
         |                                        ~~~~~~^
   hotplug.bpf.c:15:42: note: forward declaration of 'struct scx_exit_info'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
   hotplug.bpf.c:17:2: error: incomplete definition of type 'struct scx_exit_info'
      17 |         UEI_RECORD(uei, ei);
         |         ^~~~~~~~~~~~~~~~~~~
   tools/sched_ext/include/scx/user_exit_info.h:51:15: note: expanded from macro 'UEI_RECORD'
      51 |                                     (__ei)->kind);                              \
         |                                     ~~~~~~^
   hotplug.bpf.c:15:42: note: forward declaration of 'struct scx_exit_info'
      15 | void BPF_STRUCT_OPS(hotplug_exit, struct scx_exit_info *ei)
         |                                          ^
   hotplug.bpf.c:28:13: error: use of undeclared identifier 'SCX_ECODE_ACT_RESTART'
      28 |         s64 code = SCX_ECODE_ACT_RESTART | HOTPLUG_EXIT_RSN;
         |                    ^
   hotplug.bpf.c:48:22: error: variable has incomplete type 'struct sched_ext_ops'
      48 | struct sched_ext_ops hotplug_cb_ops = {
         |                      ^
   hotplug.bpf.c:48:8: note: forward declaration of 'struct sched_ext_ops'
      48 | struct sched_ext_ops hotplug_cb_ops = {
         |        ^
   hotplug.bpf.c:57:22: error: variable has incomplete type 'struct sched_ext_ops'
      57 | struct sched_ext_ops hotplug_nocb_ops = {
         |                      ^
   hotplug.bpf.c:48:8: note: forward declaration of 'struct sched_ext_ops'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
