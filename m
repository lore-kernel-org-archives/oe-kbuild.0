Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B7847CC78
	for <oe-kbuild@lists.linux.dev>; Fri, 25 Sep 2026 21:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790372812; cv=none; b=IopmmaVMOdch5RwnbrhEdY3WlqSPDzLQaKtiPVcKgP6qAPlA/3deu4Px+C412NJLikms+K37GV86QFEUDgff4vK1zBm9L1HNQjtF5/DQ8yFgo6M4AOlEec0VR+zbxl+WdEmXmo+sYqBW/TKUPkGRBF3Kz6bh7wV+pzSstkHAIk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790372812; c=relaxed/simple;
	bh=sWONxxNCSmx7d5eOSYxEMz+ScAjeeTb+YfOxfnrBgZc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=kpG507h7SoguS9bMJ3+0Z5ggz1zO9zvT4YqMafl/EBL5xpk/NJUOXrYsrtVIe0xdr7K+BD2Nzt0pK/XcnrmaIy5o3DO2kc/r/mpZwHPNsvzCDFI/0uQjh9BgTjL+9zZ1fVH+8TM618i1uQVE4gbdVI407PaGobr7pk731XUsOAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SmNH0fZl; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SmNH0fZl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790372810; x=1821908810;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sWONxxNCSmx7d5eOSYxEMz+ScAjeeTb+YfOxfnrBgZc=;
  b=SmNH0fZlBQ+zqbmPFY49+ExMZYkohZXCftWLBRTogorn14HEPhj5iso2
   zKfqLRhNu7mo+J7+RX0WFQU6XHInPLbKdtKn2TbbfFFLfW/JH45tkgyfz
   fbnSFTj9d4v5lFpSE9Zet6WO/Znrium/zOIs+uzKodq9t93r251H64F9n
   h/zg01dZPzXT0ITw6OJZ2ykLf5l7D5BNPBUC8gA+QvED9zTMQdAuFBUAh
   wZcUcS31VmTGGu8W9z2CtcVWJYhwupUphRs6Zp7yayWZAonA65KMtKrgh
   LoopTIQeMkPWmSolKSLYQQWjuzmHeLD1uxmR2h5/3RTi0Tn9oILYpxJql
   w==;
X-CSE-ConnectionGUID: BKvW1irzRreyDpXKFI7A8g==
X-CSE-MsgGUID: oqa6NyxSTZWXw2Jd1ws0Gw==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="102529010"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="102529010"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 14:46:44 -0700
X-CSE-ConnectionGUID: 7AaxCImySQmHN+6hnLsE3g==
X-CSE-MsgGUID: if7nv3SVS+2z6Y3cyq9xNw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="303948784"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 25 Sep 2026 14:46:42 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xADke-000000000ua-2LNv;
	Fri, 25 Sep 2026 21:46:40 +0000
Date: Fri, 25 Sep 2026 23:46:30 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma-buf/st-dma-fence-unwrap.c:78:39-45: ERROR:
 reference preceded by free on line 73
Message-ID: <202609252334.75g7QwVZ-lkp@intel.com>
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
head:   165768bb70265b5c38cf0b73fafd75be235f8b14
commit: 465f3934381c4e9a5bf9fe0eb866275b0ece5a5d dma-buf: Change st-dma-fen=
ce-unwrap.c to use kunit
date:   5 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 5 months ago
config: i386-randconfig-2100-20260925 (https://download.01.org/0day-ci/arch=
ive/20260925/202609252334.75g7QwVZ-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 465f3934381c ("dma-buf: Change st-dma-fence-unwrap.c to use kunit")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202609252334.75g7QwVZ-lkp@intel.com/

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
