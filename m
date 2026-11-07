Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794045418;
	b=X6XrJHu4gSJK+jGRlvRttzlaFG4iO6OFqJdWNSxu7LqOqiVbLI/Wxh8Rx9JIK21mFpyz
	 /gJbAbYiPBkqkMMTbAfo0CmH3fC4PI2apBIE17YODVqJmRibq3TdnSLY5ID/byplW9dcM
	 VH0hkwjtQ+0WVJTAaHa9aibxmg1+N0MzjUIn3NPOjkkzFAPFtj2roqRQoJWMqy94dBus1
	 DvuiPL4qn932Q9KjPlHcwQfahyk4CtGNvahY/Id0kNfxghmIHabLVqZpX+eafqnfhjPwR
	 ChJh3uqQu8pbSPt1Z4CjVkDH3k4n1v9IDTTSrsejDkdO5mhDtFKWGfY/F1ZcgN/Z36A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794045418;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=VMa70YwrE+nLllqmq90l2gel4QYA3ssPPTjIlnjl7hU=;
	b=U5WycvA/eufSPqTE5Evb+EOuXzKO2JO60ObP1IdmUU2JhvR28cQLjy55z6Szru9As+i/
	 gcv48mlNMyryk9seRRO2RAeo1AyN89mrKlW7TcOij/3W0moWmxLj5t/xVIcMiaNscbr1f
	 mp8RKQKF6vYizgnRrbuEtv1vJaMLI5rp0K4H64/zGFo9svUysmDnwYV6evMWX/4KOuJIz
	 pTnxCRu10/1DtahkSu4a7cVk33e8kOucmu6+G83bKc74FquEg9fzcbpPl9Vu+o01b18iu
	 Say9i+Glv7BpNFu99DppXgg0krXQ1kgcxOjobda58ZZmq+EQ17vb7Bo/mT/h0IE8xtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oCtf5tOf;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43328606A326
	for <oe-kbuild@lists.linux.dev>; Sat,  7 Nov 2026 09:56:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 43328606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=oCtf5tOf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794045418; x=1825581418;
  h=date:from:to:cc:subject:message-id;
  bh=yJXW/zWZ2MHlp9wvFqp9/HthGXgAjiqcHY1ruZCMCek=;
  b=oCtf5tOf3iPGvYkIR0EPmB5NKEJ2HGHm9qzDM++/LZQ4mfZ0jvBehG8W
   EuXoiQ5QrWk6cMM8b5ygY543GMeE6WQc5dnTFOs+L1xbqiiyANoxQk0Nw
   g9G10Z0UiiFhTg2NH9QQr219sGALPTXpKzLuZLLPBRqaKCO5R+N/PF1+W
   2Svxp2nBncL5b5MGDlxAyNuTk5axwdYaCPJEBeHahy7wSwIjxWP6sqBPJ
   URmrmeL923CNZlErX79Ha8MiCg3Y1WBfTMvCJbc+/c3oObh4YP+Mo+R5C
   X38J3CEQDJuqEVDawiUHLNUpmUeUR6PprY5965DZEuLM6Dxf5VlcPHzCi
   Q==;
X-CSE-ConnectionGUID: tSVZq7HFTrCAFx91WZfTTg==
X-CSE-MsgGUID: c9LAc1owS2eQdhuvbEXIFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11958"; a="2715142"
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="2715142"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2026 01:56:57 -0800
X-CSE-ConnectionGUID: 0nk1I3KRQGS2TZe17SpbNA==
X-CSE-MsgGUID: IwGntSKTRUuqJcZClY5iMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,200,1787036400"; 
   d="scan'208";a="7818628"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 07 Nov 2026 01:56:56 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPdAL-00000000AdL-1yZk;
	Sat, 07 Nov 2026 09:56:53 +0000
Date: Sat, 07 Nov 2026 10:56:45 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [drm-misc:drm-misc-next 16/19]
 drivers/accel/amdxdna/aie4_ctx.c:590:3-9: preceding lock on line 588
Message-ID: <202611071025.zVVvi2NB-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: dri-devel@lists.freedesktop.org
TO: David Zhang <yidong.zhang@amd.com>
CC: Lizhi Hou <lizhi.hou@amd.com>
CC: Max Zhen <max.zhen@amd.com>
CC: Wendy Liang <wendy.liang@amd.com>

tree:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
head:   2d5a8313d9cf989b8f53a5689a96e891bf99fb2c
commit: b6feda618bd9250dde71c3a30c962d26138ea743 [16/19] accel/amdxdna: Implement AIE4 command packet building and submission
:::::: branch date: 15 hours ago
:::::: commit date: 2 weeks ago
config: x86_64-randconfig-2105-20261107 (https://download.01.org/0day-ci/archive/20261107/202611071025.zVVvi2NB-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611071025.zVVvi2NB-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/accel/amdxdna/aie4_ctx.c:590:3-9: preceding lock on line 588
   drivers/accel/amdxdna/aie4_ctx.c:594:3-9: preceding lock on line 588

vim +590 drivers/accel/amdxdna/aie4_ctx.c

b6feda618bd925 David Zhang 2026-10-19  564  
b6feda618bd925 David Zhang 2026-10-19  565  static int wait_till_connected_hsa_not_full(struct amdxdna_hwctx *hwctx)
b6feda618bd925 David Zhang 2026-10-19  566  {
b6feda618bd925 David Zhang 2026-10-19  567  	struct amdxdna_dev *xdna = hwctx->client->xdna;
b6feda618bd925 David Zhang 2026-10-19  568  	struct amdxdna_hwctx_priv *priv = hwctx->priv;
b6feda618bd925 David Zhang 2026-10-19  569  	u64 wi = READ_ONCE(priv->write_index);
b6feda618bd925 David Zhang 2026-10-19  570  	bool hsa_not_full = !!(wi < CTX_MAX_CMDS);
b6feda618bd925 David Zhang 2026-10-19  571  	int ret;
b6feda618bd925 David Zhang 2026-10-19  572  
b6feda618bd925 David Zhang 2026-10-19  573  	do {
b6feda618bd925 David Zhang 2026-10-19  574  		mutex_unlock(&priv->io_lock);
b6feda618bd925 David Zhang 2026-10-19  575  		if (!hsa_not_full) {
b6feda618bd925 David Zhang 2026-10-19  576  			ret = wait_till_seq_completed(hwctx, wi - CTX_MAX_CMDS,
b6feda618bd925 David Zhang 2026-10-19  577  						      MAX_SCHEDULE_TIMEOUT);
b6feda618bd925 David Zhang 2026-10-19  578  			if (ret && ret != -EAGAIN) {
b6feda618bd925 David Zhang 2026-10-19  579  				mutex_lock(&priv->io_lock);
b6feda618bd925 David Zhang 2026-10-19  580  				return ret;
b6feda618bd925 David Zhang 2026-10-19  581  			}
b6feda618bd925 David Zhang 2026-10-19  582  			if (!ret)
b6feda618bd925 David Zhang 2026-10-19  583  				hsa_not_full = true;
b6feda618bd925 David Zhang 2026-10-19  584  		}
b6feda618bd925 David Zhang 2026-10-19  585  		ret = wait_event_freezable(priv->job_list_wq,
b6feda618bd925 David Zhang 2026-10-19  586  					   aie4_hwctx_connected(hwctx) ||
b6feda618bd925 David Zhang 2026-10-19  587  					   aie4_hwctx_has_error(hwctx));
b6feda618bd925 David Zhang 2026-10-19 @588  		mutex_lock(&priv->io_lock);
b6feda618bd925 David Zhang 2026-10-19  589  		if (ret)
b6feda618bd925 David Zhang 2026-10-19 @590  			return ret;
b6feda618bd925 David Zhang 2026-10-19  591  		if (aie4_hwctx_has_error(hwctx)) {
b6feda618bd925 David Zhang 2026-10-19  592  			XDNA_DBG(xdna, "ctx %s in error; unwinding -ENODEV",
b6feda618bd925 David Zhang 2026-10-19  593  				 hwctx->name);
b6feda618bd925 David Zhang 2026-10-19  594  			return -ENODEV;
b6feda618bd925 David Zhang 2026-10-19  595  		}
b6feda618bd925 David Zhang 2026-10-19  596  	} while (!hsa_not_full || !aie4_hwctx_connected(hwctx));
b6feda618bd925 David Zhang 2026-10-19  597  
b6feda618bd925 David Zhang 2026-10-19  598  	return 0;
b6feda618bd925 David Zhang 2026-10-19  599  }
b6feda618bd925 David Zhang 2026-10-19  600  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
