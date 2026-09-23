Received: from mail-wr2-f30.google.com (mail-wr2-f30.google.com [74.125.225.94])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF6A3793CA
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 06:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.94
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790145676; cv=none; b=Rd69OAqvkg2/7jE/16ytt9QgF1xVf1sjQHfZRF93rwUPNRv9x3DkIendIqEHaOnUGRM8JW14aZj4rxS/YCiVSCATSAKeBjOeNFWNKi2Iek2YVC12zpIBn9YUoHJWByRrhhDE7wMZ5YtXBVMQ142ugc3PC+BKSEeED+GisYZLqyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790145676; c=relaxed/simple;
	bh=uWchjzgXJ1lFjETmeo55LV8kEsySydfOdcokuoyuk5c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z0RjdjVMVA8m7Boti/nkXbCX8g0KliUxBESzyfPPtWnZpTIT5npp07CuQQHqVsXvdtn9UEtce85JsrNShhxCE1vvKpur/ZpGU2yq/vzQpVGK2EmKkE7RgIZJOdLjRhEcpt4s1EzUgqm8z+qhtDsdRTc0FrP2dvcOlpPjEr5CdLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MIEDTAEi; arc=none smtp.client-ip=74.125.225.94
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MIEDTAEi"
Received: by mail-wr2-f30.google.com with SMTP id ffacd0b85a97d-48439feca17so516310f8f.1
        for <oe-kbuild@lists.linux.dev>; Tue, 22 Sep 2026 23:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790145663; x=1790750463; darn=lists.linux.dev;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+OWYTqCm36eYoRp4EcMyYpAc07cTE/bg7gu/FbpykgU=;
        b=MIEDTAEi/36dqZJzBDnzdYQlf4pxaOA3+nuKGpObaDmDpU5g3UM5in5vTfWAJUNsni
         ecjz3nPekq2AM+Svs+4kIZHf8v/LcrK7iwgnFzCwN4fk4OAHHMMhTVIZNOApMkBey5jn
         FSZCLiyyCeKqlFz/3EgA7/XFFIefphRLpvOCalXkyRRpn1yNQ1qGHFyaG1sKMRlTJvcS
         q2rOYhZb2or6Sx4gXGisWTzQR43WgKDwL/bX9UHlNFvbegbzBHS1THIzfITdobL4mmjH
         2ze9Ajvn0DbHPQ/pgeUX3rTroa8YYRZu16UYazL6DAwMl2ePAeIzVZsCV3gv7lI2MZgx
         iiUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790145663; x=1790750463;
        h=content-disposition:content-type:mime-version:message-id:subject:cc
         :to:from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+OWYTqCm36eYoRp4EcMyYpAc07cTE/bg7gu/FbpykgU=;
        b=AEuRXQ4xSCGJclmeguyPMV6pgZj8JTWmYoqASSZPkcD2MEXrzPeSdtVT+3NUikNcRl
         GRYG3OJIhnlmiF1DF6UxUZy4VscirLYSuOQlRLlMawTRa64lEZq2bcKHwOvsdOBz8iQf
         epy1aTBVl4KiOHF5rWlbNcH0kwWwEOeJjwDePZ/O6W/wFPErJCsCS01aLgIeqt/+RoLo
         BL9KNMArQ6Nb1Cgpl0Gko6YpOvVfbdjtsEiRnPA4diWanQVUv9jaCqXLusV60zUXZjPF
         CTz96XAQa8jrR7M0NF/hCU6O19XG4G3uO5Be6lMZ4+CDubiqf1Pkrm6i/26c2NH6V8GR
         xmXA==
X-Gm-Message-State: AFuF++mROVFLrC0iPJSzWmYeS4ltpj/fXj/jiBjn6HMxEfjRsAYMJspe
	mKtXioHlE9nxREB2AUA/cR5ftIrQ0lEc+STqlKiMFiG3QKYZqhsbSIAm0pMSrPvY+9bDYw==
X-Gm-Gg: AYBFou19pJD29o0fl32WU0+GFY/gk76k0CgtrbGb2RaBxNjVOlWMYSzNh7qYQh/oVOU
	0cjfL8P1uYDhWutl93cTHhMRMjEzagcdaQge6aJxJS5is16NUwmy5A0QHwQ1v4N0SgvUTOskqBZ
	PPls3Gapa4iouT/eVcnFesB/rjFRzamNvATbj3ob2/hyhgAM4kkwEaVjVLu0PTZl3MU6kwIwGtv
	oTdclEmj9O/nHbmkbSUwQF846tM7eyr1ZchiX9ESkqhwRnySba9xxJgVujkdAvTF3CCKVDVrhec
	/wG7L6jO2+PV6oVm+jBbuoNgtv35N+afpaeOMYLju7QwzJkJ/ARPx6HF5cYPdhvGQkzPCWnBz6P
	krb1DuY3ksp9qiVb65wm+cfkBDwEKPlnLEFnqiU2Ox5aiXsTmcswjpgr9ZhnB2jATnsxRKcUcr4
	TD5DzRX5oRiJm2xom+nVlH4086DLIYQzirUqH1lXsXp4WJNDFcQ4P+HNhAI3Vo31RAJ2XQTXaAc
	9WB7w==
X-Received: by 2002:a05:6000:22ca:b0:487:c99:9020 with SMTP id ffacd0b85a97d-4886704a2a5mr3050302f8f.2.1790145663009;
        Tue, 22 Sep 2026 23:41:03 -0700 (PDT)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4886876c267sm4552545f8f.16.2026.09.22.23.41.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 23:41:02 -0700 (PDT)
Date: Wed, 23 Sep 2026 09:40:58 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, bui duc phuc <phucduc.bui@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	Suraj Gupta <suraj.gupta2@amd.com>
Subject: [linux-next:master 4776/8910]
 drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2974 axienet_probe() warn:
 platform_get_irq() does not return zero
Message-ID: <202609230734.R1jtbjb4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20260923064058.obP-30w4kahFzffwTJO3fFnD0ZT6E_1_4zEtz6ef0w8@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   a8c591ed6b672915e0be57843f943a2a723aff40
commit: bb2b71024976a39ed57d66bad8f9ca7e93bc3f33 [4776/8910] net: xilinx: axienet: Fix IRQ error handling
config: i386-randconfig-2200-20260923 (https://download.01.org/0day-ci/archive/20260923/202609230734.R1jtbjb4-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202609230734.R1jtbjb4-lkp@intel.com/

smatch warnings:
drivers/net/ethernet/xilinx/xilinx_axienet_main.c:2974 axienet_probe() warn: platform_get_irq() does not return zero

vim +2974 drivers/net/ethernet/xilinx/xilinx_axienet_main.c

8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2942  
5fe164fb0e6e31d Rob Herring (Arm         2024-07-31  2943) 	if (!of_property_present(pdev->dev.of_node, "dmas")) {
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2944  		/* Find the DMA node, map the DMA registers, and decode the DMA IRQs */
95219aa538e11d5 Srikanth Thokala         2015-05-05  2945  		np = of_parse_phandle(pdev->dev.of_node, "axistream-connected", 0);
6b1b40f704fc39d Sarath Babu Naidu Gaddam 2023-11-16  2946  
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2947  		if (np) {
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2948  			struct resource dmares;
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2949  
46aa27df8853214 Srikanth Thokala         2015-05-05  2950  			ret = of_address_to_resource(np, 0, &dmares);
46aa27df8853214 Srikanth Thokala         2015-05-05  2951  			if (ret) {
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2952  				dev_err(&pdev->dev,
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2953  					"unable to get DMA resource\n");
fa3a419d2f674b4 Wen Yang                 2019-03-22  2954  				of_node_put(np);
808d077f5b53806 Sean Anderson            2026-01-17  2955  				return ret;
46aa27df8853214 Srikanth Thokala         2015-05-05  2956  			}
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2957  			lp->dma_regs = devm_ioremap_resource(&pdev->dev,
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2958  							     &dmares);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2959  			lp->rx_irq = irq_of_parse_and_map(np, 1);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2960  			lp->tx_irq = irq_of_parse_and_map(np, 0);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2961  			of_node_put(np);
d6349e3e14c7f7b Andre Przywara           2020-03-24  2962  			lp->eth_irq = platform_get_irq_optional(pdev, 0);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2963  		} else {
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2964  			/* Check for these resources directly on the Ethernet node. */
47651c51c02fc49 Yang Yingliang           2021-06-10  2965  			lp->dma_regs = devm_platform_get_and_ioremap_resource(pdev, 1, NULL);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2966  			lp->rx_irq = platform_get_irq(pdev, 1);
                                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2967  			lp->tx_irq = platform_get_irq(pdev, 0);
                                                                                ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

d6349e3e14c7f7b Andre Przywara           2020-03-24  2968  			lp->eth_irq = platform_get_irq_optional(pdev, 2);
28ef9ebdb64c6f4 Robert Hancock           2019-06-06  2969  		}
fcc028c106e5750 Krzysztof Kozlowski      2015-07-09  2970  		if (IS_ERR(lp->dma_regs)) {
46aa27df8853214 Srikanth Thokala         2015-05-05  2971  			dev_err(&pdev->dev, "could not map DMA regs\n");
808d077f5b53806 Sean Anderson            2026-01-17  2972  			return PTR_ERR(lp->dma_regs);
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2973  		}
bb2b71024976a39 bui duc phuc             2026-09-09 @2974  		if (!lp->rx_irq || !lp->tx_irq) {

These should be checks for negative instead of zero.

95219aa538e11d5 Srikanth Thokala         2015-05-05  2975  			dev_err(&pdev->dev, "could not determine irqs\n");
bb2b71024976a39 bui duc phuc             2026-09-09  2976  			return -EINVAL;
8a3b7a252dca9fb Daniel Borkmann          2012-01-19  2977  		}
bb2b71024976a39 bui duc phuc             2026-09-09  2978  		if (lp->rx_irq < 0)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

