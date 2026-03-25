Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F6830594E
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Mar 2026 19:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774465829; cv=none; b=oZ26qTqwlbEd3UC8YWnf/r2c+s6BHF0ilrw/NhRR3k0um/yanoiWIbQdT9PWZKzmxCLrjwIo/D+ye+nVq5ZA33nY8ZZ1hEMRWRtwuqnS/QiW7xfLFCrAShPg2O9i22oaUack3sBR1ZH1RX/GdRYLhsNXVOebED2Bvk2S9NFe85w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774465829; c=relaxed/simple;
	bh=EATSbWYU3ghJycPTAETnlAO+p+8kewAfdr956kT9waY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=VMCcySWm/bhLmOTt6P7i8+k7yhDDJyJ6NLmRtBhi1g/N/9rny2zy6eqkHoGlJPW4PRU46KVGWyehQuWNNVLbmmuY2VZkvPKKsD+E0l9GLdEUJIKPNteUG9ymsntPxpw7g6A6dMR8dLiXQuwQUWMHjKZE5ZqoP1JSPgYfyp4pRv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eehkOJ2+; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eehkOJ2+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774465828; x=1806001828;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=EATSbWYU3ghJycPTAETnlAO+p+8kewAfdr956kT9waY=;
  b=eehkOJ2+0KTglu42r2pmA1d6MvPbVm/Va8O5Q+QfSE2v8kM6F/UHDq7+
   xnRzroLz/F5lKCCzH+0BmWUCzbWgj1ETUCGN69Ao/ktsC/vKg0kXRY/Rb
   BnRzB+Ea+wLxFlJn8y3y5YB97AkvE69PzrydYttk+H25IX0OY7z8in804
   2xCKMlA4ee42IHaNY1AKzfe7TXl8CQ3oJ9Xfwac9mN458fvERV5TojabR
   xEimVBA1PaueZuBkphC46DfZ1p72i8+8JKeZO7/T+IeF0/5exNHZAxkEQ
   TSVk3mfMX5RLKQydKVEavI1PJyTdyPhxKfcUskcHa2AaTwWFBN7g89jFL
   A==;
X-CSE-ConnectionGUID: 1Rsd59btQSSvrL5wDKIq9A==
X-CSE-MsgGUID: RFAeKmEJRgK14oiJYPK7Ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75399642"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="75399642"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 12:10:27 -0700
X-CSE-ConnectionGUID: jcf9hcgURqml5Ay5MT7ZcA==
X-CSE-MsgGUID: +4sy0fQFQs6eWDzpZrpk0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="229548291"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 25 Mar 2026 12:10:25 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5TcV-000000007YB-2VAm;
	Wed, 25 Mar 2026 19:10:23 +0000
Date: Thu, 26 Mar 2026 03:09:54 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/v3d/v3d_irq.c:288 v3d_irq_init() warn:
 missing unwind goto?
Message-ID: <202603260221.BH1bmAti-lkp@intel.com>
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
TO: "Ma=C3=ADra Canal" <mcanal@igalia.com>
CC: "Juan A. Suarez" <jasuarez@igalia.com>
CC: Iago Toral Quiroga <itoral@igalia.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bbeb83d3182abe0d245318e274e8531e5dd7a948
commit: 226862f50a7a88e4e4de9abbf36c64d19acd6fd0 drm/v3d: Disable interrupt=
s before resetting the GPU
date:   9 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 9 months ago
config: openrisc-randconfig-r071-20260325 (https://download.01.org/0day-ci/=
archive/20260326/202603260221.BH1bmAti-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603260221.BH1bmAti-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/v3d/v3d_irq.c:288 v3d_irq_init() warn: missing unwind goto?

vim +288 drivers/gpu/drm/v3d/v3d_irq.c

57692c94dcbe99 Eric Anholt        2018-04-30  259 =20
fc22771547e7e8 Eric Anholt        2019-03-08  260  int
57692c94dcbe99 Eric Anholt        2018-04-30  261  v3d_irq_init(struct v3d_=
dev *v3d)
57692c94dcbe99 Eric Anholt        2018-04-30  262  {
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  263  	int irq, ret, core;
57692c94dcbe99 Eric Anholt        2018-04-30  264 =20
57692c94dcbe99 Eric Anholt        2018-04-30  265  	INIT_WORK(&v3d->overflo=
w_mem_work, v3d_overflow_mem_work);
57692c94dcbe99 Eric Anholt        2018-04-30  266 =20
57692c94dcbe99 Eric Anholt        2018-04-30  267  	/* Clear any pending in=
terrupts someone might have left around
57692c94dcbe99 Eric Anholt        2018-04-30  268  	 * for us.
57692c94dcbe99 Eric Anholt        2018-04-30  269  	 */
57692c94dcbe99 Eric Anholt        2018-04-30  270  	for (core =3D 0; core <=
 v3d->cores; core++)
0ad5bc1ce4634c Iago Toral Quiroga 2023-10-31  271  		V3D_CORE_WRITE(core, V=
3D_CTL_INT_CLR, V3D_CORE_IRQS(v3d->ver));
0ad5bc1ce4634c Iago Toral Quiroga 2023-10-31  272  	V3D_WRITE(V3D_HUB_INT_C=
LR, V3D_HUB_IRQS(v3d->ver));
57692c94dcbe99 Eric Anholt        2018-04-30  273 =20
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  274  	irq =3D platform_g=
et_irq_optional(v3d_to_pdev(v3d), 1);
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  275  	if (irq =3D=3D -EP=
ROBE_DEFER)
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  276  		return irq;
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  277  	if (irq > 0) {
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  278  		v3d->irq[V3D_CORE=
_IRQ] =3D irq;
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  279 =20
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  280  		ret =3D devm_requ=
est_irq(v3d->drm.dev, v3d->irq[V3D_CORE_IRQ],
eea9b97b450460 Eric Anholt        2019-03-08  281  				       v3d_irq, IRQF=
_SHARED,
eea9b97b450460 Eric Anholt        2019-03-08  282  				       "v3d_core0", =
v3d);
eea9b97b450460 Eric Anholt        2019-03-08  283  		if (ret)
eea9b97b450460 Eric Anholt        2019-03-08  284  			goto fail;
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  285 =20
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  286  		irq =3D platform_=
get_irq(v3d_to_pdev(v3d), 0);
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  287  		if (irq < 0)
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28 @288  			return irq;
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  289  		v3d->irq[V3D_HUB_=
IRQ] =3D irq;
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  290 =20
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  291  		ret =3D devm_requ=
est_irq(v3d->drm.dev, v3d->irq[V3D_HUB_IRQ],
57692c94dcbe99 Eric Anholt        2018-04-30  292  				       v3d_hub_irq, =
IRQF_SHARED,
57692c94dcbe99 Eric Anholt        2018-04-30  293  				       "v3d_hub", v3=
d);
fc22771547e7e8 Eric Anholt        2019-03-08  294  		if (ret)
fc22771547e7e8 Eric Anholt        2019-03-08  295  			goto fail;
eea9b97b450460 Eric Anholt        2019-03-08  296  	} else {
eea9b97b450460 Eric Anholt        2019-03-08  297  		v3d->single_irq_line =
=3D true;
fc22771547e7e8 Eric Anholt        2019-03-08  298 =20
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  299  		irq =3D platform_=
get_irq(v3d_to_pdev(v3d), 0);
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  300  		if (irq < 0)
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  301  			return irq;
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  302  		v3d->irq[V3D_CORE=
_IRQ] =3D irq;
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  303 =20
226862f50a7a88 Ma=C3=ADra Canal        2025-06-28  304  		ret =3D devm_requ=
est_irq(v3d->drm.dev, v3d->irq[V3D_CORE_IRQ],
57692c94dcbe99 Eric Anholt        2018-04-30  305  				       v3d_irq, IRQF=
_SHARED,
eea9b97b450460 Eric Anholt        2019-03-08  306  				       "v3d", v3d);
57692c94dcbe99 Eric Anholt        2018-04-30  307  		if (ret)
fc22771547e7e8 Eric Anholt        2019-03-08  308  			goto fail;
eea9b97b450460 Eric Anholt        2019-03-08  309  	}
57692c94dcbe99 Eric Anholt        2018-04-30  310 =20
57692c94dcbe99 Eric Anholt        2018-04-30  311  	v3d_irq_enable(v3d);
fc22771547e7e8 Eric Anholt        2019-03-08  312  	return 0;
fc22771547e7e8 Eric Anholt        2019-03-08  313 =20
fc22771547e7e8 Eric Anholt        2019-03-08  314  fail:
fc22771547e7e8 Eric Anholt        2019-03-08  315  	if (ret !=3D -EPROBE_DE=
FER)
bc662528e29ae7 Simona Vetter      2020-04-15  316  		dev_err(v3d->drm.dev, =
"IRQ setup failed: %d\n", ret);
fc22771547e7e8 Eric Anholt        2019-03-08  317  	return ret;
57692c94dcbe99 Eric Anholt        2018-04-30  318  }
57692c94dcbe99 Eric Anholt        2018-04-30  319 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
