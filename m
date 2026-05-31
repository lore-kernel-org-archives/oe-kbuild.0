Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F200F1D435F
	for <oe-kbuild@lists.linux.dev>; Sun, 31 May 2026 21:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780261874; cv=none; b=RAF6ho+JAHrDKSfTs1Ni3eq7dVAH+JR6q6O/q0/KJJmmEfX2z478sqpul1ooWSwhgZcq1EPd7ydKdGUIdii4VNs7L8aEMjEd4bllalMZr38kgyQInQBSVs1nq+GQ7vfvzkNOndEkcBl9w25tQezK3glvx82arDz+fVM6pGMsX4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780261874; c=relaxed/simple;
	bh=VybeKgihH3u+ztR+siJjyhndGumrhOQX58JsIUdfu/Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BjbNNY1jy8daBrz9zUN1jIyJS2aV/lGpxAPSMr4JusW+3TPPKATfkLJYPV99sL7ONn7BSR2AUj/vxTLgxc5g+91Y8AhYWR89LYkaNY9deeMyAQOdG7ucXfMZhGhFytNJ7zCqsiR/+FmbgRlJMUoD9BbaLHl8NCHYdAm/R3E6/0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WxwID9TL; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WxwID9TL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780261873; x=1811797873;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=VybeKgihH3u+ztR+siJjyhndGumrhOQX58JsIUdfu/Q=;
  b=WxwID9TLHA0VzvvsLDUleJHzZWaqlmVYiFyAVPTU1ChIFRATyN258e00
   ZTrLmkDV+adQLOdtgiONI0+OXuEpevwBaF3enRzQ5ujKKGSZWqJMV3ZiR
   FhMU6IkhdajjDABEOtbN2Og10DCjBTm0vyyhh24Pzl+V4c8cYsyZucj6x
   /SGd8A1sFFMLFMMKj3APLLuevbImD0xKqYJ2YsYdbWOD673pnhdKwhidK
   xJkHF36K7Rapxik8/jotc87L63LSik7Zhb5UFo7ROoApMmAspMlhLt023
   BBgop8/IgNj+mInxS4DvCURa2jH9SNx7Pwc7n1m9ROO/Xz22zhX7gkbhW
   Q==;
X-CSE-ConnectionGUID: ncQZoRcTTbi+P87GNLLoSQ==
X-CSE-MsgGUID: AiBQDGKCQfGFVaJ0Gu7wSg==
X-IronPort-AV: E=McAfee;i="6800,10657,11803"; a="81213380"
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="81213380"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 May 2026 14:11:12 -0700
X-CSE-ConnectionGUID: 1l8lVOp+RdyzCqwEY2lYbA==
X-CSE-MsgGUID: pblauWX3QduYFbbzuYSoTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,179,1774335600"; 
   d="scan'208";a="247373301"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 31 May 2026 14:11:11 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wTnR7-000000009ko-0XLk;
	Sun, 31 May 2026 21:11:09 +0000
Date: Mon, 01 Jun 2026 05:10:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [agd5f:pipe_reset 2666/2787]
 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:319:16-17: WARNING opportunity for
 max()
Message-ID: <202606010548.Yx52ZZWf-lkp@intel.com>
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
TO: Harry Wentland <harry.wentland@amd.com>
CC: Linux Infrastructure <z1.linuxinfra@amd.com>
CC: Alex Hung <alex.hung@amd.com>

tree:   https://gitlab.freedesktop.org/agd5f/linux.git pipe_reset
head:   7c60f9e63279a919b498f5fced6825b54dff2dd4
commit: e6b71bcdc409d2d8c12e370bbb6daabed2a78d39 [2666/2787] drm/amdgpu: Re=
move UML build exclusion from Kconfig
:::::: branch date: 10 days ago
:::::: commit date: 3 weeks ago
config: um-randconfig-r062-20260601 (https://download.01.org/0day-ci/archiv=
e/20260601/202606010548.Yx52ZZWf-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 940=
9c07de6378507397ecdb6f05f628f58110112)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606010548.Yx52ZZWf-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c:319:16-17: WARNING opportunity=
 for max()
--
>> drivers/gpu/drm/amd/amdgpu/amdgpu_sdma.c:247:4-50: opportunity for str_t=
rue_false(adev -> firmware . load_type =3D=3D AMDGPU_FW_LOAD_PSP)

vim +319 drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c

43ca8efa46d9b1 pding                2017-10-13  314 =20
6e87c422951390 Alex Sierra          2023-04-24  315  	while ((int32_t)(wait=
_seq - amdgpu_fence_read(ring)) > 0 && timeout > 0) {
6e87c422951390 Alex Sierra          2023-04-24  316  		udelay(2);
6e87c422951390 Alex Sierra          2023-04-24  317  		timeout -=3D 2;
6e87c422951390 Alex Sierra          2023-04-24  318  	}
43ca8efa46d9b1 pding                2017-10-13 @319  	return timeout > 0 ? =
timeout : 0;
43ca8efa46d9b1 pding                2017-10-13  320  }
d38ceaf99ed015 Alex Deucher         2015-04-20  321  /**
d38ceaf99ed015 Alex Deucher         2015-04-20  322   * amdgpu_fence_count_=
emitted - get the count of emitted fences
d38ceaf99ed015 Alex Deucher         2015-04-20  323   *
d38ceaf99ed015 Alex Deucher         2015-04-20  324   * @ring: ring the fen=
ce is associated with
d38ceaf99ed015 Alex Deucher         2015-04-20  325   *
d38ceaf99ed015 Alex Deucher         2015-04-20  326   * Get the number of f=
ences emitted on the requested ring (all asics).
d38ceaf99ed015 Alex Deucher         2015-04-20  327   * Returns the number =
of emitted fences on the ring.  Used by the
d38ceaf99ed015 Alex Deucher         2015-04-20  328   * dynpm code to ring =
track activity.
d38ceaf99ed015 Alex Deucher         2015-04-20  329   */
9e690184586bfb Srinivasan Shanmugam 2023-05-03  330  unsigned int amdgpu_fe=
nce_count_emitted(struct amdgpu_ring *ring)
d38ceaf99ed015 Alex Deucher         2015-04-20  331  {
d38ceaf99ed015 Alex Deucher         2015-04-20  332  	uint64_t emitted;
d38ceaf99ed015 Alex Deucher         2015-04-20  333 =20
d38ceaf99ed015 Alex Deucher         2015-04-20  334  	/* We are not protect=
ed by ring lock when reading the last sequence
d38ceaf99ed015 Alex Deucher         2015-04-20  335  	 * but it's ok to rep=
ort slightly wrong fence count here.
d38ceaf99ed015 Alex Deucher         2015-04-20  336  	 */
742c085fa86345 Christian K=C3=B6nig      2016-03-14  337  	emitted =3D 0x10=
0000000ull;
742c085fa86345 Christian K=C3=B6nig      2016-03-14  338  	emitted -=3D ato=
mic_read(&ring->fence_drv.last_seq);
6aa7de059173a9 Mark Rutland         2017-10-23  339  	emitted +=3D READ_ONC=
E(ring->fence_drv.sync_seq);
742c085fa86345 Christian K=C3=B6nig      2016-03-14  340  	return lower_32_=
bits(emitted);
d38ceaf99ed015 Alex Deucher         2015-04-20  341  }
d38ceaf99ed015 Alex Deucher         2015-04-20  342 =20

:::::: The code at line 319 was first introduced by commit
:::::: 43ca8efa46d9b1c4defa1b27c4dd1ef3866aaad9 drm/amdgpu: busywait KIQ re=
gister accessing (v4)

:::::: TO: pding <Pixel.Ding@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
