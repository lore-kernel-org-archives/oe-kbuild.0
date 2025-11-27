Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5305E26CE1A
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 02:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764211176; cv=none; b=N6Sd02NhUZvzeBQcJMQxV04tkFABAvxihEu1K5LO3uKe0tj5U1hORjyxBa/Qz24EKCS0K+Xq/srnHkNk5IrZDodOlDgHvc1naWM9TLeX4VmktfntG5EW62McJmgdk/QOGE7Hd9G/BoL2OEsddVTQiY0EBA6NH2qVpi6devLWScY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764211176; c=relaxed/simple;
	bh=wAoqkU1dausvx9zNWh2a0VzXF+n6ra367PSitlmd3gI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iUGs6ZY9pDQxfzLavChwEaEhu/Xqj+0GKFd/z2YvIJf9Krod455G1GqgvOYLo/mMMa6pCcMNrEAktYTiD4hmRhMfuImrqKwmw78S4VUvipA2CRIA8oGICHp4Q8g6h3qZI+vnKdxwc4HaNC9zuUnvZuTsk0yDSvAaXCmTDYBqFi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ivEvQ/uk; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ivEvQ/uk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764211174; x=1795747174;
  h=date:from:to:subject:message-id:mime-version;
  bh=wAoqkU1dausvx9zNWh2a0VzXF+n6ra367PSitlmd3gI=;
  b=ivEvQ/ukCLBzNwH3YUnrGjkq7hQWwzlcMilabYp7wj6H1pAVupK3lJNC
   VDENr+WsfK/25jUjVGYngOd/hjk1sT2WduuFEKna3gyswwAn91k8QJc4N
   I9TLYdGtMlOHY9rxFpIKyswqdgcGiqO+5kCDUb94wbHrC122ch7vAor/y
   MtTncQv/xPoD0x+HwvrIoGalBYXmPYqmXyjOPrG7dHVgtx1M/SI9v10Nt
   fZ9E0wBWk/abCwqCruHHBrYq62yQus+Z4BUR1UWZaLfidPfOTOMsP1FYB
   /nlhkXqaWdfIMgDFTlDDnRt7E9ZXkr3jdZBtmQAghvq7YpvP12W4ZIeov
   Q==;
X-CSE-ConnectionGUID: 5+Gz0Zg+T3GX6a50SL3g2Q==
X-CSE-MsgGUID: Fj8IZdBYR7CpdW4aZGJ6WQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66329604"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66329604"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 18:39:33 -0800
X-CSE-ConnectionGUID: r3I2ugYjQ1qZhauv0xrwlQ==
X-CSE-MsgGUID: YRB5OV97RxGMg1EwGwujoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="224063401"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 26 Nov 2025 18:39:33 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vORut-000000001af-0CtS
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 02:39:31 +0000
Date: Thu, 27 Nov 2025 03:38:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:fuse-service-container 15/82] checkpatch:
 WARNING:SPACING: space prohibited between function name and open parenthesis
 '('
Message-ID: <202511270340.dCaK5I4C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Darrick J. Wong" <darrick.wong@oracle.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-service-container
head:   69ff58bd20a3f25ce91f1ff72a2063b65463142b
commit: da9f98eedc88a5f0a402e2de009dd376bdd7776d [15/82] xfs: check if an open file is on the health monitored fs
:::::: branch date: 34 minutes ago
:::::: commit date: 35 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270340.dCaK5I4C-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#47: FILE: fs/xfs/libxfs/xfs_fs.h:1205:
+				_IOW ('X', 69, struct xfs_health_file_on_monitored_fs)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
