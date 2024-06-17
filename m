Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D782B9A3
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jun 2024 15:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718639062; cv=none; b=POWAZ5XMFF1dxEbOJls2+XHkgaAhR7LYcSZEv31Zu6Rb7smt8u25VcGWj7j0k2FiwXXLCvGJp+SuNGcWXPnTDGlSN0nJFVem3VZerx/P0NQ1jwZynfYrl38sLdMbJc8bwERJiOFXSa0M74D5pnSIBKJH7pOc2L5mioyU0THWw5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718639062; c=relaxed/simple;
	bh=8hdS2QqZb0dxWe1MD+/ufASvplClpXNK5pUFrWCDdt8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gA6Zz6gSJGh62ebTQZnrcaSgXOqET5FlVrSxICqIjRyKKEHm97WzDBdDySGX5Tb79BEN1xhNAsLbivQF1qUVFDq27gHsnw4ATonz7YR2UTkcm65kAFR7mjIwiDK+fPw4/D1pIR653G5j7xTlmFk8DafrT0SHublP5suOJKJzQ0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SAj2y3EI; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SAj2y3EI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718639061; x=1750175061;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8hdS2QqZb0dxWe1MD+/ufASvplClpXNK5pUFrWCDdt8=;
  b=SAj2y3EIsRLar8aGjVjh3lQhJybyjRoFLX6AMnAbbeHA1PqgYKEGbILa
   tEgV3YjqEtQPLjYTqQpDqDiFxo4QRBF2nQoNXY/1iMoHXSgUSthbQEZcV
   Wd+tPbmofS1tAnh8MkfV4hci+5cTlHuat9YQUhGbvMsSDOc7KqVePxib8
   TSavrAkmAlNrD2wS03TGA6YbSAq4PxTJvoyDBNSb9WKL8qmOp4FJ5G04W
   Ob0QdFrdDHbqSfQc3MMnPRKinYoXxVCCZD9xBsR3zrnZnbvsgOA8Q8HCm
   yANwW9uA0Vd+7717U82ZdSNHMBj9FggUxS1oUg034O4cPtQ2SiSCg4Lit
   g==;
X-CSE-ConnectionGUID: 7S2ffvkpQMy0NmSPmADXmg==
X-CSE-MsgGUID: X2IJuWSQREqYAFX6XxpfVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15596293"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="15596293"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 08:44:19 -0700
X-CSE-ConnectionGUID: +9b7oceCQMazzaPwwYLnOQ==
X-CSE-MsgGUID: KCsQhV+lTVu964/nDqJNIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41349224"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jun 2024 08:44:17 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJEWl-0004dh-1T;
	Mon, 17 Jun 2024 15:44:15 +0000
Date: Mon, 17 Jun 2024 23:43:23 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH V2] drivers: pci: dwc: configure multiple atu regions
Message-ID: <202406180107.DRkw1UpJ-lkp@intel.com>
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
In-Reply-To: <20240610235048.319266-1-shyamsaini@linux.microsoft.com>
References: <20240610235048.319266-1-shyamsaini@linux.microsoft.com>
TO: Shyam Saini <shyamsaini@linux.microsoft.com>
TO: jingoohan1@gmail.com
CC: Sergey.Semin@baikalelectronics.ru
CC: fancer.lancer@gmail.com
CC: manivannan.sadhasivam@linaro.org
CC: robh@kernel.org
CC: linux-pci@vger.kernel.org
CC: code@tyhicks.com
CC: apais@linux.microsoft.com
CC: bboscaccy@linux.microsoft.com
CC: okaya@kernel.org
CC: shyamsaini@linux.microsoft.com
CC: srivatsa@csail.mit.edu
CC: tballasi@linux.microsoft.com
CC: vijayb@linux.microsoft.com

Hi Shyam,

kernel test robot noticed the following build warnings:

[auto build test WARNING on pci/for-linus]
[also build test WARNING on linus/master v6.10-rc4]
[cannot apply to pci/next next-20240613]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shyam-Saini/drivers-pci-dwc-configure-multiple-atu-regions/20240611-075252
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git for-linus
patch link:    https://lore.kernel.org/r/20240610235048.319266-1-shyamsaini%40linux.microsoft.com
patch subject: [PATCH V2] drivers: pci: dwc: configure multiple atu regions
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: i386-randconfig-141-20240616 (https://download.01.org/0day-ci/archive/20240618/202406180107.DRkw1UpJ-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406180107.DRkw1UpJ-lkp@intel.com/

smatch warnings:
drivers/pci/controller/dwc/pcie-designware-host.c:679 dw_pcie_prog_outbound_atu_multi() error: uninitialized symbol 'ret'.

vim +/ret +679 drivers/pci/controller/dwc/pcie-designware-host.c

6bf4bd430cedf8 Shyam Saini 2024-06-10  659  
6bf4bd430cedf8 Shyam Saini 2024-06-10  660  static int dw_pcie_prog_outbound_atu_multi(struct dw_pcie *pci, int type,
6bf4bd430cedf8 Shyam Saini 2024-06-10  661  						struct resource_entry *entry)
6bf4bd430cedf8 Shyam Saini 2024-06-10  662  {
6bf4bd430cedf8 Shyam Saini 2024-06-10  663  	int idx, ret, num_regions;
6bf4bd430cedf8 Shyam Saini 2024-06-10  664  
6bf4bd430cedf8 Shyam Saini 2024-06-10  665  	num_regions = dw_pcie_num_atu_regions(entry);
6bf4bd430cedf8 Shyam Saini 2024-06-10  666  
6bf4bd430cedf8 Shyam Saini 2024-06-10  667  	for (idx = 0; idx < num_regions; idx++) {
6bf4bd430cedf8 Shyam Saini 2024-06-10  668  		dw_pcie_writel_dbi(pci, PCIE_ATU_VIEWPORT, idx);
6bf4bd430cedf8 Shyam Saini 2024-06-10  669  		ret = dw_pcie_prog_outbound_atu(pci, idx, PCIE_ATU_TYPE_MEM,
6bf4bd430cedf8 Shyam Saini 2024-06-10  670  						entry->res->start,
6bf4bd430cedf8 Shyam Saini 2024-06-10  671  						entry->res->start - entry->offset,
6bf4bd430cedf8 Shyam Saini 2024-06-10  672  						resource_size(entry->res)/4);
6bf4bd430cedf8 Shyam Saini 2024-06-10  673  
6bf4bd430cedf8 Shyam Saini 2024-06-10  674  		if (ret)
6bf4bd430cedf8 Shyam Saini 2024-06-10  675  			goto err;
6bf4bd430cedf8 Shyam Saini 2024-06-10  676  	}
6bf4bd430cedf8 Shyam Saini 2024-06-10  677  
6bf4bd430cedf8 Shyam Saini 2024-06-10  678  err:
6bf4bd430cedf8 Shyam Saini 2024-06-10 @679  	return ret;
6bf4bd430cedf8 Shyam Saini 2024-06-10  680  }
6bf4bd430cedf8 Shyam Saini 2024-06-10  681  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
