Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECB3E79F8
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jun 2023 11:38:18 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-30e3caa6aa7so1426455f8f.1
        for <oe-kbuild@lists.linux.dev>; Sat, 17 Jun 2023 04:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687001896; x=1689593896;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VoVH6h/p+YtnHfXnmiQLUOabccFDd4jrrthEkbIEdwk=;
        b=K/LO8Xdoqsk5r2kpjyF7C3Wy+hT9oXoakCeEO9Ja4LWd3fqURErZyNx2sTgCxngE9i
         SHFiKynF89OLjXr0Wgr4j5WsEYTkm7sA3gtxJ0k/o7LL2/uRK8jAeZCu5+LnwHZjGoBC
         QylFsUSYDtK1zutKwzwUQH/vTtH5OmQux2OmT/T1fs/hm/XTM7dPfiKTtKSRMq/URj5A
         PaxtRdUNlEkJygHME0U6AOwQA/ZxBobWVh2cY4FCZlexWd1mJYgNdLQ0h2c4BVpE/zZE
         xGz0+huqn15Xv5JH8JvfJjO4AnijAs4WvYHW4GLuYQypEKgSBMJ4Z2pg/g2mOLGtV3W0
         /UkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687001896; x=1689593896;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VoVH6h/p+YtnHfXnmiQLUOabccFDd4jrrthEkbIEdwk=;
        b=Kj20RLrtdGWVypaQGHjCpOsPrU8QHeapiXmByUi6D8kT0gJ3FMJsM5KTpLZBBBs0xI
         yi1y5iWaKlQ9rPOR80NaI117U1di+8ANhdAukpN7i5S6ApUdI7XZLoWv9LKaj+yiBKz3
         SRvUSl4VZhm59yBt3kLuYun6VdmNwHhpfnhjYnwlZ57P6yVIOLeyfqIlrks3vHBsTvjL
         bLIIpFlA4XatUvWwlhB/TJtzDm93sc5YcvJ+KnSckT5nmnCUC8HNqNbHw2kN8j2knld5
         zP6rEwQdNVHBP6Gs08LXqJJAJxvVIymdVLmdQBb2rPSd/k2UF6PNLfeWkLQ2T3v6y8J/
         8oRA==
X-Gm-Message-State: AC+VfDxGKFGXmVh/W0dTLLxIVzm3S1/JXYcx7mUEEcbRjGjdIfeKya9z
	B3Ag+AU9xZBlinzzKCLWqqs13p2JW1HdI7jReQU=
X-Google-Smtp-Source: ACHHUZ7+YnLmiv6yf/ZhrnbyzA0tC1BJUYqoBX7ZIcXVVPdHB3LBHZ/1ChBOxC5tDtKWvs8bbfJiCg==
X-Received: by 2002:a05:6000:1370:b0:311:1a45:3606 with SMTP id q16-20020a056000137000b003111a453606mr3637529wrz.30.1687001895939;
        Sat, 17 Jun 2023 04:38:15 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y3-20020a5d6203000000b003062c0ef959sm26085813wru.69.2023.06.17.04.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Jun 2023 04:38:14 -0700 (PDT)
Date: Sat, 17 Jun 2023 14:38:04 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 09/25] iommu: Allow an IDENTITY domain as the
 default_domain in ARM32
Message-ID: <f5719ba8-0beb-4eea-8d67-7624c1b62c79@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9-v4-874277bde66e+1a9f6-iommu_all_defdom_jgg@nvidia.com>

Hi Jason,

kernel test robot noticed the following build warnings:

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/iommu-Add-iommu_ops-identity_domain/20230617-032631
base:   fe420865bd74f5917ff0d8d38a46fbbbe5dd1ea6
patch link:    https://lore.kernel.org/r/9-v4-874277bde66e%2B1a9f6-iommu_all_defdom_jgg%40nvidia.com
patch subject: [PATCH v4 09/25] iommu: Allow an IDENTITY domain as the default_domain in ARM32
config: arm-randconfig-m031-20230611 (https://download.01.org/0day-ci/archive/20230617/202306171458.LfWLILeK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230617/202306171458.LfWLILeK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306171458.LfWLILeK-lkp@intel.com/

smatch warnings:
drivers/iommu/iommu.c:1800 iommu_get_default_domain_type() error: potentially dereferencing uninitialized 'gdev'.

vim +/gdev +1800 drivers/iommu/iommu.c

8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1748  static int iommu_get_default_domain_type(struct iommu_group *group,
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1749  					 int target_type)
deac0b3bed26bb Joerg Roedel    2020-04-29  1750  {
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1751  	const struct iommu_ops *ops = dev_iommu_ops(
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1752  		list_first_entry(&group->devices, struct group_device, list)
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1753  			->dev);
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1754  	int best_type = target_type;
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1755  	struct group_device *gdev;
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1756  	struct device *last_dev;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1757  	int type;
deac0b3bed26bb Joerg Roedel    2020-04-29  1758  
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1759  	lockdep_assert_held(&group->mutex);
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1760  
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1761  	/*
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1762  	 * ARM32 drivers supporting CONFIG_ARM_DMA_USE_IOMMU can declare an
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1763  	 * identity_domain and it will automatically become their default
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1764  	 * domain. Later on ARM_DMA_USE_IOMMU will install its UNMANAGED domain.
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1765  	 * Override the selection to IDENTITY if we are sure the driver supports
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1766  	 * it.
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1767  	 */
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1768  	if (IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU) && ops->identity_domain) {
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1769  		type = IOMMU_DOMAIN_IDENTITY;
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1770  		if (best_type && type && best_type != type)
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1771  			goto err;

gdev is uninitialized.

03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1772  		best_type = target_type = IOMMU_DOMAIN_IDENTITY;
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1773  	}
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1774  
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1775  	for_each_group_device(group, gdev) {
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1776  		type = best_type;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1777  		if (ops->def_domain_type) {
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1778  			type = ops->def_domain_type(gdev->dev);
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1779  			if (best_type && type && best_type != type) {
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1780  				/* Stick with the last driver override we saw */
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1781  				best_type = type;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1782  				goto err;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1783  			}
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1784  		}
deac0b3bed26bb Joerg Roedel    2020-04-29  1785  
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1786  		/* No ARM32 using systems will set untrusted, it cannot work. */
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1787  		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted &&
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1788  		    !WARN_ON(IS_ENABLED(CONFIG_ARM_DMA_USE_IOMMU))) {
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1789  			type = IOMMU_DOMAIN_DMA;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1790  			if (best_type && type && best_type != type)
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1791  				goto err;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1792  		}
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1793  		best_type = type;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1794  		last_dev = gdev->dev;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1795  	}
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1796  	return best_type;
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1797  
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1798  err:
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1799  	if (target_type) {
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11 @1800  		dev_err_ratelimited(
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1801  			gdev->dev,
                                                                        ^^^^^^^^^

ddaf433cac2995 Jason Gunthorpe 2023-06-16  1802  			"Device cannot be in %s domain - it is forcing %s\n",
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1803  			iommu_domain_type_str(target_type),
ddaf433cac2995 Jason Gunthorpe 2023-06-16  1804  			iommu_domain_type_str(type));
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1805  		return -1;
deac0b3bed26bb Joerg Roedel    2020-04-29  1806  	}
deac0b3bed26bb Joerg Roedel    2020-04-29  1807  
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1808  	dev_warn(
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1809  		gdev->dev,
                                                                ^^^^^^^^^

8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1810  		"Device needs domain type %s, but device %s in the same iommu group requires type %s - using default\n",
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1811  		iommu_domain_type_str(type), dev_name(last_dev),
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1812  		iommu_domain_type_str(best_type));
03c9e7d1dd3c99 Jason Gunthorpe 2023-06-16  1813  	return best_type;
8b4eb75ee50e6f Jason Gunthorpe 2023-05-11  1814  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

