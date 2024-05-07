Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E6A2E40F
	for <oe-kbuild@lists.linux.dev>; Tue,  7 May 2024 16:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715100279; cv=none; b=hl/cUD/FN0WGxVJnMQH2fvAoWbGSkuKyThTXE5msOrkwj0k6DdZ+ymqBrQ4gt8xX89AJc3sz2CmHm9nh5eKED5RrHNNXVg0anToYr/qnxIjd6IJdX/mV6r+2wibcjgWuN5sou+B6jaC9iO6M6pqw2Fx7iAWSLSYrGw14tVyIrFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715100279; c=relaxed/simple;
	bh=RmvwNXBkC6Ej8kXJdIEcOZ9Q5Zk0cis/TAXkNNmXFLs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QhysVJ5lmDg3PuCDk0eEql1CJ18bJSyl5LI973NjZade+AYOiym56v7ny5Ome5n4ww2uGefU5pfhHbH205XOxnJvBCWz7pVrG7mdcfKQ6caFUxVBhqvjjezM71IVXm8XyOQRXPpEI81J31PIUWelGUE/xukVwJwfkSAySP49qAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nrkbSSWE; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nrkbSSWE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715100277; x=1746636277;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RmvwNXBkC6Ej8kXJdIEcOZ9Q5Zk0cis/TAXkNNmXFLs=;
  b=nrkbSSWEChYxGvycDuYKWmCk7PZ7pCGrnemrOr0DiL5tJvKczJdw7IKz
   gJLxMblJolmGJIT1KOrl7UOs49/o0uyITTC3V3/gdePuSp7Uws2TUf+y2
   6eDS995Ry/Io46vuiYxBMqHSWGaJrgGIJyM1i9DcdyJOQUE62SbxhuMP+
   nAQKCUTr7Mb7X0Hbjh5iRsSgd7iVnyZuSE0p6HSAwewjCNqE/xLfSEym9
   bBJYUS7+CsIDqRLieB2yHA0NDUxFpvJALR25/7tVaItKS30/CHDerbN0R
   cEzn5V2yRQYjwmHgOuhCaiaGsKHw5IM/HE1xwn5z9aenrJb30UqkzC22C
   Q==;
X-CSE-ConnectionGUID: hkPR6SpJRNOh/l1iiVRCDA==
X-CSE-MsgGUID: HPD92BtWRv+HV//Vsn6PTQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="10752181"
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="10752181"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 09:44:37 -0700
X-CSE-ConnectionGUID: uSyKssGQTCati2kWgqOo+g==
X-CSE-MsgGUID: eEcczZPFQjO7TlHQ5fKxcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,142,1712646000"; 
   d="scan'208";a="29154809"
Received: from lkp-server01.sh.intel.com (HELO f8b243fe6e68) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 07 May 2024 09:44:35 -0700
Received: from kbuild by f8b243fe6e68 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s4Nvc-0002Ll-2x;
	Tue, 07 May 2024 16:44:32 +0000
Date: Wed, 8 May 2024 00:44:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 8490/11707]
 drivers/net/dsa/realtek/rtl8366rb.c:1032:4-15: ERROR: probable double put.
Message-ID: <202405080002.5LTn5tlS-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Luiz Angelo Daros de Luca <luizluca@gmail.com>
CC: Linus Walleij <linus.walleij@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   93a39e4766083050ca0ecd6a3548093a3b9eb60c
commit: 32d617005475a71ebcc4ec8b2791e8d1481e9a10 [8490/11707] net: dsa: realtek: add LED drivers for rtl8366rb
:::::: branch date: 9 hours ago
:::::: commit date: 8 days ago
config: microblaze-randconfig-r062-20240507 (https://download.01.org/0day-ci/archive/20240508/202405080002.5LTn5tlS-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202405080002.5LTn5tlS-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/net/dsa/realtek/rtl8366rb.c:1032:4-15: ERROR: probable double put.

vim +1032 drivers/net/dsa/realtek/rtl8366rb.c

32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1009  
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1010  static int rtl8366rb_setup_leds(struct realtek_priv *priv)
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1011  {
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1012  	struct device_node *leds_np, *led_np;
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1013  	struct dsa_switch *ds = &priv->ds;
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1014  	struct dsa_port *dp;
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1015  	int ret = 0;
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1016  
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1017  	dsa_switch_for_each_port(dp, ds) {
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1018  		if (!dp->dn)
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1019  			continue;
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1020  
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1021  		leds_np = of_get_child_by_name(dp->dn, "leds");
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1022  		if (!leds_np) {
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1023  			dev_dbg(priv->dev, "No leds defined for port %d",
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1024  				dp->index);
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1025  			continue;
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1026  		}
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1027  
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1028  		for_each_child_of_node(leds_np, led_np) {
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1029  			ret = rtl8366rb_setup_led(priv, dp,
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1030  						  of_fwnode_handle(led_np));
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1031  			if (ret) {
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27 @1032  				of_node_put(led_np);
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1033  				break;
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1034  			}
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1035  		}
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1036  
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1037  		of_node_put(leds_np);
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1038  		if (ret)
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1039  			return ret;
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1040  	}
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1041  	return 0;
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1042  }
32d617005475a71 Luiz Angelo Daros de Luca 2024-04-27  1043  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
