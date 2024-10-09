Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB0821E3795
	for <oe-kbuild@lists.linux.dev>; Wed,  9 Oct 2024 22:25:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728512730; cv=none; b=er2TCb71ivO6ZBj2t96Mt+1Zr1sZkBpHCfTXaPfWb7iUgSCO+kKyHnYjpT30ZNSRkVpgtkSy0FbNYurtekMmTLniRs5+JxSkX28mgtVUHTl0tglDhys4yaUWX0WCf2rqyvhwbTBYh5U3J1WZPClpHWjHVE5+RhA5fkS5GLYMRoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728512730; c=relaxed/simple;
	bh=TPCF1EUfhwvr4U5sk14LHh5sycByOKiLJ+Qdv7IbQ+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=K8nymPnD6lr0f5OkB2nU8/QS4RX/XxN5/gPk95+Ncb9Fzh5prO3m6X2yZUgjWCcqk1wIIgBZc4fxcNlVCaDIV4GdT1jM0yf2y9wxMXrOsMjnonZIXzcYqzdeKIzckk4LRz5h91DLshgx2Gqk2kPpqODXS3XB4d07hzYOnwe3v/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Er8Rq31k; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Er8Rq31k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728512727; x=1760048727;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TPCF1EUfhwvr4U5sk14LHh5sycByOKiLJ+Qdv7IbQ+4=;
  b=Er8Rq31kEsJcdlMcyv8g55qYPg4MvsrlARRdgnGOcdhwbf9fLIeazJPo
   4kcUUe+PaNrg4YEz6PFOv1V3V6LacmEzB5s/hWw+pywfCxr0l5Fcqu2AM
   OPGXtVvdlDjvkJn+P+QCSS3nmtVEAPbHj9mPU8eWzFIScBna7YdgO//2v
   x+f1iYvNlZ6U66yKgfXI3oIoXzKvPGM09chjNKr5CSDeY3ec2GsVxP1Tp
   hLzxw/ZL8eNI71/Cw3WZCyL64pbjL4cEpf25o8wKDFc6D1mQWjuqAzVJ8
   dcIM7bqKWN6guylBnbNRiYB/NGXD1syrHRe+2MZdHTKvgYuv61PxhT0rm
   A==;
X-CSE-ConnectionGUID: Qqhw0edOSW+oVZOsbbYnng==
X-CSE-MsgGUID: H7p5ZnPqS6W3Mzkw+ASt8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="50382747"
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="50382747"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2024 15:25:27 -0700
X-CSE-ConnectionGUID: hmbIrsCUSIqTOigKNvzDvQ==
X-CSE-MsgGUID: he4clMQnS6qFsGDP4Len4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,191,1725346800"; 
   d="scan'208";a="80960452"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 09 Oct 2024 15:25:26 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syf7T-0009sU-2N;
	Wed, 09 Oct 2024 22:25:23 +0000
Date: Thu, 10 Oct 2024 06:24:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/crypto/intel/qat/qat_common/adf_sysfs.c:217:14-43:
 opportunity for str_on_off(accel_dev -> autoreset_on_error)
Message-ID: <202410100636.YD55Nr7Z-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Damian Muszynski <damian.muszynski@intel.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Ahsan Atta <ahsan.atta@intel.com>
CC: Markas Rapoportas <markas.rapoportas@intel.com>
CC: Giovanni Cabiddu <giovanni.cabiddu@intel.com>
CC: Mun Chun Yep <mun.chun.yep@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b983b271662bd6104d429b0fd97af3333ba760bf
commit: f5419a4239af8b3951f990c83d0d8c865a485475 crypto: qat - add auto reset on error
date:   8 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r054-20241010 (https://download.01.org/0day-ci/archive/20241010/202410100636.YD55Nr7Z-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410100636.YD55Nr7Z-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
   drivers/crypto/intel/qat/qat_common/adf_sysfs.c:28:9-35: opportunity for str_up_down(adf_dev_started ( accel_dev ))
>> drivers/crypto/intel/qat/qat_common/adf_sysfs.c:217:14-43: opportunity for str_on_off(accel_dev -> autoreset_on_error)

vim +217 drivers/crypto/intel/qat/qat_common/adf_sysfs.c

2382b5ae80467c Lucas Segarra Fernandez 2023-06-09  206  
f5419a4239af8b Damian Muszynski        2024-02-02  207  static ssize_t auto_reset_show(struct device *dev, struct device_attribute *attr,
f5419a4239af8b Damian Muszynski        2024-02-02  208  			       char *buf)
f5419a4239af8b Damian Muszynski        2024-02-02  209  {
f5419a4239af8b Damian Muszynski        2024-02-02  210  	char *auto_reset;
f5419a4239af8b Damian Muszynski        2024-02-02  211  	struct adf_accel_dev *accel_dev;
f5419a4239af8b Damian Muszynski        2024-02-02  212  
f5419a4239af8b Damian Muszynski        2024-02-02  213  	accel_dev = adf_devmgr_pci_to_accel_dev(to_pci_dev(dev));
f5419a4239af8b Damian Muszynski        2024-02-02  214  	if (!accel_dev)
f5419a4239af8b Damian Muszynski        2024-02-02  215  		return -EINVAL;
f5419a4239af8b Damian Muszynski        2024-02-02  216  
f5419a4239af8b Damian Muszynski        2024-02-02 @217  	auto_reset = accel_dev->autoreset_on_error ? "on" : "off";
f5419a4239af8b Damian Muszynski        2024-02-02  218  
f5419a4239af8b Damian Muszynski        2024-02-02  219  	return sysfs_emit(buf, "%s\n", auto_reset);
f5419a4239af8b Damian Muszynski        2024-02-02  220  }
f5419a4239af8b Damian Muszynski        2024-02-02  221  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
