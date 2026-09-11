Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC85A47124C
	for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 12:23:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789129419; cv=none; b=N9UuWDmlh1pscSCbRIKmJ84WuUXsBBaS3l3bMa/OcZd8e4ik2HqRK/ZFknEHqvUtfG0VOhBne/B3NS0YztayS5Isx+3m8FRpx0VQzorUuzgqkzDYtccOgMJPlpoIGP+RJ3zhdhKg7lB7HLklWe1xFUf+J9IrsyyMah9TYZtx4Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789129419; c=relaxed/simple;
	bh=WMg5pNKFeS/3Df03be8/j7ACkOJBdxGDH4qU5fGArMQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=oN/DfXI+HoUQJdFu5CaQfpvSJNrk0kT5Acjtz6SRS8MzgkpX538owIfODFmHigNsh0cKqVQ8YFSOfbf9I+7X8TmUYDPu4HEKy/uZ1Nsc4hVNdz+f5Xxn/v+MnzpFuEHvd3pv89NNNECQ+ytEh1R/W24JEhkJ/mKyFjlXAjrax7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTuAgD1A; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTuAgD1A"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48586861639so348534f8f.0
        for <oe-kbuild@lists.linux.dev>; Fri, 11 Sep 2026 05:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789129412; x=1789734212; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PpMXHaFF1JIW3abETAGrUWAAHuJWrnkzeYHOUDUyhbo=;
        b=nTuAgD1Au/hjH9iWY2v5J5AxLk1+QXkXsRCvLGldpI4MQP+wgOCsaFIl9haBoVuqEq
         h3t4UpdWiLueQuWxlzejl9QhP2Tb6qRkzuiMYDC5VWMo+muqyHUMIlfe8a2YUMNkScSK
         HRcH8ALxHT3nm2KdF4LdxWkB6FpIZ3YlFiuxPX9UYqxpVpizme9cHvNlQmxfx+ioW8Pf
         6HcfdVAu9QuhyHasNW7PqWAbFJljbTQHQTROmHd44wxkXPvQUox+7neOmkzxGWH/OsX5
         Uaz+xtmgdLGZnQFz8WEJR2euouDdeb+ByK0YC+ASTYcKGaT7C6YDc7FLQ4LJuOu0zxqS
         nLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789129412; x=1789734212;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PpMXHaFF1JIW3abETAGrUWAAHuJWrnkzeYHOUDUyhbo=;
        b=Em6xHEyLI5DUbqsYYayncc6g+bxHLWUqTwCiWPJupfOnop9R2AggFGFj0OiwBidPB6
         fz1xj/ETdJJPIiZycd9TlolXG5FpA0tsrxi8yjoBmzEJicyKSy+RGVNYEhR5hP32XztA
         MQ2wCok9aY0i4krcDIKVeQcFWg6iMUp3aLG20teO9oe0m+EGRuF4YzW0vDhSjCgBiCaa
         Af2EHex0QBGVrYNq0C0Ls6PWPpEhwrs/1XZmU7U/L6bxnpyp7SvRsZ4el03Dqs7nXUPL
         3C3248aIZzQxvHZYhykBliFVa0meliYjJJbYTvmzb2AbPUjLuIr9qfTBsVlLaOtPO107
         4rrQ==
X-Gm-Message-State: AFuF++nBUvIvyQ3g26EBUeh1F95T7Xhy4vaHIlxi15F1QE8LH/SbdYvB
	WcUV0H3wP3OHHLT/RUaX7bKWMpDzoyDfVFx0kN/82QgyqK6T9v29Rqv7BZGKtBdvn18duQ==
X-Gm-Gg: AYBFou29nd0LhhzlXfl/0DWDPWd/l5RTRm750CeNTdFWYtGOEh+XePPv5r7vK0vOg5Q
	mr+DM3W5dpD0QV3ssDAVm+YojpKcc3imxwh3RyiloGE/4xTQye+TVomuo4K7wt4curp6u9S1TLI
	lkULxnx0yqrybMtKGz3xZFjI9VibjET5FrOgORDrLvPV1Lf5vMxzSxKPXCWw9E41Tyqfv0a8+Hp
	iRu6AbHj0hXth0LqBfYiMejjC1zS80/3aCZL4SVjARaQhOzWhNkNZ3T1SbZIJ6RLvW+kR1waaVD
	SiCQBeVoFANY8Ycu07EkJlpqUt5qiCN3pUPCUlX4oRnxggvHHmNFke8QGDnmEwDAewcKGXQsx70
	WmpoDBWvaG5TEa1MjkYO/z7zYce6ti2hNvqM8+oPkCA/AzWF+3wllHlSCxo3iLTZ0GK5IDoQ8Bd
	6QvPLkB2hGxeEOuCMdr0VCzMK3CLjKsk05FdLf6HNSIEaFPLPfr7Doz+n4fuiK+21HFAA=
X-Received: by 2002:a05:6000:2311:b0:485:8d9c:47d2 with SMTP id ffacd0b85a97d-486e0f955c8mr11792035f8f.30.1789129411941;
        Fri, 11 Sep 2026 05:23:31 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb34e608sm5870255f8f.23.2026.09.11.05.23.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 05:23:31 -0700 (PDT)
Date: Fri, 11 Sep 2026 15:23:28 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, arm@kernel.org
Subject: [soc:board-remove-7.3 182/295] drivers/hwmon/ads7828.c:121
 ads7828_probe() warn: if statement not indented
Message-ID: <202609111050.oiut4oST-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260911122328.G71bN3BFl98XjiPrEdlMBcT1vn1oqAtOo5rTU575C7A@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git board-remove-7.3
head:   cf983087c51a9c74c3d4d3b353eb811ae5030823
commit: 4df92b98525f08e1eab92a25f5da2045c78403e8 [182/295] hwmon: asd7828: remove pdata based probing
config: arm-randconfig-r071-20260911 (https://download.01.org/0day-ci/archive/20260911/202609111050.oiut4oST-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609111050.oiut4oST-lkp@intel.com/

smatch warnings:
drivers/hwmon/ads7828.c:121 ads7828_probe() warn: if statement not indented

vim +121 drivers/hwmon/ads7828.c

5812f9283e6213 Steve Hardy              2008-01-22  116  
a8ddfea09566c3 Sam Povilus              2017-03-29  117  	diff_input = of_property_read_bool(dev->of_node,
a8ddfea09566c3 Sam Povilus              2017-03-29  118  					   "ti,differential-input");
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  119  	vref_uv = devm_regulator_get_enable_read_voltage(dev, "vref");
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  120  	if (vref_uv < 0) {
fddb5ceaf901b0 Qingshuang Fu            2026-08-05 @121  		if (vref_uv != -ENODEV)
fddb5ceaf901b0 Qingshuang Fu            2026-08-05  122  		return vref_uv;

Add another tab before the return.

fddb5ceaf901b0 Qingshuang Fu            2026-08-05  123  	} else {
a8ddfea09566c3 Sam Povilus              2017-03-29  124  		vref_mv = DIV_ROUND_CLOSEST(vref_uv, 1000);
a8ddfea09566c3 Sam Povilus              2017-03-29  125  		if (vref_mv < ADS7828_EXT_VREF_MV_MIN ||
a8ddfea09566c3 Sam Povilus              2017-03-29  126  		    vref_mv > ADS7828_EXT_VREF_MV_MAX)
a8ddfea09566c3 Sam Povilus              2017-03-29  127  			return -EINVAL;
a8ddfea09566c3 Sam Povilus              2017-03-29  128  		ext_vref = true;
a8ddfea09566c3 Sam Povilus              2017-03-29  129  	}
--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

