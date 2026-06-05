Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC0F3254B8
	for <oe-kbuild@lists.linux.dev>; Fri,  5 Jun 2026 17:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780681082; cv=none; b=L5DCdWdepQQXBagSGZkTzH4TQ7eUZ8Jp61SBaIxB9buBVT7g1yK6gdAV4sy/+e/5GU2d3tk4XFZN1MTqShDiE0aY9hRv7ENY4bAW0JqaLra0x2CSHy4/JOgDrt2+SILhd8qeSKZiOwbeZ4tbHikOVNicsTSvzdf3jWgU4S3DBJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780681082; c=relaxed/simple;
	bh=uJP7T9grpBPFyVyIIntcj9aVWeKGVDsMO5sWuSUtiRk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=KD/vG3h9oRinwdwGMp0//F2iANd6uLQMXAUq+LvMe81UZVruRsgnJVSgZODLq2sNzdU48gw8Wm5H/o5EZ/IpeP2eehJ+hXLBAHUbWr3VZatcgqwZxkZsVZhXSkiuy1KByGQeVqe5ooaGnaMQtLQbYyK82syRgndeziTHRB0vhcY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4U3/XMq; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4U3/XMq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780681079; x=1812217079;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uJP7T9grpBPFyVyIIntcj9aVWeKGVDsMO5sWuSUtiRk=;
  b=U4U3/XMqIG+gZt6nHf4ns8kADeuOcElZ1nYq/8dBD7l4EfEYQ2Wmdeg3
   N6S3JGfqZ/3/bK1RUYgOvHYkz5T9fvBlaAvFe7qKosQaqzAEYfgvbhsSf
   MKDRrcgN1kL3pluzXd1/4oO4PdIy2gYwON+n4fyIKFLP8KveXxSrop5wj
   iMm7WHxxO1bYatkyiEptl7ymMmkU6sm1ldTTtm9cRQduzZrOpK+fhHPNG
   jff+0zthRtoDUvrXQJ/Fm/DzWIG3YnxumfyUEnGGouqwj1qgakhOAhDsH
   XjjBSCdojepfHMdKOTQTLAgs714vDt8dxy2hEZpjUV4YgBkOd56zhc1Qw
   w==;
X-CSE-ConnectionGUID: hLK9pp0wT6e3M8jasHnAFg==
X-CSE-MsgGUID: PhCtj6yeT+WV3xSi6e+Czw==
X-IronPort-AV: E=McAfee;i="6800,10657,11808"; a="81266221"
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="81266221"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jun 2026 10:37:59 -0700
X-CSE-ConnectionGUID: VXRdFPJbQ+ebwEvX6J6hdg==
X-CSE-MsgGUID: yZiq0izvTqG8PsLeMyJrEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,189,1774335600"; 
   d="scan'208";a="268833737"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Jun 2026 10:37:57 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVYUU-00000000GJO-2j20;
	Fri, 05 Jun 2026 17:37:54 +0000
Date: Sat, 06 Jun 2026 01:37:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/power/supply/max77759_charger.c:533:8-33: WARNING:
 Threaded IRQ with no primary handler requested without IRQF_ONESHOT (unless
 it is nested IRQ)
Message-ID: <202606060122.MH7UDsNR-lkp@intel.com>
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
head:   ddd664bbff63e09e7a7f9acae9c43605d4cf185f
commit: 70d7dd27f6dc9bada652c3a84ba7e6688a96f8db power: supply: max77759: a=
dd charger driver
date:   10 weeks ago
:::::: branch date: 20 hours ago
:::::: commit date: 10 weeks ago
config: mips-randconfig-r063-20260604 (https://download.01.org/0day-ci/arch=
ive/20260606/202606060122.MH7UDsNR-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project e5a=
b4f8a1f766febdc65ce89c00dec85393cfd68)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 70d7dd27f6dc ("power: supply: max77759: add charger driver")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202606060122.MH7UDsNR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/power/supply/max77759_charger.c:533:8-33: WARNING: Threaded IRQ =
with no primary handler requested without IRQF_ONESHOT (unless it is nested=
 IRQ)

vim +533 drivers/power/supply/max77759_charger.c

70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  504 =20
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  505  static int max77759_init=
_irqhandler(struct max77759_charger *chg)
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  506  {
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  507  	struct device *dev =3D =
chg->dev;
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  508  	irq_handler_t thread_fn;
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  509  	char *name;
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  510  	int i, ret;
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  511 =20
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  512  	for (i =3D 0; i < ARRAY=
_SIZE(chgr_irqs_str); i++) {
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  513  		ret =3D platform_get_i=
rq_byname(to_platform_device(dev),
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  514  					      chgr_irqs_str=
[i]);
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  515  		if (ret < 0)
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  516  			return dev_err_probe(=
dev, ret,
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  517  					     "Failed to get=
 irq resource for %s\n",
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  518  					     chgr_irqs_str[=
i]);
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  519 =20
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  520  		chg->irqs[i] =3D ret;
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  521  		name =3D devm_kasprint=
f(dev, GFP_KERNEL, "%s:%s", dev_name(dev),
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  522  				      chgr_irqs_str[=
i]);
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  523  		if (!name)
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  524  			return dev_err_probe(=
dev, -ENOMEM,
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  525  					     "Failed to all=
ocate space for irqname: %s\n",
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  526  					     chgr_irqs_str[=
i]);
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  527 =20
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  528  		if (i =3D=3D BAT_OILO)
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  529  			thread_fn =3D bat_oil=
o_irq_handler;
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  530  		else
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  531  			thread_fn =3D irq_han=
dler;
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  532 =20
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25 @533  		ret =3D devm_request_t=
hreaded_irq(dev, chg->irqs[i], NULL,
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  534  						thread_fn, 0, name=
, chg);
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  535  		if (ret)
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  536  			return dev_err_probe(=
dev, ret,
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  537  					     "Unable to reg=
ister irq handler for %s\n",
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  538  					     chgr_irqs_str[=
i]);
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  539  	}
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  540 =20
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  541  	return 0;
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  542  }
70d7dd27f6dc9ba Amit Sunil Dhamne 2026-03-25  543 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
