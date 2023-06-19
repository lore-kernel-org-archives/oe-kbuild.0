Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45AE23C1
	for <oe-kbuild@lists.linux.dev>; Mon, 19 Jun 2023 05:23:02 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31114b46d62so3070161f8f.3
        for <oe-kbuild@lists.linux.dev>; Sun, 18 Jun 2023 22:23:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687152179; x=1689744179;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hqTG9ArGdEzQq9IpwudIt3+5bVyc9z+fAnofQue9vuk=;
        b=G6n8x8GTPahdlwUoSHolMAle9IuGP+3eqbiVzdJo9OtKANQXIUwqP13RQxcx7HQ596
         I5DWNghs7/Awq3IzV3EeC9JoFQiXZoilTBh6TzPPmEOj1iQI5bp67LcpLTm2FnMv/93u
         lDOIy3Vf9IsuEryVTIiq4E8e+TvtjjaKH6MYe/MSbsvfIIL9/q9fw++GAgJ7XiFUcFce
         C3XvORx/JLHemFFSsPILkErVLIq5P1eQge6B/byhvP1PCR4LUthDzxUgjdQypsOY64hp
         OKq5z1i0zJ94Shl/vHubqQfbFFuzZJlq/vOS3uCESNKpiKcN0XIdklw8ENOSdyIXGavi
         Is5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687152179; x=1689744179;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hqTG9ArGdEzQq9IpwudIt3+5bVyc9z+fAnofQue9vuk=;
        b=AcpHrCn8BYx5UWeRgGxOk2/9uhfpsAsXZMzf0IRQk9xFWqIBQpNQUQ0Q755clNrRSw
         HVYYglZLeaSBpCrfy1X2w6dpQiMXtgzBUu+uxvHJB9oTEhSdI3exw0POKz/3Jr7eJVbH
         pbB334ZnRaGUyllEEF4UhWSAieHZ8B5QgoRuupQhnJnoOAxW+fvUpyFZFcBlyDGQwtJS
         SNaCCipEyMbsHh+f3NgaC2Z4+eSaWppxVfG/ebr940WPrAfCF41ES+ZgIgx6lwVLAxR6
         uOcC7UE0m1L8Dm6/hetoe2Z8rJNBmDA/LiOq051pdYjzp2pDQaF8My/kNkeu1NDwAEJW
         2zEg==
X-Gm-Message-State: AC+VfDzVYfgJFKttnDLV3y4unIbp/ytOdvx8tjFtdvjB+ZVi3DMNZEwb
	9WKNA2jKMaTJW+/2KkvRnsUMVqNG+7otsWIX36g=
X-Google-Smtp-Source: ACHHUZ6rbNZIsvRxN2mNLwCFxmQkU4vCbqWKMrwfob6c1HLg2lcpfnQ76tuEXWXsO5c0o0Xk74A5dA==
X-Received: by 2002:a5d:44cf:0:b0:30f:be04:5b60 with SMTP id z15-20020a5d44cf000000b0030fbe045b60mr8280300wrr.56.1687152179557;
        Sun, 18 Jun 2023 22:22:59 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id j8-20020a5d6188000000b0031118d80246sm10590507wru.29.2023.06.18.22.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 22:22:57 -0700 (PDT)
Date: Mon, 19 Jun 2023 08:22:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Anup Patel <apatel@ventanamicro.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [avpatel:riscv_timer_imp_v1 43/50] drivers/iommu/dma-iommu.c:1698
 iommu_dma_compose_msi_msg() error: uninitialized symbol 'msi_addr'.
Message-ID: <8cb591d2-d463-4585-a417-291fa2f24ae0@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_timer_imp_v1
head:   74a10c4f3857dece3424b109452f63add2baa7f6
commit: 59f0204d5995cda5dad48d7821d2d885a852f519 [43/50] irqchip/riscv-imsic: Improve IOMMU DMA support
config: i386-randconfig-m021-20230618 (https://download.01.org/0day-ci/archive/20230619/202306190814.sEFyHNhA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230619/202306190814.sEFyHNhA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306190814.sEFyHNhA-lkp@intel.com/

New smatch warnings:
drivers/iommu/dma-iommu.c:1698 iommu_dma_compose_msi_msg() error: uninitialized symbol 'msi_addr'.

Old smatch warnings:
drivers/iommu/dma-iommu.c:1358 iommu_dma_unmap_sg() error: uninitialized symbol 'start'.

vim +/msi_addr +1698 drivers/iommu/dma-iommu.c

ece6e6f0218b77 Julien Grall      2019-05-01  1679  
fa49364cd5e657 Robin Murphy      2022-08-16  1680  /**
fa49364cd5e657 Robin Murphy      2022-08-16  1681   * iommu_dma_compose_msi_msg() - Apply translation to an MSI message
fa49364cd5e657 Robin Murphy      2022-08-16  1682   * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
fa49364cd5e657 Robin Murphy      2022-08-16  1683   * @msg: MSI message containing target physical address
fa49364cd5e657 Robin Murphy      2022-08-16  1684   */
fa49364cd5e657 Robin Murphy      2022-08-16  1685  void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
ece6e6f0218b77 Julien Grall      2019-05-01  1686  {
ece6e6f0218b77 Julien Grall      2019-05-01  1687  	struct device *dev = msi_desc_to_dev(desc);
ece6e6f0218b77 Julien Grall      2019-05-01  1688  	const struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
ece6e6f0218b77 Julien Grall      2019-05-01  1689  	const struct iommu_dma_msi_page *msi_page;
59f0204d5995cd Anup Patel        2023-05-02  1690  	struct iommu_dma_cookie *cookie;
59f0204d5995cd Anup Patel        2023-05-02  1691  	phys_addr_t msi_addr;
59f0204d5995cd Anup Patel        2023-05-02  1692  
59f0204d5995cd Anup Patel        2023-05-02  1693  	if (!domain || !domain->iova_cookie)
59f0204d5995cd Anup Patel        2023-05-02  1694  		return;
ece6e6f0218b77 Julien Grall      2019-05-01  1695  
59f0204d5995cd Anup Patel        2023-05-02  1696  	cookie = domain->iova_cookie;
ece6e6f0218b77 Julien Grall      2019-05-01  1697  	msi_page = msi_desc_get_iommu_cookie(desc);
59f0204d5995cd Anup Patel        2023-05-02 @1698  	if (!msi_page || msi_page->phys != msi_addr) {
                                                                                           ^^^^^^^^
Uninitialized.

59f0204d5995cd Anup Patel        2023-05-02  1699  		msi_addr = ((u64)msg->address_hi << 32) | msg->address_lo;
59f0204d5995cd Anup Patel        2023-05-02  1700  		msi_addr &= ~(phys_addr_t)(cookie_msi_granule(cookie) - 1);
ece6e6f0218b77 Julien Grall      2019-05-01  1701  
59f0204d5995cd Anup Patel        2023-05-02  1702  		msi_desc_set_iommu_cookie(desc, NULL);
59f0204d5995cd Anup Patel        2023-05-02  1703  		list_for_each_entry(msi_page, &cookie->msi_page_list, list) {
59f0204d5995cd Anup Patel        2023-05-02  1704  			if (msi_page->phys == msi_addr) {
59f0204d5995cd Anup Patel        2023-05-02  1705  				msi_desc_set_iommu_cookie(desc, msi_page);
59f0204d5995cd Anup Patel        2023-05-02  1706  				break;
59f0204d5995cd Anup Patel        2023-05-02  1707  			}
59f0204d5995cd Anup Patel        2023-05-02  1708  		}
59f0204d5995cd Anup Patel        2023-05-02  1709  		msi_page = msi_desc_get_iommu_cookie(desc);
59f0204d5995cd Anup Patel        2023-05-02  1710  	}
59f0204d5995cd Anup Patel        2023-05-02  1711  	if (WARN_ON(!msi_page))
ece6e6f0218b77 Julien Grall      2019-05-01  1712  		return;
ece6e6f0218b77 Julien Grall      2019-05-01  1713  
44bb7e243bd4b4 Robin Murphy      2016-09-12  1714  	msg->address_hi = upper_32_bits(msi_page->iova);
59f0204d5995cd Anup Patel        2023-05-02  1715  	msg->address_lo &= cookie_msi_granule(cookie) - 1;
44bb7e243bd4b4 Robin Murphy      2016-09-12  1716  	msg->address_lo += lower_32_bits(msi_page->iova);
44bb7e243bd4b4 Robin Murphy      2016-09-12  1717  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

