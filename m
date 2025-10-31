Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B551F2C34
	for <oe-kbuild@lists.linux.dev>; Fri, 31 Oct 2025 10:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761907374; cv=none; b=uKBDiqLD3MuaZYRNg0d7oHUiM59wDgBpOOmT2eB0Dxyc7fQHOjFw2mR331QH+lQVzTonkbZzBdwwQCUDDSrNQUGMbrRr79gxgEvuAViijOkb/74c6e6uWrwPDYwqcFJCVD3zSAtiQuWJKa9aupylDJkS0CgU84nz4sjEKwuen+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761907374; c=relaxed/simple;
	bh=L9GqcNtSNDZ0CK59BULU2JH/MfIR3nCn+hl4EVaYlTI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q0rhNJGBDl88bxO4a7fqdq8uoJSBGz4LFGntyj72vKqPY6OqUFwRfAhp13kUS6fo6x6z2MSPqNUkvnVTwpaalEZi9OTZL2DovXRMVJZhJsDoDjPa6l9GwKiP7JM+Yd4S2tJmegT0Jl2kQbi57y7NLlrCDhsyf9qZjtUndgNN6fY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gNDSvVd0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gNDSvVd0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761907373; x=1793443373;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=L9GqcNtSNDZ0CK59BULU2JH/MfIR3nCn+hl4EVaYlTI=;
  b=gNDSvVd0f4RDgU1o728ih3AsujvZ075cOTXfZWAT6tQZTTzJhhhsO0j9
   ZEeiOyDtqqWhf61RTMxtlNwedeOTeeUfJNrGPlxgoLWkE7yF3ykOmdwki
   F72Sb0LYlt/bFog5sYDYkG2PtDRmM1SCSpT0vjpg4/cpO5I42IGR7/oFP
   5TJZ+u5eat3WA1HMJ8DWVF9dXiIJ5pc0D9PbNiDfO1ZpHSJmCMeCyJ37A
   5xbEfgdEuMe1NGuhLC1J1xmoJXi20Hp1K9HrCL1LBTjKki5UyaytAK6lv
   k9TPc0vPq4FaxkF8+rAMMUUq34Fomk/0y6zp1CWvvw3WkoAHwIMf3d0Js
   A==;
X-CSE-ConnectionGUID: PcQj+0IyQFqcNEiACwyZBg==
X-CSE-MsgGUID: 88V/SwJTRCub2lehd4r4Hw==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="67721909"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="67721909"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 03:42:52 -0700
X-CSE-ConnectionGUID: sX4ognvPSCmlqKmSCCOFjQ==
X-CSE-MsgGUID: aqXvbj1jTiemgkYhhKapww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="190555339"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2025 03:42:50 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEmZu-000N0e-1P;
	Fri, 31 Oct 2025 10:42:05 +0000
Date: Fri, 31 Oct 2025 18:41:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v1] drm/amdgpu: lock bo before calling
 amdgpu_vm_bo_update_shared
Message-ID: <202510311816.XMFlqAQY-lkp@intel.com>
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
In-Reply-To: <20251028130906.6029-1-pierre-eric.pelloux-prayer@amd.com>
References: <20251028130906.6029-1-pierre-eric.pelloux-prayer@amd.com>
TO: "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
TO: Alex Deucher <alexander.deucher@amd.com>
TO: "Christian König" <christian.koenig@amd.com>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
CC: "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: amd-gfx@lists.freedesktop.org
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org

Hi Pierre-Eric,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm/drm-next]
[also build test WARNING on drm-exynos/exynos-drm-next drm-intel/for-linux-next drm-intel/for-linux-next-fixes drm-misc/drm-misc-next drm-tip/drm-tip linus/master v6.18-rc3 next-20251030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pierre-Eric-Pelloux-Prayer/drm-amdgpu-lock-bo-before-calling-amdgpu_vm_bo_update_shared/20251028-211046
base:   git://anongit.freedesktop.org/drm/drm drm-next
patch link:    https://lore.kernel.org/r/20251028130906.6029-1-pierre-eric.pelloux-prayer%40amd.com
patch subject: [PATCH v1] drm/amdgpu: lock bo before calling amdgpu_vm_bo_update_shared
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-r071-20251031 (https://download.01.org/0day-ci/archive/20251031/202510311816.XMFlqAQY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510311816.XMFlqAQY-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c:98 amdgpu_dma_buf_attach() warn: inconsistent returns 'bo->tbo.base.resv'.

vim +98 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c

a92741e72f91b9 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Felix Kuehling             2025-04-16   68  
baca30fabdc9ba drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer              2018-05-29   69  /**
6e6db2722c2871 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König            2018-05-30   70   * amdgpu_dma_buf_attach - &dma_buf_ops.attach implementation
baca30fabdc9ba drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer              2018-05-29   71   *
6e6db2722c2871 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König            2018-05-30   72   * @dmabuf: DMA-buf where we attach to
6e6db2722c2871 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König            2018-05-30   73   * @attach: attachment to add
baca30fabdc9ba drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer              2018-05-29   74   *
6e6db2722c2871 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König            2018-05-30   75   * Add the attachment as user to the exported DMA-buf.
baca30fabdc9ba drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Michel Dänzer              2018-05-29   76   */
6e6db2722c2871 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König            2018-05-30   77  static int amdgpu_dma_buf_attach(struct dma_buf *dmabuf,
5a13761fa68306 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König            2018-02-16   78  				 struct dma_buf_attachment *attach)
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher               2015-04-20   79  {
a92741e72f91b9 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Felix Kuehling             2025-04-16   80  	struct amdgpu_device *attach_adev = dma_buf_attach_adev(attach);
6e6db2722c2871 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König            2018-05-30   81  	struct drm_gem_object *obj = dmabuf->priv;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher               2015-04-20   82  	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
2333bf9ad960eb drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Christian König            2018-03-21   83  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
cf4f0c32099d00 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Pierre-Eric Pelloux-Prayer 2025-10-28   84  	int r;
d38ceaf99ed015 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Alex Deucher               2015-04-20   85  
a92741e72f91b9 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Felix Kuehling             2025-04-16   86  	if (!amdgpu_dmabuf_is_xgmi_accessible(attach_adev, bo) &&
a92741e72f91b9 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Felix Kuehling             2025-04-16   87  	    pci_p2pdma_distance(adev->pdev, attach->dev, false) < 0)
48262cd9499c9c drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König            2018-03-23   88  		attach->peer2peer = false;
48262cd9499c9c drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König            2018-03-23   89  
cf4f0c32099d00 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Pierre-Eric Pelloux-Prayer 2025-10-28   90  	r = dma_resv_lock(bo->tbo.base.resv, NULL);
cf4f0c32099d00 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Pierre-Eric Pelloux-Prayer 2025-10-28   91  	if (r)
cf4f0c32099d00 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Pierre-Eric Pelloux-Prayer 2025-10-28   92  		return r;
cf4f0c32099d00 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Pierre-Eric Pelloux-Prayer 2025-10-28   93  
74ef9527bd87ea drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Yunxiang Li                2024-12-19   94  	amdgpu_vm_bo_update_shared(bo);
74ef9527bd87ea drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Yunxiang Li                2024-12-19   95  
cf4f0c32099d00 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Pierre-Eric Pelloux-Prayer 2025-10-28   96  	dma_resv_unlock(bo->tbo.base.resv);
cf4f0c32099d00 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Pierre-Eric Pelloux-Prayer 2025-10-28   97  
6e6db2722c2871 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c Christian König            2018-05-30  @98  	return 0;
8e94a46c177088 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Mario Kleiner              2016-11-09   99  }
8e94a46c177088 drivers/gpu/drm/amd/amdgpu/amdgpu_prime.c   Mario Kleiner              2016-11-09  100  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
