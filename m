Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 945222DAFC2
	for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 10:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769594863; cv=none; b=SiCWdOAUPgemJaPdFKyn4EhWWoQGvC1kM7mbNUtvSxsmMGBRbKY1YnqCTKf69IdnGSVbmDR9rlUVkeZFC63ZFPOBUpQthUDrFzobdZ7BtYu6LHXOsf9Vbcn71d2dNcbatFeFHdxFH0Fbkh3LWZwZifN1rsifUWtdogZfUb+15Ok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769594863; c=relaxed/simple;
	bh=YOecbPkFa2mSRbQzpNpm2bvfMt1qa5t0AXAKK01ACS0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n6KSZOEhbOfMcyno2x41/cAnDNuiTV+Pxczxebft4S1p1XkvmZAV2w2WpOHYNdK8OMebnvDOc1X34pMXUN9rbfGKgYD/Z+jp4PioQiNXk1tGQv5L5lz99Iozf+DMSAPs5J/fffAPaMvL8mEHE2YpAaM+X7hQmHo6nwRcSxEev7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oVE7Gaw+; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oVE7Gaw+"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-480142406b3so45471435e9.1
        for <oe-kbuild@lists.linux.dev>; Wed, 28 Jan 2026 02:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769594860; x=1770199660; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OBbkxn7FhIqHEOHwwXRKJ76XSeZTBkWvD/6xON7QxX8=;
        b=oVE7Gaw+CZnhQ6kSt0qvanjbiPS8tniB6aPf5yYbJJfglLbdds+/dPZvjHGE/fZWi2
         S7qBMDoUN5wGyXayyjjfUdCwsNAyTlfwu9gVZuRRhv8Lx5iD7nWs/KdgdnjkcfcmklIy
         Weu8pgWs8IeI9/Nssl+g0fhthX5aUEcHNaBL9ukLWDwJpoTI6JX9WKcy3A7g7bM0cRcj
         pejd4JnICujApBNrO/wiU6LjNemVTXN2xR+X/uhBpXQmfMTEpm27pKF7P1wtl0Qirwqa
         afcxY/AX0/aEMxY2gJNHVpcbu8F20JJuSAJL4cscw23d7GX7mQKx9O/ml/nWI7cY0lJD
         uTWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769594860; x=1770199660;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OBbkxn7FhIqHEOHwwXRKJ76XSeZTBkWvD/6xON7QxX8=;
        b=avk6RGBuCkbr1prYDW5REQyuCM7kqZ4oSzq9QyIvMRWWkA1NnABjN+V1eHt7QzkrKz
         r0D88bb3Da66e+enP2JKCyVVPJk09u9Hd5YIHS/ZVnADJ86OxkkrL4gKO+srQY6hE1eZ
         I2FUVQggJfhgjl6GJ0n29K98jV9nV7xuaPko+eNOZI91jakkniSfGBFjeC6D7VhJW+Ml
         oKNayzRivuu0Tc7tYkKamIJmmOR280ti2tYZet/qQ5QrP/POHqo0la5mubkIxJWAfsED
         tNSKiq50WokRqVLZOTjKIZEWkzhyGy7/p/NX3KiBujAxNWaeoA17w47a+B3Kl5njTud7
         dkzw==
X-Gm-Message-State: AOJu0Yw5rpv9HEbzaMtRn7ON0YaoTUDNZYRDJAdnUoDvU/2sv3kegEc2
	C8pbrv8sC95g8gFh12Y5F7biU8HEzPS49PTM/ePKnXi4Li0YKBO8XXZqi9/BzRaF3aTKh8+8NTl
	OSafeYrk=
X-Gm-Gg: AZuq6aIYJ6K501exLfmPIoE5bRVRP3DRq+xt7kq12XfzAwPTclfIkG0yYb+7USO7RVC
	BhqorEGfhnoeP1YdQa4Ek5sb0l5NJquwqEN8LMl4irm1fBXxADsm5vZsO9r4ZwQ2qu7AIFfIcsY
	W7scpiFBDToNezZv1MGF9fuTGWJln3Nw1X321Xg0P/RTAgl7bbAO8DSwq8iGlNJs+aCAqTj8YAf
	IE4cKoXRKLicDUDcu1mSwv/9stbIv3VjqkVWvNXBjHO5qnP7mIyMVmy8x1D0LOXXSdXrkOH00YO
	slSe+B+fbKUF1rYtl+pOgLmLqiT93q0E1uq26z37XbGYXhvsCPmhlF+mn52TwqlP0xBAUpOCUn8
	YniNPwNqz+zAx9CGF0yaZrsaYsEiU6zq8nJBbL2x/QJiKUphRELjpniSmqAHlupJ2Xm8VuiFfNe
	eyvRVFaJWrvB3mN/4Y0XRtb/leW/w=
X-Received: by 2002:a05:600c:8b16:b0:480:4a8f:2d5c with SMTP id 5b1f17b1804b1-48069c57024mr54698365e9.29.1769594859689;
        Wed, 28 Jan 2026 02:07:39 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806d98b4e7sm5544235e9.4.2026.01.28.02.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 02:07:39 -0800 (PST)
Date: Wed, 28 Jan 2026 13:07:35 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev,
	Tanmay Kathpalia <tanmay.kathpalia@altera.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Dinh Nguyen <dinguyen@kernel.org>
Subject: [dinguyen:socfpga_sd6hc_support_v1 4/11]
 drivers/mmc/host/sdhci-cadence6.c:956 sdhci_cdns6_hw_reset() warn: potential
 ! vs ~ typo
Message-ID: <202601260038.9v4gbyGL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260128100735.DoLZjP1XZxvhhM8nTljsMK-eWpdOAgLpDw7gE_t5tZs@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dinguyen/linux.git socfpga_sd6hc_support_v1
head:   a79ac29af37c6923eb8f16457c8d10a545fbcc61
commit: d7c721b1149a4f280ca061566acc95b52df2d351 [4/11] mmc: sdhci-cadence: add Cadence SD6HC support
config: i386-randconfig-r071-20260125 (https://download.01.org/0day-ci/archive/20260126/202601260038.9v4gbyGL-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601260038.9v4gbyGL-lkp@intel.com/

smatch warnings:
drivers/mmc/host/sdhci-cadence6.c:956 sdhci_cdns6_hw_reset() warn: potential ! vs ~ typo

vim +956 drivers/mmc/host/sdhci-cadence6.c

d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  948  void sdhci_cdns6_hw_reset(struct sdhci_host *host)
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  949  {
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  950  	struct sdhci_cdns_priv *priv = sdhci_cdns_get_priv(host);
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  951  	void __iomem *reg;
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  952  
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  953  	reg = priv->hrs_addr + SDHCI_CDNS_HRS11;
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  954  	writel(SDHCI_CDNS_HRS11_EMMC_RST, reg);
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18  955  	udelay(9);
d7c721b1149a4f2 Tanmay Kathpalia 2026-01-18 @956  	writel(!SDHCI_CDNS_HRS11_EMMC_RST, reg);

SDHCI_CDNS_HRS11_EMMC_RST is BIT(0) so this is !BIT(0).  Just
write zero if that is what's intended.  Otherwise it's a triple
negative.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

