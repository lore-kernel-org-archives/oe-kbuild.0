Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D1CB3D3D10
	for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 07:51:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787125896; cv=none; b=ElFcw4te7DOWydzjlR8ezZGLwiMAaXlfwh0CphrlHatniEgHvCo/PrcEFFSal79lSqAzXRJXc3RLNMEY8t9Fulc9WDn+m8QvjkYL7ZNt+Br0duLWD8Avy+oixE3Yz5T0WXIXwpI/dM3sYkL+myzjcr1sIa38p0Ak5f1UhBnhN7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787125896; c=relaxed/simple;
	bh=e8iwClkpZnd3mXJ7GRBLeMdKWJP1a9HmL4w18PheKqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=POm0wMPal8sPIEGIsegaS33H2DKDL9LhMge4tnlPrJVESVpho6PWd2g/dgEbZYUdHM/Qf6aTJYGTPlv6yD3MbGJ+TWYyNud/sMb64ziWAAsrOgHGJPTXzPDm2/hdS5RilJ8DaNTv7M3TO4tHiQ6AcYQQslgd5oVVWAzKXVY6/OI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gP9S+1Ui; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gP9S+1Ui"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49954b88fffso6892095e9.0
        for <oe-kbuild@lists.linux.dev>; Wed, 19 Aug 2026 00:51:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787125893; x=1787730693; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h0OL1eyMqGNNeUM/7ZpI8tHxAqO4ynK4mb4a9+x1xqU=;
        b=gP9S+1UiwflzdoFcOjbM2giKxOc/yVv61b8AGB+tP/Z28yAoarF1XsbW6I0trmd2va
         /5uhzFr+yTeuoBFjhAHHez83mIwFdUoA60zapdfKmKYT3J0wQpJ7ZLFu4nuE8yuSGUAs
         oMN3WAv1tRPP8n68I+pC7wB2tPiCyc0b71w+E8lT89ICLa/Rl9Qhlq6qigr/IMKOqriD
         tYG2LIEMASdGb0Nl2ROVjK762IEGC7j7czOUh30iMo9TbXILktmtqwxSZTo94sphszem
         qPApo6pzC8REE3YTA4zD4HaqC/fwCzhnaV8sr6Uz506hTVe5hzyNuHbZEMWd/gdrcedq
         1mmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787125894; x=1787730694;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h0OL1eyMqGNNeUM/7ZpI8tHxAqO4ynK4mb4a9+x1xqU=;
        b=eAfghOO7I9Pg7e7q6qqVdN0yUcGNT6L3sJ/+959AXCy8g6gwVZ4x4VY66nFwYsyykF
         fmX5coS7qBLGYE0l5+qNZ+likp/qD27MbzPzuNSXPFAsUCYLExKjDK8Vnnj6AA4gqEy/
         h7tLov3Cbrd1DnPcpkympLloSSkyT+gIyd1vQlmfqTYoN6foK7y+gfwsoDiwmx2N017Z
         WquIw+2ik7L1aemoPfwJiAdENBuaEqk72JCMk6K9brz3dHq6V/sRMGIip6iI54yjTWak
         T7qSZiy4Lrpsd0aq4OMyteQBViAIWmi2NnvO7SiLZAdw1RZI9QJYdUS03CBbzxPImnB6
         yfNA==
X-Gm-Message-State: AOJu0Yy3gtWh/TWso1S2r0g9ZWoMDeuZr4qGG3/m+vWU+GgXj8R6r6e1
	XIeOErmpKKmdfJzfuZv9Sszq52qPx44fx/lAt55cefGjdSrPrY9amAZfAxOXJIpN66lYAyU2
X-Gm-Gg: AR+sD13h7tUIIxRtjCq08YlQGfetnF8ZXT2i+7XBGhQSagfeHEHN0AwOPWZ6anNRMjL
	ONpB7DA0DAaXpibHO/hG2HVXP8EBbgNajUofkDnIQGznDYnz7IypZhTmYF0Wq8JYoSDhHZ0RURs
	y7qMiXKqYSxuhN+fnYnljIPZVf+3lSpjDsc6HIB+9DjkP9YRKUZJOkVIsrYO4+/9+nKlgVoYiKo
	QH0vXX/EE0okQkryl6PZgKf/FapjUf9BZVF9tMCUYWA/NWXE29sofe7tgbXTk3SY6Orap5L0+0m
	IYBi4tCJwI97Lgmn5GXIHGf8VcJWm6EuCd/naemviKCzptuVKSBoX0ynehfDzwDpsuAJfO3Eckw
	ujKWuVxF12xfgImjPBiMV3wqcv6p6f4ErdHWWp873kTeraKIEHT5tCqUojKqClmzSwuk5gAW4EW
	Bkp/7COnwopAQR5hJQiqNmA34luYjh2katGc5gT5NGCArzZlxobA3yspNW
X-Received: by 2002:a05:600c:3b8e:b0:495:7888:281c with SMTP id 5b1f17b1804b1-499aa0dcd47mr47215425e9.0.1787125893534;
        Wed, 19 Aug 2026 00:51:33 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9e8b700sm43571775e9.6.2026.08.19.00.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 00:51:32 -0700 (PDT)
Date: Wed, 19 Aug 2026 10:51:29 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 32/32] fs/fuse/file.c:959
 fuse_readpages_end() warn: variable dereferenced before check 'mapping' (see
 line 944)
Message-ID: <aoVggdpskUJwC5gk@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   5c36f73a41f1533cae407eba882ca2940e1775f1
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [32/32] ANDROID: fuse-bpf: fuse-bpf v1.3
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260819/202608190010.lNezCZVt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608190010.lNezCZVt-lkp@intel.com/

smatch warnings:
fs/fuse/file.c:959 fuse_readpages_end() warn: variable dereferenced before check 'mapping' (see line 944)

vim +/mapping +959 fs/fuse/file.c

fcee216beb9c15c Max Reitz        2020-05-06  931  static void fuse_readpages_end(struct fuse_mount *fm, struct fuse_args *args,
134831e36bbdd6c Miklos Szeredi   2019-09-10  932  			       int err)
db50b96c0f28a21 Miklos Szeredi   2005-09-09  933  {
c1aa96a52e9594f Miklos Szeredi   2006-01-16  934  	int i;
134831e36bbdd6c Miklos Szeredi   2019-09-10  935  	struct fuse_io_args *ia = container_of(args, typeof(*ia), ap.args);
134831e36bbdd6c Miklos Szeredi   2019-09-10  936  	struct fuse_args_pages *ap = &ia->ap;
134831e36bbdd6c Miklos Szeredi   2019-09-10  937  	size_t count = ia->read.in.size;
134831e36bbdd6c Miklos Szeredi   2019-09-10  938  	size_t num_read = args->out_args[0].size;
02d47e213dce6e2 Joanne Koong     2025-08-29  939  	struct address_space *mapping;
02d47e213dce6e2 Joanne Koong     2025-08-29  940  	struct inode *inode;
ce534fb052928ce Miklos Szeredi   2010-05-25  941  
02d47e213dce6e2 Joanne Koong     2025-08-29  942  	WARN_ON_ONCE(!ap->num_folios);
02d47e213dce6e2 Joanne Koong     2025-08-29  943  	mapping = ap->folios[0]->mapping;
02d47e213dce6e2 Joanne Koong     2025-08-29 @944  	inode = mapping->host;
                                                                ^^^^^^^^^^^^^
Dereferenced

c1aa96a52e9594f Miklos Szeredi   2006-01-16  945  
5c5c5e51b26413d Miklos Szeredi   2008-04-30  946  	/*
5c5c5e51b26413d Miklos Szeredi   2008-04-30  947  	 * Short read means EOF. If file size is larger, truncate it
5c5c5e51b26413d Miklos Szeredi   2008-04-30  948  	 */
134831e36bbdd6c Miklos Szeredi   2019-09-10  949  	if (!err && num_read < count)
134831e36bbdd6c Miklos Szeredi   2019-09-10  950  		fuse_short_read(inode, ia->read.attr_ver, num_read, ap);
5c5c5e51b26413d Miklos Szeredi   2008-04-30  951  
451418fc928b5ec Andrew Gallagher 2013-11-05  952  	fuse_invalidate_atime(inode);
c1aa96a52e9594f Miklos Szeredi   2006-01-16  953  
0c67c37e1710b2a Joanne Koong     2025-02-11  954  	for (i = 0; i < ap->num_folios; i++) {
51b025301824f16 Joanne Koong     2024-10-24  955  		folio_end_read(ap->folios[i], !err);
0c67c37e1710b2a Joanne Koong     2025-02-11  956  		folio_put(ap->folios[i]);
0c67c37e1710b2a Joanne Koong     2025-02-11  957  	}
134831e36bbdd6c Miklos Szeredi   2019-09-10  958  	if (ia->ff)
be926e6761d28d1 Paul Lawrence    2021-12-02 @959  		fuse_file_put(mapping ? mapping->host : NULL, ia->ff, false);
                                                                              ^^^^^^^
Checked too late.

134831e36bbdd6c Miklos Szeredi   2019-09-10  960  
134831e36bbdd6c Miklos Szeredi   2019-09-10  961  	fuse_io_free(ia);
c1aa96a52e9594f Miklos Szeredi   2006-01-16  962  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

