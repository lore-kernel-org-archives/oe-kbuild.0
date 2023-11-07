Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6ACD1A932
	for <oe-kbuild@lists.linux.dev>; Tue,  7 Nov 2023 01:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fQ8Yl1+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699320453; x=1730856453;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jWfRp0RqLijKvyiPxAFWv9bKrgHm7YOBDTWxshB/y40=;
  b=fQ8Yl1+J2Z5DlLVuNRqXvSOxX/I0dX7+R08eci72Yw9+S2FQ6zq2hpJ0
   wxpyRPwhRx780i9FY1ioPdxVZcKHtZUW7gAobCVJUVLnLYttaLL2EhQmB
   oEmHeOeFFrZMANLznn16oMjGbG4WPrGue8VC4XyZHhzdaPSMpa+CzsCIO
   kzB48ZpcpsiD4vgr9cwADXV0YC+6COT/WIuwNyVQaIYqEkBOVc/34x0kC
   NS5y8QW7DU8LMhwWc0sttpB2zsupmT0ha8a+Aui6FcU8Gstm9eQjfYm9q
   gnHWVXsrtKOadLDW3ajvVarZFxBd1ycdvKZP55YSARieO76oOnjr9WzaD
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="386577288"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="386577288"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2023 17:27:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10886"; a="738950582"
X-IronPort-AV: E=Sophos;i="6.03,282,1694761200"; 
   d="scan'208";a="738950582"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 06 Nov 2023 17:27:29 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r0AsJ-0006sh-1y;
	Tue, 07 Nov 2023 01:27:27 +0000
Date: Tue, 7 Nov 2023 09:27:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1338:9: sparse: sparse:
 obsolete array initializer, use C99 syntax
Message-ID: <202311070855.s1qyuPA0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1338:9: sparse: sparse: obsolete array initializer, use C99 syntax"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Tomer Maimon <tmaimon77@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   be3ca57cfb777ad820c6659d52e60bbdd36bf5ff
commit: acf4884a571709cad99f98aabe08b7cacd62dc80 pinctrl: nuvoton: add NPCM8XX pinctrl and GPIO driver
date:   8 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 8 weeks ago
config: sh-randconfig-r111-20231106 (https://download.01.org/0day-ci/archive/20231107/202311070855.s1qyuPA0-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231107/202311070855.s1qyuPA0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311070855.s1qyuPA0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1338:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1339:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1340:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1341:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1342:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1343:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1344:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1345:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1346:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1347:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1348:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1349:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1350:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1351:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1352:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1353:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1354:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1355:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1356:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1357:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1358:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1359:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1360:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1361:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1362:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1363:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1364:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1365:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1366:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1367:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1368:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1369:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1370:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1371:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1372:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1373:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1374:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1375:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1376:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1377:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1378:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1379:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1380:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1381:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1382:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1383:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1384:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1385:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1386:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1387:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1388:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1389:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1390:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1391:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1392:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1393:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1394:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1395:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1396:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1397:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1398:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1399:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1400:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1401:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1402:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1403:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1404:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1405:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1406:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1407:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1408:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1409:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1410:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1411:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1412:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1413:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1414:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1415:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1416:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1417:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1418:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1419:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1420:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1421:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1422:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1423:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1424:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1425:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1426:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1427:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1428:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1429:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1430:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1431:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1432:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1433:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1434:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1435:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1436:9: sparse: sparse: obsolete array initializer, use C99 syntax
   drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c:1437:9: sparse: sparse: too many warnings

vim +1338 drivers/pinctrl/nuvoton/pinctrl-npcm8xx.c

acf4884a571709 Tomer Maimon 2023-08-28  1335  
acf4884a571709 Tomer Maimon 2023-08-28  1336  static const struct npcm8xx_pincfg pincfg[] = {
acf4884a571709 Tomer Maimon 2023-08-28  1337  	/*		PIN	  FUNCTION 1		   FUNCTION 2		  FUNCTION 3		FUNCTION 4		FUNCTION 5		FLAGS */
acf4884a571709 Tomer Maimon 2023-08-28 @1338  	NPCM8XX_PINCFG(0,	iox1, MFSEL1, 30,	smb6c, I2CSEGSEL, 25,	smb18, MFSEL5, 26,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1339  	NPCM8XX_PINCFG(1,	iox1, MFSEL1, 30,	smb6c, I2CSEGSEL, 25,	smb18, MFSEL5, 26,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1340  	NPCM8XX_PINCFG(2,	iox1, MFSEL1, 30,	smb6b, I2CSEGSEL, 24,	smb17, MFSEL5, 25,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1341  	NPCM8XX_PINCFG(3,	iox1, MFSEL1, 30,	smb6b, I2CSEGSEL, 24,	smb17, MFSEL5, 25,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1342  	NPCM8XX_PINCFG(4,	iox2, MFSEL3, 14,	smb1d, I2CSEGSEL, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1343  	NPCM8XX_PINCFG(5,	iox2, MFSEL3, 14,	smb1d, I2CSEGSEL, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1344  	NPCM8XX_PINCFG(6,	iox2, MFSEL3, 14,	smb2d, I2CSEGSEL, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1345  	NPCM8XX_PINCFG(7,	iox2, MFSEL3, 14,	smb2d, I2CSEGSEL, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1346  	NPCM8XX_PINCFG(8,	lkgpo1,	FLOCKR1, 4,	tp_gpio0b, MFSEL7, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
acf4884a571709 Tomer Maimon 2023-08-28  1347  	NPCM8XX_PINCFG(9,	lkgpo2,	FLOCKR1, 8,	tp_gpio1b, MFSEL7, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
acf4884a571709 Tomer Maimon 2023-08-28  1348  	NPCM8XX_PINCFG(10,	ioxh, MFSEL3, 18,	smb6d, I2CSEGSEL, 26,	smb16, MFSEL5, 24,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1349  	NPCM8XX_PINCFG(11,	ioxh, MFSEL3, 18,	smb6d, I2CSEGSEL, 26,	smb16, MFSEL5, 24,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1350  	NPCM8XX_PINCFG(12,	gspi, MFSEL1, 24,	smb5b, I2CSEGSEL, 19,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1351  	NPCM8XX_PINCFG(13,	gspi, MFSEL1, 24,	smb5b, I2CSEGSEL, 19,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1352  	NPCM8XX_PINCFG(14,	gspi, MFSEL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1353  	NPCM8XX_PINCFG(15,	gspi, MFSEL1, 24,	smb5c, I2CSEGSEL, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1354  	NPCM8XX_PINCFG(16,	lkgpo0, FLOCKR1, 0,	smb7b, I2CSEGSEL, 27,	tp_gpio2b, MFSEL7, 10,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1355  	NPCM8XX_PINCFG(17,	pspi, MFSEL3, 13,	cp1gpio5, MFSEL6, 7,	smb4den, I2CSEGSEL, 23,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1356  	NPCM8XX_PINCFG(18,	pspi, MFSEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1357  	NPCM8XX_PINCFG(19,	pspi, MFSEL3, 13,	smb4b, I2CSEGSEL, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1358  	NPCM8XX_PINCFG(20,	hgpio0,	MFSEL2, 24,	smb15, MFSEL3, 8,	smb4c, I2CSEGSEL, 15,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1359  	NPCM8XX_PINCFG(21,	hgpio1,	MFSEL2, 25,	smb15, MFSEL3, 8,	smb4c, I2CSEGSEL, 15,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1360  	NPCM8XX_PINCFG(22,	hgpio2,	MFSEL2, 26,	smb14, MFSEL3, 7,	smb4d, I2CSEGSEL, 16,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1361  	NPCM8XX_PINCFG(23,	hgpio3,	MFSEL2, 27,	smb14, MFSEL3, 7,	smb4d, I2CSEGSEL, 16,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1362  	NPCM8XX_PINCFG(24,	hgpio4,	MFSEL2, 28,	ioxh, MFSEL3, 18,	smb7c, I2CSEGSEL, 28,	tp_smb2, MFSEL7, 28,	none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1363  	NPCM8XX_PINCFG(25,	hgpio5,	MFSEL2, 29,	ioxh, MFSEL3, 18,	smb7c, I2CSEGSEL, 28,	tp_smb2, MFSEL7, 28,	none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1364  	NPCM8XX_PINCFG(26,	smb5, MFSEL1, 2,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1365  	NPCM8XX_PINCFG(27,	smb5, MFSEL1, 2,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1366  	NPCM8XX_PINCFG(28,	smb4, MFSEL1, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1367  	NPCM8XX_PINCFG(29,	smb4, MFSEL1, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1368  	NPCM8XX_PINCFG(30,	smb3, MFSEL1, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1369  	NPCM8XX_PINCFG(31,	smb3, MFSEL1, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1370  	NPCM8XX_PINCFG(32,	spi0cs1, MFSEL1, 3,	smb14b, MFSEL7, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1371  	NPCM8XX_PINCFG(33,	i3c4, MFSEL6, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1372  	NPCM8XX_PINCFG(34,	i3c4, MFSEL6, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1373  	NPCM8XX_PINCFG(37,	smb3c, I2CSEGSEL, 12,	smb23, MFSEL5, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1374  	NPCM8XX_PINCFG(38,	smb3c, I2CSEGSEL, 12,	smb23, MFSEL5, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1375  	NPCM8XX_PINCFG(39,	smb3b, I2CSEGSEL, 11,	smb22, MFSEL5, 30,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1376  	NPCM8XX_PINCFG(40,	smb3b, I2CSEGSEL, 11,	smb22, MFSEL5, 30,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1377  	NPCM8XX_PINCFG(41,	bmcuart0a, MFSEL1, 9,	cp1urxd, MFSEL6, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1378  	NPCM8XX_PINCFG(42,	bmcuart0a, MFSEL1, 9,	cp1utxd, MFSEL6, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(2, 4) | GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1379  	NPCM8XX_PINCFG(43,	uart1, MFSEL1, 10,	bmcuart1, MFSEL3, 24,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1380  	NPCM8XX_PINCFG(44,	hsi1b, MFSEL1, 28,	nbu1crts, MFSEL6, 15,	jtag2, MFSEL4, 0,	tp_jtag3, MFSEL7, 13,	j2j3, MFSEL5, 2,	GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1381  	NPCM8XX_PINCFG(45,	hsi1c, MFSEL1, 4,	jtag2, MFSEL4, 0,	j2j3, MFSEL5, 2,	tp_jtag3, MFSEL7, 13,	none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1382  	NPCM8XX_PINCFG(46,	hsi1c, MFSEL1, 4,	jtag2, MFSEL4, 0,	j2j3, MFSEL5, 2,	tp_jtag3, MFSEL7, 13,	none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1383  	NPCM8XX_PINCFG(47,	hsi1c, MFSEL1, 4,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(2, 8)),
acf4884a571709 Tomer Maimon 2023-08-28  1384  	NPCM8XX_PINCFG(48,	hsi2a, MFSEL1, 11,	bmcuart0b, MFSEL4, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1385  	NPCM8XX_PINCFG(49,	hsi2a, MFSEL1, 11,	bmcuart0b, MFSEL4, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1386  	NPCM8XX_PINCFG(50,	hsi2b, MFSEL1, 29,	bu6, MFSEL5, 6,		tp_uart, MFSEL7, 12,	none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1387  	NPCM8XX_PINCFG(51,	hsi2b, MFSEL1, 29,	bu6, MFSEL5, 6,		tp_uart, MFSEL7, 12,	none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1388  	NPCM8XX_PINCFG(52,	hsi2c, MFSEL1, 5,	bu5, MFSEL5, 7,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1389  	NPCM8XX_PINCFG(53,	hsi2c, MFSEL1, 5,	bu5, MFSEL5, 7,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1390  	NPCM8XX_PINCFG(54,	hsi2c, MFSEL1, 5,	bu4, MFSEL5, 8,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1391  	NPCM8XX_PINCFG(55,	hsi2c, MFSEL1, 5,	bu4, MFSEL5, 8,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1392  	NPCM8XX_PINCFG(56,	r1err, MFSEL1, 12,	r1oen, MFSEL5, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1393  	NPCM8XX_PINCFG(57,	r1md, MFSEL1, 13,	tpgpio4b, MFSEL5, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(2, 4)),
acf4884a571709 Tomer Maimon 2023-08-28  1394  	NPCM8XX_PINCFG(58,	r1md, MFSEL1, 13,	tpgpio5b, MFSEL5, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(2, 4)),
acf4884a571709 Tomer Maimon 2023-08-28  1395  	NPCM8XX_PINCFG(59,	hgpio6, MFSEL2, 30,	smb3d, I2CSEGSEL, 13,	smb19, MFSEL5, 27,	none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1396  	NPCM8XX_PINCFG(60,	hgpio7, MFSEL2, 31,	smb3d, I2CSEGSEL, 13,	smb19, MFSEL5, 27,	none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1397  	NPCM8XX_PINCFG(61,	hsi1c, MFSEL1, 4,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1398  	NPCM8XX_PINCFG(62,	hsi1b, MFSEL1, 28,	jtag2, MFSEL4, 0,	j2j3, MFSEL5, 2,	nbu1crts, MFSEL6, 15,	tp_jtag3, MFSEL7, 13,	GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1399  	NPCM8XX_PINCFG(63,	hsi1a, MFSEL1, 10,	bmcuart1, MFSEL3, 24,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1400  	NPCM8XX_PINCFG(64,	fanin0, MFSEL2, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1401  	NPCM8XX_PINCFG(65,	fanin1, MFSEL2, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1402  	NPCM8XX_PINCFG(66,	fanin2, MFSEL2, 2,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1403  	NPCM8XX_PINCFG(67,	fanin3, MFSEL2, 3,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1404  	NPCM8XX_PINCFG(68,	fanin4, MFSEL2, 4,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1405  	NPCM8XX_PINCFG(69,	fanin5, MFSEL2, 5,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1406  	NPCM8XX_PINCFG(70,	fanin6, MFSEL2, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1407  	NPCM8XX_PINCFG(71,	fanin7, MFSEL2, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1408  	NPCM8XX_PINCFG(72,	fanin8, MFSEL2, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1409  	NPCM8XX_PINCFG(73,	fanin9, MFSEL2, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1410  	NPCM8XX_PINCFG(74,	fanin10, MFSEL2, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1411  	NPCM8XX_PINCFG(75,	fanin11, MFSEL2, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1412  	NPCM8XX_PINCFG(76,	fanin12, MFSEL2, 12,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1413  	NPCM8XX_PINCFG(77,	fanin13, MFSEL2, 13,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1414  	NPCM8XX_PINCFG(78,	fanin14, MFSEL2, 14,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1415  	NPCM8XX_PINCFG(79,	fanin15, MFSEL2, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1416  	NPCM8XX_PINCFG(80,	pwm0, MFSEL2, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
acf4884a571709 Tomer Maimon 2023-08-28  1417  	NPCM8XX_PINCFG(81,	pwm1, MFSEL2, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
acf4884a571709 Tomer Maimon 2023-08-28  1418  	NPCM8XX_PINCFG(82,	pwm2, MFSEL2, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
acf4884a571709 Tomer Maimon 2023-08-28  1419  	NPCM8XX_PINCFG(83,	pwm3, MFSEL2, 19,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
acf4884a571709 Tomer Maimon 2023-08-28  1420  	NPCM8XX_PINCFG(84,	r2, MFSEL1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1421  	NPCM8XX_PINCFG(85,	r2, MFSEL1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1422  	NPCM8XX_PINCFG(86,	r2, MFSEL1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1423  	NPCM8XX_PINCFG(87,	r2, MFSEL1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1424  	NPCM8XX_PINCFG(88,	r2, MFSEL1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1425  	NPCM8XX_PINCFG(89,	r2, MFSEL1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1426  	NPCM8XX_PINCFG(90,	r2err, MFSEL1, 15,	r2oen, MFSEL5, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1427  	NPCM8XX_PINCFG(91,	r2md, MFSEL1, 16,	cp1gpio6, MFSEL6, 8,	tp_gpio0, MFSEL7, 0,	none, NONE, 0,		none, NONE, 0,		DSTR(2, 4)),
acf4884a571709 Tomer Maimon 2023-08-28  1428  	NPCM8XX_PINCFG(92,	r2md, MFSEL1, 16,	cp1gpio7, MFSEL6, 9,	tp_gpio1, MFSEL7, 1,	none, NONE, 0,		none, NONE, 0,		DSTR(2, 4)),
acf4884a571709 Tomer Maimon 2023-08-28  1429  	NPCM8XX_PINCFG(93,	ga20kbc, MFSEL1, 17,	smb5d, I2CSEGSEL, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1430  	NPCM8XX_PINCFG(94,	ga20kbc, MFSEL1, 17,	smb5d, I2CSEGSEL, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1431  	NPCM8XX_PINCFG(95,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1432  	NPCM8XX_PINCFG(96,	cp1gpio7b, MFSEL6, 24,	tp_gpio7, MFSEL7, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1433  	NPCM8XX_PINCFG(97,	cp1gpio6b, MFSEL6, 25,	tp_gpio6, MFSEL7, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1434  	NPCM8XX_PINCFG(98,	bu4b, MFSEL5, 13,	cp1gpio5b, MFSEL6, 26,	tp_gpio5, MFSEL7, 5,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1435  	NPCM8XX_PINCFG(99,	bu4b, MFSEL5, 13,	cp1gpio4b, MFSEL6, 27,	tp_gpio4, MFSEL7, 4,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1436  	NPCM8XX_PINCFG(100,	bu5b, MFSEL5, 12,	cp1gpio3c, MFSEL6, 28,	tp_gpio3, MFSEL7, 3,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1437  	NPCM8XX_PINCFG(101,	bu5b, MFSEL5, 12,	cp1gpio2c, MFSEL6, 29,	tp_gpio2, MFSEL7, 2,	none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1438  	NPCM8XX_PINCFG(102,	vgadig, MFSEL7, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
acf4884a571709 Tomer Maimon 2023-08-28  1439  	NPCM8XX_PINCFG(103,	vgadig, MFSEL7, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
acf4884a571709 Tomer Maimon 2023-08-28  1440  	NPCM8XX_PINCFG(104,	vgadig, MFSEL7, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1441  	NPCM8XX_PINCFG(105,	vgadig, MFSEL7, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1442  	NPCM8XX_PINCFG(106,	i3c5, MFSEL3, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1443  	NPCM8XX_PINCFG(107,	i3c5, MFSEL3, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1444  	NPCM8XX_PINCFG(108,	sg1mdio, MFSEL4, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1445  	NPCM8XX_PINCFG(109,	sg1mdio, MFSEL4, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1446  	NPCM8XX_PINCFG(110,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1447  	NPCM8XX_PINCFG(111,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1448  	NPCM8XX_PINCFG(112,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1449  	NPCM8XX_PINCFG(113,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1450  	NPCM8XX_PINCFG(114,	smb0, MFSEL1, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1451  	NPCM8XX_PINCFG(115,	smb0, MFSEL1, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1452  	NPCM8XX_PINCFG(116,	smb1, MFSEL1, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1453  	NPCM8XX_PINCFG(117,	smb1, MFSEL1, 7,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1454  	NPCM8XX_PINCFG(118,	smb2, MFSEL1, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1455  	NPCM8XX_PINCFG(119,	smb2, MFSEL1, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1456  	NPCM8XX_PINCFG(120,	smb2c, I2CSEGSEL, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1457  	NPCM8XX_PINCFG(121,	smb2c, I2CSEGSEL, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1458  	NPCM8XX_PINCFG(122,	smb2b, I2CSEGSEL, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1459  	NPCM8XX_PINCFG(123,	smb2b, I2CSEGSEL, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1460  	NPCM8XX_PINCFG(124,	smb1c, I2CSEGSEL, 6,	cp1gpio3b, MFSEL6, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1461  	NPCM8XX_PINCFG(125,	smb1c, I2CSEGSEL, 6,	cp1gpio2b, MFSEL6, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1462  	NPCM8XX_PINCFG(126,	smb1b, I2CSEGSEL, 5,	cp1gpio1b, MFSEL6, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1463  	NPCM8XX_PINCFG(127,	smb1b, I2CSEGSEL, 5,	cp1gpio0b, MFSEL6, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1464  	NPCM8XX_PINCFG(128,	smb8, MFSEL4, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1465  	NPCM8XX_PINCFG(129,	smb8, MFSEL4, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1466  	NPCM8XX_PINCFG(130,	smb9, MFSEL4, 12,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1467  	NPCM8XX_PINCFG(131,	smb9, MFSEL4, 12,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1468  	NPCM8XX_PINCFG(132,	smb10, MFSEL4, 13,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1469  	NPCM8XX_PINCFG(133,	smb10, MFSEL4, 13,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1470  	NPCM8XX_PINCFG(134,	smb11, MFSEL4, 14,	smb23b, MFSEL6, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1471  	NPCM8XX_PINCFG(135,	smb11, MFSEL4, 14,	smb23b, MFSEL6, 0,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1472  	NPCM8XX_PINCFG(136,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1473  	NPCM8XX_PINCFG(137,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1474  	NPCM8XX_PINCFG(138,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1475  	NPCM8XX_PINCFG(139,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1476  	NPCM8XX_PINCFG(140,	jm1, MFSEL5, 15,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1477  	NPCM8XX_PINCFG(141,	smb7b, I2CSEGSEL, 27,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1478  	NPCM8XX_PINCFG(142,	smb7d, I2CSEGSEL, 29,	tp_smb1, MFSEL7, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1479  	NPCM8XX_PINCFG(143,	smb7d, I2CSEGSEL, 29,	tp_smb1, MFSEL7, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1480  	NPCM8XX_PINCFG(144,	pwm4, MFSEL2, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
acf4884a571709 Tomer Maimon 2023-08-28  1481  	NPCM8XX_PINCFG(145,	pwm5, MFSEL2, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
acf4884a571709 Tomer Maimon 2023-08-28  1482  	NPCM8XX_PINCFG(146,	pwm6, MFSEL2, 22,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
acf4884a571709 Tomer Maimon 2023-08-28  1483  	NPCM8XX_PINCFG(147,	pwm7, MFSEL2, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 8)),
acf4884a571709 Tomer Maimon 2023-08-28  1484  	NPCM8XX_PINCFG(148,	mmc8, MFSEL3, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1485  	NPCM8XX_PINCFG(149,	mmc8, MFSEL3, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1486  	NPCM8XX_PINCFG(150,	mmc8, MFSEL3, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1487  	NPCM8XX_PINCFG(151,	mmc8, MFSEL3, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1488  	NPCM8XX_PINCFG(152,	mmc, MFSEL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1489  	NPCM8XX_PINCFG(153,	mmcwp, FLOCKR1, 24,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1490  	NPCM8XX_PINCFG(154,	mmc, MFSEL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1491  	NPCM8XX_PINCFG(155,	mmccd, MFSEL3, 25,	mmcrst, MFSEL4, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1492  	NPCM8XX_PINCFG(156,	mmc, MFSEL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1493  	NPCM8XX_PINCFG(157,	mmc, MFSEL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1494  	NPCM8XX_PINCFG(158,	mmc, MFSEL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1495  	NPCM8XX_PINCFG(159,	mmc, MFSEL3, 10,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1496  	NPCM8XX_PINCFG(160,	clkout, MFSEL1, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1497  	NPCM8XX_PINCFG(161,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1498  	NPCM8XX_PINCFG(162,	serirq, MFSEL1, 31,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
acf4884a571709 Tomer Maimon 2023-08-28  1499  	NPCM8XX_PINCFG(163,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1500  	NPCM8XX_PINCFG(164,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1501  	NPCM8XX_PINCFG(165,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1502  	NPCM8XX_PINCFG(166,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1503  	NPCM8XX_PINCFG(167,	lpc, MFSEL1, 26,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1504  	NPCM8XX_PINCFG(168,	lpcclk, MFSEL1, 31,	espi, MFSEL4, 8,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1505  	NPCM8XX_PINCFG(169,	scipme, MFSEL3, 0,	smb21, MFSEL5, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1506  	NPCM8XX_PINCFG(170,	smi, MFSEL1, 22,	smb21, MFSEL5, 29,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1507  	NPCM8XX_PINCFG(171,	smb6, MFSEL3, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1508  	NPCM8XX_PINCFG(172,	smb6, MFSEL3, 1,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1509  	NPCM8XX_PINCFG(173,	smb7, MFSEL3, 2,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1510  	NPCM8XX_PINCFG(174,	smb7, MFSEL3, 2,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1511  	NPCM8XX_PINCFG(175,	spi1, MFSEL3, 4,	faninx, MFSEL3, 3,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
acf4884a571709 Tomer Maimon 2023-08-28  1512  	NPCM8XX_PINCFG(176,	spi1, MFSEL3, 4,	faninx, MFSEL3, 3,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
acf4884a571709 Tomer Maimon 2023-08-28  1513  	NPCM8XX_PINCFG(177,	spi1, MFSEL3, 4,	faninx, MFSEL3, 3,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
acf4884a571709 Tomer Maimon 2023-08-28  1514  	NPCM8XX_PINCFG(178,	r1, MFSEL3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1515  	NPCM8XX_PINCFG(179,	r1, MFSEL3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1516  	NPCM8XX_PINCFG(180,	r1, MFSEL3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1517  	NPCM8XX_PINCFG(181,	r1, MFSEL3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1518  	NPCM8XX_PINCFG(182,	r1, MFSEL3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1519  	NPCM8XX_PINCFG(183,	gpio1836, MFSEL6, 19,	spi3, MFSEL4, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1520  	NPCM8XX_PINCFG(184,	gpio1836, MFSEL6, 19,	spi3, MFSEL4, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1521  	NPCM8XX_PINCFG(185,	gpio1836, MFSEL6, 19,	spi3, MFSEL4, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1522  	NPCM8XX_PINCFG(186,	gpio1836, MFSEL6, 19,	spi3, MFSEL4, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
acf4884a571709 Tomer Maimon 2023-08-28  1523  	NPCM8XX_PINCFG(187,	gpo187, MFSEL7, 24,	smb14b, MFSEL7, 26,	spi3cs1, MFSEL4, 17,	none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1524  	NPCM8XX_PINCFG(188,	gpio1889, MFSEL7, 25,	spi3cs2, MFSEL4, 18,	spi3quad, MFSEL4, 20,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1525  	NPCM8XX_PINCFG(189,	gpio1889, MFSEL7, 25,	spi3cs3, MFSEL4, 19,	spi3quad, MFSEL4, 20,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1526  	NPCM8XX_PINCFG(190,	nprd_smi, FLOCKR1, 20,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(2, 4)),
acf4884a571709 Tomer Maimon 2023-08-28  1527  	NPCM8XX_PINCFG(191,	spi1d23, MFSEL5, 3,	spi1cs2, MFSEL5, 4,	fm1, MFSEL6, 17,	smb15, MFSEL7, 27,	none, NONE, 0,		DSTR(0, 2)),  /* XX */
acf4884a571709 Tomer Maimon 2023-08-28  1528  	NPCM8XX_PINCFG(192,	spi1d23, MFSEL5, 3,	spi1cs3, MFSEL5, 5,	fm1, MFSEL6, 17,	smb15, MFSEL7, 27,	none, NONE, 0,		DSTR(0, 2)),  /* XX */
acf4884a571709 Tomer Maimon 2023-08-28  1529  	NPCM8XX_PINCFG(193,	r1, MFSEL3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1530  	NPCM8XX_PINCFG(194,	smb0b, I2CSEGSEL, 0,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
acf4884a571709 Tomer Maimon 2023-08-28  1531  	NPCM8XX_PINCFG(195,	smb0b, I2CSEGSEL, 0,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
acf4884a571709 Tomer Maimon 2023-08-28  1532  	NPCM8XX_PINCFG(196,	smb0c, I2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
acf4884a571709 Tomer Maimon 2023-08-28  1533  	NPCM8XX_PINCFG(197,	smb0den, I2CSEGSEL, 22,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
acf4884a571709 Tomer Maimon 2023-08-28  1534  	NPCM8XX_PINCFG(198,	smb0d, I2CSEGSEL, 2,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
acf4884a571709 Tomer Maimon 2023-08-28  1535  	NPCM8XX_PINCFG(199,	smb0d, I2CSEGSEL, 2,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
acf4884a571709 Tomer Maimon 2023-08-28  1536  	NPCM8XX_PINCFG(200,	r2, MFSEL1, 14,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1537  	NPCM8XX_PINCFG(201,	r1, MFSEL3, 9,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO),
acf4884a571709 Tomer Maimon 2023-08-28  1538  	NPCM8XX_PINCFG(202,	smb0c, I2CSEGSEL, 1,	fm0, MFSEL6, 16,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(0, 1)),
acf4884a571709 Tomer Maimon 2023-08-28  1539  	NPCM8XX_PINCFG(203,	faninx, MFSEL3, 3,	spi1cs0, MFSEL3, 4,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12)),
acf4884a571709 Tomer Maimon 2023-08-28  1540  	NPCM8XX_PINCFG(208,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW), /* DSCNT */
acf4884a571709 Tomer Maimon 2023-08-28  1541  	NPCM8XX_PINCFG(209,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		SLEW), /* DSCNT */
acf4884a571709 Tomer Maimon 2023-08-28  1542  	NPCM8XX_PINCFG(210,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1543  	NPCM8XX_PINCFG(211,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1544  	NPCM8XX_PINCFG(212,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	r3rxer, MFSEL6, 30,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1545  	NPCM8XX_PINCFG(213,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	r3oen, MFSEL5, 14,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1546  	NPCM8XX_PINCFG(214,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1547  	NPCM8XX_PINCFG(215,	rg2, MFSEL4, 24,	ddr, MFSEL3, 26,	rmii3, MFSEL5, 11,	none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1548  	NPCM8XX_PINCFG(216,	rg2mdio, MFSEL4, 23,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1549  	NPCM8XX_PINCFG(217,	rg2mdio, MFSEL4, 23,	ddr, MFSEL3, 26,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1550  	NPCM8XX_PINCFG(218,	wdog1, MFSEL3, 19,	smb16b, MFSEL7, 30,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1551  	NPCM8XX_PINCFG(219,	wdog2, MFSEL3, 20,	smb16b, MFSEL7, 30,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1552  	NPCM8XX_PINCFG(220,	smb12, MFSEL3, 5,	pwm8, MFSEL6, 11,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1553  	NPCM8XX_PINCFG(221,	smb12, MFSEL3, 5,	pwm9, MFSEL6, 12,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1554  	NPCM8XX_PINCFG(222,	smb13, MFSEL3, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1555  	NPCM8XX_PINCFG(223,	smb13, MFSEL3, 6,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1556  	NPCM8XX_PINCFG(224,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1557  	NPCM8XX_PINCFG(225,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1558  	NPCM8XX_PINCFG(226,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPO | DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1559  	NPCM8XX_PINCFG(227,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1560  	NPCM8XX_PINCFG(228,	spixcs1, MFSEL4, 28,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1561  	NPCM8XX_PINCFG(229,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1562  	NPCM8XX_PINCFG(230,	spix, MFSEL4, 27,	fm2, MFSEL6, 18,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(8, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1563  	NPCM8XX_PINCFG(231,	clkreq, MFSEL4, 9,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		DSTR(4, 12) | SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1564  	NPCM8XX_PINCFG(233,	spi1cs1, MFSEL5, 0,	fm1, MFSEL6, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEWLPC), /* slewlpc ? */
acf4884a571709 Tomer Maimon 2023-08-28  1565  	NPCM8XX_PINCFG(234,	pwm10, MFSEL6, 13,	smb20, MFSEL5, 28,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		0),
acf4884a571709 Tomer Maimon 2023-08-28  1566  	NPCM8XX_PINCFG(235,	pwm11, MFSEL6, 14,	smb20, MFSEL5, 28,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1567  	NPCM8XX_PINCFG(240,	i3c0, MFSEL5, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1568  	NPCM8XX_PINCFG(241,	i3c0, MFSEL5, 17,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1569  	NPCM8XX_PINCFG(242,	i3c1, MFSEL5, 19,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1570  	NPCM8XX_PINCFG(243,	i3c1, MFSEL5, 19,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1571  	NPCM8XX_PINCFG(244,	i3c2, MFSEL5, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1572  	NPCM8XX_PINCFG(245,	i3c2, MFSEL5, 21,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1573  	NPCM8XX_PINCFG(246,	i3c3, MFSEL5, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1574  	NPCM8XX_PINCFG(247,	i3c3, MFSEL5, 23,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1575  	NPCM8XX_PINCFG(251,	jm2, MFSEL5, 1,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		SLEW),
acf4884a571709 Tomer Maimon 2023-08-28  1576  	NPCM8XX_PINCFG(253,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI), /* SDHC1 power */
acf4884a571709 Tomer Maimon 2023-08-28  1577  	NPCM8XX_PINCFG(254,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI), /* SDHC2 power */
acf4884a571709 Tomer Maimon 2023-08-28  1578  	NPCM8XX_PINCFG(255,	none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		none, NONE, 0,		GPI), /* DACOSEL */
acf4884a571709 Tomer Maimon 2023-08-28  1579  };
acf4884a571709 Tomer Maimon 2023-08-28  1580  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
