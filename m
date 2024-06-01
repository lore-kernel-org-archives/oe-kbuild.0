Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BD3187569
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jun 2024 08:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717231501; cv=none; b=MNO/XLVXn95TJNGRqiyhxsAdXFsTz0K3ojFkQG7A6CDU6I4WuhTm4YYb5DTP5dVq80GxoJSkuRnkol/bnWJCWuwN9VTopysngiOgOcF6VvabF1VwkEZxrD4SXFttciNumoO5BQsh4m5KW7+qbgbpRM/oVd+UQdLd8s+T09ksi3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717231501; c=relaxed/simple;
	bh=+/k/S7YEtc0cWQ901nYOzj9fN4+4Us7JXllHwhWR/LM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lAcMroD+VOlum6Ra63UiOfu7B7HDncYh4bdYXlPfSN4ItKZ5Juf61BpAnfOSewAKGIyfZh8wirxQkHuXP0DwgtLK8DpDZmWVqAJ/Y2zyZ3QRrtI72gF/t6ADzO/MHxwFHXGqZmqp3NAlh6lAOJkt84Bjl70t0+IzeBLgY1Oy5dw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gzmHiRh7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gzmHiRh7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717231500; x=1748767500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+/k/S7YEtc0cWQ901nYOzj9fN4+4Us7JXllHwhWR/LM=;
  b=gzmHiRh7n48dMjTvc6yqf0A3uhZpYE93PliqBPt5vbY4hpBnts2VqQlY
   gmG4SFxUg0jb6LHjwWwrajsQbCFfXW3zkyl1cpgEMoaVg2Y/p0/mNQ1IM
   1EDixDnxEZ4kNnj8gsWbjo+Eg7+biYQn5Bzqyp38Whlx1uwHSXD7wwO6T
   ISvb552XKCB/ElFqs/4Zg2pIzZ3R14fx1Lp1VAmNyOJR7CkOsBwao3JKi
   spEfi3TBIH9up6KbD9OFqyKt3FFcypZ+Tt9YdE2S3XiyoQYLFNyraruu7
   TNQHuWDFq1o6BWvyH2gew4RzbrR8Mu9alNL+W7ND6mTNrfWCtCkFaGe2O
   Q==;
X-CSE-ConnectionGUID: iz1BWB1vT9mhWeUh/t+GGw==
X-CSE-MsgGUID: CnYH1kq4TIaZ4MbRN7VGeg==
X-IronPort-AV: E=McAfee;i="6600,9927,11089"; a="13907842"
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="13907842"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 01:44:59 -0700
X-CSE-ConnectionGUID: n5A280oBQU2KOqET2vLQgg==
X-CSE-MsgGUID: y6NDCAACTr2anK94EDkE8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,207,1712646000"; 
   d="scan'208";a="40825373"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 01 Jun 2024 01:44:57 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDKMB-000Iaf-1S;
	Sat, 01 Jun 2024 08:44:55 +0000
Date: Sat, 1 Jun 2024 16:44:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [sailus-media-tree:master 41/47] drivers/media/i2c/imx283.c:571
 imx283_pixel_rate() error: buffer overflow 'link_frequencies' 2 <= 64
Message-ID: <202406011649.QvOBNRB4-lkp@intel.com>
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
CC: linux-media@vger.kernel.org
TO: Kieran Bingham <kieran.bingham@ideasonboard.com>
CC: Sakari Ailus <sakari.ailus@linux.intel.com>
CC: Umang Jain <umang.jain@ideasonboard.com>

tree:   git://linuxtv.org/sailus/media_tree.git master
head:   6bdb83404e343cae573143b857a4b85855c998bf
commit: f90a4e8d271cab147d046a3aeb74c3377d2ebe7a [41/47] media: i2c: Add imx283 camera sensor driver
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: powerpc64-randconfig-r071-20240531 (https://download.01.org/0day-ci/archive/20240601/202406011649.QvOBNRB4-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project bafda89a0944d947fc4b3b5663185e07a397ac30)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406011649.QvOBNRB4-lkp@intel.com/

smatch warnings:
drivers/media/i2c/imx283.c:571 imx283_pixel_rate() error: buffer overflow 'link_frequencies' 2 <= 64

vim +/link_frequencies +571 drivers/media/i2c/imx283.c

f90a4e8d271cab Kieran Bingham 2024-04-02  566  
f90a4e8d271cab Kieran Bingham 2024-04-02  567  /* Calculate the Pixel Rate based on the current mode */
f90a4e8d271cab Kieran Bingham 2024-04-02  568  static u64 imx283_pixel_rate(struct imx283 *imx283,
f90a4e8d271cab Kieran Bingham 2024-04-02  569  			     const struct imx283_mode *mode)
f90a4e8d271cab Kieran Bingham 2024-04-02  570  {
f90a4e8d271cab Kieran Bingham 2024-04-02 @571  	u64 link_frequency = link_frequencies[__ffs(imx283->link_freq_bitmap)];
f90a4e8d271cab Kieran Bingham 2024-04-02  572  	unsigned int bpp = mode->bpp;
f90a4e8d271cab Kieran Bingham 2024-04-02  573  	const unsigned int ddr = 2; /* Double Data Rate */
f90a4e8d271cab Kieran Bingham 2024-04-02  574  	const unsigned int lanes = 4; /* Only 4 lane support */
f90a4e8d271cab Kieran Bingham 2024-04-02  575  	u64 numerator = link_frequency * ddr * lanes;
f90a4e8d271cab Kieran Bingham 2024-04-02  576  
f90a4e8d271cab Kieran Bingham 2024-04-02  577  	do_div(numerator, bpp);
f90a4e8d271cab Kieran Bingham 2024-04-02  578  
f90a4e8d271cab Kieran Bingham 2024-04-02  579  	return numerator;
f90a4e8d271cab Kieran Bingham 2024-04-02  580  }
f90a4e8d271cab Kieran Bingham 2024-04-02  581  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
