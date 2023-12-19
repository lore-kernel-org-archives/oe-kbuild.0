Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3B43D0A2
	for <oe-kbuild@lists.linux.dev>; Tue, 19 Dec 2023 22:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F10lYcf+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703023228; x=1734559228;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9r/XfE6Nikb+CmvCHt+x/cProXSQawh+vw3M9WDIC2Y=;
  b=F10lYcf+h0XBybUTpQZzLAG5fWqpId9w5yr2nw/lyhUukM09AcOH4aAv
   UKoCMtQKGl0yuzw0LzTEpe1bF3X1YPJ9N4oRT80NerzjYzR7qmoxgtAf7
   /EO74aam1eAyNrRSmeJ+Lkrm2Y9WkuZsUxPFfyQ36mww4ClrWMAgsKV3R
   QvTIu3drgvC81qbfXsEZZN56g7D4uHOleJNQpWXw5dRKLAOZ+ucFQzAIV
   aiBUMMN3qfU65W+0Q/3vI4O2tIAr3u/1fM/xnMjhI7MEkWwArSBMG9u3+
   U7yzODZx6VDCYs8BgyDvUa3FizUUbLasP30oiNL3jlCJxTAI4LRW6LnSA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="2819198"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="2819198"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 14:00:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10929"; a="769377469"
X-IronPort-AV: E=Sophos;i="6.04,289,1695711600"; 
   d="scan'208";a="769377469"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Dec 2023 14:00:26 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFi8W-00060i-0V;
	Tue, 19 Dec 2023 22:00:24 +0000
Date: Wed, 20 Dec 2023 05:59:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] platform/x86: serial-multi-instantiate: allow single
 GpioInt IRQ for INT3515
Message-ID: <202312200538.fJidUMf0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231212103823.546118-2-michal.kopec@3mdeb.com>
References: <20231212103823.546118-2-michal.kopec@3mdeb.com>
TO: "Michał Kopeć" <michal.kopec@3mdeb.com>
TO: linux-usb@vger.kernel.org
CC: "Michał Kopeć" <michal@nozomi.space>

Hi Michał,

kernel test robot noticed the following build warnings:

[auto build test WARNING on westeri-thunderbolt/next]
[also build test WARNING on linus/master v6.7-rc6 next-20231219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Micha-Kope/platform-x86-serial-multi-instantiate-allow-single-GpioInt-IRQ-for-INT3515/20231212-184116
base:   https://git.kernel.org/pub/scm/linux/kernel/git/westeri/thunderbolt.git next
patch link:    https://lore.kernel.org/r/20231212103823.546118-2-michal.kopec%403mdeb.com
patch subject: [PATCH] platform/x86: serial-multi-instantiate: allow single GpioInt IRQ for INT3515
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20231219 (https://download.01.org/0day-ci/archive/20231220/202312200538.fJidUMf0-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312200538.fJidUMf0-lkp@intel.com/

smatch warnings:
drivers/platform/x86/serial-multi-instantiate.c:79 smi_get_irq() warn: add some parenthesis here?
drivers/platform/x86/serial-multi-instantiate.c:79 smi_get_irq() warn: maybe use && instead of &

vim +79 drivers/platform/x86/serial-multi-instantiate.c

e64e84987de5486 drivers/platform/x86/i2c-multi-instantiate.c    Hans de Goede   2018-08-09  51  
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  52  static int smi_get_irq(struct platform_device *pdev, struct acpi_device *adev,
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  53  		       const struct smi_instance *inst)
e64e84987de5486 drivers/platform/x86/i2c-multi-instantiate.c    Hans de Goede   2018-08-09  54  {
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  55  	int ret;
e64e84987de5486 drivers/platform/x86/i2c-multi-instantiate.c    Hans de Goede   2018-08-09  56  
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  57  	switch (inst->flags & IRQ_RESOURCE_TYPE) {
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  58  	case IRQ_RESOURCE_AUTO:
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  59  		ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  60  		if (ret > 0) {
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  61  			dev_dbg(&pdev->dev, "Using gpio irq\n");
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  62  			break;
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  63  		}
fef1688e82fe3ee drivers/platform/x86/serial-multi-instantiate.c Michał Kopeć    2023-12-12  64  		ret = platform_get_irq_optional(pdev, inst->irq_idx);
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  65  		if (ret > 0) {
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  66  			dev_dbg(&pdev->dev, "Using platform irq\n");
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  67  			break;
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  68  		}
676b7c5ecab3627 drivers/platform/x86/serial-multi-instantiate.c David Xu        2023-07-13  69  		break;
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  70  	case IRQ_RESOURCE_GPIO:
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  71  		ret = acpi_dev_gpio_irq_get(adev, inst->irq_idx);
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  72  		break;
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  73  	case IRQ_RESOURCE_APIC:
fef1688e82fe3ee drivers/platform/x86/serial-multi-instantiate.c Michał Kopeć    2023-12-12  74  		ret = platform_get_irq_optional(pdev, inst->irq_idx);
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  75  		break;
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  76  	default:
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  77  		return 0;
e64e84987de5486 drivers/platform/x86/i2c-multi-instantiate.c    Hans de Goede   2018-08-09  78  	}
fef1688e82fe3ee drivers/platform/x86/serial-multi-instantiate.c Michał Kopeć    2023-12-12 @79  	if (ret < 0 && !inst->flags & IRQ_OPTIONAL)
14a9aa99aca6c28 drivers/platform/x86/serial-multi-instantiate.c Andy Shevchenko 2022-07-10  80  		return dev_err_probe(&pdev->dev, ret, "Error requesting irq at index %d\n",
14a9aa99aca6c28 drivers/platform/x86/serial-multi-instantiate.c Andy Shevchenko 2022-07-10  81  				     inst->irq_idx);
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  82  
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  83  	return ret;
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  84  }
35a36cbb7b1ce75 drivers/platform/x86/serial-multi-instantiate.c Lucas Tanure    2022-01-21  85  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
