Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793960796;
	b=Of6zyGZOziWtRmv61kTYKKFNONUs5JU/iRHhY+wrzvw+spkmgQIZolRaP+Pa1oBFdjK+
	 xGtFXmuDVZrii0AKfq2tjd7YWOQIywp2yVv21ABcV49mFXghL8QsRnNBeOB+fVThOliod
	 RKbG6wfGJ+5kMa56hgtQbCMBhMYsuMhn4F7SqX/xmja4Mdd+fsMucpY8kH7AmLpyxEQZP
	 WyapKD5GbJmvO+FGcjrfpOVSTmvjmJOvKhz/LwGjUBq3cIIS9cYq/Q3Ttgc0dHoupV1nf
	 U4D64vjDIUuaG1WBZRk4mWrIA67PbPdvWrGspUNehrCDY5Jjdrn9QN4A7h/j5qAmctg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793960796;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Vf9GgqOj7wPVyYKxQKMGA8McwoNMs8lYb4PPECrFCPQ=;
	b=p8YAOAYqPD6mxsTrVb23e+zRn49ZQKClwlizTotCpxRaIkphV0gfD0jervpNd800LxC2
	 2+kh4eM7l3gZsTbng7Mr/CQKolQeFGOef774Wx9Dhcdi/IbS1+PlaauWLtF9auZP2e3e3
	 FqglnCb6M7hOzGFJxh14776AZGxTYI3zPn8De/fHFAqSp5bZK9AU6OYPM+bKOqYDZWpOQ
	 UMAWM7jnLY6vc3lUj5YJc+MRWw61IoUe0fq6otqtB/cPQrr1hL3sSS4uQiYlIkr0hrM4p
	 jCaBR4vPfas9IJhHn0q7eT8H4uB/VKQFLSTYWVgU4jXg9zM1uvfFUj5jxsvs3n36kyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ED+8rlqz;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA61606A33D
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 10:26:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DA61606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ED+8rlqz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793960794; x=1825496794;
  h=date:from:to:cc:subject:message-id;
  bh=QdDIP+2Kohn4mw0HYElpOa3YZXC4ixIMhZ78yqi6sAs=;
  b=ED+8rlqz3xpBURwIZcEoMiP4lAzayzauwnvh2tFc5d+OsLcM7jXfpu5K
   aUCUYrXxwm4m252wOMRPDwYE+ZINy/hcp05ZP2KnFiqdjChpZ9+f+Pobm
   7dki5AqWZN/ffNvIJmU4EsL57BFbxSpTHMCv8VdJ54ZQKK0S28n9iOOax
   pdJ2y+Isv0MetOWfbT4r6v63H1ZfRnCezEXP/F2wdD4jpj7GIDjTWNeDT
   S8//nBbHSv8i7pBownZbiPaJR+lFPBsesIZjtyLoYOoc+cFucyK/ed35Q
   4mjz5snCYhRV6my2+B+JcbYrGQNnrJqnGyiOd7x6TQlf/WhnXyq0Rom6R
   g==;
X-CSE-ConnectionGUID: V7Dr2rmYSy+sbZ/RO8xtqQ==
X-CSE-MsgGUID: XSp35gKTSZmsRlk3pFKteg==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2810433"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2810433"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 02:26:33 -0800
X-CSE-ConnectionGUID: ba6Q0InTSxybaX8rhUrKuA==
X-CSE-MsgGUID: CRB14o9ETLajn3ti7fnHQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7235449"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 06 Nov 2026 02:26:32 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPH9R-00000000ACp-2y2f;
	Fri, 06 Nov 2026 10:26:29 +0000
Date: Fri, 06 Nov 2026 11:25:54 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:1155:3-9:
 opportunity for str_enable_disable(enable)
Message-ID: <202611061144.zzDnRwsy-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Changhuang Liang <changhuang.liang@starfivetech.com>
CC: Linus Walleij <linusw@kernel.org>
CC: Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
CC: Alex Soo <yuklin.soo@starfivetech.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f66469d9905b39d2c260a15d7d6db450f4db67c1
commit: 9c4d0c8fc4c10eaecc651ecd3d2aa706f06a6637 pinctrl: starfive: Add StarFive JHB100 sys0 controller driver
date:   5 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 5 weeks ago
config: loongarch-randconfig-r2105-20261104 (https://download.01.org/0day-ci/archive/20261106/202611061144.zzDnRwsy-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project e2e3d6c39cfebec9eace23629a5a103df2c79ba6)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 9c4d0c8fc4c1 ("pinctrl: starfive: Add StarFive JHB100 sys0 controller driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202611061144.zzDnRwsy-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c:1155:3-9: opportunity for str_enable_disable(enable)

vim +1155 drivers/pinctrl/starfive/pinctrl-starfive-jhb100.c

9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1142  
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1143  static int jhb100_irq_set_wake(struct irq_data *d, unsigned int enable)
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1144  {
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1145  	struct gpio_chip *gc = irq_data_get_irq_chip_data(d);
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1146  	struct jhb100_pinctrl *sfp = gpiochip_get_data(gc);
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1147  	int ret;
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1148  
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1149  	if (enable)
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1150  		ret = enable_irq_wake(sfp->irq);
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1151  	else
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1152  		ret = disable_irq_wake(sfp->irq);
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1153  	if (ret)
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1154  		dev_err(sfp->dev, "failed to %s wake-up interrupt\n",
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10 @1155  			enable ? "enable" : "disable");
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1156  
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1157  	return ret;
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1158  }
9c4d0c8fc4c10ea Changhuang Liang 2026-09-10  1159  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
