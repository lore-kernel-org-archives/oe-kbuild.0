Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36526C297
	for <oe-kbuild@lists.linux.dev>; Thu,  9 Mar 2023 21:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678397503; x=1709933503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=X1qVsYInYWTsoWUq2QGQYc/AEQAwD0Es/kYF5zuNuw0=;
  b=Glo2iXNm1XNJowQO0bP+kbtEvLbB9sE7LafQuYXHnvR9opIqA5RvvCy5
   pT5AQFV09/CwEy2is1CLVpsp6E8jJ/lj4RMcfu3jQWZZGFem2JHbcOv7a
   jFqXikNhth8lzxxVUV55V8R4YvNqmqRRo1wBkSaYkQDVM7PEiB1EwaKgv
   YktLrY0mIeYCfLU58cmyFCn7VJNYeSk+KmGpvz5GhOLmZz5704ImDD2IT
   l+/QEY7TYevBAilugqQOKDNBwlteAYUf8s47xZd6n2TtXEAIfyr9hkqUC
   8T7d8K5aIFuEOde0djYRjgfFy5NuFuE0/ojct7M0+5HxLIyA0dADslPCO
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="324924253"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="324924253"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2023 13:31:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="746474007"
X-IronPort-AV: E=Sophos;i="5.98,247,1673942400"; 
   d="scan'208";a="746474007"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 09 Mar 2023 13:31:41 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1paNrQ-0003ET-0K;
	Thu, 09 Mar 2023 21:31:40 +0000
Date: Fri, 10 Mar 2023 05:31:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/input/misc/iqs7222.c:1404 iqs7222_dev_init() error:
 uninitialized symbol 'error'.
Message-ID: <202303100507.ZnIZTMW6-lkp@intel.com>
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
TO: Jeff LaBundy <jeff@labundy.com>
CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   44889ba56cbb3d51154660ccd15818bc77276696
commit: e505edaedcb9e7d16eefddc62d2189afaea0febc Input: add support for Azoteq IQS7222A/B/C
date:   11 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 11 months ago
config: ia64-randconfig-m041-20230308 (https://download.01.org/0day-ci/archive/20230310/202303100507.ZnIZTMW6-lkp@intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303100507.ZnIZTMW6-lkp@intel.com/

smatch warnings:
drivers/input/misc/iqs7222.c:1404 iqs7222_dev_init() error: uninitialized symbol 'error'.

vim +/error +1404 drivers/input/misc/iqs7222.c

e505edaedcb9e7 Jeff LaBundy 2022-04-08  1329  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1330  static int iqs7222_dev_init(struct iqs7222_private *iqs7222, int dir)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1331  {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1332  	const struct iqs7222_dev_desc *dev_desc = iqs7222->dev_desc;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1333  	int comms_offset = dev_desc->comms_offset;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1334  	int error, i, j, k;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1335  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1336  	/*
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1337  	 * Take advantage of the stop-bit disable function, if available, to
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1338  	 * save the trouble of having to reopen a communication window after
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1339  	 * each burst read or write.
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1340  	 */
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1341  	if (comms_offset) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1342  		u16 comms_setup;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1343  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1344  		error = iqs7222_read_word(iqs7222,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1345  					  IQS7222_SYS_SETUP + comms_offset,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1346  					  &comms_setup);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1347  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1348  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1349  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1350  		error = iqs7222_write_word(iqs7222,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1351  					   IQS7222_SYS_SETUP + comms_offset,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1352  					   comms_setup | IQS7222_COMMS_HOLD);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1353  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1354  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1355  	}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1356  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1357  	for (i = 0; i < IQS7222_NUM_REG_GRPS; i++) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1358  		int num_row = dev_desc->reg_grps[i].num_row;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1359  		int num_col = dev_desc->reg_grps[i].num_col;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1360  		u16 reg = dev_desc->reg_grps[i].base;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1361  		__le16 *val_buf;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1362  		u16 *val;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1363  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1364  		if (!num_col)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1365  			continue;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1366  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1367  		val = iqs7222_setup(iqs7222, i, 0);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1368  		if (!val)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1369  			continue;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1370  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1371  		val_buf = kcalloc(num_col, sizeof(__le16), GFP_KERNEL);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1372  		if (!val_buf)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1373  			return -ENOMEM;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1374  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1375  		for (j = 0; j < num_row; j++) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1376  			switch (dir) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1377  			case READ:
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1378  				error = iqs7222_read_burst(iqs7222, reg,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1379  							   val_buf, num_col);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1380  				for (k = 0; k < num_col; k++)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1381  					val[k] = le16_to_cpu(val_buf[k]);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1382  				break;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1383  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1384  			case WRITE:
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1385  				for (k = 0; k < num_col; k++)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1386  					val_buf[k] = cpu_to_le16(val[k]);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1387  				error = iqs7222_write_burst(iqs7222, reg,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1388  							    val_buf, num_col);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1389  				break;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1390  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1391  			default:
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1392  				error = -EINVAL;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1393  			}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1394  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1395  			if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1396  				break;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1397  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1398  			reg += IQS7222_REG_OFFSET;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1399  			val += iqs7222_max_cols[i];
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1400  		}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1401  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1402  		kfree(val_buf);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1403  
e505edaedcb9e7 Jeff LaBundy 2022-04-08 @1404  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1405  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1406  	}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1407  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1408  	if (comms_offset) {
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1409  		u16 comms_setup;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1410  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1411  		error = iqs7222_read_word(iqs7222,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1412  					  IQS7222_SYS_SETUP + comms_offset,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1413  					  &comms_setup);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1414  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1415  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1416  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1417  		error = iqs7222_write_word(iqs7222,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1418  					   IQS7222_SYS_SETUP + comms_offset,
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1419  					   comms_setup & ~IQS7222_COMMS_HOLD);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1420  		if (error)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1421  			return error;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1422  	}
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1423  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1424  	if (dir == READ)
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1425  		return 0;
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1426  
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1427  	return iqs7222_ati_trigger(iqs7222);
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1428  }
e505edaedcb9e7 Jeff LaBundy 2022-04-08  1429  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
