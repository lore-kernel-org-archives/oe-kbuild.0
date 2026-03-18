Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99A5124A07C
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Mar 2026 22:17:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773872237; cv=none; b=Ye5JfrJ/tSZiVia6WS5w92nzYdA6C+bpPc9gGprJi3goig6ZL+YW2wlUddmG6cY0S+55CSf5GVz1N8lQCdigueMqkwCIFEM8G0uhn9a16+fhmysX75Psm2SBA5SZNNGtAo2SXMVzeHGzfeDBJRRWABYR9wpXZ1XwPGcD5tcI3RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773872237; c=relaxed/simple;
	bh=4OvL/jMU6WfuQc6rl3+mqMIrUzC63FSH0OpgZ4BIV2s=;
	h=Date:From:To:Subject:Message-ID; b=DZ9WrRYFqoxrXsED0q8BjI2I5BZNk5itjHWz8al/bfB4EOG+vBQlC9JM7Ac4YAB4jC68bwSR3y0T0xrRYH4i3DohQLNTlmxJMEQbI8V706nJZJZfa1It4YZghRNJuAzqJxgkYaACgaSlquikYCpkUWD2Pdf9giNpduIdWhxRQhQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eyfWKziM; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eyfWKziM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773872236; x=1805408236;
  h=date:from:to:subject:message-id;
  bh=4OvL/jMU6WfuQc6rl3+mqMIrUzC63FSH0OpgZ4BIV2s=;
  b=eyfWKziMhgxWXAMtky8niHl4jOMoUGPE+Q74VIxGHxpFYAJess2xvGZs
   oSmotwOqOEG/uTYUVLyRiG1g6LaWgZop5z7tLxyI1BAOwGQZdKPrynmRg
   OWKd0f5flYj8CcyZOCWN4LPGrc2sdqsyNcAp1LhdjSxDJ67cYEInAuThx
   0xHDhj4n6PD3qfpnB19lv4Ssi4tqMZ+0spq8YHehUTFA//dN5JMxPnF/N
   ftw4wKGujl/jKfgevQqaWErnnCIdoP+SpIu8NGNv5vu4PClAu8uemymz7
   UQayxJPscJjOdKb2Gh4ppgktI5OGsAffy3G3aDiii/EZ6ayvZmC/iehRY
   Q==;
X-CSE-ConnectionGUID: XxOwrycRSrunBcPdWoCUjw==
X-CSE-MsgGUID: kEa4gB+dT3+D/qeLUwjQzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11733"; a="92323324"
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="92323324"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Mar 2026 15:17:15 -0700
X-CSE-ConnectionGUID: d1Ekf43JQ02rfVoYUv6rfQ==
X-CSE-MsgGUID: jo9TPIw/TS+FvNIfJOMd/A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,128,1770624000"; 
   d="scan'208";a="220187063"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 18 Mar 2026 15:17:14 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w2zCR-000000004jZ-2lqK
	for oe-kbuild@lists.linux.dev;
	Wed, 18 Mar 2026 22:17:11 +0000
Date: Wed, 18 Mar 2026 23:17:03 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [axboe:rw_iter 118/543] checkpatch: WARNING:MINMAX: min()
 should probably be min_t(u8, 20, raw_data[2])
Message-ID: <202603182326.nX6s7p0W-lkp@intel.com>
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
TO: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/axboe/linux.git rw_iter
head:   5ccf074f1fbbef1cf1061f3b816fe98bf67c559b
commit: d84df929416c49065d43d170d586110093ced5fc [118/543] drivers/hid: convert to read/write iterators
:::::: branch date: 29 minutes ago
:::::: commit date: 30 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20260318/202603182326.nX6s7p0W-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:MINMAX: min() should probably be min_t(u8, 20, raw_data[2])
#177: FILE: drivers/hid/hid-picolcd_debugfs.c:135:
+	if (!copy_from_iter_full(raw_data+3, min((u8)20, raw_data[2]), from))
 		return -EFAULT;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
