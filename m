Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3EB52DA74C
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Jan 2026 06:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769236209; cv=none; b=bo23Pf887CLwaaJYjA2Mfa4UPT+5fS7G4z/e5excAcwP6WXobG3L75lDt78z80XFggjzD1bVr2Q/yc9KB6SO5lrarsMV1+RHfmLpQk1xkTmdPjdr7dMNX50TpuFXXMohS66Ivh+b1+FY3FajuKu3t19XLdwc7haZGmJ5Pemk3tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769236209; c=relaxed/simple;
	bh=UR9+yiBGvqblMoRJ7rydBXDyyHX2XJPrsN5RKy5F2X8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=n6jfNYw7ZN+D6NlhoJaVAt7pJ/32dMqL+5hz2un8zaxrLrgbQt9GYbHWpH3jdDls3PmhggHYoZ6f8aQQW85iZWTu+0aWop9Vbbml9aC0LNmdUd5TL6DUPljCuuLo9jfwUU1RdNNyyRBkOgL7ysIAvQ4ijxXYOjaJk85lTBY0kVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XW9ISO2S; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XW9ISO2S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769236207; x=1800772207;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=UR9+yiBGvqblMoRJ7rydBXDyyHX2XJPrsN5RKy5F2X8=;
  b=XW9ISO2Ss2yM8ZGVt/lVsm1YLy+wmqntXeDhLLyuyN4/BEflwPrI0OQT
   N/2VNBwhqVP2PSF/oWQIDJoz13A9vYH1qDVyBE0t+dhwO2RF7Rwem+hfu
   vlC3B2rL9e50fQ6XcxfEw5eJOa5IKvHq844vIViF14yuAqf3nDAAC/Mkf
   oXqJKWZIycJytNpFhbc8khIL3evpTQ25TQJBG+UVu8Rzon8UoWN0yTunP
   THan1noZeuxn3I6k4ib3XNx2zjZfj7Z7T2rBdmX6WqaJLTVFXieF2enIY
   ft5AkF4g1UQXn4PeK4P63Q+GkdTiAnYctHY+lx11jyTakeyUgoOFYVwxH
   A==;
X-CSE-ConnectionGUID: 4WA9jENTR7eAcDEqEOn2AQ==
X-CSE-MsgGUID: Qytmfe/NRmiFIvTtBly8Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="58049913"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="58049913"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2026 22:30:04 -0800
X-CSE-ConnectionGUID: HiJNYx1dS2ewZ2BWY96D5A==
X-CSE-MsgGUID: 0KHsfc+cRj6Zz9W4Nix/Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="207022401"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 23 Jan 2026 22:29:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjX9f-00000000Uy0-05fv;
	Sat, 24 Jan 2026 06:29:55 +0000
Date: Sat, 24 Jan 2026 14:29:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 7675/9539]
 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:159 amdgpu_userq_hang_detect_work()
 warn: can 'queue' even be NULL?
Message-ID: <202601241456.ALV97WlP-lkp@intel.com>
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
TO: "Jesse.Zhang" <Jesse.Zhang@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Jesse Zhang <jesse.zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: fc3336be9c6297282dd7968a597166b212cb0dc0 [7675/9539] drm/amd/amdgpu=
: Add independent hang detect work for user queue fence
:::::: branch date: 7 hours ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20260124 (https://download.01.org/0day-ci/arc=
hive/20260124/202601241456.ALV97WlP-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601241456.ALV97WlP-lkp@intel.com/

New smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:159 amdgpu_userq_hang_detect_work=
() warn: can 'queue' even be NULL?

Old smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c:1474 amdgpu_userq_start_sched_for=
_enforce_isolation() warn: inconsistent indenting

vim +/queue +159 drivers/gpu/drm/amd/amdgpu/amdgpu_userq.c

290f46cf572650 Jesse.Zhang 2025-10-24  150 =20
fc3336be9c6297 Jesse.Zhang 2026-01-13  151  static void amdgpu_userq_hang_d=
etect_work(struct work_struct *work)
fc3336be9c6297 Jesse.Zhang 2026-01-13  152  {
fc3336be9c6297 Jesse.Zhang 2026-01-13  153  	struct amdgpu_usermode_queue *=
queue =3D container_of(work,
fc3336be9c6297 Jesse.Zhang 2026-01-13  154  							  struct amdgpu_usermode=
_queue,
fc3336be9c6297 Jesse.Zhang 2026-01-13  155  							  hang_detect_work.work);
fc3336be9c6297 Jesse.Zhang 2026-01-13  156  	struct dma_fence *fence;
fc3336be9c6297 Jesse.Zhang 2026-01-13  157  	struct amdgpu_userq_mgr *uq_mg=
r;
fc3336be9c6297 Jesse.Zhang 2026-01-13  158 =20
fc3336be9c6297 Jesse.Zhang 2026-01-13 @159  	if (!queue || !queue->userq_mg=
r)
fc3336be9c6297 Jesse.Zhang 2026-01-13  160  		return;
fc3336be9c6297 Jesse.Zhang 2026-01-13  161 =20
fc3336be9c6297 Jesse.Zhang 2026-01-13  162  	uq_mgr =3D queue->userq_mgr;
fc3336be9c6297 Jesse.Zhang 2026-01-13  163  	fence =3D READ_ONCE(queue->han=
g_detect_fence);
fc3336be9c6297 Jesse.Zhang 2026-01-13  164  	/* Fence already signaled =E2=
=80=93 no action needed */
fc3336be9c6297 Jesse.Zhang 2026-01-13  165  	if (!fence || dma_fence_is_sig=
naled(fence))
fc3336be9c6297 Jesse.Zhang 2026-01-13  166  		return;
fc3336be9c6297 Jesse.Zhang 2026-01-13  167 =20
fc3336be9c6297 Jesse.Zhang 2026-01-13  168  	mutex_lock(&uq_mgr->userq_mute=
x);
fc3336be9c6297 Jesse.Zhang 2026-01-13  169  	amdgpu_userq_detect_and_reset_=
queues(uq_mgr);
fc3336be9c6297 Jesse.Zhang 2026-01-13  170  	mutex_unlock(&uq_mgr->userq_mu=
tex);
fc3336be9c6297 Jesse.Zhang 2026-01-13  171  }
fc3336be9c6297 Jesse.Zhang 2026-01-13  172 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
