Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6031B1A314C
	for <oe-kbuild@lists.linux.dev>; Thu, 22 May 2025 06:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747894993; cv=none; b=j4BSvz6k8ZCijoLzXXTYK3yWU+E55TRc3eelvYq/IOv5BJjRQFU/dY7m08x2NrkzP2ftc8GXYKiwIaC/8sSeRf0E6UmRTPL167TkSouNmzF3k707KFci5LWL8ZeWynzgAnwv14d7g0KlZbNNnFhQR4CTg9naJrWoIYw0QyY+Qmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747894993; c=relaxed/simple;
	bh=376UWT4i3O4mVKtfq2H9612ygArfIgd9XsQgI/z8ZXA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pRZDaAk/c3lOBDvTdpwn6A/cRnjVhtg1ap7dwOK6C6sbe+gcEvWoTlXojtRaQgmdElOnhNoLsPAuM1pHpup4ttr7UnUMBU5UqvZlyPN8EqOXCD9IhFUZZ0RU19R0QMEf1m92laCVe9nahAsfUILMB1awtrFHUOUm/wLarIDrbzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQJktnrp; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQJktnrp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747894991; x=1779430991;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=376UWT4i3O4mVKtfq2H9612ygArfIgd9XsQgI/z8ZXA=;
  b=YQJktnrpxAoafu2MAzuj81Iigngu5w7/7a1+eZPpFkukh+urulNm3ytC
   SQmGgmJ/qwpjecqVQNuptBHJus9K7yBBHm9kJpCDEdtt0RJsxz0JQc20W
   f+d5Q/KM/h1MJ01SZ8+usIr0QrBbm7c2txf2O96LX15k/lLbUhqZVSxsJ
   4bPURq+XWajqXQWREnLKf+ukyMBU6Y8mTtj9P9wxHdBLX0NketN8sxy0z
   oq+bnGAEWVfVTH04miDu1ijuKklqPp5o+wOnVtrHn5uP5Uf1uCSs7r8ep
   0ikxUkVi+pLKxgz0kZvIupmSdtKOCwovXBqpO+HLbj7pwXxPmJe+1jO8V
   g==;
X-CSE-ConnectionGUID: ylWdmCOQRUuHwIDxGR7BHA==
X-CSE-MsgGUID: tLjLm/7uT5uEq2GFIy98nw==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="37523236"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="37523236"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 23:23:10 -0700
X-CSE-ConnectionGUID: Ieh67vzHQIqTIcNiQvBurA==
X-CSE-MsgGUID: yUCl1malQVqycmsHlnM8sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; 
   d="scan'208";a="141365146"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 21 May 2025 23:23:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHzKc-000OzQ-0l;
	Thu, 22 May 2025 06:23:06 +0000
Date: Thu, 22 May 2025 14:22:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH] i2c: qup: Add error handling in qup_i2c_xfer_v2()
Message-ID: <202505221445.quJVHqSz-lkp@intel.com>
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
In-Reply-To: <20250519141918.2522-1-vulab@iscas.ac.cn>
References: <20250519141918.2522-1-vulab@iscas.ac.cn>
TO: Wentao Liang <vulab@iscas.ac.cn>
TO: andi.shyti@kernel.org
CC: linux-arm-msm@vger.kernel.org
CC: linux-i2c@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: Wentao Liang <vulab@iscas.ac.cn>
CC: stable@vger.kernel.org

Hi Wentao,

kernel test robot noticed the following build warnings:

[auto build test WARNING on andi-shyti/i2c/i2c-host]
[also build test WARNING on linus/master v6.15-rc7 next-20250521]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Wentao-Liang/i2c-qup-Add-error-handling-in-qup_i2c_xfer_v2/20250519-222137
base:   https://git.kernel.org/pub/scm/linux/kernel/git/andi.shyti/linux.git i2c/i2c-host
patch link:    https://lore.kernel.org/r/20250519141918.2522-1-vulab%40iscas.ac.cn
patch subject: [PATCH] i2c: qup: Add error handling in qup_i2c_xfer_v2()
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: powerpc64-randconfig-r071-20250522 (https://download.01.org/0day-ci/archive/20250522/202505221445.quJVHqSz-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202505221445.quJVHqSz-lkp@intel.com/

smatch warnings:
drivers/i2c/busses/i2c-qup.c:1621 qup_i2c_xfer_v2() error: uninitialized symbol 'err'.

vim +/err +1621 drivers/i2c/busses/i2c-qup.c

7545c7dba169c4 Abhishek Sahu         2018-03-12  1564  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1565  static int qup_i2c_xfer_v2(struct i2c_adapter *adap,
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1566  			   struct i2c_msg msgs[],
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1567  			   int num)
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1568  {
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1569  	struct qup_i2c_dev *qup = i2c_get_adapdata(adap);
61f647e9d36d67 Wentao Liang          2025-05-19  1570  	int ret, err, idx = 0;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1571  
fbf9921f8b35d9 Sricharan Ramabadhran 2016-06-10  1572  	qup->bus_err = 0;
fbf9921f8b35d9 Sricharan Ramabadhran 2016-06-10  1573  	qup->qup_err = 0;
fbf9921f8b35d9 Sricharan Ramabadhran 2016-06-10  1574  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1575  	ret = pm_runtime_get_sync(qup->dev);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1576  	if (ret < 0)
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1577  		goto out;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1578  
7545c7dba169c4 Abhishek Sahu         2018-03-12  1579  	ret = qup_i2c_determine_mode_v2(qup, msgs, num);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1580  	if (ret)
7545c7dba169c4 Abhishek Sahu         2018-03-12  1581  		goto out;
7545c7dba169c4 Abhishek Sahu         2018-03-12  1582  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1583  	writel(1, qup->base + QUP_SW_RESET);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1584  	ret = qup_i2c_poll_state(qup, QUP_RESET_STATE);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1585  	if (ret)
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1586  		goto out;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1587  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1588  	/* Configure QUP as I2C mini core */
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1589  	writel(I2C_MINI_CORE | I2C_N_VAL_V2, qup->base + QUP_CONFIG);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1590  	writel(QUP_V2_TAGS_EN, qup->base + QUP_I2C_MASTER_GEN);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1591  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1592  	if (qup_i2c_poll_state_i2c_master(qup)) {
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1593  		ret = -EIO;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1594  		goto out;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1595  	}
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1596  
eb422b539c1f39 Abhishek Sahu         2018-03-12  1597  	if (qup->use_dma) {
7545c7dba169c4 Abhishek Sahu         2018-03-12  1598  		reinit_completion(&qup->xfer);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1599  		ret = qup_i2c_bam_xfer(adap, &msgs[0], num);
eb422b539c1f39 Abhishek Sahu         2018-03-12  1600  		qup->use_dma = false;
9cedf3b2f09946 Sricharan Ramabadhran 2016-02-22  1601  	} else {
7545c7dba169c4 Abhishek Sahu         2018-03-12  1602  		qup_i2c_conf_mode_v2(qup);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1603  
7545c7dba169c4 Abhishek Sahu         2018-03-12  1604  		for (idx = 0; idx < num; idx++) {
7545c7dba169c4 Abhishek Sahu         2018-03-12  1605  			qup->msg = &msgs[idx];
7545c7dba169c4 Abhishek Sahu         2018-03-12  1606  			qup->is_last = idx == (num - 1);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1607  
7545c7dba169c4 Abhishek Sahu         2018-03-12  1608  			ret = qup_i2c_xfer_v2_msg(qup, idx,
7545c7dba169c4 Abhishek Sahu         2018-03-12  1609  					!!(msgs[idx].flags & I2C_M_RD));
7545c7dba169c4 Abhishek Sahu         2018-03-12  1610  			if (ret)
7545c7dba169c4 Abhishek Sahu         2018-03-12  1611  				break;
7545c7dba169c4 Abhishek Sahu         2018-03-12  1612  		}
7545c7dba169c4 Abhishek Sahu         2018-03-12  1613  		qup->msg = NULL;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1614  	}
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1615  
f74187932d30e4 Sricharan Ramabadhran 2016-01-19  1616  	if (!ret)
7545c7dba169c4 Abhishek Sahu         2018-03-12  1617  		ret = qup_i2c_bus_active(qup, ONE_BYTE);
7545c7dba169c4 Abhishek Sahu         2018-03-12  1618  
7545c7dba169c4 Abhishek Sahu         2018-03-12  1619  	if (!ret)
61f647e9d36d67 Wentao Liang          2025-05-19  1620  		err = qup_i2c_change_state(qup, QUP_RESET_STATE);
61f647e9d36d67 Wentao Liang          2025-05-19 @1621  	if (err)
61f647e9d36d67 Wentao Liang          2025-05-19  1622  		return err;
f74187932d30e4 Sricharan Ramabadhran 2016-01-19  1623  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1624  	if (ret == 0)
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1625  		ret = num;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1626  out:
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1627  	pm_runtime_mark_last_busy(qup->dev);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1628  	pm_runtime_put_autosuspend(qup->dev);
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1629  
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1630  	return ret;
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1631  }
191424bb6166f6 Sricharan Ramabadhran 2016-01-19  1632  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
