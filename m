Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3D8B13A897
	for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 13:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716470890; cv=none; b=p1JcES56DT27invFJ5zNa62Iwc276G4Q6IonKMyjhIHMrLLOWFxGtbKSnBSh6F1JqTbYAxtToSYGUHgn4GMfES7wROV5y1LtWLTW+RwrzNLqTO6JgK2clP0+ap12RA28WQOTHiTMlv9bUeE43EsnWDRUtVXmFxOe7E65XHrPcqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716470890; c=relaxed/simple;
	bh=OsyEEvO5c5YHM3i6ZcLgdCTDaFlkI++LVXVJFersoxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QgJJcVuwU8vSh4FyKqX/y7LEso277qK+sKga55BPNYeRuOPx0QmzXvrbZu/zBGN6VPDDHX1JvvAcEr8gkHrImyICvxyCc6afqhW18RJRw87yur6HaYlUWInMk3N/T9eUGxTboz9fu79rJzKHqYpsl16GBdNcuj0fh1XvdpIX9MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jidO9ANp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jidO9ANp"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-420298ff5b1so71570755e9.1
        for <oe-kbuild@lists.linux.dev>; Thu, 23 May 2024 06:28:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716470887; x=1717075687; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9onqK5G4XLWVfLiGvFA7YZtXYJ3jtp3yhfKNp17CWZQ=;
        b=jidO9ANproHPLNEAQnSs0FcQH3WMhqZREKyjEhhYoX8dkAEKPkup+4f80Yb9zd/wXn
         zD/9TmLEbxqzozDClsdyOHla7onilStArX1BM0dnFEH+riIRz679U8pV0EnNYYutFOOp
         MHGcQ7wurDyuXyq74pS1sitC854dB+OSCMBGxTebHLop1AHvJbTtMNkamedoa8YTNcPz
         5RqK4AfnUc0BFcbPvDgnG+sjrd2WC5fsPb3qVu2M2I6e28aHFntkipwK+zgVKOFu6WKe
         nbcB11zT+Qj9oloVxam78l33J6zPEi3g80IrT6dO/Aylww0lMKZYPhHbf5HsO6r/P7O+
         2Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716470887; x=1717075687;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9onqK5G4XLWVfLiGvFA7YZtXYJ3jtp3yhfKNp17CWZQ=;
        b=ucejnCdQSOnKxZYEATINRZKC+kBL8sMK97VKnJzCk09lBbCBbPLyK8nlnDL4cR0JKl
         Kgp1Ww+omlUOUnDvkcX0mwXRsK4SVwvlJfIAkFXRw25XiYDaEkyvf8V6vAx+ZMGv1pAC
         BDHAS2AtWPhuuLJ6dKifKeeq8wPFb5x8p4coeNmZ8Ry1VlU2OLZpIq657EIhxxvvTGHL
         afSBZ7ulukquHUouWc48IyizqGBSb2DAzaNH9xaOanjAb8hgfSWOXBlaLzwYEQGutYRp
         nbYqRoJzihSZVYm1s4/+oFovMEMh7DXGFTCS+LaL6OeCeToi6ntKgVptuhBC9/mek/CK
         igzg==
X-Gm-Message-State: AOJu0YxAjd4UZcvaj0Ajog0ybTyWqbWt1q9TF2V39P3kfjIQ1t8ccmM9
	xL5qk4Ov3AGgnZFFvxL4Dx7MzEx9rr3NgydsPaRpgj8kntYeQvz+WwuX91P45V+JdgangfFMCtr
	PaYE=
X-Google-Smtp-Source: AGHT+IHsa9ltR/5PKi6AzATYpKTsjfjgjyU78GvUAqF4Vdwrz3pGgMGhevEBakesA9LpXvMiyH3pog==
X-Received: by 2002:a1c:770f:0:b0:41b:f116:8868 with SMTP id 5b1f17b1804b1-420fd311f08mr50313335e9.12.1716470886771;
        Thu, 23 May 2024 06:28:06 -0700 (PDT)
Received: from localhost ([102.222.70.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100fad965sm25502915e9.34.2024.05.23.06.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 06:28:06 -0700 (PDT)
Date: Thu, 23 May 2024 16:28:02 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Frank Li <Frank.Li@nxp.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 10171/13355] drivers/dma/mcf-edma-main.c:116
 mcf_edma_irq_init() warn: 'res->start' from request_irq() not released on
 lines: 88,93,98,105,113.
Message-ID: <246121cc-e807-4ff1-a3a1-ef43b7c27471@moroto.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c75962170e49f24399141276ae119e6a879f36dc
commit: 3f2282931f00c4c9c5057bb02f46778ba64ff625 [10171/13355] dmaengine: fsl-edma: use _Generic to handle difference type
config: csky-randconfig-r081-20240518 (https://download.01.org/0day-ci/archive/20240518/202405181756.tJmMmyWW-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202405181756.tJmMmyWW-lkp@intel.com/

New smatch warnings:
drivers/dma/mcf-edma-main.c:116 mcf_edma_irq_init() warn: 'res->start' from request_irq() not released on lines: 88,93,98,105,113.

vim +116 drivers/dma/mcf-edma-main.c

e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   74  static int mcf_edma_irq_init(struct platform_device *pdev,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   75  				struct fsl_edma_engine *mcf_edma)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   76  {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   77  	int ret = 0, i;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   78  	struct resource *res;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   79  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   80  	res = platform_get_resource_byname(pdev,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   81  				IORESOURCE_IRQ, "edma-tx-00-15");
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   82  	if (!res)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   83  		return -1;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   84  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   85  	for (ret = 0, i = res->start; i <= res->end; ++i)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   86  		ret |= request_irq(i, mcf_edma_tx_handler, 0, "eDMA", mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   87  	if (ret)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   88  		return ret;

This function has no cleanup.

e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   89  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   90  	res = platform_get_resource_byname(pdev,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   91  			IORESOURCE_IRQ, "edma-tx-16-55");
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   92  	if (!res)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   93  		return -1;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   94  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   95  	for (ret = 0, i = res->start; i <= res->end; ++i)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   96  		ret |= request_irq(i, mcf_edma_tx_handler, 0, "eDMA", mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   97  	if (ret)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   98  		return ret;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19   99  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  100  	ret = platform_get_irq_byname(pdev, "edma-tx-56-63");
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  101  	if (ret != -ENXIO) {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  102  		ret = request_irq(ret, mcf_edma_tx_handler,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  103  				  0, "eDMA", mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  104  		if (ret)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  105  			return ret;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  106  	}
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  107  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  108  	ret = platform_get_irq_byname(pdev, "edma-err");
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  109  	if (ret != -ENXIO) {
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  110  		ret = request_irq(ret, mcf_edma_err_handler,
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  111  				  0, "eDMA", mcf_edma);
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  112  		if (ret)
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  113  			return ret;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  114  	}
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  115  
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19 @116  	return 0;
e7a3ff92eaf19e drivers/dma/mcf-edma.c      Angelo Dureghello  2018-08-19  117  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

