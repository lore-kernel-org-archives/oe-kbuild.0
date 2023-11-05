Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8BA17998
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Nov 2023 20:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gBtuVFHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699214901; x=1730750901;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=xU8+Gy6k/eKJKCIa+4R+uYqzlgSy5Mpy8ufz8eJKnT4=;
  b=gBtuVFHS0o825mIMBjlOmjCoiSBhtpy7vUe82dUzrtXC+EaZ2YxUCIJX
   afFJy7Rh4s/uJRXkTULnqwRe4ARX4kqIXq9AtRMZbRXb3dU5CBwnjAg2Y
   d5EjKXRQrGkRkZ/xjT6CTp0fiyOfuRd8CVfWBgeoFtrFJbJLQvqvJOvQy
   srn79XEAY94q9Q3jr3/rU9kcszeG51bLz7XG/iDOIJez3aeGfbyPiDQec
   ddIfIxxS6KbGFSxWyH4hoKtvSjlGYJEimRgo4gcL0NDkCvhsBqHQvl45B
   7wy1IV5thi28Y8GiFxo9BRTOWGoR9UUqDBDeBF9K22litP4GhI31Q7XyQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="2155071"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="2155071"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2023 12:08:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10885"; a="762127975"
X-IronPort-AV: E=Sophos;i="6.03,279,1694761200"; 
   d="scan'208";a="762127975"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 05 Nov 2023 12:08:18 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzjPs-0005lD-0F;
	Sun, 05 Nov 2023 20:08:16 +0000
Date: Mon, 6 Nov 2023 04:06:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/nvmem/meson-efuse.c:78:12: warning: cast from 'void
 (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function
 type
Message-ID: <202311060309.CGtlYUrQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "Committer is Greg Kroah-Hartman, remote is linus!"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Rafał Miłecki" <rafal@milecki.pl>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>
CC: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>

Hi Rafał,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   1c41041124bd14dd6610da256a3da4e5b74ce6b1
commit: 28fc7c986f01fdcfd28af648be2597624cac0e27 nvmem: prefix all symbols with NVMEM_
date:   1 year, 1 month ago
:::::: branch date: 17 hours ago
:::::: commit date: 1 year, 1 month ago
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20231106/202311060309.CGtlYUrQ-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231106/202311060309.CGtlYUrQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311060309.CGtlYUrQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvmem/meson-efuse.c:78:12: warning: cast from 'void (*)(struct clk *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
      78 |                                        (void(*)(void *))clk_disable_unprepare,
         |                                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +78 drivers/nvmem/meson-efuse.c

ad855eae6caf0d Carlo Caione   2016-08-27   40  
ad855eae6caf0d Carlo Caione   2016-08-27   41  static int meson_efuse_probe(struct platform_device *pdev)
ad855eae6caf0d Carlo Caione   2016-08-27   42  {
401488d121a4ec Jerome Brunet  2018-05-11   43  	struct device *dev = &pdev->dev;
8cde3c2153e8f5 Carlo Caione   2019-07-31   44  	struct meson_sm_firmware *fw;
8cde3c2153e8f5 Carlo Caione   2019-07-31   45  	struct device_node *sm_np;
ad855eae6caf0d Carlo Caione   2016-08-27   46  	struct nvmem_device *nvmem;
401488d121a4ec Jerome Brunet  2018-05-11   47  	struct nvmem_config *econfig;
611fbca1c86197 Jerome Brunet  2018-11-30   48  	struct clk *clk;
ad855eae6caf0d Carlo Caione   2016-08-27   49  	unsigned int size;
611fbca1c86197 Jerome Brunet  2018-11-30   50  	int ret;
611fbca1c86197 Jerome Brunet  2018-11-30   51  
8cde3c2153e8f5 Carlo Caione   2019-07-31   52  	sm_np = of_parse_phandle(pdev->dev.of_node, "secure-monitor", 0);
8cde3c2153e8f5 Carlo Caione   2019-07-31   53  	if (!sm_np) {
8cde3c2153e8f5 Carlo Caione   2019-07-31   54  		dev_err(&pdev->dev, "no secure-monitor node\n");
8cde3c2153e8f5 Carlo Caione   2019-07-31   55  		return -ENODEV;
8cde3c2153e8f5 Carlo Caione   2019-07-31   56  	}
8cde3c2153e8f5 Carlo Caione   2019-07-31   57  
8cde3c2153e8f5 Carlo Caione   2019-07-31   58  	fw = meson_sm_get(sm_np);
8cde3c2153e8f5 Carlo Caione   2019-07-31   59  	of_node_put(sm_np);
8cde3c2153e8f5 Carlo Caione   2019-07-31   60  	if (!fw)
8cde3c2153e8f5 Carlo Caione   2019-07-31   61  		return -EPROBE_DEFER;
8cde3c2153e8f5 Carlo Caione   2019-07-31   62  
611fbca1c86197 Jerome Brunet  2018-11-30   63  	clk = devm_clk_get(dev, NULL);
611fbca1c86197 Jerome Brunet  2018-11-30   64  	if (IS_ERR(clk)) {
611fbca1c86197 Jerome Brunet  2018-11-30   65  		ret = PTR_ERR(clk);
611fbca1c86197 Jerome Brunet  2018-11-30   66  		if (ret != -EPROBE_DEFER)
611fbca1c86197 Jerome Brunet  2018-11-30   67  			dev_err(dev, "failed to get efuse gate");
611fbca1c86197 Jerome Brunet  2018-11-30   68  		return ret;
611fbca1c86197 Jerome Brunet  2018-11-30   69  	}
611fbca1c86197 Jerome Brunet  2018-11-30   70  
611fbca1c86197 Jerome Brunet  2018-11-30   71  	ret = clk_prepare_enable(clk);
611fbca1c86197 Jerome Brunet  2018-11-30   72  	if (ret) {
611fbca1c86197 Jerome Brunet  2018-11-30   73  		dev_err(dev, "failed to enable gate");
611fbca1c86197 Jerome Brunet  2018-11-30   74  		return ret;
611fbca1c86197 Jerome Brunet  2018-11-30   75  	}
611fbca1c86197 Jerome Brunet  2018-11-30   76  
611fbca1c86197 Jerome Brunet  2018-11-30   77  	ret = devm_add_action_or_reset(dev,
611fbca1c86197 Jerome Brunet  2018-11-30  @78  				       (void(*)(void *))clk_disable_unprepare,
611fbca1c86197 Jerome Brunet  2018-11-30   79  				       clk);
611fbca1c86197 Jerome Brunet  2018-11-30   80  	if (ret) {
611fbca1c86197 Jerome Brunet  2018-11-30   81  		dev_err(dev, "failed to add disable callback");
611fbca1c86197 Jerome Brunet  2018-11-30   82  		return ret;
611fbca1c86197 Jerome Brunet  2018-11-30   83  	}
ad855eae6caf0d Carlo Caione   2016-08-27   84  
8cde3c2153e8f5 Carlo Caione   2019-07-31   85  	if (meson_sm_call(fw, SM_EFUSE_USER_MAX, &size, 0, 0, 0, 0, 0) < 0) {
8649dbe58d359c Jerome Brunet  2018-11-30   86  		dev_err(dev, "failed to get max user");
ad855eae6caf0d Carlo Caione   2016-08-27   87  		return -EINVAL;
8649dbe58d359c Jerome Brunet  2018-11-30   88  	}
ad855eae6caf0d Carlo Caione   2016-08-27   89  
401488d121a4ec Jerome Brunet  2018-05-11   90  	econfig = devm_kzalloc(dev, sizeof(*econfig), GFP_KERNEL);
401488d121a4ec Jerome Brunet  2018-05-11   91  	if (!econfig)
401488d121a4ec Jerome Brunet  2018-05-11   92  		return -ENOMEM;
401488d121a4ec Jerome Brunet  2018-05-11   93  
401488d121a4ec Jerome Brunet  2018-05-11   94  	econfig->dev = dev;
401488d121a4ec Jerome Brunet  2018-05-11   95  	econfig->name = dev_name(dev);
401488d121a4ec Jerome Brunet  2018-05-11   96  	econfig->stride = 1;
401488d121a4ec Jerome Brunet  2018-05-11   97  	econfig->word_size = 1;
401488d121a4ec Jerome Brunet  2018-05-11   98  	econfig->reg_read = meson_efuse_read;
e55077307d6f7c Jerome Brunet  2018-05-11   99  	econfig->reg_write = meson_efuse_write;
401488d121a4ec Jerome Brunet  2018-05-11  100  	econfig->size = size;
8cde3c2153e8f5 Carlo Caione   2019-07-31  101  	econfig->priv = fw;
ad855eae6caf0d Carlo Caione   2016-08-27  102  
401488d121a4ec Jerome Brunet  2018-05-11  103  	nvmem = devm_nvmem_register(&pdev->dev, econfig);
ad855eae6caf0d Carlo Caione   2016-08-27  104  
90696a4097e35f Andrey Smirnov 2018-03-09  105  	return PTR_ERR_OR_ZERO(nvmem);
ad855eae6caf0d Carlo Caione   2016-08-27  106  }
ad855eae6caf0d Carlo Caione   2016-08-27  107  

:::::: The code at line 78 was first introduced by commit
:::::: 611fbca1c861976e95a5244acf9f40bb0981977c nvmem: meson-efuse: add peripheral clock

:::::: TO: Jerome Brunet <jbrunet@baylibre.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
