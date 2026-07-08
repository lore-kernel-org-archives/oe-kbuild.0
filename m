Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7ED03161A2
	for <oe-kbuild@lists.linux.dev>; Wed,  8 Jul 2026 14:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783521563; cv=none; b=HQyWFaTxEIHezDGCC0JRDGVH2vB594QTdbaxl7Gm5FKvzuqjh9SQcfj22zEcvVBKcht/Jbp0lEniMnGi1wpHhGm7f2l67YQpwb4fE/yo2NRN1naMeiJ7rXJ7FNtuGFh/FDbjqucML5PtYpVy8+a4sEk0N50kmQwWLEiFuKGAUMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783521563; c=relaxed/simple;
	bh=rumiPsseN5tzpehXxeZXOZl6qslZCT9OFXU6/+5u3uk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GkEuK0Y4msc4DvTn0E32L0v0sGrk6FvWfwiQg+22hCdtSWZLXjPcUPehzx3zyLLWt8TyXVLW+yaltFt+ewTmuggGEcbVHhC73edFg2QgoTPpyhtM+Pyq6IssaR59ov7yiSxMx6mmBw9VdU4T5RctXmxo1+Bc0gsAEwqiypA3Ysc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aDDddCs8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aDDddCs8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783521562; x=1815057562;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rumiPsseN5tzpehXxeZXOZl6qslZCT9OFXU6/+5u3uk=;
  b=aDDddCs85tCBAimyztrfKyQ3doTZXmIRGwkbZN+SeLCuGdeWDCxu4ku+
   qJJn6JksDese1iVtV/NUGCxEaZg3/PN85l3Kkb4IRISKnnnqKBIAIw3jS
   LcMkgF/V4t+X5rr5+81/f2TGn2R79mzTwCfhRMROP88icpWg0WiwM1/RG
   jk/162LHfnNn6Eo8IiOJfVzBorEydk6cox3zthRE4dYBDMD8D9OcxcnCR
   myJdajRnIqAM3pFVFuVhFgamzwMlr3wm/LOMC80tEK2ZfTgrH8mA2VECf
   eyfubgVrNuhGmR637ONGpcy8090drbcomSLOiWuDi31OgLKS/8s0eJ3ZS
   Q==;
X-CSE-ConnectionGUID: K+//LJa6Qfm6SIQQy4z0ug==
X-CSE-MsgGUID: DsZeTXD9QcuPiUVoki1F7Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95701740"
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="95701740"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jul 2026 07:39:21 -0700
X-CSE-ConnectionGUID: MRfD6njvRLaDsYkRphOm3Q==
X-CSE-MsgGUID: CJSqZHXnQb+u74M6ULkyXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,153,1779174000"; 
   d="scan'208";a="278693216"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 08 Jul 2026 07:39:19 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1whTQj-00000000GWf-0lZZ;
	Wed, 08 Jul 2026 14:39:17 +0000
Date: Wed, 08 Jul 2026 22:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma-buf/st-dma-fence-unwrap.c:78:39-45: ERROR:
 reference preceded by free on line 73
Message-ID: <202607082203.3H4x0YzO-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0e35b9b6ec0ffcc5e23cbdec09f5c622ad532b53
commit: 465f3934381c4e9a5bf9fe0eb866275b0ece5a5d dma-buf: Change st-dma-fen=
ce-unwrap.c to use kunit
date:   3 months ago
:::::: branch date: 2 days ago
:::::: commit date: 3 months ago
config: hexagon-randconfig-r052-20260708 (https://download.01.org/0day-ci/a=
rchive/20260708/202607082203.3H4x0YzO-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 465f3934381c ("dma-buf: Change st-dma-fence-unwrap.c to use kunit")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607082203.3H4x0YzO-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma-buf/st-dma-fence-unwrap.c:78:39-45: ERROR: reference precede=
d by free on line 73

vim +78 drivers/dma-buf/st-dma-fence-unwrap.c

d2a0b1bc5773d3 Tvrtko Ursulin  2024-11-15  48 =20
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  49  static struct dma_fence=
 *mock_array(unsigned int num_fences, ...)
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  50  {
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  51  	struct dma_fence_array=
 *array;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  52  	struct dma_fence **fen=
ces;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  53  	va_list valist;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  54  	int i;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  55 =20
bf4afc53b77aea Linus Torvalds  2026-02-21  56  	fences =3D kzalloc_objs(*fe=
nces, num_fences);
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  57  	if (!fences)
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  58  		goto error_put;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  59 =20
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  60  	va_start(valist, num_f=
ences);
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  61  	for (i =3D 0; i < num_=
fences; ++i)
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  62  		fences[i] =3D va_arg(=
valist, typeof(*fences));
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  63  	va_end(valist);
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  64 =20
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  65  	array =3D dma_fence_ar=
ray_create(num_fences, fences,
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  66  				       dma_fence_co=
ntext_alloc(1),
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  67  				       1, false);
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  68  	if (!array)
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  69  		goto error_free;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  70  	return &array->base;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  71 =20
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  72  error_free:
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11 @73  	kfree(fences);
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  74 =20
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  75  error_put:
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  76  	va_start(valist, num_f=
ences);
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  77  	for (i =3D 0; i < num_=
fences; ++i)
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04 @78  		dma_fence_put(va_arg(=
valist, typeof(*fences)));
0c5064fa8d5a02 Christian K=C3=B6nig 2022-05-04  79  	va_end(valist);
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  80  	return NULL;
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  81  }
64a8f92fd783e7 Christian K=C3=B6nig 2022-03-11  82 =20

:::::: The code at line 78 was first introduced by commit
:::::: 0c5064fa8d5a02dc2dcc6c674a0ad1bbaf79efda dma-buf: cleanup dma_fence_=
unwrap selftest v2

:::::: TO: Christian K=C3=B6nig <christian.koenig@amd.com>
:::::: CC: Christian K=C3=B6nig <christian.koenig@amd.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
