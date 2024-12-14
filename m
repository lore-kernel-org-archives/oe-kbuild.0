Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FC363C
	for <oe-kbuild@lists.linux.dev>; Sat, 14 Dec 2024 08:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734163788; cv=none; b=YmCUeEZqF6hnezq+Y+JGDY2ebzs/cshRA8Zk9Sx0qMCmtITLeIlq16mDEPVVzOrCTMyeXr3yy586svad48nLftijik1aB93uTePmAmDTJV6IDeTD2+MAomb1vcn9jmFHHCQ6Zt76OZlVn/CE14MiPmUkn4/elIQnjIfCwRLubYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734163788; c=relaxed/simple;
	bh=bqifVfYGUuHIcS6zVo54lPwDskraYzTmc07pTuWd/oU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aY3Iq1SizBDPrp0OkLtgiEDuhvoiGRlHIIazH4AlVE0/IqLZU++DATma+LDnZzGvwD/gbF8ODM6s9ztE6KyerVFKsrJGrt0hRVjILqUwjTJ2CG7Agk/oKIGAK3nnGs48qZuXaqUGt3xZYhrOhefzEhXIqEqxWZ8ryeZijr+49go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ab0Ge8IF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ab0Ge8IF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734163786; x=1765699786;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bqifVfYGUuHIcS6zVo54lPwDskraYzTmc07pTuWd/oU=;
  b=Ab0Ge8IFFEOcH4pGXGgNjweW9CMLLOucaCQ8E+N7e6sD2j8SFa+O0Xrv
   S/zwvPj38X4aA0oy9wBpORA2SyYUJShvH5zL8KzXIfaks/v5L4iKkbD+B
   ihH9RQ6msOvfWD7FwzSdCTBSBEHDcY/QDY7uRl879v/6uXVgpIeap7vUD
   6PSI7DOufLOKSZ8TLvV9RQPjGEZpMKCvVry47wOGbKnoZb/JV8mrQ5EfT
   Bf7hlD1YGJ1EHGHbOHERHPO0Ck/3WlHuFtMHU67E1zuKw0D7PcVM+tIEW
   r3bC9zfcmyjZDNczu4snW039OIpw+2yvXTgEI4qLs9bAKvoprgGbkPBtp
   g==;
X-CSE-ConnectionGUID: TalzESNRSbuCMHQTlswhsw==
X-CSE-MsgGUID: VvOptsFZRAu+tefMfGEV2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="57099020"
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="57099020"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2024 00:09:46 -0800
X-CSE-ConnectionGUID: eTNX3kMBRQSXOJU/Vj2I/g==
X-CSE-MsgGUID: mQ4KscMUSzqCERz6mgPC3w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,233,1728975600"; 
   d="scan'208";a="97148228"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 14 Dec 2024 00:09:45 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tMNDa-000Cn5-17;
	Sat, 14 Dec 2024 08:09:42 +0000
Date: Sat, 14 Dec 2024 16:09:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: sound/core/seq/oss/seq_oss_init.c:460:8-9: opportunity for
 str_enabled_disabled(b)
Message-ID: <202412141616.DskzmrpJ-lkp@intel.com>
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
TO: Arnd Bergmann <arnd@arndb.de>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   a446e965a188ee8f745859e63ce046fe98577d45
commit: ff16cbc4dc3494d02e625c76342bcdea54cfb9a4 ALSA: avoid 'bool' as variable name
date:   10 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 10 months ago
config: um-randconfig-r053-20241214 (https://download.01.org/0day-ci/archive/20241214/202412141616.DskzmrpJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412141616.DskzmrpJ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> sound/core/seq/oss/seq_oss_init.c:460:8-9: opportunity for str_enabled_disabled(b)

vim +460 sound/core/seq/oss/seq_oss_init.c

^1da177e4c3f415 Linus Torvalds 2005-04-16  452  
cd6a65036f0eac4 Jie Yang       2015-05-27  453  #ifdef CONFIG_SND_PROC_FS
^1da177e4c3f415 Linus Torvalds 2005-04-16  454  /*
^1da177e4c3f415 Linus Torvalds 2005-04-16  455   * misc. functions for proc interface
^1da177e4c3f415 Linus Torvalds 2005-04-16  456   */
^1da177e4c3f415 Linus Torvalds 2005-04-16  457  char *
ff16cbc4dc3494d Arnd Bergmann  2024-02-16  458  enabled_str(bool b)
^1da177e4c3f415 Linus Torvalds 2005-04-16  459  {
ff16cbc4dc3494d Arnd Bergmann  2024-02-16 @460  	return b ? "enabled" : "disabled";
^1da177e4c3f415 Linus Torvalds 2005-04-16  461  }
^1da177e4c3f415 Linus Torvalds 2005-04-16  462  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
