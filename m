Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA8D3EBF3E
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Feb 2026 22:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771797681; cv=none; b=sXhEd58xqmd7nReF1/cye3FC2m5SeVzQl95hllOW0sUL31lFUvHbLR7xkmfPLoeV/DV5/Hw9r3qgSPRxtc5H8I00N9cTpUKfFGHylS9vLgZdhZWrcUzkFUNsh4vhCbTI9bHYzAWtk/QrkpfMSRm7ir2E9WOVu3gJy+cjh2plDv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771797681; c=relaxed/simple;
	bh=L7zPVk6BLR05Ve7VUWk3D8j6u5WTj+Nq7yNw3/7IEhI=;
	h=Date:From:To:Subject:Message-ID; b=K10eu5clwyLAYxUSPQDn5FvUi/h3LbcIeCWytEMzU5E/iOzIYA8+bAf3qbDiXdzUtCA8bPm1zt0xNtLxycYCxdvISc3EYiWI/cMRxzLJTFhHKjcBgxpIlBuyTSTfxv6YpiKfy6qigvpLviHjjojJ5F3Yw5cDCZd9qQpya+1q5oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=begkb5S0; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="begkb5S0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771797677; x=1803333677;
  h=date:from:to:subject:message-id;
  bh=L7zPVk6BLR05Ve7VUWk3D8j6u5WTj+Nq7yNw3/7IEhI=;
  b=begkb5S0EUcLixV3HHuwXw1sAfYhNMPV5eaK8o5XuEUaRG604Sa7HXIv
   n22MdsL8H6vRPnNPis1EgguZgph0VMP+DE+1XVBBkM7m+BtveHInE2ZtY
   poborUiAFIcxbAPiuaLljILvbhQn8NevHr+R+pskQZ1RE42bkhrlp7UBf
   4L0lXPEQ6tNTt1fgBnfCKwxlU0PA6OS032MnrqSAHuQpB3NSo2TQai2HR
   XEo0tt3JRmnsZ8qtHNCBgGlmB+Hn5kmZljRIXpGEEIrF4Kgu+IS6m0NeR
   3Zt2XAPUeTunP+hzPVSQ0zoOBOdJ2b4d7Jo6bxC7jgKW7Y6ep/qt6lpsL
   w==;
X-CSE-ConnectionGUID: vebk0kjTSl63LPiIclOJzg==
X-CSE-MsgGUID: YQFLhsfcQh2f+aWqrIBscA==
X-IronPort-AV: E=McAfee;i="6800,10657,11709"; a="76628152"
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="76628152"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2026 14:01:16 -0800
X-CSE-ConnectionGUID: exdfSRuvSJSwoi0/wW1IIg==
X-CSE-MsgGUID: sucIJCOWQPGIdcm4+KQ8Nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,305,1763452800"; 
   d="scan'208";a="218963436"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 22 Feb 2026 14:01:16 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vuHVq-000000004in-00n7
	for oe-kbuild@lists.linux.dev;
	Sun, 22 Feb 2026 22:01:14 +0000
Date: Sun, 22 Feb 2026 23:00:14 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [tglx-devel:sched/hrtick 27/46] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner
 <tglx@kernel.org'
Message-ID: <202602222248.aw4eaXld-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git sched/hrtick
head:   108074eac008632e059c777dbc8ad2a16c39972f
commit: 3f5d7324d398f8d02a14f801ccf4e2de314c57c1 [27/46] hrtimer: Optimize for local timers
:::::: branch date: 34 minutes ago
:::::: commit date: 34 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260222/202602222248.aw4eaXld-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Thomas Gleixner <tglx@kernel.org'
#28: 
Signed-off-by: Thomas Gleixner <tglx@kernel.org

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
