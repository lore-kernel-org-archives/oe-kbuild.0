Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D060E1C84D7
	for <oe-kbuild@lists.linux.dev>; Thu, 27 Nov 2025 06:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764225338; cv=none; b=XRMvQ76hNxtgJs/n4TFY2QwKeMmJukYNyYaYPnsZUESG0EWep1IrBPjrrLFOQd1XfFU6yBUnOyv/FmJNyakiPKOXhPwy/e3uMZQWrR+IDFpaeB2GhTkuYtuzgxTbAvbTlJ7qegRn/hnoYl6Q8brancd77wUMetsOMTt6oXlPrwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764225338; c=relaxed/simple;
	bh=XsijBEg3I/fQEC6gAKq8h6kI4C7yitEIA4JmzBSqEgE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bFw/0dzlurwFkX4/OtjHaSpJ2DvjFjwcwn/WIHJUuz9EiWxMMxXlQIRMQxbfuOTR3HiRipubeS9FMNiv8ym5bnNUM3S1qPgcQsUT46f5kc4oUXCCVp4bR8fYYUFjGAkCdxRmLaCW9Lw3B6seYdm+iRN5xXggIHclVnVH6k5XiXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fz8To9Md; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fz8To9Md"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764225336; x=1795761336;
  h=date:from:to:subject:message-id:mime-version;
  bh=XsijBEg3I/fQEC6gAKq8h6kI4C7yitEIA4JmzBSqEgE=;
  b=Fz8To9MdiAV0xo6KtaPzYxJ1cxA5tbtiEBQd/6B0B+I9Kwrzy9pMHmN7
   x56vm/E7pe/CTzvInkzwuJ07VXrJUwj1e/NzRk7xrwbENBLuJlkWqYzzS
   tBWnJWlUOMEFju5TX40WQu3W2AG182keE/4yC/NDajkitdcbrCXFq9UBM
   ZWf/SEQqthpMOCd+dyfzhNLAw9h1SLLpI3niU5T+TxCPWwslFd3H1GFS+
   kXVY8nK9nXoRBbCsl3tSvkgFDIctgNoImZlMBBiWRAittjIpNAKtAV306
   R6pAPB7z6cDOtCgq2IirhFfrXPQ5A1TjOriPOgomQMuY9PWTXgby87Uf5
   g==;
X-CSE-ConnectionGUID: BjF1A46uTVuNEXthja4AwQ==
X-CSE-MsgGUID: o9YGn6jSQJmGs/ugWAwvHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="66307071"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="66307071"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Nov 2025 22:35:35 -0800
X-CSE-ConnectionGUID: KsiKKhHdTu+t6f41V1y+wQ==
X-CSE-MsgGUID: VUg9Pa8KQSen8kxLJg/gpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; 
   d="scan'208";a="197476636"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 26 Nov 2025 22:35:35 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vOVbJ-000000001dX-0eJK
	for oe-kbuild@lists.linux.dev;
	Thu, 27 Nov 2025 06:35:33 +0000
Date: Thu, 27 Nov 2025 07:35:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [akpm-mm:mm-unstable 55/60] checkpatch: WARNING:BAD_SIGN_OFF:
 Unexpected content after email: 'Alice Ryhl <aliceryhl@google.com>
	[rust]', should be: 'Alice Ryhl <aliceryhl@google.com> (rust)'
Message-ID: <202511270748.BJgDWkPt-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-unstable
head:   61495b6cd2acda1bd0f732e3c309d51eb2d2ba01
commit: 86dea4f3f85a046cf90b87a93c9e3d2f3713c773 [55/60] tools/testing/vma: eliminate dependency on vma->__vm_flags
:::::: branch date: 11 hours ago
:::::: commit date: 11 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20251127/202511270748.BJgDWkPt-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:BAD_SIGN_OFF: Unexpected content after email: 'Alice Ryhl <aliceryhl@google.com>	[rust]', should be: 'Alice Ryhl <aliceryhl@google.com> (rust)'
#22: 
Acked-by: Alice Ryhl <aliceryhl@google.com>	[rust]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
