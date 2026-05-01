Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2237E23E330
	for <oe-kbuild@lists.linux.dev>; Fri,  1 May 2026 05:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777613610; cv=none; b=Adb8BBMZhPLYmyWGyj6XTzfgodUEpOircHvlUm62IwUDrxPwsfsQ7s5DaF5cEvikzeEtVzYqYDED0wq7AS541i7OuRoVwEXXH7DRe1YvEodIwXAMThNUl2Ngr0p9ciqDhuFkLkR/dECKdwt6VPrSSRvClQRHZjFcE9dD6AzPIbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777613610; c=relaxed/simple;
	bh=MB5s+ncHzeShQ99WhA8EezosKLq9hNxfqSpyyN6JJoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=jumYf0kIkm9P2RCnsaIM7fI7GF+o5MBpSZjhdoOucS2unmx+x2pTJkxWmeOTT3g8cFGCgg7Ewspicfx/IOvWSkgqnxlAafhxr+a511dWmHcRA1U3/PDYctglvsB2CkqGONrRW1Srhvto+a4EEaNqh0/21HLPTVzjlJmHkBdXQ5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZHHwqSc9; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZHHwqSc9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777613608; x=1809149608;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=MB5s+ncHzeShQ99WhA8EezosKLq9hNxfqSpyyN6JJoo=;
  b=ZHHwqSc9Xkz1cYNNp6/dibsn1uCWSLZxRMuqhZWgV2NRJ+O0IvPFdPeF
   Jtiz4ahisnfaoSdaR1mk3yxJenFuhMfJ1k7MrYFDIwbVfA+3VXSG7Ca9t
   li/efYrUljkFPGgK5USc8/oiblISuO2UWrXRu1mMiVui+pitpSB6xED8i
   TNVMHQ3Ysdp12oQzT3sUkgY4uEKPAUhvS0uP/l57WHJFsCWPw/ehTwUev
   JO8pDm4YS0Clrn8fS0ethTbeF8dC10Le3xqYUeGbrslywNjHu4nBZvpXT
   QV82B2SsDDZ1BKAWAyTSsF+K//7zyXMAndr/0QVI8auhcHxz+jlJkc5LT
   g==;
X-CSE-ConnectionGUID: iz3xPDXTRRuc8S5b5PSq0w==
X-CSE-MsgGUID: TyBaXCEkQPW9wT/deMSIyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11772"; a="88889448"
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="88889448"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2026 22:33:27 -0700
X-CSE-ConnectionGUID: zcGhTIUMSmqDamWl6Qo+zA==
X-CSE-MsgGUID: ySFiweKmQZWo5n6BWz6woA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,209,1770624000"; 
   d="scan'208";a="236582483"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 Apr 2026 22:33:26 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wIgV9-000000000Cz-4A0i;
	Fri, 01 May 2026 05:33:23 +0000
Date: Fri, 01 May 2026 13:33:15 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 606/2395]
 drivers/dma-buf/st-dma-fence-unwrap.c:78:39-45: ERROR: reference preceded by
 free on line 73
Message-ID: <202605011331.RYA0yHR9-lkp@intel.com>
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
head:   b9303e6bff706758c167af686b5315ad00233bf8
commit: 465f3934381c4e9a5bf9fe0eb866275b0ece5a5d [606/2395] dma-buf: Change=
 st-dma-fence-unwrap.c to use kunit
:::::: branch date: 18 hours ago
:::::: commit date: 2 weeks ago
config: arm64-randconfig-r053-20260501 (https://download.01.org/0day-ci/arc=
hive/20260501/202605011331.RYA0yHR9-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 5ba=
c06718f502014fade905512f1d26d578a18f3)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202605011331.RYA0yHR9-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma-buf/st-dma-fence-unwrap.c:78:39-45: ERROR: reference precede=
d by free on line 73

vim +78 drivers/dma-buf/st-dma-fence-unwrap.c

d2a0b1bc5773d31 Tvrtko Ursulin  2024-11-15  48 =20
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  49  static struct dma_fenc=
e *mock_array(unsigned int num_fences, ...)
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  50  {
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  51  	struct dma_fence_arra=
y *array;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  52  	struct dma_fence **fe=
nces;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  53  	va_list valist;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  54  	int i;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  55 =20
bf4afc53b77aeaa Linus Torvalds  2026-02-21  56  	fences =3D kzalloc_objs(*f=
ences, num_fences);
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  57  	if (!fences)
0c5064fa8d5a02d Christian K=C3=B6nig 2022-05-04  58  		goto error_put;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  59 =20
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  60  	va_start(valist, num_=
fences);
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  61  	for (i =3D 0; i < num=
_fences; ++i)
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  62  		fences[i] =3D va_arg=
(valist, typeof(*fences));
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  63  	va_end(valist);
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  64 =20
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  65  	array =3D dma_fence_a=
rray_create(num_fences, fences,
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  66  				       dma_fence_c=
ontext_alloc(1),
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  67  				       1, false);
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  68  	if (!array)
0c5064fa8d5a02d Christian K=C3=B6nig 2022-05-04  69  		goto error_free;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  70  	return &array->base;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  71 =20
0c5064fa8d5a02d Christian K=C3=B6nig 2022-05-04  72  error_free:
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11 @73  	kfree(fences);
0c5064fa8d5a02d Christian K=C3=B6nig 2022-05-04  74 =20
0c5064fa8d5a02d Christian K=C3=B6nig 2022-05-04  75  error_put:
0c5064fa8d5a02d Christian K=C3=B6nig 2022-05-04  76  	va_start(valist, num_=
fences);
0c5064fa8d5a02d Christian K=C3=B6nig 2022-05-04  77  	for (i =3D 0; i < num=
_fences; ++i)
0c5064fa8d5a02d Christian K=C3=B6nig 2022-05-04 @78  		dma_fence_put(va_arg=
(valist, typeof(*fences)));
0c5064fa8d5a02d Christian K=C3=B6nig 2022-05-04  79  	va_end(valist);
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  80  	return NULL;
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  81  }
64a8f92fd783e75 Christian K=C3=B6nig 2022-03-11  82 =20

:::::: The code at line 78 was first introduced by commit
:::::: 0c5064fa8d5a02dc2dcc6c674a0ad1bbaf79efda dma-buf: cleanup dma_fence_=
unwrap selftest v2

:::::: TO: Christian K=C3=B6nig <christian.koenig@amd.com>
:::::: CC: Christian K=C3=B6nig <christian.koenig@amd.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
