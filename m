Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DD4F221569
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Mar 2025 16:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742661607; cv=none; b=RBgCkRrNbTLd6CRBEDwQlt2Tfh2lZUI80WuksJq81t4F1665Yc+yBuhjz85fIc6iSMvmas0Qs9K5ESapAM6nhsngOlsea7Fhh1Yu82W8NIL9hutNHxyl8sc05G2D0e2ApjOS582uD/Z5rgbu6gWagT9dR84jijMikJQ9h0xP67k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742661607; c=relaxed/simple;
	bh=2FHGboGxKwxnMFd52onvMeO2fKLBHU+ze+sbWFihEH8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OXKqtNlNMDiD1Fit4vGic8ft8OpsCn1sHLf9p8o80jY+FXdDo/v/i0DOOjpXuCcEvn5XAJVnFywuZtLIZsZMgMnJCyb3I5E8JleyqoeJKm5W/dF2PoYIRBWxc6CoGi0VCdFurghzvSWGKg5TJQA/ujh5DzuYz8ta27fZEBgQLQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E5/ye2H4; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E5/ye2H4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742661605; x=1774197605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2FHGboGxKwxnMFd52onvMeO2fKLBHU+ze+sbWFihEH8=;
  b=E5/ye2H4pyXMTSJ9N/ab/yDkyXMqJfgvjOICm/JmLyXluViNqRg63JoY
   ymLbK9xbFq5QHacFaZcv20O9eyuq5NMWlgL2YCuSrwmzNSwFSdJWzd28g
   3Gg9/rTW1uBgGeHKGNcFYtwTUvJDUmFw50NX/2wruV4+lsVHfXh4+wOJX
   cBOTWsauU2P41QMZBsbEgOTEqT8hTdZaGwAYE26ENcmCAIBhnqrmIqsNA
   Sd5sx621j3AoeK9c+oKZBTe3/xtYUVSWkemJJeJX0aifr49KZOmPFrKoP
   u38TTlMfYSigRp6RKSDCbpeqsf3V8yN1T1g8yNU/EVvRJZOp7R4rtbciN
   Q==;
X-CSE-ConnectionGUID: 0acUBhmrQEyDlgU5OXzaKg==
X-CSE-MsgGUID: wdfQOrnAT5Or6WFeGE1K5A==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="54544191"
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="54544191"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 09:40:04 -0700
X-CSE-ConnectionGUID: fKxJeFL1QLiWDMm+Vs5mJw==
X-CSE-MsgGUID: 7q+2Tj2FRR+AhJ4glQfAdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,267,1736841600"; 
   d="scan'208";a="124182873"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 22 Mar 2025 09:40:03 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw1sg-0002Ge-1e;
	Sat, 22 Mar 2025 16:39:31 +0000
Date: Sun, 23 Mar 2025 00:36:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1226:4-22: opportunity for
 str_true_false(ring -> use_doorbell)
Message-ID: <202503230032.wHuifrU2-lkp@intel.com>
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
TO: Likun Gao <Likun.Gao@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88d324e69ea9f3ae1c1905ea75d717c08bdb8e15
commit: b412351e91bde3a6ec546b598087bdc3fcc458ee drm/amdgpu: Add sdma v7_0 ip block support (v7)
date:   11 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 11 months ago
config: loongarch-randconfig-r064-20250322 (https://download.01.org/0day-ci/archive/20250323/202503230032.wHuifrU2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202503230032.wHuifrU2-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c:1226:4-22: opportunity for str_true_false(ring -> use_doorbell)

vim +1226 drivers/gpu/drm/amd/amdgpu/sdma_v7_0.c

b412351e91bde3 Likun Gao 2023-07-04  1205  
b412351e91bde3 Likun Gao 2023-07-04  1206  static int sdma_v7_0_sw_init(void *handle)
b412351e91bde3 Likun Gao 2023-07-04  1207  {
b412351e91bde3 Likun Gao 2023-07-04  1208  	struct amdgpu_ring *ring;
b412351e91bde3 Likun Gao 2023-07-04  1209  	int r, i;
b412351e91bde3 Likun Gao 2023-07-04  1210  	struct amdgpu_device *adev = (struct amdgpu_device *)handle;
b412351e91bde3 Likun Gao 2023-07-04  1211  
b412351e91bde3 Likun Gao 2023-07-04  1212  	/* SDMA trap event */
b412351e91bde3 Likun Gao 2023-07-04  1213  	r = amdgpu_irq_add_id(adev, SOC21_IH_CLIENTID_GFX,
b412351e91bde3 Likun Gao 2023-07-04  1214  			      GFX_11_0_0__SRCID__SDMA_TRAP,
b412351e91bde3 Likun Gao 2023-07-04  1215  			      &adev->sdma.trap_irq);
b412351e91bde3 Likun Gao 2023-07-04  1216  	if (r)
b412351e91bde3 Likun Gao 2023-07-04  1217  		return r;
b412351e91bde3 Likun Gao 2023-07-04  1218  
b412351e91bde3 Likun Gao 2023-07-04  1219  	for (i = 0; i < adev->sdma.num_instances; i++) {
b412351e91bde3 Likun Gao 2023-07-04  1220  		ring = &adev->sdma.instance[i].ring;
b412351e91bde3 Likun Gao 2023-07-04  1221  		ring->ring_obj = NULL;
b412351e91bde3 Likun Gao 2023-07-04  1222  		ring->use_doorbell = true;
b412351e91bde3 Likun Gao 2023-07-04  1223  		ring->me = i;
b412351e91bde3 Likun Gao 2023-07-04  1224  
b412351e91bde3 Likun Gao 2023-07-04  1225  		DRM_DEBUG("SDMA %d use_doorbell being set to: [%s]\n", i,
b412351e91bde3 Likun Gao 2023-07-04 @1226  				ring->use_doorbell?"true":"false");
b412351e91bde3 Likun Gao 2023-07-04  1227  
b412351e91bde3 Likun Gao 2023-07-04  1228  		ring->doorbell_index =
b412351e91bde3 Likun Gao 2023-07-04  1229  			(adev->doorbell_index.sdma_engine[i] << 1); // get DWORD offset
b412351e91bde3 Likun Gao 2023-07-04  1230  
b412351e91bde3 Likun Gao 2023-07-04  1231  		ring->vm_hub = AMDGPU_GFXHUB(0);
b412351e91bde3 Likun Gao 2023-07-04  1232  		sprintf(ring->name, "sdma%d", i);
b412351e91bde3 Likun Gao 2023-07-04  1233  		r = amdgpu_ring_init(adev, ring, 1024,
b412351e91bde3 Likun Gao 2023-07-04  1234  				     &adev->sdma.trap_irq,
b412351e91bde3 Likun Gao 2023-07-04  1235  				     AMDGPU_SDMA_IRQ_INSTANCE0 + i,
b412351e91bde3 Likun Gao 2023-07-04  1236  				     AMDGPU_RING_PRIO_DEFAULT, NULL);
b412351e91bde3 Likun Gao 2023-07-04  1237  		if (r)
b412351e91bde3 Likun Gao 2023-07-04  1238  			return r;
b412351e91bde3 Likun Gao 2023-07-04  1239  	}
b412351e91bde3 Likun Gao 2023-07-04  1240  
b412351e91bde3 Likun Gao 2023-07-04  1241  	return r;
b412351e91bde3 Likun Gao 2023-07-04  1242  }
b412351e91bde3 Likun Gao 2023-07-04  1243  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
