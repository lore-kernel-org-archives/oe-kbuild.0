Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D913C07A
	for <oe-kbuild@lists.linux.dev>; Sun, 29 Mar 2026 04:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774760296; cv=none; b=vGqg7DN20YJbh3CU9iWGiA8zrXN1TYPhPfNrZxFNOjN9ipbS6QnsYgi1dfYp0SkMGxrH6Zs5kZbiTpsP4ki/+m+f3IKXdMd6jGnTEgsw8WrJGZxz1O8jxOxvGTx5OQAr+ut/gof5BxWxJngPtjvumtzgMvy8VVb+2OyxadwOP+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774760296; c=relaxed/simple;
	bh=5TYlnUQMmVWQRdzas7iKE0j/4N9lPYMKCD9ptje1KRA=;
	h=Date:From:To:Subject:Message-ID; b=KNEnuHBr3mCqWKtOCMHSPLGfoH4nQuDUnnuo4is1N7u0+DxV7ZLVxFferV3FJx0qMxpSDE0QXhrxaL1Za5JQG9/V9FJhHfbD0sF2MBlPKiTsa7RwOBH1pn8WIWe1pflirBnn+rY4+ier2M5f2lqSz6yci65gpSXsy6o5o+AzDv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VvKphYma; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VvKphYma"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774760294; x=1806296294;
  h=date:from:to:subject:message-id;
  bh=5TYlnUQMmVWQRdzas7iKE0j/4N9lPYMKCD9ptje1KRA=;
  b=VvKphYmaysOs0POo07FTMd8Ozp1b3Ve82xqQD5BI5G0mFV2ceqldDa3Y
   cIa/6Yh4yK1CvthmLdrUqISGe5RWhYdZEDdBo5J4ThrCoPq1Qk3WjT7GY
   7FY7dZ7YXe48SFvg1Npvd6JWJNafF2X1bZ46TwA+U+RWybXk2M9xKZ82/
   IbZjR2YwDmTQez3PVQ6VqZIBPMyWoiLPhVcMgrS1M36gvm3C0R12Ay9m0
   3L/8dI9wFxjvWLomYoM1rK01YTaboonfFUUdpmIdvXEWd/J+g8/FB2jUf
   lK09Tu/KYGlKzd0I2f38ngmKCqYwwvDwzlq9Jz6hTWWXcVoE+NSonZXFD
   w==;
X-CSE-ConnectionGUID: 8J8aeulQRnWnoeHG0r3S3A==
X-CSE-MsgGUID: 2DZqPeFYRGKVRESeVOVd3g==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75755870"
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="75755870"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 21:58:14 -0700
X-CSE-ConnectionGUID: PqcC1wZzSlajbwZ0q+85Nw==
X-CSE-MsgGUID: 8/1kxlkLSqOSw8g/DWiUCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,147,1770624000"; 
   d="scan'208";a="225718396"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 28 Mar 2026 21:58:13 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6iDz-000000007qr-1GoL
	for oe-kbuild@lists.linux.dev;
	Sun, 29 Mar 2026 04:58:11 +0000
Date: Sun, 29 Mar 2026 06:57:31 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [paulmckrcu:dev 21/23] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202603290655.hIcVZocv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Paul E. McKenney" <paulmck@kernel.org>

tree:   https://github.com/paulmckrcu/linux dev
head:   256f5324d317b8c139b9ca0df8ff8b2c2d78468d
commit: 8e515470e29853cb58e6806038aa28acd3cf0d46 [21/23] torture: Add a hazptrtorture.c stress test
:::::: branch date: 8 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260329/202603290655.hIcVZocv-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#470: FILE: kernel/rcu/hazptrtorture.c:388:
+	const char *cp = hazptr_torture_writer_state_getname();;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
