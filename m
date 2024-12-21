Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C72116F84F
	for <oe-kbuild@lists.linux.dev>; Sat, 21 Dec 2024 18:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734805535; cv=none; b=PiN7SzroeQ9JB+6B/zT4GotPN4OvPEyU82jb04BdR/Bp0Upty4kdNJJReaBym1sFiPNUTW6lmhIcMBlEQtGujnEIf+YN+e+Hrh6btS0kkrwvHhzbJUBsuwrC7/J3H8sJcs+SrUM7ug0sZ6FZd32QTNCI6qHzVjLgO7t/NJqngL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734805535; c=relaxed/simple;
	bh=2pciIlrsUMxRFZlLvrnEfKUMNSHIyb9vZ3/Jz/4XuBg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N9wuaJLdaAKXp4+K7d/T8rHIut7rh7dB2tUXz9lI3GKPM/SLQddYIy/SAK+WsJnRaBPNqLs3WnM+vAohqFCZcemN1qekRrRKS11l2970cmATA20Eu4z7zaU4fYLqyi4oeTXBOmE2lKp+NJraFkvQosm8taeCsQfur9m8WqUVxDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zppv7j+d; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zppv7j+d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734805534; x=1766341534;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2pciIlrsUMxRFZlLvrnEfKUMNSHIyb9vZ3/Jz/4XuBg=;
  b=Zppv7j+drL7okxBnggNDSbErMt11cxbxqc8xEHQoyRL7MPQr0uP5DMVr
   TCyG/xRXwEcEXi51ldhKRLU2SX11pAZRbs+ZcQ/oQ/4BJCiKmM7XbTKgm
   5RhSc73kCI101KAsRSheQhtBY2s1V1hR5Ip+cnYj12a7Ip2ZSezOn3QfY
   7sU19YBEL7jArtjXvRCQ0/9sxzc6X7DRPq6n6x5PvrD56qxbsCffZUejA
   DkdaunszNTyLxcJ/+wo8cy7DCaytAgpI2rXlaTelc37Uh+dslCeklc9V4
   w8P0TVuX4BGK5S97D270rnOK36SYc2QAm/NnhWeHrBIoOYGk2yIn2dBeU
   Q==;
X-CSE-ConnectionGUID: bkbDOpQkQqWtTxg0kqkv7w==
X-CSE-MsgGUID: lN4LYo+IQ8yUE0U7g53lrA==
X-IronPort-AV: E=McAfee;i="6700,10204,11293"; a="39109475"
X-IronPort-AV: E=Sophos;i="6.12,254,1728975600"; 
   d="scan'208";a="39109475"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2024 10:25:31 -0800
X-CSE-ConnectionGUID: YGyQ7NxsSmWu+IuXyD8WCA==
X-CSE-MsgGUID: pJKX4Hk2Tei5XYNgjYV+8w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103431934"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 21 Dec 2024 10:25:30 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tP4AJ-0002OF-28;
	Sat, 21 Dec 2024 18:25:27 +0000
Date: Sun, 22 Dec 2024 02:24:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCHv3] PCI/ACPI: _DSM PRESERVE_BOOT_CONFIG function rev id
 doesn't match with spec
Message-ID: <202412220206.a94x8dia-lkp@intel.com>
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
In-Reply-To: <20241214104117.17973-1-zhoushengqing@ttyinfo.com>
References: <20241214104117.17973-1-zhoushengqing@ttyinfo.com>
TO: Zhou Shengqing <zhoushengqing@ttyinfo.com>
TO: Bjorn Helgaas <helgaas@kernel.org>
CC: "Rafael J. Wysocki" <rafael@kernel.org>
CC: Len Brown <lenb@kernel.org>
CC: linux-acpi@vger.kernel.org
CC: linux-pci@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: zhoushengqing@ttyinfo.com

Hi Zhou,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on rafael-pm/bleeding-edge pci/next pci/for-linus linus/master v6.13-rc3 next-20241220]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Zhou-Shengqing/PCI-ACPI-_DSM-PRESERVE_BOOT_CONFIG-function-rev-id-doesn-t-match-with-spec/20241214-184341
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20241214104117.17973-1-zhoushengqing%40ttyinfo.com
patch subject: [PATCHv3] PCI/ACPI: _DSM PRESERVE_BOOT_CONFIG function rev id doesn't match with spec
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: x86_64-randconfig-161-20241220 (https://download.01.org/0day-ci/archive/20241222/202412220206.a94x8dia-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412220206.a94x8dia-lkp@intel.com/

smatch warnings:
drivers/pci/pci-acpi.c:161 pci_acpi_preserve_config() error: uninitialized symbol 'obj'.

vim +/obj +161 drivers/pci/pci-acpi.c

f4b57a3b4352f72 Jiang Liu      2012-06-22  122  
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  123  bool pci_acpi_preserve_config(struct pci_host_bridge *host_bridge)
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  124  {
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  125  	if (ACPI_HANDLE(&host_bridge->dev)) {
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  126  		union acpi_object *obj;
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  127  
4db6187b00085db Zhou Shengqing 2024-12-14  128  		/*
4db6187b00085db Zhou Shengqing 2024-12-14  129  		 * Per PCI Firmware r3.2, released Jan 26, 2015,
4db6187b00085db Zhou Shengqing 2024-12-14  130  		 * DSM_PCI_PRESERVE_BOOT_CONFIG Revision ID is 1.
4db6187b00085db Zhou Shengqing 2024-12-14  131  		 * But PCI Firmware r3.3, released Jan 20, 2021,
4db6187b00085db Zhou Shengqing 2024-12-14  132  		 * changed sec 4.6.5 to say
4db6187b00085db Zhou Shengqing 2024-12-14  133  		 * "lowest valid Revision ID value: 2". So try revision 1
4db6187b00085db Zhou Shengqing 2024-12-14  134  		 * first for old platform, then try revision 2.
4db6187b00085db Zhou Shengqing 2024-12-14  135  		 */
4db6187b00085db Zhou Shengqing 2024-12-14  136  		if (acpi_check_dsm(ACPI_HANDLE(&host_bridge->dev), &pci_acpi_dsm_guid, 1,
4db6187b00085db Zhou Shengqing 2024-12-14  137  			    1ULL << DSM_PCI_PRESERVE_BOOT_CONFIG)) {
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  138  			/*
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  139  			 * Evaluate the "PCI Boot Configuration" _DSM Function.  If it
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  140  			 * exists and returns 0, we must preserve any PCI resource
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  141  			 * assignments made by firmware for this host bridge.
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  142  			 */
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  143  			obj = acpi_evaluate_dsm_typed(ACPI_HANDLE(&host_bridge->dev),
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  144  							  &pci_acpi_dsm_guid,
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  145  						  1, DSM_PCI_PRESERVE_BOOT_CONFIG,
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  146  						  NULL, ACPI_TYPE_INTEGER);
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  147  			if (obj && obj->integer.value == 0)
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  148  				return true;
4db6187b00085db Zhou Shengqing 2024-12-14  149  		}
4db6187b00085db Zhou Shengqing 2024-12-14  150  
4db6187b00085db Zhou Shengqing 2024-12-14  151  		if (acpi_check_dsm(ACPI_HANDLE(&host_bridge->dev), &pci_acpi_dsm_guid, 2,
4db6187b00085db Zhou Shengqing 2024-12-14  152  			    1ULL << DSM_PCI_PRESERVE_BOOT_CONFIG)) {
4db6187b00085db Zhou Shengqing 2024-12-14  153  			obj = acpi_evaluate_dsm_typed(ACPI_HANDLE(&host_bridge->dev),
4db6187b00085db Zhou Shengqing 2024-12-14  154  							  &pci_acpi_dsm_guid,
4db6187b00085db Zhou Shengqing 2024-12-14  155  						  2, DSM_PCI_PRESERVE_BOOT_CONFIG,
4db6187b00085db Zhou Shengqing 2024-12-14  156  						  NULL, ACPI_TYPE_INTEGER);
4db6187b00085db Zhou Shengqing 2024-12-14  157  			if (obj && obj->integer.value == 0)
4db6187b00085db Zhou Shengqing 2024-12-14  158  				return true;
4db6187b00085db Zhou Shengqing 2024-12-14  159  		}
4db6187b00085db Zhou Shengqing 2024-12-14  160  
9d7d5db8e78ef1b Vidya Sagar    2024-05-08 @161  		ACPI_FREE(obj);
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  162  	}
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  163  
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  164  	return false;
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  165  }
9d7d5db8e78ef1b Vidya Sagar    2024-05-08  166  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
