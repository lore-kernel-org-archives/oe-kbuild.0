Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE2D336BCC0;
	Wed, 18 Mar 2026 10:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831402; cv=none; b=n5aAEljjMOA5xwC7ddlGjs5lHiAWhuqoWaMsFAqUjIZRgQ77d3K9CrT1VU7Tb28BCBdysuUZcvmIQBlH7ENA2xMZxLR07RvVcfwgMTMvLKBFl0OixQpaAOyUb8dqfUkbh7wlpJKBNHSr4/tkCqIjU93n/1IMnikbsicBh6/W1Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831402; c=relaxed/simple;
	bh=fuGPbNBs/iezo0GU1y6z93R2S+IyvynXoaWv/JgNrN4=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r08U4ki8cJeJr0EdyX2nsRo5uUrEPjeQWc2na1+zqDXROlFIzYCsnGhYhvfT+7Wg0qjDzwSg3ag5gHCZGOCcOk7is/40jot7DtR1pQcHg9Gw3kgFqgGxYMLDxewM93gsLT6S54itPLWwD70nDSsl5kgV/SC7hy93BOgMPdXw6Aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BNSnWYzD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BNSnWYzD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3C56C19421;
	Wed, 18 Mar 2026 10:56:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773831402;
	bh=fuGPbNBs/iezo0GU1y6z93R2S+IyvynXoaWv/JgNrN4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=BNSnWYzDfwRwGAWzgFBm3ZHKsrcM9lThd4m9YijHJzN49HQmkdqfZhdVjI7HcDy22
	 1OPb8n8zds3Ef0W/pCefa86AbX+PR6DfJJNHOVArMvZZXsarJuj+01Dt5awzb2gO26
	 6ZTCS9wg9IOETDppDWLz5VIqkLfV+PTYUJ33a0tU15YerYGRIaVj4BiHhu2EJq+p8N
	 ybwDt6tIAw2NT4gjYK8YJ8JOLXMNaLPSDklTl27o5wWCY9cxzChsioOldnX3hLRWxc
	 Pe1O5m0PrWGdD0s4kJllkdxxGNXkzX82amNbt4zDnV8BxvhkOBJ0MuRrNWPjUieyD0
	 /GMkOB56YsJBA==
Message-ID: <03d95fada335610f65f8590e02e1ff724e854b68.camel@kernel.org>
Subject: Re: [jlayton:exportd-netlink 3/18] net/sunrpc/cache.c:1074
 cache_release() error: dereferencing freed memory 'rq' (line 1070)
From: Jeff Layton <jlayton@kernel.org>
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev, 
 Chuck Lever <chuck.lever@oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Date: Wed, 18 Mar 2026 06:56:39 -0400
In-Reply-To: <202603180258.r8Bt94T2-lkp@intel.com>
References: <202603180258.r8Bt94T2-lkp@intel.com>
Autocrypt: addr=jlayton@kernel.org; prefer-encrypt=mutual;
 keydata=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
 QZIQXVeAA+smfTT0tDrisj1U5x6ZB9b3nBg65kc=
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Wed, 2026-03-18 at 10:42 +0300, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git=
 exportd-netlink
> head:   4599c5d95d86c6bc932897f19b1f5a573e7c4637
> commit: e344b49528c8ef457ee714bb65e2da4c121132c2 [3/18] Merge branch 'mrc=
huck/nfsd-testing'
> config: x86_64-randconfig-161-20260317 (https://download.01.org/0day-ci/a=
rchive/20260318/202603180258.r8Bt94T2-lkp@intel.com/config)
> compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0=
227cb60147a26a1eeb4fb06e3b505e9c7261)
> rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> smatch: v0.5.0-9004-gb810ac53
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202603180258.r8Bt94T2-lkp@intel.com/
>=20
> smatch warnings:
> net/sunrpc/cache.c:1074 cache_release() error: dereferencing freed memory=
 'rq' (line 1070)
>=20
> vim +/rq +1074 net/sunrpc/cache.c
>=20
> 173912a6add00f Trond Myklebust  2009-08-09  1040  static int cache_releas=
e(struct inode *inode, struct file *filp,
> 173912a6add00f Trond Myklebust  2009-08-09  1041  			 struct cache_detail=
 *cd)
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1042  {
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1043  	struct cache_reader *r=
p =3D filp->private_data;
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1044 =20
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1045  	if (rp) {
> 17ad31b3a43b72 Jeff Layton      2026-02-23  1046  		struct cache_request =
*rq =3D NULL;
> 17ad31b3a43b72 Jeff Layton      2026-02-23  1047 =20
> b00567a1495f66 Jeff Layton      2026-02-23  1048  		spin_lock(&cd->queue_=
lock);
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1049  		if (rp->offset) {
> 812936f74067e6 Jeff Layton      2026-02-23  1050  			struct cache_request=
 *cr;
> 812936f74067e6 Jeff Layton      2026-02-23  1051 =20
> 812936f74067e6 Jeff Layton      2026-02-23  1052  			cr =3D cache_next_re=
quest(cd, rp->next_seqno);
> 812936f74067e6 Jeff Layton      2026-02-23  1053  			if (cr) {
> 17ad31b3a43b72 Jeff Layton      2026-02-23  1054  				cr->readers--;
> 17ad31b3a43b72 Jeff Layton      2026-02-23  1055  				if (cr->readers =3D=
=3D 0 &&
> 17ad31b3a43b72 Jeff Layton      2026-02-23  1056  				    !test_bit(CACHE=
_PENDING,
> 17ad31b3a43b72 Jeff Layton      2026-02-23  1057  					      &cr->item->f=
lags)) {
> 812936f74067e6 Jeff Layton      2026-02-23  1058  					list_del(&cr->list=
);
> 17ad31b3a43b72 Jeff Layton      2026-02-23  1059  					rq =3D cr;
> 17ad31b3a43b72 Jeff Layton      2026-02-23  1060  				}
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1061  			}
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1062  			rp->offset =3D 0;
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1063  		}
> 812936f74067e6 Jeff Layton      2026-02-23  1064  		list_del(&rp->list);
> b00567a1495f66 Jeff Layton      2026-02-23  1065  		spin_unlock(&cd->queu=
e_lock);
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1066 =20
> 0b88d5fcde160d Jeff Layton      2026-02-23  1067  		if (rq) {
> 0b88d5fcde160d Jeff Layton      2026-02-23  1068  			cache_put(rq->item, =
cd);
> 0b88d5fcde160d Jeff Layton      2026-02-23  1069  			kfree(rq->buf);
> 0b88d5fcde160d Jeff Layton      2026-02-23 @1070  			kfree(rq);
>                                                                         ^=
^^^^^^^^
>=20
> 0b88d5fcde160d Jeff Layton      2026-02-23  1071  		}
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1072 =20
> 17ad31b3a43b72 Jeff Layton      2026-02-23  1073  		if (rq) {
> 17ad31b3a43b72 Jeff Layton      2026-02-23 @1074  			cache_put(rq->item, =
cd);
> 17ad31b3a43b72 Jeff Layton      2026-02-23  1075  			kfree(rq->buf);
> 17ad31b3a43b72 Jeff Layton      2026-02-23  1076  			kfree(rq);
>                                                                         ^=
^^^^^^^^
>=20
> 17ad31b3a43b72 Jeff Layton      2026-02-23  1077  		}
>=20
> Looks like a bad merge.
>=20

Thanks Dan,

Yes it does. I based this series on top of Linus' master, and then
merged in Chuck's nfsd-fixes, nfsd-next and nfsd-testing branches
before layering these patches on top.

It looks like the problem occurred when the nfsd-next branch was
merged. Both it and -fixes have the same patch.

I'll rebase the series on top of a sane merge later today.

> 17ad31b3a43b72 Jeff Layton      2026-02-23  1078 =20
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1079  		filp->private_data =
=3D NULL;
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1080  		kfree(rp);
> 64a38e840ce594 Dave Wysochanski 2019-07-26  1081  	}
> 64a38e840ce594 Dave Wysochanski 2019-07-26  1082  	if (filp->f_mode & FMO=
DE_WRITE) {
> 64a38e840ce594 Dave Wysochanski 2019-07-26  1083  		atomic_dec(&cd->write=
rs);
> c5b29f885afe89 NeilBrown        2010-08-12  1084  		cd->last_close =3D se=
conds_since_boot();
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1085  	}
> f7e86ab92f2198 Trond Myklebust  2009-08-19  1086  	module_put(cd->owner);
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1087  	return 0;
> ^1da177e4c3f41 Linus Torvalds   2005-04-16  1088  }

--=20
Jeff Layton <jlayton@kernel.org>
