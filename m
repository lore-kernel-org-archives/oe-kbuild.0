Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F0E74501B
	for <oe-kbuild@lists.linux.dev>; Sun,  9 Jun 2024 14:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717943956; cv=none; b=cWqkep4kKQOSkALVrBl7sDuHX9e3IzORQt89ds+DTGHM79AcdBlYC0FUVq16QXmQroxzYbNT9O2G/Ji3inHpeVbe0k7D9cSNh8CUif/AxFb7JeAzmRYA8vdg5af/jmtEtEhCcVFTJKyQedrNjMYDhdh3GRuelMbOp94pbTSd5I0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717943956; c=relaxed/simple;
	bh=q8RO5J02QkDno9ZhHaegnhIUGN4uoqZUycAD8Kqi09c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Pd5z3SdXnFI5d+1Eg8RCmkkhVXnbDsojAcixkEDnxmOVps13b7NMc+fVMAr0rjGH+ZWn6/LKuRf1eNaI2Lb8o1PdrwhyoxPQMP/pvAfyvuhjoD17kFCIO6Xm7WR/04G494A45/BOb3c2larUFCph77Lm5rW1azWVnx53oNe9Cos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVHt4YwS; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVHt4YwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717943954; x=1749479954;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q8RO5J02QkDno9ZhHaegnhIUGN4uoqZUycAD8Kqi09c=;
  b=EVHt4YwSUNLgvgdyU8354FRvDnHB7Q8Tr0qn4pXOfWbA/U1HzgTrHadu
   ZkH0HpAtOFE6CxIcWMf25ZuV21UGOVxsd7PDghsegFiU6rqMwueCtMXZK
   hPeC9GzCDTAb5htlvFvlQKVdhPprVlVIUUepLoTgmxCdbF2/SovgEOZBq
   f/vYpvcYWLOFcIBEp0jBqMnIXjpjA0FBPgn/0xgektRCYL2R9kb/mGgSe
   WbeeYY3reqsO1AZIMv7lGQTwvgs0bUYcxf6uETJeAFakBQT9KLCkrQetd
   z/0lj7tGyroiXebvvSsq603K0Viuieq+cNDbD47HbUPr28+vnOhKetR5O
   w==;
X-CSE-ConnectionGUID: 6mBse4KTQv+kNNNd9p4HJQ==
X-CSE-MsgGUID: kIMMuV5/QDytEBL9LhCPRw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="14730965"
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="14730965"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 07:39:14 -0700
X-CSE-ConnectionGUID: 0WbPbKwxQueU1vgw/DGkbQ==
X-CSE-MsgGUID: x3hLAEWgQWOZGSHLuawi6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,225,1712646000"; 
   d="scan'208";a="43245613"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 09 Jun 2024 07:39:13 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGJhO-0001Ik-2Q;
	Sun, 09 Jun 2024 14:39:10 +0000
Date: Sun, 9 Jun 2024 22:39:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v4 2/2] vfio/pci: add msi interrupt affinity support
Message-ID: <202406092245.Hgx6MqK9-lkp@intel.com>
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
In-Reply-To: <20240607190955.15376-3-fgriffo@amazon.co.uk>
References: <20240607190955.15376-3-fgriffo@amazon.co.uk>
TO: Fred Griffoul <fgriffo@amazon.co.uk>
TO: griffoul@gmail.com
CC: Fred Griffoul <fgriffo@amazon.co.uk>
CC: Catalin Marinas <catalin.marinas@arm.com>
CC: Will Deacon <will@kernel.org>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: Waiman Long <longman@redhat.com>
CC: Zefan Li <lizefan.x@bytedance.com>
CC: Tejun Heo <tj@kernel.org>
CC: Johannes Weiner <hannes@cmpxchg.org>
CC: Mark Rutland <mark.rutland@arm.com>
CC: Marc Zyngier <maz@kernel.org>
CC: Oliver Upton <oliver.upton@linux.dev>
CC: Mark Brown <broonie@kernel.org>
CC: Ard Biesheuvel <ardb@kernel.org>
CC: Joey Gouly <joey.gouly@arm.com>
CC: Ryan Roberts <ryan.roberts@arm.com>
CC: Jeremy Linton <jeremy.linton@arm.com>
CC: Jason Gunthorpe <jgg@ziepe.ca>
CC: Yi Liu <yi.l.liu@intel.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: Eric Auger <eric.auger@redhat.com>
CC: Stefan Hajnoczi <stefanha@redhat.com>
CC: Christian Brauner <brauner@kernel.org>
CC: Ankit Agrawal <ankita@nvidia.com>
CC: Reinette Chatre <reinette.chatre@intel.com>
CC: Ye Bin <yebin10@huawei.com>
CC: linux-arm-kernel@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: kvm@vger.kernel.org
CC: cgroups@vger.kernel.org

Hi Fred,

kernel test robot noticed the following build warnings:

[auto build test WARNING on cbb325e77fbe62a06184175aa98c9eb98736c3e8]

url:    https://github.com/intel-lab-lkp/linux/commits/Fred-Griffoul/cgroup-cpuset-export-cpuset_cpus_allowed/20240608-031332
base:   cbb325e77fbe62a06184175aa98c9eb98736c3e8
patch link:    https://lore.kernel.org/r/20240607190955.15376-3-fgriffo%40amazon.co.uk
patch subject: [PATCH v4 2/2] vfio/pci: add msi interrupt affinity support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: mips-randconfig-r081-20240609 (https://download.01.org/0day-ci/archive/20240609/202406092245.Hgx6MqK9-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202406092245.Hgx6MqK9-lkp@intel.com/

New smatch warnings:
drivers/vfio/pci/vfio_pci_core.c:1241 vfio_pci_ioctl_set_irqs() warn: maybe return -EFAULT instead of the bytes remaining?

Old smatch warnings:
drivers/vfio/pci/vfio_pci_core.c:1036 vfio_pci_ioctl_get_region_info() warn: potential spectre issue 'pdev->resource' [w]

vim +1241 drivers/vfio/pci/vfio_pci_core.c

89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1189  
2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1190  static int vfio_pci_ioctl_set_irqs(struct vfio_pci_core_device *vdev,
663eab456e072b drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1191  				   struct vfio_irq_set __user *arg)
2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1192  {
2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1193  	unsigned long minsz = offsetofend(struct vfio_irq_set, count);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1194  	struct vfio_irq_set hdr;
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1195  	cpumask_var_t mask;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1196  	u8 *data = NULL;
05692d7005a364 drivers/vfio/pci/vfio_pci.c      Vlad Tsyrklevich 2016-10-12  1197  	int max, ret = 0;
ef198aaa169c61 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede   2016-11-17  1198  	size_t data_size = 0;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1199  
663eab456e072b drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1200  	if (copy_from_user(&hdr, arg, minsz))
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1201  		return -EFAULT;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1202  
05692d7005a364 drivers/vfio/pci/vfio_pci.c      Vlad Tsyrklevich 2016-10-12  1203  	max = vfio_pci_get_irq_count(vdev, hdr.index);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1204  
ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1205  	ret = vfio_set_irqs_validate_and_prepare(&hdr, max, VFIO_PCI_NUM_IRQS,
ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1206  						 &data_size);
ef198aaa169c61 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede   2016-11-17  1207  	if (ret)
ef198aaa169c61 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede   2016-11-17  1208  		return ret;
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1209  
ef198aaa169c61 drivers/vfio/pci/vfio_pci.c      Kirti Wankhede   2016-11-17  1210  	if (data_size) {
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1211  		if (hdr.flags & VFIO_IRQ_SET_DATA_AFFINITY) {
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1212  			if (!zalloc_cpumask_var(&mask, GFP_KERNEL))
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1213  				return -ENOMEM;
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1214  
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1215  			ret = copy_from_user(mask, &arg->data, data_size);
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1216  			if (ret)
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1217  				goto out;
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1218  
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1219  			data = (u8 *)mask;
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1220  
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1221  		} else {
663eab456e072b drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1222  			data = memdup_user(&arg->data, data_size);
3a1f7041ddd59e drivers/vfio/pci/vfio_pci.c      Fengguang Wu     2012-12-07  1223  			if (IS_ERR(data))
3a1f7041ddd59e drivers/vfio/pci/vfio_pci.c      Fengguang Wu     2012-12-07  1224  				return PTR_ERR(data);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1225  		}
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1226  	}
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1227  
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1228  	mutex_lock(&vdev->igate);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1229  
ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1230  	ret = vfio_pci_set_irqs_ioctl(vdev, hdr.flags, hdr.index, hdr.start,
ea3fc04d4fad2d drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1231  				      hdr.count, data);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1232  
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1233  	mutex_unlock(&vdev->igate);
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1234  
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1235  out:
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1236  	if (hdr.flags & VFIO_IRQ_SET_DATA_AFFINITY && data_size)
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1237  		free_cpumask_var(mask);
66c926fb7b2507 drivers/vfio/pci/vfio_pci_core.c Fred Griffoul    2024-06-07  1238  	else
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1239  		kfree(data);
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1240  
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31 @1241  	return ret;
2ecf3b58ed7bc5 drivers/vfio/pci/vfio_pci_core.c Jason Gunthorpe  2022-08-31  1242  }
89e1f7d4c66d85 drivers/vfio/pci/vfio_pci.c      Alex Williamson  2012-07-31  1243  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
