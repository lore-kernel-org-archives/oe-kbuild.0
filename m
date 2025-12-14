Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1844C233707
	for <oe-kbuild@lists.linux.dev>; Sun, 14 Dec 2025 02:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765678372; cv=none; b=sttSJjSBU6iTSJTwaIx08K8Jou7fBUZiHu4dbbdIb/0Ie4SSsSI4unGxO0vbySvierTqYZ4k67B4m2MSme7xgHx75ZmJCZ8SePUaEJCucKpq1XMML8ahHfVUjA/dWgdt0iZnxJFSXvp2/JpNLmmR1EFDJ6BgCEWOtKe7qkyMzgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765678372; c=relaxed/simple;
	bh=WrOn7eMdrranzOp4BEFF3ZkfOnvC3rFn5N5CvS8YJp4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qWeEb7710AkjAw2BCc+cugC3o/K/ygNyWq7uZq8s2zPzaXfog1Un2H/UZLVv8iQrzqUmHppJfs/zOFEJb/5yq8oOVsbhDp/Eciak4+0bVeXuSThX4IZsxCVmGSN4hdYuCoMNjWlbPGrcLJg5vR7q7JQSU4Bf8mBj1ieD4NHB4oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VZAWnmkz; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VZAWnmkz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765678370; x=1797214370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WrOn7eMdrranzOp4BEFF3ZkfOnvC3rFn5N5CvS8YJp4=;
  b=VZAWnmkz0bQrLmQF0KDlXJW53i3tdePt96WbxVMEk/OFXlZ2JPR9FwV+
   uC8Saa42LASt1QyLi9tpx1zWvrdEOvAiIYxX06SOQVhE0lHIz2vjnzdOP
   fqSqXqeXWvj/CepyMn0LADxRU2ptf9zUdCgtD9pfhYTAEK3vehaqt0x7t
   ZzJ3wHR2FJMZkGbe39+z4sTTrrqG7SFDPjM09HsA02UtAZmvKzGnFqlyW
   f7i14yubH+LPl/TZFS3WmmBfDLnsYErSbTpVQVB+gxD/lt1SdX3jM5ixt
   IkjiqLIK28FNn99zAP5t8ZistbUXjLzFOSSkMOy8pairh3XMO1ayzFdmi
   Q==;
X-CSE-ConnectionGUID: nHNs5XArSi6/gejpUashPw==
X-CSE-MsgGUID: kCb5rPbsRBOp3LT1P9foVA==
X-IronPort-AV: E=McAfee;i="6800,10657,11641"; a="67511894"
X-IronPort-AV: E=Sophos;i="6.21,147,1763452800"; 
   d="scan'208";a="67511894"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2025 18:12:50 -0800
X-CSE-ConnectionGUID: 7vdZwU9JQZqPQ7R8TqKpWQ==
X-CSE-MsgGUID: kSzbXZ+mS/aoCQ+lFLjQEQ==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 13 Dec 2025 18:12:43 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUbbB-000000008T3-0OF2;
	Sun, 14 Dec 2025 02:12:37 +0000
Date: Sun, 14 Dec 2025 10:11:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v9 2/2] ASoC: rt5575: Add the codec driver for the ALC5575
Message-ID: <202512140909.a0ok9gVy-lkp@intel.com>
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
In-Reply-To: <20251211110130.2925541-3-oder_chiou@realtek.com>
References: <20251211110130.2925541-3-oder_chiou@realtek.com>
TO: Oder Chiou <oder_chiou@realtek.com>

Hi Oder,

kernel test robot noticed the following build warnings:

[auto build test WARNING on broonie-sound/for-next]
[also build test WARNING on linus/master v6.18 next-20251212]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Oder-Chiou/ASoC-dt-bindings-realtek-rt5575-add-support-for-ALC5575/20251211-190355
base:   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
patch link:    https://lore.kernel.org/r/20251211110130.2925541-3-oder_chiou%40realtek.com
patch subject: [PATCH v9 2/2] ASoC: rt5575: Add the codec driver for the ALC5575
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: parisc-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251214/202512140909.a0ok9gVy-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512140909.a0ok9gVy-lkp@intel.com/

smatch warnings:
sound/soc/codecs/rt5575.c:256 rt5575_fw_load_by_spi() error: uninitialized symbol 'ret'.

vim +/ret +256 sound/soc/codecs/rt5575.c

56f073d89eb8e0 Oder Chiou 2025-12-11  246  
56f073d89eb8e0 Oder Chiou 2025-12-11  247  static int rt5575_fw_load_by_spi(struct rt5575_priv *rt5575)
56f073d89eb8e0 Oder Chiou 2025-12-11  248  {
56f073d89eb8e0 Oder Chiou 2025-12-11  249  	struct i2c_client *i2c = rt5575->i2c;
56f073d89eb8e0 Oder Chiou 2025-12-11  250  	struct spi_device *spi;
56f073d89eb8e0 Oder Chiou 2025-12-11  251  	struct device *dev = &i2c->dev;
56f073d89eb8e0 Oder Chiou 2025-12-11  252  	int ret;
56f073d89eb8e0 Oder Chiou 2025-12-11  253  
56f073d89eb8e0 Oder Chiou 2025-12-11  254  	spi = rt5575_spi_find_device();
56f073d89eb8e0 Oder Chiou 2025-12-11  255  	if (!spi) {
56f073d89eb8e0 Oder Chiou 2025-12-11 @256  		dev_err(dev, "Get SPI device failure: %d\n", ret);
56f073d89eb8e0 Oder Chiou 2025-12-11  257  		return -ENODEV;
56f073d89eb8e0 Oder Chiou 2025-12-11  258  	}
56f073d89eb8e0 Oder Chiou 2025-12-11  259  
56f073d89eb8e0 Oder Chiou 2025-12-11  260  	regmap_write(rt5575->dsp_regmap, 0xfafafafa, 0x00000004);
56f073d89eb8e0 Oder Chiou 2025-12-11  261  	regmap_write(rt5575->dsp_regmap, 0x18008064, 0x00000000);
56f073d89eb8e0 Oder Chiou 2025-12-11  262  	regmap_write(rt5575->dsp_regmap, 0x18008068, 0x0002ffff);
56f073d89eb8e0 Oder Chiou 2025-12-11  263  
56f073d89eb8e0 Oder Chiou 2025-12-11  264  	ret = rt5575_spi_fw_load(spi);
56f073d89eb8e0 Oder Chiou 2025-12-11  265  	if (ret) {
56f073d89eb8e0 Oder Chiou 2025-12-11  266  		dev_err(dev, "Load firmware failure: %d\n", ret);
56f073d89eb8e0 Oder Chiou 2025-12-11  267  		return -ENODEV;
56f073d89eb8e0 Oder Chiou 2025-12-11  268  	}
56f073d89eb8e0 Oder Chiou 2025-12-11  269  
56f073d89eb8e0 Oder Chiou 2025-12-11  270  	regmap_write(rt5575->dsp_regmap, 0x18000000, 0x00000000);
56f073d89eb8e0 Oder Chiou 2025-12-11  271  	regmap_update_bits(rt5575->regmap, RT5575_SW_INT, 1, 1);
56f073d89eb8e0 Oder Chiou 2025-12-11  272  
56f073d89eb8e0 Oder Chiou 2025-12-11  273  	regmap_read_poll_timeout(rt5575->regmap, RT5575_SW_INT, ret, !ret, 100000, 10000000);
56f073d89eb8e0 Oder Chiou 2025-12-11  274  	if (ret) {
56f073d89eb8e0 Oder Chiou 2025-12-11  275  		dev_err(dev, "Run firmware failure: %d\n", ret);
56f073d89eb8e0 Oder Chiou 2025-12-11  276  		return -ENODEV;
56f073d89eb8e0 Oder Chiou 2025-12-11  277  	}
56f073d89eb8e0 Oder Chiou 2025-12-11  278  
56f073d89eb8e0 Oder Chiou 2025-12-11  279  	return 0;
56f073d89eb8e0 Oder Chiou 2025-12-11  280  }
56f073d89eb8e0 Oder Chiou 2025-12-11  281  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
