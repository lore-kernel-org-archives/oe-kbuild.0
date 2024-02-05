Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29CAD5D918
	for <oe-kbuild@lists.linux.dev>; Mon,  5 Feb 2024 21:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707170326; cv=none; b=sxItDdfkSQzDxIO6KLj7Gy2Voovg2dBzgEc4WqobUjZKWDKHe+sZ7eHP8Q5toN2L4EfJsh2d6uFu4dDA5U7GOMD/44PaB7HZ0j3n5SSqejOHFaUpxDlFx6nX8cN99VdE/YFpOXLojjLRURweKDN/bt9qOC2hkET+HgxnrHK6MlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707170326; c=relaxed/simple;
	bh=gIJKTplT0/+xzuDP6bc91DjX3doanOPFLXRPPX0BZ2Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dE9BjvSb6ZOkBVUrkMWb3NmXS5zNwWoQumHFTveXqz+Rj1W/87SF9XukYKMAyZjAs7SJ/BwuNlHeA7QD39QZ5GPP0HJOYrR3SHHc4KXi3VxxBXURgdNpZ/iiUMcQKxQeFbCl/vW7j9sKWnbCSjAUsT0pt26ziuCE2CihmxMxFRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LzDlUr0K; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LzDlUr0K"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707170324; x=1738706324;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gIJKTplT0/+xzuDP6bc91DjX3doanOPFLXRPPX0BZ2Q=;
  b=LzDlUr0K9ueLOrDyT2jQUQamfFdnI/KIv5z/sjaRxGxO/9A6evHbSzb9
   heZSkZYbTsAAM+oBzQx+vJ6UXpFSEGtujNwtnaUHpxLPYL7APf7BjLUHs
   hLyXyxlL50aqkRRcBHznFD4KcwfvaQqKGGGx3zw3rNqANnKEky3CN0xOS
   qP6Qb90H6Acve4zB7KZPULTcKFzDAXQB5TO48hNrpa4STSIzwNsPH4bED
   ixe2MNcLVCaTjDF/uN0ZdR5I21j6uBbgyMW2Q3jgPguIn515Abik9XVBX
   5B7peY643QXD9d9LepXqBpEVAFOOtqgjlyZxhuK5Kth9nMTZbf0ELr/Np
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10975"; a="4429395"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="4429395"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 13:58:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="5440096"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 05 Feb 2024 13:58:42 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rX6zA-0000po-0p;
	Mon, 05 Feb 2024 21:58:40 +0000
Date: Tue, 6 Feb 2024 05:58:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 2802/4021] drivers/net/phy/adin1100.c:151:11-12:
 WARNING opportunity for min()
Message-ID: <202402060535.G8FHUJKP-lkp@intel.com>
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
TO: Andre Werner <andre.werner@systec-electronic.com>
CC: Jakub Kicinski <kuba@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   23e11d0318521e8693459b0e4d23aec614b3b68b
commit: 08b47dfdd6b8db8d1f68748ad7a35ff0aa7040f3 [2802/4021] net: phy: adin1100: Add interrupt support for link change
:::::: branch date: 16 hours ago
:::::: commit date: 5 days ago
config: x86_64-randconfig-101-20240205 (https://download.01.org/0day-ci/archive/20240206/202402060535.G8FHUJKP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202402060535.G8FHUJKP-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/phy/adin1100.c:151:11-12: WARNING opportunity for min()

vim +151 drivers/net/phy/adin1100.c

7eaf9132996a34 Alexandru Ardelean 2022-04-29  144  
08b47dfdd6b8db Andre Werner       2024-01-29  145  static int adin_phy_ack_intr(struct phy_device *phydev)
08b47dfdd6b8db Andre Werner       2024-01-29  146  {
08b47dfdd6b8db Andre Werner       2024-01-29  147  	/* Clear pending interrupts */
08b47dfdd6b8db Andre Werner       2024-01-29  148  	int rc = phy_read_mmd(phydev, MDIO_MMD_VEND2,
08b47dfdd6b8db Andre Werner       2024-01-29  149  			      ADIN_PHY_SUBSYS_IRQ_STATUS);
08b47dfdd6b8db Andre Werner       2024-01-29  150  
08b47dfdd6b8db Andre Werner       2024-01-29 @151  	return rc < 0 ? rc : 0;
08b47dfdd6b8db Andre Werner       2024-01-29  152  }
08b47dfdd6b8db Andre Werner       2024-01-29  153  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
