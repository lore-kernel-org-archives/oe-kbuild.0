Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595F4253327
	for <oe-kbuild@lists.linux.dev>; Tue, 29 Apr 2025 18:39:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745952000; cv=none; b=X/Sbs9+b+RCA578tCNQLny86T0iQ4FVwybvDZJTnPjMo3DQtXCxJgoHo3Oz39vtiMDlqZBZvax7U3rSEs+RM7xH+kSiVy6fdjtyvOkJfMhHoBjG8bmog7QiUX3YVFP6YziH7fzfl6gcgEgT64F5QmRd/zX1eCXjS/C+TQLlZjJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745952000; c=relaxed/simple;
	bh=V+jwKho7kU/3RezHfiNfLhZdmlucjA58IsyEpjxkdTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CQhnVYL/kzx9wvp+oXECFCcx8dUApI5gs+xsImN2TOfbre+3yrCEHCr1OW23AP4aCapP4R1k2IHd1fHiQnHkN0/kOA6+i5rNac7L81JR+Nz5LNnwd/FKhzxGgBwfmhfDTXZhWV5Fs2+TNyRR7S/7FAOWLXssssAgMwUILSfye4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CgRGq0aY; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CgRGq0aY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745951997; x=1777487997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V+jwKho7kU/3RezHfiNfLhZdmlucjA58IsyEpjxkdTk=;
  b=CgRGq0aYUzOgyR4TDQoZXsDj9C1q3O7bKe2Rolj0JXfQ29a7Mmic27mS
   d+5BT2CGzVMTN6L/Fepode+7t+p6HbAIGtwpqXcxVvknDEoQF/sQYe2/z
   uub/oX3aN6WIyYuLdMHqQMRN5ludJfQM+gSwKqtgPntRO1TUb4+K/NKUK
   XbPso2dQQCEoBkS/N5pUNYuz/TmRSAxYBWPhiZq/0A4kCQSK3t1N0qjMS
   1GVQjy1iMJwAUeg+jQmv80MEMzlSlv32DbIofEpehjQtxg3fF7Nm0CxOl
   nRjZLCYkGaPTGvrHfvm3URrChJ1lEdkLGsjag5MfnoT8RKJbtO9CYUBS0
   Q==;
X-CSE-ConnectionGUID: /RXjD0xlRuidRRRlPlxaYg==
X-CSE-MsgGUID: jOc49VRCR7y/Xyb1G+/Rhg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="47501333"
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="47501333"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 11:39:45 -0700
X-CSE-ConnectionGUID: gJPGd+xCR4+G3EOOnCWAIQ==
X-CSE-MsgGUID: Qa3fc2XETN+XiWN8Q/xvJA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,249,1739865600"; 
   d="scan'208";a="134227563"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Apr 2025 11:39:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9prq-0002qZ-2v;
	Tue, 29 Apr 2025 18:39:42 +0000
Date: Wed, 30 Apr 2025 02:39:12 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [android-common:android11-5.4 1/1]
 drivers/net/wireless/intersil/p54/p54spi.c:171 p54spi_request_firmware()
 warn: 'priv->firmware' from request_firmware() not released on lines: 168.
Message-ID: <202504300248.CfqR8kDW-lkp@intel.com>
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
TO: cros-kernel-buildreports@googlegroups.com

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   1aec9e76fe4a65b0a26fa1b30bdb3400d9728b2d
commit: 6942c45a227048985d6b38c138c14978490628f2 [1/1] wifi: p54: Fix an error handling path in p54spi_probe()
:::::: branch date: 3 days ago
:::::: commit date: 2 years, 8 months ago
config: i386-randconfig-141-20250429 (https://download.01.org/0day-ci/archive/20250430/202504300248.CfqR8kDW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202504300248.CfqR8kDW-lkp@intel.com/

New smatch warnings:
drivers/net/wireless/intersil/p54/p54spi.c:171 p54spi_request_firmware() warn: 'priv->firmware' from request_firmware() not released on lines: 168.

Old smatch warnings:
drivers/net/wireless/intersil/p54/p54spi.c:542 p54spi_op_start() error: 'wait_for_completion_interruptible_timeout()' returns negative and 'timeout' is unsigned

vim +171 drivers/net/wireless/intersil/p54/p54spi.c

4f5cab969bdbec drivers/net/wireless/p54/p54spi.c          Max Filippov        2009-03-26  151  
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  152  static int p54spi_request_firmware(struct ieee80211_hw *dev)
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  153  {
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  154  	struct p54s_priv *priv = dev->priv;
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  155  	int ret;
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  156  
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  157  	/* FIXME: should driver use it's own struct device? */
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  158  	ret = request_firmware(&priv->firmware, "3826.arm", &priv->spi->dev);
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  159  
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  160  	if (ret < 0) {
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  161  		dev_err(&priv->spi->dev, "request_firmware() failed: %d", ret);
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  162  		return ret;
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  163  	}
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  164  
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  165  	ret = p54_parse_firmware(dev, priv->firmware);
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  166  	if (ret) {
6942c45a227048 drivers/net/wireless/intersil/p54/p54spi.c Christophe JAILLET  2022-06-12  167  		/* the firmware is released by the caller */
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  168  		return ret;
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  169  	}
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  170  
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11 @171  	return 0;
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  172  }
cd8d3d321285a3 drivers/net/wireless/p54/p54spi.c          Christian Lamparter 2009-01-11  173  

:::::: The code at line 171 was first introduced by commit
:::::: cd8d3d321285a34b4e29cb7b04e552c49cc0f018 p54spi: p54spi driver

:::::: TO: Christian Lamparter <chunkeey@web.de>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
