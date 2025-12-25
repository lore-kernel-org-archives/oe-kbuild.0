Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B293910E3
	for <oe-kbuild@lists.linux.dev>; Thu, 25 Dec 2025 12:00:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766664037; cv=none; b=acnxVuM6ytK1rU90nF/6pnAz/C9FBdeLgbEqHWoj2asx8Rvwv944dQ5UBtyo/J2ASTK/waTPUv7aI1lzyMU7pr+X+yOD4n49Yz1I+vfIFQBEHt7hEXtrdWKCDKYvsqg4NRE78zaLQ88t5hvJub7ylWFSARo92EhcYLUnAuhOPt0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766664037; c=relaxed/simple;
	bh=r68pfiew/VNsBx0GijWBSl4tPHIAL0LGqxfG0w7Sz18=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VXNmO5RQqGv2G8XVYfm/5K8CfCGP86BGJgfmy3wlGNdIn4w2OqGsmnRL8YhSffw4X156FfxUGHlbeu7ubo31wQMYBThRu9c22b07iyhwdYzLVN86a6iLs0Fp9z4uOpFnNQAyrA+sgQMyXxRzkGGvrXV7JfdNjE2lzaxHBbXOk9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nQudAE2J; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nQudAE2J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766664036; x=1798200036;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=r68pfiew/VNsBx0GijWBSl4tPHIAL0LGqxfG0w7Sz18=;
  b=nQudAE2JVO1O4u9btY4ZHEI8OZM/Jgctv0sLYsVhKmkZJ8on0hlwhGu4
   5DqWk0rOYns75/3Lh1E8o7//nJM2IVtiqrHs33hhvNdEQvLY/4TKhWEWh
   FGvMCu9ZiLgld51+EDnpwgOkDdnxBtuYsc7vn4nWpuggW+4Imbg35/HSS
   lcnlZs2hIyipgvfFH6W/s9IaJyoQHMUy9hP3KyCzziYnl51XvqJt+gItA
   MHaAiEc+IjgwMvl5CQq0uaEicV1bZvf5VPyD/TDltWWiuKYzvcY6G4a7R
   lp3HxOlkG5gpugw2Df++8UnxNlNmHgiRoele/LyNW2c/p3mP7CuvTQbLS
   Q==;
X-CSE-ConnectionGUID: 26+16+GAQ8+HpHmBFP8ZbA==
X-CSE-MsgGUID: Twa0rXevRQebvhHZKUONOA==
X-IronPort-AV: E=McAfee;i="6800,10657,11652"; a="93935233"
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="93935233"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2025 04:00:35 -0800
X-CSE-ConnectionGUID: oQ2tDS58RkC84x14v3SI4Q==
X-CSE-MsgGUID: jLHt/SriQQeJw2HB7pxHFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,176,1763452800"; 
   d="scan'208";a="223688426"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 25 Dec 2025 04:00:32 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vYk16-00000000441-3EOw;
	Thu, 25 Dec 2025 12:00:28 +0000
Date: Thu, 25 Dec 2025 20:00:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v9 2/8] coresight: tmc: add create/clean functions for
 etr_buf_list
Message-ID: <202512251923.GDSbVal1-lkp@intel.com>
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
In-Reply-To: <20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4@oss.qualcomm.com>
References: <20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4@oss.qualcomm.com>
TO: Jie Gan <jie.gan@oss.qualcomm.com>
TO: Suzuki K Poulose <suzuki.poulose@arm.com>
TO: Mike Leach <mike.leach@linaro.org>
TO: James Clark <james.clark@linaro.org>
TO: Alexander Shishkin <alexander.shishkin@linux.intel.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>
TO: Mao Jinlong <jinlong.mao@oss.qualcomm.com>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Konrad Dybcio <konradybcio@kernel.org>
CC: coresight@lists.linaro.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: Jie Gan <jie.gan@oss.qualcomm.com>

Hi Jie,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 47b7b5e32bb7264b51b89186043e1ada4090b558]

url:    https://github.com/intel-lab-lkp/linux/commits/Jie-Gan/coresight-core-Refactoring-ctcu_get_active_port-and-make-it-generic/20251224-171604
base:   47b7b5e32bb7264b51b89186043e1ada4090b558
patch link:    https://lore.kernel.org/r/20251224-enable-byte-cntr-for-ctcu-v9-2-886c4496fed4%40oss.qualcomm.com
patch subject: [PATCH v9 2/8] coresight: tmc: add create/clean functions for etr_buf_list
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: arm-randconfig-r073-20251225 (https://download.01.org/0day-ci/archive/20251225/202512251923.GDSbVal1-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 4ef602d446057dabf5f61fb221669ecbeda49279)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202512251923.GDSbVal1-lkp@intel.com/

smatch warnings:
drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing freed memory 'new_node' (line 1991)
drivers/hwtracing/coresight/coresight-tmc-etr.c:1992 tmc_create_etr_buf_list() warn: passing zero to 'PTR_ERR'

vim +/new_node +1992 drivers/hwtracing/coresight/coresight-tmc-etr.c

34af91eeb7e78e Jie Gan 2025-12-24  1951  
34af91eeb7e78e Jie Gan 2025-12-24  1952  /**
34af91eeb7e78e Jie Gan 2025-12-24  1953   * tmc_create_etr_buf_list - create a list to manage the etr_buf_node.
34af91eeb7e78e Jie Gan 2025-12-24  1954   * @drvdata:	driver data of the TMC device.
34af91eeb7e78e Jie Gan 2025-12-24  1955   * @num_nodes:	number of nodes want to create with the list.
34af91eeb7e78e Jie Gan 2025-12-24  1956   *
34af91eeb7e78e Jie Gan 2025-12-24  1957   * Return 0 upon success and return the error number if fail.
34af91eeb7e78e Jie Gan 2025-12-24  1958   */
34af91eeb7e78e Jie Gan 2025-12-24  1959  int tmc_create_etr_buf_list(struct tmc_drvdata *drvdata, int num_nodes)
34af91eeb7e78e Jie Gan 2025-12-24  1960  {
34af91eeb7e78e Jie Gan 2025-12-24  1961  	struct etr_buf_node *new_node;
34af91eeb7e78e Jie Gan 2025-12-24  1962  	struct etr_buf *sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  1963  	int i = 0, ret = 0;
34af91eeb7e78e Jie Gan 2025-12-24  1964  
34af91eeb7e78e Jie Gan 2025-12-24  1965  	/* We dont need a list if there is only one node */
34af91eeb7e78e Jie Gan 2025-12-24  1966  	if (num_nodes < 2)
34af91eeb7e78e Jie Gan 2025-12-24  1967  		return -EINVAL;
34af91eeb7e78e Jie Gan 2025-12-24  1968  
34af91eeb7e78e Jie Gan 2025-12-24  1969  	/* We expect that sysfs_buf in drvdata has already been allocated. */
34af91eeb7e78e Jie Gan 2025-12-24  1970  	if (drvdata->sysfs_buf) {
34af91eeb7e78e Jie Gan 2025-12-24  1971  		/* Directly insert the allocated sysfs_buf into the list first */
34af91eeb7e78e Jie Gan 2025-12-24  1972  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
34af91eeb7e78e Jie Gan 2025-12-24  1973  		if (IS_ERR(new_node))
34af91eeb7e78e Jie Gan 2025-12-24  1974  			return PTR_ERR(new_node);
34af91eeb7e78e Jie Gan 2025-12-24  1975  
34af91eeb7e78e Jie Gan 2025-12-24  1976  		new_node->sysfs_buf = drvdata->sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  1977  		new_node->is_free = false;
34af91eeb7e78e Jie Gan 2025-12-24  1978  		list_add(&new_node->node, &drvdata->etr_buf_list);
34af91eeb7e78e Jie Gan 2025-12-24  1979  		i++;
34af91eeb7e78e Jie Gan 2025-12-24  1980  	}
34af91eeb7e78e Jie Gan 2025-12-24  1981  
34af91eeb7e78e Jie Gan 2025-12-24  1982  	while (i < num_nodes) {
34af91eeb7e78e Jie Gan 2025-12-24  1983  		new_node = kzalloc(sizeof(struct etr_buf_node), GFP_KERNEL);
34af91eeb7e78e Jie Gan 2025-12-24  1984  		if (IS_ERR(new_node)) {
34af91eeb7e78e Jie Gan 2025-12-24  1985  			ret = PTR_ERR(new_node);
34af91eeb7e78e Jie Gan 2025-12-24  1986  			break;
34af91eeb7e78e Jie Gan 2025-12-24  1987  		}
34af91eeb7e78e Jie Gan 2025-12-24  1988  
34af91eeb7e78e Jie Gan 2025-12-24  1989  		sysfs_buf = tmc_alloc_etr_buf(drvdata, drvdata->size, 0, cpu_to_node(0), NULL);
34af91eeb7e78e Jie Gan 2025-12-24  1990  		if (IS_ERR(sysfs_buf)) {
34af91eeb7e78e Jie Gan 2025-12-24 @1991  			kfree(new_node);
34af91eeb7e78e Jie Gan 2025-12-24 @1992  			ret = PTR_ERR(new_node);
34af91eeb7e78e Jie Gan 2025-12-24  1993  			break;
34af91eeb7e78e Jie Gan 2025-12-24  1994  		}
34af91eeb7e78e Jie Gan 2025-12-24  1995  
34af91eeb7e78e Jie Gan 2025-12-24  1996  		/* We dont have a available sysfs_buf in drvdata, setup one */
34af91eeb7e78e Jie Gan 2025-12-24  1997  		if (!drvdata->sysfs_buf) {
34af91eeb7e78e Jie Gan 2025-12-24  1998  			drvdata->sysfs_buf = sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  1999  			new_node->is_free = false;
34af91eeb7e78e Jie Gan 2025-12-24  2000  		} else
34af91eeb7e78e Jie Gan 2025-12-24  2001  			new_node->is_free = true;
34af91eeb7e78e Jie Gan 2025-12-24  2002  
34af91eeb7e78e Jie Gan 2025-12-24  2003  		new_node->sysfs_buf = sysfs_buf;
34af91eeb7e78e Jie Gan 2025-12-24  2004  		list_add(&new_node->node, &drvdata->etr_buf_list);
34af91eeb7e78e Jie Gan 2025-12-24  2005  		i++;
34af91eeb7e78e Jie Gan 2025-12-24  2006  	}
34af91eeb7e78e Jie Gan 2025-12-24  2007  
34af91eeb7e78e Jie Gan 2025-12-24  2008  	/* Clean the list if there is an error */
34af91eeb7e78e Jie Gan 2025-12-24  2009  	if (ret)
34af91eeb7e78e Jie Gan 2025-12-24  2010  		tmc_clean_etr_buf_list(drvdata);
34af91eeb7e78e Jie Gan 2025-12-24  2011  
34af91eeb7e78e Jie Gan 2025-12-24  2012  	return ret;
34af91eeb7e78e Jie Gan 2025-12-24  2013  }
34af91eeb7e78e Jie Gan 2025-12-24  2014  EXPORT_SYMBOL_GPL(tmc_create_etr_buf_list);
34af91eeb7e78e Jie Gan 2025-12-24  2015  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
