Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2C74266BF
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Mar 2026 20:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772829545; cv=none; b=MYXAAFOlgV2/iLedtpcTW0+T66oKdYil7bbCHdgb87tRDvr0XvV8dr1n09ZIMK0zxBqjZPUW9i4pwTX3GzDySjry08O+Brmk45A3SVb8Rr/xmK6SnX9vaDCduv9UPglo7u74ptDE5kTys1WqJ3eLt/XljFU8KqbL6dRENGgXJQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772829545; c=relaxed/simple;
	bh=9rTWH4/BeNJX7pjJ1xRaw0HiidAzmCkZBINCxA5DIlk=;
	h=Date:From:To:Subject:Message-ID; b=jSfS4Kf8IYO4tHNuhhPsf2oHDNbCCDtYL/QHpHUIzugcTF85jMqQtkfE7s1HFJ4TAUYEy7SoVjrgXTliRIj5CTakuSmrBVNMX565dp4onnvxIvD0szKyFp26dcoztRIThtvENOrqVTa3S57nXVCPJ9bo20/+i7HmKtJXyNohvOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hTP8OLD0; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hTP8OLD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772829545; x=1804365545;
  h=date:from:to:subject:message-id;
  bh=9rTWH4/BeNJX7pjJ1xRaw0HiidAzmCkZBINCxA5DIlk=;
  b=hTP8OLD01nIGVky5F9HlOr6mQZS9xrSbUuM1TgnmYQDxd4lfFYy8grz9
   uqa1nM2WXWjzL8+ymYR3oO2j9wwAQY+V9vLi9Y34yME547/t5OyGFTQ/v
   jhJ2xzOWRXd6TOUe8wyijUxgT7LWDyrMPUntDGjEtxyx6s4kttmIeHq49
   Wo6NcWaXPHp1XyWEmTNlbiaDM9OFj7btAy2ocrIyZJxwwIMELLStaYT/a
   LOJe8cdfgnNte0RnoGmSIkbk+y6beRBRlsERmTmWy32Q+V3bYb37YakrS
   GSmBXZ4O49m6XK5F66gkvDs1xwRK5sIg8RWwjZextQMMyViHcfEygefdO
   A==;
X-CSE-ConnectionGUID: 8YTiSkR9SyedypMZ5qLasw==
X-CSE-MsgGUID: NW914FdBQpKay7XW+Axjzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="84578732"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="84578732"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 12:39:02 -0800
X-CSE-ConnectionGUID: 2TEYPd79SiyXwXx3/iglRQ==
X-CSE-MsgGUID: 0ZdUfJYKSBupHSztjRC/4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; 
   d="scan'208";a="223233737"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Mar 2026 12:39:01 -0800
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vybwp-000000002LX-29TF
	for oe-kbuild@lists.linux.dev;
	Fri, 06 Mar 2026 20:38:59 +0000
Date: Fri, 06 Mar 2026 21:38:53 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cornelisnetworks:for-upstream_20260306-1425 22/31]
 checkpatch: WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on
 each line
Message-ID: <202603062111.Cl4fRyyE-lkp@intel.com>
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
TO: Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>

tree:   https://github.com/cornelisnetworks/linux.git for-upstream_20260306-1425
head:   8e85a7c6fd859479abc528a78dec59382ef82d3d
commit: 61fcae91bd2fabc4390d60ea9d721c2da0f8e917 [22/31] RDMA/hfi2: Add SDMA infrastructure
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260306/202603062111.Cl4fRyyE-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#3546: FILE: drivers/infiniband/hw/hfi2/sdma.c:3385:
+			/*
+			* SW initiated halt does not perform engines

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
