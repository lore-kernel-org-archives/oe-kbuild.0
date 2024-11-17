Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF9A2EB1D
	for <oe-kbuild@lists.linux.dev>; Sun, 17 Nov 2024 07:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731828851; cv=none; b=IPkLuZFc0cz915ckH849urhc16OrqLHq0PRySlxvLxfer/7zW0qdga1oxfU7aSvjFtYKyO/q805vFB7WjmpepoG4FfBNpeywPbL8JMJqb1M6UbnupPCFOAeXr8X7Dz5lYGwV4cO5vFy9gmuUPat2U6zlmp3k0kfjgkLGRC8pTRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731828851; c=relaxed/simple;
	bh=NcipjzmnwbxxNDsjNlIuvE43YhGLpwi2R/+pslmmlnM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aCWxNgapNxWlN88kcrD/O8OIVUHb0JjPYbPKpx6PsNrPGipAIxnXGj9CzwGCCWVQqfJQJ4EdjOgCt/MuXDmhV47zsyri8ND1fNa24ecmmntlTFWFCnVrF+BIVzXWqJlVFpRHGCUnE/idYVBYHuNn7Xa7SthrtRaqKzMZ5ppjDo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dtx0RH/g; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dtx0RH/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731828850; x=1763364850;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NcipjzmnwbxxNDsjNlIuvE43YhGLpwi2R/+pslmmlnM=;
  b=Dtx0RH/gJiBiJCW8Q4CD6iUOw50Ttef5DVUdyu8n91jsId3nr7JTiJyD
   xAUx32WtkW1x/g8MezNpK5cFEKzDSNFHGK2ooQkUOylWJKduNO1YMvR0g
   WEbxvwM2KuWRGoRkSR73ajA7+zjqZCFmCbJGsmvszcuDcySMxtX96lZc7
   xakNF7lTji1WkraqGno84ajDDCArAhkWb7651CcioUQhM29J9ITPvT/2q
   bYBuDW9DLFejdCDbCdonmO6Jctovps1fvduydebiEUjZeHRMdB82Qx33B
   yw5bHJrBB725HapA/MnQRRRdhwkaFTKjyxP/tA2EHo+kHeaEtmECnOIFR
   g==;
X-CSE-ConnectionGUID: 7WR8gkVAQU+rqbppGUzZYg==
X-CSE-MsgGUID: 9suzE9gQQ4S32U8GNCKxyQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42321637"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="42321637"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 23:34:09 -0800
X-CSE-ConnectionGUID: bcDe8XxsSK6yhaTjXIWbIQ==
X-CSE-MsgGUID: JioO4fBhQhOpxDQjKKgOKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="88835617"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 16 Nov 2024 23:34:08 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCZnJ-0001dF-13;
	Sun, 17 Nov 2024 07:34:05 +0000
Date: Sun, 17 Nov 2024 15:33:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 11204/11989] drivers/spi/spi-cs42l43.c:241
 cs42l43_get_speaker_id_gpios() warn: passing zero to 'PTR_ERR'
Message-ID: <202411171514.gs14ItYA-lkp@intel.com>
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
TO: Simon Trimmer <simont@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   744cf71b8bdfcdd77aaf58395e068b7457634b2c
commit: f3c605147741e0ad8f1c51a7decef2040debfd16 [11204/11989] spi: cs42l43: Add GPIO speaker id support to the bridge configuration
:::::: branch date: 2 days ago
:::::: commit date: 4 days ago
config: x86_64-randconfig-161-20241116 (https://download.01.org/0day-ci/archive/20241117/202411171514.gs14ItYA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411171514.gs14ItYA-lkp@intel.com/

smatch warnings:
drivers/spi/spi-cs42l43.c:241 cs42l43_get_speaker_id_gpios() warn: passing zero to 'PTR_ERR'
drivers/spi/spi-cs42l43.c:257 cs42l43_get_speaker_id_gpios() error: uninitialized symbol 'ret'.

vim +/PTR_ERR +241 drivers/spi/spi-cs42l43.c

ef75e767167a8f Lucas Tanure  2023-08-04  232  
f3c605147741e0 Simon Trimmer 2024-11-12  233  static int cs42l43_get_speaker_id_gpios(struct cs42l43_spi *priv, int *result)
f3c605147741e0 Simon Trimmer 2024-11-12  234  {
f3c605147741e0 Simon Trimmer 2024-11-12  235  	struct gpio_descs *descs;
f3c605147741e0 Simon Trimmer 2024-11-12  236  	u32 spkid;
f3c605147741e0 Simon Trimmer 2024-11-12  237  	int i, ret;
f3c605147741e0 Simon Trimmer 2024-11-12  238  
f3c605147741e0 Simon Trimmer 2024-11-12  239  	descs = gpiod_get_array_optional(priv->dev, "spk-id", GPIOD_IN);
f3c605147741e0 Simon Trimmer 2024-11-12  240  	if (IS_ERR_OR_NULL(descs))
f3c605147741e0 Simon Trimmer 2024-11-12 @241  		return PTR_ERR(descs);
f3c605147741e0 Simon Trimmer 2024-11-12  242  
f3c605147741e0 Simon Trimmer 2024-11-12  243  	spkid = 0;
f3c605147741e0 Simon Trimmer 2024-11-12  244  	for (i = 0; i < descs->ndescs; i++) {
f3c605147741e0 Simon Trimmer 2024-11-12  245  		ret = gpiod_get_value_cansleep(descs->desc[i]);
f3c605147741e0 Simon Trimmer 2024-11-12  246  		if (ret < 0)
f3c605147741e0 Simon Trimmer 2024-11-12  247  			goto err;
f3c605147741e0 Simon Trimmer 2024-11-12  248  
f3c605147741e0 Simon Trimmer 2024-11-12  249  		spkid |= (ret << i);
f3c605147741e0 Simon Trimmer 2024-11-12  250  	}
f3c605147741e0 Simon Trimmer 2024-11-12  251  
f3c605147741e0 Simon Trimmer 2024-11-12  252  	dev_dbg(priv->dev, "spk-id-gpios = %d\n", spkid);
f3c605147741e0 Simon Trimmer 2024-11-12  253  	*result = spkid;
f3c605147741e0 Simon Trimmer 2024-11-12  254  err:
f3c605147741e0 Simon Trimmer 2024-11-12  255  	gpiod_put_array(descs);
f3c605147741e0 Simon Trimmer 2024-11-12  256  
f3c605147741e0 Simon Trimmer 2024-11-12 @257  	return ret;
f3c605147741e0 Simon Trimmer 2024-11-12  258  }
f3c605147741e0 Simon Trimmer 2024-11-12  259  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
