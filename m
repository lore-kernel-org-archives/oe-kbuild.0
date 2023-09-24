Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7942E17DB
	for <oe-kbuild@lists.linux.dev>; Sun, 24 Sep 2023 12:28:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695558515; x=1727094515;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vOH9MJ/gVwbtx/AZoronNzVaTqKbg2+29RDH3ITrKYI=;
  b=cafS+ZbaV+rxA+72ejf3TJyVrkZ7UKiwg2gNSNY/Rzl83qF3zN40Ro3q
   zMKRZ8uJdSZm1tAJt83EfAgEF0cryyYhhhifPCIHHpVaDCCxXNMn8kJhj
   pMqNjBu2bADRH9asCHqCfZOKeekQ8BZZy6HDPohLatE+goJfp8H2XDkH/
   T5gQTAxtl/TFJ3nEsH1IC7h1xC8ExXl5GdCZNkfAJmuGYi/uLDBHqMst1
   KZ577fHsKf92x32kNxOVEYNElfR2/WYhyNaLJfEM0/5Y3wpa754Jd4D6R
   9U67gGDkBTyolb/t7WgUss5IG9Q0NKq/t2oYm5FwXXc6eiysHEdA38l3P
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="447574746"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="447574746"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2023 05:28:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10843"; a="748067017"
X-IronPort-AV: E=Sophos;i="6.03,173,1694761200"; 
   d="scan'208";a="748067017"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 24 Sep 2023 05:28:33 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qkODt-0003br-00;
	Sun, 24 Sep 2023 12:28:30 +0000
Date: Sun, 24 Sep 2023 20:28:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 73/1370]
 drivers/uio/uio_dmabuf.c:163 uio_dmabuf_unmap() warn: iterator used outside
 loop: 'dbuf_mem'
Message-ID: <202309242009.bIEJtFW3-lkp@intel.com>
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
CC: git@amd.com
TO: Hyun Kwon <hyun.kwon@xilinx.com>
CC: Michal Simek <monstr@monstr.eu>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   a19da02cf5b44420ec6afb1eef348c21d9e8cda2
commit: feeaa3240db8798db069908e242253ed41e2e83b [73/1370] uio: Add dma-buf import ioctls
:::::: branch date: 2 days ago
:::::: commit date: 9 months ago
config: i386-randconfig-141-20230924 (https://download.01.org/0day-ci/archive/20230924/202309242009.bIEJtFW3-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230924/202309242009.bIEJtFW3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309242009.bIEJtFW3-lkp@intel.com/

smatch warnings:
drivers/uio/uio_dmabuf.c:163 uio_dmabuf_unmap() warn: iterator used outside loop: 'dbuf_mem'

vim +/dbuf_mem +163 drivers/uio/uio_dmabuf.c

feeaa3240db8798 Hyun Kwon 2019-03-04  143  
feeaa3240db8798 Hyun Kwon 2019-03-04  144  long uio_dmabuf_unmap(struct uio_device *dev, struct list_head *dbufs,
feeaa3240db8798 Hyun Kwon 2019-03-04  145  		      struct mutex *dbufs_lock, void __user *user_args)
feeaa3240db8798 Hyun Kwon 2019-03-04  146  
feeaa3240db8798 Hyun Kwon 2019-03-04  147  {
feeaa3240db8798 Hyun Kwon 2019-03-04  148  	struct uio_dmabuf_args args;
feeaa3240db8798 Hyun Kwon 2019-03-04  149  	struct uio_dmabuf_mem *dbuf_mem;
feeaa3240db8798 Hyun Kwon 2019-03-04  150  	long ret;
feeaa3240db8798 Hyun Kwon 2019-03-04  151  
feeaa3240db8798 Hyun Kwon 2019-03-04  152  	if (copy_from_user(&args, user_args, sizeof(args))) {
feeaa3240db8798 Hyun Kwon 2019-03-04  153  		ret = -EFAULT;
feeaa3240db8798 Hyun Kwon 2019-03-04  154  		goto err;
feeaa3240db8798 Hyun Kwon 2019-03-04  155  	}
feeaa3240db8798 Hyun Kwon 2019-03-04  156  
feeaa3240db8798 Hyun Kwon 2019-03-04  157  	mutex_lock(dbufs_lock);
feeaa3240db8798 Hyun Kwon 2019-03-04  158  	list_for_each_entry(dbuf_mem, dbufs, list) {
feeaa3240db8798 Hyun Kwon 2019-03-04  159  		if (dbuf_mem->dbuf_fd == args.dbuf_fd)
feeaa3240db8798 Hyun Kwon 2019-03-04  160  			break;
feeaa3240db8798 Hyun Kwon 2019-03-04  161  	}
feeaa3240db8798 Hyun Kwon 2019-03-04  162  
feeaa3240db8798 Hyun Kwon 2019-03-04 @163  	if (dbuf_mem->dbuf_fd != args.dbuf_fd) {
feeaa3240db8798 Hyun Kwon 2019-03-04  164  		dev_err(dev->dev.parent, "failed to find the dmabuf (%d)\n",
feeaa3240db8798 Hyun Kwon 2019-03-04  165  			args.dbuf_fd);
feeaa3240db8798 Hyun Kwon 2019-03-04  166  		ret = -EINVAL;
feeaa3240db8798 Hyun Kwon 2019-03-04  167  		goto err_unlock;
feeaa3240db8798 Hyun Kwon 2019-03-04  168  	}
feeaa3240db8798 Hyun Kwon 2019-03-04  169  	list_del(&dbuf_mem->list);
feeaa3240db8798 Hyun Kwon 2019-03-04  170  	mutex_unlock(dbufs_lock);
feeaa3240db8798 Hyun Kwon 2019-03-04  171  
feeaa3240db8798 Hyun Kwon 2019-03-04  172  	dma_buf_unmap_attachment(dbuf_mem->dbuf_attach, dbuf_mem->sgt,
feeaa3240db8798 Hyun Kwon 2019-03-04  173  				 dbuf_mem->dir);
feeaa3240db8798 Hyun Kwon 2019-03-04  174  	dma_buf_detach(dbuf_mem->dbuf, dbuf_mem->dbuf_attach);
feeaa3240db8798 Hyun Kwon 2019-03-04  175  	dma_buf_put(dbuf_mem->dbuf);
feeaa3240db8798 Hyun Kwon 2019-03-04  176  	kfree(dbuf_mem);
feeaa3240db8798 Hyun Kwon 2019-03-04  177  
feeaa3240db8798 Hyun Kwon 2019-03-04  178  	memset(&args, 0x0, sizeof(args));
feeaa3240db8798 Hyun Kwon 2019-03-04  179  
feeaa3240db8798 Hyun Kwon 2019-03-04  180  	if (copy_to_user(user_args, &args, sizeof(args))) {
feeaa3240db8798 Hyun Kwon 2019-03-04  181  		ret = -EFAULT;
feeaa3240db8798 Hyun Kwon 2019-03-04  182  		goto err;
feeaa3240db8798 Hyun Kwon 2019-03-04  183  	}
feeaa3240db8798 Hyun Kwon 2019-03-04  184  
feeaa3240db8798 Hyun Kwon 2019-03-04  185  	return 0;
feeaa3240db8798 Hyun Kwon 2019-03-04  186  
feeaa3240db8798 Hyun Kwon 2019-03-04  187  err_unlock:
feeaa3240db8798 Hyun Kwon 2019-03-04  188  	mutex_unlock(dbufs_lock);
feeaa3240db8798 Hyun Kwon 2019-03-04  189  err:
feeaa3240db8798 Hyun Kwon 2019-03-04  190  	return ret;
feeaa3240db8798 Hyun Kwon 2019-03-04  191  }
feeaa3240db8798 Hyun Kwon 2019-03-04  192  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
