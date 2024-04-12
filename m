Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 001055914E
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Apr 2024 14:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712931206; cv=none; b=bt3Ordv/EJ3Ib3zawn9BMBLpkH7oAaIfE3hzplUMu+y+kAfjmfwR79iHaR/vpPDArJODBelU+T5PzGKR8hUMOtPmJxSGmf7AlIZW2ofth3PcGq+aY/VPJAZepleVXpsuzaa3xDuNOB0Zlxmx8Wq5qodBb2y/a+Z7r2qeI5c3KoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712931206; c=relaxed/simple;
	bh=8b2cpg6FrQbWckMatnS4h7pHUe+nF97igWh2VH91Joo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mTQyOyrwJ2orqFA7zNyhI0iMMrthNum2vM693L5rI3t7DZ2ykf36dLlTPR6BRLPjGDInt3xCLQFf2agcef4Wc1L4t98csXj2TH800kPgzGjaxV9ApTT8uPQeySFLjOaqWnaVvvTNyqMRpMHYMcKrI+GHEnQmZZ/AGMZcJqDAlSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CqBHbGvf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CqBHbGvf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712931206; x=1744467206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8b2cpg6FrQbWckMatnS4h7pHUe+nF97igWh2VH91Joo=;
  b=CqBHbGvfKYRV/PIE3cm0ndJ7vIp/yMIhLvjUaLXwAzHqyfRRY9djBeiy
   zT3M5859TviD1qt7zJgEZVF0XypMkEneQCPycakSxwEmZ5GFmvIewDdBv
   lzsAvLMgESM6AS728o6GQmGzEu4VQFI1+kYFmI3bE4SCf30/oUFIt0HOG
   Lp+nJeSdF8TJdSyGnd3YnHLlo4+HpcBq0n219HsY22g2S7uPfVGno3VLq
   JMcPxtw8YHo2/pEB7C982U5vTq9/v10uch6PkWAqvt7BtC+sCWNYLI1v6
   Wyb2VLkr54D4Kbzk+G9fmu1m513B1P77orQyftw3C4blqIfF83ZH4yLRr
   Q==;
X-CSE-ConnectionGUID: ZbzqkAF/SAe1PlmVr98/+A==
X-CSE-MsgGUID: n2lOvP0GRhqbDXvBoa8BgQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11042"; a="8232938"
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="8232938"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2024 07:13:25 -0700
X-CSE-ConnectionGUID: YAkHv8ItQW+gddF35T87eA==
X-CSE-MsgGUID: As3gudq/T3+XTtGt2UWIDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,196,1708416000"; 
   d="scan'208";a="25792595"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 12 Apr 2024 07:13:23 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rvHeb-0009pM-05;
	Fri, 12 Apr 2024 14:13:21 +0000
Date: Fri, 12 Apr 2024 22:12:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/core/pcm_compat.c:21 snd_pcm_ioctl_delay_compat() error:
 uninitialized symbol 'delay'.
Message-ID: <202404122246.YyggY6YI-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   586b5dfb51b962c1b6c06495715e4c4f76a7fc5a
commit: 650224fe8d5f6dbe6cc5875d14bf80da60dd56f8 ALSA: pcm: Use guard() for PCM stream locks
date:   6 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 6 weeks ago
config: x86_64-randconfig-161-20240412 (https://download.01.org/0day-ci/archive/20240412/202404122246.YyggY6YI-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404122246.YyggY6YI-lkp@intel.com/

smatch warnings:
sound/core/pcm_compat.c:21 snd_pcm_ioctl_delay_compat() error: uninitialized symbol 'delay'.

vim +/delay +21 sound/core/pcm_compat.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  11  
877211f5e1b119 Takashi Iwai   2005-11-17  12  static int snd_pcm_ioctl_delay_compat(struct snd_pcm_substream *substream,
^1da177e4c3f41 Linus Torvalds 2005-04-16  13  				      s32 __user *src)
^1da177e4c3f41 Linus Torvalds 2005-04-16  14  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  15  	snd_pcm_sframes_t delay;
912e4c332037e7 Jeffery Miller 2018-04-20  16  	int err;
^1da177e4c3f41 Linus Torvalds 2005-04-16  17  
912e4c332037e7 Jeffery Miller 2018-04-20  18  	err = snd_pcm_delay(substream, &delay);
912e4c332037e7 Jeffery Miller 2018-04-20  19  	if (err)
912e4c332037e7 Jeffery Miller 2018-04-20  20  		return err;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @21  	if (put_user(delay, src))
^1da177e4c3f41 Linus Torvalds 2005-04-16  22  		return -EFAULT;
c2c86a97175f55 Takashi Iwai   2017-05-10  23  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  24  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  25  

:::::: The code at line 21 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
