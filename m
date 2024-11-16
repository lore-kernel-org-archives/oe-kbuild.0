Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94360194AD5
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Nov 2024 19:33:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731785585; cv=none; b=VvBnXH+oSwtID+tsFTLkgjxqgWW08vQQ+aziU0smSlN2KqeGNGnS4IhQBp8Dla6YVztjihgmHeGZk/BwIA7pyOPpQyyvxmyt+h2iXZiwmeuOyYgY+Rdbwu608ymYR/J6+zTmdTQbntLHdZhSp30OHYwqtZfWK8PF0fmmfjLnDes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731785585; c=relaxed/simple;
	bh=Yae4wussdGz/1L1c6nmuN2URjx2RWqcZBj71CGNoU3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rzNOqTqfaxqeiHjvI0jCnhjoYrUnrvpUNyixOwBr5uslN2/Sau6SIX2yVVpsvL8/w0KbmiGyvd0i9Qx/ugD+bASoBlZWAUhAKHeVpuDJn8URBmHnt1GAroI19YoUYp312eyVDafC72C7OVujoJz+Z/PC77eZ9ROWEYDx+iZEg7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mg5ZoVWk; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mg5ZoVWk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731785584; x=1763321584;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yae4wussdGz/1L1c6nmuN2URjx2RWqcZBj71CGNoU3s=;
  b=Mg5ZoVWkwbw20LCNRlfOrsKRpUBBT8msyCkz1cn1HOSlzitf2cL9JMuf
   /aH8frBUHhbIyhYER1KI6CgMVmk/IO41HIyEAzzPxfvgavllupofpinDb
   iQ3UKqJlto15jH79YM/WKC2/1EMJgPyC46eHbMBF+4C8pzFdiDtWVTWfB
   +g0jg2efNeA6QRprzJbkmNQVNC/xfDoMx+6GIvPH3GreDeVvNHVfYUvlC
   jKtXeUroTWRlM6O8P8DB2F459PDnIEhLxMI8h2Q5HyLm94wQJtju7oHGY
   E6z+bqaSKeyQ0cIrKayDUfpRGSupv3R2P0B7/YJFQmkGjytCjcVW5evCC
   Q==;
X-CSE-ConnectionGUID: Q2WSnV2OSpi61jxnqSxA2A==
X-CSE-MsgGUID: QrqbdXg2ScutyKA5fEW5Xw==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="42421048"
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="42421048"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 11:33:03 -0800
X-CSE-ConnectionGUID: EYRbtiTvRaiBUj7znOLKww==
X-CSE-MsgGUID: JJ0vb7HfSqujvzNawEgCEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,160,1728975600"; 
   d="scan'208";a="112140903"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 16 Nov 2024 11:33:02 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCOXT-00013v-1n;
	Sat, 16 Nov 2024 19:32:59 +0000
Date: Sun, 17 Nov 2024 03:32:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [djiang:cxl/fwctl 20/28] drivers/cxl/core/mbox.c:798 cxl_walk_cel()
 error: we previously assumed 'cmd' could be null (see line 783)
Message-ID: <202411170357.DFRoqGt8-lkp@intel.com>
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

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djiang/linux.git cxl/fwctl
head:   81cb57f64be6af29f39bde3b3ca4203975a84377
commit: 044c18e2de67a0bebddea14ec307777a5a1df048 [20/28] cxl: Save Command Effects Log (CEL) effects for enabled commands
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20241116 (https://download.01.org/0day-ci/archive/20241117/202411170357.DFRoqGt8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202411170357.DFRoqGt8-lkp@intel.com/

smatch warnings:
drivers/cxl/core/mbox.c:798 cxl_walk_cel() error: we previously assumed 'cmd' could be null (see line 783)

vim +/cmd +798 drivers/cxl/core/mbox.c

4faf31b43468c5 Dan Williams     2021-09-08  758  
4faf31b43468c5 Dan Williams     2021-09-08  759  /**
4faf31b43468c5 Dan Williams     2021-09-08  760   * cxl_walk_cel() - Walk through the Command Effects Log.
59f8d1510739e9 Dan Williams     2023-06-14  761   * @mds: The driver data for the operation
4faf31b43468c5 Dan Williams     2021-09-08  762   * @size: Length of the Command Effects Log.
4faf31b43468c5 Dan Williams     2021-09-08  763   * @cel: CEL
4faf31b43468c5 Dan Williams     2021-09-08  764   *
4faf31b43468c5 Dan Williams     2021-09-08  765   * Iterate over each entry in the CEL and determine if the driver supports the
4faf31b43468c5 Dan Williams     2021-09-08  766   * command. If so, the command is enabled for the device and can be used later.
4faf31b43468c5 Dan Williams     2021-09-08  767   */
59f8d1510739e9 Dan Williams     2023-06-14  768  static void cxl_walk_cel(struct cxl_memdev_state *mds, size_t size, u8 *cel)
4faf31b43468c5 Dan Williams     2021-09-08  769  {
744cd0e20b0ed8 Dave Jiang       2024-06-17  770  	struct cxl_mailbox *cxl_mbox = &mds->cxlds.cxl_mbox;
49be6dd807511d Dan Williams     2021-09-08  771  	struct cxl_cel_entry *cel_entry;
4faf31b43468c5 Dan Williams     2021-09-08  772  	const int cel_entries = size / sizeof(*cel_entry);
59f8d1510739e9 Dan Williams     2023-06-14  773  	struct device *dev = mds->cxlds.dev;
4faf31b43468c5 Dan Williams     2021-09-08  774  	int i;
4faf31b43468c5 Dan Williams     2021-09-08  775  
49be6dd807511d Dan Williams     2021-09-08  776  	cel_entry = (struct cxl_cel_entry *) cel;
4faf31b43468c5 Dan Williams     2021-09-08  777  
4faf31b43468c5 Dan Williams     2021-09-08  778  	for (i = 0; i < cel_entries; i++) {
4faf31b43468c5 Dan Williams     2021-09-08  779  		u16 opcode = le16_to_cpu(cel_entry[i].opcode);
4faf31b43468c5 Dan Williams     2021-09-08  780  		struct cxl_mem_command *cmd = cxl_mem_find_command(opcode);
d2f706058826b8 Ira Weiny        2023-09-03  781  		int enabled = 0;
4faf31b43468c5 Dan Williams     2021-09-08  782  
d2f706058826b8 Ira Weiny        2023-09-03 @783  		if (cmd) {
744cd0e20b0ed8 Dave Jiang       2024-06-17  784  			set_bit(cmd->info.id, cxl_mbox->enabled_cmds);
d2f706058826b8 Ira Weiny        2023-09-03  785  			enabled++;
d2f706058826b8 Ira Weiny        2023-09-03  786  		}
d0abf5787adc03 Alison Schofield 2023-04-18  787  
d2f706058826b8 Ira Weiny        2023-09-03  788  		if (cxl_is_poison_command(opcode)) {
59f8d1510739e9 Dan Williams     2023-06-14  789  			cxl_set_poison_cmd_enabled(&mds->poison, opcode);
d2f706058826b8 Ira Weiny        2023-09-03  790  			enabled++;
d2f706058826b8 Ira Weiny        2023-09-03  791  		}
d0abf5787adc03 Alison Schofield 2023-04-18  792  
d2f706058826b8 Ira Weiny        2023-09-03  793  		if (cxl_is_security_command(opcode)) {
ad64f5952ce3ea Davidlohr Bueso  2023-07-25  794  			cxl_set_security_cmd_enabled(&mds->security, opcode);
d2f706058826b8 Ira Weiny        2023-09-03  795  			enabled++;
d2f706058826b8 Ira Weiny        2023-09-03  796  		}
ad64f5952ce3ea Davidlohr Bueso  2023-07-25  797  
044c18e2de67a0 Dave Jiang       2024-11-06 @798  		cmd->info.effects = le16_to_cpu(cel_entry[i].effect);
044c18e2de67a0 Dave Jiang       2024-11-06  799  
d2f706058826b8 Ira Weiny        2023-09-03  800  		dev_dbg(dev, "Opcode 0x%04x %s\n", opcode,
d2f706058826b8 Ira Weiny        2023-09-03  801  			enabled ? "enabled" : "unsupported by driver");
4faf31b43468c5 Dan Williams     2021-09-08  802  	}
4faf31b43468c5 Dan Williams     2021-09-08  803  }
4faf31b43468c5 Dan Williams     2021-09-08  804  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
