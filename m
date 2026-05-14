Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11C13A9D9F
	for <oe-kbuild@lists.linux.dev>; Thu, 14 May 2026 13:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778763775; cv=none; b=lyTxgun8amHL08jinwxA7v1t0p3eqaLoM84R09m/1V04+QoNR2ScBFJEpPv0T2zyXvNc8HrXRBcF7jJZIIGNgggssN1Su2/mGAOHB7NsX1ZIEIXxZrDqR93Y+qeF3o1KIH2kZyChHmBkPtuT8Xz1dSozdADQdkdc1puw3TCyqG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778763775; c=relaxed/simple;
	bh=82/Yrd10RQsCrHmQUoaD3ZgkSmN/nzlHXDsUdPJq0f8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DDvkMDOoU5wpPgNRII9NsqsTOZTVI/wLoYItoA4IMG97IHJ+T2piMMrHekhu5k3GECnpNj23AkFCFx+AOG9/9/IySJ7PdAnyc7fM2UllI0H9eq1isZ6Cw+ViggqNpvtpQAePtjrcp2AJ5sehLwsEdLieLeb9WnQHQDSYETZoR7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVbczeS2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVbczeS2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778763772; x=1810299772;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=82/Yrd10RQsCrHmQUoaD3ZgkSmN/nzlHXDsUdPJq0f8=;
  b=KVbczeS2Z7FBtd3E7vuftYDToXUnL52WEHifkJm9xCiN4uGvxpSjsaN5
   LO8450jzYY+pvBk/LrUv1aXxRUroZ8p7vR/XNPCNncVWlpMEXhoj/AmYf
   aSe0HMGQDWAXHj6IIIXU0CLPOuunAtP/AQvv3aCZRpRbGTTEPpIU9ZK5Q
   Qtga8Fd9/TpYLP03Jg0UQTiW2w34DwPPJDusYbA4TVScQuRwj/1giG3N7
   TfmWZ9IyTuY84ZvH2C6J8ZgXtAZDY/hNfeyUfb9tCk1YAsPTsIzrVOnVw
   TyiQgGlp/Zd0EnFUR3ESXIdz+yZvNs8xd0ecA1jTtn574AJ6hTkAWlNid
   w==;
X-CSE-ConnectionGUID: FRSgLUJ4SzaBSkLnkk02dQ==
X-CSE-MsgGUID: B6OD6/xrS/+9KbYfPw2NRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11785"; a="79563904"
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="79563904"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2026 06:02:47 -0700
X-CSE-ConnectionGUID: FwVkmSemSqmunH5kSIAosQ==
X-CSE-MsgGUID: 4yNR0YseQPCcntAc1RvGyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,234,1770624000"; 
   d="scan'208";a="237396684"
Received: from lkp-server01.sh.intel.com (HELO dca79079c3eb) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 May 2026 06:02:46 -0700
Received: from kbuild by dca79079c3eb with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wNVi7-000000006ZZ-0YbO;
	Thu, 14 May 2026 13:02:43 +0000
Date: Thu, 14 May 2026 21:02:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/pwm/pwm-atmel-tcb.c:490 atmel_tcb_pwm_probe() warn:
 'tcbpwmc->clk' from clk_prepare_enable() not released on lines: 490.
Message-ID: <202605142013.jjGU7bQe-lkp@intel.com>
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
TO: Sangyun Kim <sangyun.kim@snu.ac.kr>
CC: "Uwe Kleine-K=C3=B6nig" <ukleinek@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e1914add2799225a87502051415fc5c32aeb02ae
commit: 68637b68afcc3cb4d56aca14a3a1d1b47b879369 pwm: atmel-tcb: Cache cloc=
k rates and mark chip as atomic
date:   3 weeks ago
:::::: branch date: 18 hours ago
:::::: commit date: 3 weeks ago
config: xtensa-randconfig-r073-20260514 (https://download.01.org/0day-ci/ar=
chive/20260514/202605142013.jjGU7bQe-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 68637b68afcc ("pwm: atmel-tcb: Cache clock rates and mark chip as =
atomic")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605142013.jjGU7bQe-lkp@intel.com/

smatch warnings:
drivers/pwm/pwm-atmel-tcb.c:490 atmel_tcb_pwm_probe() warn: 'tcbpwmc->clk' =
from clk_prepare_enable() not released on lines: 490.

vim +490 drivers/pwm/pwm-atmel-tcb.c

061f8572a31c0d Alexandre Belloni 2020-10-30  382 =20
9421bade0765d8 Boris BREZILLON   2013-01-08  383  static int atmel_tcb_pwm_=
probe(struct platform_device *pdev)
9421bade0765d8 Boris BREZILLON   2013-01-08  384  {
dfab73eb282969 Uwe Kleine-K=C3=B6nig  2024-02-14  385  	struct pwm_chip *ch=
ip;
061f8572a31c0d Alexandre Belloni 2020-10-30  386  	const struct of_device_i=
d *match;
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  387  	struct atmel_tcb_pw=
m_chip *tcbpwmc;
061f8572a31c0d Alexandre Belloni 2020-10-30  388  	const struct atmel_tcb_c=
onfig *config;
9421bade0765d8 Boris BREZILLON   2013-01-08  389  	struct device_node *np =
=3D pdev->dev.of_node;
061f8572a31c0d Alexandre Belloni 2020-10-30  390  	char clk_name[] =3D "t0_=
clk";
9421bade0765d8 Boris BREZILLON   2013-01-08  391  	int err;
061f8572a31c0d Alexandre Belloni 2020-10-30  392  	int channel;
9421bade0765d8 Boris BREZILLON   2013-01-08  393 =20
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  394  	chip =3D devm_pwmch=
ip_alloc(&pdev->dev, NPWM, sizeof(*tcbpwmc));
af184748c6807e Uwe Kleine-K=C3=B6nig  2024-02-14  395  	if (IS_ERR(chip))
af184748c6807e Uwe Kleine-K=C3=B6nig  2024-02-14  396  		return PTR_ERR(chi=
p);
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  397  	tcbpwmc =3D to_tcb_=
chip(chip);
0323e8fedd1ef2 Uwe Kleine-K=C3=B6nig  2023-07-19  398 =20
061f8572a31c0d Alexandre Belloni 2020-10-30  399  	err =3D of_property_read=
_u32(np, "reg", &channel);
9421bade0765d8 Boris BREZILLON   2013-01-08  400  	if (err < 0) {
9421bade0765d8 Boris BREZILLON   2013-01-08  401  		dev_err(&pdev->dev,
061f8572a31c0d Alexandre Belloni 2020-10-30  402  			"failed to get Timer C=
ounter Block channel from device tree (error: %d)\n",
9421bade0765d8 Boris BREZILLON   2013-01-08  403  			err);
9421bade0765d8 Boris BREZILLON   2013-01-08  404  		return err;
9421bade0765d8 Boris BREZILLON   2013-01-08  405  	}
9421bade0765d8 Boris BREZILLON   2013-01-08  406 =20
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  407  	tcbpwmc->regmap =3D =
syscon_node_to_regmap(np->parent);
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  408  	if (IS_ERR(tcbpwmc-=
>regmap))
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  409  		return PTR_ERR(tcb=
pwmc->regmap);
061f8572a31c0d Alexandre Belloni 2020-10-30  410 =20
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  411  	tcbpwmc->slow_clk =
=3D of_clk_get_by_name(np->parent, "slow_clk");
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  412  	if (IS_ERR(tcbpwmc-=
>slow_clk))
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  413  		return PTR_ERR(tcb=
pwmc->slow_clk);
061f8572a31c0d Alexandre Belloni 2020-10-30  414 =20
061f8572a31c0d Alexandre Belloni 2020-10-30  415  	clk_name[1] +=3D channel;
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  416  	tcbpwmc->clk =3D of=
_clk_get_by_name(np->parent, clk_name);
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  417  	if (IS_ERR(tcbpwmc-=
>clk))
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  418  		tcbpwmc->clk =3D o=
f_clk_get_by_name(np->parent, "t0_clk");
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  419  	if (IS_ERR(tcbpwmc-=
>clk)) {
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  420  		err =3D PTR_ERR(tc=
bpwmc->clk);
c11622324c0234 Uwe Kleine-K=C3=B6nig  2023-07-19  421  		goto err_slow_clk;
c11622324c0234 Uwe Kleine-K=C3=B6nig  2023-07-19  422  	}
061f8572a31c0d Alexandre Belloni 2020-10-30  423 =20
061f8572a31c0d Alexandre Belloni 2020-10-30  424  	match =3D of_match_node(=
atmel_tcb_of_match, np->parent);
061f8572a31c0d Alexandre Belloni 2020-10-30  425  	config =3D match->data;
9421bade0765d8 Boris BREZILLON   2013-01-08  426 =20
34cbcd72588f40 Alexandre Belloni 2020-10-30  427  	if (config->has_gclk) {
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  428  		tcbpwmc->gclk =3D =
of_clk_get_by_name(np->parent, "gclk");
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  429  		if (IS_ERR(tcbpwmc=
->gclk)) {
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  430  			err =3D PTR_ERR(t=
cbpwmc->gclk);
c11622324c0234 Uwe Kleine-K=C3=B6nig  2023-07-19  431  			goto err_clk;
c11622324c0234 Uwe Kleine-K=C3=B6nig  2023-07-19  432  		}
9421bade0765d8 Boris BREZILLON   2013-01-08  433  	}
9421bade0765d8 Boris BREZILLON   2013-01-08  434 =20
dfab73eb282969 Uwe Kleine-K=C3=B6nig  2024-02-14  435  	chip->ops =3D &atme=
l_tcb_pwm_ops;
68637b68afcc3c Sangyun Kim       2026-04-19  436  	chip->atomic =3D true;
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  437  	tcbpwmc->channel =
=3D channel;
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  438  	tcbpwmc->width =3D =
config->counter_width;
9421bade0765d8 Boris BREZILLON   2013-01-08  439 =20
68637b68afcc3c Sangyun Kim       2026-04-19  440  	err =3D clk_prepare_enab=
le(tcbpwmc->clk);
7d8d05d11473a1 Boris Brezillon   2015-08-16  441  	if (err)
c11622324c0234 Uwe Kleine-K=C3=B6nig  2023-07-19  442  		goto err_gclk;
7d8d05d11473a1 Boris Brezillon   2015-08-16  443 =20
68637b68afcc3c Sangyun Kim       2026-04-19  444  	err =3D clk_prepare_enab=
le(tcbpwmc->slow_clk);
68637b68afcc3c Sangyun Kim       2026-04-19  445  	if (err)
68637b68afcc3c Sangyun Kim       2026-04-19  446  		goto err_disable_clk;;
68637b68afcc3c Sangyun Kim       2026-04-19  447 =20
68637b68afcc3c Sangyun Kim       2026-04-19  448  	err =3D clk_rate_exclusi=
ve_get(tcbpwmc->clk);
68637b68afcc3c Sangyun Kim       2026-04-19  449  	if (err)
68637b68afcc3c Sangyun Kim       2026-04-19  450  		goto err_disable_slow_c=
lk;
68637b68afcc3c Sangyun Kim       2026-04-19  451 =20
68637b68afcc3c Sangyun Kim       2026-04-19  452  	err =3D clk_rate_exclusi=
ve_get(tcbpwmc->slow_clk);
68637b68afcc3c Sangyun Kim       2026-04-19  453  	if (err)
68637b68afcc3c Sangyun Kim       2026-04-19  454  		goto err_clk_unlock;
68637b68afcc3c Sangyun Kim       2026-04-19  455 =20
68637b68afcc3c Sangyun Kim       2026-04-19  456  	tcbpwmc->rate =3D clk_ge=
t_rate(tcbpwmc->clk);
68637b68afcc3c Sangyun Kim       2026-04-19  457  	tcbpwmc->slow_rate =3D c=
lk_get_rate(tcbpwmc->slow_clk);
68637b68afcc3c Sangyun Kim       2026-04-19  458 =20
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  459  	spin_lock_init(&tcb=
pwmc->lock);
9421bade0765d8 Boris BREZILLON   2013-01-08  460 =20
dfab73eb282969 Uwe Kleine-K=C3=B6nig  2024-02-14  461  	err =3D pwmchip_add=
(chip);
7d8d05d11473a1 Boris Brezillon   2015-08-16  462  	if (err < 0)
68637b68afcc3c Sangyun Kim       2026-04-19  463  		goto err_slow_clk_unloc=
k;
9421bade0765d8 Boris BREZILLON   2013-01-08  464 =20
dfab73eb282969 Uwe Kleine-K=C3=B6nig  2024-02-14  465  	platform_set_drvdat=
a(pdev, chip);
9421bade0765d8 Boris BREZILLON   2013-01-08  466 =20
9421bade0765d8 Boris BREZILLON   2013-01-08  467  	return 0;
7d8d05d11473a1 Boris Brezillon   2015-08-16  468 =20
68637b68afcc3c Sangyun Kim       2026-04-19  469  err_slow_clk_unlock:
68637b68afcc3c Sangyun Kim       2026-04-19  470  	clk_rate_exclusive_put(t=
cbpwmc->slow_clk);
68637b68afcc3c Sangyun Kim       2026-04-19  471 =20
68637b68afcc3c Sangyun Kim       2026-04-19  472  err_clk_unlock:
68637b68afcc3c Sangyun Kim       2026-04-19  473  	clk_rate_exclusive_put(t=
cbpwmc->clk);
68637b68afcc3c Sangyun Kim       2026-04-19  474 =20
7d8d05d11473a1 Boris Brezillon   2015-08-16  475  err_disable_clk:
68637b68afcc3c Sangyun Kim       2026-04-19  476  	clk_disable_unprepare(tc=
bpwmc->clk);
68637b68afcc3c Sangyun Kim       2026-04-19  477 =20
68637b68afcc3c Sangyun Kim       2026-04-19  478  err_disable_slow_clk:
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  479  	clk_disable_unprepa=
re(tcbpwmc->slow_clk);
7d8d05d11473a1 Boris Brezillon   2015-08-16  480 =20
c11622324c0234 Uwe Kleine-K=C3=B6nig  2023-07-19  481  err_gclk:
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  482  	clk_put(tcbpwmc->gc=
lk);
c11622324c0234 Uwe Kleine-K=C3=B6nig  2023-07-19  483 =20
c11622324c0234 Uwe Kleine-K=C3=B6nig  2023-07-19  484  err_clk:
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  485  	clk_put(tcbpwmc->cl=
k);
c11622324c0234 Uwe Kleine-K=C3=B6nig  2023-07-19  486 =20
061f8572a31c0d Alexandre Belloni 2020-10-30  487  err_slow_clk:
c9a787b9456066 Uwe Kleine-K=C3=B6nig  2024-07-09  488  	clk_put(tcbpwmc->sl=
ow_clk);
7d8d05d11473a1 Boris Brezillon   2015-08-16  489 =20
7d8d05d11473a1 Boris Brezillon   2015-08-16 @490  	return err;
9421bade0765d8 Boris BREZILLON   2013-01-08  491  }
9421bade0765d8 Boris BREZILLON   2013-01-08  492 =20

:::::: The code at line 490 was first introduced by commit
:::::: 7d8d05d11473a169ab4d53bc7fc23d1fe3f1959f misc: atmel_tclib: get and =
use slow clock

:::::: TO: Boris Brezillon <boris.brezillon@free-electrons.com>
:::::: CC: Alexandre Belloni <alexandre.belloni@free-electrons.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
