Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6616314B8F
	for <oe-kbuild@lists.linux.dev>; Thu, 13 Nov 2025 21:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763069120; cv=none; b=ZzilWC5qV0xHksLSAQcaYpR14UQ3Trw4Iw+qWPQJ4xgq9mCqOmembI8cFdnsNQ1IhpXQWPxscyKyQ4B1Av6xfFdFwlQKHgIQJvIKJH2Pnx7s8i6m2FHqiy/T4tPo0FZ6FumHpJWgrVpoxn6HlntNRKCEt7K5oPTPE5pYC0JGKgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763069120; c=relaxed/simple;
	bh=4Z474QPBhug7A3NequwtbwIRe9T9VqzJ3fRt8aJZbxc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WP755X+jQnkxxTnkiIoadR7zWIAjCMo0oMn3fgWtDebaYVtGDnJdqvvDK1tzYGacZDwBuwbJxjcGhWkEKzqRQfcejne87Mny66Dll3o+V6mR9jSYPA+wo9dJCHstPdGeIoOz2BR34pZTdWfzwlF/9YD/hOnE19p1xBjhXngvTFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Hxn2mBha; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Hxn2mBha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763069119; x=1794605119;
  h=date:from:to:subject:message-id:mime-version;
  bh=4Z474QPBhug7A3NequwtbwIRe9T9VqzJ3fRt8aJZbxc=;
  b=Hxn2mBhaY3GdbwufjxmDSyi0MhjZo1+cMHGlzJqb0h9ghc6d/HgNcYqL
   vCfDJ/M0OHdaURYpuo+FU1X/JLOFLYW8nMMqN15Lfe96NJIK98xknia3D
   Ezz8qMExq1gKL5hzp4+eLsQdKLPBdoeWnCKXZlPNatML1udq4NgOGjsxz
   fwazXwh+eKAXaqh+kzvQl6aDrlO6+4eTGsDVccWtWc21TbTmqPhkYo9/2
   7TGIC5xmZszsLNGheKQZpgNQpw+liSfcv7bTHJULaV/3vDhMuGcurVwy6
   shw4tSj7wnC2Izs4C9CBm6KoiJ5af35qxbLiyXdGxgbeyPNEheNOiKz+T
   Q==;
X-CSE-ConnectionGUID: KN8opcgHRJiLWKfyMuVkfA==
X-CSE-MsgGUID: yQaUNVoOT9mGe8uB65CwUA==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="69013577"
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="69013577"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2025 13:25:16 -0800
X-CSE-ConnectionGUID: eFFaSrJVQaqWXIHdTyItDA==
X-CSE-MsgGUID: QyAsmmoqQ8mLebhZ28IcSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,303,1754982000"; 
   d="scan'208";a="189613459"
Received: from igk-lkp-server01.igk.intel.com (HELO 230842de89ac) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2025 13:25:16 -0800
Received: from kbuild by 230842de89ac with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vJeob-0000000018O-2H0v
	for oe-kbuild@lists.linux.dev;
	Thu, 13 Nov 2025 21:25:13 +0000
Date: Thu, 13 Nov 2025 22:25:07 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcachefs:bcachefs-testing 23/867] checkpatch:
 ERROR:TRAILING_WHITESPACE: trailing whitespace
Message-ID: <202511131834.6gDPsl1m-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Alan Huang <mmpgouride@gmail.com>

tree:   https://evilpiepirate.org/git/bcachefs.git bcachefs-testing
head:   d6f7060a241d49e7821348ad12081f19d3581b92
commit: 42966b100de9467eda997003464e0492e54d75f1 [23/867] bcachefs: Refactor trans->mem allocation
:::::: branch date: 75 minutes ago
:::::: commit date: 3 weeks ago
reproduce: (https://download.01.org/0day-ci/archive/20251113/202511131834.6gDPsl1m-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511131834.6gDPsl1m-lkp@intel.com/

# many are suggestions rather than must-fix

ERROR:TRAILING_WHITESPACE: trailing whitespace
#24: FILE: fs/bcachefs/btree_iter.c:3247:
+^I$

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
