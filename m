Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758553B3BF1
	for <oe-kbuild@lists.linux.dev>; Fri,  3 Jul 2026 09:44:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783071858; cv=none; b=MIXnjBpz2QeVazyziaT7bN8ddni2heqeEOEH9OgIUBXOqk6CqcUwmYl6UNWwAlmHhOV+a4MTmRP0Bc4mmWcY79TOKe3ZwqoO2DMyt7GA1PVfPS7iX8R1gX8uh5MbdtURtL+dt2uXhaod63IQuUXw4RDzMvwsIihn2amCzYWgtB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783071858; c=relaxed/simple;
	bh=3WmUeN6bpj4lW/H3gsahfFubcfqMz6i9Xvs+9FlwPHo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=nXgFgAUW5g0dXk4QUm7rjDRg0oMubvffuF7rhd1omALmsRTfSYR8of4OUvpsZPbH4dhjMlA62iXvw0jq3jpR7tZfD19x0FvuUBkfqn8Jys1pfZ8CvY8SAAXWA+1FIiYDnbpUpQhcpZMNaheD0wdQyrY8++wmtnVK3JWh3LMzsKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J6xiaFau; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J6xiaFau"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783071855; x=1814607855;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=3WmUeN6bpj4lW/H3gsahfFubcfqMz6i9Xvs+9FlwPHo=;
  b=J6xiaFaul5p4m2CAup7fLzP+7YV8ex3gZFRHkCg7QVpct67RUstMVZiM
   QZl2AVBC3Nt22q3TjsD8WO/6IXgKczdmRJF+PPO2qjpx/KSEEfA6mnXf+
   BU5Snz3I0wyvQbCJNqERQC+9qk4YsgobG1ufDzctnfX5dOCZTWL0Mt2K/
   x2ohZxyJy+80hSYcPdcZtjPPsU+O9A7/7mYE67OwD8DnOp+lPTw4v8Wwf
   dtus9vIPuF/wKqTIJJ3zuT75olvYK6HIbSAUYWMm2PeUJymOGbjIzzK9p
   dlZnjCfnXXn+0xu+7obCuDfYvxbfBEHuzS59+AChkxLqGMMhX8I8pAT6F
   A==;
X-CSE-ConnectionGUID: N8V3bySsTt6msihjkgfb1A==
X-CSE-MsgGUID: FXi9wDQYRBW4+0Pn6hbjig==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="83690580"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="83690580"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 02:44:14 -0700
X-CSE-ConnectionGUID: vNcnYZT8Qu6MTxYQPNqUhQ==
X-CSE-MsgGUID: NQDeZccKRMScozTsCEW9OQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="256653933"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Jul 2026 02:44:15 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wfaRQ-00000000Bvz-0mgg;
	Fri, 03 Jul 2026 09:44:12 +0000
Date: Fri, 03 Jul 2026 17:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [agd5f:amd-staging-drm-next 3205/3402]
 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c:537 amdgpu_device_ip_soft_reset()
 error: we previously assumed 'ip_block' could be null (see line 536)
Message-ID: <202607031711.yLwFhGfp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: "Timur Krist=C3=B3f" <timur.kristof@gmail.com>
CC: Alexander Deucher <alexander.deucher@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git amd-staging-drm-next
head:   e3cc8c108f9a91728f9ff6e24cbf3b41c58b8f8b
commit: a6319ac34a1322cc70c8aa7a3b06a558dc4f68a5 [3205/3402] drm/amdgpu: Ad=
d IP block soft reset as a GPU recovery method
:::::: branch date: 2 days ago
:::::: commit date: 2 weeks ago
config: i386-randconfig-r073-20260702 (https://download.01.org/0day-ci/arch=
ive/20260703/202607031711.yLwFhGfp-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607031711.yLwFhGfp-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c:537 amdgpu_device_ip_soft_reset() er=
ror: we previously assumed 'ip_block' could be null (see line 536)

vim +/ip_block +537 drivers/gpu/drm/amd/amdgpu/amdgpu_ip.c

a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  505 =20
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  506  /**
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  507   * amdgpu_device_ip_soft=
_reset() - Perform a graceful soft reset on an IP block.
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  508   *
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  509   * @guilty_ring: The rin=
g which is guilty of causing a reset.
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  510   * @guilty_fence: The fe=
nce which didn't signal.
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  511   *
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  512   * IP block soft reset i=
s used when attempting to recover
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  513   * from a GPU hang in a =
situation where a more fine grained
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  514   * reset type isn't avai=
lable or didn't work. This effectively
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  515   * resets all rings that=
 belong to the same device IP block
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  516   * and re-initializes th=
e device IP block.
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  517   *
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  518   * The reset is handled =
gracefully, meaning that we try to
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  519   * minimize collateral d=
amage (ie. avoid rejecting non-guilty jobs)
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  520   * as well as back up an=
d restore the contents of all rings
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  521   * so that the system ca=
n move on from the hang.
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  522   */
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  523  int amdgpu_device_ip_sof=
t_reset(struct amdgpu_ring *guilty_ring,
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  524  				struct amdgpu_fence =
*guilty_fence)
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  525  {
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  526  	struct amdgpu_device *a=
dev =3D guilty_ring->adev;
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  527  	struct amdgpu_ring *rin=
gs[AMDGPU_MAX_RINGS];
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  528  	struct amdgpu_ip_block =
*ip_block;
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  529  	enum amd_ip_block_type =
ip_type;
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  530  	u32 num_rings, ring_typ=
e_mask;
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  531  	int r;
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  532 =20
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  533  	ip_type =3D amdgpu_ip_f=
rom_ring(guilty_ring->funcs->type);
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  534  	ip_block =3D amdgpu_dev=
ice_ip_get_ip_block(adev, ip_type);
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17  535 =20
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17 @536  	if (!ip_block || !ip_bl=
ock->version->funcs->soft_reset) {
a6319ac34a1322 Timur Krist=C3=B3f 2026-06-17 @537  		dev_warn(adev->dev, "I=
P block soft reset not supported on %s\n",

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
