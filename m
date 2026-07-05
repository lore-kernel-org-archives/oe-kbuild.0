Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3073FFC0A
	for <oe-kbuild@lists.linux.dev>; Sun,  5 Jul 2026 18:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783275625; cv=none; b=tVhpR0d+9Xb45qRHYpZz/DXH4+5Fv9YJgVB2dA8y7wzGSZPthPyJmQZxqwsnJ8f02fzq9TBSdWHdmzVhDBK1eN/5bUgrqOBJ/ZeH3mg5+ZucqUu0NOcfzcSXm8Ho/MKdwwbImxy8kp5/aSToY1vnmyJTrGBDO7zuvnIpEUYb7Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783275625; c=relaxed/simple;
	bh=NXnwv//hq6tI6bnf7Z5a4AcEq7fmn3YUATD6vKeL8GA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Nf+9F7RayMj+orbDqdTGlhmqGaNhvbAY8YUZSFRePsPLTuGRPWN/8E0eVhwIrF7Ow+0AMut3YU5on5ueMz4PIcJEbzvH4Llm9mQswgwNgiALrkXywdJYk3F0DcZ+rbP9O+b/N7F5OlgVRKlDnSTCUOakibifIRcPGSd1bdJTV8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Eyqzap6H; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Eyqzap6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783275623; x=1814811623;
  h=date:from:to:cc:subject:message-id;
  bh=NXnwv//hq6tI6bnf7Z5a4AcEq7fmn3YUATD6vKeL8GA=;
  b=Eyqzap6HXKAhHxI1V7ExGxWRDIZjUFUlLX9HSvmmwJdBXcVXiqSW6HD0
   h3H0hgap6pgGNcMRczm5TQ8n1gDt+/S3PA7NNFX48bpCuVG81Ve72/PHy
   8y7ii79MsbcoO5yHo4MrfARXAmxFGoRmI5ffo52d9y3KiUFMAkWDCRKl6
   Xguj0vofoOHSPbfRvEBtVG1cuRDmzRHNZ3YMSrxeDCwzoY3tBZOHNE/v2
   VdvC9HvmvlQov7hCSmksCtg4LwOYglDwjo925FF6+gZ7sHfne82Vm84uX
   kncOHAC/EFexz+3eWlTvBmL4XOVltTOSBC+sWA/QTzJP/Eha1b1gEGt0s
   w==;
X-CSE-ConnectionGUID: MBM1B7KIQqSWzHbR0BEuXw==
X-CSE-MsgGUID: /12G63xGQkiVn2BldaK+mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83951886"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83951886"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 11:20:23 -0700
X-CSE-ConnectionGUID: 9zoP+Cw8QHibJ2hkpvw7NA==
X-CSE-MsgGUID: roEz1IvDRfSxcVhHNUoziA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="252454302"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 05 Jul 2026 11:20:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgRRz-00000000Did-0oAA;
	Sun, 05 Jul 2026 18:20:19 +0000
Date: Mon, 06 Jul 2026 02:19:20 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/crypto/hisilicon/zip/zip_crypto.c:694
 hisi_zip_register_to_crypto() warn: missing error code 'ret'
Message-ID: <202607060211.rlRZYnxQ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Chenghai Huang <huangchenghai2@huawei.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7404ce51637231382873d0b55edabc2f3b841a9d
commit: ea377793f41989e425498f50ec0c76c70567c1ae crypto: hisilicon/zip - add lz4 algorithm for hisi_zip
date:   5 months ago
:::::: branch date: 26 hours ago
:::::: commit date: 5 months ago
config: loongarch-randconfig-r072-20260705 (https://download.01.org/0day-ci/archive/20260706/202607060211.rlRZYnxQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 15.2.0
smatch: v0.5.0-9185-gbcc58b9c

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: ea377793f419 ("crypto: hisilicon/zip - add lz4 algorithm for hisi_zip")
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607060211.rlRZYnxQ-lkp@intel.com/

smatch warnings:
drivers/crypto/hisilicon/zip/zip_crypto.c:694 hisi_zip_register_to_crypto() warn: missing error code 'ret'

vim +/ret +694 drivers/crypto/hisilicon/zip/zip_crypto.c

ea377793f41989 Chenghai Huang 2026-01-17  686  
db700974b69d2c Weili Qian     2022-09-09  687  int hisi_zip_register_to_crypto(struct hisi_qm *qm)
db700974b69d2c Weili Qian     2022-09-09  688  {
b42ab1c61a7783 Weili Qian     2023-09-28  689  	int ret = 0;
b42ab1c61a7783 Weili Qian     2023-09-28  690  
b42ab1c61a7783 Weili Qian     2023-09-28  691  	mutex_lock(&zip_algs_lock);
ea377793f41989 Chenghai Huang 2026-01-17  692  	if (zip_available_devs) {
ea377793f41989 Chenghai Huang 2026-01-17  693  		zip_available_devs++;
b42ab1c61a7783 Weili Qian     2023-09-28 @694  		goto unlock;
ea377793f41989 Chenghai Huang 2026-01-17  695  	}
b42ab1c61a7783 Weili Qian     2023-09-28  696  
b42ab1c61a7783 Weili Qian     2023-09-28  697  	ret = hisi_zip_register_deflate(qm);
b42ab1c61a7783 Weili Qian     2023-09-28  698  	if (ret)
ea377793f41989 Chenghai Huang 2026-01-17  699  		goto unlock;
ea377793f41989 Chenghai Huang 2026-01-17  700  
ea377793f41989 Chenghai Huang 2026-01-17  701  	ret = hisi_zip_register_lz4(qm);
ea377793f41989 Chenghai Huang 2026-01-17  702  	if (ret)
ea377793f41989 Chenghai Huang 2026-01-17  703  		goto unreg_deflate;
ea377793f41989 Chenghai Huang 2026-01-17  704  
ea377793f41989 Chenghai Huang 2026-01-17  705  	zip_available_devs++;
ea377793f41989 Chenghai Huang 2026-01-17  706  	mutex_unlock(&zip_algs_lock);
b42ab1c61a7783 Weili Qian     2023-09-28  707  
ea377793f41989 Chenghai Huang 2026-01-17  708  	return 0;
ea377793f41989 Chenghai Huang 2026-01-17  709  
ea377793f41989 Chenghai Huang 2026-01-17  710  unreg_deflate:
ea377793f41989 Chenghai Huang 2026-01-17  711  	hisi_zip_unregister_deflate(qm);
b42ab1c61a7783 Weili Qian     2023-09-28  712  unlock:
b42ab1c61a7783 Weili Qian     2023-09-28  713  	mutex_unlock(&zip_algs_lock);
b42ab1c61a7783 Weili Qian     2023-09-28  714  	return ret;
62c455ca853e3e Zhou Wang      2019-08-02  715  }
62c455ca853e3e Zhou Wang      2019-08-02  716  

:::::: The code at line 694 was first introduced by commit
:::::: b42ab1c61a77832040ad42ebf9adf237360e49f7 crypto: hisilicon/qm - check function qp num before alg register

:::::: TO: Weili Qian <qianweili@huawei.com>
:::::: CC: Herbert Xu <herbert@gondor.apana.org.au>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
