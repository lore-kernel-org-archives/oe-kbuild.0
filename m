Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B07F12989B5
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Dec 2025 08:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765527343; cv=none; b=GfePoE58E+8vuJWGIS4Ac29wVdmA8I2jzRDat69tCBMfOxeoAX04ebUROeLOaOmH7YbmThkvVLRhAlSNIwF7yUSnCz27t3E6gJ900S6MvrgW3XfRp5lsuHYE4yLxRL7RhJCbQIvmLxp2XSjKzGzS3CnDO7dY737C1PddW4hm8FI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765527343; c=relaxed/simple;
	bh=KEjpPckV+GyBXGdZ76di0/5TJzP59gy08UuT5TMLSuY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mmVlq4kgZQjRuFZKujvRbLknXsFYViGa5V64Ris1TEUwIGvXQFfKIQZqeRbgYHvDOBKJMMqAmVd+NTsWT6/bBUjx9pg7RdnHzzMEr/bQ9ebnFYZzrnneYNQ62jkoi+PvvL7MTm6h+iRtheaYZwRyk5VSnlcjR6L9bP5AASimT9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FOtc/LE+; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FOtc/LE+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765527340; x=1797063340;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KEjpPckV+GyBXGdZ76di0/5TJzP59gy08UuT5TMLSuY=;
  b=FOtc/LE+oV421fdedSiz96hokA865RvMZ84qIv7W3USRCoQEZL2pR5mx
   olk7iDceDId1aQQAu+K2g+gQL0yrSZYqsR4UFzaNuYtk/jPfWXPV5bwvr
   SnNrQ7hz8O+vyR7jWzxTSmwZBP4zAbQ81RtmOMxHdsJ/wRxERnc0WXPUu
   x6nNmcl3Sqr4nwUeePt7XFfAUrAPe0R7eAuyX2PiQx55L1CwXm8n9jyqd
   Ft1cYMgRZ/zxcMkdb9PVKfFbgjpwz/my9KExRNO4kefHzzYlnx3nMhx2c
   1ISEGkXQjtbytlAgDMMxcZA0FtYMuiaqASVZgnW5vdh6I58cKiWEL//sG
   g==;
X-CSE-ConnectionGUID: rGkFTRnVSOyPBcK9cwTS1w==
X-CSE-MsgGUID: qS5hCCA8TauNUPn99BAYsQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="71360372"
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="71360372"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 00:15:39 -0800
X-CSE-ConnectionGUID: G3RMhIxXSoOXL3rq566qmA==
X-CSE-MsgGUID: GdG+YmRBStOB0LxJc2nPEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,143,1763452800"; 
   d="scan'208";a="197074282"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 12 Dec 2025 00:15:38 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTyJL-000000005mH-3fxA;
	Fri, 12 Dec 2025 08:15:35 +0000
Date: Fri, 12 Dec 2025 16:15:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/hda/core/sysfs.c:350 add_widget_node() warn: Calling
 kobject_put|get with state->initialized unset from line: 342
Message-ID: <202512121644.aBRlTOqg-lkp@intel.com>
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
head:   d358e5254674b70f34c847715ca509e46eb81e6f
commit: b2660d1ebde1ba8f3edf963f3aac2bea884457c3 ALSA: hda: Move HD-audio core stuff into sound/hda/core
date:   5 months ago
:::::: branch date: 29 hours ago
:::::: commit date: 5 months ago
config: alpha-randconfig-r072-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121644.aBRlTOqg-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512121644.aBRlTOqg-lkp@intel.com/

New smatch warnings:
sound/hda/core/sysfs.c:350 add_widget_node() warn: Calling kobject_put|get with state->initialized unset from line: 342

Old smatch warnings:
sound/hda/core/sysfs.c:355 add_widget_node() warn: Calling kobject_put|get with state->initialized unset from line: 342

vim +350 sound/hda/core/sysfs.c

3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  337  
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  338  static int add_widget_node(struct kobject *parent, hda_nid_t nid,
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  339  			   const struct attribute_group *group,
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  340  			   struct kobject **res)
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  341  {
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  342  	struct kobject *kobj = kzalloc(sizeof(*kobj), GFP_KERNEL);
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  343  	int err;
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  344  
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  345  	if (!kobj)
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  346  		return -ENOMEM;
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  347  	kobject_init(kobj, &widget_ktype);
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  348  	err = kobject_add(kobj, parent, "%02x", nid);
9a5523f72bd2b0 sound/hda/hdac_sysfs.c Ye Bin       2022-11-10  349  	if (err < 0) {
9a5523f72bd2b0 sound/hda/hdac_sysfs.c Ye Bin       2022-11-10 @350  		kobject_put(kobj);
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  351  		return err;
9a5523f72bd2b0 sound/hda/hdac_sysfs.c Ye Bin       2022-11-10  352  	}
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  353  	err = sysfs_create_group(kobj, group);
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  354  	if (err < 0) {
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  355  		kobject_put(kobj);
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  356  		return err;
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  357  	}
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  358  
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  359  	*res = kobj;
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  360  	return 0;
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  361  }
3256be6537751f sound/hda/hdac_sysfs.c Takashi Iwai 2015-02-24  362  

:::::: The code at line 350 was first introduced by commit
:::::: 9a5523f72bd2b0d66eef3d58810c6eb7b5ffc143 ALSA: hda: fix potential memleak in 'add_widget_node'

:::::: TO: Ye Bin <yebin10@huawei.com>
:::::: CC: Takashi Iwai <tiwai@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
