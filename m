Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506DF282F3A
	for <oe-kbuild@lists.linux.dev>; Fri,  7 Aug 2026 16:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121714; cv=none; b=WEkYsNgwNsNKKGt08dvqnHpO7Vz8zmDJH0NDxMc5dPXXTn7H7mxt65tuo26PuI82RBHp5ECHxLNcqbwAD7vHq7CwsL5n7teoFylbNzoSBzQUZN4U8JFVkxH5iew6MbgkKoYu5EOAEB7Ilb3z8+2j6ipijgIkgQB7gPPeKGd39is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121714; c=relaxed/simple;
	bh=w44gWSxPdQjrl4Q8P7ErabLUzfDafLFgd5adwGSC7hI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FRDgWmGmXJW9ceNy/zMQYW8snFHWEylwwWvdJudpOvYM8xJRSX/Is4HfXO5rsAKLTO4AVruiHeDUoJy6jJx1x4ZAC833zZZ/JUuyGFoUkZHnaPgtr8TsxRKzxE0wU4nbqrXEX5+njH/htcHLj9m1XP3DEB+twIyzE9IIfGeXsXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Os6JUhnD; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Os6JUhnD"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-908934450cdso18154416d6.1
        for <oe-kbuild@lists.linux.dev>; Fri, 07 Aug 2026 09:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786121712; x=1786726512; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s/FeEsrWnUI92U6c0JlV2MTC2xQj+SJZ7T+hkvEGMHU=;
        b=Os6JUhnDYy0DwNhN6VTMUS/Gv+kfjTnQl4LqCP/VwMzrcisjtISq69TANGKeJO3Gos
         Iu1wQhPpYkEZW95sTk7BaxastzP12IUwh5FtArZ9TOLgbgOHuYwzA3RDuXoZgU/mMSlx
         71D8XdOc0N+tHj+EZAgBJfdH1575cKxmJQykRgYQm9pU29ETIEifuGo0mxtzQAew5eu3
         nvuXpNIs9ws1LNAkPkSkeq5iiLodz1qzkjOKr8vw5UtGSwGkx5cNudG95zT1YK/nLrOp
         F2iNjHwywoDZBzVft3Aq4Rg0RqDbzhmCRrQ3F2mWvTN8iBpqUvkA8+Q1maZL0FdHbkLN
         nJww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121712; x=1786726512;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=s/FeEsrWnUI92U6c0JlV2MTC2xQj+SJZ7T+hkvEGMHU=;
        b=cH2YGykto52xu9rRF1hy8lX9jRRqgnJWZNKLYAwOjW2/up/LIQjSdZh2/j9dvEkoCf
         gFYJvs/8WW4PGlh0u9fC4Dv5OPbmmZ1VE0RgivX1YY2ihKRBvqbBgiu6c34U7qpICEEv
         Q7vYOUziiz1AYML30oHS9ZPbUVE4UlKWFEzT3Etike1WtoxB4V+UrXgYIdzFPW916/WH
         UqJLWK6B8gqma7IS11veQWbK/ORv0ZvgvGnj48f1n1lE7IL3Conhxzx596AjbUSQUtMJ
         sOPXOEBhIq86p7MaE5cAMYMqUPch46qSYISLLOGiJsL1kJEMrCJys196Al2NvF9P9rLK
         DsBQ==
X-Gm-Message-State: AOJu0YxvlpJ7k5ck87K59Eg9rdaCk/mdA9fPmzDwm1ORo/97McxbOaB5
	fyRb85t8d3nGBObObSCFIvz0VqsOGdeXQrX/cJLS1tyL2chkxljk23sbhdhnmryydnY=
X-Gm-Gg: AR+sD12Hj945Ap5sibfZtclcCTTKyEV5VUA+Gtj9zBsCwIpsOKYf0ont6sOmqK82KUA
	yFuKrOywoXy8XzLBXhBvHcUT2saKEuG0f6id9tRVZzi8bQXMGDyZzCCBSY7zF6akgEY1FNyS1gh
	Hfte5GslKMx9a8mSwZFB/zW7uVt3LKz+N+oA+2xZMpi7vSIH4ZBVbVVYoSY9TWdhzgJ88HJ5E/e
	waRfMtXGVFYgCGiGHQtW8xTeTrOaDyckP130Z3PQjXxA6cKqB2xThdARJP5fT0CWOIKEL0Qip1Q
	Yi2sNgh6h8GhGNAe+Ci35JaGCiB2MNCajCh6eMXKXqXNAiHToPtwTSEFZQ15X84uEyw78iRsL5v
	nteSWWOxv2sC7DCEokYnVSUbB/Rgphzxj72OvyjaZmaP+rIVfVicoQRfpsULDLurwFdVmrNYYi4
	I2lnJgfoJx6rVA6JvTkJb5i11nzEwhuEmYbFmLUc3ML8cuKxcuFNEz6A0iufSmQ+gI7g==
X-Received: by 2002:a05:622a:a0f:b0:50e:635b:5579 with SMTP id d75a77b69052e-52d20975cb7mr25961661cf.19.1786121712089;
        Fri, 07 Aug 2026 09:55:12 -0700 (PDT)
Received: from localhost ([172.216.11.43])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52d16335bb4sm16036641cf.2.2026.08.07.09.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:55:11 -0700 (PDT)
Date: Fri, 7 Aug 2026 19:55:02 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Eli Billauer <eli.billauer@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: drivers/char/xillybus/xillybus_class.c:230 xillybus_find_inode()
 warn: variable dereferenced before check 'inode' (see line 226)
Message-ID: <202608072246.Ee6OOcT6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260807165502.6tU5aVmniAs_M85lp30i5qa4a4ZcgGoLQZRNBLeDT-o@z>

tree:   https://github.com/intel-lab-lkp/linux/commits/Eli-Billauer/char-xillybus-Improve-control-of-execution-flow-with-mutexes/20260806-033404
head:   d05c024c9354aabd2ea64be46e6fccbf24ba33cd
commit: 16edb90c39a5645b3803be32b2b77476efae2402 char: xillybus: Add defensive sanity checks
config: i386-randconfig-141 (https://download.01.org/0day-ci/archive/20260807/202608072246.Ee6OOcT6-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202608072246.Ee6OOcT6-lkp@intel.com/

smatch warnings:
drivers/char/xillybus/xillybus_class.c:230 xillybus_find_inode() warn: variable dereferenced before check 'inode' (see line 226)

vim +/inode +230 drivers/char/xillybus/xillybus_class.c

8cb5d216ab3365 Eli Billauer  2021-05-26  223  int xillybus_find_inode(struct inode *inode,
8cb5d216ab3365 Eli Billauer  2021-05-26  224  			void **private_data, int *index)
8cb5d216ab3365 Eli Billauer  2021-05-26  225  {
8cb5d216ab3365 Eli Billauer  2021-05-26 @226  	int minor = iminor(inode);
8cb5d216ab3365 Eli Billauer  2021-05-26  227  	int major = imajor(inode);
                                                                   ^^^^^
Unchecked dereferences

4834f9898c7301 Jakob Koschel 2022-03-24  228  	struct xilly_unit *unit = NULL, *iter;
8cb5d216ab3365 Eli Billauer  2021-05-26  229  
16edb90c39a564 Eli Billauer  2026-06-30 @230  	if (!inode || !private_data || !index)
                                                    ^^^^^^
Checked too late.

16edb90c39a564 Eli Billauer  2026-06-30  231  		return -ENODEV;
16edb90c39a564 Eli Billauer  2026-06-30  232  
8cb5d216ab3365 Eli Billauer  2021-05-26  233  	mutex_lock(&unit_mutex);
8cb5d216ab3365 Eli Billauer  2021-05-26  234  
4834f9898c7301 Jakob Koschel 2022-03-24  235  	list_for_each_entry(iter, &unit_list, list_entry)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

