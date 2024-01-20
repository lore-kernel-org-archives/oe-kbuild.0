Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D6914A82
	for <oe-kbuild@lists.linux.dev>; Sat, 20 Jan 2024 21:13:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705785240; cv=none; b=gxTVhGsfz432keQ7/Q9OQZervFJQ7bGacqDQ3nq3UqIwcSzRXbPFJD7U6aALkz9ARziAwyYpZciWyYbS4MCa0lmTZQdMXTKWwx5emYzpHC4bl1+j9QF4w51YpspSguoOUgHfs9PNxniCJ4kgVCotOAHstwU5V3NKf6AfMioxmaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705785240; c=relaxed/simple;
	bh=kDvvtYjYKJaj0ChupRQSdLcBluu2rfxaIjBUTCSWW4U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PumKToR7vim6ZUdq+Kfd90OM4aeWxMFeKyDttWwpXrjJBPDKShjzkAsmIc2cbifiuk+9U30/Muo+xuBri+2RDUCqplj0MnvZMGJ8noioXAQoKX2m2o170iYSuItvSNT65vyrznVGT/LjWTXPzG7czUYWzCat5m2xZeSsB+23WIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nh3NLcm8; arc=none smtp.client-ip=134.134.136.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nh3NLcm8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705785237; x=1737321237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kDvvtYjYKJaj0ChupRQSdLcBluu2rfxaIjBUTCSWW4U=;
  b=Nh3NLcm8x/uwJkOz6Xhy3EIy2/RbVaXxozpb4c+5V/zunYkHhFTI+A+1
   v9kYFXKSNJELfEuL0TYqeE7qf5v/ZoF7F2NMYt2kY/Z8GvRSmhZLjGcGP
   KQm3R5bODDkzFzYBdrRJEDgBsFQcDqFr9+CKZXtfE40rSlnHPzVgt/ngJ
   QY0fUMu5hoKP/PK6fhdGC4cBmCiz6dnrq+/97HXcdgOxmYxndX7CHujwd
   BtD0RW1pjtAk0+GENIjhWTJVy45qModmzgzMj64NzXgNzy+NLrj0AxvTI
   omf+XskJVVSRKaaQdGZg5yUdQwzaV1EJ0oKa0vU5YeOHg+gmZKPwxqEbq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="404739187"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="404739187"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2024 13:13:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10959"; a="908600052"
X-IronPort-AV: E=Sophos;i="6.05,208,1701158400"; 
   d="scan'208";a="908600052"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 20 Jan 2024 13:13:54 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRIf2-0005SM-1T;
	Sat, 20 Jan 2024 21:13:52 +0000
Date: Sun, 21 Jan 2024 05:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [kees:devel/overflow/sanitizers 1/84] lib/overflow_kunit.c:817
 overflows_type_test() warn: assigning (-128) to unsigned variable
 '*__builtin_choose_expr(!$expr_0x7f69a6aad5f0(4) == $expr_0x7f69a6aad780(4),
 &v, &$expr_0x7f69a6aadfa0(24))'
Message-ID: <202401210557.peoZRIwL-lkp@intel.com>
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
:::::: branch date: 24 hours ago
:::::: commit date: 2 days ago
config: i386-randconfig-141-20240120 (https://download.01.org/0day-ci/archive/20240121/202401210557.peoZRIwL-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202401210557.peoZRIwL-lkp@intel.com/

New smatch warnings:
lib/overflow_kunit.c:817 overflows_type_test() warn: assigning (-128) to unsigned variable '*__builtin_choose_expr(!$expr_0x7f69a6aad5f0(4) == $expr_0x7f69a6aad780(4), &v, &$expr_0x7f69a6aadfa0(24))'
lib/overflow_kunit.c:838 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a67b6cc0(4) == $expr_0x7f69a67b6db0(4), t1, 0) + v' 65535 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f69a679f650(4) == $expr_0x7f69a679f7e0(4), &v, &$expr_0x7f69a67a0000(24))'
lib/overflow_kunit.c:847 overflows_type_test() warn: assigning s16min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f69a6602ad0(4) == $expr_0x7f69a6602c60(4), &v, &$expr_0x7f69a6603480(24))'
lib/overflow_kunit.c:862 overflows_type_test() warn: value (-129) can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f69a64254b0(4) == $expr_0x7f69a6425640(4), &v, &$expr_0x7f69a6425e60(24))'
lib/overflow_kunit.c:864 overflows_type_test() warn: value s16min can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f69a63baad0(4) == $expr_0x7f69a63bac60(4), &v, &$expr_0x7f69a63bb480(24))'
lib/overflow_kunit.c:893 overflows_type_test() warn: assigning s32min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f69a5f17d30(4) == $expr_0x7f69a5f17ec0(4), &v, &$expr_0x7f69a5f186e0(24))'
lib/overflow_kunit.c:912 overflows_type_test() warn: value s32min can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f69a5c8cf10(4) == $expr_0x7f69a5c8d0a0(4), &v, &$expr_0x7f69a5c8d8c0(24))'
lib/overflow_kunit.c:916 overflows_type_test() warn: value (-32769) can't fit into s16min '*__builtin_choose_expr(!$expr_0x7f69a5bb7d30(4) == $expr_0x7f69a5bb7ec0(4), &v, &$expr_0x7f69a5bb86e0(24))'
lib/overflow_kunit.c:918 overflows_type_test() warn: value s32min can't fit into s16min '*__builtin_choose_expr(!$expr_0x7f69a5b75320(4) == $expr_0x7f69a5b754b0(4), &v, &$expr_0x7f69a5b75cd0(24))'

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
lib/overflow_kunit.c:817 overflows_type_test() warn: assigning (-128) to unsigned variable '*__builtin_choose_expr(!$expr_0x7f69a6a9a440(4) == $expr_0x7f69a6a9a5d0(4), &v, &$expr_0x7f69a6a9adf0(24))'
lib/overflow_kunit.c:820 overflows_type_test() warn: assigning (-128) to unsigned variable '*__builtin_choose_expr(!$expr_0x7f69a6a09400(4) == $expr_0x7f69a6a09590(4), &v, &$expr_0x7f69a6a09db0(24))'
lib/overflow_kunit.c:820 overflows_type_test() warn: assigning (-128) to unsigned variable '*__builtin_choose_expr(!$expr_0x7f69a6a0e220(4) == $expr_0x7f69a6a0e3b0(4), &v, &$expr_0x7f69a6a0ebd0(24))'
lib/overflow_kunit.c:838 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a67a3b10(4) == $expr_0x7f69a67a3c00(4), t1, 0) + v' 65535 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f69a67a4470(4) == $expr_0x7f69a67a4600(4), &v, &$expr_0x7f69a67a4e20(24))'
lib/overflow_kunit.c:840 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a675c1f0(4) == $expr_0x7f69a675c2e0(4), t1, 0) + v' 32768 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f69a675cb50(4) == $expr_0x7f69a675cce0(4), &v, &$expr_0x7f69a675d500(24))'
lib/overflow_kunit.c:840 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a6739040(4) == $expr_0x7f69a6739130(4), t1, 0) + v' 32768 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f69a67399a0(4) == $expr_0x7f69a6739b30(4), &v, &$expr_0x7f69a673a350(24))'
lib/overflow_kunit.c:841 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a671aa80(4) == $expr_0x7f69a671ab70(4), t1, 0) + v' 65535 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f69a671b3e0(4) == $expr_0x7f69a671b570(4), &v, &$expr_0x7f69a671bd90(24))'
lib/overflow_kunit.c:841 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a67078d0(4) == $expr_0x7f69a67079c0(4), t1, 0) + v' 65535 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f69a6708230(4) == $expr_0x7f69a67083c0(4), &v, &$expr_0x7f69a6708be0(24))'
lib/overflow_kunit.c:847 overflows_type_test() warn: assigning s16min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f69a65e7920(4) == $expr_0x7f69a65e7ab0(4), &v, &$expr_0x7f69a65e82d0(24))'
lib/overflow_kunit.c:850 overflows_type_test() warn: assigning s16min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f69a657e8b0(4) == $expr_0x7f69a657ea40(4), &v, &$expr_0x7f69a6567290(24))'
lib/overflow_kunit.c:850 overflows_type_test() warn: assigning s16min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f69a656b700(4) == $expr_0x7f69a656b890(4), &v, &$expr_0x7f69a656c0b0(24))'
lib/overflow_kunit.c:862 overflows_type_test() warn: value (-129) can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f69a640a300(4) == $expr_0x7f69a640a490(4), &v, &$expr_0x7f69a640acb0(24))'
lib/overflow_kunit.c:863 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a63eb570(4) == $expr_0x7f69a63eb660(4), t1, 0) + v' 32767 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f69a63ebed0(4) == $expr_0x7f69a63ec060(4), &v, &$expr_0x7f69a63ec880(24))'
lib/overflow_kunit.c:863 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a63e03c0(4) == $expr_0x7f69a63e04b0(4), t1, 0) + v' 32767 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f69a63e0d20(4) == $expr_0x7f69a63e0eb0(4), &v, &$expr_0x7f69a63e16d0(24))'
lib/overflow_kunit.c:864 overflows_type_test() warn: value s16min can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f69a63a7920(4) == $expr_0x7f69a63a7ab0(4), &v, &$expr_0x7f69a63a82d0(24))'
lib/overflow_kunit.c:874 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a61ec5b0(4) == $expr_0x7f69a61ec6a0(4), t1, 0) + v' 4294967295 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f69a61ecf10(4) == $expr_0x7f69a61ed0a0(4), &v, &$expr_0x7f69a61ed8c0(24))'
lib/overflow_kunit.c:874 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a61d1400(4) == $expr_0x7f69a61d14f0(4), t1, 0) + v' 4294967295 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f69a61d1d60(4) == $expr_0x7f69a61d1ef0(4), &v, &$expr_0x7f69a61d2710(24))'
lib/overflow_kunit.c:876 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a6181770(4) == $expr_0x7f69a6181860(4), t1, 0) + v' 65536 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f69a61820d0(4) == $expr_0x7f69a6182260(4), &v, &$expr_0x7f69a6182a80(24))'
lib/overflow_kunit.c:876 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a6186590(4) == $expr_0x7f69a6186680(4), t1, 0) + v' 65536 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f69a6186ef0(4) == $expr_0x7f69a61770b0(4), &v, &$expr_0x7f69a61778d0(24))'
lib/overflow_kunit.c:877 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a6158000(4) == $expr_0x7f69a61580f0(4), t1, 0) + v' 4294967295 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f69a6158960(4) == $expr_0x7f69a6158af0(4), &v, &$expr_0x7f69a6159310(24))'
lib/overflow_kunit.c:877 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a615ce20(4) == $expr_0x7f69a615cf10(4), t1, 0) + v' 4294967295 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f69a615d780(4) == $expr_0x7f69a615d910(4), &v, &$expr_0x7f69a615e130(24))'
lib/overflow_kunit.c:879 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a6105500(4) == $expr_0x7f69a61055f0(4), t1, 0) + v' 32768 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f69a6105e60(4) == $expr_0x7f69a6105ff0(4), &v, &$expr_0x7f69a6106810(24))'
lib/overflow_kunit.c:879 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a60ea350(4) == $expr_0x7f69a60ea440(4), t1, 0) + v' 32768 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f69a60eacb0(4) == $expr_0x7f69a60eae40(4), &v, &$expr_0x7f69a60eb660(24))'
lib/overflow_kunit.c:880 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a60d3d90(4) == $expr_0x7f69a60d3e80(4), t1, 0) + v' 4294967295 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f69a60d46f0(4) == $expr_0x7f69a60d4880(4), &v, &$expr_0x7f69a60d50a0(24))'
lib/overflow_kunit.c:880 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a60c0be0(4) == $expr_0x7f69a60c0cd0(4), t1, 0) + v' 4294967295 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f69a60c1540(4) == $expr_0x7f69a60c16d0(4), &v, &$expr_0x7f69a60c1ef0(24))'
lib/overflow_kunit.c:891 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a5f81fe0(4) == $expr_0x7f69a5f820d0(4), t1, 0) + v' 2147483647 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f69a5f82940(4) == $expr_0x7f69a5f82ad0(4), &v, &$expr_0x7f69a5f832f0(24))'
lib/overflow_kunit.c:891 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a5f86e00(4) == $expr_0x7f69a5f86ef0(4), t1, 0) + v' 2147483647 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f69a5f67790(4) == $expr_0x7f69a5f67920(4), &v, &$expr_0x7f69a5f68140(24))'
lib/overflow_kunit.c:893 overflows_type_test() warn: assigning s32min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f69a5f1cb50(4) == $expr_0x7f69a5f1cce0(4), &v, &$expr_0x7f69a5f1d500(24))'
lib/overflow_kunit.c:895 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a5ecc5b0(4) == $expr_0x7f69a5ecc6a0(4), t1, 0) + v' 65536 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f69a5eccf10(4) == $expr_0x7f69a5ecd0a0(4), &v, &$expr_0x7f69a5ecd8c0(24))'
lib/overflow_kunit.c:895 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a5eb1400(4) == $expr_0x7f69a5eb14f0(4), t1, 0) + v' 65536 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f69a5eb1d60(4) == $expr_0x7f69a5eb1ef0(4), &v, &$expr_0x7f69a5eb2710(24))'
lib/overflow_kunit.c:896 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a5e92fd0(4) == $expr_0x7f69a5e930c0(4), t1, 0) + v' 2147483647 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f69a5e93930(4) == $expr_0x7f69a5e93ac0(4), &v, &$expr_0x7f69a5e942e0(24))'
lib/overflow_kunit.c:896 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a5e7fe20(4) == $expr_0x7f69a5e7ff10(4), t1, 0) + v' 2147483647 can't fit into 65535 '*__builtin_choose_expr(!$expr_0x7f69a5e80780(4) == $expr_0x7f69a5e80910(4), &v, &$expr_0x7f69a5e81130(24))'
lib/overflow_kunit.c:898 overflows_type_test() warn: assigning s32min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f69a5e28d20(4) == $expr_0x7f69a5e28eb0(4), &v, &$expr_0x7f69a5e296d0(24))'
lib/overflow_kunit.c:898 overflows_type_test() warn: assigning s32min to unsigned variable '*__builtin_choose_expr(!$expr_0x7f69a5e2db40(4) == $expr_0x7f69a5e2dcd0(4), &v, &$expr_0x7f69a5e2e4f0(24))'
lib/overflow_kunit.c:910 overflows_type_test() warn: value (-129) can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f69a5cdf920(4) == $expr_0x7f69a5cdfab0(4), &v, &$expr_0x7f69a5ce02d0(24))'
lib/overflow_kunit.c:910 overflows_type_test() warn: value (-129) can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f69a5ce4740(4) == $expr_0x7f69a5ce48d0(4), &v, &$expr_0x7f69a5ce50f0(24))'
lib/overflow_kunit.c:911 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a5cbd9b0(4) == $expr_0x7f69a5cbdaa0(4), t1, 0) + v' 2147483647 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f69a5cbe310(4) == $expr_0x7f69a5cbe4a0(4), &v, &$expr_0x7f69a5cbecc0(24))'
lib/overflow_kunit.c:911 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a5ca2800(4) == $expr_0x7f69a5ca28f0(4), t1, 0) + v' 2147483647 can't fit into 127 '*__builtin_choose_expr(!$expr_0x7f69a5ca3160(4) == $expr_0x7f69a5ca32f0(4), &v, &$expr_0x7f69a5ca3b10(24))'
lib/overflow_kunit.c:912 overflows_type_test() warn: value s32min can't fit into (-128) '*__builtin_choose_expr(!$expr_0x7f69a5c71d60(4) == $expr_0x7f69a5c71ef0(4), &v, &$expr_0x7f69a5c72710(24))'
lib/overflow_kunit.c:915 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a5bf06e0(4) == $expr_0x7f69a5bf07d0(4), t1, 0) + v' 32768 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f69a5bf1040(4) == $expr_0x7f69a5bf11d0(4), &v, &$expr_0x7f69a5bf19f0(24))'
lib/overflow_kunit.c:915 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a5bf5500(4) == $expr_0x7f69a5bf55f0(4), t1, 0) + v' 32768 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f69a5bf5e60(4) == $expr_0x7f69a5bf5ff0(4), &v, &$expr_0x7f69a5bf6810(24))'
lib/overflow_kunit.c:916 overflows_type_test() warn: value (-32769) can't fit into s16min '*__builtin_choose_expr(!$expr_0x7f69a5bbcb50(4) == $expr_0x7f69a5bbcce0(4), &v, &$expr_0x7f69a5bbd500(24))'
lib/overflow_kunit.c:917 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a5ba5dc0(4) == $expr_0x7f69a5ba5eb0(4), t1, 0) + v' 2147483647 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f69a5ba6720(4) == $expr_0x7f69a5ba68b0(4), &v, &$expr_0x7f69a5b87100(24))'
lib/overflow_kunit.c:917 overflows_type_test() warn: '__builtin_choose_expr(!$expr_0x7f69a5b8ac10(4) == $expr_0x7f69a5b8ad00(4), t1, 0) + v' 2147483647 can't fit into 32767 '*__builtin_choose_expr(!$expr_0x7f69a5b8b570(4) == $expr_0x7f69a5b8b700(4), &v, &$expr_0x7f69a5b8bf20(24))'
lib/overflow_kunit.c:918 overflows_type_test() warn: value s32min can't fit into s16min '*__builtin_choose_expr(!$expr_0x7f69a5b62170(4) == $expr_0x7f69a5b62300(4), &v, &$expr_0x7f69a5b62b20(24))'
lib/overflow_kunit.c:1145 castable_to_type_test() warn: unsigned '(((1 << (8 * 1 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 1 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1145 castable_to_type_test() warn: unsigned '(((1 << (8 * 1 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 1 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1146 castable_to_type_test() warn: unsigned '(((1 << (8 * 2 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 2 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1146 castable_to_type_test() warn: unsigned '(((1 << (8 * 2 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 2 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1147 castable_to_type_test() warn: unsigned '(((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1147 castable_to_type_test() warn: unsigned '(((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))' is never less than zero.
lib/overflow_kunit.c:1147 castable_to_type_test() warn: unsigned '(((1 << (8 * 4 - 1 - (((-1)) < 1))) - 1) + (1 << (8 * 4 - 1 - (((-1)) < 1))))' is never less than zero.

vim +817 lib/overflow_kunit.c

4b21d25bf519c94 Kees Cook 2022-10-24  808  
4b21d25bf519c94 Kees Cook 2022-10-24  809  	TEST_OVERFLOWS_TYPE(u8, u8, U8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  810  	TEST_OVERFLOWS_TYPE(u8, u16, U8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  811  	TEST_OVERFLOWS_TYPE(u8, s8, U8_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  812  	TEST_OVERFLOWS_TYPE(u8, s8, S8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  813  	TEST_OVERFLOWS_TYPE(u8, s8, (u8)S8_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  814  	TEST_OVERFLOWS_TYPE(u8, s16, U8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  815  	TEST_OVERFLOWS_TYPE(s8, u8, S8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  816  	TEST_OVERFLOWS_TYPE(s8, u8, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24 @817  	TEST_OVERFLOWS_TYPE(s8, u8, S8_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  818  	TEST_OVERFLOWS_TYPE(s8, u16, S8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  819  	TEST_OVERFLOWS_TYPE(s8, u16, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  820  	TEST_OVERFLOWS_TYPE(s8, u16, S8_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  821  	TEST_OVERFLOWS_TYPE(s8, u32, S8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  822  	TEST_OVERFLOWS_TYPE(s8, u32, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  823  	TEST_OVERFLOWS_TYPE(s8, u32, S8_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  824  #if BITS_PER_LONG == 64
4b21d25bf519c94 Kees Cook 2022-10-24  825  	TEST_OVERFLOWS_TYPE(s8, u64, S8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  826  	TEST_OVERFLOWS_TYPE(s8, u64, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  827  	TEST_OVERFLOWS_TYPE(s8, u64, S8_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  828  #endif
4b21d25bf519c94 Kees Cook 2022-10-24  829  	TEST_OVERFLOWS_TYPE(s8, s8, S8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  830  	TEST_OVERFLOWS_TYPE(s8, s8, S8_MIN, false);
4b21d25bf519c94 Kees Cook 2022-10-24  831  	TEST_OVERFLOWS_TYPE(s8, s16, S8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  832  	TEST_OVERFLOWS_TYPE(s8, s16, S8_MIN, false);
4b21d25bf519c94 Kees Cook 2022-10-24  833  	TEST_OVERFLOWS_TYPE(u16, u8, U8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  834  	TEST_OVERFLOWS_TYPE(u16, u8, (u16)U8_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  835  	TEST_OVERFLOWS_TYPE(u16, u8, U16_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  836  	TEST_OVERFLOWS_TYPE(u16, s8, S8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  837  	TEST_OVERFLOWS_TYPE(u16, s8, (u16)S8_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24 @838  	TEST_OVERFLOWS_TYPE(u16, s8, U16_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  839  	TEST_OVERFLOWS_TYPE(u16, s16, S16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  840  	TEST_OVERFLOWS_TYPE(u16, s16, (u16)S16_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  841  	TEST_OVERFLOWS_TYPE(u16, s16, U16_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  842  	TEST_OVERFLOWS_TYPE(u16, u32, U16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  843  	TEST_OVERFLOWS_TYPE(u16, s32, U16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  844  	TEST_OVERFLOWS_TYPE(s16, u8, U8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  845  	TEST_OVERFLOWS_TYPE(s16, u8, (s16)U8_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  846  	TEST_OVERFLOWS_TYPE(s16, u8, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24 @847  	TEST_OVERFLOWS_TYPE(s16, u8, S16_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  848  	TEST_OVERFLOWS_TYPE(s16, u16, S16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  849  	TEST_OVERFLOWS_TYPE(s16, u16, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  850  	TEST_OVERFLOWS_TYPE(s16, u16, S16_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  851  	TEST_OVERFLOWS_TYPE(s16, u32, S16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  852  	TEST_OVERFLOWS_TYPE(s16, u32, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  853  	TEST_OVERFLOWS_TYPE(s16, u32, S16_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  854  #if BITS_PER_LONG == 64
4b21d25bf519c94 Kees Cook 2022-10-24  855  	TEST_OVERFLOWS_TYPE(s16, u64, S16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  856  	TEST_OVERFLOWS_TYPE(s16, u64, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  857  	TEST_OVERFLOWS_TYPE(s16, u64, S16_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  858  #endif
4b21d25bf519c94 Kees Cook 2022-10-24  859  	TEST_OVERFLOWS_TYPE(s16, s8, S8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  860  	TEST_OVERFLOWS_TYPE(s16, s8, S8_MIN, false);
4b21d25bf519c94 Kees Cook 2022-10-24  861  	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24 @862  	TEST_OVERFLOWS_TYPE(s16, s8, (s16)S8_MIN - 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  863  	TEST_OVERFLOWS_TYPE(s16, s8, S16_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24 @864  	TEST_OVERFLOWS_TYPE(s16, s8, S16_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  865  	TEST_OVERFLOWS_TYPE(s16, s16, S16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  866  	TEST_OVERFLOWS_TYPE(s16, s16, S16_MIN, false);
4b21d25bf519c94 Kees Cook 2022-10-24  867  	TEST_OVERFLOWS_TYPE(s16, s32, S16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  868  	TEST_OVERFLOWS_TYPE(s16, s32, S16_MIN, false);
4b21d25bf519c94 Kees Cook 2022-10-24  869  	TEST_OVERFLOWS_TYPE(u32, u8, U8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  870  	TEST_OVERFLOWS_TYPE(u32, u8, (u32)U8_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  871  	TEST_OVERFLOWS_TYPE(u32, u8, U32_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  872  	TEST_OVERFLOWS_TYPE(u32, s8, S8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  873  	TEST_OVERFLOWS_TYPE(u32, s8, (u32)S8_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  874  	TEST_OVERFLOWS_TYPE(u32, s8, U32_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  875  	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  876  	TEST_OVERFLOWS_TYPE(u32, u16, U16_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  877  	TEST_OVERFLOWS_TYPE(u32, u16, U32_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  878  	TEST_OVERFLOWS_TYPE(u32, s16, S16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  879  	TEST_OVERFLOWS_TYPE(u32, s16, (u32)S16_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  880  	TEST_OVERFLOWS_TYPE(u32, s16, U32_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  881  	TEST_OVERFLOWS_TYPE(u32, u32, U32_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  882  	TEST_OVERFLOWS_TYPE(u32, s32, S32_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  883  	TEST_OVERFLOWS_TYPE(u32, s32, U32_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  884  	TEST_OVERFLOWS_TYPE(u32, s32, (u32)S32_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  885  #if BITS_PER_LONG == 64
4b21d25bf519c94 Kees Cook 2022-10-24  886  	TEST_OVERFLOWS_TYPE(u32, u64, U32_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  887  	TEST_OVERFLOWS_TYPE(u32, s64, U32_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  888  #endif
4b21d25bf519c94 Kees Cook 2022-10-24  889  	TEST_OVERFLOWS_TYPE(s32, u8, U8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  890  	TEST_OVERFLOWS_TYPE(s32, u8, (s32)U8_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  891  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  892  	TEST_OVERFLOWS_TYPE(s32, u8, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24 @893  	TEST_OVERFLOWS_TYPE(s32, u8, S32_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  894  	TEST_OVERFLOWS_TYPE(s32, u16, U16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  895  	TEST_OVERFLOWS_TYPE(s32, u16, (s32)U16_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  896  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  897  	TEST_OVERFLOWS_TYPE(s32, u16, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  898  	TEST_OVERFLOWS_TYPE(s32, u16, S32_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  899  	TEST_OVERFLOWS_TYPE(s32, u32, S32_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  900  	TEST_OVERFLOWS_TYPE(s32, u32, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  901  	TEST_OVERFLOWS_TYPE(s32, u32, S32_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  902  #if BITS_PER_LONG == 64
4b21d25bf519c94 Kees Cook 2022-10-24  903  	TEST_OVERFLOWS_TYPE(s32, u64, S32_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  904  	TEST_OVERFLOWS_TYPE(s32, u64, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  905  	TEST_OVERFLOWS_TYPE(s32, u64, S32_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  906  #endif
4b21d25bf519c94 Kees Cook 2022-10-24  907  	TEST_OVERFLOWS_TYPE(s32, s8, S8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  908  	TEST_OVERFLOWS_TYPE(s32, s8, S8_MIN, false);
4b21d25bf519c94 Kees Cook 2022-10-24  909  	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  910  	TEST_OVERFLOWS_TYPE(s32, s8, (s32)S8_MIN - 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  911  	TEST_OVERFLOWS_TYPE(s32, s8, S32_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24 @912  	TEST_OVERFLOWS_TYPE(s32, s8, S32_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  913  	TEST_OVERFLOWS_TYPE(s32, s16, S16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  914  	TEST_OVERFLOWS_TYPE(s32, s16, S16_MIN, false);
4b21d25bf519c94 Kees Cook 2022-10-24  915  	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24 @916  	TEST_OVERFLOWS_TYPE(s32, s16, (s32)S16_MIN - 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  917  	TEST_OVERFLOWS_TYPE(s32, s16, S32_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24 @918  	TEST_OVERFLOWS_TYPE(s32, s16, S32_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  919  	TEST_OVERFLOWS_TYPE(s32, s32, S32_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  920  	TEST_OVERFLOWS_TYPE(s32, s32, S32_MIN, false);
4b21d25bf519c94 Kees Cook 2022-10-24  921  #if BITS_PER_LONG == 64
4b21d25bf519c94 Kees Cook 2022-10-24  922  	TEST_OVERFLOWS_TYPE(s32, s64, S32_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  923  	TEST_OVERFLOWS_TYPE(s32, s64, S32_MIN, false);
4b21d25bf519c94 Kees Cook 2022-10-24  924  	TEST_OVERFLOWS_TYPE(u64, u8, U64_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  925  	TEST_OVERFLOWS_TYPE(u64, u8, U8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  926  	TEST_OVERFLOWS_TYPE(u64, u8, (u64)U8_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  927  	TEST_OVERFLOWS_TYPE(u64, u16, U64_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  928  	TEST_OVERFLOWS_TYPE(u64, u16, U16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  929  	TEST_OVERFLOWS_TYPE(u64, u16, (u64)U16_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  930  	TEST_OVERFLOWS_TYPE(u64, u32, U64_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  931  	TEST_OVERFLOWS_TYPE(u64, u32, U32_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  932  	TEST_OVERFLOWS_TYPE(u64, u32, (u64)U32_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  933  	TEST_OVERFLOWS_TYPE(u64, u64, U64_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  934  	TEST_OVERFLOWS_TYPE(u64, s8, S8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  935  	TEST_OVERFLOWS_TYPE(u64, s8, (u64)S8_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  936  	TEST_OVERFLOWS_TYPE(u64, s8, U64_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  937  	TEST_OVERFLOWS_TYPE(u64, s16, S16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  938  	TEST_OVERFLOWS_TYPE(u64, s16, (u64)S16_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  939  	TEST_OVERFLOWS_TYPE(u64, s16, U64_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  940  	TEST_OVERFLOWS_TYPE(u64, s32, S32_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  941  	TEST_OVERFLOWS_TYPE(u64, s32, (u64)S32_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  942  	TEST_OVERFLOWS_TYPE(u64, s32, U64_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  943  	TEST_OVERFLOWS_TYPE(u64, s64, S64_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  944  	TEST_OVERFLOWS_TYPE(u64, s64, U64_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  945  	TEST_OVERFLOWS_TYPE(u64, s64, (u64)S64_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  946  	TEST_OVERFLOWS_TYPE(s64, u8, S64_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  947  	TEST_OVERFLOWS_TYPE(s64, u8, S64_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  948  	TEST_OVERFLOWS_TYPE(s64, u8, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  949  	TEST_OVERFLOWS_TYPE(s64, u8, U8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  950  	TEST_OVERFLOWS_TYPE(s64, u8, (s64)U8_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  951  	TEST_OVERFLOWS_TYPE(s64, u16, S64_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  952  	TEST_OVERFLOWS_TYPE(s64, u16, S64_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  953  	TEST_OVERFLOWS_TYPE(s64, u16, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  954  	TEST_OVERFLOWS_TYPE(s64, u16, U16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  955  	TEST_OVERFLOWS_TYPE(s64, u16, (s64)U16_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  956  	TEST_OVERFLOWS_TYPE(s64, u32, S64_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  957  	TEST_OVERFLOWS_TYPE(s64, u32, S64_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  958  	TEST_OVERFLOWS_TYPE(s64, u32, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  959  	TEST_OVERFLOWS_TYPE(s64, u32, U32_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  960  	TEST_OVERFLOWS_TYPE(s64, u32, (s64)U32_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  961  	TEST_OVERFLOWS_TYPE(s64, u64, S64_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  962  	TEST_OVERFLOWS_TYPE(s64, u64, S64_MIN, true);
4b21d25bf519c94 Kees Cook 2022-10-24  963  	TEST_OVERFLOWS_TYPE(s64, u64, -1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  964  	TEST_OVERFLOWS_TYPE(s64, s8, S8_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  965  	TEST_OVERFLOWS_TYPE(s64, s8, S8_MIN, false);
4b21d25bf519c94 Kees Cook 2022-10-24  966  	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  967  	TEST_OVERFLOWS_TYPE(s64, s8, (s64)S8_MIN - 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  968  	TEST_OVERFLOWS_TYPE(s64, s8, S64_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  969  	TEST_OVERFLOWS_TYPE(s64, s16, S16_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  970  	TEST_OVERFLOWS_TYPE(s64, s16, S16_MIN, false);
4b21d25bf519c94 Kees Cook 2022-10-24  971  	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  972  	TEST_OVERFLOWS_TYPE(s64, s16, (s64)S16_MIN - 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  973  	TEST_OVERFLOWS_TYPE(s64, s16, S64_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  974  	TEST_OVERFLOWS_TYPE(s64, s32, S32_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  975  	TEST_OVERFLOWS_TYPE(s64, s32, S32_MIN, false);
4b21d25bf519c94 Kees Cook 2022-10-24  976  	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MAX + 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  977  	TEST_OVERFLOWS_TYPE(s64, s32, (s64)S32_MIN - 1, true);
4b21d25bf519c94 Kees Cook 2022-10-24  978  	TEST_OVERFLOWS_TYPE(s64, s32, S64_MAX, true);
4b21d25bf519c94 Kees Cook 2022-10-24  979  	TEST_OVERFLOWS_TYPE(s64, s64, S64_MAX, false);
4b21d25bf519c94 Kees Cook 2022-10-24  980  	TEST_OVERFLOWS_TYPE(s64, s64, S64_MIN, false);
4b21d25bf519c94 Kees Cook 2022-10-24  981  #endif
4b21d25bf519c94 Kees Cook 2022-10-24  982  
4b21d25bf519c94 Kees Cook 2022-10-24  983  	/* Check for macro side-effects. */
4b21d25bf519c94 Kees Cook 2022-10-24  984  	var = INT_MAX - 1;
4b21d25bf519c94 Kees Cook 2022-10-24  985  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
4b21d25bf519c94 Kees Cook 2022-10-24  986  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, false);
4b21d25bf519c94 Kees Cook 2022-10-24  987  	__TEST_OVERFLOWS_TYPE(__overflows_type, var++, int, true);
4b21d25bf519c94 Kees Cook 2022-10-24  988  	var = INT_MAX - 1;
4b21d25bf519c94 Kees Cook 2022-10-24  989  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
4b21d25bf519c94 Kees Cook 2022-10-24  990  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, false);
4b21d25bf519c94 Kees Cook 2022-10-24  991  	__TEST_OVERFLOWS_TYPE(overflows_type, var++, int, true);
4b21d25bf519c94 Kees Cook 2022-10-24  992  
4b21d25bf519c94 Kees Cook 2022-10-24  993  	kunit_info(test, "%d overflows_type() tests finished\n", count);
4b21d25bf519c94 Kees Cook 2022-10-24  994  #undef TEST_OVERFLOWS_TYPE
4b21d25bf519c94 Kees Cook 2022-10-24  995  #undef __TEST_OVERFLOWS_TYPE
4b21d25bf519c94 Kees Cook 2022-10-24  996  }
4b21d25bf519c94 Kees Cook 2022-10-24  997  

:::::: The code at line 817 was first introduced by commit
:::::: 4b21d25bf519c9487935a664886956bb18f04f6d overflow: Introduce overflows_type() and castable_to_type()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
