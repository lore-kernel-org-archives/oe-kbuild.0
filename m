Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA933211A35
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Jul 2025 20:45:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752525919; cv=none; b=HId28OlgcE8ZJaAcbOyAfj3toD8Vl2BpMiNPZ+pm0r49JmVSxrha07lrKO7e6AA0rYtCAoBjGpFFTBsAlsevNFJ3l/nFjVzo647YPFzq8TggB/V0SyUKqXxxEzkp71rbDE2s2ev359EbGykDEARke6WwXLUYbEyk/ObjKgRTgnw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752525919; c=relaxed/simple;
	bh=trg3FMMM7OJn8q/YpCiGD88Cw42ZL9cBSGhyT4eTZyY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HGagwwx/XQsD6aOMT+BfB7NsZrexoxSQkSznpEpRgQ+xKS/o/CdktvHUhYImJ+MjFwGz9W36fJniS7WU12Vtj1aZtP+9MMmkSFD/QQCYS3TzYtr6aHHdPZ2p+KsZoJAiOA8PfZ998/I0pcw/E6HFLolgM7s42nGQQeSrtddneMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jej6C2zY; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jej6C2zY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752525916; x=1784061916;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=trg3FMMM7OJn8q/YpCiGD88Cw42ZL9cBSGhyT4eTZyY=;
  b=jej6C2zYsO6R4aCL6p+pMCWrU1xQexen2WbHoGz5Snfg/6Ad5GWuFHRZ
   KRcJS8RV6+sCVjNVJ1DHd5BnGSFbAV6GXJkQj+IRs4Qjwb1i7d/mkUMlC
   bLbLFACz9iCBv1CcyLl+N1kP3I5r31ig/+FcAmrp95S8bXi+PJ/0TGFG9
   HHwrcu2fVjwq5T0V+iSHjWD7Y3MISAJh71LPcpHLf3dkrPc4YDYYrsAMJ
   YOl/03stUb43VxsfJp9J8On7AsoZ4/UTtXPUb4RLUXElfyvJXNP6z4Bb0
   bYiOctIsuZaO+CIWRcQbG5mFAZD1XulN/GRH7KetsEUtEkyyxwkAgmrXY
   A==;
X-CSE-ConnectionGUID: Iy5pH+E4TsS+VgiaIae0rw==
X-CSE-MsgGUID: vxDfF2OLTtCYFlWJCvNsJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="65797823"
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="65797823"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jul 2025 13:45:14 -0700
X-CSE-ConnectionGUID: FquRt2m8T9qvigMs7NauzA==
X-CSE-MsgGUID: cZv6fcYPTnOCr1YovozseA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,312,1744095600"; 
   d="scan'208";a="157539716"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Jul 2025 13:45:14 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ubQ2y-0009KZ-0L;
	Mon, 14 Jul 2025 20:45:12 +0000
Date: Tue, 15 Jul 2025 04:44:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [robh:imx93-ethos-v2 2/3] drivers/accel/ethos/ethos_gem.c:224
 ethos_gem_cmdstream_create() warn: argument 3 to %llx specifier is cast from
 pointer
Message-ID: <202507150429.NyHxZspi-lkp@intel.com>
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
TO: "Rob Herring (Arm)" <robh@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git imx93-ethos-v2
head:   f2fd4883d04c3245bc2fdd061078823b49709c68
commit: 18fbf33e2b12d61167868142a4b47c598e9442f2 [2/3] accel: Add initial Arm Ethos driver
:::::: branch date: 5 days ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-r073-20250714 (https://download.01.org/0day-ci/archive/20250715/202507150429.NyHxZspi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202507150429.NyHxZspi-lkp@intel.com/

New smatch warnings:
drivers/accel/ethos/ethos_gem.c:224 ethos_gem_cmdstream_create() warn: argument 3 to %llx specifier is cast from pointer

Old smatch warnings:
drivers/accel/ethos/ethos_gem.c:142 ethos_gem_cmdstream_validate() warn: statement has no effect 'u64'
drivers/accel/ethos/ethos_gem.c:162 ethos_gem_cmdstream_validate() warn: right shifting more than type allows 16 vs 25

vim +224 drivers/accel/ethos/ethos_gem.c

18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  196) 
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  197) /**
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  198)  * ethos_gem_cmdstream_create() - Create a GEM object and attach it to a handle.
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  199)  * @file: DRM file.
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  200)  * @ddev: DRM device.
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  201)  * @exclusive_vm: Exclusive VM. Not NULL if the GEM object can't be shared.
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  202)  * @size: Size of the GEM object to allocate.
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  203)  * @flags: Combination of drm_ethos_bo_flags flags.
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  204)  * @handle: Pointer holding the handle pointing to the new GEM object.
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  205)  *
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  206)  * Return: Zero on success
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  207)  */
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  208) int
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  209) ethos_gem_cmdstream_create(struct drm_file *file,
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  210) 			       struct drm_device *ddev,
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  211) 			       u32 *size, u64 data, u32 flags, u32 *handle)
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  212) {
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  213) 	int ret;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  214) 	struct drm_gem_dma_object *mem;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  215) 	struct ethos_gem_object *bo;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  216) 
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  217) 	dev_info(ddev->dev, "creating cmd BO\n");
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  218) 	mem = drm_gem_dma_create(ddev, *size);
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  219) 	if (IS_ERR(mem))
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  220) 		return PTR_ERR(mem);
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  221) 
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  222) 	bo = to_ethos_bo(&mem->base);
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29  223) 	bo->flags = flags;
18fbf33e2b12d6 Rob Herring (Arm  2025-05-29 @224) 	dev_info(ddev->dev, "created cmd BO at %llx\n", (u64)bo->base.vaddr);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
