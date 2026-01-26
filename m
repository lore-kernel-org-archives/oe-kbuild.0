Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 116B572623
	for <oe-kbuild@lists.linux.dev>; Mon, 26 Jan 2026 01:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769390112; cv=none; b=EJe8M9nZ+yWAdpflxIzmfGlXKMB5ZdlNZ4W2mrhnAlv7+Y2bdPzcz8ND2eUyWg9i8Z8yxnAPxbZJyg2JmyowQWDaEe66ye1uEL/6p7M8Q2HtiNQQocBdaRfL7F93zXrHFKx3fU1CURAcyHzqjKX/qDXHZQejBb8TtWzP06rissQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769390112; c=relaxed/simple;
	bh=Fv4BgujelDI9o9Ki8H5pV8+Jd8PcIEcGO2p0ae9bwyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=qeFMUwDpXHv+ZEyDmXID26Em+oJ5euUPgunwr6CupfLbdxh67NP+SLnpzinJUyfwWKQyQw/DoBOiioACC2MhOGZqLWI+mr0mXB1XRDow5Iyfbg+wp3TK7AFbdFO8K8+Aa6Hz/56cSNIDvKpw3q9idpPcqACGjecwE4tOSd4dDA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PPIsZOhy; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PPIsZOhy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769390111; x=1800926111;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=Fv4BgujelDI9o9Ki8H5pV8+Jd8PcIEcGO2p0ae9bwyk=;
  b=PPIsZOhyIN1HezDC/GIwipuMwsOk1o1OHGIMkQb2mymFeVkjP9RGYC98
   DTzyMSQL2elFYuI2TmP/9U5f1mwlfbHVyBVakoDFQjPizIYQ/gxKrob1l
   peY5KZ9iGTwYy/7ANT2m9CQdm0UzkBtVlTTHQPHxzCQZK6YNmRwX1E7/o
   FZ+Xr1uqC56618qgfUIkB1Vd3ZwyVefq9H2Ns3xuMN0Vc9lw9LT4D/n3/
   +S1+qH1/nB2OI/AjNKvSI593KYsFn8Zuuap3FlkGquZbJUbh1y88nuL1E
   8GK4DX3KIIc19P1OlZivpU7YeNlxbvPxffCJ99hb87iBHcjQzkuYMAEsZ
   Q==;
X-CSE-ConnectionGUID: 1y0BJvghSEmrrD1h9CaPkA==
X-CSE-MsgGUID: dWPf36WRRfKGdH3fz/be2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="73156732"
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="73156732"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 17:15:10 -0800
X-CSE-ConnectionGUID: AkNWw1GmQUOVuM365ByamQ==
X-CSE-MsgGUID: DoPfw0IXQ02Wllzs/OfQHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,254,1763452800"; 
   d="scan'208";a="207913734"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jan 2026 17:15:09 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkBC7-00000000WnQ-0aSw;
	Mon, 26 Jan 2026 01:15:07 +0000
Date: Mon, 26 Jan 2026 09:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: block/blk-cgroup.c:845 blkg_conf_open_bdev_frozen() error:
 we previously assumed 'ctx->bdev' could be null (see line 832)
Message-ID: <202601260947.zRboWPyP-lkp@intel.com>
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
TO: Nilay Shroff <nilay@linux.ibm.com>
CC: Jens Axboe <axboe@kernel.dk>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   63804fed149a6750ffd28610c5c1c98cce6bd377
commit: 9730763f4756e32520cb86778331465e8d063a8f block: correct locking ord=
er for protecting blk-wbt parameters
date:   10 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 10 months ago
config: powerpc64-randconfig-r073-20260125 (https://download.01.org/0day-ci=
/archive/20260126/202601260947.zRboWPyP-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 12.5.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202601260947.zRboWPyP-lkp@intel.com/

smatch warnings:
block/blk-cgroup.c:845 blkg_conf_open_bdev_frozen() error: we previously as=
sumed 'ctx->bdev' could be null (see line 832)

vim +845 block/blk-cgroup.c

faffaab2895914 Tejun Heo         2023-04-12  767 =20
faffaab2895914 Tejun Heo         2023-04-12  768  /**
faffaab2895914 Tejun Heo         2023-04-12  769   * blkg_conf_open_bdev - =
parse and open bdev for per-blkg config update
faffaab2895914 Tejun Heo         2023-04-12  770   * @ctx: blkg_conf_ctx in=
itialized with blkg_conf_init()
015d254cb02b6d Tejun Heo         2019-08-28  771   *
faffaab2895914 Tejun Heo         2023-04-12  772   * Parse the device node =
prefix part, MAJ:MIN, of per-blkg config update from
faffaab2895914 Tejun Heo         2023-04-12  773   * @ctx->input and get an=
d store the matching bdev in @ctx->bdev. @ctx->body is
faffaab2895914 Tejun Heo         2023-04-12  774   * set to point past the =
device node prefix.
015d254cb02b6d Tejun Heo         2019-08-28  775   *
faffaab2895914 Tejun Heo         2023-04-12  776   * This function may be c=
alled multiple times on @ctx and the extra calls become
faffaab2895914 Tejun Heo         2023-04-12  777   * NOOPs. blkg_conf_prep(=
) implicitly calls this function. Use this function
faffaab2895914 Tejun Heo         2023-04-12  778   * explicitly if bdev acc=
ess is needed without resolving the blkcg / policy part
faffaab2895914 Tejun Heo         2023-04-12  779   * of @ctx->input. Return=
s -errno on error.
015d254cb02b6d Tejun Heo         2019-08-28  780   */
faffaab2895914 Tejun Heo         2023-04-12  781  int blkg_conf_open_bdev(s=
truct blkg_conf_ctx *ctx)
015d254cb02b6d Tejun Heo         2019-08-28  782  {
faffaab2895914 Tejun Heo         2023-04-12  783  	char *input =3D ctx->inp=
ut;
015d254cb02b6d Tejun Heo         2019-08-28  784  	unsigned int major, mino=
r;
22ae8ce8b89241 Christoph Hellwig 2020-11-26  785  	struct block_device *bde=
v;
22ae8ce8b89241 Christoph Hellwig 2020-11-26  786  	int key_len;
015d254cb02b6d Tejun Heo         2019-08-28  787 =20
faffaab2895914 Tejun Heo         2023-04-12  788  	if (ctx->bdev)
faffaab2895914 Tejun Heo         2023-04-12  789  		return 0;
faffaab2895914 Tejun Heo         2023-04-12  790 =20
015d254cb02b6d Tejun Heo         2019-08-28  791  	if (sscanf(input, "%u:%u=
%n", &major, &minor, &key_len) !=3D 2)
faffaab2895914 Tejun Heo         2023-04-12  792  		return -EINVAL;
015d254cb02b6d Tejun Heo         2019-08-28  793 =20
015d254cb02b6d Tejun Heo         2019-08-28  794  	input +=3D key_len;
015d254cb02b6d Tejun Heo         2019-08-28  795  	if (!isspace(*input))
faffaab2895914 Tejun Heo         2023-04-12  796  		return -EINVAL;
015d254cb02b6d Tejun Heo         2019-08-28  797  	input =3D skip_spaces(in=
put);
015d254cb02b6d Tejun Heo         2019-08-28  798 =20
22ae8ce8b89241 Christoph Hellwig 2020-11-26  799  	bdev =3D blkdev_get_no_o=
pen(MKDEV(major, minor));
22ae8ce8b89241 Christoph Hellwig 2020-11-26  800  	if (!bdev)
faffaab2895914 Tejun Heo         2023-04-12  801  		return -ENODEV;
22ae8ce8b89241 Christoph Hellwig 2020-11-26  802  	if (bdev_is_partition(bd=
ev)) {
22ae8ce8b89241 Christoph Hellwig 2020-11-26  803  		blkdev_put_no_open(bdev=
);
faffaab2895914 Tejun Heo         2023-04-12  804  		return -ENODEV;
015d254cb02b6d Tejun Heo         2019-08-28  805  	}
015d254cb02b6d Tejun Heo         2019-08-28  806 =20
a13bd91be22318 Yu Kuai           2023-04-14  807  	mutex_lock(&bdev->bd_que=
ue->rq_qos_mutex);
a13bd91be22318 Yu Kuai           2023-04-14  808  	if (!disk_live(bdev->bd_=
disk)) {
a13bd91be22318 Yu Kuai           2023-04-14  809  		blkdev_put_no_open(bdev=
);
a13bd91be22318 Yu Kuai           2023-04-14  810  		mutex_unlock(&bdev->bd_=
queue->rq_qos_mutex);
a13bd91be22318 Yu Kuai           2023-04-14  811  		return -ENODEV;
a13bd91be22318 Yu Kuai           2023-04-14  812  	}
a13bd91be22318 Yu Kuai           2023-04-14  813 =20
faffaab2895914 Tejun Heo         2023-04-12  814  	ctx->body =3D input;
faffaab2895914 Tejun Heo         2023-04-12  815  	ctx->bdev =3D bdev;
faffaab2895914 Tejun Heo         2023-04-12  816  	return 0;
015d254cb02b6d Tejun Heo         2019-08-28  817  }
9730763f4756e3 Nilay Shroff      2025-03-19  818  /*
9730763f4756e3 Nilay Shroff      2025-03-19  819   * Similar to blkg_conf_o=
pen_bdev, but additionally freezes the queue,
9730763f4756e3 Nilay Shroff      2025-03-19  820   * acquires q->elevator_l=
ock, and ensures the correct locking order
9730763f4756e3 Nilay Shroff      2025-03-19  821   * between q->elevator_lo=
ck and q->rq_qos_mutex.
9730763f4756e3 Nilay Shroff      2025-03-19  822   *
9730763f4756e3 Nilay Shroff      2025-03-19  823   * This function returns =
negative error on failure. On success it returns
9730763f4756e3 Nilay Shroff      2025-03-19  824   * memflags which must be=
 saved and later passed to blkg_conf_exit_frozen
9730763f4756e3 Nilay Shroff      2025-03-19  825   * for restoring the mema=
lloc scope.
9730763f4756e3 Nilay Shroff      2025-03-19  826   */
9730763f4756e3 Nilay Shroff      2025-03-19  827  unsigned long __must_chec=
k blkg_conf_open_bdev_frozen(struct blkg_conf_ctx *ctx)
9730763f4756e3 Nilay Shroff      2025-03-19  828  {
9730763f4756e3 Nilay Shroff      2025-03-19  829  	int ret;
9730763f4756e3 Nilay Shroff      2025-03-19  830  	unsigned long memflags;
9730763f4756e3 Nilay Shroff      2025-03-19  831 =20
9730763f4756e3 Nilay Shroff      2025-03-19 @832  	if (ctx->bdev)
9730763f4756e3 Nilay Shroff      2025-03-19  833  		return -EINVAL;
9730763f4756e3 Nilay Shroff      2025-03-19  834 =20
9730763f4756e3 Nilay Shroff      2025-03-19  835  	ret =3D blkg_conf_open_b=
dev(ctx);
9730763f4756e3 Nilay Shroff      2025-03-19  836  	if (ret < 0)
9730763f4756e3 Nilay Shroff      2025-03-19  837  		return ret;
9730763f4756e3 Nilay Shroff      2025-03-19  838  	/*
9730763f4756e3 Nilay Shroff      2025-03-19  839  	 * At this point, we hav=
en=E2=80=99t started protecting anything related to QoS,
9730763f4756e3 Nilay Shroff      2025-03-19  840  	 * so we release q->rq_q=
os_mutex here, which was first acquired in blkg_
9730763f4756e3 Nilay Shroff      2025-03-19  841  	 * conf_open_bdev. Later=
, we re-acquire q->rq_qos_mutex after freezing
9730763f4756e3 Nilay Shroff      2025-03-19  842  	 * the queue and acquiri=
ng q->elevator_lock to maintain the correct
9730763f4756e3 Nilay Shroff      2025-03-19  843  	 * locking order.
9730763f4756e3 Nilay Shroff      2025-03-19  844  	 */
9730763f4756e3 Nilay Shroff      2025-03-19 @845  	mutex_unlock(&ctx->bdev-=
>bd_queue->rq_qos_mutex);
9730763f4756e3 Nilay Shroff      2025-03-19  846 =20
9730763f4756e3 Nilay Shroff      2025-03-19  847  	memflags =3D blk_mq_free=
ze_queue(ctx->bdev->bd_queue);
9730763f4756e3 Nilay Shroff      2025-03-19  848  	mutex_lock(&ctx->bdev->b=
d_queue->elevator_lock);
9730763f4756e3 Nilay Shroff      2025-03-19  849  	mutex_lock(&ctx->bdev->b=
d_queue->rq_qos_mutex);
9730763f4756e3 Nilay Shroff      2025-03-19  850 =20
9730763f4756e3 Nilay Shroff      2025-03-19  851  	return memflags;
9730763f4756e3 Nilay Shroff      2025-03-19  852  }
015d254cb02b6d Tejun Heo         2019-08-28  853 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
