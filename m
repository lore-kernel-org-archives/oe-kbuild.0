Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95919143748
	for <oe-kbuild@lists.linux.dev>; Sun, 11 May 2025 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746958292; cv=none; b=raC+oNwTCORra2GcAoz5In0607j5GekSYtrfUAI99OLj5nkfTrIPVL9UBbA4GTEKzIqhRQmNIaPUwkEYc8mt779QwJqOoisdEut+XgA/s9tLrlJFqJ8nJA1cv5n1RYUZKxeY0y9jNwZKdNbjUZt/BHZW13thEEkdMIXPMkQtTiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746958292; c=relaxed/simple;
	bh=yl6Fm78u93Vkpc2ZSVsSGdKcZT6w7Vn+18O3gj7t3wI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EC0USgpcMwB5kVi2fa5QgsS/LV1ZEuXaL5M+WurhlzRgczv/1JfgLd7mmoi6KnCx9sc4sgJBxjH7ERIj19C5N+YduuVi07N9ZrbZuGs+s02AElMDhLtflbZpSBeDw+4QtIb30rxEBZtUbVVS7Q6PTeGKsuZMlhg9ETb4qnCBuh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FjgEaa0V; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FjgEaa0V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746958291; x=1778494291;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yl6Fm78u93Vkpc2ZSVsSGdKcZT6w7Vn+18O3gj7t3wI=;
  b=FjgEaa0V6XFNiG+7KzwEbmOQYlTjjag7lnXKOi6luNTxl3TNkVpc57Ru
   1/yZj9r6V8pja0bMFSpJ+08j1ZcuqaEY5qodL0AxING8bGqF1qmf2+f/H
   ZOKv4llKuejvYI6UqZ56hWXrYww/KcE/F1FpQ7w2HepId+SaFumUoXNct
   HyEipysdI1Pl1uid7rV4LQVPFAY7rxAWOGpbTJ/NXnbEhq+ixRTSP+eQR
   20XnyM2wZI7NrkAe3XxeIgRxpj3iBhbHNfOVsKKt7ohfOPeD5oNXHIEY6
   bZteXjXcx0PfNhqCtw5MoKAidrvz//SHahs+RL2dG6la0hO48SccNv6er
   Q==;
X-CSE-ConnectionGUID: C/cs6IT+QGeuxX2OuLsrOw==
X-CSE-MsgGUID: uIifHo+IRYqpwP9ymz8UHw==
X-IronPort-AV: E=McAfee;i="6700,10204,11429"; a="66294564"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="66294564"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 03:11:30 -0700
X-CSE-ConnectionGUID: 8V2DYopLQvWh6xE+xr0nuQ==
X-CSE-MsgGUID: 4gysc6TCRTKjFEGPq8lyUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="137473396"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 May 2025 03:11:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE3eY-000DiF-1I;
	Sun, 11 May 2025 10:11:26 +0000
Date: Sun, 11 May 2025 18:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pci:ptm-debugfs 1/4] drivers/pci/pcie/ptm.c:275
 context_update_write() error: buffer overflow 'buf' 7 <= 7
Message-ID: <202505111829.bSouegRR-lkp@intel.com>
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
CC: linux-pci@vger.kernel.org
TO: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git ptm-debugfs
head:   356fc3e997f3bf54448a8cb39b49c7d73959d166
commit: 1130deffd29ab25da8091b573e173ef9d889e827 [1/4] PCI: Add debugfs support for exposing PTM context
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: alpha-randconfig-r073-20250511 (https://download.01.org/0day-ci/archive/20250511/202505111829.bSouegRR-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 10.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505111829.bSouegRR-lkp@intel.com/

smatch warnings:
drivers/pci/pcie/ptm.c:275 context_update_write() error: buffer overflow 'buf' 7 <= 7

vim +/buf +275 drivers/pci/pcie/ptm.c

1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  256  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  257  static ssize_t context_update_write(struct file *file, const char __user *ubuf,
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  258  			     size_t count, loff_t *ppos)
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  259  {
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  260  	struct pci_ptm_debugfs *ptm_debugfs = file->private_data;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  261  	char buf[7];
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  262  	int ret;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  263  	u8 mode;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  264  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  265  	if (!ptm_debugfs->ops->context_update_write)
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  266  		return -EOPNOTSUPP;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  267  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  268  	if (count < 1 || count > sizeof(buf))
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  269  		return -EINVAL;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  270  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  271  	ret = copy_from_user(buf, ubuf, count);
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  272  	if (ret)
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  273  		return -EFAULT;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  274  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05 @275  	buf[count] = '\0';
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  276  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  277  	if (sysfs_streq(buf, "auto"))
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  278  		mode = PCIE_PTM_CONTEXT_UPDATE_AUTO;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  279  	else if (sysfs_streq(buf, "manual"))
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  280  		mode = PCIE_PTM_CONTEXT_UPDATE_MANUAL;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  281  	else
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  282  		return -EINVAL;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  283  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  284  	mutex_lock(&ptm_debugfs->lock);
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  285  	ret = ptm_debugfs->ops->context_update_write(ptm_debugfs->pdata, mode);
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  286  	mutex_unlock(&ptm_debugfs->lock);
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  287  	if (ret)
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  288  		return ret;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  289  
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  290  	return count;
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  291  }
1130deffd29ab2 Manivannan Sadhasivam 2025-05-05  292  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
