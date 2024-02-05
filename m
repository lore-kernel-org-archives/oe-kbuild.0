Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D726F3A1A7
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 16:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707150005; cv=none; b=Bes4aHbLVJp785oje55PAnPPRRwNAISIupCwP2qXcbNf5qijfYkG/xCIiZlZYuKvY/JX3gAJPgz/FxJDPRoh7EDQpb+f6RlMJ8NHBANu1ObJVNKmM4DCvcty8G7eXQZjSRk4jOv1uW3B+tzefbGo3Euid3msLb/OwDw9OCzUvI4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707150005; c=relaxed/simple;
	bh=WVPB7xRfzsJYUFb5pyA2iPIRK1rmriMo3ItQOu2+1jw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qrjNbnyXrHy4qmOyt0gVEOrz3fjx9LukeJD6SjI06vb4MyaSF1MMasU4GZ/OKSF2n96yXBJPunFN4ENxYsg73lsjPIm2VJLGmi3amGcr0XdKbpN3k517w/A7ymMsiYN8oCP/TByajzcs+yYZ/38xAPPq2buK9SaSXM11NhzIPY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayzQn9jQ; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayzQn9jQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707150003; x=1738686003;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WVPB7xRfzsJYUFb5pyA2iPIRK1rmriMo3ItQOu2+1jw=;
  b=ayzQn9jQ1I3opV5pA3jUG5MYxEW9rOb4OQBWq+BFwV+onmdwke4NBgN0
   n7qdIQqkMIcuhd3ltzl3OdVQ0NLu9dC6Onrwv1pfh9BBCH9G55hiVZIhQ
   d7XmwBCfzAw5JwWsnl9sf8d7DD3bBjX5GWGQS2h2n5fHKPEcXw013qBOW
   sXtitPQGtgtEtkwPksLBvlNdqVZVgMTV8GNDc52bsgfefUbSRWC4rdSCs
   +mwaw+8odp2QFrh++Zq4DirWJ+elqFYD/RmPTI/GdJ/BgVMOk+cVSbTKJ
   h2CdcrfcYwuOykqDz/Jt5NINgVDm6Jdfm56nEAxlAPwG1pgOeGSQfFfvV
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="704664"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="704664"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 08:17:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="933190213"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="933190213"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 05 Feb 2024 08:17:33 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX1f0-0000dk-36;
	Mon, 05 Feb 2024 16:17:30 +0000
Date: Tue, 6 Feb 2024 00:17:01 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2807/4021]
 drivers/net/phy/qcom/qcom-phy-lib.c:427:12-13: WARNING opportunity for min()
Message-ID: <202402060012.liW9FmRp-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Christian Marangi <ansuelsmth@gmail.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   23e11d0318521e8693459b0e4d23aec614b3b68b
commit: 249d2b80e4db0e38503ed0ec2af6c7401bc099b9 [2807/4021] net: phy: qcom: move additional functions to shared library
:::::: branch date: 11 hours ago
:::::: commit date: 5 days ago
config: mips-randconfig-r053-20240205 (https://download.01.org/0day-ci/archive/20240206/202402060012.liW9FmRp-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 7dd790db8b77c4a833c06632e903dc4f13877a64)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402060012.liW9FmRp-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/qcom/qcom-phy-lib.c:427:12-13: WARNING opportunity for min()

vim +427 drivers/net/phy/qcom/qcom-phy-lib.c

249d2b80e4db0e Christian Marangi 2024-01-29  416  
249d2b80e4db0e Christian Marangi 2024-01-29  417  int at803x_cdt_wait_for_completion(struct phy_device *phydev,
249d2b80e4db0e Christian Marangi 2024-01-29  418  				   u32 cdt_en)
249d2b80e4db0e Christian Marangi 2024-01-29  419  {
249d2b80e4db0e Christian Marangi 2024-01-29  420  	int val, ret;
249d2b80e4db0e Christian Marangi 2024-01-29  421  
249d2b80e4db0e Christian Marangi 2024-01-29  422  	/* One test run takes about 25ms */
249d2b80e4db0e Christian Marangi 2024-01-29  423  	ret = phy_read_poll_timeout(phydev, AT803X_CDT, val,
249d2b80e4db0e Christian Marangi 2024-01-29  424  				    !(val & cdt_en),
249d2b80e4db0e Christian Marangi 2024-01-29  425  				    30000, 100000, true);
249d2b80e4db0e Christian Marangi 2024-01-29  426  
249d2b80e4db0e Christian Marangi 2024-01-29 @427  	return ret < 0 ? ret : 0;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
