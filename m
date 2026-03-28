Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4136E1A9FA8
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Mar 2026 00:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774658202; cv=none; b=eiJhYw5llSKeQg2VSskOGCsNENNY+1UeVLMi45L2puOcn43Lqs2+30qGneo+UsHYm2vfq0BKFBlRF0d8stFSwo8QFdzAtl/8XMvYPcwfZd/c8mjqhGfBErIozh09HVlnpfpxfIqo044lJWenvcVaZ7XdNcaRWQLT+BtCP2eNcdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774658202; c=relaxed/simple;
	bh=+VUE2zLzP0FvP+zrUS8F8K8SYdMyX68h9by3szmfdbg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xyuht+A+JEFQI/7JF1toKDoJa60G7VQ7AUPblVWEj1jJONm471rPvatK9R+gkXNU1fkN7YGsNhnvDI3+hcgb1A+k26Ll6qx5LxaTXMmtdOEaapbXrf4Iz9b/NQCCcbBb5yjOZ7e8SKYtZ6ES52hzOyhm4TW3H4CAa2nQ5T0G29Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CXaUwsP5; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CXaUwsP5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774658201; x=1806194201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+VUE2zLzP0FvP+zrUS8F8K8SYdMyX68h9by3szmfdbg=;
  b=CXaUwsP5BN1Aa6VWuvxeviVk0L+B/EJX0Qrj21ILJEmuv+6iaPe74l5S
   9GK4BKZIWDXaWoE4NSZjfwmd1l/Kpmn+sTxLMBRTzj/j3cAxl9ElnkLEv
   5dZZof40Z96QwOG0tsibg28YVbJLqRE1Bhy/CLJwOXAyFVArPNh2w7DWX
   3Te+8j9ILoWUlriYvcshRoABXXuOrP2ACgMK30b0XVGzCQQtFPHHBk+bf
   lFQYKzdGNbEpZWW+scrhqLMK63/q3KQYGhPEhuQr8+djjBH41M/VCtNyB
   F9fhtKKcqMGNwFeybd3akEsoPo8UDkeT2Fq5IeZcq7RvcaoQzCdNYR5yZ
   A==;
X-CSE-ConnectionGUID: dq0dl8TPTTaPYRorp+yDHg==
X-CSE-MsgGUID: AiiBDXvrR0mLyVRxVFuvDA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="75759263"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="75759263"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 17:36:41 -0700
X-CSE-ConnectionGUID: uyVAkkmUQOuwdNCIM4l29Q==
X-CSE-MsgGUID: vOWeb2/qSeOZhnP+p8Wmbw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="255973556"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Mar 2026 17:36:39 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6HfJ-00000000AwD-18j8;
	Sat, 28 Mar 2026 00:36:37 +0000
Date: Sat, 28 Mar 2026 08:35:39 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [RFC 4/4] tpm: Increase TPM_BUFSIZE to 64kB for chunking support
Message-ID: <202603280809.fCfcehTj-lkp@intel.com>
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
In-Reply-To: <20260324071803.324774-5-armenon@redhat.com>
References: <20260324071803.324774-5-armenon@redhat.com>
TO: Arun Menon <armenon@redhat.com>

Hi Arun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Arun-Menon/tpm_crb-Add-definition-of-TPM-CRB-chunking-fields/20260326-015436
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20260324071803.324774-5-armenon%40redhat.com
patch subject: [RFC 4/4] tpm: Increase TPM_BUFSIZE to 64kB for chunking support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: openrisc-randconfig-r072-20260328 (https://download.01.org/0day-ci/archive/20260328/202603280809.fCfcehTj-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.5.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202603280809.fCfcehTj-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm_tis_i2c.c:235 tpm_tis_i2c_write_bytes() warn: impossible condition '(len > 65536 - 1) => (0-u16max > u16max)'

vim +235 drivers/char/tpm/tpm_tis_i2c.c

bbc23a07b0728c Alexander Steffen  2022-06-08  224  
bbc23a07b0728c Alexander Steffen  2022-06-08  225  static int tpm_tis_i2c_write_bytes(struct tpm_tis_data *data, u32 addr, u16 len,
bbc23a07b0728c Alexander Steffen  2022-06-08  226  				   const u8 *value,
bbc23a07b0728c Alexander Steffen  2022-06-08  227  				   enum tpm_tis_io_mode io_mode)
bbc23a07b0728c Alexander Steffen  2022-06-08  228  {
bbc23a07b0728c Alexander Steffen  2022-06-08  229  	struct tpm_tis_i2c_phy *phy = to_tpm_tis_i2c_phy(data);
bbc23a07b0728c Alexander Steffen  2022-06-08  230  	struct i2c_msg msg = { .addr = phy->i2c_client->addr };
bbc23a07b0728c Alexander Steffen  2022-06-08  231  	u8 reg = tpm_tis_i2c_address_to_register(addr);
bbc23a07b0728c Alexander Steffen  2022-06-08  232  	int ret;
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  233  	u16 wrote = 0;
bbc23a07b0728c Alexander Steffen  2022-06-08  234  
bbc23a07b0728c Alexander Steffen  2022-06-08 @235  	if (len > TPM_BUFSIZE - 1)
bbc23a07b0728c Alexander Steffen  2022-06-08  236  		return -EIO;
bbc23a07b0728c Alexander Steffen  2022-06-08  237  
bbc23a07b0728c Alexander Steffen  2022-06-08  238  	phy->io_buf[0] = reg;
bbc23a07b0728c Alexander Steffen  2022-06-08  239  	msg.buf = phy->io_buf;
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  240  	while (wrote < len) {
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  241  		/* write register and data in one go */
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  242  		msg.len = sizeof(reg) + len - wrote;
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  243  		if (msg.len > I2C_SMBUS_BLOCK_MAX)
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  244  			msg.len = I2C_SMBUS_BLOCK_MAX;
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  245  
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  246  		memcpy(phy->io_buf + sizeof(reg), value + wrote,
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  247  		       msg.len - sizeof(reg));
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  248  
bbc23a07b0728c Alexander Steffen  2022-06-08  249  		ret = tpm_tis_i2c_retry_transfer_until_ack(data, &msg);
bbc23a07b0728c Alexander Steffen  2022-06-08  250  		if (ret < 0)
bbc23a07b0728c Alexander Steffen  2022-06-08  251  			return ret;
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  252  		wrote += msg.len - sizeof(reg);
83e7e5d89f04d1 Alexander Sverdlin 2023-05-24  253  	}
bbc23a07b0728c Alexander Steffen  2022-06-08  254  
bbc23a07b0728c Alexander Steffen  2022-06-08  255  	return 0;
bbc23a07b0728c Alexander Steffen  2022-06-08  256  }
bbc23a07b0728c Alexander Steffen  2022-06-08  257  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
