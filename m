Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697253;
	b=mpgMwMlyJPBonoNtfjy7640h6i9uA5KL4N205eXaJldIIj5CN7TS7qUcx0O6PPffJMYL
	 WZksR9wKq1BSG60GfXeSyD4srmlZ2hOm5J/MyzvR2hZ1B5gVsG9jQ1paPk+DE5du0ws5c
	 e8BJmvppZnbLL3y95DjMwapY1wPkkf0CRgpc8xddI9aIlk9fV6gnM4mi9rdFNZCPIb5rn
	 pWCeOygpUk1sB61uBOq3JF0bwMh57ugQTz16kzoFgVVS4T67louJj70wxpTUnN36oWPs9
	 H0Io5XkRu0LYboaGoq/0ZcZ4t0N39wTyhxd1fT3Ce9uTE5fPIVwqFD64tLt8wu0/pEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697253;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=vTRiYNuAA3/aRJnf62rU+auu2RZLN4Cdfv5QDQfPuag=;
	b=J/oMbC1UCuSF7ZjAqEAnpHnwv5XyML4dgxEWpSxHKNaDN7v+tKKq9Z6UYlJAWKp7Mc8B
	 3Y0Pa+6WSaBRS6P/o+T+8Qnp05rymQWVoZy9NGay8sHginLQk5VwzjYb+hRZCUjauC6Ui
	 xy0LJQN4banKPRUp3ddrUMsWdNphtMO0yiJXBTVVn9jVjArQlaJ9sWTrqe7D4zPaEzysM
	 4x1kwIqDGiqLkn6IW14ObvEig2BCg5txguGjb/PEvdeDA2v0LY+E7qbBegfP+ASjUGyqw
	 cOC+iL8MYtiqpSrfb+XR8uwUI+S4nS4Zz1bBGdyRwqJ1ljqRllAH4K9Zgoij6hw541Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aqQriJZv;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B26606A31C
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Nov 2026 12:47:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25B26606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=aqQriJZv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795697254; x=1827233254;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=j2k1C1aEEfPSrOj9wioRq1mOYT0v9qdNii2N4cxgQVE=;
  b=aqQriJZv6C6lULg/abj3K1m/hGA53HSlmUg+Ielix3+pSuX6Xbvj8koN
   CjLFScwTW1kdXBc2HpWUDxD6gnEmnb6KuqSuWbDSJNBGOt//Ucj2FXYng
   4Epzm4vRJRSumNqTY2dGf6PnbsL9A5IXy045usqjLDZPnBBzT55y6Jx58
   UcsYVTH068VTRn+8ecIw0KgJqN0KWu2Kb2yE1gIe5o0nEhAi4+qJop/O9
   sHnba6cB9mQyLAZRxKUy5xuUuNoK3y32lqP7W/NfinLASa72xdagQSpW7
   VpoNKv0vN6yjUB0pEIvFWClHo3JtzANG3JD4QN+0kDn+sBAbvWjI1/+8d
   w==;
X-CSE-ConnectionGUID: smQc6b81Q4+KmMtOjP8tZA==
X-CSE-MsgGUID: vu/V0CePSR2n5KlV+6sGCA==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4560054"
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="4560054"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2026 04:47:33 -0800
X-CSE-ConnectionGUID: pmY6wgX2SumGtU35AA91kg==
X-CSE-MsgGUID: UuuhU7m4Ty2IHj5mV9mFeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,234,1787036400"; 
   d="scan'208";a="12056228"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 26 Nov 2026 04:47:32 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWYsr-00000001U6w-2GwR;
	Thu, 26 Nov 2026 12:47:29 +0000
Date: Thu, 26 Nov 2026 20:46:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v8 25/27] btrfs: zoned: keep a zone free for relocation
 when allocating data chunks
Message-ID: <20261126203944.vbQsUryT-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "too many reports for this commit"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261125102956.266389-26-johannes.thumshirn@wdc.com>
References: <20261125102956.266389-26-johannes.thumshirn@wdc.com>
TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>
TO: linux-btrfs@vger.kernel.org
CC: Damien Le Moal <dlemoal@kernel.org>
CC: Naohiro Aota <naohiro.aota@wdc.com>
CC: Boris Burkov <boris@bur.io>
CC: Filipe Manana <fdmanana@suse.com>
CC: David Sterba <dsterba@suse.com>
CC: Josef Bacik <josef@toxicpanda.com>
CC: Johannes Thumshirn <johannes.thumshirn@wdc.com>

Hi Johannes,

kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on btrfs/for-next]
[cannot apply to linux-review/Johannes-Thumshirn/btrfs-zoned-don-t-wait-for-a-zone-finish-after-a-filesystem-error/20261117-195824 linus/master v7.4-rc4 next-20261125]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Thumshirn/btrfs-zoned-don-t-wait-for-a-zone-finish-after-a-filesystem-error/20261125-112930
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/20261125102956.266389-26-johannes.thumshirn%40wdc.com
patch subject: [PATCH v8 25/27] btrfs: zoned: keep a zone free for relocation when allocating data chunks
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: powerpc-randconfig-1001-20261126 (https://download.01.org/0day-ci/archive/20261126/20261126203944.vbQsUryT-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261126/20261126203944.vbQsUryT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261126203944.vbQsUryT-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: fs/btrfs/btrfs.ko: symbol '__udivdi3' undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
