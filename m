Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 740CD3BA246
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Sep 2026 01:20:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789780828; cv=none; b=hBZyUf90PaaSgF19In2W2+EDecPjTAuJFWMi9aHu2NYLIrElIsQIV7pgLiwPse7ao8/woyDDz0Cue2wx4ZHh7PnfqynV3Z4u/M0Z7Z4bPWKzTocitxk3rYzYmsbxWprBVnbb0ysJEgDnrnKD5iexWMWmOVCuLhfu39yt18BFQ74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789780828; c=relaxed/simple;
	bh=nf9dl5gGOF3Jo2heniw5OtIiK9NpnW+9s/HSauPh3g4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KYLRZNM5MJxYwWhA7D4Oz3xCOc5PAiDJqAQ7fsE4dD/5QGcPdCOuj0g2wTGQuG8z29Fxk7YyR/2wmnQsl25N4njWzibMcQh1soyQ8JYCDiMS7SMQzQ7oxfkVoCgobbx1iVB/jSjG93y5d9H8t24tERGTVqBc1Y7f18SswJkIs9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LiWA1LX3; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiWA1LX3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789780819; x=1821316819;
  h=date:from:to:cc:subject:message-id;
  bh=nf9dl5gGOF3Jo2heniw5OtIiK9NpnW+9s/HSauPh3g4=;
  b=LiWA1LX3BdpEwumkC1Z+IceuIEXPv474xzEt1+qGe2TdzuOhG1UfN6/o
   vyrzjyZE17cnMULarSDAP9AJEVuvPct5cc6/XZ+oha+X9kd7cOf3pUkNn
   tXxqYfZat5+9AkP/RWTMqmYNvDJ26TYrsy65ALd4KKP6OBgbFZxibtdh+
   olvM3AfygBT19FKSwS6eFji6MnV9nvKsH3O1Baf5flspzYOMhdu3Ja+RU
   GtloQ7aAX8Yv+lMKn/3nyDK4FsIyTkwtj1fogniwzgtEOWy9ro0/LVSiz
   qKBD3Ev26Dq3kJ7RRKkGB2cat5UcgPrLO5bsSS7pVa2QmXmMFqBS4V7YO
   Q==;
X-CSE-ConnectionGUID: s3QmeG+eS0+8H1iJaTYj+w==
X-CSE-MsgGUID: NNh6FEZ6TTulkyHwzTU62Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100917821"
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="100917821"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Sep 2026 18:20:12 -0700
X-CSE-ConnectionGUID: fU5JGO/cRbaTm5YVUBycHw==
X-CSE-MsgGUID: gzUUqOEwQ6iYQoSocdEh4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,109,1787036400"; 
   d="scan'208";a="3125826"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 18 Sep 2026 18:20:12 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7jkL-000000001HU-2IoW;
	Sat, 19 Sep 2026 01:20:05 +0000
Date: Sat, 19 Sep 2026 03:19:09 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/f2fs/checkpoint.o: warning: objtool:
 __f2fs_add_ino_entry+0x128: unreachable instruction
Message-ID: <202609190321.5EPyWPMG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chao Yu <chao@kernel.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   17e7b8eacf4cac800a4fc89a28729df72a2dabda
commit: 9a9ee7408a1f8271bd1978baff2dd09457054ef4 f2fs: reduce memory footprint of ino management
date:   4 weeks ago
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago
config: loongarch-randconfig-r063-20260914 (https://download.01.org/0day-ci/archive/20260919/202609190321.5EPyWPMG-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260919/202609190321.5EPyWPMG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9a9ee7408a1f ("f2fs: reduce memory footprint of ino management")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609190321.5EPyWPMG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/checkpoint.o: warning: objtool: __add_ino_entry+0x10c: unreachable instruction
>> fs/f2fs/checkpoint.o: warning: objtool: __f2fs_add_ino_entry+0x128: unreachable instruction
   fs/f2fs/checkpoint.o: warning: objtool: commit_checkpoint+0xb4: unreachable instruction
   fs/f2fs/checkpoint.o: warning: objtool: f2fs_ra_meta_pages+0x22c: unreachable instruction
   fs/f2fs/checkpoint.o: warning: objtool: do_checkpoint+0x81c: unreachable instruction
   fs/f2fs/checkpoint.o: warning: objtool: f2fs_write_checkpoint+0x304: unreachable instruction

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
