Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9447A37713
	for <oe-kbuild@lists.linux.dev>; Sun, 21 Jan 2024 17:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705858346; cv=none; b=WXPdviIE5F4SCtGJdLUQK36eTlM3E62pPJM319HxJj7/6dSX57Yr+4CWDx5ixRuuwPznFZWDkz/DnAs7XoU8dYZsoxnUDjhPPlf6r6jUZqMV+ZPkTD7sIQhHjy9xeWIc0oj1/orMABzYZSgxtx9lwXgwQiWTi2bPWv2gMo5BN+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705858346; c=relaxed/simple;
	bh=BeoLS9F5nbpqlaWb3zvf8nJ2pxVj9yq01pwJ8fVxwBA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BST/GiGux3AxAYTKaAqciBdtI9MQECO1K9wu0OQpA7MgSzzR6C54Xrgpe0ZB7jPVryeJS80AoApxMbfhUAc28tXhlJSj2YRJN/+9qZca+IIsFl+JUIIRfNdXrXMDmkQ1BWYKslWrkA1pRkhZKup9aOAx5NKSCjRBew/gOF7ILwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNua016a; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNua016a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705858344; x=1737394344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BeoLS9F5nbpqlaWb3zvf8nJ2pxVj9yq01pwJ8fVxwBA=;
  b=HNua016a0PlZOxdnBvCLmjgQFkfZbgBj0lfdTMRL/kbiKyKIumYgfuro
   an1ZEtBSltcatJ4+HeQ2g9SFGXpWXpEPaol8+8ies+YLdTvcKKdl1zNVn
   +h58xDNOPBo71kTcqNslVE7yC3IFxM8jGl7ZWy19TM3gPYgH0XKHzgnqU
   P9avLHAN40vjwQJL/cGgdYMW7zMhKXR2GnNGXTc27IfLpWCKCBBow+FI/
   7AzkU0hdUk7pG63WTF8uH2PaYm9lowv+iZXpUhU0eZ3C+W0VTeLqRRxcr
   4fzbRWFt0s4ITPAqI54t7M7fBB+vFweGoN4X2ydiadAeAAnTEPMT5F2NW
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="22530138"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="22530138"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 09:32:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="961915"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 21 Jan 2024 09:32:21 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRbgA-000666-18;
	Sun, 21 Jan 2024 17:32:18 +0000
Date: Mon, 22 Jan 2024 01:31:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kees:devel/overflow/sanitizers 1/84] lib/overflow_kunit.c:817
 overflows_type_test() warn: assigning (-128) to unsigned variable
 '*__builtin_choose_expr(!$expr_0x7f30ed9ce5f0(4) == $expr_0x7f30ed9ce780(4),
 &v, &$expr_0x7f30ed9cefa0(24))'
Message-ID: <202401220154.MqmnWbz3-lkp@intel.com>
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
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git devel/overflow/sanitizers
head:   87079890a6277ce39553c391b994c4f5c10e70e0
commit: 69781cb9dde8f92cf632fb6b423bc91aa2afa59b [1/84] overflow: Expand check_add_overflow() for pointer addition
:::::: branch date: 2 days ago
:::::: commit date: 3 days ago
config: i386-randconfig-141-20240120 (https://download.01.org/0day-ci/archive/20240122/202401220154.MqmnWbz3-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401220154.MqmnWbz3-lkp@intel.com/

New smatch warnings:
lib/overflow_kunit.c:817 overflows_type_test() warn: assigning (-128) to unsigned variable '*__builtin_choose_expr(!$expr_0x7f30ed9ce5f0(4) == $expr_0x7f30ed9ce780(4), &v, &$expr_0x7f30ed9cefa0(24))'
lib/overflow_kunit.c:838 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed6d7cc0(4) == $expr_0x7f30ed6d7db0(4), t1, 0) + v' 65535 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f30ed6c0650(4) == $expr_0x7f30ed6c07e0(4), &v, &$expr_0x7f30ed6c1000(24))'
lib/overflow_kunit.c:847 overflows_type_test() warn: assigning s16min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f30ed523ad0(4) == $expr_0x7f30ed523c60(4), &v, &$expr_0x7f30ed524480(24))'
lib/overflow_kunit.c:862 overflows_type_test() warn: value (-129) can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f30ed3464b0(4) == $expr_0x7f30ed346640(4), &v, &$expr_0x7f30ed346e60(24))'
lib/overflow_kunit.c:864 overflows_type_test() warn: value s16min can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f30ed2dbad0(4) == $expr_0x7f30ed2dbc60(4), &v, &$expr_0x7f30ed2dc480(24))'
lib/overflow_kunit.c:893 overflows_type_test() warn: assigning s32min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f30ece38d30(4) == $expr_0x7f30ece38ec0(4), &v, &$expr_0x7f30ece396e0(24))'
lib/overflow_kunit.c:912 overflows_type_test() warn: value s32min can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f30ecbadf10(4) == $expr_0x7f30ecbae0a0(4), &v, &$expr_0x7f30ecbae8c0(24))'
lib/overflow_kunit.c:916 overflows_type_test() warn: value (-32769) can't fit into s16min '*__builtin_choose_expr(!$expr_0x7f30ecad8d30(4) == $expr_0x7f30ecad8ec0(4), &v, &$expr_0x7f30ecad96e0(24))'
lib/overflow_kunit.c:918 overflows_type_test() warn: value s32min can't fit into s16min '*__builtin_choose_expr(!$expr_0x7f30eca96320(4) == $expr_0x7f30eca964b0(4), &v, &$expr_0x7f30eca96cd0(24))'

Old smatch warnings:
lib/overflow_kunit.c:469 shift_overflow_test() warn: '(_a_full << _to_shift)' 32768 can't fit into 32767 '*_d'
lib/overflow_kunit.c:478 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 65535 '*_d'
lib/overflow_kunit.c:489 shift_overflow_test() warn: '(_a_full << _to_shift)' 34966 can't fit into 32767 '*_d'
lib/overflow_kunit.c:498 shift_overflow_test() warn: '(_a_full << _to_shift)' 300 can't fit into 127 '*_d'
lib/overflow_kunit.c:500 shift_overflow_test() warn: '(_a_full << _to_shift)' 69932 can't fit into 32767 '*_d'
lib/overflow_kunit.c:517 shift_truncate_test() warn: '(_a_full << _to_shift)' 65536 can't fit into 65535 '*_d'
lib/overflow_kunit.c:518 shift_truncate_test() warn: '(_a_full << _to_shift)' 65535 can't fit into 32767 '*_d'
lib/overflow_kunit.c:555 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 32767 '*_d'
lib/overflow_kunit.c:556 shift_nonsense_test() warn: '(_a_full << _to_shift)' 18446744073709551611 can't fit into 65535 '*_d'
lib/overflow_kunit.c:556 shift_nonsense_test() warn: assigning 18446744073709551611 to unsigned variable '*_d'
lib/overflow_kunit.c:817 overflows_type_test() warn: assigning (-128) to unsigned variable '*__builtin_choose_expr(!$expr_0x7f30ed9bb440(4) == $expr_0x7f30ed9bb5d0(4), &v, &$expr_0x7f30ed9bbdf0(24))'
lib/overflow_kunit.c:820 overflows_type_test() warn: assigning (-128) to unsigned variable '*__builtin_choose_expr(!$expr_0x7f30ed92a400(4) == $expr_0x7f30ed92a590(4), &v, &$expr_0x7f30ed92adb0(24))'
lib/overflow_kunit.c:820 overflows_type_test() warn: assigning (-128) to unsigned variable '*__builtin_choose_expr(!$expr_0x7f30ed92f220(4) == $expr_0x7f30ed92f3b0(4), &v, &$expr_0x7f30ed92fbd0(24))'
lib/overflow_kunit.c:838 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed6c4b10(4) == $expr_0x7f30ed6c4c00(4), t1, 0) + v' 65535 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f30ed6c5470(4) == $expr_0x7f30ed6c5600(4), &v, &$expr_0x7f30ed6c5e20(24))'
lib/overflow_kunit.c:840 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed67d1f0(4) == $expr_0x7f30ed67d2e0(4), t1, 0) + v' 32768 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f30ed67db50(4) == $expr_0x7f30ed67dce0(4), &v, &$expr_0x7f30ed67e500(24))'
lib/overflow_kunit.c:840 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed65a040(4) == $expr_0x7f30ed65a130(4), t1, 0) + v' 32768 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f30ed65a9a0(4) == $expr_0x7f30ed65ab30(4), &v, &$expr_0x7f30ed65b350(24))'
lib/overflow_kunit.c:841 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed63ba80(4) == $expr_0x7f30ed63bb70(4), t1, 0) + v' 65535 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f30ed63c3e0(4) == $expr_0x7f30ed63c570(4), &v, &$expr_0x7f30ed63cd90(24))'
lib/overflow_kunit.c:841 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed6288d0(4) == $expr_0x7f30ed6289c0(4), t1, 0) + v' 65535 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f30ed629230(4) == $expr_0x7f30ed6293c0(4), &v, &$expr_0x7f30ed629be0(24))'
lib/overflow_kunit.c:847 overflows_type_test() warn: assigning s16min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f30ed508920(4) == $expr_0x7f30ed508ab0(4), &v, &$expr_0x7f30ed5092d0(24))'
lib/overflow_kunit.c:850 overflows_type_test() warn: assigning s16min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f30ed49f8b0(4) == $expr_0x7f30ed49fa40(4), &v, &$expr_0x7f30ed488290(24))'
lib/overflow_kunit.c:850 overflows_type_test() warn: assigning s16min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f30ed48c700(4) == $expr_0x7f30ed48c890(4), &v, &$expr_0x7f30ed48d0b0(24))'
lib/overflow_kunit.c:862 overflows_type_test() warn: value (-129) can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f30ed32b300(4) == $expr_0x7f30ed32b490(4), &v, &$expr_0x7f30ed32bcb0(24))'
lib/overflow_kunit.c:863 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed30c570(4) == $expr_0x7f30ed30c660(4), t1, 0) + v' 32767 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f30ed30ced0(4) == $expr_0x7f30ed30d060(4), &v, &$expr_0x7f30ed30d880(24))'
lib/overflow_kunit.c:863 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed3013c0(4) == $expr_0x7f30ed3014b0(4), t1, 0) + v' 32767 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f30ed301d20(4) == $expr_0x7f30ed301eb0(4), &v, &$expr_0x7f30ed3026d0(24))'
lib/overflow_kunit.c:864 overflows_type_test() warn: value s16min can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f30ed2c8920(4) == $expr_0x7f30ed2c8ab0(4), &v, &$expr_0x7f30ed2c92d0(24))'
lib/overflow_kunit.c:874 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed10d5b0(4) == $expr_0x7f30ed10d6a0(4), t1, 0) + v' 4294967295 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f30ed10df10(4) == $expr_0x7f30ed10e0a0(4), &v, &$expr_0x7f30ed10e8c0(24))'
lib/overflow_kunit.c:874 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed0f2400(4) == $expr_0x7f30ed0f24f0(4), t1, 0) + v' 4294967295 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f30ed0f2d60(4) == $expr_0x7f30ed0f2ef0(4), &v, &$expr_0x7f30ed0f3710(24))'
lib/overflow_kunit.c:876 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed0a2770(4) == $expr_0x7f30ed0a2860(4), t1, 0) + v' 65536 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f30ed0a30d0(4) == $expr_0x7f30ed0a3260(4), &v, &$expr_0x7f30ed0a3a80(24))'
lib/overflow_kunit.c:876 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed0a7590(4) == $expr_0x7f30ed0a7680(4), t1, 0) + v' 65536 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f30ed0a7ef0(4) == $expr_0x7f30ed0980b0(4), &v, &$expr_0x7f30ed0988d0(24))'
lib/overflow_kunit.c:877 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed079000(4) == $expr_0x7f30ed0790f0(4), t1, 0) + v' 4294967295 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f30ed079960(4) == $expr_0x7f30ed079af0(4), &v, &$expr_0x7f30ed07a310(24))'
lib/overflow_kunit.c:877 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed07de20(4) == $expr_0x7f30ed07df10(4), t1, 0) + v' 4294967295 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f30ed07e780(4) == $expr_0x7f30ed07e910(4), &v, &$expr_0x7f30ed07f130(24))'
lib/overflow_kunit.c:879 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed026500(4) == $expr_0x7f30ed0265f0(4), t1, 0) + v' 32768 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f30ed026e60(4) == $expr_0x7f30ed026ff0(4), &v, &$expr_0x7f30ed027810(24))'
lib/overflow_kunit.c:879 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ed00b350(4) == $expr_0x7f30ed00b440(4), t1, 0) + v' 32768 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f30ed00bcb0(4) == $expr_0x7f30ed00be40(4), &v, &$expr_0x7f30ed00c660(24))'
lib/overflow_kunit.c:880 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecff4d90(4) == $expr_0x7f30ecff4e80(4), t1, 0) + v' 4294967295 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f30ecff56f0(4) == $expr_0x7f30ecff5880(4), &v, &$expr_0x7f30ecff60a0(24))'
lib/overflow_kunit.c:880 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecfe1be0(4) == $expr_0x7f30ecfe1cd0(4), t1, 0) + v' 4294967295 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f30ecfe2540(4) == $expr_0x7f30ecfe26d0(4), &v, &$expr_0x7f30ecfe2ef0(24))'
lib/overflow_kunit.c:891 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecea2fe0(4) == $expr_0x7f30ecea30d0(4), t1, 0) + v' 2147483647 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f30ecea3940(4) == $expr_0x7f30ecea3ad0(4), &v, &$expr_0x7f30ecea42f0(24))'
lib/overflow_kunit.c:891 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecea7e00(4) == $expr_0x7f30ecea7ef0(4), t1, 0) + v' 2147483647 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f30ece88790(4) == $expr_0x7f30ece88920(4), &v, &$expr_0x7f30ece89140(24))'
lib/overflow_kunit.c:893 overflows_type_test() warn: assigning s32min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f30ece3db50(4) == $expr_0x7f30ece3dce0(4), &v, &$expr_0x7f30ece3e500(24))'
lib/overflow_kunit.c:895 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecded5b0(4) == $expr_0x7f30ecded6a0(4), t1, 0) + v' 65536 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f30ecdedf10(4) == $expr_0x7f30ecdee0a0(4), &v, &$expr_0x7f30ecdee8c0(24))'
lib/overflow_kunit.c:895 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecdd2400(4) == $expr_0x7f30ecdd24f0(4), t1, 0) + v' 65536 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f30ecdd2d60(4) == $expr_0x7f30ecdd2ef0(4), &v, &$expr_0x7f30ecdd3710(24))'
lib/overflow_kunit.c:896 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecdb3fd0(4) == $expr_0x7f30ecdb40c0(4), t1, 0) + v' 2147483647 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f30ecdb4930(4) == $expr_0x7f30ecdb4ac0(4), &v, &$expr_0x7f30ecdb52e0(24))'
lib/overflow_kunit.c:896 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecda0e20(4) == $expr_0x7f30ecda0f10(4), t1, 0) + v' 2147483647 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f30ecda1780(4) == $expr_0x7f30ecda1910(4), &v, &$expr_0x7f30ecda2130(24))'
lib/overflow_kunit.c:898 overflows_type_test() warn: assigning s32min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f30ecd49d20(4) == $expr_0x7f30ecd49eb0(4), &v, &$expr_0x7f30ecd4a6d0(24))'
lib/overflow_kunit.c:898 overflows_type_test() warn: assigning s32min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f30ecd4eb40(4) == $expr_0x7f30ecd4ecd0(4), &v, &$expr_0x7f30ecd4f4f0(24))'
lib/overflow_kunit.c:910 overflows_type_test() warn: value (-129) can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f30ecc00920(4) == $expr_0x7f30ecc00ab0(4), &v, &$expr_0x7f30ecc012d0(24))'
lib/overflow_kunit.c:910 overflows_type_test() warn: value (-129) can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f30ecc05740(4) == $expr_0x7f30ecc058d0(4), &v, &$expr_0x7f30ecc060f0(24))'
lib/overflow_kunit.c:911 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecbde9b0(4) == $expr_0x7f30ecbdeaa0(4), t1, 0) + v' 2147483647 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f30ecbdf310(4) == $expr_0x7f30ecbdf4a0(4), &v, &$expr_0x7f30ecbdfcc0(24))'
lib/overflow_kunit.c:911 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecbc3800(4) == $expr_0x7f30ecbc38f0(4), t1, 0) + v' 2147483647 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f30ecbc4160(4) == $expr_0x7f30ecbc42f0(4), &v, &$expr_0x7f30ecbc4b10(24))'
lib/overflow_kunit.c:912 overflows_type_test() warn: value s32min can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f30ecb92d60(4) == $expr_0x7f30ecb92ef0(4), &v, &$expr_0x7f30ecb93710(24))'
lib/overflow_kunit.c:915 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecb116e0(4) == $expr_0x7f30ecb117d0(4), t1, 0) + v' 32768 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f30ecb12040(4) == $expr_0x7f30ecb121d0(4), &v, &$expr_0x7f30ecb129f0(24))'
lib/overflow_kunit.c:915 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecb16500(4) == $expr_0x7f30ecb165f0(4), t1, 0) + v' 32768 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f30ecb16e60(4) == $expr_0x7f30ecb16ff0(4), &v, &$expr_0x7f30ecb17810(24))'
lib/overflow_kunit.c:916 overflows_type_test() warn: value (-32769) can't fit into s16min '*__builtin_choose_expr(!$expr_0x7f30ecaddb50(4) == $expr_0x7f30ecaddce0(4), &v, &$expr_0x7f30ecade500(24))'
lib/overflow_kunit.c:917 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecac6dc0(4) == $expr_0x7f30ecac6eb0(4), t1, 0) + v' 2147483647 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f30ecac7720(4) == $expr_0x7f30ecac78b0(4), &v, &$expr_0x7f30ecaa8100(24))'
lib/overflow_kunit.c:917 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f30ecaabc10(4) == $expr_0x7f30ecaabd00(4), t1, 0) + v' 2147483647 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f30ecaac570(4) == $expr_0x7f30ecaac700(4), &v, &$expr_0x7f30ecaacf20(24))'
lib/overflow_kunit.c:918 overflows_type_test() warn: value s32min can't fit into s16min '*__builtin_choose_expr(!$expr_0x7f30eca83170(4) == $expr_0x7f30eca83300(4), &v, &$expr_0x7f30eca83b20(24))'
lib/overflow_kunit.c:1145 castable_to_type_test() warn: unsigned '(((1 << (8 * 1 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 1 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1145 castable_to_type_test() warn: unsigned '(((1 << (8 * 1 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 1 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1146 castable_to_type_test() warn: unsigned '(((1 << (8 * 2 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 2 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1146 castable_to_type_test() warn: unsigned '(((1 << (8 * 2 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 2 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1147 castable_to_type_test() warn: unsigned '(((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1147 castable_to_type_test() warn: unsigned '(((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1147 castable_to_type_test() warn: unsigned '(((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))' is never less than zero.

vim +817 lib/overflow_kunit.c

4b21d25bf519c9 Kees Cook 2022-10-24  808  
4b21d25bf519c9 Kees Cook 2022-10-24  809  	TEST_OVERFLOWS_TYPE(u8, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  810  	TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  811  	TEST_OVERFLOWS_TYPE(u8, s8, U8_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  812  	TEST_OVERFLOWS_TYPE(u8, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  813  	TEST_OVERFLOWS_TYPE(u8, s8, (u8)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  814  	TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  815  	TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  816  	TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24 @817  	TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  818  	TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  819  	TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  820  	TEST_OVERFLOWS_TYPE(s8, u16, S8_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  821  	TEST_OVERFLOWS_TYPE(s8, u32, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  822  	TEST_OVERFLOWS_TYPE(s8, u32, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  823  	TEST_OVERFLOWS_TYPE(s8, u32, S8_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  824  #if BITS_PER_LONG == 64
4b21d25bf519c9 Kees Cook 2022-10-24  825  	TEST_OVERFLOWS_TYPE(s8, u64, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  826  	TEST_OVERFLOWS_TYPE(s8, u64, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  827  	TEST_OVERFLOWS_TYPE(s8, u64, S8_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  828  #endif
4b21d25bf519c9 Kees Cook 2022-10-24  829  	TEST_OVERFLOWS_TYPE(s8, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  830  	TEST_OVERFLOWS_TYPE(s8, s8, S8_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  831  	TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  832  	TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  833  	TEST_OVERFLOWS_TYPE(u16, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  834  	TEST_OVERFLOWS_TYPE(u16, u8, (u16)U8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  835  	TEST_OVERFLOWS_TYPE(u16, u8, U16_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  836  	TEST_OVERFLOWS_TYPE(u16, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  837  	TEST_OVERFLOWS_TYPE(u16, s8, (u16)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24 @838  	TEST_OVERFLOWS_TYPE(u16, s8, U16_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  839  	TEST_OVERFLOWS_TYPE(u16, s16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  840  	TEST_OVERFLOWS_TYPE(u16, s16, (u16)S16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  841  	TEST_OVERFLOWS_TYPE(u16, s16, U16_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  842  	TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  843  	TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  844  	TEST_OVERFLOWS_TYPE(s16, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  845  	TEST_OVERFLOWS_TYPE(s16, u8, (s16)U8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  846  	TEST_OVERFLOWS_TYPE(s16, u8, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24 @847  	TEST_OVERFLOWS_TYPE(s16, u8, S16_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  848  	TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  849  	TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  850  	TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  851  	TEST_OVERFLOWS_TYPE(s16, u32, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  852  	TEST_OVERFLOWS_TYPE(s16, u32, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  853  	TEST_OVERFLOWS_TYPE(s16, u32, S16_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  854  #if BITS_PER_LONG == 64
4b21d25bf519c9 Kees Cook 2022-10-24  855  	TEST_OVERFLOWS_TYPE(s16, u64, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  856  	TEST_OVERFLOWS_TYPE(s16, u64, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  857  	TEST_OVERFLOWS_TYPE(s16, u64, S16_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  858  #endif
4b21d25bf519c9 Kees Cook 2022-10-24  859  	TEST_OVERFLOWS_TYPE(s16, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  860  	TEST_OVERFLOWS_TYPE(s16, s8, S8_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  861  	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24 @862  	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MIN - 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  863  	TEST_OVERFLOWS_TYPE(s16, s8, S16_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24 @864  	TEST_OVERFLOWS_TYPE(s16, s8, S16_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  865  	TEST_OVERFLOWS_TYPE(s16, s16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  866  	TEST_OVERFLOWS_TYPE(s16, s16, S16_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  867  	TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  868  	TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  869  	TEST_OVERFLOWS_TYPE(u32, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  870  	TEST_OVERFLOWS_TYPE(u32, u8, (u32)U8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  871  	TEST_OVERFLOWS_TYPE(u32, u8, U32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  872  	TEST_OVERFLOWS_TYPE(u32, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  873  	TEST_OVERFLOWS_TYPE(u32, s8, (u32)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  874  	TEST_OVERFLOWS_TYPE(u32, s8, U32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  875  	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  876  	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  877  	TEST_OVERFLOWS_TYPE(u32, u16, U32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  878  	TEST_OVERFLOWS_TYPE(u32, s16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  879  	TEST_OVERFLOWS_TYPE(u32, s16, (u32)S16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  880  	TEST_OVERFLOWS_TYPE(u32, s16, U32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  881  	TEST_OVERFLOWS_TYPE(u32, u32, U32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  882  	TEST_OVERFLOWS_TYPE(u32, s32, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  883  	TEST_OVERFLOWS_TYPE(u32, s32, U32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  884  	TEST_OVERFLOWS_TYPE(u32, s32, (u32)S32_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  885  #if BITS_PER_LONG == 64
4b21d25bf519c9 Kees Cook 2022-10-24  886  	TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  887  	TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  888  #endif
4b21d25bf519c9 Kees Cook 2022-10-24  889  	TEST_OVERFLOWS_TYPE(s32, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  890  	TEST_OVERFLOWS_TYPE(s32, u8, (s32)U8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  891  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  892  	TEST_OVERFLOWS_TYPE(s32, u8, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24 @893  	TEST_OVERFLOWS_TYPE(s32, u8, S32_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  894  	TEST_OVERFLOWS_TYPE(s32, u16, U16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  895  	TEST_OVERFLOWS_TYPE(s32, u16, (s32)U16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  896  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  897  	TEST_OVERFLOWS_TYPE(s32, u16, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  898  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  899  	TEST_OVERFLOWS_TYPE(s32, u32, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  900  	TEST_OVERFLOWS_TYPE(s32, u32, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  901  	TEST_OVERFLOWS_TYPE(s32, u32, S32_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  902  #if BITS_PER_LONG == 64
4b21d25bf519c9 Kees Cook 2022-10-24  903  	TEST_OVERFLOWS_TYPE(s32, u64, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  904  	TEST_OVERFLOWS_TYPE(s32, u64, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  905  	TEST_OVERFLOWS_TYPE(s32, u64, S32_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  906  #endif
4b21d25bf519c9 Kees Cook 2022-10-24  907  	TEST_OVERFLOWS_TYPE(s32, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  908  	TEST_OVERFLOWS_TYPE(s32, s8, S8_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  909  	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  910  	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MIN - 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  911  	TEST_OVERFLOWS_TYPE(s32, s8, S32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24 @912  	TEST_OVERFLOWS_TYPE(s32, s8, S32_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  913  	TEST_OVERFLOWS_TYPE(s32, s16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  914  	TEST_OVERFLOWS_TYPE(s32, s16, S16_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  915  	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24 @916  	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MIN - 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  917  	TEST_OVERFLOWS_TYPE(s32, s16, S32_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24 @918  	TEST_OVERFLOWS_TYPE(s32, s16, S32_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  919  	TEST_OVERFLOWS_TYPE(s32, s32, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  920  	TEST_OVERFLOWS_TYPE(s32, s32, S32_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  921  #if BITS_PER_LONG == 64
4b21d25bf519c9 Kees Cook 2022-10-24  922  	TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  923  	TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  924  	TEST_OVERFLOWS_TYPE(u64, u8, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  925  	TEST_OVERFLOWS_TYPE(u64, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  926  	TEST_OVERFLOWS_TYPE(u64, u8, (u64)U8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  927  	TEST_OVERFLOWS_TYPE(u64, u16, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  928  	TEST_OVERFLOWS_TYPE(u64, u16, U16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  929  	TEST_OVERFLOWS_TYPE(u64, u16, (u64)U16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  930  	TEST_OVERFLOWS_TYPE(u64, u32, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  931  	TEST_OVERFLOWS_TYPE(u64, u32, U32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  932  	TEST_OVERFLOWS_TYPE(u64, u32, (u64)U32_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  933  	TEST_OVERFLOWS_TYPE(u64, u64, U64_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  934  	TEST_OVERFLOWS_TYPE(u64, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  935  	TEST_OVERFLOWS_TYPE(u64, s8, (u64)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  936  	TEST_OVERFLOWS_TYPE(u64, s8, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  937  	TEST_OVERFLOWS_TYPE(u64, s16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  938  	TEST_OVERFLOWS_TYPE(u64, s16, (u64)S16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  939  	TEST_OVERFLOWS_TYPE(u64, s16, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  940  	TEST_OVERFLOWS_TYPE(u64, s32, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  941  	TEST_OVERFLOWS_TYPE(u64, s32, (u64)S32_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  942  	TEST_OVERFLOWS_TYPE(u64, s32, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  943  	TEST_OVERFLOWS_TYPE(u64, s64, S64_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  944  	TEST_OVERFLOWS_TYPE(u64, s64, U64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  945  	TEST_OVERFLOWS_TYPE(u64, s64, (u64)S64_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  946  	TEST_OVERFLOWS_TYPE(s64, u8, S64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  947  	TEST_OVERFLOWS_TYPE(s64, u8, S64_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  948  	TEST_OVERFLOWS_TYPE(s64, u8, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  949  	TEST_OVERFLOWS_TYPE(s64, u8, U8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  950  	TEST_OVERFLOWS_TYPE(s64, u8, (s64)U8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  951  	TEST_OVERFLOWS_TYPE(s64, u16, S64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  952  	TEST_OVERFLOWS_TYPE(s64, u16, S64_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  953  	TEST_OVERFLOWS_TYPE(s64, u16, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  954  	TEST_OVERFLOWS_TYPE(s64, u16, U16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  955  	TEST_OVERFLOWS_TYPE(s64, u16, (s64)U16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  956  	TEST_OVERFLOWS_TYPE(s64, u32, S64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  957  	TEST_OVERFLOWS_TYPE(s64, u32, S64_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  958  	TEST_OVERFLOWS_TYPE(s64, u32, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  959  	TEST_OVERFLOWS_TYPE(s64, u32, U32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  960  	TEST_OVERFLOWS_TYPE(s64, u32, (s64)U32_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  961  	TEST_OVERFLOWS_TYPE(s64, u64, S64_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  962  	TEST_OVERFLOWS_TYPE(s64, u64, S64_MIN, true);
4b21d25bf519c9 Kees Cook 2022-10-24  963  	TEST_OVERFLOWS_TYPE(s64, u64, -1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  964  	TEST_OVERFLOWS_TYPE(s64, s8, S8_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  965  	TEST_OVERFLOWS_TYPE(s64, s8, S8_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  966  	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  967  	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MIN - 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  968  	TEST_OVERFLOWS_TYPE(s64, s8, S64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  969  	TEST_OVERFLOWS_TYPE(s64, s16, S16_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  970  	TEST_OVERFLOWS_TYPE(s64, s16, S16_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  971  	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  972  	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MIN - 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  973  	TEST_OVERFLOWS_TYPE(s64, s16, S64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  974  	TEST_OVERFLOWS_TYPE(s64, s32, S32_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  975  	TEST_OVERFLOWS_TYPE(s64, s32, S32_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  976  	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MAX + 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  977  	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MIN - 1, true);
4b21d25bf519c9 Kees Cook 2022-10-24  978  	TEST_OVERFLOWS_TYPE(s64, s32, S64_MAX, true);
4b21d25bf519c9 Kees Cook 2022-10-24  979  	TEST_OVERFLOWS_TYPE(s64, s64, S64_MAX, false);
4b21d25bf519c9 Kees Cook 2022-10-24  980  	TEST_OVERFLOWS_TYPE(s64, s64, S64_MIN, false);
4b21d25bf519c9 Kees Cook 2022-10-24  981  #endif
4b21d25bf519c9 Kees Cook 2022-10-24  982  
4b21d25bf519c9 Kees Cook 2022-10-24  983  	/* Check for macro side-effects. */
4b21d25bf519c9 Kees Cook 2022-10-24  984  	var = INT_MAX - 1;
4b21d25bf519c9 Kees Cook 2022-10-24  985  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
4b21d25bf519c9 Kees Cook 2022-10-24  986  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
4b21d25bf519c9 Kees Cook 2022-10-24  987  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, true);
4b21d25bf519c9 Kees Cook 2022-10-24  988  	var = INT_MAX - 1;
4b21d25bf519c9 Kees Cook 2022-10-24  989  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
4b21d25bf519c9 Kees Cook 2022-10-24  990  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
4b21d25bf519c9 Kees Cook 2022-10-24  991  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, true);
4b21d25bf519c9 Kees Cook 2022-10-24  992  
4b21d25bf519c9 Kees Cook 2022-10-24  993  	kunit_info(test, "%d overflows_type() tests finished\n", count);
4b21d25bf519c9 Kees Cook 2022-10-24  994  #undef TEST_OVERFLOWS_TYPE
4b21d25bf519c9 Kees Cook 2022-10-24  995  #undef __TEST_OVERFLOWS_TYPE
4b21d25bf519c9 Kees Cook 2022-10-24  996  }
4b21d25bf519c9 Kees Cook 2022-10-24  997  

:::::: The code at line 817 was first introduced by commit
:::::: 4b21d25bf519c9487935a664886956bb18f04f6d overflow: Introduce overflows_type() and castable_to_type()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
