Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFE2388E4F
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 14:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786111686; cv=none; b=uVefazhY4IQiTvsxFvE6jO3pkKuJp6KV/iWbSoCz8WnDxYBVa1o8LVJTziSzVuxcnRsl71PQUiF+41fuAG+OURLsfhdzeN1ZyqjOh1+mcaYXXp6m3UZjKsg3A5KkzBFd1/e8SPiVLOud3usEZHgBORnrisIZbKWcT83pBKlwg3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786111686; c=relaxed/simple;
	bh=AJt+jLAUer4jhJoQUq52S8Ezulk6LbHMsX+XPC1roAA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Qqv0BkeozhrLUtIZdFR5t3J4O6P0Vo2tZ25TZxtpdabB4/iOfLk+3K0JK8wIa0erYcEdVGbhQ/YWeQaWEIwpZIXm09EcoFfVZCJz0EVMZBYPPznN0e56DpCxG2PRtcKdK+VY9J1yu2olVKfgbdjCCTbVqmNEq/E1Xpt1WMp+Rok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vg4rSpEM; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vg4rSpEM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786111684; x=1817647684;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=AJt+jLAUer4jhJoQUq52S8Ezulk6LbHMsX+XPC1roAA=;
  b=Vg4rSpEMZ3EZ1laZ8QdIlkrFE6AmOMITKtiYC4RyQf97WtnIipPagG6I
   xmxomb4LKUfWJvV81XrCQd0K29Fuzz19Xwu5yLgy83tUNANIYCvQrjIjt
   vFt4YJiLW6XCdDiyah5Z4fhyWMWVFxb3nBzswyqVilcict4I36wIFfNNx
   Qia+gT5iuU7y3l3cSm9EUFKRAfUE0By1OIQzvsfcK0C8FOr70XPhN50ai
   LgO7hxfHjESu3GKjJaKkj+7yKdu6UBMoyQmIkHf4gtnzqeTQFmdNfbMBC
   vJ9Z5som/Xh509nD3UT3x1C68vi+PNVuBUD1+YxJEXQRD0Bp/KkElQ/Ca
   Q==;
X-CSE-ConnectionGUID: mltSpajORFOc6AJb27ajrA==
X-CSE-MsgGUID: pL7jY2uUSue4AyfpJcSDng==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="89246391"
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="89246391"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Aug 2026 07:08:03 -0700
X-CSE-ConnectionGUID: r47I8nEnQa6nvOMLX7V/dA==
X-CSE-MsgGUID: SwWW+emTTIuTXNCf1nIVPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,210,1779174000"; 
   d="scan'208";a="265891853"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 07 Aug 2026 07:08:02 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsLEt-00000000IPl-39F5;
	Fri, 07 Aug 2026 14:07:59 +0000
Date: Fri, 07 Aug 2026 22:07:56 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:862
 amdgpu_gmc_fw_reg_write_reg_wait() error: buffer overflow 'adev->mes.ring' 16
 <= u32max
Message-ID: <202608072130.cDZ61U1q-lkp@intel.com>
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
head:   6c68fa601b49683ecb04eded993a71dfa8b2ba0b
commit: b7c4040d0d131de5014fb02bbdbe8fa2b9c5b0b0 drm/amdgpu: Use correct ME=
S pipe in non-SPX mode on GFX 12.1
date:   7 months ago
:::::: branch date: 17 hours ago
:::::: commit date: 7 months ago
config: i386-randconfig-141-20260806 (https://download.01.org/0day-ci/archi=
ve/20260807/202608072130.cDZ61U1q-lkp@intel.com/config)
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
| Closes: https://lore.kernel.org/r/202608072130.cDZ61U1q-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c:862 amdgpu_gmc_fw_reg_write_reg_wai=
t() error: buffer overflow 'adev->mes.ring' 16 <=3D u32max

vim +862 drivers/gpu/drm/amd/amdgpu/amdgpu_gmc.c

e7b90e99fa8fd6 Christian K=C3=B6nig  2023-09-04  850 =20
26405ff4306a7b Alex Deucher     2023-12-14  851  void amdgpu_gmc_fw_reg_wri=
te_reg_wait(struct amdgpu_device *adev,
26405ff4306a7b Alex Deucher     2023-12-14  852  				      uint32_t reg0, u=
int32_t reg1,
26405ff4306a7b Alex Deucher     2023-12-14  853  				      uint32_t ref, ui=
nt32_t mask,
26405ff4306a7b Alex Deucher     2023-12-14  854  				      uint32_t xcc_ins=
t)
26405ff4306a7b Alex Deucher     2023-12-14  855  {
26405ff4306a7b Alex Deucher     2023-12-14  856  	struct amdgpu_kiq *kiq =
=3D &adev->gfx.kiq[xcc_inst];
26405ff4306a7b Alex Deucher     2023-12-14  857  	struct amdgpu_ring *ring =
=3D &kiq->ring;
26405ff4306a7b Alex Deucher     2023-12-14  858  	signed long r, cnt =3D 0;
26405ff4306a7b Alex Deucher     2023-12-14  859  	unsigned long flags;
26405ff4306a7b Alex Deucher     2023-12-14  860  	uint32_t seq;
26405ff4306a7b Alex Deucher     2023-12-14  861 =20
b7c4040d0d131d Mukul Joshi      2025-08-07 @862  	if (adev->mes.ring[MES_PI=
PE_INST(xcc_inst, 0)].sched.ready) {
26405ff4306a7b Alex Deucher     2023-12-14  863  		amdgpu_mes_reg_write_reg=
_wait(adev, reg0, reg1,
d09c7e266c8cd5 Jack Xiao        2024-11-21  864  					      ref, mask, xcc_=
inst);
26405ff4306a7b Alex Deucher     2023-12-14  865  		return;
26405ff4306a7b Alex Deucher     2023-12-14  866  	}
26405ff4306a7b Alex Deucher     2023-12-14  867 =20
26405ff4306a7b Alex Deucher     2023-12-14  868  	spin_lock_irqsave(&kiq->r=
ing_lock, flags);
26405ff4306a7b Alex Deucher     2023-12-14  869  	amdgpu_ring_alloc(ring, 3=
2);
26405ff4306a7b Alex Deucher     2023-12-14  870  	amdgpu_ring_emit_reg_writ=
e_reg_wait(ring, reg0, reg1,
26405ff4306a7b Alex Deucher     2023-12-14  871  					    ref, mask);
26405ff4306a7b Alex Deucher     2023-12-14  872  	r =3D amdgpu_fence_emit_p=
olling(ring, &seq, MAX_KIQ_REG_WAIT);
26405ff4306a7b Alex Deucher     2023-12-14  873  	if (r)
26405ff4306a7b Alex Deucher     2023-12-14  874  		goto failed_undo;
26405ff4306a7b Alex Deucher     2023-12-14  875 =20
26405ff4306a7b Alex Deucher     2023-12-14  876  	amdgpu_ring_commit(ring);
26405ff4306a7b Alex Deucher     2023-12-14  877  	spin_unlock_irqrestore(&k=
iq->ring_lock, flags);
26405ff4306a7b Alex Deucher     2023-12-14  878 =20
26405ff4306a7b Alex Deucher     2023-12-14  879  	r =3D amdgpu_fence_wait_p=
olling(ring, seq, MAX_KIQ_REG_WAIT);
26405ff4306a7b Alex Deucher     2023-12-14  880 =20
26405ff4306a7b Alex Deucher     2023-12-14  881  	/* don't wait anymore for=
 IRQ context */
26405ff4306a7b Alex Deucher     2023-12-14  882  	if (r < 1 && in_interrupt=
())
26405ff4306a7b Alex Deucher     2023-12-14  883  		goto failed_kiq;
26405ff4306a7b Alex Deucher     2023-12-14  884 =20
26405ff4306a7b Alex Deucher     2023-12-14  885  	might_sleep();
19cff16559a4f2 Victor Skvortsov 2024-08-02  886  	while (r < 1 && cnt++ < M=
AX_KIQ_REG_TRY &&
19cff16559a4f2 Victor Skvortsov 2024-08-02  887  	       !amdgpu_reset_pend=
ing(adev->reset_domain)) {
26405ff4306a7b Alex Deucher     2023-12-14  888 =20
26405ff4306a7b Alex Deucher     2023-12-14  889  		msleep(MAX_KIQ_REG_BAILO=
UT_INTERVAL);
26405ff4306a7b Alex Deucher     2023-12-14  890  		r =3D amdgpu_fence_wait_=
polling(ring, seq, MAX_KIQ_REG_WAIT);
26405ff4306a7b Alex Deucher     2023-12-14  891  	}
26405ff4306a7b Alex Deucher     2023-12-14  892 =20
26405ff4306a7b Alex Deucher     2023-12-14  893  	if (cnt > MAX_KIQ_REG_TRY)
26405ff4306a7b Alex Deucher     2023-12-14  894  		goto failed_kiq;
26405ff4306a7b Alex Deucher     2023-12-14  895 =20
26405ff4306a7b Alex Deucher     2023-12-14  896  	return;
26405ff4306a7b Alex Deucher     2023-12-14  897 =20
26405ff4306a7b Alex Deucher     2023-12-14  898  failed_undo:
26405ff4306a7b Alex Deucher     2023-12-14  899  	amdgpu_ring_undo(ring);
26405ff4306a7b Alex Deucher     2023-12-14  900  	spin_unlock_irqrestore(&k=
iq->ring_lock, flags);
26405ff4306a7b Alex Deucher     2023-12-14  901  failed_kiq:
26405ff4306a7b Alex Deucher     2023-12-14  902  	dev_err(adev->dev, "faile=
d to write reg %x wait reg %x\n", reg0, reg1);
26405ff4306a7b Alex Deucher     2023-12-14  903  }
26405ff4306a7b Alex Deucher     2023-12-14  904 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
