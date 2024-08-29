Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4171D4D8AD
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Aug 2024 03:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724903086; cv=none; b=sDUDTgVnAyWz9YiUH7bMC7oenGPOtUas/9zLfAVn87+em5b9Z6huYwi2WV6aP427FrYBYt0fJ9PSSKHQTIaxZ6W2eQ5zc1BOhkARQrh/I3lxRXfCphPBBtRbY1aYt/PiJoBEwt9+DD2Yqle3DpnWTOY7/7NwfKITPd/kJItlFR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724903086; c=relaxed/simple;
	bh=HqNXePIv6glXz5a9DxvTrFSY0jQQlK0KarXNni6YF74=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I1ex7abYh1CmngWj0n8nuLnN4APGn2P2IIceh5XZV3boAzTpELlLQx0zNFU0XmsezE/zW63h5Q1U2a9nKqaqNDcahlqFrNKUf55ZH0hcU7TCfg0A16TgiP8mOfO4xtJ1J5rFxvghmLC6q0WgZoRkeQUNmLUw/jXTsqxQk2ZJcc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WTC6ZjNU; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WTC6ZjNU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724903084; x=1756439084;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HqNXePIv6glXz5a9DxvTrFSY0jQQlK0KarXNni6YF74=;
  b=WTC6ZjNUbV75GCMdneIjF7zlw2VVM9V9Ongij1lFn2Fxn+jCS+y6x2kj
   dgNoFrJ+2Uy0x1aazEsjgheJTPdEErTH8cScVzcoPza6lgZNw1WWlz/v2
   l/2/PnTrGG8QQ4eKaklLxdPF2hkYbocRAmiyQCw6x5oi/bqIXb0zI7ZXW
   GE4z/3vz/yFp0G1nNy1bkQl6E3ezsguqXX+FISyjG+Z9X8cbaf9Eg3KYO
   +0SJqmQvUjnU+9H5nEKQqjHIQAyOzYd+Qce3qacEssuKl9+8P298Ke3d6
   pJEiB/GCcmmcqLVJy0r9LI4dc9BuGbK10P8/lCgXAPARU3XlEQlzaPp4a
   w==;
X-CSE-ConnectionGUID: wmx2aeJgRx2wuuLeDpOIHQ==
X-CSE-MsgGUID: H8gLHR6zS6ymP7giRFMwhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11178"; a="40945884"
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="40945884"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2024 20:44:44 -0700
X-CSE-ConnectionGUID: 2xsNEgreQIS8s6y836kWnw==
X-CSE-MsgGUID: Zkl9ZYjdQWS74dSaAM7pPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,184,1719903600"; 
   d="scan'208";a="68343620"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 28 Aug 2024 20:44:42 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjW5Q-000LdY-16;
	Thu, 29 Aug 2024 03:44:40 +0000
Date: Thu, 29 Aug 2024 11:44:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 4/5] udmabuf: udmabuf_create codestyle cleanup
Message-ID: <202408291101.WAf552sW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20240822084342.1574914-5-link@vivo.com>
References: <20240822084342.1574914-5-link@vivo.com>
TO: Huan Yang <link@vivo.com>
TO: Sumit Semwal <sumit.semwal@linaro.org>
TO: "Christian König" <christian.koenig@amd.com>
TO: Gerd Hoffmann <kraxel@redhat.com>
TO: linux-media@vger.kernel.org
TO: dri-devel@lists.freedesktop.org
TO: linaro-mm-sig@lists.linaro.org
TO: linux-kernel@vger.kernel.org
CC: opensource.kernel@vivo.com
CC: Huan Yang <link@vivo.com>

Hi Huan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6a7917c89f219f09b1d88d09f376000914a52763]

url:    https://github.com/intel-lab-lkp/linux/commits/Huan-Yang/udmabuf-direct-map-pfn-when-first-page-fault/20240826-105359
base:   6a7917c89f219f09b1d88d09f376000914a52763
patch link:    https://lore.kernel.org/r/20240822084342.1574914-5-link%40vivo.com
patch subject: [PATCH v4 4/5] udmabuf: udmabuf_create codestyle cleanup
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20240829 (https://download.01.org/0day-ci/archive/20240829/202408291101.WAf552sW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202408291101.WAf552sW-lkp@intel.com/

smatch warnings:
drivers/dma-buf/udmabuf.c:467 udmabuf_create() error: double free of 'folios'

vim +/folios +467 drivers/dma-buf/udmabuf.c

fb2c508270085b Huan Yang       2024-08-22  395  
c1bbed66899726 Gurchetan Singh 2019-12-02  396  static long udmabuf_create(struct miscdevice *device,
c1bbed66899726 Gurchetan Singh 2019-12-02  397  			   struct udmabuf_create_list *head,
c1bbed66899726 Gurchetan Singh 2019-12-02  398  			   struct udmabuf_create_item *list)
fbb0de79507819 Gerd Hoffmann   2018-08-27  399  {
fb2c508270085b Huan Yang       2024-08-22  400  	pgoff_t pgcnt = 0, pglimit, max_ipgcnt = 0;
fb2c508270085b Huan Yang       2024-08-22  401  	long ret = -EINVAL;
fbb0de79507819 Gerd Hoffmann   2018-08-27  402  	struct udmabuf *ubuf;
fb2c508270085b Huan Yang       2024-08-22  403  	struct folio **folios = NULL;
fb2c508270085b Huan Yang       2024-08-22  404  	u32 i, flags;
fbb0de79507819 Gerd Hoffmann   2018-08-27  405  
33f35429fc49c0 Gerd Hoffmann   2018-09-11  406  	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
fbb0de79507819 Gerd Hoffmann   2018-08-27  407  	if (!ubuf)
fbb0de79507819 Gerd Hoffmann   2018-08-27  408  		return -ENOMEM;
fbb0de79507819 Gerd Hoffmann   2018-08-27  409  
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  410  	INIT_LIST_HEAD(&ubuf->unpin_list);
dc4716d75154b3 Gerd Hoffmann   2018-09-11  411  	pglimit = (size_limit_mb * 1024 * 1024) >> PAGE_SHIFT;
fbb0de79507819 Gerd Hoffmann   2018-08-27  412  	for (i = 0; i < head->count; i++) {
fb2c508270085b Huan Yang       2024-08-22  413  		pgoff_t itempgcnt;
fb2c508270085b Huan Yang       2024-08-22  414  
fb2c508270085b Huan Yang       2024-08-22  415  		if (!PAGE_ALIGNED(list[i].offset))
0d17455ca85ecb Gerd Hoffmann   2018-09-11  416  			goto err;
fb2c508270085b Huan Yang       2024-08-22  417  		if (!PAGE_ALIGNED(list[i].size))
0d17455ca85ecb Gerd Hoffmann   2018-09-11  418  			goto err;
fb2c508270085b Huan Yang       2024-08-22  419  
fb2c508270085b Huan Yang       2024-08-22  420  		itempgcnt = list[i].size >> PAGE_SHIFT;
fb2c508270085b Huan Yang       2024-08-22  421  		pgcnt += itempgcnt;
fb2c508270085b Huan Yang       2024-08-22  422  
fb2c508270085b Huan Yang       2024-08-22  423  		if (pgcnt > pglimit)
0d17455ca85ecb Gerd Hoffmann   2018-09-11  424  			goto err;
fb2c508270085b Huan Yang       2024-08-22  425  
fb2c508270085b Huan Yang       2024-08-22  426  		max_ipgcnt = max_t(unsigned long, itempgcnt, max_ipgcnt);
fbb0de79507819 Gerd Hoffmann   2018-08-27  427  	}
2b6dd600dd7257 Pavel Skripkin  2021-12-30  428  
fb2c508270085b Huan Yang       2024-08-22  429  	if (!pgcnt)
2b6dd600dd7257 Pavel Skripkin  2021-12-30  430  		goto err;
2b6dd600dd7257 Pavel Skripkin  2021-12-30  431  
fb2c508270085b Huan Yang       2024-08-22  432  	ubuf->folios = kvmalloc_array(pgcnt, sizeof(*ubuf->folios),
fbb0de79507819 Gerd Hoffmann   2018-08-27  433  				      GFP_KERNEL);
5e72b2b41a21e5 Vivek Kasireddy 2024-06-23  434  	if (!ubuf->folios) {
fbb0de79507819 Gerd Hoffmann   2018-08-27  435  		ret = -ENOMEM;
0d17455ca85ecb Gerd Hoffmann   2018-09-11  436  		goto err;
fbb0de79507819 Gerd Hoffmann   2018-08-27  437  	}
fb2c508270085b Huan Yang       2024-08-22  438  
fb2c508270085b Huan Yang       2024-08-22  439  	ubuf->offsets = kvcalloc(pgcnt, sizeof(*ubuf->offsets), GFP_KERNEL);
0c8b91ef5100ea Vivek Kasireddy 2024-06-23  440  	if (!ubuf->offsets) {
0c8b91ef5100ea Vivek Kasireddy 2024-06-23  441  		ret = -ENOMEM;
0c8b91ef5100ea Vivek Kasireddy 2024-06-23  442  		goto err;
0c8b91ef5100ea Vivek Kasireddy 2024-06-23  443  	}
fbb0de79507819 Gerd Hoffmann   2018-08-27  444  
fb2c508270085b Huan Yang       2024-08-22  445  	folios = kvmalloc_array(max_ipgcnt, sizeof(*folios), GFP_KERNEL);
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  446  	if (!folios) {
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  447  		ret = -ENOMEM;
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  448  		goto err;
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  449  	}
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  450  
fb2c508270085b Huan Yang       2024-08-22  451  	for (i = 0; i < head->count; i++) {
fb2c508270085b Huan Yang       2024-08-22  452  		ret = __udmabuf_pin_list_folios(&list[i], ubuf, folios);
fb2c508270085b Huan Yang       2024-08-22  453  		if (ret)
0d17455ca85ecb Gerd Hoffmann   2018-09-11  454  			goto err;
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  455  	}
452dc1b0221804 Huan Yang       2024-08-22  456  	kvfree(folios);
fbb0de79507819 Gerd Hoffmann   2018-08-27  457  
5e72b2b41a21e5 Vivek Kasireddy 2024-06-23  458  	flags = head->flags & UDMABUF_FLAGS_CLOEXEC ? O_CLOEXEC : 0;
5e72b2b41a21e5 Vivek Kasireddy 2024-06-23  459  	ret = export_udmabuf(ubuf, device, flags);
5e72b2b41a21e5 Vivek Kasireddy 2024-06-23  460  	if (ret < 0)
0d17455ca85ecb Gerd Hoffmann   2018-09-11  461  		goto err;
fbb0de79507819 Gerd Hoffmann   2018-08-27  462  
5e72b2b41a21e5 Vivek Kasireddy 2024-06-23  463  	return ret;
fbb0de79507819 Gerd Hoffmann   2018-08-27  464  
0d17455ca85ecb Gerd Hoffmann   2018-09-11  465  err:
c6a3194c05e7e6 Vivek Kasireddy 2024-06-23  466  	unpin_all_folios(&ubuf->unpin_list);
fb2c508270085b Huan Yang       2024-08-22 @467  	kvfree(folios);
452dc1b0221804 Huan Yang       2024-08-22  468  	kvfree(ubuf->offsets);
452dc1b0221804 Huan Yang       2024-08-22  469  	kvfree(ubuf->folios);
fbb0de79507819 Gerd Hoffmann   2018-08-27  470  	kfree(ubuf);
fbb0de79507819 Gerd Hoffmann   2018-08-27  471  	return ret;
fbb0de79507819 Gerd Hoffmann   2018-08-27  472  }
fbb0de79507819 Gerd Hoffmann   2018-08-27  473  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
