Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3F7B1CFBA
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 06:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764398648; cv=none; b=RRBvc4yodMtEk5+OzYU7KVsblVQmKtCmEF0LDjqLQGKCPTRHze/taGYmCblJ2UsUH1TbquAFQdWh6aHzfYTY9FU5NJlaxGdb0YiJGRfXj1xYNsOco7kdv/x8u4p0X4Iaj1GQ8bU7+4ElP2037h/t87NYHh1nt2RRdOm4OgT2HcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764398648; c=relaxed/simple;
	bh=rTkCxW7NGU5DHxe6WZfhzOtitoIP8WxXh8HFGTqNnS4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nSpDR2ObakJ56m+7KwuHS7tZ3ScTJz06sxGSVwYvrMmI26U+HKapUYL3hHXbRoiQUpsP/mL3+bTpZIkaIirtIUJTOX+SyQsN2d6+WD/Sm7opvKD4fnNMwyIZGgCED0MRBMIngnrnXMrUnBMTstNLaWhXGSS/t0VN6HvUkXTiuZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LZOHom13; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LZOHom13"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764398647; x=1795934647;
  h=date:from:to:subject:message-id:mime-version;
  bh=rTkCxW7NGU5DHxe6WZfhzOtitoIP8WxXh8HFGTqNnS4=;
  b=LZOHom13aO+Cd4XvBwSV12OrlTWz8dCCJo1azGeKBIgq9ajGdszCh3do
   k2U/lEWVmT+EGjUABdDJqr6bXdzPGSfLAL7e6C2+utsU2LSkKi9VFadYg
   uNxYPTciIUijrBWH3mkPor4QIopVCsM4Yz1lWHa34ClH6H5N4WTsFH0UA
   5cdeXVx0i03iIKg10o7It2O0bLu+IX2hp9fMcTbwGolbymiU3O0QaW/+6
   6ycwVjbQ31bxLWorGondXma9HTTbXnM9U/Cjp+AmFsX/PXENQ/Nqy2pjk
   DISOfJC9WxN6QqwEJhfl6XWX6onF2rSI34tinhlTSSs86G3pGIpBcb+tz
   A==;
X-CSE-ConnectionGUID: qVlyjVtiQcKVNarLvp0qZg==
X-CSE-MsgGUID: KchLrFHRTTaIyAiuj9N6KA==
X-IronPort-AV: E=McAfee;i="6800,10657,11627"; a="91883566"
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="91883566"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2025 22:44:05 -0800
X-CSE-ConnectionGUID: WvINb5nASeuzKjBZZbSsaQ==
X-CSE-MsgGUID: 97db66xcSA648rYyanRjlw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,235,1758610800"; 
   d="scan'208";a="194040123"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 28 Nov 2025 22:44:04 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPEgc-000000002F9-1mfA
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 06:44:02 +0000
Date: Sat, 29 Nov 2025 07:43:43 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [brauner-github:vfs-6.19.fd_prepare 2/12] checkpatch:
 WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
Message-ID: <202511290717.VguPBP3e-lkp@intel.com>
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
TO: Christian Brauner <brauner@kernel.org>

tree:   https://github.com/brauner/linux.git vfs-6.19.fd_prepare
head:   65c2c221846eeb157ab7cecf5a26f24d42faafcc
commit: ea2f85c54e81501a25b09e1eaf63f94adf77f591 [2/12] ipc: preserve original file opening pattern
:::::: branch date: 20 hours ago
:::::: commit date: 3 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511290717.VguPBP3e-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#52: FILE: ipc/mqueue.c:920:
+	struct filename *name __free(putname) = NULL;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
