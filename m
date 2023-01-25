Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13FFAEC3
	for <oe-kbuild@lists.linux.dev>; Wed, 25 Jan 2023 01:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674609331; x=1706145331;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8OW7dOakbfB2VtC324FLeU2yR0U0gskF9+3nU+daR9g=;
  b=kaC1jTiXjAH1vIZGTGPsihai+wu8Ta+Y3Yu7bqUtoSuapt8te20ADdnA
   KK2bqJH6VPqzYsWCORE22LTYINMNaatMOT3kzCIdxO2pqrmR0yB5MNlYx
   OQpJc4UOT0gxTQo5iADHrLn/m+hZomAQlIvmjEIElD33M8ST1NfFVt9JY
   OPDJX/wriatmoYeNrzUtjlJq1vqzYXLB+8zT5bQnK0DlIK1LOL7iQEAFl
   OrqnbMBvRwMSbNnpOKGkX/iCfJ+ygtKemEGZj3EaUcNo7MJhol9yF18sG
   c80zQX+oTwMvyiSIaja/LG7twYcFSnIqJ4HChBzO0u5rTFyH1MhmunskH
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="412688484"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="412688484"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2023 17:15:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10600"; a="836186874"
X-IronPort-AV: E=Sophos;i="5.97,244,1669104000"; 
   d="scan'208";a="836186874"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 24 Jan 2023 17:15:28 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pKUNr-0006vM-3C;
	Wed, 25 Jan 2023 01:15:28 +0000
Date: Wed, 25 Jan 2023 09:15:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 2/4] dmabuf: Add cgroup charge transfer function
Message-ID: <202301250945.4xlsZm7D-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230123191728.2928839-3-tjmercier@google.com>
References: <20230123191728.2928839-3-tjmercier@google.com>
TO: "T.J. Mercier" <tjmercier@google.com>
TO: tjmercier@google.com
TO: Sumit Semwal <sumit.semwal@linaro.org>
TO: "Christian König" <christian.koenig@amd.com>
CC: android-mm@google.com
CC: selinux@vger.kernel.org
CC: daniel.vetter@ffwll.ch
CC: hannes@cmpxchg.org
CC: cmllamas@google.com
CC: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: linaro-mm-sig@lists.linaro.org
CC: linux-security-module@vger.kernel.org
CC: jstultz@google.com
CC: jeffv@google.com
CC: cgroups@vger.kernel.org
CC: linux-media@vger.kernel.org

Hi Mercier",

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on 2241ab53cbb5cdb08a6b2d4688feb13971058f65]

url:    https://github.com/intel-lab-lkp/linux/commits/T-J-Mercier/memcg-Track-exported-dma-buffers/20230124-032017
base:   2241ab53cbb5cdb08a6b2d4688feb13971058f65
patch link:    https://lore.kernel.org/r/20230123191728.2928839-3-tjmercier%40google.com
patch subject: [PATCH v2 2/4] dmabuf: Add cgroup charge transfer function
:::::: branch date: 30 hours ago
:::::: commit date: 30 hours ago
config: ia64-randconfig-m041-20230123 (https://download.01.org/0day-ci/archive/20230125/202301250945.4xlsZm7D-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
drivers/dma-buf/dma-buf.c:1662 dma_buf_transfer_charge() warn: missing error code 'ret'

vim +/ret +1662 drivers/dma-buf/dma-buf.c

56e5abba8c3ec5 Dmitry Osipenko 2022-10-17  1629  
bb6612a9b97628 T.J. Mercier    2023-01-23  1630  /**
bb6612a9b97628 T.J. Mercier    2023-01-23  1631   * dma_buf_transfer_charge - Change the cgroup to which the provided dma_buf is charged.
bb6612a9b97628 T.J. Mercier    2023-01-23  1632   * @dmabuf_file:	[in]	file for buffer whose charge will be migrated to a different cgroup
bb6612a9b97628 T.J. Mercier    2023-01-23  1633   * @target:		[in]	the task_struct of the destination process for the cgroup charge
bb6612a9b97628 T.J. Mercier    2023-01-23  1634   *
bb6612a9b97628 T.J. Mercier    2023-01-23  1635   * Only tasks that belong to the same cgroup the buffer is currently charged to
bb6612a9b97628 T.J. Mercier    2023-01-23  1636   * may call this function, otherwise it will return -EPERM.
bb6612a9b97628 T.J. Mercier    2023-01-23  1637   *
bb6612a9b97628 T.J. Mercier    2023-01-23  1638   * Returns 0 on success, or a negative errno code otherwise.
bb6612a9b97628 T.J. Mercier    2023-01-23  1639   */
bb6612a9b97628 T.J. Mercier    2023-01-23  1640  int dma_buf_transfer_charge(struct file *dmabuf_file, struct task_struct *target)
bb6612a9b97628 T.J. Mercier    2023-01-23  1641  {
bb6612a9b97628 T.J. Mercier    2023-01-23  1642  	struct mem_cgroup *current_cg, *target_cg;
bb6612a9b97628 T.J. Mercier    2023-01-23  1643  	struct dma_buf *dmabuf;
bb6612a9b97628 T.J. Mercier    2023-01-23  1644  	unsigned int nr_pages;
bb6612a9b97628 T.J. Mercier    2023-01-23  1645  	int ret = 0;
bb6612a9b97628 T.J. Mercier    2023-01-23  1646  
bb6612a9b97628 T.J. Mercier    2023-01-23  1647  	if (!IS_ENABLED(CONFIG_MEMCG))
bb6612a9b97628 T.J. Mercier    2023-01-23  1648  		return 0;
bb6612a9b97628 T.J. Mercier    2023-01-23  1649  
bb6612a9b97628 T.J. Mercier    2023-01-23  1650  	if (WARN_ON(!dmabuf_file) || WARN_ON(!target))
bb6612a9b97628 T.J. Mercier    2023-01-23  1651  		return -EINVAL;
bb6612a9b97628 T.J. Mercier    2023-01-23  1652  
bb6612a9b97628 T.J. Mercier    2023-01-23  1653  	if (!is_dma_buf_file(dmabuf_file))
bb6612a9b97628 T.J. Mercier    2023-01-23  1654  		return -EBADF;
bb6612a9b97628 T.J. Mercier    2023-01-23  1655  	dmabuf = dmabuf_file->private_data;
bb6612a9b97628 T.J. Mercier    2023-01-23  1656  
bb6612a9b97628 T.J. Mercier    2023-01-23  1657  	nr_pages = PAGE_ALIGN(dmabuf->size) / PAGE_SIZE;
bb6612a9b97628 T.J. Mercier    2023-01-23  1658  	current_cg = mem_cgroup_from_task(current);
bb6612a9b97628 T.J. Mercier    2023-01-23  1659  	target_cg = get_mem_cgroup_from_mm(target->mm);
bb6612a9b97628 T.J. Mercier    2023-01-23  1660  
bb6612a9b97628 T.J. Mercier    2023-01-23  1661  	if (current_cg == target_cg)
bb6612a9b97628 T.J. Mercier    2023-01-23 @1662  		goto skip_transfer;
bb6612a9b97628 T.J. Mercier    2023-01-23  1663  
bb6612a9b97628 T.J. Mercier    2023-01-23  1664  	if (!mem_cgroup_charge_dmabuf(target_cg, nr_pages, GFP_KERNEL)) {
bb6612a9b97628 T.J. Mercier    2023-01-23  1665  		ret = -ENOMEM;
bb6612a9b97628 T.J. Mercier    2023-01-23  1666  		goto skip_transfer;
bb6612a9b97628 T.J. Mercier    2023-01-23  1667  	}
bb6612a9b97628 T.J. Mercier    2023-01-23  1668  
bb6612a9b97628 T.J. Mercier    2023-01-23  1669  	if (cmpxchg(&dmabuf->memcg, current_cg, target_cg) != current_cg) {
bb6612a9b97628 T.J. Mercier    2023-01-23  1670  		/* Only the current owner can transfer the charge */
bb6612a9b97628 T.J. Mercier    2023-01-23  1671  		ret = -EPERM;
bb6612a9b97628 T.J. Mercier    2023-01-23  1672  		mem_cgroup_uncharge_dmabuf(target_cg, nr_pages);
bb6612a9b97628 T.J. Mercier    2023-01-23  1673  		goto skip_transfer;
bb6612a9b97628 T.J. Mercier    2023-01-23  1674  	}
bb6612a9b97628 T.J. Mercier    2023-01-23  1675  
bb6612a9b97628 T.J. Mercier    2023-01-23  1676  	mem_cgroup_uncharge_dmabuf(current_cg, nr_pages);
bb6612a9b97628 T.J. Mercier    2023-01-23  1677  	mem_cgroup_put(current_cg); /* unref from buffer - buffer keeps new ref to target_cg */
bb6612a9b97628 T.J. Mercier    2023-01-23  1678  	return 0;
bb6612a9b97628 T.J. Mercier    2023-01-23  1679  
bb6612a9b97628 T.J. Mercier    2023-01-23  1680  skip_transfer:
bb6612a9b97628 T.J. Mercier    2023-01-23  1681  	mem_cgroup_put(target_cg);
bb6612a9b97628 T.J. Mercier    2023-01-23  1682  	return ret;
bb6612a9b97628 T.J. Mercier    2023-01-23  1683  }
bb6612a9b97628 T.J. Mercier    2023-01-23  1684  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
