Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437903;
	b=4x+55BGt4p8YXQuG3AnBfL0T2WT0QgdrJ44H5pxok/68L8lnLOEEU7EkRwz100xaezDZ
	 bYVq95WSF/g4lrJF/aTEA0HQc3pO184KyS5njqvIh+1PP2TsIAkfCM930czyZjd5Wwf5m
	 CVb6nIwgxsW3DilF7g1OZRVFk6iVmF5p1zYHuJ/lwWGIFSHLwbUV4JSEJDaNR7yY7HyTH
	 tRIE/q3yABATVFXfZS3SoDcTjDbOAYdpUXg/wsCiM60UBm3A1aBzpOuZoeREv8v842K1L
	 qXbKQdyqWRAF97KqEcvvwcLl6uxt6EL/fD1zSSRUoNfGU0xw2QI/bC4r1GR8ygbRW7g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437903;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=s0pSo7Lj8aHiiP/I5RLf/aoPHPko0AO6JRHhKCRxS/Q=;
	b=YdK6vNvJ9lwQX6bP5tGP1SPnWkIIr3AkP9vF9IP9t/xcQSyWaTCrvuRRX5iecpkd2Dpv
	 12Q9k6vMqO7SC8ysjf3ugTjWPocsUMS0i7iQ8SQgfwLgj8DoBxqqWcb2y0Murh8cGAGT2
	 4E8FIYzlNlHkoYre98rVMfrna6byDNdI4s/Z4/AbWk6O47wOXFNxuEOL59Mf+D+1Ee2th
	 xlO6YtRRTsk82iU//GDjRjJvUD/0chTVdgaBrv8sL/b8xpkPvc1WU4XWEZ93Cvta6jnR4
	 n4rfua8A37ulm1+1wTYzmpLOLWcsvPx2MzhpVipq+uLpsb7UUF5kxLUUK/9EeKaXO5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jp37tuQM;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B96606A32D
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Nov 2026 12:45:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B96606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Jp37tuQM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795437903; x=1826973903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y4Uukc65sGJBTKArVXWbmBExCk4SypmkGjdX22Gvbt8=;
  b=Jp37tuQMeLwFrjQnj61gRLGgsfoMCb6Hk6xIe2QiqzLdgh36yTRdp/d/
   LMfKsw5AluO766fWkQZL9GUCbpLT//l+lXmIwazyQWW6K6dsCtJKizHg+
   XmV9/RtF/WdorJXuLmANl0CclOC/c+DE5xRHMJp3x1lB8yyH+SpYnFnZz
   XwKG67bVXnodpm5aC6XgjJZ1JKPV8VCLjX3313g8Nuo62DFmnaJQitfXE
   cPbQT9d9St8tbvVT5NWi07PYKwSRjIrHGRBd20eGZQ8Ckud/AGFTxjKPL
   0YW01ppMRRlFZhlKEVanBxrtvAiJ2XYX0xRU/rQ+TLu3maM8dnW2LIGyi
   g==;
X-CSE-ConnectionGUID: +NZqvhxCS8GzewdyeHD4+g==
X-CSE-MsgGUID: q++5CtwgQmiumeuu2NeK3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4136270"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4136270"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2026 04:44:50 -0800
X-CSE-ConnectionGUID: 2VAUFEAtRJGkMyk8bqLP+w==
X-CSE-MsgGUID: Oya+uE/QTD2z5NPSkT5wMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11186066"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 23 Nov 2026 04:44:49 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVTPV-000000004qX-0rzq;
	Mon, 23 Nov 2026 12:44:41 +0000
Date: Mon, 23 Nov 2026 13:44:26 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v21 10/13] vfio/pci: Add IV-ST TPH policy and TPH_PROGRAM
 batch programming support
Message-ID: <20261123133843.7qO4iqGj-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Unfiltered warning: this smatch report is sent as-is and has not been
reviewed for false positives, so please treat it with due skepticism.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261118091238.45992-11-fengchengwen@huawei.com>
References: <20261118091238.45992-11-fengchengwen@huawei.com>
TO: Chengwen Feng <fengchengwen@huawei.com>
TO: alex@shazbot.org
TO: jgg@ziepe.ca
TO: helgaas@kernel.org
CC: wathsala.vithanage@arm.com
CC: wei.huang2@amd.com
CC: zhipingz@meta.com
CC: wangzhou1@hisilicon.com
CC: wangyushan12@huawei.com
CC: liuyonglong@huawei.com
CC: kvm@vger.kernel.org
CC: linux-pci@vger.kernel.org

Hi Chengwen,

kernel test robot noticed the following build warnings:

[auto build test WARNING on awilliam-vfio/next]
[also build test WARNING on pci/next pci/for-linus linus/master v7.4-rc4]
[cannot apply to next-20261120]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Chengwen-Feng/PCI-TPH-Fix-pcie_tph_get_st_table_loc-field-extraction/20261118-171226
base:   https://github.com/awilliam/linux-vfio.git next
patch link:    https://lore.kernel.org/r/20261118091238.45992-11-fengchengwen%40huawei.com
patch subject: [PATCH v21 10/13] vfio/pci: Add IV-ST TPH policy and TPH_PROGRAM batch programming support
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: xtensa-randconfig-2200-20261123 (https://download.01.org/0day-ci/archive/20261123/20261123133843.7qO4iqGj-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/20261123133843.7qO4iqGj-lkp@intel.com/

New smatch warnings:
drivers/vfio/pci/vfio_pci_core.c:1889 vfio_pci_core_feature_tph_program() warn: check sign expansion for '-1'
drivers/vfio/pci/vfio_pci_core.c:1890 vfio_pci_core_feature_tph_program() error: we previously assumed 'src_handle' could be null (see line 1873)

Old smatch warnings:
arch/xtensa/include/asm/thread_info.h:97 current_thread_info() warn: inconsistent indenting

vim +1889 drivers/vfio/pci/vfio_pci_core.c

7f5a45f0971e7a Chengwen Feng 2026-11-18  1810  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1811  static int vfio_pci_core_feature_tph_program(struct vfio_pci_core_device *vdev,
7f5a45f0971e7a Chengwen Feng 2026-11-18  1812  			u32 flags,
7f5a45f0971e7a Chengwen Feng 2026-11-18  1813  			struct vfio_device_feature_tph_program __user *arg,
7f5a45f0971e7a Chengwen Feng 2026-11-18  1814  			size_t argsz)
7f5a45f0971e7a Chengwen Feng 2026-11-18  1815  {
7f5a45f0971e7a Chengwen Feng 2026-11-18  1816  	struct vfio_device_feature_tph_program program;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1817  	u32 user_flags, src_mask, st_size;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1818  	struct pci_dev *pdev = vdev->pdev;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1819  	bool extended, stop_on_zero;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1820  	u32 *src_handle = NULL;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1821  	int ret, i, k, written;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1822  	u16 *tags = NULL;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1823  	u16 cmd;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1824  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1825  	if (!vdev->tph_opt_in ||
7f5a45f0971e7a Chengwen Feng 2026-11-18  1826  		!vfio_pci_tph_has_architected_st(vdev))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1827  		return -EOPNOTSUPP;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1828  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1829  	ret = vfio_check_feature(flags, argsz, VFIO_DEVICE_FEATURE_SET,
7f5a45f0971e7a Chengwen Feng 2026-11-18  1830  				 sizeof(program));
7f5a45f0971e7a Chengwen Feng 2026-11-18  1831  	if (ret != 1)
7f5a45f0971e7a Chengwen Feng 2026-11-18  1832  		return ret;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1833  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1834  	if (copy_from_user(&program, arg, sizeof(program)))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1835  		return -EFAULT;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1836  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1837  	user_flags = program.flags;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1838  	extended = !!(user_flags & VFIO_DEVICE_TPH_EXTENDED);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1839  	if (extended && !pcie_ext_tph_supported(vdev->pdev))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1840  		return -EOPNOTSUPP;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1841  	user_flags &= ~VFIO_DEVICE_TPH_EXTENDED;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1842  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1843  	stop_on_zero = !!(user_flags & VFIO_DEVICE_TPH_REQUIRE_ST);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1844  	if (stop_on_zero && (user_flags & VFIO_DEVICE_TPH_SRC_NONE))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1845  		return -EINVAL;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1846  	user_flags &= ~VFIO_DEVICE_TPH_REQUIRE_ST;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1847  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1848  	src_mask = vfio_pci_tph_get_src_mask(vdev);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1849  	if (user_flags & ~src_mask || !is_power_of_2(user_flags))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1850  		return -EINVAL;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1851  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1852  	st_size = vfio_pci_tph_get_st_table_size(vdev);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1853  	if (program.start >= st_size || program.count == 0 ||
7f5a45f0971e7a Chengwen Feng 2026-11-18  1854  		program.count > st_size - program.start)
7f5a45f0971e7a Chengwen Feng 2026-11-18  1855  		return -EINVAL;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1856  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1857  	if (!(user_flags & VFIO_DEVICE_TPH_SRC_NONE)) {
7f5a45f0971e7a Chengwen Feng 2026-11-18  1858  		src_handle = memdup_array_user(u64_to_user_ptr(program.srcs),
7f5a45f0971e7a Chengwen Feng 2026-11-18  1859  					       program.count, sizeof(u32));
7f5a45f0971e7a Chengwen Feng 2026-11-18  1860  		if (IS_ERR(src_handle))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1861  			return PTR_ERR(src_handle);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1862  	}
7f5a45f0971e7a Chengwen Feng 2026-11-18  1863  	tags = kcalloc(program.count, sizeof(u16), GFP_KERNEL_ACCOUNT);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1864  	if (!tags) {
7f5a45f0971e7a Chengwen Feng 2026-11-18  1865  		ret = -ENOMEM;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1866  		goto out;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1867  	}
7f5a45f0971e7a Chengwen Feng 2026-11-18  1868  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1869  	cpus_read_lock();
7f5a45f0971e7a Chengwen Feng 2026-11-18  1870  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1871  	for (i = 0; i < program.count; i++) {
7f5a45f0971e7a Chengwen Feng 2026-11-18  1872  		ret = vfio_pci_tph_resolve_st_tag(pdev, user_flags,
7f5a45f0971e7a Chengwen Feng 2026-11-18 @1873  						src_handle ? src_handle[i] : 0,
7f5a45f0971e7a Chengwen Feng 2026-11-18  1874  						extended, &tags[i]);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1875  		if (ret || (stop_on_zero && tags[i] == 0))
7f5a45f0971e7a Chengwen Feng 2026-11-18  1876  			break;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1877  	}
7f5a45f0971e7a Chengwen Feng 2026-11-18  1878  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1879  	if (i > 0) {
7f5a45f0971e7a Chengwen Feng 2026-11-18  1880  		mutex_lock(&vdev->tph_lock);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1881  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1882  		cmd = vfio_pci_memory_lock_and_enable(vdev);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1883  		ret = written = pcie_tph_set_st_entries(pdev, program.start, i,
7f5a45f0971e7a Chengwen Feng 2026-11-18  1884  							tags);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1885  		vfio_pci_memory_unlock_and_restore(vdev, cmd);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1886  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1887  		if (written > 0) {
7f5a45f0971e7a Chengwen Feng 2026-11-18  1888  			for (k = 0; k < written; k++)
7f5a45f0971e7a Chengwen Feng 2026-11-18 @1889  				vdev->tph_st_cpu[program.start + k] =
7f5a45f0971e7a Chengwen Feng 2026-11-18 @1890  					(tags[k] == 0) ? -1 : src_handle[k];
7f5a45f0971e7a Chengwen Feng 2026-11-18  1891  		}
7f5a45f0971e7a Chengwen Feng 2026-11-18  1892  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1893  		mutex_unlock(&vdev->tph_lock);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1894  	}
7f5a45f0971e7a Chengwen Feng 2026-11-18  1895  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1896  	cpus_read_unlock();
7f5a45f0971e7a Chengwen Feng 2026-11-18  1897  
7f5a45f0971e7a Chengwen Feng 2026-11-18  1898  out:
7f5a45f0971e7a Chengwen Feng 2026-11-18  1899  	kfree(tags);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1900  	kfree(src_handle);
7f5a45f0971e7a Chengwen Feng 2026-11-18  1901  	return ret;
7f5a45f0971e7a Chengwen Feng 2026-11-18  1902  }
7f5a45f0971e7a Chengwen Feng 2026-11-18  1903  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
