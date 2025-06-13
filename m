Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43316111BF
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Jun 2025 12:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749818258; cv=none; b=KGsySQ0FI4okwCOR4pS4usEHphuZD1r0w4RijFn3Sun/zEL6o1dbi9QANfRRLWE03mhjyUIHdHg51OjrjweDpukUAiyZZQpK7r+f8MsZgqEJ8/hncdjD+ZjJzKD5YIfkvNDcX0qjL/vMOXRX76KCU8KYpZaPO9pstNHwy4m0YJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749818258; c=relaxed/simple;
	bh=X9Flaq/pAYdLEAV4JIMz6WbrkPFAZF7uWAGP5r5Up9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O4rJaW/ZtaDRwnVaZbox4TtnEv0xfEVGpn62jyjsTQksUNMWm24kVrvhNJ3+ceBdNHs7iM645RB0pCjuvJeGUYsZopygVNA9gisz/KoAPdL5l2Jfv7g1D6ZFvKWg2f312+WJTP85yUXiR6Rwk0NMV9HcmXydrRyYbNoho9oid0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XQQpFf+w; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XQQpFf+w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749818256; x=1781354256;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=X9Flaq/pAYdLEAV4JIMz6WbrkPFAZF7uWAGP5r5Up9A=;
  b=XQQpFf+w+mYC9xHrsAFwK7ArrFnJBITFaEmMzVtYT/983UnaKTBw5FyD
   Vc3cng8EqSgtA01+9FOUqv7FImNBlM9xLHZ4fL17Y8e5OZvq+pkExE4Sk
   Xe0cfSfbK2SQSm+vmzctLuhndp3KzlYR8YNgAbElc3SA6Qg9dzYwyNY2S
   cnAeMwSZkM1V6OBubtIenUFShSC+40vPLSFz+YgG6i5j86+u5lQIp32AO
   cIvcuN37wo+G28pe1ygz36nVsfS+AixPoV6Z1jBDPuMjl5uGE/ZfK3LJz
   G8y9bQbQKfF2X73+gFfSZ/OmV8MDWeMzc5Ks60SzIFN4M/BNJ98UdPgKl
   g==;
X-CSE-ConnectionGUID: MBpLcolZS4C9E/ck1sMMjQ==
X-CSE-MsgGUID: EKy6L0iiSvaW7FVXbRyF9Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11463"; a="62684494"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="62684494"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 05:37:35 -0700
X-CSE-ConnectionGUID: hxt1t2PUQ1+rUwY/2l9HUA==
X-CSE-MsgGUID: wBJiff0zRvCbCglxu4Gy5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="152584758"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 13 Jun 2025 05:37:34 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uQ3f1-000CbW-28;
	Fri, 13 Jun 2025 12:37:31 +0000
Date: Fri, 13 Jun 2025 20:36:33 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v19 01/10] PCI: endpoint: Set ID and of_node for function
 driver
Message-ID: <202506132008.OzeKgvb3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250609-ep-msi-v19-1-77362eaa48fa@nxp.com>
References: <20250609-ep-msi-v19-1-77362eaa48fa@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: Kishon Vijay Abraham I <kishon@kernel.org>
TO: "Rafael J. Wysocki" <rafael@kernel.org>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Anup Patel <apatel@ventanamicro.com>
TO: Marc Zyngier <maz@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Danilo Krummrich <dakr@kernel.org>
TO: Bjorn Helgaas <helgaas@kernel.org>
TO: Arnd Bergmann <arnd@arndb.de>
TO: Shuah Khan <skhan@linuxfoundation.org>
TO: Richard Zhu <hongxing.zhu@nxp.com>
TO: Lucas Stach <l.stach@pengutronix.de>
TO: Lorenzo Pieralisi <lpieralisi@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Shawn Guo <shawnguo@kernel.org>
TO: Sascha Hauer <s.hauer@pengutronix.de>
TO: Pengutronix Kernel Team <kernel@pengutronix.de>
TO: Fabio Estevam <festevam@gmail.com>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Manivannan Sadhasivam <mani@kernel.org>
TO: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
CC: Niklas Cassel <cassel@kernel.org>
CC: dlemoal@kernel.org
CC: jdmason@kudzu.us
CC: linux-kernel@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-pci@vger.kernel.org
CC: linux-kselftest@vger.kernel.org
CC: imx@lists.linux.dev

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/PCI-endpoint-Set-ID-and-of_node-for-function-driver/20250610-003848
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250609-ep-msi-v19-1-77362eaa48fa%40nxp.com
patch subject: [PATCH v19 01/10] PCI: endpoint: Set ID and of_node for function driver
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: csky-randconfig-r073-20250612 (https://download.01.org/0day-ci/archive/20250613/202506132008.OzeKgvb3-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.3.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506132008.OzeKgvb3-lkp@intel.com/

smatch warnings:
drivers/pci/endpoint/pci-epf-core.c:132 pci_epf_bind() error: uninitialized symbol 'epc'.

vim +/epc +132 drivers/pci/endpoint/pci-epf-core.c

5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   51  
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   52  /**
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   53   * pci_epf_bind() - Notify the function driver that the EPF device has been
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   54   *		    bound to a EPC device
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   55   * @epf: the EPF device which has been bound to the EPC device
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   56   *
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   57   * Invoke to notify the function driver that it has been bound to a EPC device
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   58   */
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   59  int pci_epf_bind(struct pci_epf *epf)
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   60  {
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   61  	struct device *dev = &epf->dev;
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19   62  	struct pci_epf *epf_vf;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   63  	u8 func_no, vfunc_no;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   64  	struct pci_epc *epc;
07301c982643a43 Kishon Vijay Abraham I 2020-02-24   65  	int ret;
07301c982643a43 Kishon Vijay Abraham I 2020-02-24   66  
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   67  	if (!epf->driver) {
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   68  		dev_WARN(dev, "epf device not bound to driver\n");
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   69  		return -EINVAL;
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   70  	}
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   71  
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   72  	if (!try_module_get(epf->driver->owner))
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   73  		return -EAGAIN;
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10   74  
07301c982643a43 Kishon Vijay Abraham I 2020-02-24   75  	mutex_lock(&epf->lock);
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19   76  	list_for_each_entry(epf_vf, &epf->pci_vepf, list) {
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   77  		vfunc_no = epf_vf->vfunc_no;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   78  
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   79  		if (vfunc_no < 1) {
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   80  			dev_err(dev, "Invalid virtual function number\n");
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   81  			ret = -EINVAL;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   82  			goto ret;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   83  		}
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   84  
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   85  		epc = epf->epc;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   86  		func_no = epf->func_no;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   87  		if (!IS_ERR_OR_NULL(epc)) {
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   88  			if (!epc->max_vfs) {
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   89  				dev_err(dev, "No support for virt function\n");
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   90  				ret = -EINVAL;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   91  				goto ret;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   92  			}
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   93  
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   94  			if (vfunc_no > epc->max_vfs[func_no]) {
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   95  				dev_err(dev, "PF%d: Exceeds max vfunc number\n",
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   96  					func_no);
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   97  				ret = -EINVAL;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   98  				goto ret;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19   99  			}
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  100  		}
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  101  
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  102  		epc = epf->sec_epc;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  103  		func_no = epf->sec_epc_func_no;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  104  		if (!IS_ERR_OR_NULL(epc)) {
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  105  			if (!epc->max_vfs) {
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  106  				dev_err(dev, "No support for virt function\n");
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  107  				ret = -EINVAL;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  108  				goto ret;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  109  			}
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  110  
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  111  			if (vfunc_no > epc->max_vfs[func_no]) {
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  112  				dev_err(dev, "PF%d: Exceeds max vfunc number\n",
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  113  					func_no);
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  114  				ret = -EINVAL;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  115  				goto ret;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  116  			}
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  117  		}
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  118  
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  119  		epf_vf->func_no = epf->func_no;
53fd3cbe5e9d791 Kishon Vijay Abraham I 2021-08-19  120  		epf_vf->sec_epc_func_no = epf->sec_epc_func_no;
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  121  		epf_vf->epc = epf->epc;
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  122  		epf_vf->sec_epc = epf->sec_epc;
def540cae530797 Frank Li               2025-06-09  123  		epf_vf->dev.id = PCI_EPF_DEVID(epf->func_no, vfunc_no);
def540cae530797 Frank Li               2025-06-09  124  		device_set_of_node_from_dev(&epf_vf->dev, epc->dev.parent);
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  125  		ret = epf_vf->driver->ops->bind(epf_vf);
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  126  		if (ret)
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  127  			goto ret;
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  128  		epf_vf->is_bound = true;
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  129  	}
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  130  
def540cae530797 Frank Li               2025-06-09  131  	epf->dev.id = PCI_EPF_DEVID(epf->func_no, 0);
def540cae530797 Frank Li               2025-06-09 @132  	device_set_of_node_from_dev(&epf->dev, epc->dev.parent);
07301c982643a43 Kishon Vijay Abraham I 2020-02-24  133  	ret = epf->driver->ops->bind(epf);
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  134  	if (ret)
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  135  		goto ret;
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  136  	epf->is_bound = true;
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  137  
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  138  	mutex_unlock(&epf->lock);
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  139  	return 0;
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  140  
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  141  ret:
07301c982643a43 Kishon Vijay Abraham I 2020-02-24  142  	mutex_unlock(&epf->lock);
1cf362e907f36f1 Kishon Vijay Abraham I 2021-08-19  143  	pci_epf_unbind(epf);
07301c982643a43 Kishon Vijay Abraham I 2020-02-24  144  
07301c982643a43 Kishon Vijay Abraham I 2020-02-24  145  	return ret;
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  146  }
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  147  EXPORT_SYMBOL_GPL(pci_epf_bind);
5e8cb4033807e39 Kishon Vijay Abraham I 2017-04-10  148  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
