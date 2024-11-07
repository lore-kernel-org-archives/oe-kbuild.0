Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CEFA1F4283
	for <oe-kbuild@lists.linux.dev>; Thu,  7 Nov 2024 11:10:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730977819; cv=none; b=FfFlg29GdSxfr6QEfrz39fH7ltOLvN5EI8i5GUuaaIvEwMwV+NIA6ny75dC0dwikD5zJ1PTNGEOcYZ/neQqetGh93IiGnbPRj/6zwGS8gHhzB2XsU8i6Ohk+I1HE49V/lcsMJMIIeKaF8Nct6OdbP9IkfHL1yyVrozdW+jnwZ5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730977819; c=relaxed/simple;
	bh=q3xpCY454sKIMB9kVNSqwhYhMGTvEdABzHRWjFoWIC0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bJlMRYw6s4PoOEA6Cy9y0I1AJWQ3aeoo8DlnMZMJNAgqGAVYzh1KkqXiFENNaMlnrIxODyzZXlVtwm68O2gpaIQp2N2LpVr0EusyiRfQS0E9/b31p6OTgGrMjUlW3IlPFzngZYHl1/CNDP2fRSGdVbRrhHGL2Saao0Vhtzcijxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WNVp9YXP; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WNVp9YXP"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5ceb03aadb1so949992a12.0
        for <oe-kbuild@lists.linux.dev>; Thu, 07 Nov 2024 03:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730977816; x=1731582616; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Y7JEKBrEe0UsFl+j1cWsmIb/gxFdeLbIADbPUrAmw5I=;
        b=WNVp9YXPEP5V34GnfyKLm4LKnCKXtSHPTlDWcku7IMVLVXPhZ7XHFsSQ5yU0omdnAN
         L2g6YILkT9toZ1mHX6Gm53njV+XBbCU1sRcnzwQbiEzHlheCShD/sWmMJ+nsP+QGFKKP
         pUNT378XFaN275fdTRrlq+Dq1Gt6EiaY7VmhgwP9VqT4eDLrvDYygGLh8GO/n3BpqcYZ
         97yZQOabg1cVqf5KU4dDX1tq/R6I5UrEum7W6TW8IkLdi7XXlJORsSwcIofPpP4/QQhL
         b/qyxpNlOpO6V8F/8KwlZelAHdJb9W9qgaQuOZyYqoohzvxhN0n+9zTOCLEUTr2ari+s
         HwFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730977816; x=1731582616;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Y7JEKBrEe0UsFl+j1cWsmIb/gxFdeLbIADbPUrAmw5I=;
        b=c7JoMvDBKY3e0Hiisik7Gdiw/8AqNm+5sEAdB0s8MUzDZQZvn1fwNOxkYFMXnfEhka
         SisSF8C6fadmgyskhY7DRjXZjlg3VNXWxB2gaUxR8f1ainu6thRgJ2s9xiCrGthy8AYQ
         JdJpfWmt3fNNzOrv//N4KgbdNKiGDMq45u6+lnDsfYMEvLkY5hHvi4rqCOIcwgNWURLl
         nr4tweW+ro9/WsrOAvkszOilUsFWeZMDRkleRE4TceK5xpcdpVY49pmNyH3vHdk5//0Z
         mlF53gcLuFvLsZfb8QNZtWzVgOEdb1qMAypb0gNZWQ/BbGGkZz72g+QBROTxKCVcxECB
         XyCQ==
X-Gm-Message-State: AOJu0YwDWMZI2kRmbSpAnAjVlW44Hj6eI0y8xVOpnDTir2Jv6WjVc5Rs
	9EBlYwlcUrQDGI0oDAG7hoqCJih+61UTfx0V81RdfY5tqYFDP01HHxdlSV6TzlvUeCN2LdUeUlX
	SB3g=
X-Google-Smtp-Source: AGHT+IFBYNVgsYMOfdhGccK0CNLd33q96d5yovRG4mfWRWGD8cqZGcfgXhhEfSPG6GH5DNmQ4X398A==
X-Received: by 2002:a17:907:9807:b0:a9a:59f:dfb9 with SMTP id a640c23a62f3a-a9ee747a2famr58986766b.5.1730977815731;
        Thu, 07 Nov 2024 03:10:15 -0800 (PST)
Received: from localhost ([89.101.134.25])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0def87bsm78638766b.143.2024.11.07.03.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 03:10:15 -0800 (PST)
Date: Thu, 7 Nov 2024 14:10:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Conor Dooley <conor+lkp@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [conor:gpio-irq-regmap 2/18] drivers/mailbox/mailbox-mpfs.c:255
 mpfs_mbox_syscon_probe() warn: passing zero to 'PTR_ERR'
Message-ID: <2e34c90c-3260-49dc-89b2-2a5fa098cccd@suswa.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git gpio-irq-regmap
head:   d1b7c5558fb6dded2dee2cfebe358de0d93f022e
commit: 6692ff5a8ee2df1c83af1c1d1a0dce7bc947d2a2 [2/18] mailbox: mpfs: support new, syscon based, devicetree configuration
config: parisc-randconfig-r072-20241106 (https://download.01.org/0day-ci/archive/20241107/202411071659.wRgcOIQB-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202411071659.wRgcOIQB-lkp@intel.com/

smatch warnings:
drivers/mailbox/mailbox-mpfs.c:255 mpfs_mbox_syscon_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +255 drivers/mailbox/mailbox-mpfs.c

6692ff5a8ee2df Conor Dooley 2024-08-07  243  static inline int mpfs_mbox_syscon_probe(struct mpfs_mbox *mbox, struct platform_device *pdev)
83d7b1560810e0 Conor Dooley 2021-06-24  244  {
6692ff5a8ee2df Conor Dooley 2024-08-07  245  	mbox->control_scb = syscon_regmap_lookup_by_compatible("microchip,mpfs-control-scb");
6692ff5a8ee2df Conor Dooley 2024-08-07  246  	if (IS_ERR(mbox->control_scb))
6692ff5a8ee2df Conor Dooley 2024-08-07  247  		return PTR_ERR(mbox->control_scb);
83d7b1560810e0 Conor Dooley 2021-06-24  248  
6692ff5a8ee2df Conor Dooley 2024-08-07  249  	mbox->sysreg_scb = syscon_regmap_lookup_by_compatible("microchip,mpfs-sysreg-scb");
6692ff5a8ee2df Conor Dooley 2024-08-07  250  	if (IS_ERR(mbox->sysreg_scb))
6692ff5a8ee2df Conor Dooley 2024-08-07  251  		return PTR_ERR(mbox->sysreg_scb);
83d7b1560810e0 Conor Dooley 2021-06-24  252  
6692ff5a8ee2df Conor Dooley 2024-08-07  253  	mbox->mbox_base = devm_platform_ioremap_resource(pdev, 0);
6692ff5a8ee2df Conor Dooley 2024-08-07  254  	if (IS_ERR(mbox->ctrl_base))
6692ff5a8ee2df Conor Dooley 2024-08-07 @255  		return PTR_ERR(mbox->mbox_base);

s/mbox->mbox_base/mbox->ctrl_base/

6692ff5a8ee2df Conor Dooley 2024-08-07  256  
6692ff5a8ee2df Conor Dooley 2024-08-07  257  	return 0;
6692ff5a8ee2df Conor Dooley 2024-08-07  258  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

