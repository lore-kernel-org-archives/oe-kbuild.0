Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8E091AB6E2
	for <oe-kbuild@lists.linux.dev>; Mon, 30 Dec 2024 16:12:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735575140; cv=none; b=FENfz7/i/6u3QHrgIkYFSDg72WOCHF6uqKTYuR/DnztOf31Ce6OJdpp7IGfbrc5Qtrcc6KFJqgNbR8AfBSaKVABjWRjCYSTZxvcyKZclgev1pT2Y52vrdh7W6o4zIoQqCMTgLp+k0zraJNnqmsvh52SE7y+tnSkqXwLfsOofh8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735575140; c=relaxed/simple;
	bh=hk77LNagPsnyUgYnaX/AP2UlK8P6KDY4hdnvXQA2ECs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QSkkWMjyZo9Iu1eLhh3+jDyDy0lmnkdo+M5D8LjYp6f3jH4Y+FkP0uhaK3mRYe8kwkk8u1WXv45uyxjTyGMVFbyR9OVxwFP41uhRB5ERo3KxPEPxe5RvL8/uXMZsxaqq0oQgfCbwCUi0/5+iuBX4RZ352L1QuM04hTrUeiYfNLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nky6hZ0t; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nky6hZ0t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735575139; x=1767111139;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=hk77LNagPsnyUgYnaX/AP2UlK8P6KDY4hdnvXQA2ECs=;
  b=nky6hZ0tx4Z/gbPtiFBywB7DYJt9YoqTEIi1n97nMEvs6B0RO4SKn0UU
   8FnWsvk4ru44UXYMoVKJ0YKeHO1oB6JKMPeeQu9pICT1oUJPS3YtVhuJu
   OX0/yynE0cBlBcwhb0PXs+VRt+3pfUyce/bLSr77IiqHs/zM9AdEfEaYQ
   ieertFKWH1zT+T2ussxP1+41rQVyAcEoZZ/93lEKjbPS4YVCpqSn07leV
   J5FY3bv3w1oOmc4FuGHSI1QxtebtrwF5C452nTTUAIjaA+IESFYlE6hfe
   brOPd81stPZLFs02ixA6IFU/PkBHa/jZQLtmbNsQWiKjUquDkjemy9XiB
   w==;
X-CSE-ConnectionGUID: HtRFmEJZSvqLL9eA/gTCkA==
X-CSE-MsgGUID: rMl98RX5SmyLp+9c6R0lBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="35976182"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="35976182"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 08:12:14 -0800
X-CSE-ConnectionGUID: g7Y0Idd4Sh6kwODsKu63+w==
X-CSE-MsgGUID: MbYVth0UT7mYFwSVThfgmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="131773556"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 30 Dec 2024 08:12:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSINF-0006Aj-1w;
	Mon, 30 Dec 2024 16:12:09 +0000
Date: Tue, 31 Dec 2024 00:11:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [gerg-m68knommu:armnommu 3/3] drivers/mtd/maps/pismo.c:243
 pismo_probe() error: we previously assumed 'pdata' could be null (see line
 226)
Message-ID: <202412310053.VgXsTpPO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-m68k@lists.linux-m68k.org
CC: uclinux-dev@uclinux.org
TO: Greg Ungerer <gerg@uclinux.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git armnommu
head:   d03e292d5f72c15f004a13503f4a5cca0a26bec0
commit: d03e292d5f72c15f004a13503f4a5cca0a26bec0 [3/3] ARM: versatile: support configuring versatile machine for no-MMU
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: arm-randconfig-r073-20241230 (https://download.01.org/0day-ci/archive/20241231/202412310053.VgXsTpPO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412310053.VgXsTpPO-lkp@intel.com/

smatch warnings:
drivers/mtd/maps/pismo.c:243 pismo_probe() error: we previously assumed 'pdata' could be null (see line 226)

vim +/pdata +243 drivers/mtd/maps/pismo.c

f6a8c60960bbea Russell King - ARM Linux 2009-11-29  208  
0b79d5d1e5982b Uwe Kleine-König         2023-02-26  209  static int pismo_probe(struct i2c_client *client)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  210  {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  211  	struct pismo_pdata *pdata = client->dev.platform_data;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  212  	struct pismo_eeprom eeprom;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  213  	struct pismo_data *pismo;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  214  	int ret, i;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  215  
752031210ca145 Wolfram Sang             2019-07-22  216  	if (!i2c_check_functionality(client->adapter, I2C_FUNC_I2C)) {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  217  		dev_err(&client->dev, "functionality mismatch\n");
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  218  		return -EIO;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  219  	}
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  220  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  221  	pismo = kzalloc(sizeof(*pismo), GFP_KERNEL);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  222  	if (!pismo)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  223  		return -ENOMEM;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  224  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  225  	pismo->client = client;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29 @226  	if (pdata) {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  227  		pismo->vpp = pdata->set_vpp;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  228  		pismo->vpp_data = pdata->vpp_data;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  229  	}
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  230  	i2c_set_clientdata(client, pismo);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  231  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  232  	ret = pismo_eeprom_read(client, &eeprom, 0, sizeof(eeprom));
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  233  	if (ret < 0) {
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  234  		dev_err(&client->dev, "error reading EEPROM: %d\n", ret);
395b228858778d Wolfram Sang             2010-03-20  235  		goto exit_free;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  236  	}
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  237  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  238  	dev_info(&client->dev, "%.15s board found\n", eeprom.board);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  239  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  240  	for (i = 0; i < ARRAY_SIZE(eeprom.cs); i++)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  241  		if (eeprom.cs[i].type != 0xff)
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  242  			pismo_add_one(pismo, i, &eeprom.cs[i],
f6a8c60960bbea Russell King - ARM Linux 2009-11-29 @243  				      pdata->cs_addrs[i]);
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  244  
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  245  	return 0;
395b228858778d Wolfram Sang             2010-03-20  246  
395b228858778d Wolfram Sang             2010-03-20  247   exit_free:
395b228858778d Wolfram Sang             2010-03-20  248  	kfree(pismo);
395b228858778d Wolfram Sang             2010-03-20  249  	return ret;
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  250  }
f6a8c60960bbea Russell King - ARM Linux 2009-11-29  251  

:::::: The code at line 243 was first introduced by commit
:::::: f6a8c60960bbea378142d1fa1b3d111555ee41c7 mtd: Really add ARM pismo support

:::::: TO: Russell King - ARM Linux <linux@arm.linux.org.uk>
:::::: CC: David Woodhouse <David.Woodhouse@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
