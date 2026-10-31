Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793469641;
	b=ItAgTPuqtY0LxQuqe3BwFFGDIbY9ds7h0jjikJLuh8ZC97ZsirhqvZbngshdoTS2ebqz
	 0L6xd2ijhQdH2LIlcgxGued1lt54cvupqqFisvBJ4IxqvvWvFHbCHqcRP4EUXHSUlwxNr
	 nKtVlyPGzenYM7k3nS6h/+pC7Iy5eqNKPV9YUyhMbdFxcphohMrdLdWtY0sEVV2a5Gles
	 5WxiEaK5RtTNq+leW8OYkEt7TPSAF97kV8DxNIlvdzNdRZvj5pq/TS9P6i00vplrsdhTd
	 Wn3+78EdO0++A85n+fJ9c5xuhuWIQcNBcQ4ZQ8OKpkG8VwGSEhOmJznLdc7cyrA3PMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793469641;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=WbBmDn5HAtE9dNLPo5L/MadKe2+8ZfUW0xi3eS+011s=;
	b=llaP1u7mjoQ9dHgKoQ5QEbo+ukwzQS6d0pW/TsMAind5IZj6eLLfMdEoI3xOm4sUpxtB
	 RakqJkjd5Ih873Xz5crhhkoWkKTxcUZcbSeZORa6GJ02Ae2KukuRD2L9gXT521iYPr8nb
	 U15jyhTHAq09SY/UyrE5kSid/+6/tu2Mo95mR4XUAfwHbovxMKqgXl2c7XmlVf4KlRFKp
	 IE0cAK5Xzc7pUh5BKqhxxuhT1EvGkWt0M4PaDqSL/M5U8DBKJZmaJzR0H9qZ8jAe7Upa7
	 xctvj7bFmY1gt8DtLKxTcvhhnJdsaJPiUdZh4xQmHtHFyvRnFz2AkEZP2QjLwNFsnBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Igqey0nP;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F65606A31E
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 18:00:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2F65606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Igqey0nP
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793469639; x=1825005639;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=OwsqsaxyD2J4tg1SyCJUwMASfWd3ng96GnnxdDgJj/c=;
  b=Igqey0nPsmvTMiEgDRHsTdze9X5/gNfZUM1VSOdb4HrgqFQC5jiSbtfQ
   +wPtLt2P7cSJxOLFrdE2753cgjju78mG22izBVn0IFMMvjnU04fVcqQ4l
   4JR/O7xyED7g7yH+kTxPzv96yzs4/pUp8/Ri+KKWv2Jnrcgz5nURvbwM3
   vLqmUeLU947mlm0tCQbSUslTxumh0TK8u08OvZ97IHFvkDz4jo8uMDT3X
   oazWOKvNS4HUt++z6YXOnFvMcL+M6rjBkv+bEQwTU3UduR/k2Kae3Muud
   TsszBZh8ZbfOzhLRloaHGQmXF6rITCTva3KR8HJDQgBWivtqqA7iJLef8
   A==;
X-CSE-ConnectionGUID: vANj2icUS1K+Ek4Q+f47iw==
X-CSE-MsgGUID: 0x2FNfzsRsyzN6NJaT/Gzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2241438"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2241438"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 11:00:39 -0700
X-CSE-ConnectionGUID: kUFoSBjNTyum0VxBvEGuVQ==
X-CSE-MsgGUID: bxc9dxdVROukFGdq++P8Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="6045072"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 31 Oct 2026 11:00:36 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNDNY-0000000064Z-1tq7;
	Sat, 31 Oct 2026 18:00:32 +0000
Date: Sat, 31 Oct 2026 18:59:40 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma-buf/st-dma-fence-unwrap.c:78:39-45: ERROR:
 reference preceded by free on line 73
Message-ID: <202610311834.gQfLsAf5-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
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
head:   36aad21d50d1af3f6954bb0c988257a908202477
commit: 465f3934381c4e9a5bf9fe0eb866275b0ece5a5d dma-buf: Change st-dma-fen=
ce-unwrap.c to use kunit
date:   7 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 7 months ago
config: sparc64-randconfig-r2109-20261031 (https://download.01.org/0day-ci/=
archive/20261031/202610311834.gQfLsAf5-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 465f3934381c ("dma-buf: Change st-dma-fence-unwrap.c to use kunit")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202610311834.gQfLsAf5-lkp@intel.com/

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
