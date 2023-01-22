Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5137629
	for <oe-kbuild@lists.linux.dev>; Sun, 22 Jan 2023 03:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674358634; x=1705894634;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v4JWriUKWIA6FM3rdYhKFYCNvZ1fFOTtj/QcitE66BI=;
  b=UksKYjawL7+4B70b67ezgcFQwOdeWblvHLK50GH5ouciN6D9D9ky+ME0
   VVm6P5BdMd2ghPpffvj867JIloy7Nt2NsaxpyeMQMhrjeP4UIRIdShnot
   DryGqaX0Mtigd1f85n8uZdmUKS0TF00F+nxOHx5hliLZpnHT3AkHEyfrO
   qPHy7g2ocI6dRLhM/nNauXKrtWo2wsX+5hNizOKHg+Wb22w1ibOko8WJW
   IXJUOGC1saxi0fPakLGl4BHcnq0HJSmi9TzCZiAWKhAEii2KpY2VpnM+x
   gazciUD9ZBf/HIGjQNiL+DoWEGGQr/YzS0GOtJE/DDhuqqWeO4Bte2Qz2
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="325901630"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="325901630"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2023 19:37:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10597"; a="989822134"
X-IronPort-AV: E=Sophos;i="5.97,235,1669104000"; 
   d="scan'208";a="989822134"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 21 Jan 2023 19:37:12 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJRAN-0004ii-1R;
	Sun, 22 Jan 2023 03:37:11 +0000
Date: Sun, 22 Jan 2023 11:36:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2222 mxc_jpeg_probe()
 warn: missing unwind goto?
Message-ID: <202301221146.nosxauaO-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Jian Zhang <zhangjian210@huawei.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Hans Verkuil <hverkuil@xs4all.nl>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2241ab53cbb5cdb08a6b2d4688feb13971058f65
commit: 5b304046a81eda221b5d06a9c62f7b5e45530fa5 media: driver/nxp/imx-jpeg: fix a unexpected return value problem
date:   7 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 7 months ago
config: mips-randconfig-m031-20230122 (https://download.01.org/0day-ci/archive/20230122/202301221146.nosxauaO-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c:2222 mxc_jpeg_probe() warn: missing unwind goto?

vim +2222 drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c

2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2154  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2155  static int mxc_jpeg_probe(struct platform_device *pdev)
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2156  {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2157  	struct mxc_jpeg_dev *jpeg;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2158  	struct device *dev = &pdev->dev;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2159  	int dec_irq;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2160  	int ret;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2161  	int mode;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2162  	const struct of_device_id *of_id;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2163  	unsigned int slot;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2164  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2165  	of_id = of_match_node(mxc_jpeg_match, dev->of_node);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2166  	mode = *(const int *)of_id->data;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2167  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2168  	jpeg = devm_kzalloc(dev, sizeof(struct mxc_jpeg_dev), GFP_KERNEL);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2169  	if (!jpeg)
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2170  		return -ENOMEM;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2171  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2172  	mutex_init(&jpeg->lock);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2173  	spin_lock_init(&jpeg->hw_lock);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2174  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2175  	ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2176  	if (ret) {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2177  		dev_err(&pdev->dev, "No suitable DMA available.\n");
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2178  		goto err_irq;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2179  	}
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2180  
a498a4e7af5022 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Cai Huoqing        2021-09-01  2181  	jpeg->base_reg = devm_platform_ioremap_resource(pdev, 0);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2182  	if (IS_ERR(jpeg->base_reg))
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2183  		return PTR_ERR(jpeg->base_reg);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2184  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2185  	for (slot = 0; slot < MXC_MAX_SLOTS; slot++) {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2186  		dec_irq = platform_get_irq(pdev, slot);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2187  		if (dec_irq < 0) {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2188  			ret = dec_irq;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2189  			goto err_irq;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2190  		}
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2191  		ret = devm_request_irq(&pdev->dev, dec_irq, mxc_jpeg_dec_irq,
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2192  				       0, pdev->name, jpeg);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2193  		if (ret) {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2194  			dev_err(&pdev->dev, "Failed to request irq %d (%d)\n",
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2195  				dec_irq, ret);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2196  			goto err_irq;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2197  		}
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2198  	}
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2199  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2200  	jpeg->pdev = pdev;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2201  	jpeg->dev = dev;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2202  	jpeg->mode = mode;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2203  
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2204  	/* Get clocks */
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2205  	jpeg->clk_ipg = devm_clk_get(dev, "ipg");
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2206  	if (IS_ERR(jpeg->clk_ipg)) {
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2207  		dev_err(dev, "failed to get clock: ipg\n");
5b304046a81eda drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c Jian Zhang         2022-06-20  2208  		ret = PTR_ERR(jpeg->clk_ipg);
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2209  		goto err_clk;
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2210  	}
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2211  
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2212  	jpeg->clk_per = devm_clk_get(dev, "per");
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2213  	if (IS_ERR(jpeg->clk_per)) {
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2214  		dev_err(dev, "failed to get clock: per\n");
5b304046a81eda drivers/media/platform/nxp/imx-jpeg/mxc-jpeg.c Jian Zhang         2022-06-20  2215  		ret = PTR_ERR(jpeg->clk_per);
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2216  		goto err_clk;
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2217  	}
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2218  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2219  	ret = mxc_jpeg_attach_pm_domains(jpeg);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2220  	if (ret < 0) {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2221  		dev_err(dev, "failed to attach power domains %d\n", ret);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11 @2222  		return ret;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2223  	}
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2224  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2225  	/* v4l2 */
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2226  	ret = v4l2_device_register(dev, &jpeg->v4l2_dev);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2227  	if (ret) {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2228  		dev_err(dev, "failed to register v4l2 device\n");
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2229  		goto err_register;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2230  	}
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2231  	jpeg->m2m_dev = v4l2_m2m_init(&mxc_jpeg_m2m_ops);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2232  	if (IS_ERR(jpeg->m2m_dev)) {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2233  		dev_err(dev, "failed to register v4l2 device\n");
fb3b597abdcec8 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Wei Yongjun        2021-03-23  2234  		ret = PTR_ERR(jpeg->m2m_dev);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2235  		goto err_m2m;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2236  	}
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2237  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2238  	jpeg->dec_vdev = video_device_alloc();
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2239  	if (!jpeg->dec_vdev) {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2240  		dev_err(dev, "failed to register v4l2 device\n");
fb3b597abdcec8 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Wei Yongjun        2021-03-23  2241  		ret = -ENOMEM;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2242  		goto err_vdev_alloc;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2243  	}
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2244  	if (mode == MXC_JPEG_ENCODE)
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2245  		snprintf(jpeg->dec_vdev->name,
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2246  			 sizeof(jpeg->dec_vdev->name),
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2247  			 "%s-enc", MXC_JPEG_NAME);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2248  	else
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2249  		snprintf(jpeg->dec_vdev->name,
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2250  			 sizeof(jpeg->dec_vdev->name),
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2251  			 "%s-dec", MXC_JPEG_NAME);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2252  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2253  	jpeg->dec_vdev->fops = &mxc_jpeg_fops;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2254  	jpeg->dec_vdev->ioctl_ops = &mxc_jpeg_ioctl_ops;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2255  	jpeg->dec_vdev->minor = -1;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2256  	jpeg->dec_vdev->release = video_device_release;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2257  	jpeg->dec_vdev->lock = &jpeg->lock; /* lock for ioctl serialization */
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2258  	jpeg->dec_vdev->v4l2_dev = &jpeg->v4l2_dev;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2259  	jpeg->dec_vdev->vfl_dir = VFL_DIR_M2M;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2260  	jpeg->dec_vdev->device_caps = V4L2_CAP_STREAMING |
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2261  					V4L2_CAP_VIDEO_M2M_MPLANE;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2262  	if (mode == MXC_JPEG_ENCODE) {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2263  		v4l2_disable_ioctl(jpeg->dec_vdev, VIDIOC_DECODER_CMD);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2264  		v4l2_disable_ioctl(jpeg->dec_vdev, VIDIOC_TRY_DECODER_CMD);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2265  	} else {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2266  		v4l2_disable_ioctl(jpeg->dec_vdev, VIDIOC_ENCODER_CMD);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2267  		v4l2_disable_ioctl(jpeg->dec_vdev, VIDIOC_TRY_ENCODER_CMD);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2268  	}
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2269  	ret = video_register_device(jpeg->dec_vdev, VFL_TYPE_VIDEO, -1);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2270  	if (ret) {
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2271  		dev_err(dev, "failed to register video device\n");
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2272  		goto err_vdev_register;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2273  	}
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2274  	video_set_drvdata(jpeg->dec_vdev, jpeg);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2275  	if (mode == MXC_JPEG_ENCODE)
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2276  		v4l2_info(&jpeg->v4l2_dev,
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2277  			  "encoder device registered as /dev/video%d (%d,%d)\n",
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2278  			  jpeg->dec_vdev->num, VIDEO_MAJOR,
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2279  			  jpeg->dec_vdev->minor);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2280  	else
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2281  		v4l2_info(&jpeg->v4l2_dev,
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2282  			  "decoder device registered as /dev/video%d (%d,%d)\n",
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2283  			  jpeg->dec_vdev->num, VIDEO_MAJOR,
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2284  			  jpeg->dec_vdev->minor);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2285  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2286  	platform_set_drvdata(pdev, jpeg);
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2287  	pm_runtime_enable(dev);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2288  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2289  	return 0;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2290  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2291  err_vdev_register:
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2292  	video_device_release(jpeg->dec_vdev);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2293  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2294  err_vdev_alloc:
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2295  	v4l2_m2m_release(jpeg->m2m_dev);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2296  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2297  err_m2m:
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2298  	v4l2_device_unregister(&jpeg->v4l2_dev);
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2299  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2300  err_register:
5c47dc6657543b drivers/media/platform/imx-jpeg/mxc-jpeg.c     Christophe JAILLET 2021-08-21  2301  	mxc_jpeg_detach_pm_domains(jpeg);
5c47dc6657543b drivers/media/platform/imx-jpeg/mxc-jpeg.c     Christophe JAILLET 2021-08-21  2302  
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2303  err_irq:
4c2e5156d9fa63 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-10-07  2304  err_clk:
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2305  	return ret;
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2306  }
2db16c6ed72ce6 drivers/media/platform/imx-jpeg/mxc-jpeg.c     Mirela Rabulea     2021-03-11  2307  

:::::: The code at line 2222 was first introduced by commit
:::::: 2db16c6ed72ce644d5639b3ed15e5817442db4ba media: imx-jpeg: Add V4L2 driver for i.MX8 JPEG Encoder/Decoder

:::::: TO: Mirela Rabulea <mirela.rabulea@nxp.com>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
