Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5CDA20CCDB
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Feb 2025 20:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738613003; cv=none; b=MJ8cI84ahNdQhHwkfmMjyuZWCyFm6pBPKeD40cjFypXX3SMhAE5+zH2AEZKSu5xmmyh+FTf2wdxHLieLy12liDOoqC/f7Fk5GLwsSFNAk5T0O/ghUqCGSF5ScgBKh0VtobgTRhpTnl9G7k3+FcfiODCjzzFLGIu83DDsulcZG1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738613003; c=relaxed/simple;
	bh=U3OtBYotquFCkXriDV7SyhwJ+CNS2sUN0ot3cI+wjqM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=md2t85SV+R/oiZEyrv1RIW0A3yU6qebrNUKtQHsaMbnw5mX3jQTYZ7oG0iln7lgQcqlcGYnsUlfomJbKsdCzy2azk75uWg5VRpRkW9kbZxmAY15xuNPgQ46wkyXb7oPr3P260DZ6/5WodoW7Ly4WncCmOYAUtFoVonx+c8LeHlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QKhYsqH0; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QKhYsqH0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738612998; x=1770148998;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U3OtBYotquFCkXriDV7SyhwJ+CNS2sUN0ot3cI+wjqM=;
  b=QKhYsqH0NQ/5HNz9Pej0AB5a0ZGBlx5FY+z58Ofc7Ww0HFS8yJmwv3WR
   kniKD5xJaw3fWLR5Q/SJ0tf7AjspLB3kKM/IMlaSdVtt6tyDIoxZdZ7+q
   9HSUqLikaqrLg1dEf8pe0tQ/WRjGlzQPw224uievRIIcznw0DBQJCCOoS
   WalAlyt1x20BwRqgKeFnsTpAH5RmIFeJd8pApgr+m5+TY9sg2XNiRhOOY
   4M+IvUwNIybY6yVA+EDjZ5yv3imYeFZycrS/9zP1n3wqNPZ/+znMK9C0B
   SL7aLQDFrJyrvx4Je6CL0SybgVHoEMXLGbCYU5q4DGI9FTw5ONef33EIC
   Q==;
X-CSE-ConnectionGUID: DzzKAqDmT4uzDKemUAlztg==
X-CSE-MsgGUID: 5+iZpm9OS12oiXvLhmYWQA==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="42774008"
X-IronPort-AV: E=Sophos;i="6.13,256,1732608000"; 
   d="scan'208";a="42774008"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 12:03:16 -0800
X-CSE-ConnectionGUID: 9/JRJICPT+Cj+V1kJUDzrA==
X-CSE-MsgGUID: iJwK9V3KRwi99TAFy/uufQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="133637459"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 03 Feb 2025 12:03:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tf2f2-000rQS-1Z;
	Mon, 03 Feb 2025 20:03:12 +0000
Date: Tue, 4 Feb 2025 04:02:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [litex-hub:litex-rebase 14/15] drivers/clk/clk-litex.c:81
 litex_clk_regs_addr_init() error: buffer overflow 'm.clkout' 7 <= 7
Message-ID: <202502040309.E3ppqhfo-lkp@intel.com>
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
TO: Pawel Czarnecki <pczarnecki@internships.antmicro.com>
CC: Gabriel Somlo <gsomlo@gmail.com>
CC: Mateusz Holenko <mholenko@antmicro.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>

tree:   https://github.com/litex-hub/linux litex-rebase
head:   e6c6fef5f6b404cbbbabf0039fbb30acd3b49517
commit: b6d2dbb4bbd797c6254403bdf67b3b200d08bfa6 [14/15] LiteX: driver for MMCM
:::::: branch date: 28 hours ago
:::::: commit date: 28 hours ago
config: csky-randconfig-r072-20250204 (https://download.01.org/0day-ci/archive/20250204/202502040309.E3ppqhfo-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202502040309.E3ppqhfo-lkp@intel.com/

New smatch warnings:
drivers/clk/clk-litex.c:81 litex_clk_regs_addr_init() error: buffer overflow 'm.clkout' 7 <= 7
drivers/clk/clk-litex.c:539 litex_clk_set_filt() warn: should this be a bitwise op?
drivers/clk/clk-litex.c:539 litex_clk_set_filt() warn: should this be a bitwise op?
drivers/clk/clk-litex.c:558 litex_clk_set_lock() warn: should this be a bitwise op?
drivers/clk/clk-litex.c:558 litex_clk_set_lock() warn: should this be a bitwise op?
drivers/clk/clk-litex.c:942 litex_clk_calc_phase_normal() warn: inconsistent indenting

Old smatch warnings:
drivers/clk/clk-litex.c:83 litex_clk_regs_addr_init() error: buffer overflow 'm.clkout' 7 <= 7
drivers/clk/clk-litex.c:540 litex_clk_set_filt() warn: should this be a bitwise op?
drivers/clk/clk-litex.c:540 litex_clk_set_filt() warn: should this be a bitwise op?
drivers/clk/clk-litex.c:559 litex_clk_set_lock() warn: should this be a bitwise op?
drivers/clk/clk-litex.c:559 litex_clk_set_lock() warn: should this be a bitwise op?

vim +81 drivers/clk/clk-litex.c

b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  65  
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  66  static struct litex_clk_regs_addr litex_clk_regs_addr_init(void)
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  67  {
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  68  	struct litex_clk_regs_addr m;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  69  	u32 i, addr;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  70  
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  71  	addr = CLKOUT0_REG1;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  72  	for (i = 0; i <= CLKOUT_MAX; i++) {
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  73  		if (i == 5) {
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  74  		/*
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  75  		 *special case because CLKOUT5 have its reg addresses
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  76  		 *placed lower than other CLKOUTs
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  77  		 */
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  78  			m.clkout[5].reg1 = CLKOUT5_REG1;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  79  			m.clkout[5].reg2 = CLKOUT5_REG2;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  80  		} else {
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22 @81  			m.clkout[i].reg1 = addr;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  82  			addr++;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  83  			m.clkout[i].reg2 = addr;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  84  			addr++;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  85  		}
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  86  	}
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  87  	return m;
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  88  }
b6d2dbb4bbd797c Pawel Czarnecki 2020-12-22  89  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
