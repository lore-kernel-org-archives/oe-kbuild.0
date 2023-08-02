Received: from mgamail.intel.com (unknown [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433FF5230
	for <oe-kbuild@lists.linux.dev>; Wed,  2 Aug 2023 13:00:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690981206; x=1722517206;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=k5UURGAy+rdDN4TDyiCoA3pxofFFsq8pVWxyn2tnUnM=;
  b=MFbHDF5uZUnkIjuqJlZhcLH5I3CQx6lQ2+8VItQFWTZwRG2XfxzjsLXH
   69/WT33saCrF3tmNTuEa0Yq9Qs6rRoSRTM3YHMMngefXrYFz1y/GPmc+i
   VlU7J9RU7a7BRkedNEjDjrq4StcA6qXW0gcLSIpBD0dCmEyMv9iyjoNoM
   W7+p2aGHBNvgpUQlWVEOE5NbAqlvAS+F83UhlzGeJifguo0CQBFkDqNMJ
   JhSvjMKIt4jcNPpZUF01t0FzrMn8F/8aMb+cXFaTO7+w7i81maLuroieP
   bUu5nuFcgedTxaQ3HOt8img7UBKKU2l1YrYwg7QwO+COvaLxAXN+vxqby
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="368481803"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="368481803"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Aug 2023 06:00:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="843125788"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="843125788"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Aug 2023 06:00:03 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRBSM-0001Cx-1t;
	Wed, 02 Aug 2023 13:00:02 +0000
Date: Wed, 2 Aug 2023 20:59:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v7 2/7] nvmem: core: Do not open-code existing functions
Message-ID: <202308022032.L1zC4lik-lkp@intel.com>
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
In-Reply-To: <20230801182132.1058707-3-miquel.raynal@bootlin.com>
References: <20230801182132.1058707-3-miquel.raynal@bootlin.com>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: Robert Marko <robert.marko@sartura.hr>
CC: Luka Perkov <luka.perkov@sartura.hr>
CC: Michael Walle <michael@walle.cc>
CC: linux-kernel@vger.kernel.org
CC: Randy Dunlap <rdunlap@infradead.org>
CC: "Chen-Yu Tsai" <wenst@chromium.org>
CC: Daniel Golle <daniel@makrotopia.org>
CC: "Rafał Miłecki" <rafal@milecki.pl>
CC: Miquel Raynal <miquel.raynal@bootlin.com>

Hi Miquel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.5-rc4 next-20230802]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/nvmem-core-Create-all-cells-before-adding-the-nvmem-device/20230802-022331
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230801182132.1058707-3-miquel.raynal%40bootlin.com
patch subject: [PATCH v7 2/7] nvmem: core: Do not open-code existing functions
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: x86_64-randconfig-m001-20230730 (https://download.01.org/0day-ci/archive/20230802/202308022032.L1zC4lik-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230802/202308022032.L1zC4lik-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202308022032.L1zC4lik-lkp@intel.com/

New smatch warnings:
drivers/nvmem/core.c:793 nvmem_layout_get() warn: 'layout_np' is an error pointer or valid

Old smatch warnings:
drivers/nvmem/core.c:756 nvmem_add_cells_from_fixed_layout() warn: 'layout_np' is an error pointer or valid

vim +/layout_np +793 drivers/nvmem/core.c

266570f496b90d Michael Walle 2023-04-04  786  
266570f496b90d Michael Walle 2023-04-04  787  static struct nvmem_layout *nvmem_layout_get(struct nvmem_device *nvmem)
266570f496b90d Michael Walle 2023-04-04  788  {
58302db804f7b8 Miquel Raynal 2023-08-01  789  	struct device_node *layout_np;
6468a6f45148fb Miquel Raynal 2023-04-04  790  	struct nvmem_layout *l, *layout = ERR_PTR(-EPROBE_DEFER);
266570f496b90d Michael Walle 2023-04-04  791  
58302db804f7b8 Miquel Raynal 2023-08-01  792  	layout_np = of_nvmem_layout_get_container(nvmem);
266570f496b90d Michael Walle 2023-04-04 @793  	if (!layout_np)
266570f496b90d Michael Walle 2023-04-04  794  		return NULL;
266570f496b90d Michael Walle 2023-04-04  795  
b1c37bec1ccfe5 Miquel Raynal 2023-04-04  796  	/*
b1c37bec1ccfe5 Miquel Raynal 2023-04-04  797  	 * In case the nvmem device was built-in while the layout was built as a
b1c37bec1ccfe5 Miquel Raynal 2023-04-04  798  	 * module, we shall manually request the layout driver loading otherwise
b1c37bec1ccfe5 Miquel Raynal 2023-04-04  799  	 * we'll never have any match.
b1c37bec1ccfe5 Miquel Raynal 2023-04-04  800  	 */
b1c37bec1ccfe5 Miquel Raynal 2023-04-04  801  	of_request_module(layout_np);
b1c37bec1ccfe5 Miquel Raynal 2023-04-04  802  
266570f496b90d Michael Walle 2023-04-04  803  	spin_lock(&nvmem_layout_lock);
266570f496b90d Michael Walle 2023-04-04  804  
266570f496b90d Michael Walle 2023-04-04  805  	list_for_each_entry(l, &nvmem_layouts, node) {
266570f496b90d Michael Walle 2023-04-04  806  		if (of_match_node(l->of_match_table, layout_np)) {
266570f496b90d Michael Walle 2023-04-04  807  			if (try_module_get(l->owner))
266570f496b90d Michael Walle 2023-04-04  808  				layout = l;
266570f496b90d Michael Walle 2023-04-04  809  
266570f496b90d Michael Walle 2023-04-04  810  			break;
266570f496b90d Michael Walle 2023-04-04  811  		}
266570f496b90d Michael Walle 2023-04-04  812  	}
266570f496b90d Michael Walle 2023-04-04  813  
266570f496b90d Michael Walle 2023-04-04  814  	spin_unlock(&nvmem_layout_lock);
266570f496b90d Michael Walle 2023-04-04  815  	of_node_put(layout_np);
266570f496b90d Michael Walle 2023-04-04  816  
266570f496b90d Michael Walle 2023-04-04  817  	return layout;
266570f496b90d Michael Walle 2023-04-04  818  }
266570f496b90d Michael Walle 2023-04-04  819  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
