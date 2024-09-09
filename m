Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 493741791EB
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Sep 2024 22:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725920717; cv=none; b=OV83EGt4+vEf32eQg3b1ixVsbVyogiwcpqbgXz2NKSI0SICvMgPHoU6C4ofQpMNCLXaOe2AuahguHtQOd7emFv5lmctN5FKD78Wg9PCxPZlDmQWsBfYuoO++0gxQa2nFRl49KIETMqJ5h3CZ47Ma2kAi6SR53t41O0yr7So7Y9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725920717; c=relaxed/simple;
	bh=PAiceal86pdM1ka77d925W9krmFBlL6W9q6gI3wsCoU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rPGpIizyiWqsanewTewwuyo838HTekr181B+t4aJCA0B69JgvSj5BBdRwAOQ/dRV8PpFsisi8N0ad6v19XD1b0arOZ5z/MIzGvwvIqfdjLGCd4+ypL6oQeorW1csTG0dIwN48JpkegFKiB4htWtD4yeS9sLZeqv9kNu79E7uXdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CkNWJiUI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CkNWJiUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725920715; x=1757456715;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PAiceal86pdM1ka77d925W9krmFBlL6W9q6gI3wsCoU=;
  b=CkNWJiUIEPUyro5n6O9hJaY0hxH/U3U3BJKDReZqCRGGThA2p+ZucrTT
   yESva6tQ+3NRk17gt3Vd1R9swh4K+Rnox2wA9RiZ2oHbunlDbiyuWr/to
   TIOH9L67nzLpwFASVX2IbCOqXWpZeF3TFGtPRWM8scU9AC1D+JEug1Ed+
   B8EfzDcYG/HvRI48q4+8/IW6Oe3qkmEvDtKsHUHNyvEXrAaq3fe3UNq4r
   hubPS+ugJcmDtzq6ynxg5F2JT1kSOEFJkp/wK/ijVYwvnr1p3tilCxGlj
   DvSeZk/3P0gSXNY0dYNd+7a7WxlHThBJzLwbXQsbZyRxy62lWyakkGjEK
   w==;
X-CSE-ConnectionGUID: nrDYhSigRxiOTJlvwHt7yw==
X-CSE-MsgGUID: MejvAZjpTbqPCMRHy4pRUA==
X-IronPort-AV: E=McAfee;i="6700,10204,11190"; a="24188322"
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="24188322"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2024 15:25:14 -0700
X-CSE-ConnectionGUID: VXPpP43vR8OsecvzsqVEzQ==
X-CSE-MsgGUID: YCf52cbAQrSJzSPAr2aTxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,215,1719903600"; 
   d="scan'208";a="67350951"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Sep 2024 15:25:13 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1snmop-000FHy-0W;
	Mon, 09 Sep 2024 22:25:11 +0000
Date: Tue, 10 Sep 2024 06:24:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/xe/xe_guc_relay.c:598 relay_handle_failure() warn:
 passing zero to 'ERR_PTR'
Message-ID: <202409100612.QZ22msy5-lkp@intel.com>
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
TO: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Matt Roper <matthew.d.roper@intel.com>

Hi Lucas,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   bc83b4d1f08695e85e85d36f7b803da58010161d
commit: 237412e45390805e14a6936fb998d756c4eac9d8 drm/xe: Enable 32bits build
date:   7 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 7 months ago
config: microblaze-randconfig-r073-20240909 (https://download.01.org/0day-ci/archive/20240910/202409100612.QZ22msy5-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409100612.QZ22msy5-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_guc_relay.c:598 relay_handle_failure() warn: passing zero to 'ERR_PTR'

vim +/ERR_PTR +598 drivers/gpu/drm/xe/xe_guc_relay.c

811fe9f556fcb2 Michal Wajdeczko 2024-01-04  590  
811fe9f556fcb2 Michal Wajdeczko 2024-01-04  591  static int relay_handle_failure(struct xe_guc_relay *relay, u32 origin,
811fe9f556fcb2 Michal Wajdeczko 2024-01-04  592  				u32 rid, const u32 *msg, u32 len)
811fe9f556fcb2 Michal Wajdeczko 2024-01-04  593  {
811fe9f556fcb2 Michal Wajdeczko 2024-01-04  594  	int error = FIELD_GET(GUC_HXG_FAILURE_MSG_0_ERROR, msg[0]);
811fe9f556fcb2 Michal Wajdeczko 2024-01-04  595  	u32 hint __maybe_unused = FIELD_GET(GUC_HXG_FAILURE_MSG_0_HINT, msg[0]);
811fe9f556fcb2 Michal Wajdeczko 2024-01-04  596  
811fe9f556fcb2 Michal Wajdeczko 2024-01-04  597  	relay_assert(relay, len);
811fe9f556fcb2 Michal Wajdeczko 2024-01-04 @598  	relay_debug(relay, "%u.%u error %#x (%pe) hint %u debug %*ph\n",
811fe9f556fcb2 Michal Wajdeczko 2024-01-04  599  		    origin, rid, error, ERR_PTR(-error), hint, 4 * (len - 1), msg + 1);
811fe9f556fcb2 Michal Wajdeczko 2024-01-04  600  
811fe9f556fcb2 Michal Wajdeczko 2024-01-04  601  	return relay_handle_reply(relay, origin, rid, error ?: -EREMOTEIO, NULL, 0);
811fe9f556fcb2 Michal Wajdeczko 2024-01-04  602  }
811fe9f556fcb2 Michal Wajdeczko 2024-01-04  603  

:::::: The code at line 598 was first introduced by commit
:::::: 811fe9f556fcb281ea2db1b0fff3bab20f0a4d42 drm/xe/guc: Introduce Relay Communication for SR-IOV

:::::: TO: Michal Wajdeczko <michal.wajdeczko@intel.com>
:::::: CC: Michal Wajdeczko <michal.wajdeczko@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
