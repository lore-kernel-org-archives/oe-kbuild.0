Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C1F81A23B9
	for <oe-kbuild@lists.linux.dev>; Tue, 25 Nov 2025 21:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764107809; cv=none; b=TMqCrX/QsjW/b+DML6W5CheZyLD293RfZD7iSz46ct4FRFZM0XBLXt7rQh6CgPS5Ks7j3WBWmKH4Bzi088IJT9/neBF4IidX6GFOHWvLydnpFzUr6LXR6QhkXSsO1ZcM5+zUv/SEywS+2SFqouRpwNFshgpXFdC3HoLLIrTIyLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764107809; c=relaxed/simple;
	bh=rpb2wTIiM2OeH1tTuejY2UdC5uDkP1dKXnwMPNdog6s=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uBOM3sFUDqpyGUnBWNLGTyqAEJBqapk4qJMNPLS2BF7FkYvAfEFSCIJL4auKXd41qCESNKxWbq/Id1dUAYwe2ZDSqjgHxpUfd5IeJaQFne8jNL0j8sKE3PBfdE42wSiZkD2A+t5LpfHfVtkMDlNOtU4cVJskWFZFEjsdzKvq0So=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mIyII0ba; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mIyII0ba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764107808; x=1795643808;
  h=date:from:to:subject:message-id:mime-version;
  bh=rpb2wTIiM2OeH1tTuejY2UdC5uDkP1dKXnwMPNdog6s=;
  b=mIyII0baPJ8MTIN6Wd9R0K+S3YTiaEeojugYJSefMryHRbr8YG0xUnHZ
   XHNtRo4BOuCEqV9rl9tJ9Hh+eDhrEXvJZMkN764Pmjfiybu+4Oe+9irMd
   zhPVfxEnU00dZ44VfA+KzHd+m5pT6eU0vWBsm8PMoxsPXJaWIinC5e3JT
   inwqu8PrgUAzRlqY8zS7HagfmlBLhxCuRVv04uPaRmQZL0Z70x2U3mlZg
   qWkeSuTu+kLzZ7CyINuh3ebv4k1OM/pDD1ifP1SPcB490HA7JZ6PjduB4
   h2wL7TTt0l3XTAIVB+ZeV7adt7cyqfmtkwa98kItZUq+hZTd3Sod8ABIS
   Q==;
X-CSE-ConnectionGUID: UHHW9PnPQmeR2eGj2+mGPQ==
X-CSE-MsgGUID: oTiEsDqRQ8aciIXhyhOrFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11624"; a="65139576"
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="65139576"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2025 13:56:46 -0800
X-CSE-ConnectionGUID: CIeXmqCSRuGNbx5X0GvSRw==
X-CSE-MsgGUID: YfrrmTa8SjePLHt0ApfdxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,226,1758610800"; 
   d="scan'208";a="192659373"
Received: from igk-lkp-server01.igk.intel.com (HELO 1f7de368ad0d) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 25 Nov 2025 13:56:45 -0800
Received: from kbuild by 1f7de368ad0d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vO11f-000000000ZP-0xNj
	for oe-kbuild@lists.linux.dev;
	Tue, 25 Nov 2025 21:56:43 +0000
Date: Tue, 25 Nov 2025 22:56:29 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [djwong-xfs:iomap-fuse-prep 16/26] checkpatch: WARNING:SPACING:
 space prohibited between function name and open parenthesis '('
Message-ID: <202511252215.itMudboR-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git iomap-fuse-prep
head:   3f83b91c6f2ee77a9f0e471c30f0dd9b6e7f7a19
commit: 02252ad7d520cd06cd7f924e79c657a14aec5c4f [16/26] xfs: validate fds against running healthmon
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251125/202511252215.itMudboR-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:SPACING: space prohibited between function name and open parenthesis '('
#45: FILE: fs/xfs/libxfs/xfs_fs.h:1204:
+#define XFS_IOC_HEALTH_SAMEFS	_IOW ('X', 69, struct xfs_health_samefs)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
