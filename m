Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793944601;
	b=nF5MegjrHPrV64Yfw9ry0F4u7suke1i2rcdD79OcXqTxgVl3h51WWfGj8Su98Y33A/BL
	 y48WKPzyPbL8rtMHtkLiH0qw3rLh+77Nlwa5tSFupvqwzooWFrilKYqx8zmPAm70ExZC6
	 +Tou3ZJwBhK+xkOJ/H1p1kDCY7iHs41R3EoqtQis7JR23F0ctvyaIk+n0TdrfkqEe3uap
	 RC88YJXfzyfYaJyEcSWqiUAIu/r4MQaouaXqQgUyCuV7rw3/0WQdkLtfXwopH71dN3bRc
	 a8viKyC2Vdpf//kBamfils7ZkDMsMeHtWpA3Z4afwEbs4J4Tumtl31L5gFUnB4B+o0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793944601;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=BGGRk7lDKsEk+C3tLTVM8Qk9LJJPZRiWXHhogF4BcsM=;
	b=1Gnlk9v6YPvmQ9jwXxuof4rxydJHhYOiSZBEBejuUEvQCrPUYo5wNIlsfQOBB4gtnkRv
	 kMZSDjygn7bEYXdKp2WVZzv4GqhaUrFKjhCrvBLwhsrp6KJHmv9M3awcF1+KheY8Ri55j
	 EYdQwx5J4eMjSPGV2hYvIwnEwc3QSYOxWMc4kxR2PD8mw/aV+RFwi0rhOJyizm+lGwXR5
	 FwHIuARwTFLQoSWIurtpBzxvMq76NleMBtBb8jexYJS2FFhzagFT8Rp9J481OMNmP+B26
	 QGSxuOaeOw7csShMf9zLEePZhLHthNcNx6QDtgAFvtkCTytQMiWE/KlNcWfd5vHtJMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DjSN9+Ht;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBFFF606A329
	for <oe-kbuild@lists.linux.dev>; Fri,  6 Nov 2026 05:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CBFFF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DjSN9+Ht
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a20bde60a0so1546575e9.3
        for <oe-kbuild@lists.linux.dev>; Thu, 05 Nov 2026 21:56:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793944599; x=1794549399; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BGGRk7lDKsEk+C3tLTVM8Qk9LJJPZRiWXHhogF4BcsM=;
        b=DjSN9+HtvK64QcXfzr3UBBgfpA1kJDs8ZDO3ZiJ/f4b62x2lPukGA4O0BI+DS1b5ZE
         vdj5q3CD6WeoAjS+bgqAQM8wko5Qsf3Td2Wz8RhZXAG+ELrzchOoM/jGfmlDvRbG2srN
         JAFTG1+xRcwri+zgnSGgzHsVSguVymLvcBeCg0L6vn61PjxKAwILYcNR+Zx1eggN75a2
         +CO3fwrc+tlj4SeJQaD2349eY9KdqjJXkQhIToNYcnIBRBrssbCubDLm45iFOwRmMcS9
         VW9igv7vda49wPHnlvQsuAN2kRNfBXSh9rsVA/bVvyqLmrJMC6oeZak51UEtdgV6hM87
         Crag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793944599; x=1794549399;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BGGRk7lDKsEk+C3tLTVM8Qk9LJJPZRiWXHhogF4BcsM=;
        b=xKpKYRwo163HRSXMwkF1xQEcuu8kHfY+1yOQkFIKP4GzPgPUzq/0pdD4yv+lRnAdKN
         WClUsxiGiWaL0kux51Ld3W6HvZo4S+P6CjHeBEfPEUtUk1qYolsjwTSBvwsccwP1Ga1q
         mE1pL35+k+25GdCV/bgytZeN64CJp6jWzPO4GsahgOlMkCsj3+d6jkODMOA8tAPKz1Q9
         gxNlvmRzFtgHpIrmLTIQMDSDZTj63znAVjOOW1slzazfOonE2CK0TJrRBIkXWAnCvWsY
         x6fH/lWplyMqwbTq/1wNZHt/gNA7A4jRfSAbdPEBxNyidyEuXqIyDB8xFJzEFdKOj2CA
         rHQw==
X-Gm-Message-State: APuU4Z/9KNMC7JKSfgg0DFzI21zV1bxTKfa++qTG9kfMyWMxUCupHkxM
	FGo5ojAP1Jn8DNxT8JX79Cg8EKpwKG+RSY5kfIm7STVhxu7TBitF3KGlYNmQrVRMLYRTvCPh
X-Gm-Gg: AYBFou33oHSb+HFg9d9AFuN1sGI823GGobUCzKDmR+ggfcw48CgRv+JIFHnXyrAo0GX
	loOsVtcC0F0eLlKeD8Xn1rZNj9gTFs9NxRkj38s/2ZSbJRBIstINKZnMi/8HNw/hQNuoDEfg06E
	NmlCOztu6VoMCbX0Zhr8jw6P6e0o7Gjf7cJ5bjThkkOTE2vqERED5dbpJq5n3GXnh+eFCsTb/oh
	U2gA4eyQrdgt32iVKqXZFE6E1cbP32Q2HoEdtTtEjHdAMCrvGILxCAZtinRxVBxV8TH8NV/nbNg
	xV4k2CkksIXzHA5cUAste5+WQvawA7GVsg33ecAsMNfZhGMeK4O7GAxYgH9I4AF60yzdCC0WD50
	JJ0ZA2kVO+6H6sXONIq0sr22fzvPoqkpGQe4pMnasvoGHsNYKUSLxHuardtnuPL9TPsrCdlhY3r
	e7YjqvkdR8naUfvtwQSex4rDA5sxrYDVi3g2APEoEHEW29Z+LyTFsXwJOqwTdBJSUr5HmfVR2Mf
	oLC5fgo2NrtEyZxP1f4UT+00S3M1ldiVfZME4JPTmYhVTB361IXv0mB7edNTZO6LV77pCfOrr96
	TysNVEtNxiEsRs/Yf46QeMQZA7Ol07UZX/XuZkrulukWTY3XEwBSrZhZ1JUgxhw3FYgaYxSRzve
	rjkhgnlVJNVcwxtiM7Ygine1g2YlFalkBWuRnaJbz3rNiopC5NLnjOWZzsz74+82wWQ==
X-Received: by 2002:a05:600c:8b28:b0:4a1:a2c0:7b73 with SMTP id 5b1f17b1804b1-4b6dfba8628mr16268215e9.30.1793944598951;
        Thu, 05 Nov 2026 21:56:38 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b6ed5b8159sm27279965e9.2.2026.11.05.21.56.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 21:56:37 -0800 (PST)
Date: Fri, 6 Nov 2026 08:56:33 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 390/390]
 drivers/mtd/mtdcore.c:955 mtd_otp_nvmem_add() warn: missing unwind goto?
Message-ID: <202611060606.xbU3zu11-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20261106055633.1zRBNNiC1GL9QLxoTpK37YS6H9kVeJZTfeFdG9PgDTk@z>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   900d46d1c904d34d7c3eeb0ef2119cffc5a8ab3d
commit: 534fd7770b6ddedc6c6ef6fa724987d3397f9b3b [390/390] mtd: core: Report error if first mtd_otp_size() call fails in mtd_otp_nvmem_add()
config: arm-randconfig-2200-20261105 (https://download.01.org/0day-ci/archive/20261106/202611060606.xbU3zu11-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.3.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202611060606.xbU3zu11-lkp@intel.com/

smatch warnings:
drivers/mtd/mtdcore.c:955 mtd_otp_nvmem_add() warn: missing unwind goto?

vim +955 drivers/mtd/mtdcore.c

4b361cfa862479 Michael Walle 2021-04-24  936  static int mtd_otp_nvmem_add(struct mtd_info *mtd)
4b361cfa862479 Michael Walle 2021-04-24  937  {
26358f330405af Michael Walle 2023-03-08  938  	struct device *dev = mtd->dev.parent;
4b361cfa862479 Michael Walle 2021-04-24  939  	struct nvmem_device *nvmem;
4b361cfa862479 Michael Walle 2021-04-24  940  	ssize_t size;
4b361cfa862479 Michael Walle 2021-04-24  941  	int err;
4b361cfa862479 Michael Walle 2021-04-24  942  
4b361cfa862479 Michael Walle 2021-04-24  943  	if (mtd->_get_user_prot_info && mtd->_read_user_prot_reg) {
4b361cfa862479 Michael Walle 2021-04-24  944  		size = mtd_otp_size(mtd, true);
534fd7770b6dde Aapo Vienamo  2024-03-13  945  		if (size < 0) {
534fd7770b6dde Aapo Vienamo  2024-03-13  946  			err = size;
534fd7770b6dde Aapo Vienamo  2024-03-13  947  			goto err;

This goto err is wrong.  We haven't done the register so it should
return directly.

534fd7770b6dde Aapo Vienamo  2024-03-13  948  		}
4b361cfa862479 Michael Walle 2021-04-24  949  
4b361cfa862479 Michael Walle 2021-04-24  950  		if (size > 0) {
4b361cfa862479 Michael Walle 2021-04-24  951  			nvmem = mtd_otp_nvmem_register(mtd, "user-otp", size,
4b361cfa862479 Michael Walle 2021-04-24  952  						       mtd_nvmem_user_otp_reg_read);
4b361cfa862479 Michael Walle 2021-04-24  953  			if (IS_ERR(nvmem)) {
26358f330405af Michael Walle 2023-03-08  954  				dev_err(dev, "Failed to register OTP NVMEM device\n");
4b361cfa862479 Michael Walle 2021-04-24 @955  				return PTR_ERR(nvmem);
4b361cfa862479 Michael Walle 2021-04-24  956  			}
4b361cfa862479 Michael Walle 2021-04-24  957  			mtd->otp_user_nvmem = nvmem;
4b361cfa862479 Michael Walle 2021-04-24  958  		}
4b361cfa862479 Michael Walle 2021-04-24  959  	}
4b361cfa862479 Michael Walle 2021-04-24  960  
4b361cfa862479 Michael Walle 2021-04-24  961  	if (mtd->_get_fact_prot_info && mtd->_read_fact_prot_reg) {
4b361cfa862479 Michael Walle 2021-04-24  962  		size = mtd_otp_size(mtd, false);
4b361cfa862479 Michael Walle 2021-04-24  963  		if (size < 0) {
4b361cfa862479 Michael Walle 2021-04-24  964  			err = size;
4b361cfa862479 Michael Walle 2021-04-24  965  			goto err;
4b361cfa862479 Michael Walle 2021-04-24  966  		}
4b361cfa862479 Michael Walle 2021-04-24  967  
4b361cfa862479 Michael Walle 2021-04-24  968  		if (size > 0) {
4b361cfa862479 Michael Walle 2021-04-24  969  			nvmem = mtd_otp_nvmem_register(mtd, "factory-otp", size,
4b361cfa862479 Michael Walle 2021-04-24  970  						       mtd_nvmem_fact_otp_reg_read);
4b361cfa862479 Michael Walle 2021-04-24  971  			if (IS_ERR(nvmem)) {
26358f330405af Michael Walle 2023-03-08  972  				dev_err(dev, "Failed to register OTP NVMEM device\n");
4b361cfa862479 Michael Walle 2021-04-24  973  				err = PTR_ERR(nvmem);
4b361cfa862479 Michael Walle 2021-04-24  974  				goto err;
4b361cfa862479 Michael Walle 2021-04-24  975  			}
4b361cfa862479 Michael Walle 2021-04-24  976  			mtd->otp_factory_nvmem = nvmem;
4b361cfa862479 Michael Walle 2021-04-24  977  		}
4b361cfa862479 Michael Walle 2021-04-24  978  	}
4b361cfa862479 Michael Walle 2021-04-24  979  
4b361cfa862479 Michael Walle 2021-04-24  980  	return 0;
4b361cfa862479 Michael Walle 2021-04-24  981  
4b361cfa862479 Michael Walle 2021-04-24  982  err:
4b361cfa862479 Michael Walle 2021-04-24  983  	nvmem_unregister(mtd->otp_user_nvmem);
4b361cfa862479 Michael Walle 2021-04-24  984  	return err;
4b361cfa862479 Michael Walle 2021-04-24  985  }

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

