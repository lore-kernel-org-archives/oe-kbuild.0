Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A3E4B048D
	for <oe-kbuild@lists.linux.dev>; Sat, 15 Aug 2026 00:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786754828; cv=none; b=eu80jh04OjZDE5MTdzArRJRDsvTp6b7CsZtJAjGYH7rh2fafruOP2lbx2GY+TfcLiQ7tE6p57niCtL7PAT6qAHXTGp2xg8rlIYW4tXj4RRYlQ7jnzW8pTVNXkWabT8vAnnrZpu+nXGCzaF1H43iGmjZnLnN5THMI0ThxnaXCBI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786754828; c=relaxed/simple;
	bh=touY3UW8E4mSzIAPtIq3HGn5R5XBvbR6hZ+rqoBz5kY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DQJq3EdvDK3Sw26LQHYku3hC9umwaAfVy8Fud/J8EiDTgTJLMRbtarIaFH7ynjOysc+5LRQ/ptva7pHca4Hh5qTQMp/46yRVqRGRyoZxPKurd2lFwIisPVzIER1+njxE+v7btazDIfC5K65da2uT8awwMBlr+zYn/YDvQXnWTxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZJejDz5z; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZJejDz5z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786754827; x=1818290827;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=touY3UW8E4mSzIAPtIq3HGn5R5XBvbR6hZ+rqoBz5kY=;
  b=ZJejDz5zNK6ZYr6IgmsRRn6T+31xIaRw6kbhKvUTR1Ttm1b0ouhNdF/n
   zvIgN3EWnJN2vT1wfzU822BC4X3Zpo6xJZPlpUS7ps3YPpaoB0MIzzmjJ
   6sgLLHAzMnmr/cgcQYyqQgDGmsTKGQ6r46d9Cmshsp+GdRkcc8//olBlS
   /d/uyuf3Kdsa2bOxwGEqJ82EsN18kC6cYeEwxQP5BHlmaESYSopQn8nVl
   56VioojymXkc1/uZ+yBEwggDCvZqAlg81mlh6pmEakEHIkxTdNO/tgY6l
   Ewf8pv8yj8hYglMeE8q2AlAQ5kMzxDNxvwBx7RwB4XVRAzEfpPKqWG7Ae
   g==;
X-CSE-ConnectionGUID: GSaGM6l2RZWcKIFNWA5kfw==
X-CSE-MsgGUID: uHYacSbhRjCkhj4gW/8yhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11875"; a="97679144"
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="97679144"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 17:47:06 -0700
X-CSE-ConnectionGUID: qiomP5OFQJCspKqgaMe6Kg==
X-CSE-MsgGUID: m0b7LrJ6TnGkr8t5fxSN8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,224,1779174000"; 
   d="scan'208";a="264402638"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 Aug 2026 17:47:05 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wv2YA-00000000afx-2tBw;
	Sat, 15 Aug 2026 00:47:02 +0000
Date: Sat, 15 Aug 2026 08:46:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma-buf/st-dma-fence-unwrap.c:78:39-45: ERROR:
 reference preceded by free on line 73
Message-ID: <202608150847.VYhJK9Ic-lkp@intel.com>
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

Hi Jason,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2f1baf1fc8929e6c48370be543ad028ac7ad4131
commit: 465f3934381c4e9a5bf9fe0eb866275b0ece5a5d dma-buf: Change st-dma-fen=
ce-unwrap.c to use kunit
date:   4 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 4 months ago
config: arc-randconfig-r064-20260815 (https://download.01.org/0day-ci/archi=
ve/20260815/202608150847.VYhJK9Ic-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 465f3934381c ("dma-buf: Change st-dma-fence-unwrap.c to use kunit")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202608150847.VYhJK9Ic-lkp@intel.com/

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
