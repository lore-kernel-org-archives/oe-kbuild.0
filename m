Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D2F111BF
	for <oe-kbuild@lists.linux.dev>; Sat,  9 Dec 2023 09:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ix3phuDI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702115946; x=1733651946;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/R8d4M20OPhoKHJK28t3x/HV1w4qprXoJ7cIpXkTeyo=;
  b=Ix3phuDIxGMc7CxBPcjanuVz8wQ5cm7dkZJfsWlvd1s9gWnf5g8+BtC1
   3Xair8NoDL+v4tZ1PhVJkE9gr1t8Uhzli9ouxkDL8m4hAoIFK8wUPor3y
   Ry8cVZLdEu5PyYVXNrSzsdOdxZ7a9xfxMAkZs7tj1/GttVIzBTsUbKAge
   WIiV4XWljkj6LG3ge6lS0H24+TuSXmd8TFjIz8kax4YuCj8t76yqqzY73
   zKOTkt1tEMIhy48FKm2Zqtus9wmxYT1mP/f4NwQL2AkXMjdlXDi71n5FJ
   LbcRbBUfQ0dI2zs0jircKBy67koneyTD0CH3xeZX22wfI6c2fakrEfrDK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="1628806"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="1628806"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2023 01:59:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10918"; a="916225197"
X-IronPort-AV: E=Sophos;i="6.04,263,1695711600"; 
   d="scan'208";a="916225197"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 09 Dec 2023 01:59:03 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rBu6t-000FAE-0m;
	Sat, 09 Dec 2023 09:58:59 +0000
Date: Sat, 9 Dec 2023 17:58:29 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/firmware/turris-mox-rwtm.c:416:27: sparse: sparse: incorrect
 type in argument 1 (different base types)
Message-ID: <202312091705.hUW40fYl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Arnd Bergmann <arnd@arndb.de>
CC: Bjorn Andersson <andersson@kernel.org>
CC: Charles Keepax <ckeepax@opensource.cirrus.com>
CC: Mark Brown <broonie@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f2e8a57ee9036c7d5443382b6c3c09b51a92ec7e
commit: 951cd3a0866d29cb9c01ebc1d9c17590e598226e firmware: include drivers/firmware/Kconfig unconditionally
date:   2 years, 2 months ago
:::::: branch date: 13 hours ago
:::::: commit date: 2 years, 2 months ago
config: openrisc-randconfig-r131-20231102 (https://download.01.org/0day-ci/archive/20231209/202312091705.hUW40fYl-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231209/202312091705.hUW40fYl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312091705.hUW40fYl-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/turris-mox-rwtm.c:416:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted __be32 [usertype] *dst @@     got unsigned int * @@
   drivers/firmware/turris-mox-rwtm.c:416:27: sparse:     expected restricted __be32 [usertype] *dst
   drivers/firmware/turris-mox-rwtm.c:416:27: sparse:     got unsigned int *
--
>> drivers/input/touchscreen/raspberrypi-ts.c:117:45: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void *cpu_addr @@     got void [noderef] __iomem *fw_regs_va @@
   drivers/input/touchscreen/raspberrypi-ts.c:117:45: sparse:     expected void *cpu_addr
   drivers/input/touchscreen/raspberrypi-ts.c:117:45: sparse:     got void [noderef] __iomem *fw_regs_va
>> drivers/input/touchscreen/raspberrypi-ts.c:147:24: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void [noderef] __iomem *fw_regs_va @@     got void * @@
   drivers/input/touchscreen/raspberrypi-ts.c:147:24: sparse:     expected void [noderef] __iomem *fw_regs_va
   drivers/input/touchscreen/raspberrypi-ts.c:147:24: sparse:     got void *
--
>> drivers/firmware/broadcom/bcm47xx_nvram.c:42:18: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/firmware/broadcom/bcm47xx_nvram.c:53:21: sparse: sparse: dereference of noderef expression

vim +416 drivers/firmware/turris-mox-rwtm.c

50524d787de343 Marek Behún 2020-06-01  355  
50524d787de343 Marek Behún 2020-06-01  356  static ssize_t do_sign_write(struct file *file, const char __user *buf,
50524d787de343 Marek Behún 2020-06-01  357  			     size_t len, loff_t *ppos)
50524d787de343 Marek Behún 2020-06-01  358  {
50524d787de343 Marek Behún 2020-06-01  359  	struct mox_rwtm *rwtm = file->private_data;
50524d787de343 Marek Behún 2020-06-01  360  	struct armada_37xx_rwtm_rx_msg *reply = &rwtm->reply;
50524d787de343 Marek Behún 2020-06-01  361  	struct armada_37xx_rwtm_tx_msg msg;
50524d787de343 Marek Behún 2020-06-01  362  	loff_t dummy = 0;
50524d787de343 Marek Behún 2020-06-01  363  	ssize_t ret;
50524d787de343 Marek Behún 2020-06-01  364  
50524d787de343 Marek Behún 2020-06-01  365  	/* the input is a SHA-512 hash, so exactly 64 bytes have to be read */
50524d787de343 Marek Behún 2020-06-01  366  	if (len != 64)
50524d787de343 Marek Behún 2020-06-01  367  		return -EINVAL;
50524d787de343 Marek Behún 2020-06-01  368  
50524d787de343 Marek Behún 2020-06-01  369  	/* if last result is not zero user has not read that information yet */
50524d787de343 Marek Behún 2020-06-01  370  	if (rwtm->last_sig_done)
50524d787de343 Marek Behún 2020-06-01  371  		return -EBUSY;
50524d787de343 Marek Behún 2020-06-01  372  
50524d787de343 Marek Behún 2020-06-01  373  	if (!mutex_trylock(&rwtm->busy))
50524d787de343 Marek Behún 2020-06-01  374  		return -EBUSY;
50524d787de343 Marek Behún 2020-06-01  375  
50524d787de343 Marek Behún 2020-06-01  376  	/*
50524d787de343 Marek Behún 2020-06-01  377  	 * Here we have to send:
50524d787de343 Marek Behún 2020-06-01  378  	 *   1. Address of the input to sign.
50524d787de343 Marek Behún 2020-06-01  379  	 *      The input is an array of 17 32-bit words, the first (most
50524d787de343 Marek Behún 2020-06-01  380  	 *      significat) is 0, the rest 16 words are copied from the SHA-512
50524d787de343 Marek Behún 2020-06-01  381  	 *      hash given by the user and converted from BE to LE.
50524d787de343 Marek Behún 2020-06-01  382  	 *   2. Address of the buffer where ECDSA signature value R shall be
50524d787de343 Marek Behún 2020-06-01  383  	 *      stored by the rWTM firmware.
50524d787de343 Marek Behún 2020-06-01  384  	 *   3. Address of the buffer where ECDSA signature value S shall be
50524d787de343 Marek Behún 2020-06-01  385  	 *      stored by the rWTM firmware.
50524d787de343 Marek Behún 2020-06-01  386  	 */
50524d787de343 Marek Behún 2020-06-01  387  	memset(rwtm->buf, 0, 4);
50524d787de343 Marek Behún 2020-06-01  388  	ret = simple_write_to_buffer(rwtm->buf + 4, 64, &dummy, buf, len);
50524d787de343 Marek Behún 2020-06-01  389  	if (ret < 0)
50524d787de343 Marek Behún 2020-06-01  390  		goto unlock_mutex;
50524d787de343 Marek Behún 2020-06-01  391  	be32_to_cpu_array(rwtm->buf, rwtm->buf, 17);
50524d787de343 Marek Behún 2020-06-01  392  
50524d787de343 Marek Behún 2020-06-01  393  	msg.command = MBOX_CMD_SIGN;
50524d787de343 Marek Behún 2020-06-01  394  	msg.args[0] = 1;
50524d787de343 Marek Behún 2020-06-01  395  	msg.args[1] = rwtm->buf_phys;
50524d787de343 Marek Behún 2020-06-01  396  	msg.args[2] = rwtm->buf_phys + 68;
50524d787de343 Marek Behún 2020-06-01  397  	msg.args[3] = rwtm->buf_phys + 2 * 68;
50524d787de343 Marek Behún 2020-06-01  398  	ret = mbox_send_message(rwtm->mbox, &msg);
50524d787de343 Marek Behún 2020-06-01  399  	if (ret < 0)
50524d787de343 Marek Behún 2020-06-01  400  		goto unlock_mutex;
50524d787de343 Marek Behún 2020-06-01  401  
50524d787de343 Marek Behún 2020-06-01  402  	ret = wait_for_completion_interruptible(&rwtm->cmd_done);
50524d787de343 Marek Behún 2020-06-01  403  	if (ret < 0)
50524d787de343 Marek Behún 2020-06-01  404  		goto unlock_mutex;
50524d787de343 Marek Behún 2020-06-01  405  
50524d787de343 Marek Behún 2020-06-01  406  	ret = MBOX_STS_VALUE(reply->retval);
50524d787de343 Marek Behún 2020-06-01  407  	if (MBOX_STS_ERROR(reply->retval) != MBOX_STS_SUCCESS)
50524d787de343 Marek Behún 2020-06-01  408  		goto unlock_mutex;
50524d787de343 Marek Behún 2020-06-01  409  
50524d787de343 Marek Behún 2020-06-01  410  	/*
50524d787de343 Marek Behún 2020-06-01  411  	 * Here we read the R and S values of the ECDSA signature
50524d787de343 Marek Behún 2020-06-01  412  	 * computed by the rWTM firmware and convert their words from
50524d787de343 Marek Behún 2020-06-01  413  	 * LE to BE.
50524d787de343 Marek Behún 2020-06-01  414  	 */
50524d787de343 Marek Behún 2020-06-01  415  	memcpy(rwtm->last_sig, rwtm->buf + 68, 136);
50524d787de343 Marek Behún 2020-06-01 @416  	cpu_to_be32_array(rwtm->last_sig, rwtm->last_sig, 34);
50524d787de343 Marek Behún 2020-06-01  417  	rwtm->last_sig_done = 1;
50524d787de343 Marek Behún 2020-06-01  418  
50524d787de343 Marek Behún 2020-06-01  419  	mutex_unlock(&rwtm->busy);
50524d787de343 Marek Behún 2020-06-01  420  	return len;
50524d787de343 Marek Behún 2020-06-01  421  unlock_mutex:
50524d787de343 Marek Behún 2020-06-01  422  	mutex_unlock(&rwtm->busy);
50524d787de343 Marek Behún 2020-06-01  423  	return ret;
50524d787de343 Marek Behún 2020-06-01  424  }
50524d787de343 Marek Behún 2020-06-01  425  

:::::: The code at line 416 was first introduced by commit
:::::: 50524d787de34300ca9189e63afe13e26d782bea firmware: turris-mox-rwtm: support ECDSA signatures via debugfs

:::::: TO: Marek Behún <marek.behun@nic.cz>
:::::: CC: Gregory CLEMENT <gregory.clement@bootlin.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
