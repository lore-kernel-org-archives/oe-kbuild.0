Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B6B1F4615
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 12:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742646723; cv=none; b=a2UHCWiqZgixE/xmRMT4QG8TCd5HmrCeZ6ZIrBCnFruQTM/JAMs4GviEx7c+dbghZ4h1+o3cXpR7oOAb2dQYVosrcLf1MMNvfSKh7HHxsztxBwvWzZQhPGGaHqXwZVTZ6CuIL8AZDqvWQ+KpUSq+s2flLvMoLv1qHorqkFCXyWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742646723; c=relaxed/simple;
	bh=5WDk4DZ0DEQBP7iLpWrKczOWQaPs5ZxTZQrC9fRSDoM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UINrEVaP9TTGss4febQwclKSEr4mPFA/KQCh7KztYOpVLxay1elgLB3+NRfTm70tG1qrPPvIRF6ae3xAwPZXPIURVBmZq8dbNWll6VpLpu5NVda0Hv8X5nNDvvQfei3VFRHN0wsQ79uFcFt4PEGmkX5Gg1vtEdMtc83A/fpdUK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWOWhpVh; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWOWhpVh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742646721; x=1774182721;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5WDk4DZ0DEQBP7iLpWrKczOWQaPs5ZxTZQrC9fRSDoM=;
  b=fWOWhpVh1O8nCxcEPkOUBtFN+OgV4YIuw/HyDL/qa24nwR0+s03fJUFR
   danr9MiSAEq4VqCqXMyEq7srcYRZPeCEzwmJdf6qCSzO9KQtQ0s/gu4oa
   4sCF2jICJQtVQhu81fV38csWaD/XqT4QKtSvv7W0ApZuNd5KwAnv+DEuc
   2NPzt0LltZ2GEM28TTex4KkqtuDHHS1iUBCkQkt+TWnD1AnQ2AE9EMrqP
   c8/9FvFRXnrMjxoj5M19BYCt0dE15cZ+ZeRLBjkTqa8cJTl5Nb493exao
   bE2bbcGPVGjyLcXNeRQ3ILWHGF+M/F7aRTpgmKxEAvSZ1aL3gGouIHcx8
   g==;
X-CSE-ConnectionGUID: mSLQcGYDQE2iMDIJBVb3Mw==
X-CSE-MsgGUID: uzzJZ7ZdSuWoRPABET3/3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="69254416"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="69254416"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 05:31:57 -0700
X-CSE-ConnectionGUID: Oar284rYRJOMKPq3kv0HqQ==
X-CSE-MsgGUID: JR7n489DQH6ANr4IL0v55Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="123437047"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 Mar 2025 05:31:56 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tvy13-00028v-39;
	Sat, 22 Mar 2025 12:31:53 +0000
Date: Sat, 22 Mar 2025 20:31:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:311:49-70: opportunity for
 str_true_false(vpe -> collaborate_mode)
Message-ID: <202503222049.sUXL3q6w-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Lang Yu <Lang.Yu@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88d324e69ea9f3ae1c1905ea75d717c08bdb8e15
commit: f9070b0f2f9edb503b20b12782d4d601cafc6d5e drm/amdgpu/vpe: add VPE 6.1.1 support
date:   1 year ago
:::::: branch date: 15 hours ago
:::::: commit date: 1 year ago
config: loongarch-randconfig-r064-20250322 (https://download.01.org/0day-ci/archive/20250322/202503222049.sUXL3q6w-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503222049.sUXL3q6w-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c:311:49-70: opportunity for str_true_false(vpe -> collaborate_mode)

vim +311 drivers/gpu/drm/amd/amdgpu/amdgpu_vpe.c

9d4346bdbc6484 Lang Yu    2022-05-23  290  
9d4346bdbc6484 Lang Yu    2022-05-23  291  static int vpe_early_init(void *handle)
9d4346bdbc6484 Lang Yu    2022-05-23  292  {
9d4346bdbc6484 Lang Yu    2022-05-23  293  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
9d4346bdbc6484 Lang Yu    2022-05-23  294  	struct amdgpu_vpe *vpe = &adev->vpe;
9d4346bdbc6484 Lang Yu    2022-05-23  295  
4e8303cf2c4dd2 Lijo Lazar 2023-09-11  296  	switch (amdgpu_ip_version(adev, VPE_HWIP, 0)) {
9d4346bdbc6484 Lang Yu    2022-05-23  297  	case IP_VERSION(6, 1, 0):
9d4346bdbc6484 Lang Yu    2022-05-23  298  		vpe_v6_1_set_funcs(vpe);
9d4346bdbc6484 Lang Yu    2022-05-23  299  		break;
f9070b0f2f9edb Lang Yu    2023-11-15  300  	case IP_VERSION(6, 1, 1):
f9070b0f2f9edb Lang Yu    2023-11-15  301  		vpe_v6_1_set_funcs(vpe);
f9070b0f2f9edb Lang Yu    2023-11-15  302  		vpe->collaborate_mode = true;
f9070b0f2f9edb Lang Yu    2023-11-15  303  		break;
9d4346bdbc6484 Lang Yu    2022-05-23  304  	default:
9d4346bdbc6484 Lang Yu    2022-05-23  305  		return -EINVAL;
9d4346bdbc6484 Lang Yu    2022-05-23  306  	}
9d4346bdbc6484 Lang Yu    2022-05-23  307  
9d4346bdbc6484 Lang Yu    2022-05-23  308  	vpe_set_ring_funcs(adev);
9d4346bdbc6484 Lang Yu    2022-05-23  309  	vpe_set_regs(vpe);
9d4346bdbc6484 Lang Yu    2022-05-23  310  
f9070b0f2f9edb Lang Yu    2023-11-15 @311  	dev_info(adev->dev, "VPE: collaborate mode %s", vpe->collaborate_mode ? "true" : "false");
f9070b0f2f9edb Lang Yu    2023-11-15  312  
9d4346bdbc6484 Lang Yu    2022-05-23  313  	return 0;
9d4346bdbc6484 Lang Yu    2022-05-23  314  }
9d4346bdbc6484 Lang Yu    2022-05-23  315  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
