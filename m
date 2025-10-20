Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEBFD78F5D
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Oct 2025 07:10:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760944205; cv=none; b=rL3xueocL43mVmZNp5DuNbCFIF8+VYI/0wSUMXMHTIB2PL3amt7wAcvegxGiWaFz62Pe0MZmaP229AscISFxVgLbHeUqJhDw6H+VZ8AL2CKXZQLtuix7KMQanXQv/PIf5QFoBwMTY/I5bXpbzVXZAOH9ea5ywYZB0ONb+Qz5P4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760944205; c=relaxed/simple;
	bh=0NP5M5wkaggh1NGYldEDYF1TkZw81ttxPrdnds55pYI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tKHvZK6KmPqOckn3sT534iqP4MLQFTvh7awEvCcFTTyFnLKazZnUGqPb2Ee1MeYyg2z7tbs0oLM80RgraQKgB1w5/qozLYF44IwGYmdf/5OF4PcLgmTB4R09IrFUlvCXUuNJggJtdSymI7d/IeuuqjUJ1BYC/RMn2CDrk6+vYlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VFRN8cuZ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VFRN8cuZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760944202; x=1792480202;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0NP5M5wkaggh1NGYldEDYF1TkZw81ttxPrdnds55pYI=;
  b=VFRN8cuZjmz860XAdivhiH8/yYhYTe7NYDufKAzYQOL6EXQ/otLkWKWx
   SfghuWb8MctxEzkEUp7hDKWdNEdM3evljZe5sISHty2FZJBZV2SUL1rmA
   nZOgs5eNwZyBY24/oQTXQXwbTyqYl/AF0NSCnGZLlGBY7wh2eVgO9aasb
   g1deavJrGRbahrN/jSxrUekhE2+n23m4OD7LcfMujHyoEQ7Ke5xnNh63g
   peuYhGgqzVL6E75QGXdHOLIzxK1PqUMMdZCyXWYo6S0UHVz5kbIndI/L8
   pAJFMCzCI7x/p6t/FcO7FeDKr9AQqqBuL2HV1arV2t4KtHCkB0D5D4whK
   g==;
X-CSE-ConnectionGUID: KIiXsIJbSCi1rvg2PNX3FQ==
X-CSE-MsgGUID: 2QKsIoLlSIGcafmdQ4CdnA==
X-IronPort-AV: E=McAfee;i="6800,10657,11587"; a="73347767"
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="73347767"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2025 00:10:01 -0700
X-CSE-ConnectionGUID: KHa3NifNTmmC0uHz1AuxDw==
X-CSE-MsgGUID: rpPhtB8CR3yc5ep4SpQwrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,242,1754982000"; 
   d="scan'208";a="220409789"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2025 00:10:00 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vAk1l-0009Zt-1Z;
	Mon, 20 Oct 2025 07:09:57 +0000
Date: Mon, 20 Oct 2025 15:09:22 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 4/4] leds: Add virtualcolor LED group driver
Message-ID: <202510201457.uOrhkKly-lkp@intel.com>
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
In-Reply-To: <20251019092331.49531-5-professorjonny98@gmail.com>
References: <20251019092331.49531-5-professorjonny98@gmail.com>
TO: Jonathan Brophy <professorjonny98@gmail.com>
TO: lee Jones <lee@kernel.org>
TO: Pavel Machek <pavel@kernel.org>
TO: Jonathan Brophy <professor_jonny@hotmail.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Radoslav Tsvetkov <rtsvetkov@gradotech.eu>
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-leds@vger.kernel.org

Hi Jonathan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-leds/for-leds-next]
[also build test WARNING on robh/for-next linus/master v6.18-rc2 next-20251020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jonathan-Brophy/dt-bindings-Add-virtualcolor-class-dt-bindings-documentation/20251019-172647
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/leds.git for-leds-next
patch link:    https://lore.kernel.org/r/20251019092331.49531-5-professorjonny98%40gmail.com
patch subject: [PATCH v3 4/4] leds: Add virtualcolor LED group driver
:::::: branch date: 22 hours ago
:::::: commit date: 22 hours ago
config: parisc-randconfig-r072-20251020 (https://download.01.org/0day-ci/archive/20251020/202510201457.uOrhkKly-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202510201457.uOrhkKly-lkp@intel.com/

smatch warnings:
drivers/leds/rgb/leds-group-virtualcolor.c:303 parse_monochromatic_leds() warn: 'mono_count' unsigned <= 0
drivers/leds/rgb/leds-group-virtualcolor.c:303 parse_monochromatic_leds() warn: error code type promoted to positive: 'mono_count'

vim +/mono_count +303 drivers/leds/rgb/leds-group-virtualcolor.c

bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  292  
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  293  /**
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  294   * Parse monochromatic LEDs from device tree
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  295   */
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  296  static int parse_monochromatic_leds(struct device *dev, struct device_node *child,
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  297  				    struct virtual_led *vled)
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  298  {
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  299  	u32 mono_count;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  300  	int ret, i;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  301  
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  302  	mono_count = of_property_count_elems_of_size(child, "leds", sizeof(u32));
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19 @303  	if (mono_count <= 0) {
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  304  		vled->num_monochromatics = 0;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  305  		return 0;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  306  	}
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  307  
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  308  	vled->num_monochromatics = mono_count;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  309  	vled->monochromatics = devm_kcalloc(dev, vled->num_monochromatics,
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  310  					    sizeof(*vled->monochromatics), GFP_KERNEL);
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  311  	if (!vled->monochromatics)
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  312  		return -ENOMEM;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  313  
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  314  	for (i = 0; i < vled->num_monochromatics; i++) {
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  315  		struct led_classdev *led_cdev;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  316  
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  317  		led_cdev = devm_of_led_get(dev, i);
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  318  		if (IS_ERR(led_cdev)) {
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  319  			ret = PTR_ERR(led_cdev);
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  320  			return dev_err_probe(dev, ret,
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  321  					     "Failed to get monochromatic LED %d\n", i);
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  322  		}
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  323  
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  324  		vled->monochromatics[i] = led_cdev;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  325  	}
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  326  
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  327  	return 0;
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  328  }
bc8d39d8adf81b2 Jonathan Brophy 2025-10-19  329  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
