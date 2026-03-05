Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE5822701DC
	for <oe-kbuild@lists.linux.dev>; Thu,  5 Mar 2026 03:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772679760; cv=none; b=I/VBYyuUWSbeycR8HHTaLRhvHeiUg1g0z0KtgrX+ccokG3nQWt3Gdknmj4+2IoGjxKbbkw9iGTPZZsu/y8AU9FnWs7oHKu070SSz76kzn2/XZNREjbm4mzbMCPyNcH8KIiVVQZ1fJnb+9RE0hBtAu8dmeT48Ad7DccmRGfyL1tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772679760; c=relaxed/simple;
	bh=SmIBR48nDhatgM+W+Hg3+PkX01e1fq2HJvn/kmWWkC0=;
	h=Date:From:To:Subject:Message-ID; b=rK5YBkPKWz5ZGuwGIpDjG2i1lIbC5Fll3iICuMVwZBufrqQPhxthO8aMqpRRS+sFtMoBbFB5aPRtrXCpiqS+IJDlHncg40EQw+/fggVB/iHuHKP4+jChzhOYIFA1ON9eVBu7clJ+hP/D1U961EBwEz/n3Z/GuvgWQnNW688DKgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JEUpNRaJ; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JEUpNRaJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772679759; x=1804215759;
  h=date:from:to:subject:message-id;
  bh=SmIBR48nDhatgM+W+Hg3+PkX01e1fq2HJvn/kmWWkC0=;
  b=JEUpNRaJnbWZ5+Pst8jBWXAWT1SL1PIlWvZYpIEX0j9BJR1WfO90SNI3
   ZKSOHhRbISfMlXiiFjc4jL5QzWzwq7lbQ9aYwYu+LiHZ8Lqv2ezjL5Boa
   c3v7slg4FKtW67+GtZdnPL0XjjIOFOoP3EU9yj8bfijL0QapV1b0KvE4K
   iWA2VKNqPzZGIWVdWTN1bRC2TqJcY4HUGgF8CvokqkC5olEATrjMkVfdP
   AgMeQK1TIoRvQQWHdK3enZVBpPO79eeAN4ZVWNh0KjWHdySepAHEo7KFE
   yyna+KhEHgbq9FqRq+64FZQN0WrQiBZM4MGySOqGEzqqi6Ea7kwJvIkJD
   Q==;
X-CSE-ConnectionGUID: Bwe5RadtQuCz+dYpGP0xDQ==
X-CSE-MsgGUID: ADQmn42eR0O5SFdQ2SIbrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73945572"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73945572"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 19:02:37 -0800
X-CSE-ConnectionGUID: 3NuxaaNiQyKMG1Xac48EZA==
X-CSE-MsgGUID: ujXoTOgHSUOlo/FVGEqSDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="216826712"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 04 Mar 2026 19:02:36 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxyyw-000000001qJ-154w
	for oe-kbuild@lists.linux.dev;
	Thu, 05 Mar 2026 03:02:34 +0000
Date: Thu, 05 Mar 2026 04:01:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 288/467] checkpatch: WARNING:ONE_SEMICOLON:
 Statements terminations use 1 semicolon
Message-ID: <202603050334.TP7RLRxZ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   fbd53fdafbefc56ceb47b7f9828fd34cdc6ac01a
commit: 525751b3d74f852ef19044532b6699b677ccd3b1 [288/467] drivers/net/wireless/mediatek: convert to read/write iterators
:::::: branch date: 53 minutes ago
:::::: commit date: 2 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260305/202603050334.TP7RLRxZ-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#49: FILE: drivers/net/wireless/mediatek/mt76/mt7615/debugfs.c:474:
+	struct mt7615_dev *dev = iocb->ki_filp->private_data;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
