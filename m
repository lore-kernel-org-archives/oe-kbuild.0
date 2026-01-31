Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1285C41C62
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 14:34:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769870071; cv=none; b=AxWgo89muSxPQa19lM+eEYZYvZHo9+2CItPOkdPy7U/QZfQbLeFvHcbr165y58S32WcnuRlO8qKXnOrfQC2Vh+Y4f5ZQDEeWLuQafrYemxQkW6BOO5mFKGQGTwB3nraxPtI6EciJhEqtrPZ2xuZL+pNxgKjLtD7CJZbpnTWjWOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769870071; c=relaxed/simple;
	bh=oJe0NcvJMaTyR62mE9pi1Nc8trO4/gp11pDxuMJ7E2A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ss90eumVociT/axJZmp5NO04eQ7wywRuwLgr5FCExJSVYt4mO7e8zPpRqHapP34laM8q/KLxdkOZaE0N42MBo9jmGlDQmqcR9wTjH2oIkbH/JtMhjMpVPkRBCxI5XD9fjVKy3XSahJoAbwiua8Yj6Sj1OUYqb0N2E4whPRdal4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zC8diWL2; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zC8diWL2"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48068ed1eccso27656755e9.2
        for <oe-kbuild@lists.linux.dev>; Sat, 31 Jan 2026 06:34:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769870068; x=1770474868; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGZE/FwI58g7fq6+rZcqOW9r8gwwvwF2Yhf/tTAm3u0=;
        b=zC8diWL2167EEg/YrFVS5jU1Cu4mtPBDZYddFkLHhJUyMtWduwy458A4ts9ZqqEJ9/
         dH0GaEJyFUO1ZSq7SVoHwyvo89FbE587SbYUlNixKO/tPTnM3AVdH6mpfsOq0GsR7+yB
         TUB9CwnqcVYq3FG2CmqGNvKwRU3j/nu3npEyKhsSloZD59u2m1boypLZNw0Hx2Kpyhp1
         tgWEZFciCrnZycxJfKhwmmKb0Fj6+AProEKKzVXls3epVSmbCw6cwoR6i5Vbjfr1kmTR
         qVrWXWrEQFBUjlFz76od7NZmnARfA3lbzWpUk9EaEoWLg9jb1zySLWMS8iPtVy+zkQMS
         Lsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769870068; x=1770474868;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGZE/FwI58g7fq6+rZcqOW9r8gwwvwF2Yhf/tTAm3u0=;
        b=dUYlI4NYH/wH1veUXRUNvKcjjNTbyDbsBsHfC/Qv793Hk52NcmbggUnbRp4oDaI7v6
         U5lfOZLjI4tVu0kNqAKv1N8xeNAw3u9EVs9zW8rn7IdWasC4h5R4XxryCiJLQyCHEEsT
         N8zovCLn2M7IIXtzNgn4bL1CXRIEspXFKIbxs8Z9cmPP0r1xlDFGWH+rfQjVW9a6xeca
         MPhgXISKCRGV+A9g3lXcxRP5WzdfdCNkpesSze3Q6SHGfRFmXOswAmd9a/pb83RnFOZg
         nB8t2fpZkkwTAdDPw7v4DCJUre1J6M02fdWaOVn7YR+knvsQUHj3L2WRl7a9VO5NLEKJ
         kLLg==
X-Gm-Message-State: AOJu0Yz5KXgSXJGM9njtXxn1nxyXatmDEhl97seWzbQ6ATf9iDZNyyu1
	yWNThdp1A/0+ij+6RultcBl8UqtZlz8CFyFPPDjI9ZzceMvXncRB25egwVxS2ZFoafFltQENPJp
	Kukea
X-Gm-Gg: AZuq6aKtU7b0t80cC5V6VkmL6ZgwclBaNFiG9mTKwiYJqUXsTAglumgepmvRgonKwpH
	25By/jW85h+9NcHu+Xpm0U/pXTFWO/sixAzTCXKAFMs5JaePJ1zyMmJ+nfycYR0U43Bf+u+jR3u
	UtudUHkV9iDPpayA98Fu3h1tjYUc/eM88TX3IG1Kqfx3yBiXRl9RHGQxP8Yy8HBkKDI38jjes8u
	KiSWqHHXu3LLxmnt72Cz+LzBvBPyNl2tGL/GJG1Wa8276KTzkP4s74DZEW7x0HHfQZDBlUv8T8c
	f3jOqOlB4uC5Dp/FTjNatElqOF53l/jkC8E0JJi+ik+ylRn0s3XzoL/n+jUTgzvMAOFWSYoA/rO
	QwsfkYVkDD3CBgzNOTLM3CFdOtrjNnMIziBHlLuDgw04UaSWnkJHxx4sexcyVhNpXgOeS4NdQt3
	YbvsmvIusb0Xs6UVnj
X-Received: by 2002:a05:600c:1c26:b0:47e:c562:a41f with SMTP id 5b1f17b1804b1-482db481c92mr84376595e9.18.1769870068280;
        Sat, 31 Jan 2026 06:34:28 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482e256f639sm39572795e9.13.2026.01.31.06.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Jan 2026 06:34:27 -0800 (PST)
Date: Sat, 31 Jan 2026 17:34:24 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, cros-kernel-buildreports@googlegroups.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 100/100]
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1750 a5xx_gpu_init() warn: variable
 dereferenced before check 'pdev' (see line 1743)
Message-ID: <202601311507.plKOLxfT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260131143424.MCBubqosRenIl_k3p275ZKw3W3rzCHA6W8ODw1NF5ZM@z>

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   33f6e289fb06b4b8ebf1124c1fad6b68aea9d8de
commit: 154bed0fd609e1c195d582ec3b6f647c5859acaf [100/100] drm/msm/a5xx: really check for A510 in a5xx_gpu_init
config: arm64-randconfig-r072-20260131 (https://download.01.org/0day-ci/archive/20260131/202601311507.plKOLxfT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
smatch version: v0.5.0-8994-gd50c5a4c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202601311507.plKOLxfT-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/msm/adreno/a5xx_gpu.c:1750 a5xx_gpu_init() warn: variable dereferenced before check 'pdev' (see line 1743)

vim +/pdev +1750 drivers/gpu/drm/msm/adreno/a5xx_gpu.c

b5f103ab98c77ca Jordan Crouse    2016-11-28  1739  struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
b5f103ab98c77ca Jordan Crouse    2016-11-28  1740  {
b5f103ab98c77ca Jordan Crouse    2016-11-28  1741  	struct msm_drm_private *priv = dev->dev_private;
b5f103ab98c77ca Jordan Crouse    2016-11-28  1742  	struct platform_device *pdev = priv->gpu_pdev;
154bed0fd609e1c Dmitry Baryshkov 2023-04-09 @1743  	struct adreno_platform_config *config = pdev->dev.platform_data;
                                                                                                ^^^^^^
Dereferenced

b5f103ab98c77ca Jordan Crouse    2016-11-28  1744  	struct a5xx_gpu *a5xx_gpu = NULL;
b5f103ab98c77ca Jordan Crouse    2016-11-28  1745  	struct adreno_gpu *adreno_gpu;
b5f103ab98c77ca Jordan Crouse    2016-11-28  1746  	struct msm_gpu *gpu;
02891701516b247 Adam Skladowski  2023-03-14  1747  	unsigned int nr_rings;
b5f103ab98c77ca Jordan Crouse    2016-11-28  1748  	int ret;
b5f103ab98c77ca Jordan Crouse    2016-11-28  1749  
b5f103ab98c77ca Jordan Crouse    2016-11-28 @1750  	if (!pdev) {
                                                            ^^^^^
Checked too late.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

