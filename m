Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 414333D74;
	Tue, 27 Dec 2022 17:50:18 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id o15so9777976wmr.4;
        Tue, 27 Dec 2022 09:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7f0CdUXe8phT2kexAusIBnKBuWstxNOnBu3E9cI6oAw=;
        b=Q9sjBtEne7RjKn4hDm87PK/7ZG+eYBNLw9Wv6p8ORD/X4ZMGE00WqK/5RRwu9Ml5lk
         mk59HNlGK2PWEXyXq9ZyMrHIif2h7tBjd2i8Gfd5mA93mHHll16vwUI4/FIya6y68QmW
         tGwTikOjEtEmXsVEDDBjLH5NFniqHqBmFSXZZrPZpL3bpd9RJjafMQMGAiG7VtCfZJeu
         EWsp45l1oUERqLxPaHcnsaFUcEam1uc4psoX5rQu07/4Gpe4sZ7Vp6Dmi/0BFQ3rbtbE
         eyx+QROpP7b1hSow6o0SXDfTg0Fo/zK3i55W+9JuMaGiRlbT/dSLGvO/ETrXfMyIAcw5
         xCqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7f0CdUXe8phT2kexAusIBnKBuWstxNOnBu3E9cI6oAw=;
        b=fW8P0pwkdJZL/IQoI+uBOzpMoBTABhuB/sff3GEAmzS+poYzt4OHj04j8WcpogAOLQ
         FvNBmuZ9J5b2wqhEa9ao4OrGhx9ckvAFlDqdGJjZM43as4gZTo4hjAWefi/J603EoxDI
         6MEdeLKy4nHCecUfQSQvfPeGIF641F1Czx5yhn9FTs5v04ZMcjUBwpU+2NHuLPtMj0Z9
         5VOKZkcDn1odRfIA4Lx8f+jZETtFNsMo7gcx4Llksr0G/2mKNQO7u101OywsRx8mjHKs
         EfNOUc9XUcfIxhDUrEIq99FAFSjPmsCL4ePK9JwEs9NVYYUhQgNF1qtjC2Vxq59BBF2P
         3ePA==
X-Gm-Message-State: AFqh2kqq+9jZnblk8Zb9ZWOHtzzxeoXldmBSrqc1zifQND56mgjfT41A
	CtDVIavvMoiliqxWEAmI8zo8Ol2TihEyvw==
X-Google-Smtp-Source: AMrXdXtEFINalGZewRhoRzS8KM0N+ONevOn0UdkngxKVKJp6fU6iLO0GHdGRhrwQ9567YL6Sv8i6zQ==
X-Received: by 2002:a05:600c:5012:b0:3d3:5a4a:9103 with SMTP id n18-20020a05600c501200b003d35a4a9103mr15680308wmr.31.1672163416349;
        Tue, 27 Dec 2022 09:50:16 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id hg24-20020a05600c539800b003cf71b1f66csm17759245wmb.0.2022.12.27.09.50.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Dec 2022 09:50:15 -0800 (PST)
Date: Tue, 27 Dec 2022 20:50:13 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, haibo.chen@nxp.com, ulf.hansson@linaro.org,
	adrian.hunter@intel.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, shawnguo@kernel.org,
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
	linux-imx@nxp.com, linux-mmc@vger.kernel.org,
	kgroeneveld@lenbrook.com, haibo.chen@nxp.com
Subject: Re: [PATCH v2 3/3] mmc: sdhci-esdhc-imx: only enable DAT[0] and CMD
 line auto tuning for SDIO device
Message-ID: <202212262324.SVvtUbT2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221221112853.789675-4-haibo.chen@nxp.com>
Message-ID: <20221227175013.3DW7qkzznSjybJ0n5Remy8dxtDzT_KqjCPQqWc2qDdU@z>

Hi,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/haibo-chen-nxp-com/fix-the-sdio-device-DATA-CMD-CRC-and-Timeout-issue-after-tuning/20221221-193033
patch link:    https://lore.kernel.org/r/20221221112853.789675-4-haibo.chen%40nxp.com
patch subject: [PATCH v2 3/3] mmc: sdhci-esdhc-imx: only enable DAT[0] and CMD line auto tuning for SDIO device
config: parisc-randconfig-m031-20221225
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/mmc/host/sdhci-esdhc-imx.c:462 usdhc_auto_tuning_mode_sel_and_en() error: we previously assumed 'host->mmc->card' could be null (see line 462)

vim +462 drivers/mmc/host/sdhci-esdhc-imx.c

45334ee13858de Haibo Chen 2021-08-18  431  /* Enable the auto tuning circuit to check the CMD line and BUS line */
235cd41770bdcb Haibo Chen 2022-12-21  432  static inline void usdhc_auto_tuning_mode_sel_and_en(struct sdhci_host *host)
45334ee13858de Haibo Chen 2021-08-18  433  {
45334ee13858de Haibo Chen 2021-08-18  434  	u32 buswidth, auto_tune_buswidth;
235cd41770bdcb Haibo Chen 2022-12-21  435  	u32 reg;
45334ee13858de Haibo Chen 2021-08-18  436  
45334ee13858de Haibo Chen 2021-08-18  437  	buswidth = USDHC_GET_BUSWIDTH(readl(host->ioaddr + SDHCI_HOST_CONTROL));
45334ee13858de Haibo Chen 2021-08-18  438  
45334ee13858de Haibo Chen 2021-08-18  439  	switch (buswidth) {
45334ee13858de Haibo Chen 2021-08-18  440  	case ESDHC_CTRL_8BITBUS:
45334ee13858de Haibo Chen 2021-08-18  441  		auto_tune_buswidth = ESDHC_VEND_SPEC2_AUTO_TUNE_8BIT_EN;
45334ee13858de Haibo Chen 2021-08-18  442  		break;
45334ee13858de Haibo Chen 2021-08-18  443  	case ESDHC_CTRL_4BITBUS:
45334ee13858de Haibo Chen 2021-08-18  444  		auto_tune_buswidth = ESDHC_VEND_SPEC2_AUTO_TUNE_4BIT_EN;
45334ee13858de Haibo Chen 2021-08-18  445  		break;
45334ee13858de Haibo Chen 2021-08-18  446  	default:	/* 1BITBUS */
45334ee13858de Haibo Chen 2021-08-18  447  		auto_tune_buswidth = ESDHC_VEND_SPEC2_AUTO_TUNE_1BIT_EN;
45334ee13858de Haibo Chen 2021-08-18  448  		break;
45334ee13858de Haibo Chen 2021-08-18  449  	}
45334ee13858de Haibo Chen 2021-08-18  450  
e088d1496d45c2 Haibo Chen 2022-12-21  451  	/*
e088d1496d45c2 Haibo Chen 2022-12-21  452  	 * For USDHC, auto tuning circuit can not handle the async sdio
e088d1496d45c2 Haibo Chen 2022-12-21  453  	 * device interrupt correctly. When sdio device use 4 data lines,
e088d1496d45c2 Haibo Chen 2022-12-21  454  	 * async sdio interrupt will use the shared DAT[1], if enable auto
e088d1496d45c2 Haibo Chen 2022-12-21  455  	 * tuning circuit check these 4 data lines, include the DAT[1],
e088d1496d45c2 Haibo Chen 2022-12-21  456  	 * this circuit will detect this interrupt, take this as a data on
e088d1496d45c2 Haibo Chen 2022-12-21  457  	 * DAT[1], and adjust the delay cell wrongly.
e088d1496d45c2 Haibo Chen 2022-12-21  458  	 * This is the hardware design limitation, to avoid this, for sdio
e088d1496d45c2 Haibo Chen 2022-12-21  459  	 * device, config the auto tuning circuit only check DAT[0] and CMD
e088d1496d45c2 Haibo Chen 2022-12-21  460  	 * line.
e088d1496d45c2 Haibo Chen 2022-12-21  461  	 */
e088d1496d45c2 Haibo Chen 2022-12-21 @462  	if (!host->mmc->card && mmc_card_sdio(host->mmc->card))

Presumably the ! is a mistake?  mmc_card_sdio() dereferences
host->mmc->card.

e088d1496d45c2 Haibo Chen 2022-12-21  463  		auto_tune_buswidth = ESDHC_VEND_SPEC2_AUTO_TUNE_1BIT_EN;
e088d1496d45c2 Haibo Chen 2022-12-21  464  
45334ee13858de Haibo Chen 2021-08-18  465  	esdhc_clrset_le(host, ESDHC_VEND_SPEC2_AUTO_TUNE_MODE_MASK,
45334ee13858de Haibo Chen 2021-08-18  466  			auto_tune_buswidth | ESDHC_VEND_SPEC2_AUTO_TUNE_CMD_EN,
45334ee13858de Haibo Chen 2021-08-18  467  			ESDHC_VEND_SPEC2);
235cd41770bdcb Haibo Chen 2022-12-21  468  
235cd41770bdcb Haibo Chen 2022-12-21  469  	reg = readl(host->ioaddr + ESDHC_MIX_CTRL);
235cd41770bdcb Haibo Chen 2022-12-21  470  	reg |= ESDHC_MIX_CTRL_AUTO_TUNE_EN;
235cd41770bdcb Haibo Chen 2022-12-21  471  	writel(reg, host->ioaddr + ESDHC_MIX_CTRL);
45334ee13858de Haibo Chen 2021-08-18  472  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

