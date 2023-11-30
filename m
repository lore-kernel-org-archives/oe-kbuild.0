Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A281F134B0
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Nov 2023 03:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SWiy008m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701316503; x=1732852503;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xq/+xF1h1nG9QjMYVJtbRuahqg3Ls2szmvo5cOqOsRE=;
  b=SWiy008mC4gtczj0aMvN4116DiuUff1TMFG+KwAszKr+XCY1wjC/SQk2
   c/KBeelFkxQ6/t3upZENL/FQvE404QGwofLDHw/wd1SADZI9gcxSmi7xx
   8s1BGThGa/DynG+8WQny+Dui5luT09Nly/72KMRxVEtrJDTq+VB7kd4oQ
   /m10aNeyBFRMd7cTNKgBCsoo/8chiXVd850XsQGObnfe3Fr7nArWcrcTa
   HIoI4XF1msV58R85mzJAMQStr5wd0xisW4zXUEQooykK9UWtrt2po4AgF
   b78ljaV0yyJcnlhJf6W8qGWIbej89dxH48zYcEQebwuaQHh72esmyWZkq
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="459757279"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="459757279"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2023 19:55:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="745488159"
X-IronPort-AV: E=Sophos;i="6.04,237,1695711600"; 
   d="scan'208";a="745488159"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 29 Nov 2023 19:55:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8Y8g-0001JE-1f;
	Thu, 30 Nov 2023 03:54:58 +0000
Date: Thu, 30 Nov 2023 11:54:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [pinchartl:mtk/v6.7/thp7312/next 4/4]
 drivers/media/i2c/thp7312.c:1838 thp7312_fw_write() warn: inconsistent
 returns '&thp7312->fw_lock'.
Message-ID: <202311300837.i0Yl4NPb-lkp@intel.com>
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
TO: Paul Elder <paul.elder@ideasonboard.com>
CC: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git mtk/v6.7/thp7312/next
head:   7a3a1ee25e6b83ebe88d64bb1038d8e141bb824f
commit: 7a3a1ee25e6b83ebe88d64bb1038d8e141bb824f [4/4] media: i2c: Add driver for THine THP7312
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm64-randconfig-r081-20231127 (https://download.01.org/0day-ci/archive/20231130/202311300837.i0Yl4NPb-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project.git f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311300837.i0Yl4NPb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311300837.i0Yl4NPb-lkp@intel.com/

smatch warnings:
drivers/media/i2c/thp7312.c:1838 thp7312_fw_write() warn: inconsistent returns '&thp7312->fw_lock'.

vim +1838 drivers/media/i2c/thp7312.c

7a3a1ee25e6b83 Paul Elder 2023-06-20  1796  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1797  static enum fw_upload_err thp7312_fw_write(struct fw_upload *fw_upload,
7a3a1ee25e6b83 Paul Elder 2023-06-20  1798  					   const u8 *data, u32 offset,
7a3a1ee25e6b83 Paul Elder 2023-06-20  1799  					   u32 size, u32 *written)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1800  {
7a3a1ee25e6b83 Paul Elder 2023-06-20  1801  	struct thp7312_device *thp7312 = fw_upload->dd_handle;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1802  	struct device *dev = thp7312->dev;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1803  	u16 header_size = size - THP7312_FW_RAM_SIZE;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1804  	enum fw_upload_err ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1805  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1806  	mutex_lock(&thp7312->fw_lock);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1807  	if (thp7312->fw_cancel)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1808  		return FW_UPLOAD_ERR_CANCELED;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1809  	mutex_unlock(&thp7312->fw_lock);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1810  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1811  	ret = thp7312_flash_erase(thp7312);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1812  	if (ret != FW_UPLOAD_ERR_NONE)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1813  		return ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1814  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1815  	ret = thp7312_fw_load_to_ram(thp7312, data, THP7312_FW_RAM_SIZE);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1816  	if (ret != FW_UPLOAD_ERR_NONE)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1817  		return ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1818  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1819  	ret = thp7312_fw_write_to_flash(thp7312, 0, 0x1ffff);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1820  	if (ret != FW_UPLOAD_ERR_NONE)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1821  		return ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1822  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1823  	ret = thp7312_fw_load_to_ram(thp7312, data + THP7312_FW_RAM_SIZE, header_size);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1824  	if (ret != FW_UPLOAD_ERR_NONE)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1825  		return ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1826  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1827  	ret = thp7312_fw_write_to_flash(thp7312, 0x20000, header_size - 1);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1828  	if (ret != FW_UPLOAD_ERR_NONE)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1829  		return ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1830  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1831  	ret = thp7312_fw_check_crc(thp7312, data, size);
7a3a1ee25e6b83 Paul Elder 2023-06-20  1832  	if (ret != FW_UPLOAD_ERR_NONE)
7a3a1ee25e6b83 Paul Elder 2023-06-20  1833  		return ret;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1834  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1835  	dev_info(dev, "Successfully wrote firmware\n");
7a3a1ee25e6b83 Paul Elder 2023-06-20  1836  
7a3a1ee25e6b83 Paul Elder 2023-06-20  1837  	*written = size;
7a3a1ee25e6b83 Paul Elder 2023-06-20 @1838  	return FW_UPLOAD_ERR_NONE;
7a3a1ee25e6b83 Paul Elder 2023-06-20  1839  }
7a3a1ee25e6b83 Paul Elder 2023-06-20  1840  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
