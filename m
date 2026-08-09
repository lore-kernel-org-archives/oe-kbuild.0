Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EDA3A2E0A
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Aug 2026 04:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786249650; cv=none; b=I3CmR01ly8/dcN+aZEilw4Woj/QJ6hd0oWkpGYyhPIZUVcgDizN13gPaK12kq3zQWh0DoiC2M4ZpdnqJc34P5LkyN0A+J9Uwfl6Cqf96MWpVou3LAMYiRZhGm/er39qX7UMcmoE+pFYCidPhKTe/fu3ObKpmJK7VNN/WsXYgnoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786249650; c=relaxed/simple;
	bh=HWhvZE1u6jy1miVnSkwOyZbB4bOUU9vxCvmPcFBPC08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ASnSDEnajwIg1FtfvfAdUu+yj3aXnt+nNKFwUqT5hxirqMABkfIlqnnIeR5pJcCAVtgjM1k+YhPf2iLxctyFfmBEGiHh+cveBe52di6RBpmF2icYBUHezq7rN7O3FPI+FC18VrngMrfYKtv2VXO0IHQKQE5fVQ7502PYGCBvJac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FkGRCiMK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FkGRCiMK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786249648; x=1817785648;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HWhvZE1u6jy1miVnSkwOyZbB4bOUU9vxCvmPcFBPC08=;
  b=FkGRCiMKLxmWEgNM87a8sX2l+LoBHZNHpYLXzPBiIWTK3AFvieN8AcOO
   MY4qcUJ9VSfGKJgvI3cqIcWPrrCpqQ+l75gFgQmsiu8ynUxfJ9T/C0zKI
   l7wIGr6jZvc735ds2jiyufJUOs8/LkyNuzdHsv+L/gCy7VRSpVRYAuoZ3
   qQ/jRmg9zJSznjZ0JsYzlXQ4bggWgV23npBN/wwsnTN8b20ydSH94a8aF
   HrtRlcE+GmaYJNib2ExBpADN4rCaPiFRTOnq0Ru8NKdvJhdA9O7i2jjsX
   tXys3YpHoo1l6u5zKbnZ6k+zFDwC0bsuZvdnAkVKAWXP/7vm6/PyxTQ1T
   A==;
X-CSE-ConnectionGUID: qRiTCrAYTn6kQASyY62pkA==
X-CSE-MsgGUID: UuiC7M9BSlSvucAoolAIfA==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="86828911"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="86828911"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 21:27:27 -0700
X-CSE-ConnectionGUID: acU3TF/ZTbepMONwqaT88w==
X-CSE-MsgGUID: z4E71xH2T1SJ9oQ4h04shA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="263360731"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Aug 2026 21:27:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsv87-00000000LRH-2jqh;
	Sun, 09 Aug 2026 04:27:23 +0000
Date: Sun, 09 Aug 2026 12:26:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:862
 amdgpu_gmc_fw_reg_write_reg_wait() error: buffer overflow 'adev->mes.ring' 16
 <= u32max
Message-ID: <202608091158.hGSuSN2l-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Mukul Joshi <mukul.joshi@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Alex Sierra <alex.sierra@amd.com>
CC: Michael Chen <michael.chen@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   06cf61899d6498b33e4b7c87d99d5bd471ccc375
commit: b7c4040d0d131de5014fb02bbdbe8fa2b9c5b0b0 drm/amdgpu: Use correct ME=
S pipe in non-SPX mode on GFX 12.1
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20260806 (https://download.01.org/0day-ci/archi=
ve/20260809/202608091158.hGSuSN2l-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: b7c4040d0d13 ("drm/amdgpu: Use correct MES pipe in non-SPX mode on=
 GFX 12.1")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608091158.hGSuSN2l-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:862 amdgpu_gmc_fw_reg_write_reg_wai=
t() error: buffer overflow 'adev->mes.ring' 16 <=3D u32max

vim +862 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c

e7b90e99fa8fd65 Christian K=C3=B6nig  2023-09-04  850 =20
26405ff4306a7be Alex Deucher     2023-12-14  851  void amdgpu_gmc_fw_reg_wr=
ite_reg_wait(struct amdgpu_device *adev,
26405ff4306a7be Alex Deucher     2023-12-14  852  				      uint32_t reg0, =
uint32_t reg1,
26405ff4306a7be Alex Deucher     2023-12-14  853  				      uint32_t ref, u=
int32_t mask,
26405ff4306a7be Alex Deucher     2023-12-14  854  				      uint32_t xcc_in=
st)
26405ff4306a7be Alex Deucher     2023-12-14  855  {
26405ff4306a7be Alex Deucher     2023-12-14  856  	struct amdgpu_kiq *kiq =
=3D &adev->gfx.kiq[xcc_inst];
26405ff4306a7be Alex Deucher     2023-12-14  857  	struct amdgpu_ring *ring=
 =3D &kiq->ring;
26405ff4306a7be Alex Deucher     2023-12-14  858  	signed long r, cnt =3D 0;
26405ff4306a7be Alex Deucher     2023-12-14  859  	unsigned long flags;
26405ff4306a7be Alex Deucher     2023-12-14  860  	uint32_t seq;
26405ff4306a7be Alex Deucher     2023-12-14  861 =20
b7c4040d0d131de Mukul Joshi      2025-08-07 @862  	if (adev->mes.ring[MES_P=
IPE_INST(xcc_inst, 0)].sched.ready) {
26405ff4306a7be Alex Deucher     2023-12-14  863  		amdgpu_mes_reg_write_re=
g_wait(adev, reg0, reg1,
d09c7e266c8cd55 Jack Xiao        2024-11-21  864  					      ref, mask, xcc=
_inst);
26405ff4306a7be Alex Deucher     2023-12-14  865  		return;
26405ff4306a7be Alex Deucher     2023-12-14  866  	}
26405ff4306a7be Alex Deucher     2023-12-14  867 =20
26405ff4306a7be Alex Deucher     2023-12-14  868  	spin_lock_irqsave(&kiq->=
ring_lock, flags);
26405ff4306a7be Alex Deucher     2023-12-14  869  	amdgpu_ring_alloc(ring, =
32);
26405ff4306a7be Alex Deucher     2023-12-14  870  	amdgpu_ring_emit_reg_wri=
te_reg_wait(ring, reg0, reg1,
26405ff4306a7be Alex Deucher     2023-12-14  871  					    ref, mask);
26405ff4306a7be Alex Deucher     2023-12-14  872  	r =3D amdgpu_fence_emit_=
polling(ring, &seq, MAX_KIQ_REG_WAIT);
26405ff4306a7be Alex Deucher     2023-12-14  873  	if (r)
26405ff4306a7be Alex Deucher     2023-12-14  874  		goto failed_undo;
26405ff4306a7be Alex Deucher     2023-12-14  875 =20
26405ff4306a7be Alex Deucher     2023-12-14  876  	amdgpu_ring_commit(ring);
26405ff4306a7be Alex Deucher     2023-12-14  877  	spin_unlock_irqrestore(&=
kiq->ring_lock, flags);
26405ff4306a7be Alex Deucher     2023-12-14  878 =20
26405ff4306a7be Alex Deucher     2023-12-14  879  	r =3D amdgpu_fence_wait_=
polling(ring, seq, MAX_KIQ_REG_WAIT);
26405ff4306a7be Alex Deucher     2023-12-14  880 =20
26405ff4306a7be Alex Deucher     2023-12-14  881  	/* don't wait anymore fo=
r IRQ context */
26405ff4306a7be Alex Deucher     2023-12-14  882  	if (r < 1 && in_interrup=
t())
26405ff4306a7be Alex Deucher     2023-12-14  883  		goto failed_kiq;
26405ff4306a7be Alex Deucher     2023-12-14  884 =20
26405ff4306a7be Alex Deucher     2023-12-14  885  	might_sleep();
19cff16559a4f2d Victor Skvortsov 2024-08-02  886  	while (r < 1 && cnt++ < =
MAX_KIQ_REG_TRY &&
19cff16559a4f2d Victor Skvortsov 2024-08-02  887  	       !amdgpu_reset_pen=
ding(adev->reset_domain)) {
26405ff4306a7be Alex Deucher     2023-12-14  888 =20
26405ff4306a7be Alex Deucher     2023-12-14  889  		msleep(MAX_KIQ_REG_BAIL=
OUT_INTERVAL);
26405ff4306a7be Alex Deucher     2023-12-14  890  		r =3D amdgpu_fence_wait=
_polling(ring, seq, MAX_KIQ_REG_WAIT);
26405ff4306a7be Alex Deucher     2023-12-14  891  	}
26405ff4306a7be Alex Deucher     2023-12-14  892 =20
26405ff4306a7be Alex Deucher     2023-12-14  893  	if (cnt > MAX_KIQ_REG_TR=
Y)
26405ff4306a7be Alex Deucher     2023-12-14  894  		goto failed_kiq;
26405ff4306a7be Alex Deucher     2023-12-14  895 =20
26405ff4306a7be Alex Deucher     2023-12-14  896  	return;
26405ff4306a7be Alex Deucher     2023-12-14  897 =20
26405ff4306a7be Alex Deucher     2023-12-14  898  failed_undo:
26405ff4306a7be Alex Deucher     2023-12-14  899  	amdgpu_ring_undo(ring);
26405ff4306a7be Alex Deucher     2023-12-14  900  	spin_unlock_irqrestore(&=
kiq->ring_lock, flags);
26405ff4306a7be Alex Deucher     2023-12-14  901  failed_kiq:
26405ff4306a7be Alex Deucher     2023-12-14  902  	dev_err(adev->dev, "fail=
ed to write reg %x wait reg %x\n", reg0, reg1);
26405ff4306a7be Alex Deucher     2023-12-14  903  }
26405ff4306a7be Alex Deucher     2023-12-14  904 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
