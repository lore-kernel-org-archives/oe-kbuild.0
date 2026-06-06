Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CD1A2F7F13
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Jun 2026 05:01:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780722093; cv=none; b=gpSlam/EbEtxPMlQSbL3hRZVrNif6+VVOaUVQKgWsFDUApwMx2xJBXothpKQuS5k5ZSoSJiiOXX7l98BzNgskacVbYhVQKWHMUTR0xz3UUxqDMVO/aMNc87SuRUgd+WEUnQnUUBug/bjHPniopCczMN04KQzLlrhDPzPJt+3OlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780722093; c=relaxed/simple;
	bh=aXFudlWCMovj5cMOcXc8ccTYwA8Vz3ohWcG4bSn7ywE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eVYB+Xcv53Vky0LvUBl3g5LNJHWYsZLxjZtPrrqrqk7Is2OMg8ifVUDrStwXyU9Se20EvdaWGpBbIQJIfzRQztc2Ol437agXD4c5MM0j4PZyAWH3EbQvuSQ2prxOvQGkeIWSIE38iMWuROrAYF1rw1XgrQxYxZ6LMdBznHUskTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PnAvwmDh; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PnAvwmDh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780722089; x=1812258089;
  h=date:from:to:cc:subject:message-id;
  bh=aXFudlWCMovj5cMOcXc8ccTYwA8Vz3ohWcG4bSn7ywE=;
  b=PnAvwmDhGql0JBa8LZasO6rwm31MYdPMWdgdwlZscT4mk4R0+0LRER7V
   0t8f1qqRfDyxL/TUZEpzJ5QGDIunO9ySRvHtckAbQlzQUwcPgImadV20m
   EtMrX+1wc74/OiiFqGCx5ffK1u4fawr1xJCwk/gFeblkeaQkRLFbWd+Xa
   u93ZJRbsFzyzwBglojI2FAs55qh5TCBKroFgr3UPul9iIrm388A3KM1Ak
   dbTC1EjBKMp8fWtI3B1NmXT8xAclijIBPiZ0Uxovr5PYxfZsua1l5eecK
   KelyRjnLdjs1gq9bCL7pUVAw/r5L0bFgLktELSQbeuMBujz91pk4qE4LR
   A==;
X-CSE-ConnectionGUID: IzD5+QdqTWmY45pJHtgv3Q==
X-CSE-MsgGUID: P+IHH5MVS3C38lgnVhJehg==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="91864518"
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="91864518"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 22:01:28 -0700
X-CSE-ConnectionGUID: zy89agtBT2eIZ8PbXuoHCA==
X-CSE-MsgGUID: JQWhU3DXROS0g19/zTUfMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,190,1774335600"; 
   d="scan'208";a="240565685"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 05 Jun 2026 22:01:26 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVj9w-00000000Gkk-0i0d;
	Sat, 06 Jun 2026 05:01:24 +0000
Date: Sat, 06 Jun 2026 13:00:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [sailus-media-tree:partial-reg 5/9]
 drivers/media/v4l2-core/v4l2-event.c:81:38-39: WARNING this kind of
 initialization is deprecated
Message-ID: <202606061203.fuAY215y-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-media@vger.kernel.org
TO: Sakari Ailus <sakari.ailus@linux.intel.com>

tree:   git://linuxtv.org/sailus/media_tree.git partial-reg
head:   b7d01dab7d47849d483b459ff2abf50497b52149
commit: 0258a2c8b5c7b9a6a0adce2059f2ecd12046776d [5/9] v4l: event: Split the event framework into generic and V4L2 bits
:::::: branch date: 32 hours ago
:::::: commit date: 32 hours ago
config: csky-randconfig-r062-20260606 (https://download.01.org/0day-ci/archive/20260606/202606061203.fuAY215y-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606061203.fuAY215y-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/media/v4l2-core/v4l2-event.c:81:38-39: WARNING this kind of initialization is deprecated

vim +81 drivers/media/v4l2-core/v4l2-event.c

0258a2c8b5c7b9a Sakari Ailus 2019-02-15  77  
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  78  static bool v4l2_evop_is_subscribed(struct media_subscribed_evbase *mse,
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  79  				    const void *__evspec)
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  80  {
0258a2c8b5c7b9a Sakari Ailus 2019-02-15 @81  	const struct v4l2_event_spec *evspec = evspec;
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  82  	struct v4l2_subscribed_event *sev = to_v4l2_subscribed_event(mse);
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  83  
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  84  	return sev->evspec.type == evspec->type &&
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  85  		sev->evspec.id == evspec->id;
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  86  }
0258a2c8b5c7b9a Sakari Ailus 2019-02-15  87  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
