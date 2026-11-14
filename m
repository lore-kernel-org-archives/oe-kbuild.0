Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794644621;
	b=q/x9rgjWsQ1nAUOdMLPrkQbGoCinVXnHm12wx8YVPdlinQqeHo9saD2EpU1oplCYIMv2
	 bHcIdPnlY5Yk7GycuBQUub3IXzumDTw2nt7rtlCe4q2datcaR0wWRjmsgCgZTdVo/RsNP
	 HVf3BP5Gpdykp4OYIMFhBkzVrjOPXr2q2cD0mBsYWGxzNj8qDLWkI+N6BKY5YA/yH+LUJ
	 Yw1r8Y9v903La+Px0IkJalB28WsFbBGf9wK8SvSBXzKEGuIfCXCkNAHFgEFXPIdQ4u/D9
	 oRTKrrny/j+x3yRTm6mXhZPK4UMzXcKuJj2i3Fo6PDK/YPRapWIb6oVnZDI2erMlFJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794644621;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Ewl7RbTsyStmxsCK3hVoCVI7XKfeT6FGzRN2mESmctQ=;
	b=VyM0Q0Yeiav/IP33epTuknrZs2IA42hHtfLOfVEAAvBci0T9I2+mlLzYMa9VDu8mXGQh
	 8D6kUCT5vbrk2bagdWNo0Wj/P8C4WvEa7mUcRRk9haSyMAi26ZXl/CiCJ7TdreFKjYpfM
	 wj/v9+eUTYUZANZW9xZmGQxr9gMfkThMM0Rr5aUfBGCZHXnjRcYefLCsi5FingbN7ZuZO
	 3L4WcA9U/1Uc9aS6XuNEKuGIVSsBaHgfExeQQNVe7zK2bHmigNM9MT5vpfd+DB88j+gcr
	 5t6Q1WrTWZimguzhLHiJPdlJDnvXwK28rn6hdJFOVvWoN/LF6CJt0Ub4sxCTRXT9Y0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l1pE80wW;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF0CF606A32D
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Nov 2026 08:23:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF0CF606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=l1pE80wW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794644620; x=1826180620;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=cRqjhUfmSRV2sPyoXRaRKuH2lbzKblcL2MSl9tzIeMk=;
  b=l1pE80wWFrHP5lL1q1nIJwYjyMRKWMVrCuvkIKQp1dLJd6Z9miHDRq2t
   rMebRCg6ZnNbywZg9hdU7XeI7Iz8y5IqLYl2Fhr/9TwJEJcvMUme9iahX
   U5IzcEgsDx8zahCdg29VgY4w+0jnAk3OiFHWHJioQqbMXAo4vo0uhSko7
   wCQgDL/CusWXySqT/CYirSQsgawvUgb+ElLlmYG3fgG9fbUeUOeA9kIqy
   tNoAmTwDhCPfrnvXShsKv2FY9Li4zJTPEGwzb43SRukYauXOvYa3BkeLc
   cwzUCH8vByYfNLHBuj4Zcr8Y9coFoVVGgEQs7sYiYm10kQZcsRhw69RLP
   g==;
X-CSE-ConnectionGUID: GUpMRtaWSbuO1+9BhK3StA==
X-CSE-MsgGUID: 6SdCwEz2RiS7zP9y9z3VRg==
X-IronPort-AV: E=McAfee;i="6800,10657,11965"; a="3443326"
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="3443326"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2026 00:23:39 -0800
X-CSE-ConnectionGUID: dU4PoxfJQtyxIEV2une1wg==
X-CSE-MsgGUID: +NmFZe2ZQ6OHUjxN/CFl9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,213,1787036400"; 
   d="scan'208";a="9437004"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 14 Nov 2026 00:23:39 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xS92u-000000001Wd-2KSp;
	Sat, 14 Nov 2026 08:23:36 +0000
Date: Sat, 14 Nov 2026 09:23:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [bpf-next:for-next 330/381] Makefile:14: excluding
 xskxceiver, bpftool not installed or not working
Message-ID: <202611140904.io658Rze-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "low confidence bisect report"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Maciej Fijalkowski <maciej.fijalkowski@intel.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: "Bj=C3=B6rn T=C3=B6pel" <bjorn@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git fo=
r-next
head:   ca4181cacb0c6a5632018f1c94f29d9dbc0e9270
commit: e8f9d82379881461fe2d7d181f633009970bdb81 [330/381] selftests: xsk: =
move the AF_XDP test suite to selftests/net
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20261=
114/202611140904.io658Rze-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261114/202611140904.io658Rze-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611140904.io658Rze-lkp@intel.com/

Note: the bpf-next/for-next HEAD ca4181cacb0c6a5632018f1c94f29d9dbc0e9270 b=
uilds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   Makefile:70: exec selftests: skipping binfmt_misc_bpf, needs clang, bpft=
ool, vmlinux BTF and libbpf
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse=
/fuse_symlink_cache_test] Error 1
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse=
/fuse_mnt] Error 1
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse=
/fuse_acl_cache_test] Error 1
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse=
/fuse_readdir_cache_test] Error 1
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse=
/test_syncfs] Error 1
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse=
/fusectl_test] Error 1
   make[1]: *** [../../lib.mk:226: tools/testing/selftests/filesystems/fuse=
/write_extend_eof_test] Error 1
   make[1]: Target 'all' not remade because of errors.
   make[1]: *** [Makefile:117: tools/testing/selftests/hid/tools/sbin/bpfto=
ol] Error 2
   make[1]: Target 'all' not remade because of errors.
   Makefile:60: warning: overriding recipe for target 'emit_tests'
   ../lib.mk:183: warning: ignoring old recipe for target 'emit_tests'
   make[1]: Circular tools/testing/selftests/rseq/param_test <- tools/testi=
ng/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_compare_twice =
<- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_compare_twice =
<- tools/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid <- tool=
s/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid <- tool=
s/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid <- tool=
s/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid_compare=
_twice <- tools/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid_compare=
_twice <- tools/testing/selftests/rseq/param_test_compare_twice dependency =
dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid_compare=
_twice <- tools/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/param_test_mm_cid_compare=
_twice <- tools/testing/selftests/rseq/param_test_mm_cid_compare_twice depe=
ndency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- to=
ols/testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- to=
ols/testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- to=
ols/testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- to=
ols/testing/selftests/rseq/param_test_mm_cid_compare_twice dependency dropp=
ed.
   make[1]: Circular tools/testing/selftests/rseq/syscall_errors_test <- to=
ols/testing/selftests/rseq/syscall_errors_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/tes=
ting/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/tes=
ting/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/tes=
ting/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/tes=
ting/selftests/rseq/param_test_mm_cid_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/tes=
ting/selftests/rseq/syscall_errors_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/legacy_check <- tools/tes=
ting/selftests/rseq/legacy_check dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testi=
ng/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testi=
ng/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testi=
ng/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testi=
ng/selftests/rseq/param_test_mm_cid_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testi=
ng/selftests/rseq/syscall_errors_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testi=
ng/selftests/rseq/legacy_check dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/slice_test <- tools/testi=
ng/selftests/rseq/slice_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/=
testing/selftests/rseq/param_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/=
testing/selftests/rseq/param_test_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/=
testing/selftests/rseq/param_test_mm_cid dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/=
testing/selftests/rseq/param_test_mm_cid_compare_twice dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/=
testing/selftests/rseq/syscall_errors_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/=
testing/selftests/rseq/legacy_check dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/=
testing/selftests/rseq/slice_test dependency dropped.
   make[1]: Circular tools/testing/selftests/rseq/check_optimized <- tools/=
testing/selftests/rseq/check_optimized dependency dropped.
>> Makefile:14: excluding xskxceiver, bpftool not installed or not working


vim +14 Makefile

^1da177e4c3f41 Linus Torvalds  2005-04-16  13 =20
5f99665ee8f433 Masahiro Yamada 2024-07-04 @14  ifeq ($(filter output-sync,$=
(.FEATURES)),)
5f99665ee8f433 Masahiro Yamada 2024-07-04  15  $(error GNU Make >=3D 4.0 is=
 required. Your Make version is $(MAKE_VERSION))
87d599fc3955e5 Masahiro Yamada 2022-12-13  16  endif
87d599fc3955e5 Masahiro Yamada 2022-12-13  17 =20

:::::: The code at line 14 was first introduced by commit
:::::: 5f99665ee8f4335f334a5292b6d5b41a577fc2c0 kbuild: raise the minimum G=
NU Make requirement to 4.0

:::::: TO: Masahiro Yamada <masahiroy@kernel.org>
:::::: CC: Masahiro Yamada <masahiroy@kernel.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
