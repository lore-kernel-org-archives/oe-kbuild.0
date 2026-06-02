Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A052C08BC
	for <oe-kbuild@lists.linux.dev>; Tue,  2 Jun 2026 04:46:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780375565; cv=none; b=QTY0nZP9DUyRkfFZU5YvJkKl2y6qwn69L4lc4Ub9igbz1pBu6NXsppXeAPk+JGZ2EMC4cbXjhucs5O7vkYxLFoA+yd+4E1lPWnpi93sCLjn0GZGgFwfUC9Cb3pvspcqqsvcGr6iFK3MafT7lngZCbl8enHTj8wJki8fm2jOCx/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780375565; c=relaxed/simple;
	bh=zGoH8xaam8YlxEfCSY0ge3E7uhYO5/LtRHbaiwSMW6Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tw10CKGw8CT1NWugyktJyreJr7X7zjZxZOAR1jguedPeu/Wnn1/spPseQR9qUqCv7Zq6X8E0Pnz/mWNELmrftXjwX/zgFj56t6ZzqHntikW8umn25aViiBf4T54sA2tKPlgurYhrXO9XmK4fhJkr2O0fcnC59emSpiFFmaZUhVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OQqej5m7; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OQqej5m7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780375563; x=1811911563;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zGoH8xaam8YlxEfCSY0ge3E7uhYO5/LtRHbaiwSMW6Y=;
  b=OQqej5m7YLLsTMXXZ+1xrigYyHoS7SjQ/qmHcUgvhPAqGPTzL1otBXSf
   MY3KP0jo+eiroL0JQsdhqfmg50FIRcu/rQEe079kvm1nCN5ihpqJPNRFy
   1UzCB4lwTBVYjv1NWh2TD1qPogboUp563k0+ToDQC+6zYJzytugonXXji
   uXQ12Qg97TA29XtuBkcg/cJjovKCbX/TSJHBxjShUdRMpfQl1xRhw1s1q
   7a+mf1vxt2MdzOTHbZln6OrPnDZYvn5blNrpOEzLplH90JzE5eXpUybDw
   V7GNxRaOgzPH2bHkfTTp2W0j0rXlfAkdvISgFmlmzyXq3kYu0jh6MJyev
   w==;
X-CSE-ConnectionGUID: PGmhzqemSKGdYIM4ltw9EA==
X-CSE-MsgGUID: jH0qhzPJRUKEv0vf6gX78Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11804"; a="106597285"
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="106597285"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 21:46:03 -0700
X-CSE-ConnectionGUID: l3GaoxeYR3mj0xRc8HZAPQ==
X-CSE-MsgGUID: jKh1kGqORSWNCmjYN7k6hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,182,1774335600"; 
   d="scan'208";a="241295072"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 01 Jun 2026 21:46:02 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wUH0q-00000000BWK-01E3;
	Tue, 02 Jun 2026 04:46:00 +0000
Date: Tue, 02 Jun 2026 12:45:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 403/9733]
 drivers/dma-buf/st-dma-fence-unwrap.c:78:39-45: ERROR: reference preceded by
 free on line 73
Message-ID: <202606021228.OUhP8L9o-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

Hi Jason,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   7da7f07112610a520567421dd2ffcb51beaefbcc
commit: 465f3934381c4e9a5bf9fe0eb866275b0ece5a5d [403/9733] dma-buf: Change=
 st-dma-fence-unwrap.c to use kunit
:::::: branch date: 3 days ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-102-20260602 (https://download.01.org/0day-ci/arc=
hive/20260602/202606021228.OUhP8L9o-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606021228.OUhP8L9o-lkp@intel.com/

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
