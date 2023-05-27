Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EE7363C7
	for <oe-kbuild@lists.linux.dev>; Sat, 27 May 2023 16:34:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685205249; x=1716741249;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q69slsaf/Ge8CghVqV/AM3Ec+g5rctu0j86ycklkM6g=;
  b=VVhST8toJKafOk3Vdlny+rXOnoQfmON9wX30YSMit3Ccqk0908/nBuNO
   mH7qld/+vp7Yl9B8UA8pucipRLJcp0EQOpp0iUml71+ynH8m2rgE/GbZ3
   gwDhxsAxMPXd+51SQn0TLd4vda5RTIhobf/CLwm8h9wtVmr7Y0pwIrV8U
   qz3fNENKdziYAoNKHJNnUTy6sv7uDKd+q7HnL5sHGiXu1n8/a1IwuVRBc
   A93435c3gEH5Up4ZRI94m2Mbz3grcsFCDO5Od88+MJnn7UpGNDe4elZ+z
   SSfsSlNA16ZF/SOrqH5DHZ2UO0RXhjFS53lCj1jmYPUyiuYz4ueWUARqn
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="343918782"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="343918782"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2023 09:34:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10723"; a="829843350"
X-IronPort-AV: E=Sophos;i="6.00,197,1681196400"; 
   d="scan'208";a="829843350"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 27 May 2023 09:34:07 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q2wrm-000K4U-2h;
	Sat, 27 May 2023 16:34:06 +0000
Date: Sun, 28 May 2023 00:33:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] nvmem: core: Expose cells through sysfs
Message-ID: <202305280054.NloN5RLk-lkp@intel.com>
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
In-Reply-To: <20230523100239.307574-3-miquel.raynal@bootlin.com>
References: <20230523100239.307574-3-miquel.raynal@bootlin.com>
TO: Miquel Raynal <miquel.raynal@bootlin.com>
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Luka Perkov <luka.perkov@sartura.hr>
CC: Robert Marko <robert.marko@sartura.hr>
CC: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
CC: linux-kernel@vger.kernel.org
CC: Miquel Raynal <miquel.raynal@bootlin.com>

Hi Miquel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.4-rc3 next-20230525]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Miquel-Raynal/ABI-sysfs-nvmem-cells-Expose-cells-through-sysfs/20230523-203042
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230523100239.307574-3-miquel.raynal%40bootlin.com
patch subject: [PATCH 2/2] nvmem: core: Expose cells through sysfs
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: i386-randconfig-m021-20230525 (https://download.01.org/0day-ci/archive/20230528/202305280054.NloN5RLk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305280054.NloN5RLk-lkp@intel.com/

smatch warnings:
drivers/nvmem/core.c:380 nvmem_cell_attr_read() error: uninitialized symbol 'read_len'.

vim +/read_len +380 drivers/nvmem/core.c

2a4542e55f1b59 Srinivas Kandagatla 2020-04-17  327  
22c370b2163e59 Miquel Raynal       2023-05-23  328  static struct nvmem_cell *nvmem_create_cell(struct nvmem_cell_entry *entry,
22c370b2163e59 Miquel Raynal       2023-05-23  329  					    const char *id, int index);
22c370b2163e59 Miquel Raynal       2023-05-23  330  
22c370b2163e59 Miquel Raynal       2023-05-23  331  static ssize_t nvmem_cell_attr_read(struct file *filp, struct kobject *kobj,
22c370b2163e59 Miquel Raynal       2023-05-23  332  				    struct bin_attribute *attr, char *buf,
22c370b2163e59 Miquel Raynal       2023-05-23  333  				    loff_t pos, size_t count)
22c370b2163e59 Miquel Raynal       2023-05-23  334  {
22c370b2163e59 Miquel Raynal       2023-05-23  335  	struct nvmem_cell_entry *entry;
22c370b2163e59 Miquel Raynal       2023-05-23  336  	struct nvmem_cell *cell = NULL;
22c370b2163e59 Miquel Raynal       2023-05-23  337  	struct nvmem_device *nvmem;
22c370b2163e59 Miquel Raynal       2023-05-23  338  	size_t cell_sz, read_len;
22c370b2163e59 Miquel Raynal       2023-05-23  339  	struct device *dev;
22c370b2163e59 Miquel Raynal       2023-05-23  340  	void *content;
22c370b2163e59 Miquel Raynal       2023-05-23  341  
22c370b2163e59 Miquel Raynal       2023-05-23  342  	if (attr->private)
22c370b2163e59 Miquel Raynal       2023-05-23  343  		dev = attr->private;
22c370b2163e59 Miquel Raynal       2023-05-23  344  	else
22c370b2163e59 Miquel Raynal       2023-05-23  345  		dev = kobj_to_dev(kobj);
22c370b2163e59 Miquel Raynal       2023-05-23  346  	nvmem = to_nvmem_device(dev);
22c370b2163e59 Miquel Raynal       2023-05-23  347  
22c370b2163e59 Miquel Raynal       2023-05-23  348  	mutex_lock(&nvmem_mutex);
22c370b2163e59 Miquel Raynal       2023-05-23  349  	list_for_each_entry(entry, &nvmem->cells, node) {
22c370b2163e59 Miquel Raynal       2023-05-23  350  		if (strncmp(entry->name, attr->attr.name, XATTR_NAME_MAX))
22c370b2163e59 Miquel Raynal       2023-05-23  351  			continue;
22c370b2163e59 Miquel Raynal       2023-05-23  352  
22c370b2163e59 Miquel Raynal       2023-05-23  353  		cell = nvmem_create_cell(entry, entry->name, 0);
22c370b2163e59 Miquel Raynal       2023-05-23  354  		if (IS_ERR(cell)) {
22c370b2163e59 Miquel Raynal       2023-05-23  355  			mutex_unlock(&nvmem_mutex);
22c370b2163e59 Miquel Raynal       2023-05-23  356  			return PTR_ERR(cell);
22c370b2163e59 Miquel Raynal       2023-05-23  357  		}
22c370b2163e59 Miquel Raynal       2023-05-23  358  
22c370b2163e59 Miquel Raynal       2023-05-23  359  		break;
22c370b2163e59 Miquel Raynal       2023-05-23  360  	}
22c370b2163e59 Miquel Raynal       2023-05-23  361  	mutex_unlock(&nvmem_mutex);
22c370b2163e59 Miquel Raynal       2023-05-23  362  
22c370b2163e59 Miquel Raynal       2023-05-23  363  	if (!cell)
22c370b2163e59 Miquel Raynal       2023-05-23  364  		return -EINVAL;
22c370b2163e59 Miquel Raynal       2023-05-23  365  
22c370b2163e59 Miquel Raynal       2023-05-23  366  	content = nvmem_cell_read(cell, &cell_sz);
22c370b2163e59 Miquel Raynal       2023-05-23  367  	if (IS_ERR(content)) {
22c370b2163e59 Miquel Raynal       2023-05-23  368  		count = PTR_ERR(content);
22c370b2163e59 Miquel Raynal       2023-05-23  369  		goto destroy_cell;
22c370b2163e59 Miquel Raynal       2023-05-23  370  	}
22c370b2163e59 Miquel Raynal       2023-05-23  371  
22c370b2163e59 Miquel Raynal       2023-05-23  372  	read_len = min_t(unsigned int, cell_sz - pos, count);
22c370b2163e59 Miquel Raynal       2023-05-23  373  	memcpy(buf, content + pos, read_len);
22c370b2163e59 Miquel Raynal       2023-05-23  374  	kfree(content);
22c370b2163e59 Miquel Raynal       2023-05-23  375  
22c370b2163e59 Miquel Raynal       2023-05-23  376  destroy_cell:
22c370b2163e59 Miquel Raynal       2023-05-23  377  	kfree_const(cell->id);
22c370b2163e59 Miquel Raynal       2023-05-23  378  	kfree(cell);
22c370b2163e59 Miquel Raynal       2023-05-23  379  
22c370b2163e59 Miquel Raynal       2023-05-23 @380  	return read_len;
22c370b2163e59 Miquel Raynal       2023-05-23  381  }
22c370b2163e59 Miquel Raynal       2023-05-23  382  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
