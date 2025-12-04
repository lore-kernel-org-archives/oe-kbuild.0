Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB53223DE9
	for <oe-kbuild@lists.linux.dev>; Thu,  4 Dec 2025 20:01:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764878511; cv=none; b=rhnfIlNStzR3MU1pqSGEAw33qxqr/1j8hPq6MlxF8pErznZ54In6rxbg7L9u9FKbLZ0brnpPmOuSslmgZBaOMSY4BBe0gz/ZWLggrMXEk6D+uKxuSmh7aRYOnCfgjlvd2IHYzobb0uyV5q4zNmXusicQJjJy69fWSis32T/JQXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764878511; c=relaxed/simple;
	bh=HQUuQ8LFASNItV7Ifpe1v/0cFwTkKxUAiiKEmwycm+0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Uw+Z63TyI356HXVxCcVolIs7/l6qc5AwWYYb2dRTaEeLmOKf4wMrO0BsUnikNCTPFVSoUwnvo45XlYZHGybj4bIRxsEoF9q1rkkaAchw/CSSEJ3M1OV2AGdFIPEGtHE/B1xC8QymlQYtmN7d7AyuW8dq90+zTBadctK9W6EEA8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NJ/sR5sI; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NJ/sR5sI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764878509; x=1796414509;
  h=date:from:to:subject:message-id:mime-version;
  bh=HQUuQ8LFASNItV7Ifpe1v/0cFwTkKxUAiiKEmwycm+0=;
  b=NJ/sR5sIxOsRXcZfR6S9VTyWZ8rOBrFy7bYE6PksEl53EIrhUwuspozT
   8wGgbrDVyg5sJJq2xf5yxh2dqPnszmFmcq6XkJ/owekefaUHemcGUaDKT
   JY/FrUr/ceqAE5Cov5vyrfCutdxjv4HLvfox6dYWK8q1pm63Df4Wi0AqX
   c9aRBkxQjSLnwlnStCjPPCmWz3TIePr56JxeoI3rf4VqLynD/0x0jjiI4
   va9S0pOhzlKtCLXSCEfA1g5hBU5zw8N82XAaQQ5cl4SyOqB0xIDo+BXbk
   AqaNYGHhife9CkqESRncD9UaJsUFHZTVklHn7ACIEOUuTgEtyNrrSrOhm
   g==;
X-CSE-ConnectionGUID: kzffu4P/RXamGqX7/1UscQ==
X-CSE-MsgGUID: oGcQUXLbSpmU96+TH0G1JA==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="65908476"
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="65908476"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 12:01:48 -0800
X-CSE-ConnectionGUID: 2EuCdR45QtikHGji17fXOQ==
X-CSE-MsgGUID: bDptNjp/QLaF6q2nb7l2gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,249,1758610800"; 
   d="scan'208";a="200205770"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 04 Dec 2025 12:01:47 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRFWK-000000000od-2XcL
	for oe-kbuild@lists.linux.dev;
	Thu, 04 Dec 2025 20:01:44 +0000
Date: Thu, 4 Dec 2025 21:01:35 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [pdx86-platform-drivers-x86:review-ilpo-next 38/72] checkpatch:
 ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
Message-ID: <202512042109.36P7qPBC-lkp@intel.com>
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
TO: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Hi Shyam,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git review-ilpo-next
head:   4df66a74d2a54e265c0b0dda81b7a00e4d5140f1
commit: bc3c0a3231b78589896f283d971a003761b100e5 [38/72] platform/x86/amd/pmf: Rename IPU metrics fields to NPU for consistency
:::::: branch date: 4 hours ago
:::::: commit date: 13 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251204/202512042109.36P7qPBC-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: ''
#18: 
Reviewed-by:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
