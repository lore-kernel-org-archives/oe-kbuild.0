Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D72B520B1F7
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Dec 2024 15:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733325262; cv=none; b=T+avXuZURgJNvC8z6Vw258C3eMsCINsYVef+eMUFF2aSdN9HuuXMnAMgqWb1qacvuNyIlmsoxHdGRyVPvgKkzsd4fmzb/YJMPf2xbHVsbIVtJ6P9ArQlaIMwe+JvBkm+ZT5cMKwbauGWWmpewkXDIClQkOnd8u+YSDdrdUVj2zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733325262; c=relaxed/simple;
	bh=EvXM02tO6yjyKm/Jwl4qSn9ESvQ4Qu0hdnvG8bDmZu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uAJzmqKglwbm8kj1BCPW1obm7tl0EiybUZG6ieI4/RjCTVfuoveIBkFfhnz1skVGe3tjwF/rxKfnHnI6gllB1BFw31BDp8k6H0fMlkeja0fF2Vn+lgqffsq7RTaFVcCeRkXoF0KI1dbI+k6UfWdCDr9CdKCLvbMENGtH6JHUrpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qzC0+Qmy; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qzC0+Qmy"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9f1c590ecdso1189445466b.1
        for <oe-kbuild@lists.linux.dev>; Wed, 04 Dec 2024 07:14:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733325257; x=1733930057; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZiMvEGOnA3x8ktWeqDOREzwrlUTrCkUJYsXv6kLLcLI=;
        b=qzC0+QmyxK+vqhxi17/JPOicrNS0rRbJxYD9Vv2u3uIIn+VjXNQSeFbOSaeBAV3+cC
         M9pXqiviWCo6Ord0X3wD/ksH4FUVD89MDCrXvNcuRw8yW7gTnts4ZseiaiVf1Y0n+xcz
         Mlu0hM6AuDFyFK+CF/E/0aE9DAwzIFQi7FAYAEk73QteEI5QR+ZFhQ6gUI/5Fi6RMhMA
         STI6khjPWwZUeE9q632UWShtaa6peRLfNE/7rTn+6SOlcUfj4Bcb1ldHU5KRsOAEdr8V
         PMBv5t0yJB2AcX9U7ndskkEug7yAcIEVBjU521vV26skC3c8aWa+vbL0zXeK1tAaUwbv
         IgcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733325257; x=1733930057;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZiMvEGOnA3x8ktWeqDOREzwrlUTrCkUJYsXv6kLLcLI=;
        b=bUKKXOFEAJUYvwowtcUFLwqxDcCPufY0Oc/BgQjVcN1fHqprDxF/wYmoVVpJzAw6yV
         JB1Cyt/puCfBAEoTkiC3aGWePNctLZZn8AQKXpNiMgF47JBib9I8siQglj/4OzeBg+NS
         MQzj4jA8EkdKGG9LYtrrWTSsX53ROUfHQkwF0t2b22AM9akCPSfIa65gmxdGak9+clG9
         z/TF/yiH8xCzun8H04kiGXPQHE7+TeUSY8XommdYN/kf29ZY4XgjXST3/d8tYZiUfGLF
         mhD3VgRbgTy8isGsSisIY4VvlWk7v3NO50+qBCaf37Z67xrYGCwD8Su++CnJGoRNctAR
         3J8w==
X-Gm-Message-State: AOJu0Yx1Kr2p91DbipI0d4iBmavNglsMPPkynmz0f+/29e37ufCIqehV
	WnrDoJLLgBntvVwcdXf2Yc0aMfbB9HKTKY+vM4zt1/CzH+Jr5y9gRan0gZc/GbmUHctJEruT1tZ
	V
X-Gm-Gg: ASbGncvZDXHZ/A8zzDrqDZcRkUphi+aY4U9UexOkTqWWRhLz1vbbg+POKQpL9KT//1W
	natZYqn4KAWcJDWqElpfW9IbB49o8Ja9qGMYhA+4KIz45ZiU06r6dkKXoGAyvmSKFJ7uX8h6Yqh
	ofdsvwDYGASiSw9fbz4S/l8b4LtzzIuadfj4z7x9rFsE6oeJ3VlR79SQjWgBn5gJvwx/GSw1qkA
	8yinFQ+h9bUcFBSIFyMYnQ2wBUkNNmMmUxbIO+WoN+PH1nlVQao31lKF45J5k+HzBYK3T0sew==
X-Google-Smtp-Source: AGHT+IHbdn++zxupMPsIv4w/y2HdWMryceH/LpF4wX4mLdWemSgp6CuJQnWo+ftPXRvxTNtQzIB0dQ==
X-Received: by 2002:a17:907:7719:b0:aa5:249f:8431 with SMTP id a640c23a62f3a-aa5f7d4ed63mr634753666b.18.1733325257169;
        Wed, 04 Dec 2024 07:14:17 -0800 (PST)
Received: from localhost (hdeb.n1.ips.mtn.co.ug. [41.210.141.235])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d12136e9f9sm254760a12.44.2024.12.04.07.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 07:14:16 -0800 (PST)
Date: Wed, 4 Dec 2024 18:14:12 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Simon Horman <horms@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: drivers/remoteproc/pru_rproc.c:341 pru_rproc_set_ctable() warn:
 variable dereferenced before IS_ERR check 'rproc' (see line 335)
Message-ID: <f5bd0861-abaa-4e9a-89af-deb682df8641@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Simon,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   feffde684ac29a3b7aec82d2df850fbdbdee55e4
commit: e752f9b924a1fd1afcf36e51b03dfa9c3096a3bd soc: ti: pruss: Allow compile-testing
config: alpha-randconfig-r072-20241122 (https://download.01.org/0day-ci/archive/20241204/202412042058.zwL1rOlr-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202412042058.zwL1rOlr-lkp@intel.com/

smatch warnings:
drivers/remoteproc/pru_rproc.c:341 pru_rproc_set_ctable() warn: variable dereferenced before IS_ERR check 'rproc' (see line 335)

vim +/rproc +341 drivers/remoteproc/pru_rproc.c

102853400321bae Roger Quadros   2023-01-06  333  int pru_rproc_set_ctable(struct rproc *rproc, enum pru_ctable_idx c, u32 addr)
102853400321bae Roger Quadros   2023-01-06  334  {
102853400321bae Roger Quadros   2023-01-06 @335  	struct pru_rproc *pru = rproc->priv;
                                                                                ^^^^^^^^^^^
Dereference

102853400321bae Roger Quadros   2023-01-06  336  	unsigned int reg;
102853400321bae Roger Quadros   2023-01-06  337  	u32 mask, set;
102853400321bae Roger Quadros   2023-01-06  338  	u16 idx;
102853400321bae Roger Quadros   2023-01-06  339  	u16 idx_mask;
102853400321bae Roger Quadros   2023-01-06  340  
102853400321bae Roger Quadros   2023-01-06 @341  	if (IS_ERR_OR_NULL(rproc))
                                                                           ^^^^^
Checked too late

102853400321bae Roger Quadros   2023-01-06  342  		return -EINVAL;
102853400321bae Roger Quadros   2023-01-06  343  
102853400321bae Roger Quadros   2023-01-06  344  	if (!rproc->dev.parent || !is_pru_rproc(rproc->dev.parent))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

