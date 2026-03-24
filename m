Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D77943C4571
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Mar 2026 11:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774350246; cv=none; b=XeFibFbQ/mJlyWxx9vo7loq+6y3OUc0EkNBFtudPfbRu6/VtB3dRDdCZGzTkvwwxq1KCBY3C4aa/0WGfJ/I5ah7Vjf9pcy3v7M6ZxvMBlIt9QKmGGqSNV9VoEUdDTFOFw/bFMlluNTxWiN4HGO2FzE51HjcjwgdFkSQXx4Bvz+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774350246; c=relaxed/simple;
	bh=6QDquy3d5EMlbZVFn1V3VsGX8Fvat4OE4eD6l/E1vcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=Wi1DQG00jFqy/938ctfQqyZlA4itZWabVLZyRM9itMIOIvpvrcJo0l5CfUNdiwDuBVhmt5y6FLtsnMLQjTcXvYEGXVXNygqrFxQEummwPVLocird6Om2fsYmTWcESKGLu58z/4ZLamszxXfZUqxw3LROKCOeASuZDWxwOu8mvnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WZdMKdgo; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WZdMKdgo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774350244; x=1805886244;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6QDquy3d5EMlbZVFn1V3VsGX8Fvat4OE4eD6l/E1vcY=;
  b=WZdMKdgogPd6NaH1F1xO/y01R91JJ5rocXEjcYFcXojtr62uDytlLwOs
   8efebXjYH/6rOkWHDphZueqi/ZKaZYcuq7QD9tcgVaw2HSKn2QJFWjcK+
   KkIslYhERuEgIdDHw/RwyeaJUA5bd9vZLaSgm6bk0xgyY6LEjrHJN/Scb
   /X8PNdvc/Fu/xByHFwN1TcweiXKc3FqjvUZATgPXQ4FfcZaa1AvWW7WtN
   cedXIYo7x5JwQVz/LpyKdDRCBMVRqV6TkqyvkUL81ghSQBidFJmxy8com
   2UQ+fydaXcCJ7BZoj4/jB/zpoVZV8jgI4Z90pAtZp+nhhNQ1x8ISgEOja
   g==;
X-CSE-ConnectionGUID: qcb6ZF0OQ223SQ6EHLOgLQ==
X-CSE-MsgGUID: mwA7OizcSaW8bcodCPyHmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="86061265"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="86061265"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 04:04:03 -0700
X-CSE-ConnectionGUID: FlSPdxzRT0eNz4kLarBNlA==
X-CSE-MsgGUID: peRcGOCcQCaIlLFg964pyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="219884599"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Mar 2026 04:04:02 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w4zYF-000000004Sx-3HPL;
	Tue, 24 Mar 2026 11:03:59 +0000
Date: Tue, 24 Mar 2026 19:03:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:535:4-10: preceding
 lock on line 514
Message-ID: <202603241845.uThVuJUv-lkp@intel.com>
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
TO: Tao Zhou <tao.zhou1@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>
CC: Hawking Zhang <Hawking.Zhang@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   c369299895a591d96745d6492d4888259b004a9e
commit: 8652920d2c00243e8a8ca91560a30488d95d9a1b drm/amdgpu: add mutex lock=
 for cper ring
date:   1 year, 1 month ago
:::::: branch date: 2 days ago
:::::: commit date: 1 year, 1 month ago
config: s390-randconfig-r052-20260323 (https://download.01.org/0day-ci/arch=
ive/20260324/202603241845.uThVuJUv-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project c91=
1b8492374942bf4cfe35411e90a35d3837f6a)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202603241845.uThVuJUv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:535:4-10: preceding lock on lin=
e 514
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:540:4-10: preceding lock on lin=
e 514
   drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c:576:1-7: preceding lock on line=
 514

vim +535 drivers/gpu/drm/amd/amdgpu/amdgpu_ring.c

d38ceaf99ed015 Alex Deucher    2015-04-20  490 =20
4f4824b55650fa Tom St Denis    2016-04-27  491  /* Layout of file is 12 byt=
es consisting of
4f4824b55650fa Tom St Denis    2016-04-27  492   * - rptr
4f4824b55650fa Tom St Denis    2016-04-27  493   * - wptr
4f4824b55650fa Tom St Denis    2016-04-27  494   * - driver's copy of wptr
4f4824b55650fa Tom St Denis    2016-04-27  495   *
4f4824b55650fa Tom St Denis    2016-04-27  496   * followed by n-words of r=
ing data
4f4824b55650fa Tom St Denis    2016-04-27  497   */
4f4824b55650fa Tom St Denis    2016-04-27  498  static ssize_t amdgpu_debug=
fs_ring_read(struct file *f, char __user *buf,
4f4824b55650fa Tom St Denis    2016-04-27  499  					size_t size, loff_t *p=
os)
d38ceaf99ed015 Alex Deucher    2015-04-20  500  {
450630975da9e7 Al Viro         2016-12-04  501  	struct amdgpu_ring *ring =
=3D file_inode(f)->i_private;
4f4824b55650fa Tom St Denis    2016-04-27  502  	uint32_t value, result, ea=
rly[3];
5a1428242952f2 Tao Zhou        2025-01-22  503  	uint64_t p;
ebbc2ada5c636a Tim Huang       2024-04-25  504  	loff_t i;
ebbc2ada5c636a Tim Huang       2024-04-25  505  	int r;
d38ceaf99ed015 Alex Deucher    2015-04-20  506 =20
c71dbd93eb0039 Tom St Denis    2016-05-02  507  	if (*pos & 3 || size & 3)
4f4824b55650fa Tom St Denis    2016-04-27  508  		return -EINVAL;
d38ceaf99ed015 Alex Deucher    2015-04-20  509 =20
4f4824b55650fa Tom St Denis    2016-04-27  510  	result =3D 0;
c7e6be2303d0b6 Christian K=C3=B6nig 2016-01-21  511 =20
4f4824b55650fa Tom St Denis    2016-04-27  512  	if (*pos < 12) {
8652920d2c0024 Tao Zhou        2025-02-10  513  		if (ring->funcs->type =3D=
=3D AMDGPU_RING_TYPE_CPER)
8652920d2c0024 Tao Zhou        2025-02-10 @514  			mutex_lock(&ring->adev->=
cper.ring_lock);
8652920d2c0024 Tao Zhou        2025-02-10  515 =20
9c5c71bbed4132 Tom St Denis    2018-03-01  516  		early[0] =3D amdgpu_ring_=
get_rptr(ring) & ring->buf_mask;
ec63982e90a879 Tom St Denis    2017-03-29  517  		early[1] =3D amdgpu_ring_=
get_wptr(ring) & ring->buf_mask;
ec63982e90a879 Tom St Denis    2017-03-29  518  		early[2] =3D ring->wptr &=
 ring->buf_mask;
4f4824b55650fa Tom St Denis    2016-04-27  519  		for (i =3D *pos / 4; i < =
3 && size; i++) {
4f4824b55650fa Tom St Denis    2016-04-27  520  			r =3D put_user(early[i],=
 (uint32_t *)buf);
8652920d2c0024 Tao Zhou        2025-02-10  521  			if (r) {
8652920d2c0024 Tao Zhou        2025-02-10  522  				result =3D r;
8652920d2c0024 Tao Zhou        2025-02-10  523  				goto out;
8652920d2c0024 Tao Zhou        2025-02-10  524  			}
4f4824b55650fa Tom St Denis    2016-04-27  525  			buf +=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  526  			result +=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  527  			size -=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  528  			*pos +=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  529  		}
4f4824b55650fa Tom St Denis    2016-04-27  530  	}
d38ceaf99ed015 Alex Deucher    2015-04-20  531 =20
5a1428242952f2 Tao Zhou        2025-01-22  532  	if (ring->funcs->type !=3D =
AMDGPU_RING_TYPE_CPER) {
4f4824b55650fa Tom St Denis    2016-04-27  533  		while (size) {
4f4824b55650fa Tom St Denis    2016-04-27  534  			if (*pos >=3D (ring->rin=
g_size + 12))
4f4824b55650fa Tom St Denis    2016-04-27 @535  				return result;
d38ceaf99ed015 Alex Deucher    2015-04-20  536 =20
4f4824b55650fa Tom St Denis    2016-04-27  537  			value =3D ring->ring[(*p=
os - 12)/4];
4f4824b55650fa Tom St Denis    2016-04-27  538  			r =3D put_user(value, (u=
int32_t *)buf);
4f4824b55650fa Tom St Denis    2016-04-27  539  			if (r)
4f4824b55650fa Tom St Denis    2016-04-27  540  				return r;
4f4824b55650fa Tom St Denis    2016-04-27  541  			buf +=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  542  			result +=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  543  			size -=3D 4;
4f4824b55650fa Tom St Denis    2016-04-27  544  			*pos +=3D 4;
d38ceaf99ed015 Alex Deucher    2015-04-20  545  		}
5a1428242952f2 Tao Zhou        2025-01-22  546  	} else {
5a1428242952f2 Tao Zhou        2025-01-22  547  		p =3D early[0];
5a1428242952f2 Tao Zhou        2025-01-22  548  		if (early[0] <=3D early[1=
])
5a1428242952f2 Tao Zhou        2025-01-22  549  			size =3D (early[1] - ear=
ly[0]);
5a1428242952f2 Tao Zhou        2025-01-22  550  		else
5a1428242952f2 Tao Zhou        2025-01-22  551  			size =3D ring->ring_size=
 - (early[0] - early[1]);
5a1428242952f2 Tao Zhou        2025-01-22  552 =20
5a1428242952f2 Tao Zhou        2025-01-22  553  		while (size) {
5a1428242952f2 Tao Zhou        2025-01-22  554  			if (p =3D=3D early[1])
8652920d2c0024 Tao Zhou        2025-02-10  555  				goto out;
5a1428242952f2 Tao Zhou        2025-01-22  556 =20
5a1428242952f2 Tao Zhou        2025-01-22  557  			value =3D ring->ring[p];
5a1428242952f2 Tao Zhou        2025-01-22  558  			r =3D put_user(value, (u=
int32_t *)buf);
8652920d2c0024 Tao Zhou        2025-02-10  559  			if (r) {
8652920d2c0024 Tao Zhou        2025-02-10  560  				result =3D r;
8652920d2c0024 Tao Zhou        2025-02-10  561  				goto out;
8652920d2c0024 Tao Zhou        2025-02-10  562  			}
5a1428242952f2 Tao Zhou        2025-01-22  563 =20
5a1428242952f2 Tao Zhou        2025-01-22  564  			buf +=3D 4;
5a1428242952f2 Tao Zhou        2025-01-22  565  			result +=3D 4;
5a1428242952f2 Tao Zhou        2025-01-22  566  			size--;
5a1428242952f2 Tao Zhou        2025-01-22  567  			p++;
5a1428242952f2 Tao Zhou        2025-01-22  568  			p &=3D ring->ptr_mask;
5a1428242952f2 Tao Zhou        2025-01-22  569  		}
5a1428242952f2 Tao Zhou        2025-01-22  570  	}
4f4824b55650fa Tom St Denis    2016-04-27  571 =20
8652920d2c0024 Tao Zhou        2025-02-10  572  out:
8652920d2c0024 Tao Zhou        2025-02-10  573  	if (ring->funcs->type =3D=
=3D AMDGPU_RING_TYPE_CPER)
8652920d2c0024 Tao Zhou        2025-02-10  574  		mutex_unlock(&ring->adev-=
>cper.ring_lock);
8652920d2c0024 Tao Zhou        2025-02-10  575 =20
4f4824b55650fa Tom St Denis    2016-04-27  576  	return result;
d38ceaf99ed015 Alex Deucher    2015-04-20  577  }
d38ceaf99ed015 Alex Deucher    2015-04-20  578 =20

:::::: The code at line 535 was first introduced by commit
:::::: 4f4824b55650fa7014eedf18cb1f9f243cb2b45e drm/amd/amdgpu: Convert rin=
g debugfs entries to binary

:::::: TO: Tom St Denis <tom.stdenis@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
