Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A0BB494801
	for <oe-kbuild@lists.linux.dev>; Thu,  6 Aug 2026 19:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786045173; cv=none; b=DRthOsZ3B5m2w6Uny4mGzcdYB3x1r+GPB9p02XjHihUvRE6j4OW6yx5lh8qzT1Qzom2j+7ZBtPxrNnGE7cWwGNVrGPv/PBetSlQ62YPsd26r9EeLCZwMT2LQHmw19bMS+ApQYClckCcRp49icIdvwwMMExUt+tAPPskGbpB2bK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786045173; c=relaxed/simple;
	bh=y4O2YIpYUwg440cdCrrFpyF0GrLXVpVzbHprCfyT4VY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=ANaGzXsq6AxkO0jvDDH58cN5zGrxsWELoyKztn3Z3RJ35dJle2kb0kEp5lQnlOgyqWhqfakSX9uhGReXcU1b3H2yYmtS4gHglSIbEcWUtdaBZ/gcG1D31riAtXP44IZHCPsyOSD3gCBIJMudT/9AWueT/Bzq9mkH9P1k+me7RzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AMKC6TmN; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AMKC6TmN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786045172; x=1817581172;
  h=date:from:to:cc:subject:message-id;
  bh=y4O2YIpYUwg440cdCrrFpyF0GrLXVpVzbHprCfyT4VY=;
  b=AMKC6TmNnKQ21cjz1CIS2q1v1XCxjYTxr7fVuT1LfSLvHa4qpYH36vks
   DnLmvqrcW8ADTMignHzN24ClT2M2MmSPBAnAoDherH2ZbcybxozjeQ7xD
   jPiWkfqKNM7KhtqHisSiBhe3WB7/lhwr14eyv8OIeT0zsWSUsY2DsufLc
   g/L8XIu95ht1sH95II+LInkkWeBJPp4WTjeneIPHQcljDoo8cqrXGSlYW
   aDVWU0jRTTDewK2rd2+KZPB7XcY6txjp1ll1xgPZQpimJtpCDOE3RY1ah
   uwr2dqxD5LRqepass8mtVAasEjc15c1x/aFsHz/eUw5/wrLxnUR7ahQ8x
   A==;
X-CSE-ConnectionGUID: PI+mu62ASXmKDD7B99dnQQ==
X-CSE-MsgGUID: f7BMoxEAQ3W0+vkfrCo7Fg==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="86681328"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="86681328"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2026 12:39:14 -0700
X-CSE-ConnectionGUID: 1CWIWjYeQXOjchZ/zrXk2w==
X-CSE-MsgGUID: 74HrTdKISduxi9T699KHWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; 
   d="scan'208";a="266427349"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 06 Aug 2026 12:39:13 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ws3vq-00000000G5I-1lU3;
	Thu, 06 Aug 2026 19:39:10 +0000
Date: Fri, 07 Aug 2026 03:38:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [tiwai-sound:for-next 51/71] sound/core/init.c:1074
 snd_component_add() error: we previously assumed 'card->components' could be
 null (see line 1045)
Message-ID: <202608070323.doCkgrTn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: alsa-devel@alsa-project.org
TO: Maciej Strozek <mstrozek@opensource.cirrus.com>
CC: Takashi Iwai <tiwai@suse.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tiwai/sound.git for-next
head:   3690ef20469d5959378260e2752f2314a2572913
commit: 86cac980c9668106b32ffca3bda106cbb6d7ac2b [51/71] ALSA: control: add ioctl to retrieve full card components
:::::: branch date: 3 hours ago
:::::: commit date: 2 days ago
config: arm64-randconfig-r073-20260806 (https://download.01.org/0day-ci/archive/20260807/202608070323.doCkgrTn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608070323.doCkgrTn-lkp@intel.com/

smatch warnings:
sound/core/init.c:1074 snd_component_add() error: we previously assumed 'card->components' could be null (see line 1045)

vim +1074 sound/core/init.c

e28563cceb9f25 Takashi Iwai   2005-12-01  1025  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1026  /**
^1da177e4c3f41 Linus Torvalds 2005-04-16  1027   *  snd_component_add - add a component string
^1da177e4c3f41 Linus Torvalds 2005-04-16  1028   *  @card: soundcard structure
^1da177e4c3f41 Linus Torvalds 2005-04-16  1029   *  @component: the component id string
^1da177e4c3f41 Linus Torvalds 2005-04-16  1030   *
^1da177e4c3f41 Linus Torvalds 2005-04-16  1031   *  This function adds the component id string to the supported list.
^1da177e4c3f41 Linus Torvalds 2005-04-16  1032   *  The component can be referred from the alsa-lib.
^1da177e4c3f41 Linus Torvalds 2005-04-16  1033   *
eb7c06e8e9c93b Yacine Belkadi 2013-03-11  1034   *  Return: Zero otherwise a negative error code.
^1da177e4c3f41 Linus Torvalds 2005-04-16  1035   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1036  
512bbd6a85230f Takashi Iwai   2005-11-17  1037  int snd_component_add(struct snd_card *card, const char *component)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1038  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1039  	char *ptr;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1040  	int len = strlen(component);
86cac980c96681 Maciej Strozek 2026-07-20  1041  	unsigned int cur_len, need_len;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1042  
86cac980c96681 Maciej Strozek 2026-07-20  1043  	guard(rwsem_write)(&snd_ioctl_rwsem);
86cac980c96681 Maciej Strozek 2026-07-20  1044  
86cac980c96681 Maciej Strozek 2026-07-20 @1045  	if (card->components) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1046  		ptr = strstr(card->components, component);
86cac980c96681 Maciej Strozek 2026-07-20  1047  		if (ptr) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1048  			if (ptr[len] == '\0' || ptr[len] == ' ')	/* already there */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1049  				return 1;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1050  		}
86cac980c96681 Maciej Strozek 2026-07-20  1051  		cur_len = strlen(card->components) + 1;
86cac980c96681 Maciej Strozek 2026-07-20  1052  	} else {
86cac980c96681 Maciej Strozek 2026-07-20  1053  		cur_len = 0;
86cac980c96681 Maciej Strozek 2026-07-20  1054  	}
86cac980c96681 Maciej Strozek 2026-07-20  1055  
86cac980c96681 Maciej Strozek 2026-07-20  1056  	need_len = cur_len + len + 1;
86cac980c96681 Maciej Strozek 2026-07-20  1057  	if (need_len > 512) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1058  		snd_BUG();
^1da177e4c3f41 Linus Torvalds 2005-04-16  1059  		return -ENOMEM;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1060  	}
86cac980c96681 Maciej Strozek 2026-07-20  1061  
86cac980c96681 Maciej Strozek 2026-07-20  1062  	if (need_len > card->components_alloc_size) {
86cac980c96681 Maciej Strozek 2026-07-20  1063  		unsigned int new_alloc = roundup(need_len, 32);
86cac980c96681 Maciej Strozek 2026-07-20  1064  
86cac980c96681 Maciej Strozek 2026-07-20  1065  		ptr = krealloc(card->components, new_alloc, GFP_KERNEL);
86cac980c96681 Maciej Strozek 2026-07-20  1066  		if (!ptr)
86cac980c96681 Maciej Strozek 2026-07-20  1067  			return -ENOMEM;
86cac980c96681 Maciej Strozek 2026-07-20  1068  		if (!card->components)
86cac980c96681 Maciej Strozek 2026-07-20  1069  			ptr[0] = '\0';
86cac980c96681 Maciej Strozek 2026-07-20  1070  		card->components = ptr;
86cac980c96681 Maciej Strozek 2026-07-20  1071  		card->components_alloc_size = new_alloc;
86cac980c96681 Maciej Strozek 2026-07-20  1072  	}
86cac980c96681 Maciej Strozek 2026-07-20  1073  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @1074  	if (card->components[0] != '\0')
^1da177e4c3f41 Linus Torvalds 2005-04-16  1075  		strcat(card->components, " ");
^1da177e4c3f41 Linus Torvalds 2005-04-16  1076  	strcat(card->components, component);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1077  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1078  }
c0d3fb39e9511c Takashi Iwai   2006-04-28  1079  EXPORT_SYMBOL(snd_component_add);
c0d3fb39e9511c Takashi Iwai   2006-04-28  1080  

:::::: The code at line 1074 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
