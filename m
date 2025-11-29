Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBDE36D513
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 21:33:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764451995; cv=none; b=dl/lcCcvHUBCVMhvIiAwbjdMp19qGkqPRgKBtWFISZSAL7mk4nFVeLCjaEBxqodfK2SacACU75tL6qg0sjcauL14N+EzQF6YkpwTWoLQTtCbss4nteSz8/2CczA836VUujtivokROZsoHuZmPlOBRixeUur6JUkc9Q6yf3ydrec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764451995; c=relaxed/simple;
	bh=KEpFVujw3abr6m0cWEhCMdvBpPLHAGhBVK+/599N9Ng=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mflw6mbXFqBKzzGtnsWGQIqd1VfvMjMQtk7i/OTLakVNzkSYJtTAxzog6Gs1OJj040EletDV4LhOJyPKoZ1804v8I7rw7juCHZpRySi9P581T8bD5uwNfLvpAZ6gHvUqH8l80v4LALM9oqRxKiYvnHxRsAGbmxZrRQb5WNagbTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWRqw3Uv; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWRqw3Uv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764451993; x=1795987993;
  h=date:from:to:subject:message-id:mime-version;
  bh=KEpFVujw3abr6m0cWEhCMdvBpPLHAGhBVK+/599N9Ng=;
  b=QWRqw3Uv0+jTYjM2NQ61LJpOueblU2ktVVQM4sm9D42OBgW8F2y0XBYF
   k1wVy38ubTs5Cs5gqPCiz0Mbg7Ry8FLuqVkh3e7gf8VjPlev55gLB2JwG
   Bz7wApxEtshb0vHdv8C4HScl++9xtDXRN95K3O+KYk7EZlC4/WGRAIXDq
   9USzVw8gFcaEXH4DIfO3UPmHxBbZrCTSzZEZiG/CL5SOa6UwDlfVyWnWw
   YpF0CfqqG43vyXU/S2e4hl6gZYOE2lbNZeoUMOAJ03ufRb0hK/GrmbJFl
   Xe54vuM9/Rxqy2ypNZ7YS1kSlI/BBjSYURGIG+G9vGHasS1FJ/sKv1ZVr
   Q==;
X-CSE-ConnectionGUID: paPPC/ARSc6ClNya2OjXgg==
X-CSE-MsgGUID: tOMex62rQky8lSkDkYcfxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="66327699"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="66327699"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 13:33:12 -0800
X-CSE-ConnectionGUID: nR3bZ6uiR/qrdeMrbGUymw==
X-CSE-MsgGUID: uFbSJru+TNuE77avC16tow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="217078314"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 29 Nov 2025 13:33:12 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPSZ4-000000002Pl-1NhQ
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 21:33:10 +0000
Date: Sat, 29 Nov 2025 22:32:56 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-stable 258/323] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'SeongJae Park <sj@kernel.org>\', should be:
 'SeongJae Park <sj@kernel.org>'
Message-ID: <202511292229.AbZR6V3e-lkp@intel.com>
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
TO: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

Hi Lorenzo,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
head:   faf3c923523e5c8fc3baaa413d62e913774ae52f
commit: 0ac881efe16468503e8c1e7d8a7210b75f027ce3 [258/323] mm: replace pmd_to_swp_entry() with softleaf_from_pmd()
:::::: branch date: 3 hours ago
:::::: commit date: 5 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511292229.AbZR6V3e-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'SeongJae Park <sj@kernel.org>\', should be: 'SeongJae Park <sj@kernel.org>'
#24: 
Reviewed-by: SeongJae Park <sj@kernel.org>\

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
