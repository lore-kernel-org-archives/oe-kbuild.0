Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32BA73ACA7A
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jul 2026 06:34:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784702057; cv=none; b=n0kwz9pz3RT90aQg+l4ajuzAbEwabWHfolRGbrn/mhIzDVqHXUeJEtPL6qThNhEmF0lG3TIxFnFTzk2x5+Y8K0560Tc08G3mqykhCiZtInLAD2pLmTpzyEjEdbo8HYC3Zsz0udIz9NPNc2yrG9REZzleTOtuVI4BRQ8eXAcBEGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784702057; c=relaxed/simple;
	bh=dn49DpW+q/2tIK5uUDs1yXMX4vQXsfweYhXlLPkv6kg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=uSvmvizUwOGh18cC2wTWazsp2LgJcow/FavpQ95gFVBeyHlxGYDi1Hq0B+FXKzza/MroECpi/6XAp+aXrRD4Qz4zd8nuWctDLEmWfvuO+gP8OBLgYPqOJ5K+eRR8aoCatjI1pV7OJcOS8eE+O0/8AjInIci857dk7tY5bECs8SY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ifzNVmSY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ifzNVmSY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784702055; x=1816238055;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dn49DpW+q/2tIK5uUDs1yXMX4vQXsfweYhXlLPkv6kg=;
  b=ifzNVmSYwbF9wi7hKHOun2C8cBBwbJ9bmwZ0QlAW975RlEXXwr4Dmcgy
   CuXmYYe7kXjayYjdcGjCYh1NH1+gkIsyEyvhFZwONe+ZknN5Dmjda3KZa
   WQb3AF1ZGo/BGX1AMu4++u3ahntUdJ77/ZGvT3RJBZf5kNHscTynxMA5L
   RZCDSvHLXZHR4AOy+O5rUHHvqxyu8FKg0BmuKCyILha7Q+PC14d+QSzUB
   pVk240eiPg5BkH9uzFIlJdLrzfkoJhQwtKpdOs0zg6nd7ooEfhFhKXKHo
   ed5szAmdlZoiMcnn+nbdQ/05Bm1zvGPI6tIrsnujhYBIqulci5VtOqhnu
   g==;
X-CSE-ConnectionGUID: 0LxKW371SXiKMRQlym7nPQ==
X-CSE-MsgGUID: qpLbslLnTouY3we6stFgZQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="84451865"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="84451865"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 23:34:14 -0700
X-CSE-ConnectionGUID: Bd0/Spj4QGKJZzB55Me8yQ==
X-CSE-MsgGUID: 22mAerj0TbuQ8sckAuKP2g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="253622254"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Jul 2026 23:34:13 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmQWx-00000000YVp-0Xzj;
	Wed, 22 Jul 2026 06:34:11 +0000
Date: Wed, 22 Jul 2026 14:34:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/power/supply/max77759_charger.c:533:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202607221416.dzApaL2T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Amit Sunil Dhamne <amitsd@google.com>
CC: "Andr=C3=A9 Draszik" <andre.draszik@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   248951ddc14de84de3910f9b13f51491a8cd91df
commit: 70d7dd27f6dc9bada652c3a84ba7e6688a96f8db power: supply: max77759: a=
dd charger driver
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
config: powerpc64-randconfig-r064-20260716 (https://download.01.org/0day-ci=
/archive/20260722/202607221416.dzApaL2T-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project b3e=
6e6dabdc02153552a64fc74ff5c7532447eed)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607221416.dzApaL2T-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/power/supply/max77759_charger.c:533:8-33: WARNING: Threaded IRQ =
with no primary handler requested without IRQF_ONESHOT (unless it is nested=
 IRQ)

vim +533 drivers/power/supply/max77759_charger.c

70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  504 =20
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  505  static int max77759_init_=
irqhandler(struct max77759_charger *chg)
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  506  {
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  507  	struct device *dev =3D c=
hg->dev;
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  508  	irq_handler_t thread_fn;
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  509  	char *name;
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  510  	int i, ret;
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  511 =20
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  512  	for (i =3D 0; i < ARRAY_=
SIZE(chgr_irqs_str); i++) {
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  513  		ret =3D platform_get_ir=
q_byname(to_platform_device(dev),
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  514  					      chgr_irqs_str[=
i]);
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  515  		if (ret < 0)
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  516  			return dev_err_probe(d=
ev, ret,
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  517  					     "Failed to get =
irq resource for %s\n",
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  518  					     chgr_irqs_str[i=
]);
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  519 =20
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  520  		chg->irqs[i] =3D ret;
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  521  		name =3D devm_kasprintf=
(dev, GFP_KERNEL, "%s:%s", dev_name(dev),
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  522  				      chgr_irqs_str[i=
]);
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  523  		if (!name)
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  524  			return dev_err_probe(d=
ev, -ENOMEM,
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  525  					     "Failed to allo=
cate space for irqname: %s\n",
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  526  					     chgr_irqs_str[i=
]);
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  527 =20
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  528  		if (i =3D=3D BAT_OILO)
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  529  			thread_fn =3D bat_oilo=
_irq_handler;
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  530  		else
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  531  			thread_fn =3D irq_hand=
ler;
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  532 =20
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25 @533  		ret =3D devm_request_th=
readed_irq(dev, chg->irqs[i], NULL,
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  534  						thread_fn, 0, name,=
 chg);
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  535  		if (ret)
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  536  			return dev_err_probe(d=
ev, ret,
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  537  					     "Unable to regi=
ster irq handler for %s\n",
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  538  					     chgr_irqs_str[i=
]);
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  539  	}
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  540 =20
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  541  	return 0;
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  542  }
70d7dd27f6dc9b Amit Sunil Dhamne 2026-03-25  543 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
