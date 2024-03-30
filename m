Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAD437E8
	for <oe-kbuild@lists.linux.dev>; Sat, 30 Mar 2024 01:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711762999; cv=none; b=T4spGLf1fTv9GWi3Q9x8o4GBdA9zqKreYcFBF0t91IpOZtWVeDqRBz3obUI9y7lYTH5ZmR6ZxL1uMdis7iuByTG9TpNr+tNzGU7JmAuCrLMrN9HTJU4rFO1tzkvYCmEaB/8LttBRawecHqaqdBpm0IFc3qKbFDQdRKSevt/xuVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711762999; c=relaxed/simple;
	bh=qsQ7OuxOiwHLyHuHU0K0zCMNZBQo4p7BBM2plhMYrcE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KzX7mFHth2SscohRalqrsL1sbC1+qmUUxQtZKE8rxaht+qDTHRHII3GIYQCWliYj7KavjVCyf4aZ/91RtOmYoKT9xbCPJpHf80VBFIqiZ/L/X5W/eur2W8FCq/DRkP1vjLO1J8ZkuUwZFiU1sMROFXTd6KjyeLvKT4TYgNjdlyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gbMNlYue; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gbMNlYue"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711762997; x=1743298997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qsQ7OuxOiwHLyHuHU0K0zCMNZBQo4p7BBM2plhMYrcE=;
  b=gbMNlYueRsJhwCVel9Q5NS4fQfpxT5SXfZOHI/2uIJBGHvZDQX3iyZjy
   TloEU0c5kd8SIQMBNaRyuPm9PT7xTtCVGNSK+4pMh3B5T8L6yzSa4sA0b
   7Y3ibsOWRQI7padYXJ7jsKnbKMVvxIwm2sU6L/z+OV6PGs8VyhDv4n0PL
   fA9IflP+fHn3WY5tjerh4lKAwiPAE1QT3qbc+L5ZeM7Ea1UQ0Ylt7mZIV
   FAQgDpKDAGv9yKiGU/YKzz5CT03wfXivxEECMWL8vEo1l+DHbfMqHmpHG
   YAlwchgpYmLyy1hiT6y2SCzMMKhd//2WIMI/HWTn/MMw9SE+pUPgql0h6
   A==;
X-CSE-ConnectionGUID: 0lhALuPhRGWi9gttg1NjNQ==
X-CSE-MsgGUID: 81APWGAxRFCr5Zx8J5ggeQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11028"; a="10772007"
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="10772007"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2024 18:43:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,166,1708416000"; 
   d="scan'208";a="21804437"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 29 Mar 2024 18:43:15 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rqNkW-0003qQ-20;
	Sat, 30 Mar 2024 01:43:12 +0000
Date: Sat, 30 Mar 2024 09:42:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: Re: [PATCH v1 4/4] Enable Driver compilation in crypto Kconfig and
 Makefile file
Message-ID: <202403300947.olMzOBG1-lkp@intel.com>
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
In-Reply-To: <20240328182652.3587727-5-pavitrakumarm@vayavyalabs.com>
References: <20240328182652.3587727-5-pavitrakumarm@vayavyalabs.com>
TO: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>
TO: herbert@gondor.apana.org.au
TO: linux-crypto@vger.kernel.org
CC: Ruud.Derwig@synopsys.com
CC: manjunath.hadli@vayavyalabs.com
CC: bhoomikak@vayavyalabs.com
CC: Pavitrakumar M <pavitrakumarm@vayavyalabs.com>

Hi Pavitrakumar,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6a8dbd71a70620c42d4fa82509204ba18231f28d]

url:    https://github.com/intel-lab-lkp/linux/commits/Pavitrakumar-M/Add-SPAcc-driver-to-Linux-kernel/20240329-023010
base:   6a8dbd71a70620c42d4fa82509204ba18231f28d
patch link:    https://lore.kernel.org/r/20240328182652.3587727-5-pavitrakumarm%40vayavyalabs.com
patch subject: [PATCH v1 4/4] Enable Driver compilation in crypto Kconfig and Makefile file
:::::: branch date: 31 hours ago
:::::: commit date: 31 hours ago
config: x86_64-randconfig-104-20240330 (https://download.01.org/0day-ci/archive/20240330/202403300947.olMzOBG1-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202403300947.olMzOBG1-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/crypto/dwc-spacc/spacc_skcipher.c:239:21-25: ERROR: reference preceded by free on line 238
--
>> drivers/crypto/dwc-spacc/spacc_device.c:157:2-9: line 157 is redundant because platform_get_irq() already prints an error
--
>> drivers/crypto/dwc-spacc/spacc_device.c:317:3-8: No need to set .owner here. The core will do it.

vim +239 drivers/crypto/dwc-spacc/spacc_skcipher.c

b37587c90bca57 Pavitrakumar M 2024-03-28  231  
b37587c90bca57 Pavitrakumar M 2024-03-28  232  static void spacc_cipher_cra_exit(struct crypto_tfm *tfm)
b37587c90bca57 Pavitrakumar M 2024-03-28  233  {
b37587c90bca57 Pavitrakumar M 2024-03-28  234  	struct spacc_crypto_ctx *tctx = crypto_tfm_ctx(tfm);
b37587c90bca57 Pavitrakumar M 2024-03-28  235  	struct spacc_priv *priv = dev_get_drvdata(tctx->dev);
b37587c90bca57 Pavitrakumar M 2024-03-28  236  
b37587c90bca57 Pavitrakumar M 2024-03-28  237  	if (tctx->cipher_key) {
b37587c90bca57 Pavitrakumar M 2024-03-28 @238  		kfree(NULL);
b37587c90bca57 Pavitrakumar M 2024-03-28 @239  		tctx->cipher_key = NULL;
b37587c90bca57 Pavitrakumar M 2024-03-28  240  	}
b37587c90bca57 Pavitrakumar M 2024-03-28  241  
b37587c90bca57 Pavitrakumar M 2024-03-28  242  	if (tctx->handle >= 0)
b37587c90bca57 Pavitrakumar M 2024-03-28  243  		spacc_close(&priv->spacc, tctx->handle);
b37587c90bca57 Pavitrakumar M 2024-03-28  244  
b37587c90bca57 Pavitrakumar M 2024-03-28  245  	put_device(tctx->dev);
b37587c90bca57 Pavitrakumar M 2024-03-28  246  }
b37587c90bca57 Pavitrakumar M 2024-03-28  247  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
