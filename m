Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C4826B2D5
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Oct 2025 11:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759577209; cv=none; b=VKOHEJIRCVjhYLTmhhvmq7wHMwUqgSc3M0/ldBUMmp+09PlX5Xi82B4s0+OcrksTeew+VrFWHrIC39t2bS60Duz/DVPdkSX2bNu0ZVSGdrLBNNuIOeWHwKxv3k5rfRhV8tgqIDw8IT1G010UfPzyVMGNjKuyWLb819mZ3TaWj28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759577209; c=relaxed/simple;
	bh=EwdxHnfhKvEZ7NIeysHGXpupI7BqORS8CfSma73coo8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aRgYQyHIs6e2XpetX1LgdZBJrn54MeVdS7CE9dGrNFgquPl8dxkFLHs1rHgHKUPcXzUDxrVtbcRNrysiq7MYlhkH+dUHr1GENmUu4WpQFUfyPoq//9BW+fGeCK3jpdH+qe29K70oSwEiEOY1QPqAhVUmFGuhqRVBY7UzHMhCNaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xxf75A2I; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xxf75A2I"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46e34bd8eb2so35469405e9.3
        for <oe-kbuild@lists.linux.dev>; Sat, 04 Oct 2025 04:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759577205; x=1760182005; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3DzFK8rYziPUGpkl2sqEnCqePPRcI+6U2kgUcBhHTzw=;
        b=Xxf75A2IK++KIFRHzB4Qvj9QVbRZwfE6r/+S5q5rO/ujrvPj4p/dHSI4Htxpipkqia
         Ex1MLx2B4eFUGILi7appiKe9IGCjTX2ZlNqR5g35xhO5CNuRmrtqQOLBAivPf6B1hiXZ
         DcjSJW1gVspi/xZz2T9klAM5NLZb+BfkXqjED3bqcUdo5RkysgqBpZOeZz1BG23ZTbPM
         VciIdk4idYds0w5ej6T+H0UmELTnD+y/KPbuBM8MoLEGyN+iDMdm87eByW6DFTM+WTpD
         Ff7yf+Ydn72IuNTN56mtN8sm/TfKu0bQ1pUEfGsd/07Tha4FmIgps3QIyRPkbS+3ti8X
         2TpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759577205; x=1760182005;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3DzFK8rYziPUGpkl2sqEnCqePPRcI+6U2kgUcBhHTzw=;
        b=mZoJu51fVa17rPjprdRYApuaQas6JRRy7YDdthA/GjxWK9Fwuf2TfmPNGHNvDbbdmU
         FhPPddcvoQdET6kqHgEoPiK7MsAIxTIZy0klRBCrIinErNMceK5kWBwpV8cjsu+npv2k
         /oQorfOibsiHw7cxbdHUKL3VJPA5arzr4ywr87ynvZGonz0u60fEnSGJ4kpEVW3ri6BW
         b5tTD6VWXGnojZ2WDodhiFBzqPSKz+wIVQnPfKp73GC540xeo7WNm8X7rFSh5A20FsgL
         Kwdb3NdNHFNkTo3BQjUf4jn0w13lPunTMgTqFxVF4huSIwQQry//9xOn8uZMT+U6zEpc
         aq7A==
X-Gm-Message-State: AOJu0YyeyMb7WZN/shDiAb+RNwLNNMp94LOiojHWaBgrsUGgzC7e1rlB
	tG5p0F9PP9iwGOt7JEZ10aakAThLSnDTV+CXv6EJ5CRqUSA6a/k5P5cDQdbFzE6H4ui8WQUJM2h
	OXO25
X-Gm-Gg: ASbGncvZGme7fWFqICfxrEYEN+T/tdoDOGynbEfZkQTd62wXtFio9gS+gsMFa9Kz2Hg
	EBvyvsV3f/LagpROXbquNsVhElmZSz6YyA17pLheXT/cEeM+mC1FJnZydRqpOwRO56lYzT9/p2K
	9LmJSe91yM/eAVezd37ukdw39M1mo+wxFlE+XvNqELKjBXLu/JvbE8qaZ6hal/qBAl/mJO0fymq
	P4PiJxEZM6V3dG1p6pT9H/TqLob1zt+S60U+WZ08Ncs+P021MEzaEQYNoQc7Yp1nv2/Asv4Jq3t
	jvyHHIj1FoV0FNtuNCYv5rvNVnwojdDUaTWSzcKf4Pgim+fiNufiRKLObG06ss8EtUZHUByDn4B
	AdXWZl7c9w1AcZO47KUfPky2KpY/hhydbNfo4PZPb5vFfbF0dKlnwkda2
X-Google-Smtp-Source: AGHT+IFacHTO+wNvyUaeloL1KpMs5qoUG4HNzAfByt4v809NdPdXJT/60CWPcoxKWKlPtIpF5bc3GQ==
X-Received: by 2002:a05:6000:43d6:20b0:425:6866:6a9e with SMTP id ffacd0b85a97d-425686679fbmr3061385f8f.0.1759577204664;
        Sat, 04 Oct 2025 04:26:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4255d8a6b5csm11924920f8f.5.2025.10.04.04.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 04:26:44 -0700 (PDT)
Date: Sat, 4 Oct 2025 14:26:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Mikko Rapeli <mikko.rapeli@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>
Subject: drivers/mmc/host/pxamci.c:709 pxamci_probe() warn: passing zero to
 'PTR_ERR'
Message-ID: <202510041841.pRlunIfl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20251004112640.ivXdrnwzfb_rGej4k9oZy-uU3_i1j6UKLyajMw2PQdI@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cbf33b8e0b360f667b17106c15d9e2aac77a76a1
commit: 7cd8db0fb0b2bf309163d56fec585c0f9e0964d1 mmc: add COMPILE_TEST to multiple drivers
config: s390-randconfig-r071-20251004 (https://download.01.org/0day-ci/archive/20251004/202510041841.pRlunIfl-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202510041841.pRlunIfl-lkp@intel.com/

smatch warnings:
drivers/mmc/host/pxamci.c:709 pxamci_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +709 drivers/mmc/host/pxamci.c

^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  690  	/*
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  691  	 * Ensure that the host controller is shut down, and setup
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  692  	 * with our defaults.
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  693  	 */
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  694  	pxamci_stop_clock(host);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  695  	writel(0, host->base + MMC_SPI);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  696  	writel(64, host->base + MMC_RESTO);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  697  	writel(host->imask, host->base + MMC_I_MASK);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  698  
23f3ff72bc6f05 drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  699  	ret = devm_request_irq(dev, irq, pxamci_irq, 0,
07e7716c746dd4 drivers/mmc/host/pxamci.c Robert Jarzmik     2016-02-08  700  			       DRIVER_NAME, host);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  701  	if (ret)
58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  702  		return ret;
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  703  
3ae5eaec1d2d9c drivers/mmc/pxamci.c      Russell King       2005-11-09  704  	platform_set_drvdata(pdev, mmc);
^1da177e4c3f41 drivers/mmc/pxamci.c      Linus Torvalds     2005-04-16  705  
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  706  	host->dma_chan_rx = dma_request_chan(dev, "rx");
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  707  	if (IS_ERR(host->dma_chan_rx)) {
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  708  		host->dma_chan_rx = NULL;
                                                                                        ^^^^^^^^^^^^^^^^^^^^^^^^^

58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03 @709  		return dev_err_probe(dev, PTR_ERR(host->dma_chan_rx),

PTR_ERR(NULL) is success.

58c40f3faf742c drivers/mmc/host/pxamci.c Binbin Zhou        2025-06-03  710  				     "unable to request rx dma channel\n");
6464b714095119 drivers/mmc/host/pxamci.c Daniel Mack        2015-06-06  711  	}
6464b714095119 drivers/mmc/host/pxamci.c Daniel Mack        2015-06-06  712  
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  713  	host->dma_chan_tx = dma_request_chan(dev, "tx");
e1ebb456ae4cd8 drivers/mmc/host/pxamci.c Peter Ujfalusi     2019-12-17  714  	if (IS_ERR(host->dma_chan_tx)) {
23f3ff72bc6f05 drivers/mmc/host/pxamci.c Daniel Mack        2018-07-03  715  		dev_err(dev, "unable to request tx dma channel\n");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

