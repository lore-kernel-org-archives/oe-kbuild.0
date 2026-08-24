Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EE0A1990C7
	for <oe-kbuild@lists.linux.dev>; Mon, 24 Aug 2026 07:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556249; cv=none; b=PoEkGExaMMI9R6/gQP075drsooIJuVpazQk20fZdfxgDH4lExnlIYyXasF9Hzi1jv3kMsuMHRgKso98dVUBqNMK8RJLUDiSTH0McgK0BExav/HUDO4JLeEIRkvxta/nHNZo4zILjpATfRrsd/s5CbFaqfJuKqlPBkLEnCL6+96w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556249; c=relaxed/simple;
	bh=bMc6tFdnUDn+d49VBS6P8RWzDB4X0+wMTKoKy+e2CUM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D402bXPZB2K0KmTSsZBITEU3XXY+Q4TWyRC39MMivCuUVitAOwmoFSW0QC4+DJWMOD52qlSgM4dDEGz0uvcSXsQDa4/ttr5BUXHgldJB0Fguba36SoEQ4a/ucG8snj70Ay0uPnt6OrtISDPv8Q8eiUhsbCP01CwiWFh7RCnmS4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6OG3t61; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6OG3t61"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787556247; x=1819092247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bMc6tFdnUDn+d49VBS6P8RWzDB4X0+wMTKoKy+e2CUM=;
  b=d6OG3t615aEBHwru4CqFNaa0gkKp5cTQS03B9eIfdw5dcqyam+3oYakC
   /Z0lGQvmvvJUOXx4HPJ0h7mEBNqLXAI4t8XMpDnuAEMnhp1gI8lF9kZyW
   hCsKE5UVH2eCejCsXZwenKUydK2S7AX1uPz2N00cYpZn/XwAcdGXWRcac
   vFYhv4JLLz9pV6ivUm9X+9bf58irYjk5fSTgeiCexG07NBIfBbNX/6w+d
   hWA8XoxZmNLvaPeIGo8Ynyl+ibDE5M6mG40iyLGh/JF/H0q1KjxzG+Ijc
   01lOhliVlw+JZoc2Oq9KJpS5otZ05yL1IWNr4YnRN66lMkSHZHBn1L9rH
   w==;
X-CSE-ConnectionGUID: FNEj/ABcQ3WYNgmslFVOgw==
X-CSE-MsgGUID: 079RcDoOTQ2XWSNMBkW2qQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11884"; a="86950001"
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="86950001"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 00:24:06 -0700
X-CSE-ConnectionGUID: MFHTBsKVTrugprP46cbZng==
X-CSE-MsgGUID: qtP7QP9CQjqDh/3MdNLpxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,240,1779174000"; 
   d="scan'208";a="270725329"
Received: from lkp-server01.sh.intel.com (HELO 3532383e6126) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 24 Aug 2026 00:24:06 -0700
Received: from kbuild by 3532383e6126 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wyP2B-000000002S3-0CFY;
	Mon, 24 Aug 2026 07:24:00 +0000
Date: Mon, 24 Aug 2026 15:23:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] Input: novatek-nvt-ts - support being panel follower
Message-ID: <202608241543.nN8bvvPX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260718135316.785467-1-morf3089@gmail.com>
References: <20260718135316.785467-1-morf3089@gmail.com>
TO: Gianluca Boiano <morf3089@gmail.com>
TO: hansg@kernel.org
TO: dmitry.torokhov@gmail.com
CC: alexeymin@minlexx.ru
CC: linux-input@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Gianluca Boiano <morf3089@gmail.com>

Hi Gianluca,

kernel test robot noticed the following build errors:

[auto build test ERROR on dtor-input/next]
[also build test ERROR on dtor-input/for-linus linus/master v7.2 next-20260821]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Gianluca-Boiano/Input-novatek-nvt-ts-support-being-panel-follower/20260814-194645
base:   https://git.kernel.org/pub/scm/linux/kernel/git/dtor/input.git next
patch link:    https://lore.kernel.org/r/20260718135316.785467-1-morf3089%40gmail.com
patch subject: [PATCH] Input: novatek-nvt-ts - support being panel follower
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago
config: x86_64-randconfig-161-20251128 (https://download.01.org/0day-ci/archive/20260824/202608241543.nN8bvvPX-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260824/202608241543.nN8bvvPX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608241543.nN8bvvPX-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/input/touchscreen/novatek-nvt-ts.o: in function `nvt_ts_probe':
>> drivers/input/touchscreen/novatek-nvt-ts.c:382:(.text+0x1037): undefined reference to `drm_is_panel_follower'
>> ld: drivers/input/touchscreen/novatek-nvt-ts.c:390:(.text+0x10a2): undefined reference to `devm_drm_panel_add_follower'


vim +382 drivers/input/touchscreen/novatek-nvt-ts.c

409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  363  
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  364  static int nvt_ts_probe(struct i2c_client *client)
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  365  {
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  366  	struct device *dev = &client->dev;
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  367  	struct nvt_ts_data *data;
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  368  
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  369  	if (!client->irq) {
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  370  		dev_err(dev, "Error no irq specified\n");
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  371  		return -EINVAL;
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  372  	}
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  373  
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  374  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  375  	if (!data)
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  376  		return -ENOMEM;
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  377  
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  378  	data->client = client;
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  379  	i2c_set_clientdata(client, data);
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  380  
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  381  	/* Check if "panel = <&...>" is set in DT */
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18 @382  	if (drm_is_panel_follower(dev)) {
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  383  		data->is_panel_follower = true;
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  384  		data->panel_follower.funcs = &nvt_ts_follower_funcs;
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  385  		/*
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  386  		 * In this mode, we defer everything to the panel callbacks.
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  387  		 * The initial power on and input device registration will
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  388  		 * happen in on_novatek_panel_prepared().
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  389  		 */
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18 @390  		return devm_drm_panel_add_follower(dev, &data->panel_follower);
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  391  	}
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  392  
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  393  	return nvt_ts_initial_power_on_and_register_inputdev(data);
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  394  }
409af9ae8a8c78 Alexey Minnekhanov 2026-07-18  395  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
