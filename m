Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7246FB1
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Mar 2023 14:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680188100; x=1711724100;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LMpAr9mqetrcuQ9CsBf18T6pQHPlSDfLa8iFk2LJuYc=;
  b=RXbOle79MQ9aO20Tb14J2i9VfyoPlBI/wXDJ0jDNYjtcbE97nAHreBiX
   vQmKeuPHn47nuVruD6t2C2GapBmONqVFy9IhqFNsDi7nX5RiS+JEido1L
   ETPSbvMJJmxozbfaQVduI1xfDYZmbTGtO9RQaoSycQ2ufVM/Rzggtmip1
   MKdEPvtjeFYeZhzLWbQJl7yqziw34L2tTPr30htCs9oWRnxLMsgtp+NWU
   eRk31fAkVibIdVRqLokTcwkrLKrnELLjwrXo2oxGFQRZIoAYq5J9rtoml
   oDOd5TPY4AagMJDrvlMevGptc+7S0p/eGPP+LvHa8y/H/d0C4AvXTrtH3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="368970412"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="368970412"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 07:54:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="678222305"
X-IronPort-AV: E=Sophos;i="5.98,303,1673942400"; 
   d="scan'208";a="678222305"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 30 Mar 2023 07:54:58 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phtg1-000KvY-0j;
	Thu, 30 Mar 2023 14:54:57 +0000
Date: Thu, 30 Mar 2023 22:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] iio: adc: mt6370: Fix ibus and ibat scaling value of
 some specific vendor ID chips
Message-ID: <202303302231.gNdPKrtD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <1679667167-16261-1-git-send-email-chiaen_wu@richtek.com>
References: <1679667167-16261-1-git-send-email-chiaen_wu@richtek.com>
TO: ChiaEn Wu <chiaen_wu@richtek.com>
TO: jic23@kernel.org
TO: lars@metafoo.de
TO: matthias.bgg@gmail.com
TO: angelogioacchino.delregno@collabora.com
CC: linux-iio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: peterwu.pub@gmail.com
CC: cy_huang@richtek.com
CC: ChiaEn Wu <chiaen_wu@richtek.com>

Hi ChiaEn,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on jic23-iio/togreg]
[also build test WARNING on linus/master v6.3-rc4 next-20230330]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/ChiaEn-Wu/iio-adc-mt6370-Fix-ibus-and-ibat-scaling-value-of-some-specific-vendor-ID-chips/20230324-221545
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/1679667167-16261-1-git-send-email-chiaen_wu%40richtek.com
patch subject: [PATCH] iio: adc: mt6370: Fix ibus and ibat scaling value of some specific vendor ID chips
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: m68k-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230330/202303302231.gNdPKrtD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303302231.gNdPKrtD-lkp@intel.com/

smatch warnings:
drivers/iio/adc/mt6370-adc.c:306 mt6370_adc_probe() error: uninitialized symbol 'priv'.

vim +/priv +306 drivers/iio/adc/mt6370-adc.c

9822359d5de2dba ChiaEn Wu 2023-03-24  293  
c1404d1b659fe3d ChiaEn Wu 2022-10-11  294  static int mt6370_adc_probe(struct platform_device *pdev)
c1404d1b659fe3d ChiaEn Wu 2022-10-11  295  {
c1404d1b659fe3d ChiaEn Wu 2022-10-11  296  	struct device *dev = &pdev->dev;
c1404d1b659fe3d ChiaEn Wu 2022-10-11  297  	struct mt6370_adc_data *priv;
c1404d1b659fe3d ChiaEn Wu 2022-10-11  298  	struct iio_dev *indio_dev;
c1404d1b659fe3d ChiaEn Wu 2022-10-11  299  	struct regmap *regmap;
c1404d1b659fe3d ChiaEn Wu 2022-10-11  300  	int ret;
c1404d1b659fe3d ChiaEn Wu 2022-10-11  301  
c1404d1b659fe3d ChiaEn Wu 2022-10-11  302  	regmap = dev_get_regmap(pdev->dev.parent, NULL);
c1404d1b659fe3d ChiaEn Wu 2022-10-11  303  	if (!regmap)
c1404d1b659fe3d ChiaEn Wu 2022-10-11  304  		return dev_err_probe(dev, -ENODEV, "Failed to get regmap\n");
c1404d1b659fe3d ChiaEn Wu 2022-10-11  305  
9822359d5de2dba ChiaEn Wu 2023-03-24 @306  	ret = mt6370_get_vendor_info(priv);
9822359d5de2dba ChiaEn Wu 2023-03-24  307  	if (ret)
9822359d5de2dba ChiaEn Wu 2023-03-24  308  		return dev_err_probe(dev, ret, "Failed to get vid\n");
9822359d5de2dba ChiaEn Wu 2023-03-24  309  
c1404d1b659fe3d ChiaEn Wu 2022-10-11  310  	indio_dev = devm_iio_device_alloc(dev, sizeof(*priv));
c1404d1b659fe3d ChiaEn Wu 2022-10-11  311  	if (!indio_dev)
c1404d1b659fe3d ChiaEn Wu 2022-10-11  312  		return -ENOMEM;
c1404d1b659fe3d ChiaEn Wu 2022-10-11  313  
c1404d1b659fe3d ChiaEn Wu 2022-10-11  314  	priv = iio_priv(indio_dev);
c1404d1b659fe3d ChiaEn Wu 2022-10-11  315  	priv->dev = dev;
c1404d1b659fe3d ChiaEn Wu 2022-10-11  316  	priv->regmap = regmap;
c1404d1b659fe3d ChiaEn Wu 2022-10-11  317  	mutex_init(&priv->adc_lock);
c1404d1b659fe3d ChiaEn Wu 2022-10-11  318  
c1404d1b659fe3d ChiaEn Wu 2022-10-11  319  	ret = regmap_write(priv->regmap, MT6370_REG_CHG_ADC, 0);
c1404d1b659fe3d ChiaEn Wu 2022-10-11  320  	if (ret)
c1404d1b659fe3d ChiaEn Wu 2022-10-11  321  		return dev_err_probe(dev, ret, "Failed to reset ADC\n");
c1404d1b659fe3d ChiaEn Wu 2022-10-11  322  
c1404d1b659fe3d ChiaEn Wu 2022-10-11  323  	indio_dev->name = "mt6370-adc";
c1404d1b659fe3d ChiaEn Wu 2022-10-11  324  	indio_dev->info = &mt6370_adc_iio_info;
c1404d1b659fe3d ChiaEn Wu 2022-10-11  325  	indio_dev->modes = INDIO_DIRECT_MODE;
c1404d1b659fe3d ChiaEn Wu 2022-10-11  326  	indio_dev->channels = mt6370_adc_channels;
c1404d1b659fe3d ChiaEn Wu 2022-10-11  327  	indio_dev->num_channels = ARRAY_SIZE(mt6370_adc_channels);
c1404d1b659fe3d ChiaEn Wu 2022-10-11  328  
c1404d1b659fe3d ChiaEn Wu 2022-10-11  329  	return devm_iio_device_register(dev, indio_dev);
c1404d1b659fe3d ChiaEn Wu 2022-10-11  330  }
c1404d1b659fe3d ChiaEn Wu 2022-10-11  331  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
