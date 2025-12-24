Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B0E273F9
	for <oe-kbuild@lists.linux.dev>; Wed, 24 Dec 2025 02:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766542013; cv=none; b=qCePOuODi85QeWIfDW/ey3U6NzybOgNoNvnNK7CYlkuF85POE7ea4spNLHYEDIzUJOf6dg0ZMR8uXVizhefZlm4TXlZBlws2/N4xJrP9RuuUHKCC84imAlGfsu+cmIFVwgoY62aiLKlXoZV+qVEjEzDCBa3Zxpm8Ij4m+B7vxkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766542013; c=relaxed/simple;
	bh=ycByFTLR0aBWndXpJQfTbINMq8mPT+MRsw3FHYFaBOw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jhrZBGRGn0pkTofiZIOZYsadu86PdMH8edWsxIUCjXCH8oKxWMsVR22HxQdgHtFVdBkFNxeMHo6thhHVOfo/eGlQiO1rsitn/hIhX1gJju/JrmIoVdZgiGpwsvXn8EuJJhWO/qocyf3Fa1d+n08m2SqVK5PnV3wd/YtXqXTOR1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BMlLMaYO; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BMlLMaYO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766542009; x=1798078009;
  h=date:from:to:subject:message-id:mime-version;
  bh=ycByFTLR0aBWndXpJQfTbINMq8mPT+MRsw3FHYFaBOw=;
  b=BMlLMaYOnaCqzHbSwMedTZmWbZYZtjYTGMxYhC0DCrYknOzaUOZhQxvj
   Hv92u2htvLtOjlpypf7jv43YbbhpbpDNQiYD+Z4NfyniPuh11k91hZN1T
   Mj47D+VdLrIyCKRoJhDSBiSAgoy5AlEMzelRSKxPKRyUPZ6JMJZBNVu4c
   HtOo6wIAmMt0c9Ie2qHWiSVh/ZyshWrUoZyoCMm6J0iPyQYNiU0jaGOes
   5kmkExQ8NvqXWq3cZeXxEMjeKyJB7yFB5Dkqugo27AoyruvLFeKVj5tjC
   KxufXb9viielCG3X9IQNT4RKXfwjby572QocEhjy4Lg6pNBf/QI6GehwX
   w==;
X-CSE-ConnectionGUID: SQ4WEaZoRSytnflqqICleg==
X-CSE-MsgGUID: 8/aU1ZETQ9OWoAHPJRVjzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11651"; a="79504136"
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="79504136"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2025 18:06:48 -0800
X-CSE-ConnectionGUID: jCjwOARPRnGOeS0p2F/Btw==
X-CSE-MsgGUID: B8SR2yoFRHqfOaQP5Anc8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,172,1763452800"; 
   d="scan'208";a="199152717"
Received: from igk-lkp-server01.igk.intel.com (HELO 8a0c053bdd2a) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 23 Dec 2025 18:06:48 -0800
Received: from kbuild by 8a0c053bdd2a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYEGz-00000000652-149m
	for oe-kbuild@lists.linux.dev;
	Wed, 24 Dec 2025 02:06:45 +0000
Date: Wed, 24 Dec 2025 03:06:06 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH 2/2] ecryptfs: Release lower parent dentry after creating
 dir
Message-ID: <202512240340.7U4QtX49-lkp@intel.com>
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
In-Reply-To: <20251223194153.2818445-3-code@tyhicks.com>
References: <20251223194153.2818445-3-code@tyhicks.com>
TO: Tyler Hicks <code@tyhicks.com>
TO: NeilBrown <neil@brown.name>
TO: Christian Brauner <brauner@kernel.org>
TO: Jeff Layton <jlayton@kernel.org>
TO: Amir Goldstein <amir73il@gmail.com>

Hi Tyler,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 9448598b22c50c8a5bb77a9103e2d49f134c9578]

url:    https://github.com/intel-lab-lkp/linux/commits/Tyler-Hicks/ecryptfs-Fix-improper-mknod-pairing-of-start_creating-end_removing/20251224-034355
base:   9448598b22c50c8a5bb77a9103e2d49f134c9578
patch link:    https://lore.kernel.org/r/20251223194153.2818445-3-code%40tyhicks.com
patch subject: [PATCH 2/2] ecryptfs: Release lower parent dentry after creating dir
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251224/202512240340.7U4QtX49-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'Bochs'
#23: 
Hardware name: Bochs Bochs, BIOS Bochs 01/01/2011

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
