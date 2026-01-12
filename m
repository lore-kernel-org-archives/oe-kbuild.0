Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910872D2382
	for <oe-kbuild@lists.linux.dev>; Mon, 12 Jan 2026 12:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768220961; cv=none; b=nV0LDSGuzPgi0OrGPJCeCtdAqH4eVf1dlTEtjjgk0GnBGV6K3GPRHK91KGaOv4j2DemoPz09FAE3TvYrduGD0qZBFPTE1spUjjekwUXUYWzZgwV7AzzwSBFWQVEffdlPiaSQgulrwhMFrVJABY3r6uVo3MkYpUWuiuHds3P/vug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768220961; c=relaxed/simple;
	bh=OINhWld6kQVKqM7I4vA7z6A6S3pkHeoRxKYgqNdXVj4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SYbVj+p6MlWjNJn/+ypL17cAuHZFL/C3AZHt/b1D4huurMLFjgv8FM+8xTQ8haTIKpkIfy+zgjN2cEzYI3QX9jWIf++n+x/wriWSDYr9GdP2GPzfk34i95Kv1vvRUZmIOGgpFQhbpN1Gg3ULvu0JQWjQ5cdTTsxjfjn1216ctIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C4Z8QnrN; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C4Z8QnrN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768220960; x=1799756960;
  h=date:from:to:cc:subject:message-id;
  bh=OINhWld6kQVKqM7I4vA7z6A6S3pkHeoRxKYgqNdXVj4=;
  b=C4Z8QnrNAlPLD2ga9NgwFqTgrAKjpgG2l7cHvC/JfXcr43J8Fe0IWUw+
   SSqZeqi193/eN4sXfNeRVXT4pnZA9/kDBW2vEgKYn5J7ezoQZKSih1TFr
   RJB8dMbrTfZCaKUHvEBJ9KJp1RdFE5EoPK2ctlmqUOWJ4WECn/O4pr2e/
   mN2Tx2TzY1EZ+CLzApXHKwrOqBpLoT1RyoFb5zfNdLAygG2oLIGOMDHJ7
   dZjkAK4BxMyDgZ9DqnhCj9ULq/yYMAUxWqpUIIDsrQactiEgxizdjojey
   Netn9awp4+QtMVy+M0KR5qX1jBJ4lCEGA/LjiNK+tKB7R5M1GcRGa4m97
   Q==;
X-CSE-ConnectionGUID: 1ncNzaMeTn66LzVsMH6xrw==
X-CSE-MsgGUID: WM0urTeDR5igt9v2gwTs6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73336679"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="73336679"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 04:29:19 -0800
X-CSE-ConnectionGUID: 3QYURcGYRWCRyth0u35zlA==
X-CSE-MsgGUID: 88zbkh3hQFKuPsn0OH4rhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234770335"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 12 Jan 2026 04:29:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfH2p-00000000DME-1PkV;
	Mon, 12 Jan 2026 12:29:15 +0000
Date: Mon, 12 Jan 2026 20:29:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/wireless/marvell/mwifiex/sta_ioctl.c:186
 mwifiex_dnld_dt_txpwr_table() warn: '"marvell,00_txpwrlimit"'
 75601405979029504 can't fit into 255 'txpwr[0]'
Message-ID: <202601122057.3yEZrzT8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Stefan Kerkmann <s.kerkmann@pengutronix.de>
CC: Johannes Berg <johannes.berg@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   0f61b1860cc3f52aef9036d7235ed1f017632193
commit: 7b6f16a258065f85793fb2597a290041c1e3d201 wifi: mwifiex: add rgpower table loading support
date:   4 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r073-20260112 (https://download.01.org/0day-ci/archive/20260112/202601122057.3yEZrzT8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8985-g2614ff1a

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601122057.3yEZrzT8-lkp@intel.com/

smatch warnings:
drivers/net/wireless/marvell/mwifiex/sta_ioctl.c:186 mwifiex_dnld_dt_txpwr_table() warn: '"marvell,00_txpwrlimit"' 75601405979029504 can't fit into 255 'txpwr[0]'

vim +186 drivers/net/wireless/marvell/mwifiex/sta_ioctl.c

7c6fa2a843c5ac drivers/net/wireless/mwifiex/sta_ioctl.c         Amitkumar Karwar 2011-08-10  182  
7b6f16a258065f drivers/net/wireless/marvell/mwifiex/sta_ioctl.c Stefan Kerkmann  2025-08-04  183  static void mwifiex_dnld_dt_txpwr_table(struct mwifiex_private *priv)
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  184  {
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  185  	if (priv->adapter->dt_node) {
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08 @186  		char txpwr[] = {"marvell,00_txpwrlimit"};
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  187  
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  188  		memcpy(&txpwr[8], priv->adapter->country_code, 2);
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  189  		mwifiex_dnld_dt_cfgdata(priv, priv->adapter->dt_node, txpwr);
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  190  	}
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  191  }
b58df4461921da drivers/net/wireless/mwifiex/sta_ioctl.c         Bing Zhao        2014-01-08  192  

:::::: The code at line 186 was first introduced by commit
:::::: b58df4461921dad57707fbedee11e6f79f58b1e6 mwifiex: use a function to replace two copies of a code fragment

:::::: TO: Bing Zhao <bzhao@marvell.com>
:::::: CC: John W. Linville <linville@tuxdriver.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
