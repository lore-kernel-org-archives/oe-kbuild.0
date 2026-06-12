Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1783B285068
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 19:34:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781292852; cv=none; b=f51NeFSyTMd8aq6ghMIeQdH2BAjptwN9PVu2y8hnRHXJBqBk1sCBL+OBA8MSmNXxyPZ78u1gHh4foUPGSEs6dSGNOmQO1dfK6bWQ1zTkwE8Jo8rvHdyBzPH/wN71+pcicedidv8o65W/ezV8AARXYJEudn5jQLiou8uJ0NvEQ5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781292852; c=relaxed/simple;
	bh=gqyXpKePav5DVBfpfbGasF78qOacUQHIm/EmFlqEIZ4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=G5kT0it0Pd1yXN22mPClN4mfJH6uHhwgK7me6792+lo015SIFQSLraayy6CvWvxl9JB/5A2Jf1Q3VEGwrZYOYV0ljFvO2gD02wCpSps5icfP+gNoo0nkaQN336t1FlvM5r3uqHWj1UZ97dV7gTqts23+LKcjXb+EXqCIySnzCLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BrTijhVt; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BrTijhVt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781292851; x=1812828851;
  h=date:from:to:cc:subject:message-id;
  bh=gqyXpKePav5DVBfpfbGasF78qOacUQHIm/EmFlqEIZ4=;
  b=BrTijhVt7W0GdsaRqTpvI9K2tAltEcDIHOma+dP6gsEnrysuS9zao0Fh
   XRS4W2ovyEVVH2279QqHEV3mSWN1oKllIJgHZYMv7EtTmvOBzrbu19Xgq
   +M/spacUodj9j+VidZJxfTbFysl0knNcj2dCLGikwdd22f4VCbp48NCJA
   TUohq2KRw+M+9ukJz8ExbHD8pPBDbZUDFHS9g2Ev97GTrdJBtSNwhW3Eh
   rGBO5xDu8imosKwyiHNmH0Asjb8wU4VeKjd7fFSbOcEqcgpe1eyhZ2M6L
   asw57o3GF9Ys3NGBHtx5JvbbOYi1LTAktlZ+2Ly49AFmVTyHxzsLSczlQ
   w==;
X-CSE-ConnectionGUID: y66zS68oSPKKs5YU2sDY8A==
X-CSE-MsgGUID: Hay2oRp0SGOEggRFThavyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="92452878"
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="92452878"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 12:34:11 -0700
X-CSE-ConnectionGUID: eOoWK6XvTBGtFsM/DV1I+Q==
X-CSE-MsgGUID: J3h6oxCXT+u5ID1YkO3kdA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,201,1774335600"; 
   d="scan'208";a="250814570"
Received: from igk-lkp-server01.igk.intel.com (HELO 892db79562d4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 12 Jun 2026 12:34:10 -0700
Received: from kbuild by 892db79562d4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY7dn-000000004Iv-1q18;
	Fri, 12 Jun 2026 19:34:07 +0000
Date: Fri, 12 Jun 2026 21:33:38 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [hare-scsi-devel:configfs-ns.v6 21/24] ERROR: modpost:
 "mnt_clone_direct" [fs/configfs/configfs.ko] undefined!
Message-ID: <202606122115.g8BLJRxb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Hannes Reinecke <hare@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v6
head:   65843faa046b6a3ff4953aba7319313104638535
commit: 6c327e2c66e67e1296c6bd57719991db3a0f250c [21/24] fs/configfs: add superblock as attribute to configfs_pin_fs()
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260612/202606122115.g8BLJRxb-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606122115.g8BLJRxb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606122115.g8BLJRxb-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "mnt_clone_direct" [fs/configfs/configfs.ko] undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
