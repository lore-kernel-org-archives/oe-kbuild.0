Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD1830F544
	for <oe-kbuild@lists.linux.dev>; Mon,  1 Sep 2025 10:27:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756722429; cv=none; b=q65Bt6FO8h44G5BovJg/YQYudXdoqLV9K8s62+/ZXONAaxwsvneke6S5nBJ5s6WQVNcaP5aNXvVHibzXkDm2s+cKoJ8kvjeHaQzHWFUd9/1XsqfqysXj4I6eZjfXemuZ+7H9Ysb0lNKvDBDcwRP1oq0+gsgFXxmJ4oNwyOw/xFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756722429; c=relaxed/simple;
	bh=6h/YI/Py/XlG4xBbZJ7thzV4uG9Z0BsZDM3FqQjDBdE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=BGXQ1jUOkqrJyC12C3u4f1zJohYOU8X/ym2oTOP/mZRzeytNgVy75DCqsR49m/XR3cNVaxcz0nldCuRmnaURHv6bJx3MjHBmV/ZqAGHETJ2/V30lisCdkisgbtiaGom+NNPD12DkZVRav5uJksGKCdEfe2BxLHMD8zpbx7SeUzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AzsDycdw; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AzsDycdw"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3d3fa21a77fso875964f8f.3
        for <oe-kbuild@lists.linux.dev>; Mon, 01 Sep 2025 03:27:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1756722425; x=1757327225; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U3wMAXUg6TcQMtXg5Lgxugiws7d3wfWBJLDrvyAva+k=;
        b=AzsDycdwnxdOueuZOxw7TMJPm14R27Thq9gTMoS9VW8naxp+QyPnt8ktFkJjzkWudI
         tBgVqEQjRS3nYFYfReoDep0kreFxz1sGGanZvRARhfWxL4Av1MPmsuHxx5AJ+MZ8p5fS
         UZeYQysmhqltDGCmopG8gbdZUYSxzMTJ4IFeMPG//AZ5enHa6lSVBFm/lRMfl2WAdA6k
         9LnkrfUn7TG1vhvMXl8OrTaXS1gojgKNoYMzBUFCdGfGu79nDmBkuxmX+dt0vOFzpEoI
         XeFERvAAISZDaTDOHE/RcrYO/DKwQqLGJZpAv9nV3JOYYBWOTadfaO8L/F+bQ13QEWP1
         m5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756722425; x=1757327225;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U3wMAXUg6TcQMtXg5Lgxugiws7d3wfWBJLDrvyAva+k=;
        b=CtBIv5wHtLOFw8F3wSCz7BrY2FVDoEMlbAFYxs5o7hBdNoxkUUmfSzZNsqEZ8JE609
         4UdcKZcbykM2C3MHEc8+VuJzs+2O+InV8DvgmDnfOxViro/D+YYe6Ry78hCMKWSR3FUq
         2Lucqz7qNNLbQyGcWbgjuY8+yTqmrsXYD9iQAa39E0RrT625Yi1bVwUum2Eb3pARF4Gd
         IgiOST/HayMAv1LmGr45v/H5Z5QrTzAUY4/cBUdWkd1zWCOSs6oH62ssqHAqxBHsmMgY
         RdI8J3lBJj+2KE8ae1tRu2QGYFhtvBjDqYX3PS6gDA6UOIkzlITpvPzqqMOFad0Rt/nl
         dnAQ==
X-Gm-Message-State: AOJu0YyNivSWj9QchZNO1PsYTJ2YG4xJDhcRYMY9bVbKKO6pSf4lSdLQ
	9SKWQ4njtuWHlLOmDE6xGYkXS+Vy54x4WMKFKsP98yCRqI2fJCfaTKhZ0o7M3WSPZB9fbt7FAgd
	WDUrW
X-Gm-Gg: ASbGnculBBlvNUY7lQKG540qAAp+Wl3duQVC8AjCh3h7zNhIujrNpNJqEyjiKeNqjHb
	NPvOfxR93cPXgBKCMmLCVwSMFdQEgxsXEgE02IqwKFu0PFX0Hhsag4M7dvOqPWtCFTK6jjQhtpK
	YZSh51oUr0UTPYcUruymLFqQxhgudPRl8k8gOYAB5qfMFNhp3ULP7bAO9Pm/wLmv80g3pHBe0aA
	45CqxS1XxwFE+w0dzB9IQkQLaH4IYvRjhAAqNNe53+q+e1C3BPMig2TbIj5qohTOlarLIJeYmYS
	iluvBMwoiQxWdhulcK0Hf+JCbXUAGqnCR4PuN8YYPaWAp8/EbHsFvFCk9+ZVMg9kN7fI5wD1oZd
	/iLyLMZfpzbN19ae1p9gA55vhsCJcGO66waVT+A==
X-Google-Smtp-Source: AGHT+IE2RqWOouUNKF0LuMwYDv8VNEg+V4AVmzf6zsck7npghoz21h/jWKBn3nN0q+raGVTCFFwHxQ==
X-Received: by 2002:a05:6000:2510:b0:3d7:7def:8435 with SMTP id ffacd0b85a97d-3d77def8d9dmr1055874f8f.18.1756722425227;
        Mon, 01 Sep 2025 03:27:05 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3cf34493b8csm14441165f8f.59.2025.09.01.03.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Sep 2025 03:27:04 -0700 (PDT)
Date: Mon, 1 Sep 2025 13:27:01 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jisheng Zhang <jszhang@kernel.org>,
	Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 10/14] dmaengine: dma350: Alloc command[] from dma pool
Message-ID: <202508291556.kjNumYgR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823154009.25992-11-jszhang@kernel.org>
Message-ID: <20250901102701.HS83KJToejihYmgbiFdd_Q-eLNdyGhgsECO0J8DgZJk@z>

Hi Jisheng,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jisheng-Zhang/dmaengine-dma350-Fix-CH_CTRL_USESRCTRIGIN-definition/20250824-000425
base:   https://git.kernel.org/pub/scm/linux/kernel/git/vkoul/dmaengine.git next
patch link:    https://lore.kernel.org/r/20250823154009.25992-11-jszhang%40kernel.org
patch subject: [PATCH 10/14] dmaengine: dma350: Alloc command[] from dma pool
config: arm-randconfig-r073-20250829 (https://download.01.org/0day-ci/archive/20250829/202508291556.kjNumYgR-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202508291556.kjNumYgR-lkp@intel.com/

smatch warnings:
drivers/dma/arm-dma350.c:387 d350_get_residue() error: uninitialized symbol 'sgcur'.

vim +/sgcur +387 drivers/dma/arm-dma350.c

5d099706449d54 Robin Murphy  2025-03-12  360  static u32 d350_get_residue(struct d350_chan *dch)
5d099706449d54 Robin Murphy  2025-03-12  361  {
eae79fde2ff50c Jisheng Zhang 2025-08-23  362  	u32 res, xsize, xsizehi, linkaddr, linkaddrhi, hi_new;
eae79fde2ff50c Jisheng Zhang 2025-08-23  363  	int i, sgcur, retries = 3; /* 1st time unlucky, 2nd improbable, 3rd just broken */
eae79fde2ff50c Jisheng Zhang 2025-08-23  364  	struct d350_desc *desc = dch->desc;
5d099706449d54 Robin Murphy  2025-03-12  365  
5d099706449d54 Robin Murphy  2025-03-12  366  	hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
5d099706449d54 Robin Murphy  2025-03-12  367  	do {
5d099706449d54 Robin Murphy  2025-03-12  368  		xsizehi = hi_new;
5d099706449d54 Robin Murphy  2025-03-12  369  		xsize = readl_relaxed(dch->base + CH_XSIZE);
5d099706449d54 Robin Murphy  2025-03-12  370  		hi_new = readl_relaxed(dch->base + CH_XSIZEHI);
5d099706449d54 Robin Murphy  2025-03-12  371  	} while (xsizehi != hi_new && --retries);
5d099706449d54 Robin Murphy  2025-03-12  372  
eae79fde2ff50c Jisheng Zhang 2025-08-23  373  	hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
eae79fde2ff50c Jisheng Zhang 2025-08-23  374  	do {
eae79fde2ff50c Jisheng Zhang 2025-08-23  375  		linkaddrhi = hi_new;
eae79fde2ff50c Jisheng Zhang 2025-08-23  376  		linkaddr = readl_relaxed(dch->base + CH_LINKADDR);
eae79fde2ff50c Jisheng Zhang 2025-08-23  377  		hi_new = readl_relaxed(dch->base + CH_LINKADDRHI);
eae79fde2ff50c Jisheng Zhang 2025-08-23  378  	} while (linkaddrhi != hi_new && --retries);
eae79fde2ff50c Jisheng Zhang 2025-08-23  379  
eae79fde2ff50c Jisheng Zhang 2025-08-23  380  	for (i = 0; i < desc->sglen; i++) {
eae79fde2ff50c Jisheng Zhang 2025-08-23  381  		if (desc->sg[i].phys == (((u64)linkaddrhi << 32) | (linkaddr & ~CH_LINKADDR_EN)))
eae79fde2ff50c Jisheng Zhang 2025-08-23  382  			sgcur = i;

I'm suprised there isn't a break statement after this assignment.
What if we exit the loop with i == desc->sglen?

eae79fde2ff50c Jisheng Zhang 2025-08-23  383  	}
eae79fde2ff50c Jisheng Zhang 2025-08-23  384  
5d099706449d54 Robin Murphy  2025-03-12  385  	res = FIELD_GET(CH_XY_DES, xsize);
5d099706449d54 Robin Murphy  2025-03-12  386  	res |= FIELD_GET(CH_XY_DES, xsizehi) << 16;
eae79fde2ff50c Jisheng Zhang 2025-08-23 @387  	res <<= desc->sg[sgcur].tsz;
                                                                 ^^^^^
Uninitialized.

eae79fde2ff50c Jisheng Zhang 2025-08-23  388  
eae79fde2ff50c Jisheng Zhang 2025-08-23  389  	for (i = sgcur + 1; i < desc->sglen; i++)
eae79fde2ff50c Jisheng Zhang 2025-08-23  390  		res += (((u32)desc->sg[i].xsizehi << 16 | desc->sg[i].xsize) << desc->sg[i].tsz);
5d099706449d54 Robin Murphy  2025-03-12  391  
eae79fde2ff50c Jisheng Zhang 2025-08-23  392  	return res;
5d099706449d54 Robin Murphy  2025-03-12  393  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

