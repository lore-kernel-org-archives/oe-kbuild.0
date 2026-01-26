Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A522253EB
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 06:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769407314; cv=none; b=L15CLdalzoMWzbbSY49mID8VS9qx1eTWTnJ3oMx0JT2+CQZ69zJCGEwBrCsGdfhnjKqq16QW+aVL5+JCjXQqJnKbWn07CbsRg606W/wGzJ5d8cfMB8HaJArqeov4iA0Sw8dEjuF+AlvHJrR4CXx2QACGuJt2O0OsW+wsAA4pLk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769407314; c=relaxed/simple;
	bh=JfS2wlO++HEEyK313ZsuiaZM/LawTyCM8S5OF1kHjGo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ReCyX+uDqMjKMnrVfKXXRaeXLlQUf9qVovgzuePJ0I7joahYN16r52cFbo4yXBFH8w09brs7a58SNGBXd+B/nvDaoe4jAssUCkNTtGH7ctIQbujdBPq1mpKRO2c/u2fQlCaI8eQPqIYH08ZWF4F7F0w/tepVAfsCEN7RsjqG2UE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FlC55u98; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FlC55u98"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769407312; x=1800943312;
  h=date:from:to:cc:subject:message-id;
  bh=JfS2wlO++HEEyK313ZsuiaZM/LawTyCM8S5OF1kHjGo=;
  b=FlC55u98fKWb0GEQJAAW3RVk9nD2LDNN+imWqxcFt6+UFLZp8f5YPRNE
   3VBUoISOSErfvzBCfkYd/LEFgWLk12Q7cpcqg9ANva0NHUVt9QucSZa3H
   oAu5ovEEttHayhxBoR9r50ZOs2XWbBSwmkP9WLiMZgL0KDRn8jDDkKdJa
   xjgFFZXkr5sG94GHEib8n2ph1305etbW9EcMfJnP5lOrngDRPqq2/ppA1
   9bKRlH2YPH0H/zoWQ4UFxaZQ38WeyWW8GrU7NoJ0EptgKcwlOI0A8DtYr
   m6izVJ6WZXe2oaSwxwdAyst7MECuwwYgnhTuKQuBRwF0bwG/Y2sxPcQ98
   Q==;
X-CSE-ConnectionGUID: sb7q5uBbQ3a3PELlinBbAw==
X-CSE-MsgGUID: Z5USYJ28Sp2MEO7KC7E+TQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="96048938"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="96048938"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 22:01:51 -0800
X-CSE-ConnectionGUID: nnrmSn9+SzauxVhBz2tucg==
X-CSE-MsgGUID: xAwUoEioT9+smVFK1oCgvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="206718571"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 25 Jan 2026 22:01:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkFfX-00000000WyE-3upp;
	Mon, 26 Jan 2026 06:01:47 +0000
Date: Mon, 26 Jan 2026 14:01:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 463/799]
 fs/bcachefs/btree/bkey_methods.c:407 __bch2_bkey_compat() warn: for statement
 not indented
Message-ID: <202601261323.o2OjgNhs-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Kent Overstreet <kent.overstreet@linux.dev>

tree:   https://github.com/koverstreet/bcachefs bcachefs-rebalance_v2
head:   d4b3d00447faf8d4d95db47e3902e4ca4db8fbdc
commit: 341ed7235f7a21d75b0bf273bdfef7525d4230c9 [463/799] bcachefs: move bkey, bset code to btree/
:::::: branch date: 3 months ago
:::::: commit date: 3 months ago
config: x86_64-randconfig-r073-20260126 (https://download.01.org/0day-ci/archive/20260126/202601261323.o2OjgNhs-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601261323.o2OjgNhs-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree/bkey_methods.c:407 __bch2_bkey_compat() warn: for statement not indented

vim +407 fs/bcachefs/btree/bkey_methods.c

39fb2983c58629 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  391  
39fb2983c58629 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  392  void __bch2_bkey_compat(unsigned level, enum btree_id btree_id,
39fb2983c58629 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  393  			unsigned version, unsigned big_endian,
39fb2983c58629 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  394  			int write,
39fb2983c58629 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  395  			struct bkey_format *f,
39fb2983c58629 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  396  			struct bkey_packed *k)
39fb2983c58629 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  397  {
39fb2983c58629 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  398  	const struct bkey_ops *ops;
39fb2983c58629 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  399  	struct bkey uk;
e751c01a8ee1ca fs/bcachefs/bkey_methods.c Kent Overstreet 2021-03-24  400  	unsigned nr_compat = 5;
41697f382cffc0 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-04-24  401  	int i;
39fb2983c58629 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  402  
41697f382cffc0 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-04-24  403  	/*
41697f382cffc0 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-04-24  404  	 * Do these operations in reverse order in the write path:
41697f382cffc0 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-04-24  405  	 */
41697f382cffc0 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-04-24  406  
e751c01a8ee1ca fs/bcachefs/bkey_methods.c Kent Overstreet 2021-03-24 @407  	for (i = 0; i < nr_compat; i++)

:::::: The code at line 407 was first introduced by commit
:::::: e751c01a8ee1ca934cc0953e2e77ad4ea3e64d5e bcachefs: Start using bpos.snapshot field

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
