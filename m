Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9510236D513
	for <oe-kbuild@lists.linux.dev>; Sat, 29 Nov 2025 21:35:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764452115; cv=none; b=eTtXdG1kPtRvDd0IB8uwN5Z9w4nmFM4mlQD/NtrRtvQYM3CxPsJvLpAzhtf6pKFok4El7hVK4Bhm2bUeYXbC77vLn5XVk4mzfN6DjDAxJHxUAEMEEvWkoYR8I9BIT3p2CFYfa62Sidp0uPoDpunABPb3kjRaSlxljj5b/+q1fq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764452115; c=relaxed/simple;
	bh=5aVTbR2Ot56K1ifpUpCtDoHYxg0razTVTiAg8B2g8tM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NsrTtaeTSHwMZ9iVcH/5+rHH/sYuWHyc2FbNbysd1MYpSPHa210ZFO/U+rLL1FBrFVBGnlrIa+ZrXSVKKtZHnAmqpqzUydUYFPwuuQo+5cJ5lOQPjE97Sc/AabKxI5sTKdMowPycR6z3ykrHaMgd2J8FEDJ6hWHZHLenLNP9mD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KmhBOGj9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KmhBOGj9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764452113; x=1795988113;
  h=date:from:to:subject:message-id:mime-version;
  bh=5aVTbR2Ot56K1ifpUpCtDoHYxg0razTVTiAg8B2g8tM=;
  b=KmhBOGj9Pcq9+PqK66QI+scIgZSemglaqzYYX+aqCIoJTxI3vuj7pyQP
   MYpFew2WDj+VMe2/tBOEqNTvPQ6kZ5CManx007SQo5TZGOJAl1CK5/Xui
   Guao17nRxkRtNBFeKLekJLUOE+Vqubbj64091x0JcRCBPwahZjahLDm0a
   QZ1a76Ie8TpDP+JUXCbsWRym/MW5z3VdtYK4tPWNMX+5bMMv6w2PQi49h
   s8/a7wvitC/rS/H5b18iaGEb8Hz0MxtOxxH2YclYP9TUlIUskVAHHUsqZ
   xeB+10C2sBakS1D3VlL53JDQ1CBdjeh34YX301TaFp+eYFGt8iZl7tJ21
   w==;
X-CSE-ConnectionGUID: hUfLwdTUQGqwQZlqjzlGVQ==
X-CSE-MsgGUID: 9E+xXB3oSqCPS+DcvpatWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11628"; a="69024822"
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="69024822"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2025 13:35:13 -0800
X-CSE-ConnectionGUID: nRtZEWVGT7SiBJN9lxzSqA==
X-CSE-MsgGUID: aMDVw6YFTrq5QUQLv2QVdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,237,1758610800"; 
   d="scan'208";a="194509682"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 29 Nov 2025 13:35:12 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vPSb0-000000002Pr-1i3n
	for oe-kbuild@lists.linux.dev;
	Sat, 29 Nov 2025 21:35:10 +0000
Date: Sat, 29 Nov 2025 22:35:04 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-stable 314/323] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Alice Ryhl <aliceryhl@google.com>
	[rust]', should be: 'Alice Ryhl <aliceryhl@google.com> (rust)'
Message-ID: <202511292251.Zuy6WOKp-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-stable
head:   faf3c923523e5c8fc3baaa413d62e913774ae52f
commit: 4c613f518f786fb0ca4850e4ca5f1933d6a4a304 [314/323] tools/testing/vma: eliminate dependency on vma->__vm_flags
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251129/202511292251.Zuy6WOKp-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Alice Ryhl <aliceryhl@google.com>	[rust]', should be: 'Alice Ryhl <aliceryhl@google.com> (rust)'
#22: 
Acked-by: Alice Ryhl <aliceryhl@google.com>	[rust]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
