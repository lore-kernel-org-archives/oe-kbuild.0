Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0A5027462
	for <oe-kbuild@lists.linux.dev>; Wed, 17 Dec 2025 05:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765947745; cv=none; b=JR7gs8Af8NVJFc24qGwRpSI5JjhEummuJwryjtYK39cCfT9D/dyGbIHYnudmJjOJaFGxRmYLJ0qnwPn6wYJsldYNa2wyDnXSoOF4p+dWW5XbepnBNl1PtS41KsV9ssnxpzPa6e27oOcO/C2IjG9iTOKs692pCGONYT27DMMnuxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765947745; c=relaxed/simple;
	bh=AHDgQlvn0EaXvVV0PZYUr5CKuX7TnAjIi0dit6GjeDc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f9qUw+YBsLMyaK/OFBnDKowDKk4YhSiNOCbN30jCx0XokMcpwkW7ZhxF7Vv2FhaKgHfsjF76f8cjtBC/ClCPtQGCetgr8maO6RSKTm/emEfNQih08BG9+cUXzomZhfMkBsxEMUz9VCZCKcA5RmVGQjEoxAZI9zOYgejesELPN5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nzmRbPlt; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nzmRbPlt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765947744; x=1797483744;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AHDgQlvn0EaXvVV0PZYUr5CKuX7TnAjIi0dit6GjeDc=;
  b=nzmRbPltCeNnbF5pIplVgATm9qCFYj1ItTykXH9KAdJxmnbk68XLtSkQ
   DezHX+UGeGhkASGL8LxUduZYN569aCaMpcSoTyk2BSLbSs0gB61fXcjRT
   +FEkr1r2UnIZWWISICHxGKURB0hvYiqvThQovKIXO5ufnaxwO7q5fqKdV
   ShiJ3kmft/EoZmrxtGp7N8GZMXghwbSovyqBBXOGubUOZuPdb8owH+ubL
   kbNnbMkecdwXxQPE38Pe1wPVYmhMmbvX084LtmdqJPKjqoNA9rmuvFAUS
   kamDMzriVy1sGZwudQFuZviAD6Rh5UEcKlKUmjXWiI9oRTRB+lFEnsCqp
   w==;
X-CSE-ConnectionGUID: 68ZJVGUHRLiwop3rmqAHwg==
X-CSE-MsgGUID: L4vTi33oRpidWyiyKBuq+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="93351721"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="93351721"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 21:02:23 -0800
X-CSE-ConnectionGUID: x5bWHBwGTCOES+oucK2WgQ==
X-CSE-MsgGUID: dRyhZ/d0TbmRGSeBjvQJeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; 
   d="scan'208";a="202398920"
Received: from lkp-server02.sh.intel.com (HELO 034c7e8e53c3) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 16 Dec 2025 21:02:22 -0800
Received: from kbuild by 034c7e8e53c3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vVjg2-000000004Cp-386C;
	Wed, 17 Dec 2025 05:02:18 +0000
Date: Wed, 17 Dec 2025 13:01:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1046/2012] drivers/gpu/drm/xe/xe_device.c:843
 detect_preproduction_hw() error: uninitialized symbol 'gt'.
Message-ID: <202512171231.zKRabudz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Matt Roper <matthew.d.roper@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   12b95d29eb979e5c4f4f31bb05817bc935c52050
commit: 7ef2d25e477368bbd5c32e2265210e55644fdd48 [1046/2012] drm/xe: Track pre-production workaround support
:::::: branch date: 2 hours ago
:::::: commit date: 4 days ago
config: i386-randconfig-r073-20251216 (https://download.01.org/0day-ci/archive/20251217/202512171231.zKRabudz-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512171231.zKRabudz-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/xe/xe_device.c:843 detect_preproduction_hw() error: uninitialized symbol 'gt'.

vim +/gt +843 drivers/gpu/drm/xe/xe_device.c

4cb12b71923b6e Himal Prasad Ghimiray 2023-12-12  806  
7ef2d25e477368 Matt Roper            2025-12-12  807  /*
7ef2d25e477368 Matt Roper            2025-12-12  808   * Detect if the driver is being run on pre-production hardware.  We don't
7ef2d25e477368 Matt Roper            2025-12-12  809   * keep workarounds for pre-production hardware long term, so print an
7ef2d25e477368 Matt Roper            2025-12-12  810   * error and add taint if we're being loaded on a pre-production platform
7ef2d25e477368 Matt Roper            2025-12-12  811   * for which the pre-prod workarounds have already been removed.
7ef2d25e477368 Matt Roper            2025-12-12  812   *
7ef2d25e477368 Matt Roper            2025-12-12  813   * The general policy is that we'll remove any workarounds that only apply to
7ef2d25e477368 Matt Roper            2025-12-12  814   * pre-production hardware around the time force_probe restrictions are lifted
7ef2d25e477368 Matt Roper            2025-12-12  815   * for a platform of the next major IP generation (for example, Xe2 pre-prod
7ef2d25e477368 Matt Roper            2025-12-12  816   * workarounds should be removed around the time the first Xe3 platforms have
7ef2d25e477368 Matt Roper            2025-12-12  817   * force_probe lifted).
7ef2d25e477368 Matt Roper            2025-12-12  818   */
7ef2d25e477368 Matt Roper            2025-12-12  819  static void detect_preproduction_hw(struct xe_device *xe)
7ef2d25e477368 Matt Roper            2025-12-12  820  {
7ef2d25e477368 Matt Roper            2025-12-12  821  	struct xe_gt *gt;
7ef2d25e477368 Matt Roper            2025-12-12  822  	int id;
7ef2d25e477368 Matt Roper            2025-12-12  823  
7ef2d25e477368 Matt Roper            2025-12-12  824  	/*
7ef2d25e477368 Matt Roper            2025-12-12  825  	 * SR-IOV VFs don't have access to the FUSE2 register, so we can't
7ef2d25e477368 Matt Roper            2025-12-12  826  	 * check pre-production status there.  But the host OS will notice
7ef2d25e477368 Matt Roper            2025-12-12  827  	 * and report the pre-production status, which should be enough to
7ef2d25e477368 Matt Roper            2025-12-12  828  	 * help us catch mistaken use of pre-production hardware.
7ef2d25e477368 Matt Roper            2025-12-12  829  	 */
7ef2d25e477368 Matt Roper            2025-12-12  830  	if (IS_SRIOV_VF(xe))
7ef2d25e477368 Matt Roper            2025-12-12  831  		return;
7ef2d25e477368 Matt Roper            2025-12-12  832  
7ef2d25e477368 Matt Roper            2025-12-12  833  	/*
7ef2d25e477368 Matt Roper            2025-12-12  834  	 * The "SW_CAP" fuse contains a bit indicating whether the device is a
7ef2d25e477368 Matt Roper            2025-12-12  835  	 * production or pre-production device.  This fuse is reflected through
7ef2d25e477368 Matt Roper            2025-12-12  836  	 * the GT "FUSE2" register, even though the contents of the fuse are
7ef2d25e477368 Matt Roper            2025-12-12  837  	 * not GT-specific.  Every GT's reflection of this fuse should show the
7ef2d25e477368 Matt Roper            2025-12-12  838  	 * same value, so we'll just use the first available GT for lookup.
7ef2d25e477368 Matt Roper            2025-12-12  839  	 */
7ef2d25e477368 Matt Roper            2025-12-12  840  	for_each_gt(gt, xe, id)
7ef2d25e477368 Matt Roper            2025-12-12  841  		break;
7ef2d25e477368 Matt Roper            2025-12-12  842  
7ef2d25e477368 Matt Roper            2025-12-12 @843  	if (!gt)
7ef2d25e477368 Matt Roper            2025-12-12  844  		return;
7ef2d25e477368 Matt Roper            2025-12-12  845  
7ef2d25e477368 Matt Roper            2025-12-12  846  	CLASS(xe_force_wake, fw_ref)(gt_to_fw(gt), XE_FW_GT);
7ef2d25e477368 Matt Roper            2025-12-12  847  	if (!xe_force_wake_ref_has_domain(fw_ref.domains, XE_FW_GT)) {
7ef2d25e477368 Matt Roper            2025-12-12  848  		xe_gt_err(gt, "Forcewake failure; cannot determine production/pre-production hw status.\n");
7ef2d25e477368 Matt Roper            2025-12-12  849  		return;
7ef2d25e477368 Matt Roper            2025-12-12  850  	}
7ef2d25e477368 Matt Roper            2025-12-12  851  
7ef2d25e477368 Matt Roper            2025-12-12  852  	if (xe_mmio_read32(&gt->mmio, FUSE2) & PRODUCTION_HW)
7ef2d25e477368 Matt Roper            2025-12-12  853  		return;
7ef2d25e477368 Matt Roper            2025-12-12  854  
7ef2d25e477368 Matt Roper            2025-12-12  855  	xe_info(xe, "Pre-production hardware detected.\n");
7ef2d25e477368 Matt Roper            2025-12-12  856  	if (!xe->info.has_pre_prod_wa) {
7ef2d25e477368 Matt Roper            2025-12-12  857  		xe_err(xe, "Pre-production workarounds for this platform have already been removed.\n");
7ef2d25e477368 Matt Roper            2025-12-12  858  		add_taint(TAINT_MACHINE_CHECK, LOCKDEP_STILL_OK);
7ef2d25e477368 Matt Roper            2025-12-12  859  	}
7ef2d25e477368 Matt Roper            2025-12-12  860  }
7ef2d25e477368 Matt Roper            2025-12-12  861  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
