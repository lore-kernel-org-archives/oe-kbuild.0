Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0A91E4A6
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Oct 2024 23:53:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728949997; cv=none; b=BZW+3OjvX+o/j3jBl1Mi8xrnE9OiNEAZXpQ+3PP7v+1Uu21NLpawf5kpg9Fm+W1efma7S5pe9m1prvIuxMw9RikDy2Jx5KGpRYjkhKSDog2K9FApjjZhsE+6SccTudoibEnW0V690b3Qz+VvhLcf45HfD/EjkRfXS97AigKkDA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728949997; c=relaxed/simple;
	bh=URKvNLh0VLN6NCfkNsIPo3JfwyYNdtptMfOLtouD7yE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Nt+vLCiDGDaDNIuzyvJXNED530fmzLsR+l4nMC5sYIhycvgwt9uUSvyoVdbDKdOgjKC9bPsMHWqZP+7cSXsvvSIBYAO0Mc4i59bHZ2t3gG5nFouh630cWleqI/BO90lHddMSmtWiHqX8uO/QSj70UnGqgxqwdv9qZvBvnxeqX8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UqxlvSik; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UqxlvSik"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728949996; x=1760485996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=URKvNLh0VLN6NCfkNsIPo3JfwyYNdtptMfOLtouD7yE=;
  b=UqxlvSik/8+6Vd71jfiCgqPhdrzjNKrzm2lgJoPZg1/RJmI4kyqbVUCO
   +xkhv3drUehbnjEXHwWyBzwOWq2dfN3JHdtO3pkWoTVsjw4g2HhjpqfNV
   6Xzgr47PnM+2TeZKIBHsmB4royOs/bp/J1y15K3jwXrVlpfoAw97vFdtJ
   nuO5v9TPl50K5NIRUKrq8GzINpbCbW0BIzeR56YtSoF7Kaqb78hOd1ivJ
   a9vRx/7I0B2nCUiK8zyn1dGIs6omOw+w2ubrE95SpkuFSAhUrQeFY5Pa/
   /A1i1RX0dw/2uEgOTjdV5gTSK6x4wMHvlKJNeB9LR627MVoV9YUgW9d4c
   A==;
X-CSE-ConnectionGUID: sRkNKtFzR7af9/MaepJMIg==
X-CSE-MsgGUID: u8hcST1zTf6tW0UXtAvvvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28408280"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28408280"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 16:53:16 -0700
X-CSE-ConnectionGUID: t7QHtRPkQo+UuIdniKOdDQ==
X-CSE-MsgGUID: BhEeRpTtT5izq0bMbe2VYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="77590271"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Oct 2024 16:53:14 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0UsB-000HL3-1t;
	Mon, 14 Oct 2024 23:53:11 +0000
Date: Tue, 15 Oct 2024 07:52:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [jic23-iio:testing 24/26] drivers/iio/light/vl6180.c:268
 vl6180_measure() warn: inconsistent returns '&data->lock'.
Message-ID: <202410150702.GKQ7QQ7l-lkp@intel.com>
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
TO: Abhash Jha <abhashkumarjha123@gmail.com>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git testing
head:   c3e9df514041ec6c46be83801b1891392f4522f7
commit: acea0e6dd7d459e267efa0c4e8fa284669762e85 [24/26] iio: light: vl6180: Added Interrupt support for single shot access
:::::: branch date: 5 hours ago
:::::: commit date: 2 days ago
config: s390-randconfig-r073-20241014 (https://download.01.org/0day-ci/archive/20241015/202410150702.GKQ7QQ7l-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410150702.GKQ7QQ7l-lkp@intel.com/

smatch warnings:
drivers/iio/light/vl6180.c:268 vl6180_measure() warn: inconsistent returns '&data->lock'.

vim +268 drivers/iio/light/vl6180.c

5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  211  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  212  static int vl6180_measure(struct vl6180_data *data, int addr)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  213  {
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  214  	struct i2c_client *client = data->client;
acea0e6dd7d459 Abhash Jha            2024-10-07  215  	unsigned long time_left;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  216  	int tries = 20, ret;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  217  	u16 value;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  218  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  219  	mutex_lock(&data->lock);
acea0e6dd7d459 Abhash Jha            2024-10-07  220  	reinit_completion(&data->completion);
acea0e6dd7d459 Abhash Jha            2024-10-07  221  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  222  	/* Start single shot measurement */
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  223  	ret = vl6180_write_byte(client,
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  224  		vl6180_chan_regs_table[addr].start_reg, VL6180_STARTSTOP);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  225  	if (ret < 0)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  226  		goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  227  
acea0e6dd7d459 Abhash Jha            2024-10-07  228  	if (client->irq) {
acea0e6dd7d459 Abhash Jha            2024-10-07  229  		time_left = wait_for_completion_timeout(&data->completion, HZ / 10);
acea0e6dd7d459 Abhash Jha            2024-10-07  230  		if (time_left == 0)
acea0e6dd7d459 Abhash Jha            2024-10-07  231  			return -ETIMEDOUT;
acea0e6dd7d459 Abhash Jha            2024-10-07  232  	} else {
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  233  		while (tries--) {
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  234  			ret = vl6180_read_byte(client, VL6180_INTR_STATUS);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  235  			if (ret < 0)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  236  				goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  237  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  238  			if (ret & vl6180_chan_regs_table[addr].drdy_mask)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  239  				break;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  240  			msleep(20);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  241  		}
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  242  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  243  		if (tries < 0) {
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  244  			ret = -EIO;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  245  			goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  246  		}
acea0e6dd7d459 Abhash Jha            2024-10-07  247  	}
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  248  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  249  	/* Read result value from appropriate registers */
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  250  	ret = vl6180_chan_regs_table[addr].word ?
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  251  		vl6180_read_word(client, vl6180_chan_regs_table[addr].value_reg) :
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  252  		vl6180_read_byte(client, vl6180_chan_regs_table[addr].value_reg);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  253  	if (ret < 0)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  254  		goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  255  	value = ret;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  256  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  257  	/* Clear the interrupt flag after data read */
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  258  	ret = vl6180_write_byte(client, VL6180_INTR_CLEAR,
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  259  		VL6180_CLEAR_ERROR | VL6180_CLEAR_ALS | VL6180_CLEAR_RANGE);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  260  	if (ret < 0)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  261  		goto fail;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  262  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  263  	ret = value;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  264  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  265  fail:
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  266  	mutex_unlock(&data->lock);
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  267  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19 @268  	return ret;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  269  }
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  270  

:::::: The code at line 268 was first introduced by commit
:::::: 5e7f47e495ad3657e1a7264bf20fb363607161e6 iio:light: Add support for STMicro VL6180 sensor

:::::: TO: Manivannan Sadhasivam <manivannanece23@gmail.com>
:::::: CC: Jonathan Cameron <jic23@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
