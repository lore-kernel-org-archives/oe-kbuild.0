Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A06E37D11D
	for <oe-kbuild@lists.linux.dev>; Wed, 13 May 2026 23:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778713662; cv=none; b=RIvgjwx9BkSVVMpeGjPm6LUSN3y28nAzeuUxgHYU74qJ0vmnSzBdDi6GEm+Tmz7HTelSnVBHlC9hkdBvg4I9hEr06/11qAwh4IXAb5Cg7WHOjEFPRKeFuD19Bws9KyY3bqjz8rauW7vi0gX/pz07B5++jMN7KF5xb1ymaMiwUcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778713662; c=relaxed/simple;
	bh=gzzWmO/kduwL/lna0E4TVwLwTKJ6bGTJX+aOgLzLI4c=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Mn4W7yyfLhO8n/jLs7mFLrAfoFZQ4zhjSFBAsm9ehevzhrHnPXXhUc+PK316+MlFMOiH/ZYzAOJk+8L+1WFLL217Y9ASkzgw0RngE73WwkVaLaRBRHeJq26Ty18bzHeU8x62QeCQPZyWJ5QuD8l0MTecw3zkZlIt0Pe/2Yzq9gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CVrRxZAW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CVrRxZAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778713661; x=1810249661;
  h=date:from:to:cc:subject:message-id;
  bh=gzzWmO/kduwL/lna0E4TVwLwTKJ6bGTJX+aOgLzLI4c=;
  b=CVrRxZAWZ0o6pxROEESXJK/JeJb0zC2tOVzRMIXPPHcwYRtLOstz8kda
   ZDOm/VAY3Fvh/tkFqXMNRKlgAE89PgKPw579ugrHc3F9swY2BBuc7sWAR
   4kx9cvftG10VNvxoOdPoE0t9MlB1WUc3Pa+yX8olJAx+5q21Iuc4drIWV
   TFlqDJr9muStzZcNVNGdeIOdLJbrOfpICghmBoNiqGzcpdcaUZ1Fmu4OV
   28mYPr8sArNjbbuGs0pII8m3/bIplJnnBUAbqhuwhQQ4x4oAAPMlVhSSZ
   kutm7CWCW1Pjih0rnV2RLS/TOvpl/L+p3agBVv0RXFR15MOukuCOnLglT
   Q==;
X-CSE-ConnectionGUID: dt1GeAc/Se+n7dTIUKKmAQ==
X-CSE-MsgGUID: UkCU1nxnSICjWJ3K42RUUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="91037813"
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="91037813"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2026 16:07:41 -0700
X-CSE-ConnectionGUID: u3KKn8DrRZCDXdiMgfQOSQ==
X-CSE-MsgGUID: VLu5mmqFQPKzaFoz1Jykhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,233,1770624000"; 
   d="scan'208";a="235557654"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 May 2026 16:07:40 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNIfx-000000005H3-2AgR;
	Wed, 13 May 2026 23:07:37 +0000
Date: Thu, 14 May 2026 07:07:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [koverstreet-bcachefs:bcachefs-rebalance_v2 463/799]
 fs/bcachefs/btree/bkey_methods.c:407 __bch2_bkey_compat() warn: for statement
 not indented
Message-ID: <202605140749.SytbGJc9-lkp@intel.com>
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
:::::: branch date: 6 months ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20260514 (https://download.01.org/0day-ci/archive/20260514/202605140749.SytbGJc9-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605140749.SytbGJc9-lkp@intel.com/

smatch warnings:
fs/bcachefs/btree/bkey_methods.c:407 __bch2_bkey_compat() warn: for statement not indented

vim +407 fs/bcachefs/btree/bkey_methods.c

39fb2983c586293 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  391  
39fb2983c586293 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  392  void __bch2_bkey_compat(unsigned level, enum btree_id btree_id,
39fb2983c586293 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  393  			unsigned version, unsigned big_endian,
39fb2983c586293 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  394  			int write,
39fb2983c586293 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  395  			struct bkey_format *f,
39fb2983c586293 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  396  			struct bkey_packed *k)
39fb2983c586293 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  397  {
39fb2983c586293 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  398  	const struct bkey_ops *ops;
39fb2983c586293 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  399  	struct bkey uk;
e751c01a8ee1ca9 fs/bcachefs/bkey_methods.c Kent Overstreet 2021-03-24  400  	unsigned nr_compat = 5;
41697f382cffc0e fs/bcachefs/bkey_methods.c Kent Overstreet 2020-04-24  401  	int i;
39fb2983c586293 fs/bcachefs/bkey_methods.c Kent Overstreet 2020-01-07  402  
41697f382cffc0e fs/bcachefs/bkey_methods.c Kent Overstreet 2020-04-24  403  	/*
41697f382cffc0e fs/bcachefs/bkey_methods.c Kent Overstreet 2020-04-24  404  	 * Do these operations in reverse order in the write path:
41697f382cffc0e fs/bcachefs/bkey_methods.c Kent Overstreet 2020-04-24  405  	 */
41697f382cffc0e fs/bcachefs/bkey_methods.c Kent Overstreet 2020-04-24  406  
e751c01a8ee1ca9 fs/bcachefs/bkey_methods.c Kent Overstreet 2021-03-24 @407  	for (i = 0; i < nr_compat; i++)

:::::: The code at line 407 was first introduced by commit
:::::: e751c01a8ee1ca934cc0953e2e77ad4ea3e64d5e bcachefs: Start using bpos.snapshot field

:::::: TO: Kent Overstreet <kent.overstreet@gmail.com>
:::::: CC: Kent Overstreet <kent.overstreet@linux.dev>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
