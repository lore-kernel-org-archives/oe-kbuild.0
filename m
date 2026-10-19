Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34A56381EAB
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 07:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792393669; cv=none; b=SkQv0D8BuKsLK0QjZb9ddh00QX1AVLEXDBoBo7OfweuHMEs/oNFNPuW7hHmVuofxC10brYCtXNy69HwcAqugfZoiDGcFMuzpNerpMHRb6nAu1ntJ3Hdy72mMmnQbpbFgFKcLOaXMF4ilG5lcbQ7/gmewrbCrpCT5YMD3JLPdjRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792393669; c=relaxed/simple;
	bh=S4fQ8XEc+oFAxEWDCpZJ1/B2hbc2+YG7gMyRh1B6L/o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mP20bVxYNs3j1dL0OSb82hbCIzuDYmd7WP6Rcbm2YV0Keei6KjA7f61OXFzcGCBWtAxQ4E+OQgAwSpblTklxnGRF7BrP2HxMrdia4pHYcjekmYah6yl3BC7Xe73WDVvHdBCI/279SNEl612yaB1P0525yjmmXJ2MQGOzY++179s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=STdMKry3; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="STdMKry3"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c4d870d54so998362f8f.2
        for <oe-kbuild@lists.linux.dev>; Mon, 19 Oct 2026 00:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792393666; x=1792998466; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BogBNmuVEjeeMLqvlyDsF36FOVbrrggoEcqAkpHFhxE=;
        b=STdMKry3iFnhKlQIHk8N/QvJObN4v3Xik0XDl8dsrjqkvJxK7vkUKDYywLira7lKw1
         wEOsV9oByc2LFm7jSltMJAAdjUMtAzXZYphCbz2QPgyae6gPdrLv++TanH5za+eQv2mx
         ACH2xR0lpGekT/IPGBXkjcREntm2z9fYTBLJ1iULK8iVa1qWzvCtxyMwz/qqnUE7i+IF
         KO8QEyOBTEpD6JrUmGerKjd/UULJq982IndTv7Fq2tLw9iBnJAJmfNddQ7uVvvWq71Me
         WnuGvBiR15fB8lUt21jCJuc6yJE+ojLTnQubRsqRcjGWTHCi9I3MGzRHYE2C95FqyjTH
         ifnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792393666; x=1792998466;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BogBNmuVEjeeMLqvlyDsF36FOVbrrggoEcqAkpHFhxE=;
        b=KHz7L3d6Ack3RW+QeyFeKxCk1rlsoqJtjYCak1sOKRYTuEFA8ZrlZ7hSC98Tx2fWq7
         JUiGgGnUChB2pA/rFTlAc4ljcRRbFNr0YYGm2kjOYnzd6lnJ9oPMDNq5BV2A8pB9iZAr
         cAMV/qW5JBmVORJgOu+4UV1sDpg+wgOqOwObsU8sq2iZnsqqo7ZlZXrB6nYGezA5YiCr
         utvbDHrtHCIceR5CpgkHY+3nWRIHoAaiMr8WusKzHzM1k2w35qhbs9Qjp8hkVuS/Df8p
         ITUkBEkWYGMUl+vgIAQgQ+moJsQpxljhCFm3njYRZCYzqcnkIEhER7E2TIQVSFgGP0iC
         3k5g==
X-Gm-Message-State: AFq9FYIEC2KcsXuOPDvDzInZs5XFf7RlorSQq8BdYNpU69pFRuI6DCUI
	7ViKFI/v528sCGB3t+N4fUw0vBq6fXB1EOJazLrv8aNl355x4Uio49QeKgoRQXjzGSGSCCpK
X-Gm-Gg: AYBFou3bOU71S+f/kixn9UtdlBZOku2RxljRndvqSnq/r0J1otPyfhffNXOBnZV8RCs
	Nx2RLJBpozh+/BUPnhLXxfUUJhsKuGed9/Hmo4OIWAZyBRxalfqpAgRv24kB4au1jDTvel72O0Q
	l239HRvYQ1BINXK0NYPtLUJ/yRiO0RQ5pFVz4JbgMe+PvXhyeczL7T9elluc4Uad3tSY4vTF2dr
	eyIcUSEbnkXUmkUUHmwIir0MfEm1P+/9akVQxW6wmrn8yRRjP8ljuOKKw3e8B57H+oF3/JM+MSe
	Ulbq5Vh8UCRHNrw7+d+SvEA0pmw5SxBxLGT/Uk5Ig5JlbUxr+H+JQ5Rwvv0g+EN8mXNBiSLUXHU
	sU5jXSx+Bb+hY9E7vnKh9qayVxFViKapxV3hveybhAXrz0K5KfakuK0wvo0HetqiEit00XqLNuk
	JSdfNK1/r5cn69cTz1jBbjIX9I04GoUP6K5Sr6lfx1gedDs56qpGq1dPyExxOMlT2EnHw=
X-Received: by 2002:a05:600c:5492:b0:4a1:d992:9476 with SMTP id 5b1f17b1804b1-4a1d992951cmr127787035e9.23.1792393666098;
        Mon, 19 Oct 2026 00:07:46 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48dfd4fe9d9sm20109761f8f.40.2026.10.19.00.07.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 00:07:45 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:07:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-kminext 1/1]
 drivers/misc/pci_endpoint_test.c:292 pci_endpoint_test_bar() warn:
 signedness bug returning '(-61)'
Message-ID: <202610170051.ZaPQhbIG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261019070741.Pz9lFcL8gL5s75uGfN4GQlV2vk6PbCbByoksS7wI5KE@z>

tree:   https://android.googlesource.com/kernel/common android16-6.12-kminext
head:   a42b417921ddca2df90dc3d8cb746eda8cdb6d63
commit: f615e8d2dec6746127d4667c3cae81bfd6a1ed3a [1/1] misc: pci_endpoint_test: Give disabled BARs a distinct error code
config: i386-randconfig-2200-20261016 (https://download.01.org/0day-ci/archive/20261017/202610170051.ZaPQhbIG-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202610170051.ZaPQhbIG-lkp@intel.com/

smatch warnings:
drivers/misc/pci_endpoint_test.c:292 pci_endpoint_test_bar() warn: signedness bug returning '(-61)'

vim +292 drivers/misc/pci_endpoint_test.c

2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  282  static bool pci_endpoint_test_bar(struct pci_endpoint_test *test,
                                                               ^^^^

2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  283  				  enum pci_barno barno)
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  284  {
2a35703a6a00e87 Niklas Cassel          2024-03-22  285  	int j, bar_size, buf_size, iters, remain;
2a35703a6a00e87 Niklas Cassel          2024-03-22  286  	void *write_buf __free(kfree) = NULL;
2a35703a6a00e87 Niklas Cassel          2024-03-22  287  	void *read_buf __free(kfree) = NULL;
cda370ec6d1f7b2 Kishon Vijay Abraham I 2017-08-18  288  	struct pci_dev *pdev = test->pdev;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  289  
f615e8d2dec6746 Niklas Cassel          2025-01-23  290  	bar_size = pci_resource_len(pdev, barno);
f615e8d2dec6746 Niklas Cassel          2025-01-23  291  	if (!bar_size)
f615e8d2dec6746 Niklas Cassel          2025-01-23 @292  		return -ENODATA;

s/-ENODATA/false/

f615e8d2dec6746 Niklas Cassel          2025-01-23  293  
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  294  	if (!test->bar[barno])
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  295  		return false;
2c156ac71c6b251 Kishon Vijay Abraham I 2017-03-27  296  
834b9051992580a Kishon Vijay Abraham I 2017-08-18  297  	if (barno == test->test_reg_bar)
2a35703a6a00e87 Niklas Cassel          2024-03-22  298  		bar_size = 0x4;
834b9051992580a Kishon Vijay Abraham I 2017-08-18  299  
2a35703a6a00e87 Niklas Cassel          2024-03-22  300  	/*

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

