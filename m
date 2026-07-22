Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84039439F87
	for <oe-kbuild@lists.linux.dev>; Wed, 22 Jul 2026 15:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784735652; cv=none; b=XzAJX/xmRZQ1okzcOZOCaRS9QOh3GFqTjcYl6uJTNaq8yvq+pt/bizAU8fboMGJmcG7ia9GIqdTT8yZd/sI53Ye0mUJ91jpb15bXHAr8pwMiAd6gld2DXw3qvUatFMzd5uAnAy3ganftkx/lUbxWOhoP+sXJbAYMWADdLBtHrWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784735652; c=relaxed/simple;
	bh=GNuoXwGbewuwOqTk3420hINgjRHJ//P8ccE0ueVwGIw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=AMTxAl0NChLMIpCz57nDoFq/tj9gLOaYUzHUC6N4+7Abe73MnxKyVDbDtAINRfk2eG1sk4h5m5G3oETwXQpqBgwbi4wwAzdKZ8dbllblanwhmkkr4Zi+P1wR2uQVox8R3vhKNeYFybsYyOCwLY3gftACfnoVgzoCiW8itzi+Ws8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dk1IxOyi; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dk1IxOyi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784735649; x=1816271649;
  h=date:from:to:cc:subject:message-id;
  bh=GNuoXwGbewuwOqTk3420hINgjRHJ//P8ccE0ueVwGIw=;
  b=Dk1IxOyiASNWgzRytkhjbB9kRMZF/iCT1UoaJm3LIUmnG3FxQd/9hHd/
   6Lr4BEN3xF8kzBdbqFlLcevNHLdSLDVOf/6eaYCzL456fuERj2HSX1nnp
   MXr7qgfxSjiNFQ47mZqaIW/8vvFhcUpwUC7d3DRX44H6eYGb44xuQB+XG
   eXzSytvuIzW4A4Vm2z66K7UaL/w2Lans32H8k0E7TS1KwF1BoIt7cmtJt
   7s0lXoYalaFpx8DKiMUldqPFzonJT5QFP7ZpbtzbYIQOLgigJ4Rnk9HeL
   zfMw++EQj+mTHdxcjiDgVUjhHsFmK+GJdklX0nGlxbF9oBx/XTMddTppJ
   Q==;
X-CSE-ConnectionGUID: AyKLtofoQkiGanN9CMJ1Xg==
X-CSE-MsgGUID: pWwSF++/STmmrU5Hj9uACQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96890816"
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="96890816"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2026 08:54:09 -0700
X-CSE-ConnectionGUID: MOOaHnlNRJSXvdv6DqPQeg==
X-CSE-MsgGUID: gclHHBafSSiJClTH/qVDKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,178,1779174000"; 
   d="scan'208";a="254212782"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jul 2026 08:54:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wmZGk-00000000YqT-1OxH;
	Wed, 22 Jul 2026 15:54:03 +0000
Date: Wed, 22 Jul 2026 23:53:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6910/8209] drivers/i3c/master.c:1047
 i3c_master_send_ccc_cmd_locked() error: we previously assumed 'cmd->dests'
 could be null (see line 1033)
Message-ID: <202607222347.TXH6r6ie-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Adrian Ng Ho Yin <adrian.ho.yin.ng@altera.com>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: Tze Yee Ng <tze.yee.ng@altera.com>
CC: Alexandre Mergnat <amergnat@baylibre.com>
CC: Frank Li <Frank.Li@nxp.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   290aaf24a551d5a0dce037e3fab30820f9113a10
commit: 02cc832191dd891f7e44003a775eb5d5a4fabb40 [6910/8209] i3c: master: Validate GET CCC payload length and retry Direct GET once
:::::: branch date: 23 hours ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-161-20260722 (https://download.01.org/0day-ci/archive/20260722/202607222347.TXH6r6ie-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202607222347.TXH6r6ie-lkp@intel.com/

smatch warnings:
drivers/i3c/master.c:1047 i3c_master_send_ccc_cmd_locked() error: we previously assumed 'cmd->dests' could be null (see line 1033)

vim +1047 drivers/i3c/master.c

02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1008  
ef8b5229348f07 Jorge Marques    2026-03-23  1009  /**
ef8b5229348f07 Jorge Marques    2026-03-23  1010   * i3c_master_send_ccc_cmd_locked() - send a CCC (Common Command Codes)
ef8b5229348f07 Jorge Marques    2026-03-23  1011   * @master: master used to send frames on the bus
ef8b5229348f07 Jorge Marques    2026-03-23  1012   * @cmd: command to send
ef8b5229348f07 Jorge Marques    2026-03-23  1013   *
ef8b5229348f07 Jorge Marques    2026-03-23  1014   * Return: 0 in case of success, or a negative error code otherwise.
ef8b5229348f07 Jorge Marques    2026-03-23  1015   *         I3C Mx error codes are stored in cmd->err.
ef8b5229348f07 Jorge Marques    2026-03-23  1016   */
3a379bbcea0af6 Boris Brezillon  2017-07-19  1017  static int i3c_master_send_ccc_cmd_locked(struct i3c_master_controller *master,
3a379bbcea0af6 Boris Brezillon  2017-07-19  1018  					  struct i3c_ccc_cmd *cmd)
3a379bbcea0af6 Boris Brezillon  2017-07-19  1019  {
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1020  	unsigned int attempt, max_attempts;
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1021  	int ret;
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1022  
3a379bbcea0af6 Boris Brezillon  2017-07-19  1023  	if (!cmd || !master)
3a379bbcea0af6 Boris Brezillon  2017-07-19  1024  		return -EINVAL;
3a379bbcea0af6 Boris Brezillon  2017-07-19  1025  
3a379bbcea0af6 Boris Brezillon  2017-07-19  1026  	if (WARN_ON(master->init_done &&
3a379bbcea0af6 Boris Brezillon  2017-07-19  1027  		    !rwsem_is_locked(&master->bus.lock)))
3a379bbcea0af6 Boris Brezillon  2017-07-19  1028  		return -EINVAL;
3a379bbcea0af6 Boris Brezillon  2017-07-19  1029  
3a379bbcea0af6 Boris Brezillon  2017-07-19  1030  	if (!master->ops->send_ccc_cmd)
d10a4c323883c4 Wolfram Sang     2025-06-28  1031  		return -EOPNOTSUPP;
3a379bbcea0af6 Boris Brezillon  2017-07-19  1032  
3a379bbcea0af6 Boris Brezillon  2017-07-19 @1033  	if ((cmd->id & I3C_CCC_DIRECT) && (!cmd->dests || !cmd->ndests))
3a379bbcea0af6 Boris Brezillon  2017-07-19  1034  		return -EINVAL;
3a379bbcea0af6 Boris Brezillon  2017-07-19  1035  
3a379bbcea0af6 Boris Brezillon  2017-07-19  1036  	if (master->ops->supports_ccc_cmd &&
3a379bbcea0af6 Boris Brezillon  2017-07-19  1037  	    !master->ops->supports_ccc_cmd(master, cmd))
d10a4c323883c4 Wolfram Sang     2025-06-28  1038  		return -EOPNOTSUPP;
3a379bbcea0af6 Boris Brezillon  2017-07-19  1039  
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1040  	max_attempts = cmd->retries + 1;
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1041  	ret = -EIO;
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1042  	for (attempt = 0; attempt < max_attempts; attempt++) {
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1043  		unsigned int i;
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1044  
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1045  		if (cmd->rnw)
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1046  			for (i = 0; i < cmd->ndests; i++)
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08 @1047  				cmd->dests[i].payload.actual_len = 0;
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1048  
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1049  		cmd->err = I3C_ERROR_UNKNOWN;
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1050  		ret = master->ops->send_ccc_cmd(master, cmd);
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1051  		if (!ret && cmd->err == I3C_ERROR_UNKNOWN)
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1052  			break;
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1053  	}
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1054  
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1055  	if (!ret)
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1056  		ret = i3c_ccc_validate_payload_len(cmd);
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1057  
02cc832191dd89 Adrian Ng Ho Yin 2026-07-08  1058  	return ret;
3a379bbcea0af6 Boris Brezillon  2017-07-19  1059  }
3a379bbcea0af6 Boris Brezillon  2017-07-19  1060  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
