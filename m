Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82FCD1C7603
	for <oe-kbuild@lists.linux.dev>; Mon, 14 Oct 2024 19:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728933310; cv=none; b=EXZg07PZmUFP51wRh2AqIBYt0pEvV3ZtiH2ee3xI8AIJVtTgGkscgp46pIfFiIwmE7w3Qxw67JmMAYxEzhM25x8I2xycfW9OfCNRNejI+Ifk2fRNLiwn6LOw+zQqjpxzGbk8KWOCdnrpKd6bx+X3XQ99qN+JgqeFtRkPlMwt+q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728933310; c=relaxed/simple;
	bh=zerGp6zyF5PsjMp1YHHKTK8XOUuZaOaPlJP9DMkJGQ8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OnRWpWHmzZjMuy/fTl8yl5NrlR/XQ+R2g6R0/JvWF3O6iM8Z0QgCNeWzL5RlZ0FOnteZDPkhdJDXci2FE0nm7g1gybT1KeCmRHlN+DfilLSTD1yWJLL4jZCqTBMolD45K1AOrCa4qVtQpjeqtyymtlrx6J2aE7Coyn3i+bhQRSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qd3LOL5D; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qd3LOL5D"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728933309; x=1760469309;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zerGp6zyF5PsjMp1YHHKTK8XOUuZaOaPlJP9DMkJGQ8=;
  b=Qd3LOL5DH6m52IcBh6ASYPt9Yb9CBVZZEXfotKjlr3IMdLeVrxqVtyuj
   xBptzZQ8D77+eLEmDDQ8n+BTdJcqlVZy+GlgJL8X2jYY0s1VNI8+Z7BtC
   7lybDBETL5eSsu5ff7HQfHcjexNOvvsNagEJEX73YVeABW8Zp9V1CLmLE
   xfldxBp4Nj1pCPDPQKsockb6r8iGF4cfhQ6vQ6gj1e7//icVpBnx2wS57
   sLrP461ju3LfkmDy601jXTDUFrDoAHfF24nX2DyfS5d51Hn7mtfEH3VvA
   J75JesC0kE3/JROaLq783Lv0XoGQBpv7qeWACYMClh1Zs0oi3SB+w3Djq
   Q==;
X-CSE-ConnectionGUID: f7WX6ttjReKTnFLERozrFQ==
X-CSE-MsgGUID: GrxMre0xQfuAmN/AwaIBdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="27789562"
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="27789562"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2024 12:15:08 -0700
X-CSE-ConnectionGUID: NOn/TqQsRzOqV8Yf4/YRHw==
X-CSE-MsgGUID: FCcsz9jySkmAmStQvKKYnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,203,1725346800"; 
   d="scan'208";a="78486954"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 14 Oct 2024 12:15:05 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t0QWw-000H32-0c;
	Mon, 14 Oct 2024 19:14:58 +0000
Date: Tue, 15 Oct 2024 03:14:47 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [jic23-iio:testing 24/26] drivers/iio/light/vl6180.c:231:3-9:
 preceding lock on line 219
Message-ID: <202410150357.z1206Zoq-lkp@intel.com>
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
head:   465644ac29536d10178b5ca4684d0b84765b9fa4
commit: acea0e6dd7d459e267efa0c4e8fa284669762e85 [24/26] iio: light: vl6180: Added Interrupt support for single shot access
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arc-randconfig-r052-20241014 (https://download.01.org/0day-ci/archive/20241015/202410150357.z1206Zoq-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410150357.z1206Zoq-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/iio/light/vl6180.c:231:3-9: preceding lock on line 219

vim +231 drivers/iio/light/vl6180.c

5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  211  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  212  static int vl6180_measure(struct vl6180_data *data, int addr)
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  213  {
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  214  	struct i2c_client *client = data->client;
acea0e6dd7d459 Abhash Jha            2024-10-07  215  	unsigned long time_left;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  216  	int tries = 20, ret;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  217  	u16 value;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  218  
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19 @219  	mutex_lock(&data->lock);
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
acea0e6dd7d459 Abhash Jha            2024-10-07 @231  			return -ETIMEDOUT;
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
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  268  	return ret;
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  269  }
5e7f47e495ad36 Manivannan Sadhasivam 2017-03-19  270  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
