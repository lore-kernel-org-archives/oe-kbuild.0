Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794654530;
	b=yQHsB8evKevLopQtQQaPAdd9CVrA6z78EmYrLK53gGeGuS1jC98JyjADkVUJtf4oyyGg
	 lbyHD1kn94xRmit7HiY3NmFkT+EJotOVHot1roBhssIzEaNyIFLLpQP66t7H2imIm9b/p
	 P45X3NBtJBxVBwvmzpnGQq0jo0f+YSqKIB9Q4UAdolBgJs0upKpLGlCDtbOZxrwmxWHdw
	 FZAWkxKWYJspBr9s5BDt0V7gDNnrm9tlinh5YuZwVwFVPjFo28l4k4R/l1a9nJ6yjiqUF
	 YJfXRgDzgdxbR+58OYIlLQKohytrIs4WD29UAJV0rvi3jhstRIQOC+88rCnfPFf+6sQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794654530;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=TIegbr6dPv4nka/DB25mIQhGtynPn4DNBBw0QmaZRdU=;
	b=LL/XHdSHLOnYP7UDDFFIHaFS7Fw1jJnvPqt1VYZ+D1HF8fWMKKRZYj7tsGki90EapKOq
	 HOsrGHsZ1QjxSC9xrrE+WICV1ER76ONFy1UeJ3W3OZtytqDEnY0hpHLEoUb3tG1JLLMeR
	 tidIE0c/FeG4Dr/ZPS2aEXRB7GWWfwaHQf5B6ZrOno4W1E0eenH3RRZgMC1kzWDLhH/t1
	 0536JJLD7w8k8AzJb98rFhNU1qCyxFHmwBvsGnzRkKqfogcTCRU3ekkWQ9ib20hrZEbI7
	 J7197W0ql/SWwJCOJW49CsM+Hkw5ZFzF1Q68+UzkhNeCl3psFUtt3NPqLjzGuSdhlcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V1uKwEOO;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E8E606A331
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 11:08:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 66E8E606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=V1uKwEOO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794654529; x=1826190529;
  h=date:from:to:cc:subject:message-id;
  bh=2z55Jkcr7EXINrQBoxlBvvEHQcwNYBeK76R+x9x2FRQ=;
  b=V1uKwEOOkMz1xFkU6VLnAcR2wMgwL0NmcfkKEtIJlZw60KwVWAfrk22i
   aaKb2gtCnxdrERWo/UK9Ky8GwlemR+44JHS4XD4DEMaXb8DyJAU/H8PGU
   hASCFD0f9aHuM3KFWkTnErKPeTNbrWfQ1UQ1fd0Hb4RLZ1ByMqZvCoXMh
   Lri55uk7fvWv4ueC5DyXcXTzlTMDN2H4z5wqpHhTwnmBkAvK0JyIu+VlA
   +btv874gfmgtKh2/U88X4iHBMzb38uh1AHa2j7IBy5agL/spsy6i4BBp2
   Ct6JTWO8q112s6TIJHX1d3OBVODxvM+c7u8MNvJZAGxovnbS4NM1A20MW
   Q==;
X-CSE-ConnectionGUID: IaGdOwMxT3Cou+m3HZ1E1g==
X-CSE-MsgGUID: yjvlXqtVTqGrkJ1V331KTA==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3531341"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3531341"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 03:08:48 -0800
X-CSE-ConnectionGUID: iRc/UJzZR8OHTRd9mYwt0A==
X-CSE-MsgGUID: HHbYP6dQQvmH5146MNcVFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9383243"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 14 Nov 2026 03:08:47 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xSBci-000000001Xz-2I29;
	Sat, 14 Nov 2026 11:08:44 +0000
Date: Sat, 14 Nov 2026 12:07:52 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bpf-next:for-next 331/381] Makefile:235: excluding
 xdp_hw_metadata, bpftool not installed or not working
Message-ID: <202611141124.V0t6dlFo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git for-next
head:   ca4181cacb0c6a5632018f1c94f29d9dbc0e9270
commit: d01fb5c8113055e3d1b7f573261ae6a30abf4e53 [331/381] selftests: net: move xdp_hw_metadata from selftests/bpf
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261114/202611141124.V0t6dlFo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261114/202611141124.V0t6dlFo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611141124.V0t6dlFo-lkp@intel.com/

Note: the bpf-next/for-next HEAD ca4181cacb0c6a5632018f1c94f29d9dbc0e9270 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   Makefile:70: exec selftests: skipping binfmt_misc_bpf, needs clang, bpftool, vmlinux BTF and libbpf
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse/fuse_mnt] Error 1
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse/fuse_symlink_cache_test] Error 1
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse/fuse_acl_cache_test] Error 1
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse/fuse_readdir_cache_test] Error 1
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse/test_syncfs] Error 1
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse/fusectl_test] Error 1
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse/write_extend_eof_test] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** [Makefile:117: tools/testing/selftests/hid/tools/sbin/bpftool] Error 2
   make[1]: Target 'all' not remade because of errors.
>> Makefile:235: excluding xdp_hw_metadata, bpftool not installed or not working
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:183: warning: ignoring old recipe for target 'emit_tests'
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
   Makefile:14: excluding xskxceiver, bpftool not installed or not working


vim +235 Makefile

5fc10e76fa2a96 Masahiro Yamada 2023-06-27  231  
5fc10e76fa2a96 Masahiro Yamada 2023-06-27  232  ifeq ($(filter --no-print-directory, $(MAKEFLAGS)),)
5fc10e76fa2a96 Masahiro Yamada 2023-06-27  233  # If --no-print-directory is unset, recurse once again to set it.
5fc10e76fa2a96 Masahiro Yamada 2023-06-27  234  # You may end up recursing into __sub-make twice. This is needed due to the
5fc10e76fa2a96 Masahiro Yamada 2023-06-27 @235  # behavior change in GNU Make 4.4.1.
5fc10e76fa2a96 Masahiro Yamada 2023-06-27  236  need-sub-make := 1
5fc10e76fa2a96 Masahiro Yamada 2023-06-27  237  endif
5fc10e76fa2a96 Masahiro Yamada 2023-06-27  238  

:::::: The code at line 235 was first introduced by commit
:::::: 5fc10e76fa2a96d0207ed4d0cc9d16fb61371f71 kbuild: revive "Entering directory" for Make >= 4.4.1

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
