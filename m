Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89FDE38F9C
	for <oe-kbuild@lists.linux.dev>; Wed,  7 May 2025 10:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746612070; cv=none; b=tEc5Y6583BkQSQBhztsRcdxN8dJlWmcIQbdIyK513l1EyphXA4XEwWFVGS0jWZq++B3tR55BK6I7EeiQxywex7M1GDsxnbLEve/eG1r6Z8q4/DXKfI7pLdMIbRxtfIBy+JDGjotq/uOhaKSv2uLksbUAicJxmd6f8fL6dZXMvfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746612070; c=relaxed/simple;
	bh=/Qx031PBnfiY7nkXF5RiOuvv4gKZ7X+Vlkdd+Rq1TxE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gW6dAzjMN7zyJEZhLOAI62+NE+4KgdBlBM/To8Hl7q8nOxr0xZwMuu9jZU0sbFnTm+eGt8AedxKyACED0J4oRJigtTUALH6ixU0kKtM9KEuIce4h1aHF+WWYc4WjzDULvyrX8AnifXGGolXzJczvQpHAIy0L7TqzcKBz0C+vRE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BEyAUtKO; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BEyAUtKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746612068; x=1778148068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/Qx031PBnfiY7nkXF5RiOuvv4gKZ7X+Vlkdd+Rq1TxE=;
  b=BEyAUtKOfuxJOQjjZStv13ENyWXQNEUK3UqTQr5NzcDe6XkFKgiE+z4L
   Zz+pwmwtIRdJv3CpUP4F94lvT9TOOlSMaPes+DA2X5ylMj/aZCs2lVarG
   jP1AEPugGTWGW46ASydOPnzgvdNOhxvLzcls87ZK27BG4DQyA7EbQKDTR
   Hg+5+pZGHkvoTNZDpHpmYd7a/WcKJw8AbRcuKPwS7+YgCqsFalkr1bjuu
   6b1gHiWvidZU2/YeXw4j6evuPWLqtk8zQeGEC0LFOPEnfnVp2QgQJeEqA
   sQOGuQywIPmcxbZ7pQTorW2xo9ehc/3mofYuOufv+gF7eu0kcv5nasxq5
   w==;
X-CSE-ConnectionGUID: 2bGF0IG8SEeiqM6uFT6eYg==
X-CSE-MsgGUID: eqrOgfkbRiGycVbGQhE2zQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11425"; a="58527545"
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="58527545"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2025 03:01:05 -0700
X-CSE-ConnectionGUID: 22V/B+Z9R7uqjVcpB1Ralg==
X-CSE-MsgGUID: n115PuBFSmiiiHOh1SEXuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,269,1739865600"; 
   d="scan'208";a="159199350"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 07 May 2025 03:01:04 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uCbaI-0007YR-00;
	Wed, 07 May 2025 10:01:02 +0000
Date: Wed, 7 May 2025 18:00:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 1170/9308] drivers/crypto/ccp/sev-dev.c:1312
 __sev_platform_init_locked() error: we previously assumed 'error' could be
 null (see line 1297)
Message-ID: <202505071746.eWOx5QgC-lkp@intel.com>
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
TO: Ashish Kalra <ashish.kalra@amd.com>
CC: Herbert Xu <herbert@gondor.apana.org.au>
CC: Tom Lendacky <thomas.lendacky@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0a00723f4c2d0b273edd0737f236f103164a08eb
commit: 9770b428b1a28360663f1f5e524ee458b4cf454b [1170/9308] crypto: ccp - Move dev_info/err messages for SEV/SNP init and shutdown
:::::: branch date: 24 hours ago
:::::: commit date: 4 weeks ago
config: x86_64-randconfig-161-20250430 (https://download.01.org/0day-ci/archive/20250507/202505071746.eWOx5QgC-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505071746.eWOx5QgC-lkp@intel.com/

smatch warnings:
drivers/crypto/ccp/sev-dev.c:1312 __sev_platform_init_locked() error: we previously assumed 'error' could be null (see line 1297)

vim +/error +1312 drivers/crypto/ccp/sev-dev.c

dbf07b544ca12c drivers/crypto/ccp/sev-dev.c Borislav Petkov (AMD  2023-03-07  1263) 
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1264  static int __sev_platform_init_locked(int *error)
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1265  {
1ca5614b84eed5 drivers/crypto/ccp/sev-dev.c Brijesh Singh         2024-01-25  1266  	int rc, psp_ret = SEV_RET_NO_FW_CALL;
efb339a83368ab drivers/crypto/ccp/sev-dev.c Peter Gonda           2023-03-07  1267  	struct sev_device *sev;
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1268  
1ca5614b84eed5 drivers/crypto/ccp/sev-dev.c Brijesh Singh         2024-01-25  1269  	if (!psp_master || !psp_master->sev_data)
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1270  		return -ENODEV;
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1271  
1ca5614b84eed5 drivers/crypto/ccp/sev-dev.c Brijesh Singh         2024-01-25  1272  	sev = psp_master->sev_data;
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1273  
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1274  	if (sev->state == SEV_STATE_INIT)
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1275  		return 0;
3d725965f836a7 drivers/crypto/ccp/sev-dev.c David Rientjes        2021-12-07  1276  
24512afa4336a1 drivers/crypto/ccp/sev-dev.c Brijesh Singh         2024-01-25  1277  	__sev_platform_init_handle_tmr(sev);
1ca5614b84eed5 drivers/crypto/ccp/sev-dev.c Brijesh Singh         2024-01-25  1278  
7364a6fbca45f8 drivers/crypto/ccp/sev-dev.c Tom Lendacky          2024-01-25  1279  	rc = __sev_platform_init_handle_init_ex_path(sev);
d8da2da21fdb1f drivers/crypto/ccp/sev-dev.c Jacky Li              2022-08-16  1280  	if (rc)
d8da2da21fdb1f drivers/crypto/ccp/sev-dev.c Jacky Li              2022-08-16  1281  		return rc;
d8da2da21fdb1f drivers/crypto/ccp/sev-dev.c Jacky Li              2022-08-16  1282  
dbf07b544ca12c drivers/crypto/ccp/sev-dev.c Borislav Petkov (AMD  2023-03-07  1283) 	rc = __sev_do_init_locked(&psp_ret);
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1284  	if (rc && psp_ret == SEV_RET_SECURE_DATA_INVALID) {
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1285  		/*
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1286  		 * Initialization command returned an integrity check failure
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1287  		 * status code, meaning that firmware load and validation of SEV
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1288  		 * related persistent data has failed. Retrying the
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1289  		 * initialization function should succeed by replacing the state
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1290  		 * with a reset state.
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1291  		 */
efb339a83368ab drivers/crypto/ccp/sev-dev.c Peter Gonda           2023-03-07  1292  		dev_err(sev->dev,
efb339a83368ab drivers/crypto/ccp/sev-dev.c Peter Gonda           2023-03-07  1293  "SEV: retrying INIT command because of SECURE_DATA_INVALID error. Retrying once to reset PSP SEV state.");
dbf07b544ca12c drivers/crypto/ccp/sev-dev.c Borislav Petkov (AMD  2023-03-07  1294) 		rc = __sev_do_init_locked(&psp_ret);
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1295  	}
efb339a83368ab drivers/crypto/ccp/sev-dev.c Peter Gonda           2023-03-07  1296  
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07 @1297  	if (error)
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1298  		*error = psp_ret;
e423b9d75e779d drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1299  
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1300  	if (rc) {
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1301  		dev_err(sev->dev, "SEV: %s failed %#x, rc %d\n",
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1302  			sev_init_ex_buffer ? "INIT_EX" : "INIT", psp_ret, rc);
200664d5237f3f drivers/crypto/ccp/psp-dev.c Brijesh Singh         2017-12-04  1303  		return rc;
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1304  	}
200664d5237f3f drivers/crypto/ccp/psp-dev.c Brijesh Singh         2017-12-04  1305  
b93566f1bb54e0 drivers/crypto/ccp/sev-dev.c Rijo Thomas           2019-12-04  1306  	sev->state = SEV_STATE_INIT;
0fc5deae03a272 drivers/crypto/ccp/psp-dev.c Tom Lendacky          2019-10-03  1307  
0fc5deae03a272 drivers/crypto/ccp/psp-dev.c Tom Lendacky          2019-10-03  1308  	/* Prepare for first SEV guest launch after INIT */
0fc5deae03a272 drivers/crypto/ccp/psp-dev.c Tom Lendacky          2019-10-03  1309  	wbinvd_on_all_cpus();
0fc5deae03a272 drivers/crypto/ccp/psp-dev.c Tom Lendacky          2019-10-03  1310  	rc = __sev_do_cmd_locked(SEV_CMD_DF_FLUSH, NULL, error);
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1311  	if (rc) {
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24 @1312  		dev_err(sev->dev, "SEV: DF_FLUSH failed %#x, rc %d\n",
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1313  			*error, rc);
0fc5deae03a272 drivers/crypto/ccp/psp-dev.c Tom Lendacky          2019-10-03  1314  		return rc;
9770b428b1a283 drivers/crypto/ccp/sev-dev.c Ashish Kalra          2025-03-24  1315  	}
0fc5deae03a272 drivers/crypto/ccp/psp-dev.c Tom Lendacky          2019-10-03  1316  
b93566f1bb54e0 drivers/crypto/ccp/sev-dev.c Rijo Thomas           2019-12-04  1317  	dev_dbg(sev->dev, "SEV firmware initialized\n");
200664d5237f3f drivers/crypto/ccp/psp-dev.c Brijesh Singh         2017-12-04  1318  
b64fa5fc9f4495 drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1319  	dev_info(sev->dev, "SEV API:%d.%d build:%d\n", sev->api_major,
b64fa5fc9f4495 drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1320  		 sev->api_minor, sev->build);
b64fa5fc9f4495 drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1321  
b64fa5fc9f4495 drivers/crypto/ccp/sev-dev.c Peter Gonda           2021-12-07  1322  	return 0;
200664d5237f3f drivers/crypto/ccp/psp-dev.c Brijesh Singh         2017-12-04  1323  }
200664d5237f3f drivers/crypto/ccp/psp-dev.c Brijesh Singh         2017-12-04  1324  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
