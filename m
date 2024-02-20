Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E9EF5BAC7
	for <oe-kbuild@lists.linux.dev>; Tue, 20 Feb 2024 07:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708415979; cv=none; b=o/eCkeH6rxImVk9J9sJCSxIXOELShmaMkwMCTHX/5RrF+JGrjzVUYZ7s4VIjARoV77hjPvvEskA9HNxyUrJzP3Nt4SaoZdblaiMbRS0NlZ1zfzSR1GLWkx67XCjWcBsxfn8G0DYWa+lojcKE797TasjzoPa7HodugToVc6cJxzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708415979; c=relaxed/simple;
	bh=8c/c4KxQr67DOFkev8XVkp+pcaGOLUKdfBIEWK0NeAc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=myqeQDmHlP9o7YHxLB/0bLkFb6tzIejZKUo2NpHsqdAczccx42BlphRt4IIUsRrGyBjzfxPJ6Oz7iuHEpvzxz4jgQwqpP+ooRA/mHgw315vfpEM5OearUda9LFUARC0X2fya0kh2x3qtMK57FPjWMwnEff/5sZwc0UVl4so6BDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xw3UpAoh; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xw3UpAoh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708415977; x=1739951977;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8c/c4KxQr67DOFkev8XVkp+pcaGOLUKdfBIEWK0NeAc=;
  b=Xw3UpAoh6N37D7U86gEsq/3RqHvZCw7Uh6JIjOV6S78V6m1hLdcRsg9F
   dT0xvjx3BttMUSpU8SsoPc2U+mxShu42U1jwOIMTCP9Dr/uuk0OMk8kFV
   3w475cW1tbNRUwoFejmed6R8O1pp0k4OMZlaFNDFXPGujd2lo+QsbdCGl
   trQSvjCsFxXktPhu4c8MSvrQha2RS3CCaM5bv/8h6v+Y1vG5jLXYqJs21
   NM/8tO+E7zRaiIjcEUF0mJ/XNTvzvyqtYq2KQVL1XwthD9IHQvcQyhsgt
   kr7Hczr50lhL4fWZYyDXNECnEoQ2sZLsl46Y9TAE6U7lotzGOUyjhck2Y
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10989"; a="2371192"
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="2371192"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 23:59:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,172,1705392000"; 
   d="scan'208";a="9354861"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 19 Feb 2024 23:59:34 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rcL1j-0004KC-0d;
	Tue, 20 Feb 2024 07:59:25 +0000
Date: Tue, 20 Feb 2024 15:58:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 12/33] fsi: core: Allow cfam device type aliases
Message-ID: <202402201532.dvENQrDs-lkp@intel.com>
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
In-Reply-To: <20240215220759.976998-13-eajames@linux.ibm.com>
References: <20240215220759.976998-13-eajames@linux.ibm.com>
TO: Eddie James <eajames@linux.ibm.com>
TO: linux-fsi@lists.ozlabs.org
CC: linux-kernel@vger.kernel.org
CC: linux-i2c@vger.kernel.org
CC: linux-clk@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: andi.shyti@kernel.org
CC: eajames@linux.ibm.com
CC: alistair@popple.id.au
CC: joel@jms.id.au
CC: jk@ozlabs.org
CC: sboyd@kernel.org
CC: mturquette@baylibre.com
CC: robh@kernel.org
CC: krzysztof.kozlowski+dt@linaro.org
CC: conor+dt@kernel.org

Hi Eddie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on robh/for-next clk/clk-next linus/master v6.8-rc5 next-20240219]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Eddie-James/dt-bindings-clock-ast2600-Add-FSI-clock/20240216-061934
base:   git://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20240215220759.976998-13-eajames%40linux.ibm.com
patch subject: [PATCH 12/33] fsi: core: Allow cfam device type aliases
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r081-20240216 (https://download.01.org/0day-ci/archive/20240220/202402201532.dvENQrDs-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 36adfec155de366d722f2bac8ff9162289dcf06c)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202402201532.dvENQrDs-lkp@intel.com/

smatch warnings:
drivers/fsi/fsi-core.c:919 __fsi_get_new_minor() error: testing array offset 'type' after use.

vim +/type +919 drivers/fsi/fsi-core.c

3f4ac5b0b27f16 Eddie James            2024-02-15  893  
3f4ac5b0b27f16 Eddie James            2024-02-15  894  static int __fsi_get_new_minor(struct fsi_slave *slave, struct device_node *np,
3f4ac5b0b27f16 Eddie James            2024-02-15  895  			       enum fsi_dev_type type, dev_t *out_dev, int *out_index)
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  896  {
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  897  	int cid = slave->chip_id;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  898  	int id;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  899  
3f4ac5b0b27f16 Eddie James            2024-02-15  900  	if (np) {
3f4ac5b0b27f16 Eddie James            2024-02-15  901  		int aid = of_alias_get_id(np, fsi_dev_type_names[type]);
3f4ac5b0b27f16 Eddie James            2024-02-15  902  
3f4ac5b0b27f16 Eddie James            2024-02-15  903  		if (aid >= 0) {
3f4ac5b0b27f16 Eddie James            2024-02-15  904  			/* Use the same scheme as the legacy numbers. */
3f4ac5b0b27f16 Eddie James            2024-02-15  905  			id = (aid << 2) | type;
3f4ac5b0b27f16 Eddie James            2024-02-15  906  			id = ida_alloc_range(&fsi_minor_ida, id, id, GFP_KERNEL);
3f4ac5b0b27f16 Eddie James            2024-02-15  907  			if (id >= 0) {
3f4ac5b0b27f16 Eddie James            2024-02-15  908  				*out_index = aid;
3f4ac5b0b27f16 Eddie James            2024-02-15  909  				*out_dev = fsi_base_dev + id;
3f4ac5b0b27f16 Eddie James            2024-02-15  910  				return 0;
3f4ac5b0b27f16 Eddie James            2024-02-15  911  			}
3f4ac5b0b27f16 Eddie James            2024-02-15  912  
3f4ac5b0b27f16 Eddie James            2024-02-15  913  			if (id != -ENOSPC)
3f4ac5b0b27f16 Eddie James            2024-02-15  914  				return id;
3f4ac5b0b27f16 Eddie James            2024-02-15  915  		}
3f4ac5b0b27f16 Eddie James            2024-02-15  916  	}
3f4ac5b0b27f16 Eddie James            2024-02-15  917  
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  918  	/* Check if we qualify for legacy numbering */
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20 @919  	if (cid >= 0 && cid < 16 && type < 4) {
641511bfcc5e01 Eddie James            2023-06-12  920  		/*
641511bfcc5e01 Eddie James            2023-06-12  921  		 * Try reserving the legacy number, which has 0 - 0x3f reserved
641511bfcc5e01 Eddie James            2023-06-12  922  		 * in the ida range. cid goes up to 0xf and type contains two
641511bfcc5e01 Eddie James            2023-06-12  923  		 * bits, so construct the id with the below two bit shift.
641511bfcc5e01 Eddie James            2023-06-12  924  		 */
641511bfcc5e01 Eddie James            2023-06-12  925  		id = (cid << 2) | type;
85f4e899de32ba Eddie James            2023-06-12  926  		id = ida_alloc_range(&fsi_minor_ida, id, id, GFP_KERNEL);
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  927  		if (id >= 0) {
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  928  			*out_index = fsi_adjust_index(cid);
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  929  			*out_dev = fsi_base_dev + id;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  930  			return 0;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  931  		}
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  932  		/* Other failure */
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  933  		if (id != -ENOSPC)
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  934  			return id;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  935  		/* Fallback to non-legacy allocation */
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  936  	}
85f4e899de32ba Eddie James            2023-06-12  937  	id = ida_alloc_range(&fsi_minor_ida, FSI_CHAR_LEGACY_TOP,
85f4e899de32ba Eddie James            2023-06-12  938  			     FSI_CHAR_MAX_DEVICES - 1, GFP_KERNEL);
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  939  	if (id < 0)
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  940  		return id;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  941  	*out_index = fsi_adjust_index(id);
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  942  	*out_dev = fsi_base_dev + id;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  943  	return 0;
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  944  }
0ab5fe5374743d Benjamin Herrenschmidt 2018-06-20  945  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
