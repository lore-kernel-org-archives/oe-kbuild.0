Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7220E1E47C6
	for <oe-kbuild@lists.linux.dev>; Fri, 13 Dec 2024 17:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734112298; cv=none; b=Zx79tRyT89412ooisGv4onCcTvIG2L74d8xkmMBV0/KK9kijbUCZMZL7CUs9rzfaZXeceD7YAkunB98ECurI4WUUL2XOlscVZxQ/7PXRmkdbRC43SgeuquIkn6/2bZMw+3siDcJm8pR9FC5fsiBXF0wwrv2hAJMYu+U8Gopp1HE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734112298; c=relaxed/simple;
	bh=VQt94/rY5wTnWEzspYmKqZ1m++jWD417Du5sOcocTGo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NCpgYlcHrQDg9lwqoJUj0bDH4DElJVhNlVxTvzn+vGUVXVheglTXbA85yh4JbZCxVwhUn4YtsTeiRdFXSXnGsHMSFNXONfqACghNnzqhVEV04amgsr5xCG5Whyll+6w1uBREy57hrrg5O7QfG7tIuur2nzuAaijdoe93nJWEvJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LpBcyYtY; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LpBcyYtY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734112296; x=1765648296;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VQt94/rY5wTnWEzspYmKqZ1m++jWD417Du5sOcocTGo=;
  b=LpBcyYtYVlmCCZFxHnKZ0TbNapGmEC7m2j3enYVc7Kq4LoYsUP12iaUo
   hUAUR9LYkqy08GQaBCiO3oVXnyHLB8+Z/BJ0gs0JqeSuhRzAG/5xm1AZ+
   e4Jvy0YaZehL40WPp1WrAe7SxEcgkHC5EnkHrwpwgHr9Fw3UX5RN5I1Wz
   9VFZ6edI/mmPbUQBP2qLMucHmq/y/AxCJnzsvyqR0zA8mO2GjDEjqwCS7
   m0XfPs3BhqwBhCZMMwCswo/0yg6Nbyz+m/AFkwNGR7pLJ8JFSKEYMLFty
   vwfZ1tkIoipd7S2VH9BvcxW5TMEmEPU97oHUgBpZdYce943NOv6hJEiqQ
   A==;
X-CSE-ConnectionGUID: W4TLa+l1STGbk1fXhxPS+Q==
X-CSE-MsgGUID: 9SdTAg2BSp2aMKcbQsvCNA==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="33871183"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; 
   d="scan'208";a="33871183"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2024 09:51:36 -0800
X-CSE-ConnectionGUID: h7EXr1sQQ0qqpt/LKzIhhg==
X-CSE-MsgGUID: GEBgcC8/TEy4Yq2O9aQtoQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="97028871"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 13 Dec 2024 09:51:34 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tM9p6-000CI9-0t;
	Fri, 13 Dec 2024 17:51:32 +0000
Date: Sat, 14 Dec 2024 01:51:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djiang:cxl/features 11/15] drivers/cxl/core/mbox.c:775
 cxl_walk_cel() error: we previously assumed 'cmd' could be null (see line
 767)
Message-ID: <202412140111.UkB1YSO2-lkp@intel.com>
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
TO: Dave Jiang <dave.jiang@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/features
head:   f0a6d114e94c15c348733978c4dad4ecdae16d16
commit: 96d766b4e53edf0c9ef84fa447b7afe6fbeeb743 [11/15] cxl: Enumerate feature commands
:::::: branch date: 21 hours ago
:::::: commit date: 24 hours ago
config: i386-randconfig-141-20241213 (https://download.01.org/0day-ci/archive/20241214/202412140111.UkB1YSO2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202412140111.UkB1YSO2-lkp@intel.com/

smatch warnings:
drivers/cxl/core/mbox.c:775 cxl_walk_cel() error: we previously assumed 'cmd' could be null (see line 767)

vim +/cmd +775 drivers/cxl/core/mbox.c

4faf31b43468c58 Dan Williams     2021-09-08  742  
4faf31b43468c58 Dan Williams     2021-09-08  743  /**
4faf31b43468c58 Dan Williams     2021-09-08  744   * cxl_walk_cel() - Walk through the Command Effects Log.
59f8d1510739e92 Dan Williams     2023-06-14  745   * @mds: The driver data for the operation
4faf31b43468c58 Dan Williams     2021-09-08  746   * @size: Length of the Command Effects Log.
4faf31b43468c58 Dan Williams     2021-09-08  747   * @cel: CEL
4faf31b43468c58 Dan Williams     2021-09-08  748   *
4faf31b43468c58 Dan Williams     2021-09-08  749   * Iterate over each entry in the CEL and determine if the driver supports the
4faf31b43468c58 Dan Williams     2021-09-08  750   * command. If so, the command is enabled for the device and can be used later.
4faf31b43468c58 Dan Williams     2021-09-08  751   */
59f8d1510739e92 Dan Williams     2023-06-14  752  static void cxl_walk_cel(struct cxl_memdev_state *mds, size_t size, u8 *cel)
4faf31b43468c58 Dan Williams     2021-09-08  753  {
e624d105c460e56 Dave Jiang       2024-06-17  754  	struct cxl_mailbox *cxl_mbox = &mds->cxlds.cxl_mbox;
49be6dd807511db Dan Williams     2021-09-08  755  	struct cxl_cel_entry *cel_entry;
4faf31b43468c58 Dan Williams     2021-09-08  756  	const int cel_entries = size / sizeof(*cel_entry);
59f8d1510739e92 Dan Williams     2023-06-14  757  	struct device *dev = mds->cxlds.dev;
4faf31b43468c58 Dan Williams     2021-09-08  758  	int i;
4faf31b43468c58 Dan Williams     2021-09-08  759  
49be6dd807511db Dan Williams     2021-09-08  760  	cel_entry = (struct cxl_cel_entry *) cel;
4faf31b43468c58 Dan Williams     2021-09-08  761  
4faf31b43468c58 Dan Williams     2021-09-08  762  	for (i = 0; i < cel_entries; i++) {
4faf31b43468c58 Dan Williams     2021-09-08  763  		u16 opcode = le16_to_cpu(cel_entry[i].opcode);
4faf31b43468c58 Dan Williams     2021-09-08  764  		struct cxl_mem_command *cmd = cxl_mem_find_command(opcode);
d2f706058826b80 Ira Weiny        2023-09-03  765  		int enabled = 0;
4faf31b43468c58 Dan Williams     2021-09-08  766  
d2f706058826b80 Ira Weiny        2023-09-03 @767  		if (cmd) {
e624d105c460e56 Dave Jiang       2024-06-17  768  			set_bit(cmd->info.id, cxl_mbox->enabled_cmds);
d2f706058826b80 Ira Weiny        2023-09-03  769  			enabled++;
96d766b4e53edf0 Dave Jiang       2024-12-11  770  		} else {
96d766b4e53edf0 Dave Jiang       2024-12-11  771  			struct cxl_mem_command *fcmd =
96d766b4e53edf0 Dave Jiang       2024-12-11  772  				cxl_find_feature_command(opcode);
96d766b4e53edf0 Dave Jiang       2024-12-11  773  
96d766b4e53edf0 Dave Jiang       2024-12-11  774  			if (fcmd) {
96d766b4e53edf0 Dave Jiang       2024-12-11 @775  				set_bit(cmd->info.id, cxl_mbox->feature_cmds);
96d766b4e53edf0 Dave Jiang       2024-12-11  776  				enabled++;
96d766b4e53edf0 Dave Jiang       2024-12-11  777  			}
d2f706058826b80 Ira Weiny        2023-09-03  778  		}
d0abf5787adc034 Alison Schofield 2023-04-18  779  
d2f706058826b80 Ira Weiny        2023-09-03  780  		if (cxl_is_poison_command(opcode)) {
59f8d1510739e92 Dan Williams     2023-06-14  781  			cxl_set_poison_cmd_enabled(&mds->poison, opcode);
d2f706058826b80 Ira Weiny        2023-09-03  782  			enabled++;
d2f706058826b80 Ira Weiny        2023-09-03  783  		}
d0abf5787adc034 Alison Schofield 2023-04-18  784  
d2f706058826b80 Ira Weiny        2023-09-03  785  		if (cxl_is_security_command(opcode)) {
ad64f5952ce3ea5 Davidlohr Bueso  2023-07-25  786  			cxl_set_security_cmd_enabled(&mds->security, opcode);
d2f706058826b80 Ira Weiny        2023-09-03  787  			enabled++;
d2f706058826b80 Ira Weiny        2023-09-03  788  		}
ad64f5952ce3ea5 Davidlohr Bueso  2023-07-25  789  
d2f706058826b80 Ira Weiny        2023-09-03  790  		dev_dbg(dev, "Opcode 0x%04x %s\n", opcode,
d2f706058826b80 Ira Weiny        2023-09-03  791  			enabled ? "enabled" : "unsupported by driver");
4faf31b43468c58 Dan Williams     2021-09-08  792  	}
4faf31b43468c58 Dan Williams     2021-09-08  793  }
4faf31b43468c58 Dan Williams     2021-09-08  794  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
