Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01797381AF
	for <oe-kbuild@lists.linux.dev>; Mon,  9 Dec 2024 04:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733717713; cv=none; b=fsSurbwvrVJxqA3xXl+8arH+IeCUFF49GiQJB4D3WQgFQTyKAR0ds9g4ubCHZh9QNbjBWG7ITUB1a5h+769WYV5zg2reQUA1h3y9ePmdCiYBW9pz3LVK1wxUOVWsy7fWBqfwxE7c6xOpdXtFvih3m9f15KHNHeFODKzsoS0WtjY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733717713; c=relaxed/simple;
	bh=sJlliTGOBg0vpavkDDsOdbx2b6sXWwX1zXg79L5nniI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PPfr1gX0ArdayWf0fqHmYmaa1m1CUZpmd9DEYayzcU9FVs7L/PGxfdY5a727EjGTTL+fHAupvvvuBV4pQ/QXO0cz0Loa8IUQco+5/wspVRgNb1mFy3qqv6j6PvQcx0SE/FCzMJXeb6PYUeAIbviLs75kft4T1aQLum7SN1xMGQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I8tBmt4A; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I8tBmt4A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733717711; x=1765253711;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sJlliTGOBg0vpavkDDsOdbx2b6sXWwX1zXg79L5nniI=;
  b=I8tBmt4Ao66wD3mocMxBTLhQC54lQFwN0cO0XgoUuiWokYafDKRyeYQr
   5DevuLOkeDNDgVdPAScBizvU9BWRTwrEza/wkRCEfsJSJrQJfZiwtk4S2
   e8th5ZxLIsSa1L9uder2k8x0vKPsB4ziXx+sixzVgjJfN16nDRY9JlXlm
   XnFHZ9nb8Qwvv6y1Fgj0yDp4kR7ub5gyR/qpxfwGGvaRRIlwBtsNOmDQW
   y8isawm8dE3Ylm/89sFrFbOnfCpgyZ3ZWtXh501nrJeYfHcP/hn1y5EOA
   3/wabEUp0IdkAYnJwRrNbmGEQXL4daEPch9OIGXcFe+GQt3xJ7/9luMfd
   A==;
X-CSE-ConnectionGUID: vXzj0ZR9SOKXoFOSCPFOjQ==
X-CSE-MsgGUID: W+sMczlvRZmsYHUdp2IeJw==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="33915626"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="33915626"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 20:15:09 -0800
X-CSE-ConnectionGUID: Ti2a9YYSSreGQ0tk3n2w6Q==
X-CSE-MsgGUID: Nkc27fHoQ0q6mjGgD98oSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="95299798"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Dec 2024 20:15:09 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKVAo-0003ov-0f;
	Mon, 09 Dec 2024 04:15:06 +0000
Date: Mon, 9 Dec 2024 12:14:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: sound/soc/renesas/rcar/adg.c:416 rsnd_adg_create_null_clk() warn:
 passing zero to 'ERR_CAST'
Message-ID: <202412071740.OKhNHftG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: Mark Brown <broonie@kernel.org>

Hi Lad,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b5f217084ab3ddd4bdd03cd437f8e3b7e2d1f5b6
commit: c087a94bea49acf34d651f7308506fe462a937b3 ASoC: Rename "sh" to "renesas"
date:   5 weeks ago
:::::: branch date: 11 hours ago
:::::: commit date: 5 weeks ago
config: openrisc-randconfig-r071-20241206 (https://download.01.org/0day-ci/archive/20241207/202412071740.OKhNHftG-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412071740.OKhNHftG-lkp@intel.com/

smatch warnings:
sound/soc/renesas/rcar/adg.c:416 rsnd_adg_create_null_clk() warn: passing zero to 'ERR_CAST'
sound/soc/renesas/rcar/dma.c:840 rsnd_dma_attach() error: we previously assumed '*dma_mod' could be null (see line 833)

vim +/ERR_CAST +416 sound/soc/renesas/rcar/adg.c

c2d3171847611e8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2016-12-07  405  
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  406  static struct clk *rsnd_adg_create_null_clk(struct rsnd_priv *priv,
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  407  					    const char * const name,
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  408  					    const char *parent)
d6956a7dde6fbf8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-05-24  409  {
d6956a7dde6fbf8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-05-24  410  	struct device *dev = rsnd_priv_to_dev(priv);
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  411  	struct clk *clk;
d6956a7dde6fbf8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-05-24  412  
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  413  	clk = clk_register_fixed_rate(dev, name, parent, 0, 0);
cc64c390b215b40 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-08-20  414  	if (IS_ERR_OR_NULL(clk)) {
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  415  		dev_err(dev, "create null clk error\n");
cc64c390b215b40 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-08-20 @416  		return ERR_CAST(clk);
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  417  	}
d6956a7dde6fbf8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-05-24  418  
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  419  	return clk;
cb2f97d89f383da sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-06-02  420  }
d6956a7dde6fbf8 sound/soc/sh/rcar/adg.c Kuninori Morimoto 2021-05-24  421  

:::::: The code at line 416 was first introduced by commit
:::::: cc64c390b215b404524725a94857d6fb58d9a62a ASoC: rsnd: adg: clearly handle clock error / NULL case

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
