Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD3F3A48E6
	for <oe-kbuild@lists.linux.dev>; Fri, 10 Jul 2026 20:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783715380; cv=none; b=mHD17+mPOodow9NoFENldDHs182HZVrR3koFn52S6e5e3d/HOFSYP4tL0eFIF2uWQVJduevv7tB3L/yyzVcdhZxAxNd5kDc8m8yVrgXIK13Cw3Wggzuh+Qfvp9ugPTzlM8QfCrsTk933zhY3ZTqBye+IBmETSL1zEbcJSQ6BD8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783715380; c=relaxed/simple;
	bh=I7BLtDnhXeFEXvdoJPkDoRCTZbJGABmUUS/DZQSoRnI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DyEGWZpzbyr0txwCG9BZ4Xe0qyE2g4p6iiAuPACeD2kreP4JIJYmJStUsZgD+v6fx+LCnJP7HRa9ELiB7TGHorUA/6z9fgyhhoH7dGc27DlJKkMMc1cIEy54k9XRO8CkLaHboT2qPy2CoKlRBb8gkw+/AqqYxq5uXldym8g+mP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQ/Y4sO1; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQ/Y4sO1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783715379; x=1815251379;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=I7BLtDnhXeFEXvdoJPkDoRCTZbJGABmUUS/DZQSoRnI=;
  b=HQ/Y4sO1CTNmGgib996zJUqFtfsVKqVj47f/bmaL/DABUkA13cPosZay
   RJT+UKojqZk8x6Ds7503+R30VbcSVt3liYtx+pf+IzZVb0K1RWPcDT+vd
   6fDoRqNim9N9u8iKgUrIASJqT2t0UIXSPeesDIlg7WcytcIgxxUm7fTFO
   DShMjeo6xQ+Kam2IleVakNv/x9lVW4nc2EDs0G8TyZF6YXWa47ET6Kg9s
   +QXRyTTOM8sRYTklIdPv5Mf/JAAgt2L3ALTuj+PsDyZvmHP49PFEDbSm7
   Sy3GeE6DTz/Qqi4k9N1DlmHtKDFDst8Kh73jTHMl1ZV4YH+o6kU6r65ox
   w==;
X-CSE-ConnectionGUID: BcM0U7HCSVmMo1IJ+aYPsA==
X-CSE-MsgGUID: ICgNncLaQCW55fiitX3WJA==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="109964383"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="109964383"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2026 13:29:38 -0700
X-CSE-ConnectionGUID: TrdC67cUTiCSZSIMm6s3CA==
X-CSE-MsgGUID: YQyUtSd6R1mXagMH8AA7vA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="255069698"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 10 Jul 2026 13:29:36 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wiHq9-00000000JKX-0kYj;
	Fri, 10 Jul 2026 20:29:25 +0000
Date: Sat, 11 Jul 2026 04:28:18 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/dma-buf/st-dma-fence.c:415:10-35: opportunity for
 str_yes_no(dma_fence_is_signaled ( f2 ))
Message-ID: <202607110457.9o8XHhP0-lkp@intel.com>
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
TO: Jason Gunthorpe <jgg@nvidia.com>
CC: "Christian K=C3=B6nig" <christian.koenig@amd.com>

Hi Jason,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   a635d6748234582ea287c5ffeae28b9b23f91c7e
commit: 9baa35a3993999764965e70be949984891572d2d dma-buf: Change st-dma-fen=
ce.c to use kunit
date:   3 months ago
:::::: branch date: 21 hours ago
:::::: commit date: 3 months ago
config: sparc-randconfig-r063-20260708 (https://download.01.org/0day-ci/arc=
hive/20260711/202607110457.9o8XHhP0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 9baa35a39939 ("dma-buf: Change st-dma-fence.c to use kunit")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202607110457.9o8XHhP0-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/dma-buf/st-dma-fence.c:415:10-35: opportunity for str_yes_no(dma=
_fence_is_signaled ( f2 ))

vim +415 drivers/dma-buf/st-dma-fence.c

2989f6451084aed Chris Wilson 2019-08-19  364 =20
2989f6451084aed Chris Wilson 2019-08-19  365  static int thread_signal_call=
back(void *arg)
2989f6451084aed Chris Wilson 2019-08-19  366  {
2989f6451084aed Chris Wilson 2019-08-19  367  	const struct race_thread *t =
=3D arg;
2989f6451084aed Chris Wilson 2019-08-19  368  	unsigned long pass =3D 0;
2989f6451084aed Chris Wilson 2019-08-19  369  	unsigned long miss =3D 0;
2989f6451084aed Chris Wilson 2019-08-19  370  	int err =3D 0;
2989f6451084aed Chris Wilson 2019-08-19  371 =20
2989f6451084aed Chris Wilson 2019-08-19  372  	while (!err && !kthread_shou=
ld_stop()) {
2989f6451084aed Chris Wilson 2019-08-19  373  		struct dma_fence *f1, *f2;
2989f6451084aed Chris Wilson 2019-08-19  374  		struct simple_cb cb;
2989f6451084aed Chris Wilson 2019-08-19  375 =20
2989f6451084aed Chris Wilson 2019-08-19  376  		f1 =3D mock_fence();
2989f6451084aed Chris Wilson 2019-08-19  377  		if (!f1) {
2989f6451084aed Chris Wilson 2019-08-19  378  			err =3D -ENOMEM;
2989f6451084aed Chris Wilson 2019-08-19  379  			break;
2989f6451084aed Chris Wilson 2019-08-19  380  		}
2989f6451084aed Chris Wilson 2019-08-19  381 =20
d62c43a953ce02d Arvind Yadav 2022-09-14  382  		dma_fence_enable_sw_signali=
ng(f1);
d62c43a953ce02d Arvind Yadav 2022-09-14  383 =20
2989f6451084aed Chris Wilson 2019-08-19  384  		rcu_assign_pointer(t->fence=
s[t->id], f1);
2989f6451084aed Chris Wilson 2019-08-19  385  		smp_wmb();
2989f6451084aed Chris Wilson 2019-08-19  386 =20
2989f6451084aed Chris Wilson 2019-08-19  387  		rcu_read_lock();
2989f6451084aed Chris Wilson 2019-08-19  388  		do {
2989f6451084aed Chris Wilson 2019-08-19  389  			f2 =3D dma_fence_get_rcu_s=
afe(&t->fences[!t->id]);
2989f6451084aed Chris Wilson 2019-08-19  390  		} while (!f2 && !kthread_sh=
ould_stop());
2989f6451084aed Chris Wilson 2019-08-19  391  		rcu_read_unlock();
2989f6451084aed Chris Wilson 2019-08-19  392 =20
2989f6451084aed Chris Wilson 2019-08-19  393  		if (t->before)
2989f6451084aed Chris Wilson 2019-08-19  394  			dma_fence_signal(f1);
2989f6451084aed Chris Wilson 2019-08-19  395 =20
2989f6451084aed Chris Wilson 2019-08-19  396  		smp_store_mb(cb.seen, false=
);
46d4a938fe6ddd6 Joe Perches  2020-08-24  397  		if (!f2 ||
46d4a938fe6ddd6 Joe Perches  2020-08-24  398  		    dma_fence_add_callback(=
f2, &cb.cb, simple_callback)) {
46d4a938fe6ddd6 Joe Perches  2020-08-24  399  			miss++;
46d4a938fe6ddd6 Joe Perches  2020-08-24  400  			cb.seen =3D true;
46d4a938fe6ddd6 Joe Perches  2020-08-24  401  		}
2989f6451084aed Chris Wilson 2019-08-19  402 =20
2989f6451084aed Chris Wilson 2019-08-19  403  		if (!t->before)
2989f6451084aed Chris Wilson 2019-08-19  404  			dma_fence_signal(f1);
2989f6451084aed Chris Wilson 2019-08-19  405 =20
2989f6451084aed Chris Wilson 2019-08-19  406  		if (!cb.seen) {
2989f6451084aed Chris Wilson 2019-08-19  407  			dma_fence_wait(f2, false);
2989f6451084aed Chris Wilson 2019-08-19  408  			__wait_for_callbacks(f2);
2989f6451084aed Chris Wilson 2019-08-19  409  		}
2989f6451084aed Chris Wilson 2019-08-19  410 =20
2989f6451084aed Chris Wilson 2019-08-19  411  		if (!READ_ONCE(cb.seen)) {
2989f6451084aed Chris Wilson 2019-08-19  412  			pr_err("Callback not seen =
on thread %d, pass %lu (%lu misses), signaling %s add_callback; fence signa=
led? %s\n",
2989f6451084aed Chris Wilson 2019-08-19  413  			       t->id, pass, miss,
2989f6451084aed Chris Wilson 2019-08-19  414  			       t->before ? "before=
" : "after",
2989f6451084aed Chris Wilson 2019-08-19 @415  			       dma_fence_is_signal=
ed(f2) ? "yes" : "no");
2989f6451084aed Chris Wilson 2019-08-19  416  			err =3D -EINVAL;
2989f6451084aed Chris Wilson 2019-08-19  417  		}
2989f6451084aed Chris Wilson 2019-08-19  418 =20
2989f6451084aed Chris Wilson 2019-08-19  419  		dma_fence_put(f2);
2989f6451084aed Chris Wilson 2019-08-19  420 =20
2989f6451084aed Chris Wilson 2019-08-19  421  		rcu_assign_pointer(t->fence=
s[t->id], NULL);
2989f6451084aed Chris Wilson 2019-08-19  422  		smp_wmb();
2989f6451084aed Chris Wilson 2019-08-19  423 =20
2989f6451084aed Chris Wilson 2019-08-19  424  		dma_fence_put(f1);
2989f6451084aed Chris Wilson 2019-08-19  425 =20
2989f6451084aed Chris Wilson 2019-08-19  426  		pass++;
2989f6451084aed Chris Wilson 2019-08-19  427  	}
2989f6451084aed Chris Wilson 2019-08-19  428 =20
2989f6451084aed Chris Wilson 2019-08-19  429  	pr_info("%s[%d] completed %l=
u passes, %lu misses\n",
2989f6451084aed Chris Wilson 2019-08-19  430  		__func__, t->id, pass, miss=
);
2989f6451084aed Chris Wilson 2019-08-19  431  	return err;
2989f6451084aed Chris Wilson 2019-08-19  432  }
2989f6451084aed Chris Wilson 2019-08-19  433 =20

:::::: The code at line 415 was first introduced by commit
:::::: 2989f6451084aed3f8cc9992477f7a9bf57a3716 dma-buf: Add selftests for =
dma-fence

:::::: TO: Chris Wilson <chris@chris-wilson.co.uk>
:::::: CC: Chris Wilson <chris@chris-wilson.co.uk>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
