Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862242F21
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jan 2023 16:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674060669; x=1705596669;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sMKMslHgAjVW4WNOTO2kdSLxR5sHstazfzkYSAh88oc=;
  b=CB3iaIqNUNkaXC3kMcVqG4Ar4S6TIhdTEIvqexipvzQmjBWaFi1Z0+eR
   S/g7vqz6T+anFlLhIOQLDmU3rsuCxavwxv0cXcteOEWO32gGZgM6+GCns
   t6nTiTHiejL6fqoi/We/Z7H9zS57kZ+noZyYKKR4lQi8NSzySMa+5qtGL
   hqPpQ+iTC6alglcxQMeY08ZRmidU5OKn8pkbFemYmIwn6nYabmu9k4feP
   QOetvWIk4PKTJ9OY/7WBSsW/mrJr5EWeyy+NKHcgUEWslC+E+0ZNR6lJU
   Nkpi4UgibX098JQ+egU+OGsoR/1BxrC8cJXCqbJNqexwx8vyFq2DDrnYD
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="323715963"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="323715963"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 08:51:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="767824596"
X-IronPort-AV: E=Sophos;i="5.97,226,1669104000"; 
   d="scan'208";a="767824596"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 18 Jan 2023 08:51:02 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIBeK-0000X7-2O;
	Wed, 18 Jan 2023 16:50:56 +0000
Date: Thu, 19 Jan 2023 00:50:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [leon-rdma:rdma-next 27/28] drivers/nvme/host/rdma.c:420:12:
 warning: 'nvme_rdma_crypto_keyslot_evict' defined but not used
Message-ID: <202301190016.bBLvEKIJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "gcc: unused function warning for stub function"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Israel Rukshin <israelr@nvidia.com>
CC: Leon Romanovsky <leon@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git rdma-next
head:   d26d5571e19e3ab7c9cffea17fc5fb00078d9472
commit: ab0817fac98d498372fd32e950d1ca6e157b575d [27/28] nvme-rdma: Add inline encryption support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: i386-debian-10.3-func (https://download.01.org/0day-ci/archive/20230119/202301190016.bBLvEKIJ-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git/commit/?id=ab0817fac98d498372fd32e950d1ca6e157b575d
        git remote add leon-rdma https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git
        git fetch --no-tags leon-rdma rdma-next
        git checkout ab0817fac98d498372fd32e950d1ca6e157b575d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash drivers/nvme/host/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> drivers/nvme/host/rdma.c:420:12: warning: 'nvme_rdma_crypto_keyslot_evict' defined but not used [-Wunused-function]
     420 | static int nvme_rdma_crypto_keyslot_evict(struct blk_crypto_profile *profile,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> drivers/nvme/host/rdma.c:377:12: warning: 'nvme_rdma_crypto_keyslot_program' defined but not used [-Wunused-function]
     377 | static int nvme_rdma_crypto_keyslot_program(struct blk_crypto_profile *profile,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/nvme_rdma_crypto_keyslot_evict +420 drivers/nvme/host/rdma.c

71102307196028 Christoph Hellwig 2016-07-06  376  
ab0817fac98d49 Israel Rukshin    2022-02-23 @377  static int nvme_rdma_crypto_keyslot_program(struct blk_crypto_profile *profile,
ab0817fac98d49 Israel Rukshin    2022-02-23  378  					    const struct blk_crypto_key *key,
ab0817fac98d49 Israel Rukshin    2022-02-23  379  					    unsigned int slot)
ab0817fac98d49 Israel Rukshin    2022-02-23  380  {
ab0817fac98d49 Israel Rukshin    2022-02-23  381  	struct nvme_ctrl *nctrl =
ab0817fac98d49 Israel Rukshin    2022-02-23  382  		container_of(profile, struct nvme_ctrl, crypto_profile);
ab0817fac98d49 Israel Rukshin    2022-02-23  383  	struct nvme_rdma_ctrl *ctrl = to_rdma_ctrl(nctrl);
ab0817fac98d49 Israel Rukshin    2022-02-23  384  	struct ib_dek_attr dek_attr = { };
ab0817fac98d49 Israel Rukshin    2022-02-23  385  	int err = 0;
ab0817fac98d49 Israel Rukshin    2022-02-23  386  
ab0817fac98d49 Israel Rukshin    2022-02-23  387  	if (slot > NVME_RDMA_NUM_CRYPTO_KEYSLOTS) {
ab0817fac98d49 Israel Rukshin    2022-02-23  388  		dev_err(nctrl->device, "slot index reached the limit %d/%d",
ab0817fac98d49 Israel Rukshin    2022-02-23  389  			slot, NVME_RDMA_NUM_CRYPTO_KEYSLOTS);
ab0817fac98d49 Israel Rukshin    2022-02-23  390  		return -EOPNOTSUPP;
ab0817fac98d49 Israel Rukshin    2022-02-23  391  	}
ab0817fac98d49 Israel Rukshin    2022-02-23  392  
ab0817fac98d49 Israel Rukshin    2022-02-23  393  	if (WARN_ON_ONCE(key->crypto_cfg.crypto_mode !=
ab0817fac98d49 Israel Rukshin    2022-02-23  394  			 BLK_ENCRYPTION_MODE_AES_256_XTS))
ab0817fac98d49 Israel Rukshin    2022-02-23  395  		return -EOPNOTSUPP;
ab0817fac98d49 Israel Rukshin    2022-02-23  396  
ab0817fac98d49 Israel Rukshin    2022-02-23  397  	if (ctrl->dek[slot]) {
ab0817fac98d49 Israel Rukshin    2022-02-23  398  		dev_dbg(nctrl->device, "slot %d is taken, free DEK ID %d\n",
ab0817fac98d49 Israel Rukshin    2022-02-23  399  			slot, ctrl->dek[slot]->id);
ab0817fac98d49 Israel Rukshin    2022-02-23  400  		ib_destroy_dek(ctrl->dek[slot]);
ab0817fac98d49 Israel Rukshin    2022-02-23  401  	}
ab0817fac98d49 Israel Rukshin    2022-02-23  402  
ab0817fac98d49 Israel Rukshin    2022-02-23  403  	dek_attr.key_blob = key->raw;
ab0817fac98d49 Israel Rukshin    2022-02-23  404  	dek_attr.key_blob_size = key->size;
ab0817fac98d49 Israel Rukshin    2022-02-23  405  	dek_attr.key_type = IB_CRYPTO_KEY_TYPE_AES_XTS;
ab0817fac98d49 Israel Rukshin    2022-02-23  406  	ctrl->dek[slot] = ib_create_dek(ctrl->device->pd, &dek_attr);
ab0817fac98d49 Israel Rukshin    2022-02-23  407  	if (IS_ERR(ctrl->dek[slot])) {
ab0817fac98d49 Israel Rukshin    2022-02-23  408  		err = PTR_ERR(ctrl->dek[slot]);
ab0817fac98d49 Israel Rukshin    2022-02-23  409  		dev_err(nctrl->device,
ab0817fac98d49 Israel Rukshin    2022-02-23  410  			"failed to create DEK at slot %d, err %d\n", slot, err);
ab0817fac98d49 Israel Rukshin    2022-02-23  411  		ctrl->dek[slot] = NULL;
ab0817fac98d49 Israel Rukshin    2022-02-23  412  	} else {
ab0817fac98d49 Israel Rukshin    2022-02-23  413  		dev_dbg(nctrl->device, "DEK ID %d was created at slot %d\n",
ab0817fac98d49 Israel Rukshin    2022-02-23  414  			ctrl->dek[slot]->id, slot);
ab0817fac98d49 Israel Rukshin    2022-02-23  415  	}
ab0817fac98d49 Israel Rukshin    2022-02-23  416  
ab0817fac98d49 Israel Rukshin    2022-02-23  417  	return err;
ab0817fac98d49 Israel Rukshin    2022-02-23  418  }
ab0817fac98d49 Israel Rukshin    2022-02-23  419  
ab0817fac98d49 Israel Rukshin    2022-02-23 @420  static int nvme_rdma_crypto_keyslot_evict(struct blk_crypto_profile *profile,
ab0817fac98d49 Israel Rukshin    2022-02-23  421  					  const struct blk_crypto_key *key,
ab0817fac98d49 Israel Rukshin    2022-02-23  422  					  unsigned int slot)
ab0817fac98d49 Israel Rukshin    2022-02-23  423  {
ab0817fac98d49 Israel Rukshin    2022-02-23  424  	struct nvme_ctrl *nctrl =
ab0817fac98d49 Israel Rukshin    2022-02-23  425  		container_of(profile, struct nvme_ctrl, crypto_profile);
ab0817fac98d49 Israel Rukshin    2022-02-23  426  	struct nvme_rdma_ctrl *ctrl = to_rdma_ctrl(nctrl);
ab0817fac98d49 Israel Rukshin    2022-02-23  427  
ab0817fac98d49 Israel Rukshin    2022-02-23  428  	if (slot > NVME_RDMA_NUM_CRYPTO_KEYSLOTS) {
ab0817fac98d49 Israel Rukshin    2022-02-23  429  		dev_err(nctrl->device, "slot index reached the limit %d/%d\n",
ab0817fac98d49 Israel Rukshin    2022-02-23  430  			slot, NVME_RDMA_NUM_CRYPTO_KEYSLOTS);
ab0817fac98d49 Israel Rukshin    2022-02-23  431  		return -EOPNOTSUPP;
ab0817fac98d49 Israel Rukshin    2022-02-23  432  	}
ab0817fac98d49 Israel Rukshin    2022-02-23  433  
ab0817fac98d49 Israel Rukshin    2022-02-23  434  	if (!ctrl->dek[slot]) {
ab0817fac98d49 Israel Rukshin    2022-02-23  435  		dev_err(nctrl->device, "slot %d is empty\n", slot);
ab0817fac98d49 Israel Rukshin    2022-02-23  436  		return -EINVAL;
ab0817fac98d49 Israel Rukshin    2022-02-23  437  	}
ab0817fac98d49 Israel Rukshin    2022-02-23  438  
ab0817fac98d49 Israel Rukshin    2022-02-23  439  	dev_dbg(nctrl->device, "Destroy DEK ID %d slot %d\n",
ab0817fac98d49 Israel Rukshin    2022-02-23  440  		ctrl->dek[slot]->id, slot);
ab0817fac98d49 Israel Rukshin    2022-02-23  441  
ab0817fac98d49 Israel Rukshin    2022-02-23  442  	ib_destroy_dek(ctrl->dek[slot]);
ab0817fac98d49 Israel Rukshin    2022-02-23  443  	ctrl->dek[slot] = NULL;
ab0817fac98d49 Israel Rukshin    2022-02-23  444  
ab0817fac98d49 Israel Rukshin    2022-02-23  445  	return 0;
ab0817fac98d49 Israel Rukshin    2022-02-23  446  }
ab0817fac98d49 Israel Rukshin    2022-02-23  447  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
