Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A8AD3DCDB6
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 11:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176800; cv=none; b=irwQ7IMk8UfW8R+DofLS5UHlhPJ/H8JZ/kQRluC+D1OWfQo+0MPQzEYkYIbMDp3RWxaGNM4xfCDxo8cJIgu8qBF7NwwTepdWbI59UbiYbahcNTM/BVgcUkNKalO71n+PpEGEQp20/WTy46Sk0ffEdEWMtvC9/jC/mOefXbOzvKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176800; c=relaxed/simple;
	bh=fxYLO9HD2iCGubfv3LFtpfQozDHJ4rIXVNR9DeiomaA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kMYhLJgedQh6wlnE6PZo9nS7n4G1YrL3igcLqd5JCH0XTitXVgJ7I/AQnaF7b4Aba3/qncz+PLysRcBf09BsNwX4SEVY04CldY+D+y9Bo0UeGNsooFqhOFEzNWIdnFN2xJR1W+glgcISmuQdcGrgB3x9S6GOxWnDLi/b8zdJOj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dmrc6lmb; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dmrc6lmb"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9158c621ebbso917281185a.2
        for <oe-kbuild@lists.linux.dev>; Thu, 11 Jun 2026 04:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781176798; x=1781781598; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6t9UzwtLsdthmiUIXMFdRm3409bQDOGnzbrc7Xpt57Y=;
        b=Dmrc6lmbHBc+O5+Zn9+eT4KQXOWoXiA0vG/s3bD+iGJgG8moNyg7gMXjS9YsrP9/+Y
         baV0pjDdxfNcvhV0+w4F2CMad/v+EQHn1QxkzmsvfmaC6hN336fLRFBXSsHv2LWlk8VS
         A5LlXaXT3kVCKt09Udrtwmf/gHKk4byjNCd9T7GlGryC6NLprPWbQx6OeZeNXYR0XZKK
         DlbarZLDG21ekBWPDcLx96+UnSAZ35wGPJX7STEzxa1YU/BF9UL2MK2htzQtg3tfaA3E
         yW6vSQayLmWOSnDHL9OynpPSfDvWU9JWYMK9v7qYOhU2TKMXgx7PkFvXAIxlrs1RXS82
         TljQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176798; x=1781781598;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6t9UzwtLsdthmiUIXMFdRm3409bQDOGnzbrc7Xpt57Y=;
        b=YxtJlmGudAOOp14DT3V1BpOrwX6R9J3HM7tCe6wjJhXmAIoIidf4aprKcGxrV2vp4F
         MzR5S5JokGZkcqSIKZwwURN/YjxdozTG7mF9xrLVV5L024xV926giM1udiyj7pTdo4mF
         wLtrFbHZB7a/JQhOxR/BQgJlwOGat5o+7ju88k9bsQD9NC75tYK/vZa/4JV0eMKWv1EA
         LplK2BftqD+nQfb8HkWIcnJyix+OspqzjRGV4Z3xAi+4jd6A/Uw+RRA8MMV075nDcn7+
         k5oOEPKMyEUSGgHpT/NCdJ1oHKJvmqK223DHl/cWPzpcr7aHYG4GELC7eDoJadJZyOAB
         VRDw==
X-Gm-Message-State: AOJu0YwoFwE8XqNJQfi3Y0d4SBM+xJCH+DwzvlMEBH27T1ibK3jHWa26
	2lfNETos0elh6hkLSGtnnd0416lGw9njddgdYt/W4DxOnJaNrpijaJeg1w/NkTsVhCI=
X-Gm-Gg: Acq92OE1AlRD0qwIQmr0IEDRawgQBFvq1cd8SpJPJ7icKTliaMMLnavQEbE/kTkP4tl
	483zbeEOwP8EX1MDr5nZx1Z6aRhK1Mp+kB+eUNy+4qQF1/AkohBFKEaXPtQyy43iPtqmiSZLAU1
	oJh81yWxnO1o7wnlpc9kG9gAKgi9nTVZbGKYbGhsY413fHkNjLRRuVutt1/S/thDuiA0Pqvu7h3
	g4oIGNMiaUqkyhSypVBjjngLJnKwywMorAZNyC4PKcNcbr3Z8dG7HWcsv/x16CvFIiMov3E8S/Y
	ww7nvqFyhuDDcHbGxQRmvUREB7/mkwthRPJloXK/DJwC6UJCm+HHsSWXSrkOFK4xQk8RvYehfAs
	2jHmvWRXhrvkxTqMx8D429GBjYmUutCX+fOGx5x4dNwuPCmgXjLsA3gKFiN8xiD7c3unFh3SZ72
	8s1jRdCvR7X9vKdVNBIqisAPya3bw=
X-Received: by 2002:a05:620a:1a28:b0:915:80e8:67d1 with SMTP id af79cd13be357-9160b09ebdamr307941385a.56.1781176798572;
        Thu, 11 Jun 2026 04:19:58 -0700 (PDT)
Received: from localhost ([149.40.50.215])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d1eadaea6asm15010306d6.40.2026.06.11.04.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 04:19:57 -0700 (PDT)
Date: Thu, 11 Jun 2026 14:19:53 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, T Pratham <t-pratham@ti.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Herbert Xu <herbert@gondor.apana.org.au>
Subject: drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn: can
 'dev_data' even be NULL?
Message-ID: <202606111933.69GGTKxr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260611111953.Jd9UhrBr7UpgTRqHE17igq8QE1xCOyqsjkFZlC_y7mQ@z>

[ I don't know why the zero data bot doesn't include T Pratham in the
  CC list...  -dan ]

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9716c086c8e8b141d35aa61f2e96a2e83de212a7
commit: 35c5097f737a164b3afe23d07698db95061f0db8 crypto: ti - Enable compile testing for dthev2
config: s390-randconfig-r072-20260611 (https://download.01.org/0day-ci/archive/20260611/202606111933.69GGTKxr-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 35c5097f737a ("crypto: ti - Enable compile testing for dthev2")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202606111933.69GGTKxr-lkp@intel.com/

smatch warnings:
drivers/crypto/ti/dthev2-common.c:44 dthe_get_dev() warn: can 'dev_data' even be NULL?

vim +/dev_data +44 drivers/crypto/ti/dthev2-common.c

52f641bc63a4665 T Pratham 2025-08-20  35  struct dthe_data *dthe_get_dev(struct dthe_tfm_ctx *ctx)
52f641bc63a4665 T Pratham 2025-08-20  36  {
52f641bc63a4665 T Pratham 2025-08-20  37  	struct dthe_data *dev_data;
52f641bc63a4665 T Pratham 2025-08-20  38  
52f641bc63a4665 T Pratham 2025-08-20  39  	if (ctx->dev_data)
52f641bc63a4665 T Pratham 2025-08-20  40  		return ctx->dev_data;
52f641bc63a4665 T Pratham 2025-08-20  41  
52f641bc63a4665 T Pratham 2025-08-20  42  	spin_lock_bh(&dthe_dev_list.lock);
52f641bc63a4665 T Pratham 2025-08-20  43  	dev_data = list_first_entry(&dthe_dev_list.dev_list, struct dthe_data, list);
52f641bc63a4665 T Pratham 2025-08-20 @44  	if (dev_data)

This check doesn't make sense since list_first_entry() never returns
NULL.  Maybe list_first_entry_or_null() was intended?

52f641bc63a4665 T Pratham 2025-08-20  45  		list_move_tail(&dev_data->list, &dthe_dev_list.dev_list);
52f641bc63a4665 T Pratham 2025-08-20  46  	spin_unlock_bh(&dthe_dev_list.lock);
52f641bc63a4665 T Pratham 2025-08-20  47  
52f641bc63a4665 T Pratham 2025-08-20  48  	return dev_data;
52f641bc63a4665 T Pratham 2025-08-20  49  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

