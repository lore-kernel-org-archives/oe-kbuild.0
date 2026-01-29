Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF3C3EBF1C
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 04:57:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769662676; cv=none; b=bkFWOtyxIrfBDYrVZkqMd2Z/HIVvD8/Vqt98xSPiz+i/d0vXMsL/oMnaLlZmyrzC9XeAvh5qpanZv1KGB9fajC1AxWpP2Dce4278C8mppJEVch+Vzd/3pmCNKuxmHV+mjb9Ci4c3rHsBsTGhA6vl7v+ZoAhJfYYXk92fuFtRbS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769662676; c=relaxed/simple;
	bh=iS6Ay7SABKUMKI8ipcBePxvbimpIYYXTB9F/VFxH8k0=;
	h=Date:From:To:Subject:Message-ID; b=o4a1W0gPdDbZCY9zRkFBi68+OH6KS8gYI5CdeMyVzgLIdFM7RX09Gbkyo27vOQwfoZJKy6xe+oaemF15ZLzWyOu7D8/PwIP1q83mMTtCFkAnmmcoRVDAl8LVwAOFay3ydAma8IyOb7ZqvZ/hLDO8W2fiHEFzdsJj+s854GHab0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m8fFnUnD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m8fFnUnD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769662674; x=1801198674;
  h=date:from:to:subject:message-id;
  bh=iS6Ay7SABKUMKI8ipcBePxvbimpIYYXTB9F/VFxH8k0=;
  b=m8fFnUnDWFUSH0pwQTHs20R6rIeI2YOnbUBI3SjSeDTOP5zNkvNSJQa8
   BApvaLRFx9jEKBqdOV0zWgW8rIfSkseurcDgBKMC4GKW9JQXDd6I+BsF6
   TMiv56tssbWj+XXEIXt0clsbX17XS6tiIxxSq78S6+cYyMS5OlcSxAVEO
   y53dbdaRMhllwWGxyVFTTAr5/+pkHj0rF7uiloPq/xCUsIYC6j7RES/23
   cYD7ZffGhgUx+PB0NLq03zN1m5KNCaZ95htS6dKHGtNobn7Pu46r7rnKO
   0SAcqogSWNqFtvFdjqx3XxxVIT/lPpmU5nE6T59ECTWBo0uI1vvkWvswT
   w==;
X-CSE-ConnectionGUID: qlcsq2z4R06ZbHx8g7Qcnw==
X-CSE-MsgGUID: 93p0KIyvTJekXE6yklF3Ow==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="69904779"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="69904779"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 20:57:53 -0800
X-CSE-ConnectionGUID: 7R9FVvCuQvG8i2PK4tpOmA==
X-CSE-MsgGUID: 4HzZy7Z9Q/KQq8zl2I+YdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208896438"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 28 Jan 2026 20:57:53 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlK6J-000000002DF-14Vr
	for oe-kbuild@lists.linux.dev;
	Thu, 29 Jan 2026 04:57:51 +0000
Date: Thu, 29 Jan 2026 05:57:32 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [xfs-linux:xfs-7.0-merge 11/45] checkpatch:
 WARNING:REPEATED_WORD: Possible repeated word: 'including'
Message-ID: <202601290505.4nnzVAak-lkp@intel.com>
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
TO: Christoph Hellwig <hch@lst.de>

tree:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git xfs-7.0-merge
head:   cc7ae24232368a92156919fe1196f059c3543da2
commit: 971ffb634113474add7c3adb07c1ea03110e7844 [11/45] xfs: rename xfs_linux.h to xfs_platform.h
:::::: branch date: 11 hours ago
:::::: commit date: 8 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260129/202601290505.4nnzVAak-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'including'
#6: 
Rename xfs_linux.h to prepare for including including it directly

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
