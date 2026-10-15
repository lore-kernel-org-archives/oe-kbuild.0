Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B2C445DF4F
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Oct 2026 18:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792089726; cv=none; b=jNmxevaPTB49peJpmqSzrPZPomt5o8EPMZkqUi6h7LzyAYCccoubPvNj/3CE9V9uyEcH8h1ztdKqPO806vCOoDiZIRfjuk5ZdmGkzXFlL2oIsMQ4tdhGfbmeUWwcXPRB4teOrG3poVKRZV/+2QiLsiC7cZjRBCy48lwYMdd42XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792089726; c=relaxed/simple;
	bh=S0NMVfBWGwagx8mf9/C6eX7e0SjjxsGQAdvRw2Wua7U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KDq4HWfPui/yfpLb7ppJ7D5W2i6wxk3CKXL0s2AH8KXNE+QaiplvQLPqElVzxxgmBlUhL+eJ9eCk48BtPp1mozsx5sG+9KVHLBMMAOsvv/3DUZ8OWOj0etvEDxgDwiBCsf2VlsF83UcbIOjdx1cihQJu5UMIq/FuPfDqNtbovS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TD6oraG7; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TD6oraG7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792089719; x=1823625719;
  h=date:from:to:cc:subject:message-id;
  bh=S0NMVfBWGwagx8mf9/C6eX7e0SjjxsGQAdvRw2Wua7U=;
  b=TD6oraG7Y/fMv6QTeRRi0Tm8YK2IgQ1cDyqbyiJVLu26MOOBtcTGtN1N
   cygoD7uVYfUV3of+kahA1VqKDgYNpHbF0pFn/sfX9Az9oL9ttNSYdD9/U
   WjIu2bpaLJtmPxTf9DNARZbcL2+gQlkrMBkoWiwE/hZNhi04EIpMazC2R
   HQQENDXLqyO8xvgTik2mf7xZOIrBiZdXvkjgllZn++qslL4yoAgnTN/iS
   bbCF0+6d6GUKiBGImHtufHimHw5TFGOlVX1l2cXtJJRxD6/mYpdDzArC7
   tj1FQZxfOuM7rObE5YTK/TKVvj+Wm51jtb8eDD3/+5qhODLFHt6AM00Oj
   Q==;
X-CSE-ConnectionGUID: f+NJXkZ/QKOk631XYiYVnQ==
X-CSE-MsgGUID: smxDxKFtS6e95av3fuLgbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="881331"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="881331"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 11:41:58 -0700
X-CSE-ConnectionGUID: qVQvOoO9RlKvnIr288NDiw==
X-CSE-MsgGUID: vlL3gubUTDKcLuWnQQRbTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="2081434"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 15 Oct 2026 11:41:58 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xHQOp-00000000Bot-384z;
	Thu, 15 Oct 2026 18:41:55 +0000
Date: Thu, 15 Oct 2026 20:41:54 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 17266/17613] Makefile:66: exec selftests:
 skipping binfmt_misc_bpf, needs clang, bpftool, vmlinux BTF and libbpf
Message-ID: <202610152043.ouH5myeG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Sasha Levin <sashal@kernel.org>
CC: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b810335a0699d1810683796b0e3ffe8827ddfe6c
commit: b36b990c50b1f581b9a7f35ae256f5542415fa69 [17266/17613] selftests/exec: report the skipped binfmt_misc_bpf test on stderr
:::::: branch date: 3 hours ago
:::::: commit date: 14 hours ago
config: s390-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261015/202610152043.ouH5myeG-lkp@intel.com/config)
compiler: s390x-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261015/202610152043.ouH5myeG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610152043.ouH5myeG-lkp@intel.com/

Note: the linux-next/master HEAD b810335a0699d1810683796b0e3ffe8827ddfe6c builds fine.
      It may have been fixed somewhere.

All errors (new ones prefixed by >>):

   make[1]: *** [../../lib.mk:225: tools/testing/selftests/drivers/net/psp_responder] Error 1
   make[1]: Target 'all' not remade because of errors.
>> Makefile:66: exec selftests: skipping binfmt_misc_bpf, needs clang, bpftool, vmlinux BTF and libbpf
   make[1]: *** [Makefile:117: tools/testing/selftests/hid/host-tools/sbin/bpftool] Error 2
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets.  Stop.
   make[1]: *** [../lib.mk:225: tools/testing/selftests/net/busy_poller] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/net/tun] Error 1
   make[1]: Target 'all' not remade because of errors.
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:182: warning: ignoring old recipe for target 'emit_tests'
   make[1]: *** No targets.  Stop.
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/proc-loadavg-001] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/proc-pid-vm] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/proc-tid0] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/setns-dcache] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/setns-sysvipc] Error 1
   make[1]: *** [../lib.mk:224: tools/testing/selftests/proc/thread-self] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets specified and no makefile found.  Stop.
   make[1]: Circular tools/testing/selftests/rseq/param_test <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_compare_twice <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_compare_twice <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid <- tools/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid_compare_twice <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid_compare_twice <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid_compare_twice <- tools/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid_compare_twice <- tools/testing/selftests/rseq/param_test_mm_cid_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- tools/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- tools/testing/selftests/rseq/param_test_mm_cid_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- tools/testing/selftests/rseq/syscall_errors_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/testing/selftests/rseq/param_test_mm_cid_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/testing/selftests/rseq/syscall_errors_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/testing/selftests/rseq/legacy_check dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/param_test_mm_cid_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/syscall_errors_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/legacy_check dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testing/selftests/rseq/slice_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/param_test_mm_cid_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/syscall_errors_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/legacy_check dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/slice_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/testing/selftests/rseq/check_optimized dependency dropped.
   make[1]: *** [Makefile:67: tools/testing/selftests/rseq/param_test_mm_cid_compare_twice] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** No targets.  Stop.
   make[1]: *** No targets.  Stop.


vim +66 Makefile

3812b8c5c5d527 Masahiro Yamada 2019-02-22  59  
066b7ed9558087 Michal Marek    2014-07-04  60  # Beautify output
066b7ed9558087 Michal Marek    2014-07-04  61  # ---------------------------------------------------------------------------
066b7ed9558087 Michal Marek    2014-07-04  62  #
8962b6b475bddc Masahiro Yamada 2022-12-23  63  # Most of build commands in Kbuild start with "cmd_". You can optionally define
8962b6b475bddc Masahiro Yamada 2022-12-23  64  # "quiet_cmd_*". If defined, the short log is printed. Otherwise, no log from
8962b6b475bddc Masahiro Yamada 2022-12-23  65  # that command is printed by default.
066b7ed9558087 Michal Marek    2014-07-04 @66  #
8962b6b475bddc Masahiro Yamada 2022-12-23  67  # e.g.)
8962b6b475bddc Masahiro Yamada 2022-12-23  68  #    quiet_cmd_depmod = DEPMOD  $(MODLIB)
8962b6b475bddc Masahiro Yamada 2022-12-23  69  #          cmd_depmod = $(srctree)/scripts/depmod.sh $(DEPMOD) $(KERNELRELEASE)
066b7ed9558087 Michal Marek    2014-07-04  70  #
066b7ed9558087 Michal Marek    2014-07-04  71  # A simple variant is to prefix commands with $(Q) - that's useful
066b7ed9558087 Michal Marek    2014-07-04  72  # for commands that shall be hidden in non-verbose mode.
066b7ed9558087 Michal Marek    2014-07-04  73  #
8962b6b475bddc Masahiro Yamada 2022-12-23  74  #    $(Q)$(MAKE) $(build)=scripts/basic
066b7ed9558087 Michal Marek    2014-07-04  75  #
6ae4b9868a8f72 Masahiro Yamada 2022-12-23  76  # If KBUILD_VERBOSE contains 1, the whole command is echoed.
6ae4b9868a8f72 Masahiro Yamada 2022-12-23  77  # If KBUILD_VERBOSE contains 2, the reason for rebuilding is printed.
066b7ed9558087 Michal Marek    2014-07-04  78  #
^1da177e4c3f41 Linus Torvalds  2005-04-16  79  # To put more focus on warnings, be less verbose as default
^1da177e4c3f41 Linus Torvalds  2005-04-16  80  # Use 'make V=1' to see the full commands
^1da177e4c3f41 Linus Torvalds  2005-04-16  81  

:::::: The code at line 66 was first introduced by commit
:::::: 066b7ed9558087a7957a1128f27d7a3462ff117f kbuild: Do not print the build directory with make -s

:::::: TO: Michal Marek <mmarek@suse.cz>
:::::: CC: Michal Marek <mmarek@suse.cz>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
