Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4877C1EA7CC
	for <oe-kbuild@lists.linux.dev>; Sat,  6 Dec 2025 05:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764999421; cv=none; b=ffCCWDjkAK+6HXYXcW5TlZM64dCqIHGVDnQiy8j41r88BRP0TMHSD9Y4cuoesNGgPo5geGhv+qMD8pFv5k9HwwL4v1be7gcPFuNks0834E+ogS3B1pvOsSJhW4SoTgOawFrvp3uGhnpCoxxwDKO/LgceFMoua2T8Q9bB7fjBlTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764999421; c=relaxed/simple;
	bh=V7ToE3UqdqOSQUfbhJb4QSFe5fo7onYB/QT4GPe8xf0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oXS7PPlqeZ/E8g1MddMXUeat9YlqB8VpI5j0BsYE/GU1xyn5syIbm+hXjoVZKjY5N6bFvDOw/JkyR3V2HmJ77YC18rMn2BTad5l40o3SX8bRhMZHjRZjOC9u0FGmxCpLKbiF18RxxTtW5+SbCTHBIh8CeH92OCCoeHeUSERnW3I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ufsj5HHN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ufsj5HHN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764999419; x=1796535419;
  h=date:from:to:subject:message-id:mime-version;
  bh=V7ToE3UqdqOSQUfbhJb4QSFe5fo7onYB/QT4GPe8xf0=;
  b=Ufsj5HHN6wSyjibShSZCuNfqQ1rJvCebqgkOcMrhx1H8/iuoXbuex9Cr
   M+QjaUcCCNnGioIDji15wC5pOLM5GIq7FdG9utf+4Mv59e9fBv0xk9sca
   pm+p1pWmEoYypt02nM3ZBL1AGm0soR2Y9Kxfj5iTqTCLj7Mh0D0hNKoWw
   B8xJ7DwZeCr0mnnfBC0moLlclBOwtxbwy4VDB1CSPWo1E3t8lrbNapboc
   HRV76bc9dNRqzLIcS22Ub/VDdYVzMJGcPjEyIgw0PJhuThXzaMCN8wGKG
   yjoVGTN6gjDgAp+rh6vEM30ml5VGbGCZNjBMFnAJDSDCFPUAoA63JpJzK
   Q==;
X-CSE-ConnectionGUID: FD+qUNJ1RWSBcgmCSOLbqg==
X-CSE-MsgGUID: Jic+HtnISEK76ly63wFwmw==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="66990965"
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="66990965"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 21:36:58 -0800
X-CSE-ConnectionGUID: bB+r8lj9RGmVGroOz7gZcg==
X-CSE-MsgGUID: I1GKhx6FRFiMX4fN0AwZXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,254,1758610800"; 
   d="scan'208";a="218823886"
Received: from igk-lkp-server01.igk.intel.com (HELO 314ca7b3cca8) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 05 Dec 2025 21:36:58 -0800
Received: from kbuild by 314ca7b3cca8 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRkyW-00000000145-03qk
	for oe-kbuild@lists.linux.dev;
	Sat, 06 Dec 2025 05:36:56 +0000
Date: Sat, 6 Dec 2025 06:36:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [cilium:pr/netkit-iouring7 3/12] checkpatch: WARNING:BAD_SIGN_OFF:
 Co-developed-by: should not be used to attribute nominal patch author
 'Daniel Borkmann <daniel@iogearbox.net>'
Message-ID: <202512060625.T24Zwsw2-lkp@intel.com>
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
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Daniel Borkmann <daniel@iogearbox.net>

tree:   https://github.com/cilium/linux.git pr/netkit-iouring7
head:   49e30646c2932aa37daeb4edc45b82d3e0c72bf3
commit: 6d1954c22844e2b65d001d9cf12cc815ce137734 [3/12] net: Add peer info to queue-get response
:::::: branch date: 9 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251206/202512060625.T24Zwsw2-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Co-developed-by: should not be used to attribute nominal patch author 'Daniel Borkmann <daniel@iogearbox.net>'
#65: 
Co-developed-by: Daniel Borkmann <daniel@iogearbox.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
