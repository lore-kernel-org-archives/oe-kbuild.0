Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935D7332906
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Apr 2026 18:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776278323; cv=none; b=UYrafU9wBYLWy16Q4Q03nP9Gi21ggtcGu9fcCucTq2bO+XRw2qjyozCs7h1sXosRdJVaxv0Slq5OhOm2d7pxWlHnuF0MTNSS/6mwARQ9lus6OEUbQh6jnue37EYtO1K2YSldNc6Q04QxemrBuZhwUKk3aAhpvydU8+ah0ni73x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776278323; c=relaxed/simple;
	bh=gyVYlhet9sXdxFVRmAAgt0gAKHzsASbyVKlPvQJJpv0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A2QkG/HH0bON1rQsGzEtqxfCAlS5IWTBY9HLR2tDkFQ6HpTKm3suV/Gt2ozQURuzY1F5Q9kCVmrWgtoYtj67wccqoNS1VVxqs0K2ZX8xGk8wHq2lwiESsBxgmjnAtaqpvcj9ZfEteQxIfOAg+O/kAKcxTb80H8yFQVCz4OroXAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+84JW7x; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+84JW7x"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso1845711f8f.2
        for <oe-kbuild@lists.linux.dev>; Wed, 15 Apr 2026 11:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776278320; x=1776883120; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=54mkeX+ZJ0p5qdM4WuF7kV+IpuyuKhcU4CmQCP2Jy1I=;
        b=h+84JW7xDrxAOX5ESLzlgVjmXtlvnvc2rGxLFuaQ1F30zdMo/6a2tYlmFR2t40aiEp
         NseCNxTXBng9ar14h6EIt04n9GAjYwHA13jLnfUo2qg7jjLBdB0rSdkcyUhgmiUDjSe/
         W4XbPOvk1Y3RHtDNgvOl6LYvG/pjAemkTNErCi404rGtsks6Dd6XW4632nAp7tRidh6x
         QTQvld/LSPzVVd9fwx246BArN1pwCjsYvlzQTwJQl0VvB6OzJN42nS3Xe/YXu1RA+Czh
         XpTX+Bx18gtDpy+dkDCyuA2I0zUcxHRlehkO8mqZd1M5CCVKSmC8RQg4lYumIgOVIqQ9
         4dLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776278320; x=1776883120;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=54mkeX+ZJ0p5qdM4WuF7kV+IpuyuKhcU4CmQCP2Jy1I=;
        b=aAdOEpMM4o3XJ5yqUsVcYnM1+3guFzejaZ4WKyyXhVygkUE1se1WHchUMC55iCF8F3
         1povmDXtMyH0IS8H3xoT4RHJJLH6DnnlhjS15lqw/tqx+EFp1ru1yrVZI70amcCMTXTc
         IPLQrCB/X1xP6LxXqqiADKoH/D8pgE79/Wc9oNQ4AhcjNUL/piZeHOBG6Krd5agMjdYj
         khuwZbkYwm3gl5hizjS7n1p9ZW5GJDh4wgOmZd0B5C11gsqscfY0Mb/1Utw/Il6umJeS
         wR24gtRNvnMO9N0pBruh7HBFr05u5Dqh01NXd1SXFGhWiQRD6HxoBqmmQIkrIf5opWtQ
         h3Hw==
X-Gm-Message-State: AOJu0Yy0WvD00SOctvzUoXtmUX1uNqYQwfKA85NOsTvdOGSETp+5EzlI
	6bgcV6uJHCKBTD5OWTyy5wzEnWM+CGwLHTI6D1BP22bfy3igqKfU4jxhhmctqd92
X-Gm-Gg: AeBDietXKJUIkTd8ZCPz+hAXT+czUMosmTTevFj/bkUogn7oZxlLgsu1SJu5+OQIvis
	AssALCNG1nB0mZ5mGCkbzW4SNemgOdzZmcU3a/JK+mp8HyxEJO5cax8zorpfNPvFJmL7GExaRBW
	31SkCp/NE72S82cdBbo47u1j66g/mbB6EyBRWBBh2xqFySlPwhT4hs4PFQHl/+xAxhHik5tOMlm
	WF3pu0P+3w0Bzz7YGkKYsrF89KgZjpIo47I4GPQwhQeCXeyqozd9u4XQc7HDQ3PTh/Gr2+pBb0F
	QKOfowEtRxkS+GWsffvfRjKGV1Y4ig15ssqZwE67EpxRoEXiOrSFwDPotGdIPpFzcUDBWvJoEWb
	zt8JS1pavqHReuXxjg2mre5784lUEx8c1txWDAOCnZqZ8mKVdCEaBDPVFuV1sLlaRfb64Rf7NOP
	3lSl2wYFA+Z3lQ3vuYbAM=
X-Received: by 2002:a05:6000:1847:b0:43c:f52b:7ff6 with SMTP id ffacd0b85a97d-43d642c09d8mr33314805f8f.37.1776278320107;
        Wed, 15 Apr 2026 11:38:40 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43ead33d6desm7505709f8f.3.2026.04.15.11.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 11:38:39 -0700 (PDT)
Date: Wed, 15 Apr 2026 21:38:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 8/8] fs/fuse/file.c:959
 fuse_readpages_end() warn: variable dereferenced before check 'mapping' (see
 line 944)
Message-ID: <202604152334.fy9GBg2O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260415183835.MM4LdMYrAFdd3uZQAirwphQTxuiyIUDuaLdziMpsY5k@z>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   b3c77090341c2832f1d703b6592011886cdb7e9c
commit: be926e6761d28d105ba672242e81e911e0d7e5e0 [8/8] ANDROID: fuse-bpf: fuse-bpf v1.3
config: arm-randconfig-r073-20260415 (https://download.01.org/0day-ci/archive/20260415/202604152334.fy9GBg2O-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
smatch: v0.5.0-9007-gcf3ea02b

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202604152334.fy9GBg2O-lkp@intel.com/

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

