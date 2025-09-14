Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399661E7C2E;
	Sun, 14 Sep 2025 01:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.153
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757812006; cv=none; b=bjfoTshswfL0dRR61cHFhSwAEFFEi12dvI+owXY1naNAOmpYednpY9zUTdJBP8ODos9NP+3+SdwjCqIHl1urEgvudupbQ0So+En0w3nhCTLOg6+XW64vsJCf1TLJjewtG5XOPlJYdOgA1OsJqi1zG8IrfInkRhsi0hggLd0iBEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757812006; c=relaxed/simple;
	bh=TVqHWo3i6jLYJTTLpGVWzcbJpoMxfxiibDk65RrhFqI=;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:In-reply-to:
	 References:Date:Message-id; b=d2GOeU59rVexHd/upU/l3mojW4bPk47jJlgRXnSNDdiuPuLlhpy6uB39mn9zrcmNpYzTMCHJTfWUvN0mhieWALvXQfd285zZ6W/So8XjYFdKqsDggnlYine2mxpEMa28gTfUTfyItwE4xBjTNzwerhViUslrxmE6/Lw8xmMQTU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net; spf=pass smtp.mailfrom=ownmail.net; dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b=VYNhWWJm; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=fAlYu2Yl; arc=none smtp.client-ip=103.168.172.153
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ownmail.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ownmail.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b="VYNhWWJm";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="fAlYu2Yl"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 6B5731400051;
	Sat, 13 Sep 2025 21:06:43 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Sat, 13 Sep 2025 21:06:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to; s=fm1; t=
	1757812003; x=1757898403; bh=rSfY6gl0j29zFaD+vjhTSb1E1G02TWmHvd4
	jnDpkRNU=; b=VYNhWWJmLWh8teTUHf/o9IscNeX2ki+HOJCsbeJklPhNGuyiNZr
	criTj6Fs9IxfIuDxdPG1G9s2cxYVS/26/Xz8zxPR5tZcNohMnkNIWNHHKXz18GHa
	4Yn7jEOsHmxZYBYnsIYL/WduFQTaWmQw2Oqkc6iyWI416C+jgsUmpUd6mXWP6G9B
	NPZkxgMvK8wfsVSBYSKHs/nd3EkRmRcaf9G50Hkc5z8l3zpTVIlQcDYaseH4k3S9
	0YMOpqasremVLPeIZpOzAop7tnnYV5YLm4vFQgFIYYqLLMku84tBkWEuxAQCfNKs
	WEsoRT9t+w0r+absmtAIvKqbgxHF8LcIG+w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1757812003; x=
	1757898403; bh=rSfY6gl0j29zFaD+vjhTSb1E1G02TWmHvd4jnDpkRNU=; b=f
	AlYu2YlnT5Sqm+aHjedMfxuzLxagT8aVPhxOsyvINhXFgdJ5OuLhpAb5nYFIxXhU
	5aZKBqG8HrYVsf26zdmFt0zahfg6HB8o51J4f1Wq6eAnOcLR2MqLn0remCcupXLv
	jdvx5St9xsUEK1Zxp3eaJhs1Wy4Jmp1T2ZLl8jGi94L/CG9ynUBiTb+Heqcxc98V
	6qtxkU/4+QzkLaZAqKa+R4ozdSYluzfzGtkCDSI0USl6IX7F8NTjmx2XFFOsqazz
	WlaymxpLnjNTYT+jecV764sbWzUooSFaweF9U5/K3c7X5JEu2HNUOtBmnxHTCuGj
	u6Sp7uA5WKMa2FaWmj4Ig==
X-ME-Sender: <xms:IxXGaHoKT4Qgx4Pfucfld_hBlGpmZOtNs5o2g9VYjEP54dniug041g>
    <xme:IxXGaCbh_jMVKegYPYsz19QF3j_-3u3hsEG1Snxj4XTuWW5RisT3opiMTqUUWmeKM
    7cUxomfivQ-hA>
X-ME-Received: <xmr:IxXGaAUgBjQsHJNUbyvqvQauCZWeVnkS-zDobJjavAoUrU1YaKNj_Xb3dtRgtMXY2kdNPhkiM6j-rehjuuCxBzG75TTi-7kX6P_LK3fgLcQ7>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeffeeghecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpegtgfgghffvvefujghffffkrhesthhqredttddtjeenucfhrhhomheppfgvihhluehr
    ohifnhcuoehnvghilhgssehofihnmhgrihhlrdhnvghtqeenucggtffrrghtthgvrhhnpe
    ejffevgeegjedvudelieeigfffiefgkeelvddvheevvddvteffveduveduudefgfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgpddtuddrohhrghdpghhithhhuhgsrdgtohhmne
    cuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepnhgvihhl
    sgesohifnhhmrghilhdrnhgvthdpnhgspghrtghpthhtohepiedpmhhouggvpehsmhhtph
    houhhtpdhrtghpthhtoheptghhuhgtkhdrlhgvvhgvrhesohhrrggtlhgvrdgtohhmpdhr
    tghpthhtohepohgvqdhksghuihhlugeslhhishhtshdrlhhinhhugidruggvvhdprhgtph
    htthhopehovgdqkhgsuhhilhguqdgrlhhlsehlihhsthhsrdhlihhnuhigrdguvghvpdhr
    tghpthhtohepuggrnhdrtggrrhhpvghnthgvrheslhhinhgrrhhordhorhhgpdhrtghpth
    htohepjhhlrgihthhonheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhkphesihhn
    thgvlhdrtghomh
X-ME-Proxy: <xmx:IxXGaL-WBJBE2MyHU0kD-VugMZF2LaWFyTVE8mzruw3oc78UjK6tJQ>
    <xmx:IxXGaJ_NRQqOendUij1emnfliw7rluzRListnDVHneVEFkhgQUftLQ>
    <xmx:IxXGaLRCTXK_9wxZzMWVeDPWMUv6-59ZhDw-scB3enHckwNGNJehVA>
    <xmx:IxXGaNeMcjnu7gdN7VAt8nWTjfNZnMZVlViAmE3SfQMpEO1IgrCFMA>
    <xmx:IxXGaEKCe2B5eUC0QwtZVL_kkwC0KG6p5YLTLwJ3CIN8Hs77g3HoqksS>
Feedback-ID: iab3e480c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 13 Sep 2025 21:06:41 -0400 (EDT)
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: NeilBrown <neilb@ownmail.net>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev,
 "Chuck Lever" <chuck.lever@oracle.com>, "Jeff Layton" <jlayton@kernel.org>
Subject: Re: [cel:nfsd-testing 45/50] fs/nfsd/nfs4recover.c:406 purge_old()
 error: uninitialized symbol 'child'.
In-reply-to: <202509131751.4STnDcZg-lkp@intel.com>
References: <202509131751.4STnDcZg-lkp@intel.com>
Date: Sun, 14 Sep 2025 11:06:39 +1000
Message-id: <175781199938.1696783.3669146136396360246@noble.neil.brown.name>
Reply-To: NeilBrown <neil@brown.name>

On Sat, 13 Sep 2025, Dan Carpenter wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux nfsd-test=
ing
> head:   454e99ac23dc63c1472eb5df8f97c961c0f178c9
> commit: 30424fb94b7bea14e27922669924948d6320e991 [45/50] nfsd: move name lo=
okup out of nfsd4_list_rec_dir()
> config: sparc64-randconfig-r072-20250913 (https://download.01.org/0day-ci/a=
rchive/20250913/202509131751.4STnDcZg-lkp@intel.com/config)
> compiler: sparc64-linux-gcc (GCC) 15.1.0
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202509131751.4STnDcZg-lkp@intel.com/
>=20
> smatch warnings:
> fs/nfsd/nfs4recover.c:406 purge_old() error: uninitialized symbol 'child'.
>=20
> vim +/child +406 fs/nfsd/nfs4recover.c
>=20
> c7b9a45927e74c8 NeilBrown         2005-06-23  398  static int
> 30424fb94b7bea1 NeilBrown         2025-09-08  399  purge_old(struct dentry =
*parent, char *cname, struct nfsd_net *nn)
> c7b9a45927e74c8 NeilBrown         2005-06-23  400  {
> c7b9a45927e74c8 NeilBrown         2005-06-23  401  	int status;
> 30424fb94b7bea1 NeilBrown         2025-09-08  402  	struct dentry *child;
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  403  	struct xdr_netobj name;
> c7b9a45927e74c8 NeilBrown         2005-06-23  404 =20
> 30424fb94b7bea1 NeilBrown         2025-09-08  405  	if (strlen(cname) !=3D =
HEXDIR_LEN - 1) {
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26 @406  		printk("%s: illegal na=
me %pd in recovery directory\n",
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  407  				__func__, child);
>                                                                            =
               ^^^^^
> s/child/cname/

Also s/%pd/%s/

Chuck: do you want to just edit the patch, or should I recend?

Thanks Dan.

NeilBrown


>=20
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  408  		/* Keep trying; maybe =
the others are OK: */
> b37ad28bcaa7c48 Al Viro           2006-10-19  409  		return 0;
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  410  	}
> 30424fb94b7bea1 NeilBrown         2025-09-08  411  	name.data =3D kstrdup(c=
name, GFP_KERNEL);
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  412  	if (!name.data) {
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  413  		dprintk("%s: failed to=
 allocate memory for name.data!\n",
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  414  			__func__);
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  415  		goto out;
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  416  	}
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  417  	name.len =3D HEXDIR_LEN;
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  418  	if (nfs4_has_reclaimed_=
state(name, nn))
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  419  		goto out_free;
> c7b9a45927e74c8 NeilBrown         2005-06-23  420 =20
> 30424fb94b7bea1 NeilBrown         2025-09-08  421  	inode_lock_nested(d_ino=
de(parent), I_MUTEX_PARENT);
> 30424fb94b7bea1 NeilBrown         2025-09-08  422  	child =3D lookup_one(&n=
op_mnt_idmap, &QSTR(cname), parent);
> 30424fb94b7bea1 NeilBrown         2025-09-08  423  	if (!IS_ERR(child)) {
> abf08576afe3150 Christian Brauner 2023-01-13  424  		status =3D vfs_rmdir(&=
nop_mnt_idmap, d_inode(parent), child);
> c7b9a45927e74c8 NeilBrown         2005-06-23  425  		if (status)
> a6a9f18f0a9f943 Al Viro           2013-09-16  426  			printk("failed to rem=
ove client recovery directory %pd\n",
> a6a9f18f0a9f943 Al Viro           2013-09-16  427  			       child);
> 30424fb94b7bea1 NeilBrown         2025-09-08  428  		dput(child);
> 30424fb94b7bea1 NeilBrown         2025-09-08  429  	}
> 30424fb94b7bea1 NeilBrown         2025-09-08  430  	inode_unlock(d_inode(pa=
rent));
> 30424fb94b7bea1 NeilBrown         2025-09-08  431 =20
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  432  out_free:
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  433  	kfree(name.data);
> 6b1891052a3f8e3 Scott Mayhew      2019-03-26  434  out:
> c7b9a45927e74c8 NeilBrown         2005-06-23  435  	/* Keep trying, success=
 or failure: */
> b37ad28bcaa7c48 Al Viro           2006-10-19  436  	return 0;
> c7b9a45927e74c8 NeilBrown         2005-06-23  437  }
>=20
> --=20
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>=20
>=20

