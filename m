Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F07CD13DBA8
	for <oe-kbuild@lists.linux.dev>; Thu, 11 Apr 2024 07:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712819834; cv=none; b=WMPO9bNoq4mR6WKoxrot7A/KpauHBcxcOnbZ3su8c3j4zQAFXGh3xh6iYtCI3lmT+eoCZatCWWCwk68VVauiFU0ahidvgrMPhZtB42J9AeiJ0S6QKprptzTJfrGjanuPC9thabppiOg9C9SU6k97YJngK/8yehnBU9XYelA+Nos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712819834; c=relaxed/simple;
	bh=D1z32GfVaPYlaB0zJT8UdXNAaR8g4T5mjy6rOB0yl2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XujP0pjhC1+iMGOD/HljLa45P+rrZHEFQRe/V3hteCMtc6mZlZPlt6sIbFK+8t+SC+6dNgGoJKI695DDUO4cPArt8qCYTw0H1oaV68WqrsfYN/Fh0Rcs5vrhGTF40jfRa9N8AvjkQ8Hgq9+oMHBNxvoKsQ54nK9nj1jp4CcfoG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcCObjio; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcCObjio"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712819834; x=1744355834;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D1z32GfVaPYlaB0zJT8UdXNAaR8g4T5mjy6rOB0yl2k=;
  b=XcCObjioUSmEmFtW1zsLvWoFRRng5qmIqXblTbl3/92js1v8p5+qEXEC
   qFJvPVUq4bARRx9fBV8lKw6je6ZEOdCiG+XCTw/Hf2H8LmH0wV+CI7YRW
   kD3XFr4U/R3jeKH3rCWHKQFFDgylZGQj4WuU8CwgfJ0aGb8hLdM7hX+/l
   hODjn7oMGVahJmHXvYQs6oKtev4daTb/iCl8ykUVrbd/Sv1vRUysVdI3l
   x9bD4+bFWi9IG1Qfk4R5YAt+If5Yd/DcwJ3YdYJrDRftoZhsRMR/9puq7
   h+vWqz15nVnuSopB03RNoPYRNmQBbDniihkYNfQVBhsF3orj2qr4sImDw
   Q==;
X-CSE-ConnectionGUID: yTcNrKVpSK6e45t6z5gIgw==
X-CSE-MsgGUID: SgNwe9k8S96FKRBrXhTqvg==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8322251"
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="8322251"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2024 00:17:13 -0700
X-CSE-ConnectionGUID: BaD0XfCERoCgmjF8oXo8gg==
X-CSE-MsgGUID: nSNI2m3eTzudnVwe/Pyccg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,192,1708416000"; 
   d="scan'208";a="51785973"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Apr 2024 00:17:11 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ruogG-0008LR-2f;
	Thu, 11 Apr 2024 07:17:08 +0000
Date: Thu, 11 Apr 2024 15:16:09 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [openeuler:OLK-5.10 3009/30000] drivers/iommu/intel/dmar.c:770
 dmar_acpi_bus_add_dev() error: uninitialized symbol 'ret'.
Message-ID: <202404111506.xfIcToZU-lkp@intel.com>
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
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   7b09b4c592e9578f7e0abbca2597f97a36692712
commit: d660222861c468ce77fe3197ddc5189deb1665c6 [3009/30000] iommu/vt-d:Add support for detecting ACPI device, in RMRR
:::::: branch date: 5 hours ago
:::::: commit date: 2 years, 9 months ago
config: x86_64-randconfig-161-20240331 (https://download.01.org/0day-ci/archive/20240411/202404111506.xfIcToZU-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202404111506.xfIcToZU-lkp@intel.com/

smatch warnings:
drivers/iommu/intel/dmar.c:770 dmar_acpi_bus_add_dev() error: uninitialized symbol 'ret'.

vim +/ret +770 drivers/iommu/intel/dmar.c

d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  753  
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  754  static int dmar_acpi_bus_add_dev(u8 device_number, struct acpi_device *adev)
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  755  {
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  756  	struct dmar_drhd_unit *dmaru;
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  757  	struct acpi_dmar_hardware_unit *drhd;
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  758  	int ret;
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  759  
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  760  	for_each_drhd_unit(dmaru) {
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  761  		drhd = container_of(dmaru->hdr,
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  762  				    struct acpi_dmar_hardware_unit,
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  763  				    header);
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  764  		ret = dmar_acpi_insert_dev_scope(device_number, adev, (void *)(drhd+1),
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  765  						((void *)drhd)+drhd->header.length,
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  766  						dmaru->devices, dmaru->devices_cnt);
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  767  		if (ret)
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  768  			break;
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  769  	}
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23 @770  	if (ret > 0)
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  771  		ret = dmar_rmrr_add_acpi_dev(device_number, adev);
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  772  
d660222861c468 drivers/iommu/intel/dmar.c LeoLiu-oc       2021-07-23  773  	return ret;
ed40356b5fcf1c drivers/iommu/dmar.c       David Woodhouse 2014-03-07  774  }
ed40356b5fcf1c drivers/iommu/dmar.c       David Woodhouse 2014-03-07  775  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
