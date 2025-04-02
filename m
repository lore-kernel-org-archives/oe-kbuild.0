Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6309A2080DD
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Apr 2025 07:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743578692; cv=none; b=S3+dDCweD+BSZ8uhP+tf0n/AjsbYj3gvF+H32zcU9tOtd2oPkzK2LaspNFw6HwkN2pKU2j4YIHcYtKQ5AwtnS4tLijkC/jt60xlLFgro3aF28eyAHwb66EDzuTmjcI8IUdIAw1E4KhRI0xng8B/ktfHz+DpKyNJ3PF8tHN1Z3EE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743578692; c=relaxed/simple;
	bh=P/yR6fEAdZ7D6WMfLOT8h4AI7Zybtn/KhBsOuxFTarM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=usWrA02RYwClZ2o9BiuelFIcFjtIXrWPbbmx/BIS5alP0O82GsztgpJjPM2olnxMeEw4hUB9ijgRtyBMXeCEp6oJVeVpeIlCsh1hp7y4YVFcdGlvTFV9D9lxqmQxrji/hRQs8znrpJLaP1XEld9J9/wV50GO8VIk6lRGiBqaTrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b20lrBfj; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b20lrBfj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743578690; x=1775114690;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=P/yR6fEAdZ7D6WMfLOT8h4AI7Zybtn/KhBsOuxFTarM=;
  b=b20lrBfj/JziJozazsqCliJ2u81tkeGVfg4/n3tSOwGGZDBIk7qCWYnR
   bGtTRgFAgeboI1krxlhlC64/2mRwupFax0pVKtohyUR3JKHl+yqhM0pwo
   3tHM69SqDCmruF0faxfCSNYAmW4onl422itv/v/Tqc0HCois0Hz1srIaC
   cvj+sUHQzQz4lvqLhtQDFSiEvdUcDgnR/ql9InKtw5FRdYE7+WKAy4l59
   K+mBs8IgGtCg7/Vn5dZruiUL6CEK+iC2iMGn2vv7/yOcjyEsN1Eoxbk3B
   Y48N6cXFErRV1p95mUea0mp90myNeC0EuxdCjsKFjSFaZoKcFttG0U2JU
   w==;
X-CSE-ConnectionGUID: cp4HzSulQ6OGUEvi7vWHrg==
X-CSE-MsgGUID: D5UI1+laTmqTLnXqR1u+vA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="48594946"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="48594946"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2025 00:24:46 -0700
X-CSE-ConnectionGUID: laY9OvZVS3axIMV65tpiDQ==
X-CSE-MsgGUID: wU+DHUGTTIC2BIiqN2PnTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="157603287"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 02 Apr 2025 00:24:45 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tzsSp-000AXL-04;
	Wed, 02 Apr 2025 07:24:43 +0000
Date: Wed, 2 Apr 2025 15:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error:
 uninitialized symbol 'ret'.
Message-ID: <202504021500.3AM1hKKS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Maíra Canal" <mcanal@igalia.com>
CC: Melissa Wen <mwen@igalia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   acc4d5ff0b61eb1715c498b6536c38c1feb7f3c1
commit: 04630796c437a9285643097825cbd3cd06603f47 drm/vc4: Use DRM Execution Contexts
date:   2 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 2 months ago
config: arm64-randconfig-r073-20250402 (https://download.01.org/0day-ci/archive/20250402/202504021500.3AM1hKKS-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: uninitialized symbol 'ret'.

vim +/ret +604 drivers/gpu/drm/vc4/vc4_gem.c

cdec4d3613230f Eric Anholt 2017-04-12  581  
cdec4d3613230f Eric Anholt 2017-04-12  582  /* Takes the reservation lock on all the BOs being referenced, so that
cdec4d3613230f Eric Anholt 2017-04-12  583   * at queue submit time we can update the reservations.
cdec4d3613230f Eric Anholt 2017-04-12  584   *
cdec4d3613230f Eric Anholt 2017-04-12  585   * We don't lock the RCL the tile alloc/state BOs, or overflow memory
cdec4d3613230f Eric Anholt 2017-04-12  586   * (all of which are on exec->unref_list).  They're entirely private
cdec4d3613230f Eric Anholt 2017-04-12  587   * to vc4, so we don't attach dma-buf fences to them.
cdec4d3613230f Eric Anholt 2017-04-12  588   */
cdec4d3613230f Eric Anholt 2017-04-12  589  static int
04630796c437a9 Maíra Canal 2024-12-20  590  vc4_lock_bo_reservations(struct vc4_exec_info *exec,
04630796c437a9 Maíra Canal 2024-12-20  591  			 struct drm_exec *exec_ctx)
cdec4d3613230f Eric Anholt 2017-04-12  592  {
04630796c437a9 Maíra Canal 2024-12-20  593  	int ret;
cdec4d3613230f Eric Anholt 2017-04-12  594  
cdec4d3613230f Eric Anholt 2017-04-12  595  	/* Reserve space for our shared (read-only) fence references,
cdec4d3613230f Eric Anholt 2017-04-12  596  	 * before we commit the CL to the hardware.
cdec4d3613230f Eric Anholt 2017-04-12  597  	 */
04630796c437a9 Maíra Canal 2024-12-20  598  	drm_exec_init(exec_ctx, DRM_EXEC_INTERRUPTIBLE_WAIT, exec->bo_count);
04630796c437a9 Maíra Canal 2024-12-20  599  	drm_exec_until_all_locked(exec_ctx) {
04630796c437a9 Maíra Canal 2024-12-20  600  		ret = drm_exec_prepare_array(exec_ctx, exec->bo,
04630796c437a9 Maíra Canal 2024-12-20  601  					     exec->bo_count, 1);
04630796c437a9 Maíra Canal 2024-12-20  602  	}
cdec4d3613230f Eric Anholt 2017-04-12  603  
cdec4d3613230f Eric Anholt 2017-04-12 @604  	if (ret) {
04630796c437a9 Maíra Canal 2024-12-20  605  		drm_exec_fini(exec_ctx);
cdec4d3613230f Eric Anholt 2017-04-12  606  		return ret;
7edabee06a5622 Eric Anholt 2016-09-27  607  	}
d5b1a78a772f1e Eric Anholt 2015-11-30  608  
cdec4d3613230f Eric Anholt 2017-04-12  609  	return 0;
cdec4d3613230f Eric Anholt 2017-04-12  610  }
cdec4d3613230f Eric Anholt 2017-04-12  611  

:::::: The code at line 604 was first introduced by commit
:::::: cdec4d3613230fc15723fae206cb17825b914cee drm/vc4: Expose dma-buf fences for V3D rendering.

:::::: TO: Eric Anholt <eric@anholt.net>
:::::: CC: Eric Anholt <eric@anholt.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
