Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37952BF3E2
	for <oe-kbuild@lists.linux.dev>; Thu, 28 May 2026 06:20:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779949234; cv=none; b=Ki54/nfxR45VeTnnitheNwJuPrg8pVzOlBXFGi+s2O8E27tIJkHIJ5usgDqEh1O4zBu388byfYNixOkHDCRvKWUp66ozPvNmC89Ybb3j49uOGFgTPAddopCDWYh6mfaUx2b7XqE38EPe0BJJMMplL0yT58jR9xzMoM+x8jcijWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779949234; c=relaxed/simple;
	bh=2egaF4JqOz/gl9SLUY90HURXnn0GR2GdC+N8/MNudYY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nYvewHeskLF2mSLYnmBYyuyr2rnmZ+FiQEJcsN5EdoJlvIGK0w8HpuHPknOLAKrxE7cCeupmAAKRTl/tvUpNiDGDMvq5XuLhWs8mp1fgSfb8UVSDWRMjjK6CU/9Kmpjx9/CvoMcnsIWZTQ5jY/Md6i7O5IqiIML4IjeV5j9qOXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YecaFJnz; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YecaFJnz"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4904127c32cso39117205e9.2
        for <oe-kbuild@lists.linux.dev>; Wed, 27 May 2026 23:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779949231; x=1780554031; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w0DmSmrXZPiEu0OyuVrKN0In8ljbty3VMv6sMMRIM3c=;
        b=YecaFJnzLOSjGuKl38aaK+gWiNv4eIKnDBzrr+bTHzOWNBaMvkyb8ANROaPrm+/g2C
         SzRU3P5F7gsTGJKrh9CxE/jmDP7i/Yxy5DIia1X7o9p4Cw28YnAMuED1Rpyb+moekomL
         06bXL9+dVEDz0CiMG9sv5zJ7gzpZb9Ni5bXC7RRBSZfbTIcneKXQw4havgecguHGU5Vp
         T+xP1qGcOMVMweoySG3ZlRAnUiovFItRSoeXwL87VVUAfjmCylvPykiRLz/d8oJVl1+C
         VzgG5G0+FOODjbuTYY8RTR9L8NPq6Qe9eAfsXHtQV9a5fabQULN3GMHyqXUeKT7Rs3Nh
         0JvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779949231; x=1780554031;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=w0DmSmrXZPiEu0OyuVrKN0In8ljbty3VMv6sMMRIM3c=;
        b=YeLRqNYEe7suUYxbJ3n/1Twv74aEtsnwZZKrUrHNsq6zvyXMzs5HMMJWZfEUi1kxvI
         GzX5yKPEeeCaVBRSOeiMiOCBSOOMjQllVYolgweyXirIZDfITX4kr7ZhPqseb9/NgrYX
         XwXdVyv/pMEF5Ut1+/Oes3169zcBkRPbCFZWx1j0T6GCQkppW8tY9+1kZivX8HFyTlsW
         wNBulVY+uWktJojVT7l7sfp7f1T6QvIZUiAtg26qunQLnhwQW4uamidFiV9UwKtDSnXW
         N7d1xuZ+Kq8VVBH8OpuiMTjjtd+i0rEYViCgT8UetlaUX0FH53QUe/3QUIqoDm3SkGlQ
         sTUg==
X-Gm-Message-State: AOJu0Yxq/wdUBkLF2je7VBj+h+Y2bj2r6mFzgsyVZrpm9huTJNIP+KkQ
	zyEIn0My2CWcpK0zstquQfX+ctjVn6SiJ2+6xtOiEGrVQto1P12b9hQiUyr7eQ==
X-Gm-Gg: Acq92OE8fN+ZLxd98Vf9UArDGyMztTP8cNb8pWNm4UmK1CZl6prq97sOlKNERM2WYo6
	LXwo3hCxx8D2xqewJOXXza+1TMMhzazLpcpzQ8PLzJlSi0qzft+vS9Zlb4VQMa5ocwgZr4uNdvw
	jIqGip0OUivq2o+Lk+Y7B4uv01UEAqces04R9KnJE+fYhF/dovBNjJ1CzoilFpJ5BvmQO7UVbU/
	O1scyRB67NGLaxFjCEWxUrjJH6TSZIJGNQDS0kAV/2jgR1iw8k9uSIUE7jUmmcrqypBfijec+87
	Hpf+0+LFKFhGj1aKhcjnL3SnCZunKrxTfzupNZbJUoEXB3VwKzmN+LP7z+Chw4hnXD1NDuikWF2
	bVi0KICspWOVPRwCPwLtlF1mO39sY4Jw54PB6cVhYw3c1gzvZY09gUAWRUHiiln86uLsEy2GCzr
	FxI3ylNaTPQpwTue+Wwq0Lci3BBLYeukQJIg==
X-Received: by 2002:a05:600c:4f0f:b0:490:50e4:7224 with SMTP id 5b1f17b1804b1-49050e474d4mr424196945e9.3.1779949230846;
        Wed, 27 May 2026 23:20:30 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49092a817d3sm23909105e9.10.2026.05.27.23.20.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 23:20:30 -0700 (PDT)
Date: Thu, 28 May 2026 09:20:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-lts 2/2]
 drivers/misc/pci_endpoint_test.c:292 pci_endpoint_test_bar() warn:
 signedness bug returning '(-61)'
Message-ID: <202605281200.z115VoHV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260528062027.7TOPIOlI8hpPvHRk5Ixrzd6DWwAuKgcGHCqJ9kHJjww@z>

tree:   https://android.googlesource.com/kernel/common android16-6.12-lts
head:   7d38f5b0e4b0d06970e261174e220a997a0908e7
commit: f615e8d2dec6746127d4667c3cae81bfd6a1ed3a [2/2] misc: pci_endpoint_test: Give disabled BARs a distinct error code
config: x86_64-randconfig-161 (https://download.01.org/0day-ci/archive/20260528/202605281200.z115VoHV-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202605281200.z115VoHV-lkp@intel.com/

smatch warnings:
drivers/misc/pci_endpoint_test.c:292 pci_endpoint_test_bar() warn: signedness bug returning '(-61)'

vim +292 drivers/misc/pci_endpoint_test.c

2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  282  static bool pci_endpoint_test_bar(struct pci_endpoint_test *test,
                                                              ^^^^

2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  283  				  enum pci_barno barno)
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  284  {
2a35703a6a00e8 Niklas Cassel          2024-03-22  285  	int j, bar_size, buf_size, iters, remain;
2a35703a6a00e8 Niklas Cassel          2024-03-22  286  	void *write_buf __free(kfree) = NULL;
2a35703a6a00e8 Niklas Cassel          2024-03-22  287  	void *read_buf __free(kfree) = NULL;
cda370ec6d1f7b Kishon Vijay Abraham I 2017-08-18  288  	struct pci_dev *pdev = test->pdev;
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  289  
f615e8d2dec674 Niklas Cassel          2025-01-23  290  	bar_size = pci_resource_len(pdev, barno);
f615e8d2dec674 Niklas Cassel          2025-01-23  291  	if (!bar_size)
f615e8d2dec674 Niklas Cassel          2025-01-23 @292  		return -ENODATA;

This is return true;

f615e8d2dec674 Niklas Cassel          2025-01-23  293  
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  294  	if (!test->bar[barno])
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  295  		return false;
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  296  
834b9051992580 Kishon Vijay Abraham I 2017-08-18  297  	if (barno == test->test_reg_bar)
2a35703a6a00e8 Niklas Cassel          2024-03-22  298  		bar_size = 0x4;
834b9051992580 Kishon Vijay Abraham I 2017-08-18  299  
2a35703a6a00e8 Niklas Cassel          2024-03-22  300  	/*
2a35703a6a00e8 Niklas Cassel          2024-03-22  301  	 * Allocate a buffer of max size 1MB, and reuse that buffer while
2a35703a6a00e8 Niklas Cassel          2024-03-22  302  	 * iterating over the whole BAR size (which might be much larger).
2a35703a6a00e8 Niklas Cassel          2024-03-22  303  	 */
2a35703a6a00e8 Niklas Cassel          2024-03-22  304  	buf_size = min(SZ_1M, bar_size);
2c156ac71c6b25 Kishon Vijay Abraham I 2017-03-27  305  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

