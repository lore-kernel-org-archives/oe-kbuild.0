Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00FF435A39E
	for <oe-kbuild@lists.linux.dev>; Thu, 26 Feb 2026 18:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772129276; cv=none; b=oQfTCWasfju4QMCNuiKQK8Ea9Oq+JaqlP8UqR4uIDE0otpSMaBX3Mc+LVThyauCTA/4Tp5xy3nrySxU+lmOXdQz+rG/LNUnqrsZA8WmqkIgI+HHJAQDYX/peeXkB2KDexw0uVWFRtk1M6apV9JIoY+o2mlbBvcPLHBrDOc9d9BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772129276; c=relaxed/simple;
	bh=yzSaPB83DMQfh61Yp9F1JiOdQSOZwvtg4FYWRlyWLqE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=oZ3LaKZC6RTzkvkeHX41k9gQiV97O00eDloi8P/n36S/ZWjcmg19N4wVnzyRPi7Jn3jBPHjxcakNuvoJiFPBZKOhzu2UxxHqAsbg2cipRQoDkXFr2GitexhZo0zAo1qKrsdoMa0srJK1QAZ3menSvkj+UoAp/1cAoEIHt+qHrZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZyZlHrxO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZyZlHrxO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772129275; x=1803665275;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=yzSaPB83DMQfh61Yp9F1JiOdQSOZwvtg4FYWRlyWLqE=;
  b=ZyZlHrxOSbFRzD9EfVO6/sQ9tK7TKNHdoM9u0vy4Bq04Rhou+hQqpqhp
   3iHHlOu65A05lW8MaJj5MmONs7AOVnh8+pfpR0fzp7f4voLL7kxevJp8g
   sTQchFSJv9925PI+ZxNsR5SJotXHkoPer7RzaO1LrqcSkT0rlYJrjOMho
   oT5VG8aGFX5n1tpMCfdwATTnqfX1aD7sZoU+sDCleNRfmJIXn+qEKBaOl
   v8yaZhp0+lXf8MaoNnu3jV6pLXZ1q2E33r4yOcrwon9HN+GMZGgUJnUov
   glsRi1ECyEOCvBDaC+Si8UOwFvCsIQsp2PkNRMyXzU+ErOujN+M/2Lfnz
   g==;
X-CSE-ConnectionGUID: 5YUesIZNQRS/clYJcwz+6w==
X-CSE-MsgGUID: sbs9LJaASh+7/ak4FXWywg==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="84555012"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="84555012"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 10:07:54 -0800
X-CSE-ConnectionGUID: jItdoIhaSOWm4VB5oIPSiA==
X-CSE-MsgGUID: PYujfBv9S22IzGf31jnW/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="214586921"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2026 10:07:52 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvfle-000000009jr-3Mpd;
	Thu, 26 Feb 2026 18:07:27 +0000
Date: Fri, 27 Feb 2026 02:06:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 1384/2633]
 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c:57:1-7: preceding lock on line
 38
Message-ID: <202602270121.ugpgH7ot-lkp@intel.com>
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
TO: "Pierre-Eric Pelloux-Prayer" <pierre-eric.pelloux-prayer@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7d6661873f6b54c75195780a40d66bad3d482d8f
commit: 30f2daedf4d8adfa331b05fcce06746e643e1f18 [1384/2633] drm/amdgpu: ad=
d missing lock in amdgpu_benchmark_do_move
:::::: branch date: 4 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-051-20260226 (https://download.01.org/0day-ci/archi=
ve/20260227/202602270121.ugpgH7ot-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202602270121.ugpgH7ot-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c:57:1-7: preceding lock on =
line 38

vim +57 drivers/gpu/drm/amd/amdgpu/amdgpu_benchmark.c

d38ceaf99ed015 Alex Deucher               2015-04-20  30 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  31  static int amdgpu=
_benchmark_do_move(struct amdgpu_device *adev, unsigned size,
4683af148fe8f9 Alex Deucher               2022-02-21  32  				    uint64_t =
saddr, uint64_t daddr, int n, s64 *time_ms)
d38ceaf99ed015 Alex Deucher               2015-04-20  33  {
4683af148fe8f9 Alex Deucher               2022-02-21  34  	ktime_t stime, e=
time;
365f7f8db8a48c Pan Bian                   2019-11-06  35  	struct dma_fence=
 *fence;
d38ceaf99ed015 Alex Deucher               2015-04-20  36  	int i, r;
d38ceaf99ed015 Alex Deucher               2015-04-20  37 =20
30f2daedf4d8ad Pierre-Eric Pelloux-Prayer 2025-11-18 @38  	mutex_lock(&adev=
->mman.default_entity.lock);
4683af148fe8f9 Alex Deucher               2022-02-21  39  	stime =3D ktime_=
get();
d38ceaf99ed015 Alex Deucher               2015-04-20  40  	for (i =3D 0; i =
< n; i++) {
35bb80e6832920 Pierre-Eric Pelloux-Prayer 2025-11-17  41  		r =3D amdgpu_co=
py_buffer(adev, &adev->mman.default_entity,
35bb80e6832920 Pierre-Eric Pelloux-Prayer 2025-11-17  42  				       saddr,=
 daddr, size, NULL, &fence,
73aa1550dfeda9 Pierre-Eric Pelloux-Prayer 2025-09-19  43  				       false,=
 0);
d38ceaf99ed015 Alex Deucher               2015-04-20  44  		if (r)
d38ceaf99ed015 Alex Deucher               2015-04-20  45  			goto exit_do_m=
ove;
f54d1867005c33 Chris Wilson               2016-10-25  46  		r =3D dma_fence=
_wait(fence, false);
365f7f8db8a48c Pan Bian                   2019-11-06  47  		dma_fence_put(f=
ence);
d38ceaf99ed015 Alex Deucher               2015-04-20  48  		if (r)
d38ceaf99ed015 Alex Deucher               2015-04-20  49  			goto exit_do_m=
ove;
d38ceaf99ed015 Alex Deucher               2015-04-20  50  	}
30f2daedf4d8ad Pierre-Eric Pelloux-Prayer 2025-11-18  51  	mutex_unlock(&ad=
ev->mman.default_entity.lock);
d38ceaf99ed015 Alex Deucher               2015-04-20  52 =20
d38ceaf99ed015 Alex Deucher               2015-04-20  53  exit_do_move:
4683af148fe8f9 Alex Deucher               2022-02-21  54  	etime =3D ktime_=
get();
4683af148fe8f9 Alex Deucher               2022-02-21  55  	*time_ms =3D kti=
me_ms_delta(etime, stime);
4683af148fe8f9 Alex Deucher               2022-02-21  56 =20
d38ceaf99ed015 Alex Deucher               2015-04-20 @57  	return r;
d38ceaf99ed015 Alex Deucher               2015-04-20  58  }
d38ceaf99ed015 Alex Deucher               2015-04-20  59 =20

:::::: The code at line 57 was first introduced by commit
:::::: d38ceaf99ed015f2a0b9af3499791bd3a3daae21 drm/amdgpu: add core driver=
 (v4)

:::::: TO: Alex Deucher <alexander.deucher@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
