Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC1BBA33
	for <oe-kbuild@lists.linux.dev>; Sun, 20 Oct 2024 21:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729461533; cv=none; b=WsWGf+oWeRGWuPeATzxUx53wzYiKDRiuAHbO4RbgfsJ0c25+s4uNh/t+aZuqxSezNAtHViJql7kiWPgvBvQZfvPB9E5k3WFh7ijs1EzVCtkVvuAo5DvV+tBhcOp1B5jjHZMkikxsGdn4RwoJ1KonIS02A+zujN+gPTc/EqukzF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729461533; c=relaxed/simple;
	bh=vJBnUA6VeZvuzNDrfxzNEyhRciY7TM0+4KVbn1+bC7Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jT1iPu2lO4AMx9ifhvvUKhIUbbC5+nR8JBKhUYN0RrY+bm1+5qa1Wqk63lIjXg6BXcFeG9zdDB3R/tdHE6Z4c3ndkeMER3BvWc21cFsgGAeurZodFpx+VjbBzF6O9tzQP8LtvdYy6ls+HIigY+xV07LoAvhf19P/oCOX+iRHguA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PiLVSel+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PiLVSel+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729461531; x=1760997531;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vJBnUA6VeZvuzNDrfxzNEyhRciY7TM0+4KVbn1+bC7Q=;
  b=PiLVSel+FFp5QHwpTlhuNiwvVc/CIUN264OzGdkv8bfi7zZMalxrIAa8
   jd7MFFnwZWoAXF/ZKyYn1h9d7SPCzWECcEWSeYH+VM/L+8jakhJU87cyT
   EAXaMuR50+MCEmwTuV1tlHdSR3UwYE248VqDoWCo+AcLLj9dBSgvclE+C
   IEDlhMxfa1m/l6mOsTd5eLm0QnvxyGrZrgAcKve3xLCHV2orMUySbypoB
   2q6pLZ1ACbIijxjsqvV9g/qokNJ5Dt07vSuAUYfElQWMb+EQN9l8+3kSq
   PToSv04gU8sogV0eTA61kJqKXsJM/vWfnt3QXmgLBVO2DPjQV1cdoMZfI
   Q==;
X-CSE-ConnectionGUID: RtMkmxEuToi/2pMP+hdv+A==
X-CSE-MsgGUID: P6WcS2YxRXS2QvXnqVFevg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28814998"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28814998"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 14:58:50 -0700
X-CSE-ConnectionGUID: Bo3Ips3kQl+6tGIDKQzQ5A==
X-CSE-MsgGUID: YBAiVC68ShKfq5FXh8GIeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="116810025"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 20 Oct 2024 14:58:49 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2dwj-000Qpd-23;
	Sun, 20 Oct 2024 21:58:45 +0000
Date: Mon, 21 Oct 2024 05:58:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c:441
 dw_mipi_dsi_write() error: __builtin_memcpy() '&word' too small (4 vs
 u32max)
Message-ID: <202410210509.X5IPzsV8-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Liu Ying <victor.liu@nxp.com>
CC: Robert Foss <rfoss@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   715ca9dd687f89ddaac8ec8ccb3b5e5a30311a99
commit: ce62f8ea7e3f8a8e788c3b5ea0195f1224575b66 drm/bridge: imx: Add i.MX93 MIPI DSI support
date:   1 year ago
:::::: branch date: 22 hours ago
:::::: commit date: 1 year ago
config: powerpc-randconfig-r072-20241021 (https://download.01.org/0day-ci/archive/20241021/202410210509.X5IPzsV8-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202410210509.X5IPzsV8-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c:441 dw_mipi_dsi_write() error: __builtin_memcpy() '&word' too small (4 vs u32max)

vim +441 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c

46fc51546d44061 Philippe CORNU 2017-07-17  429  
ad95dc86e67ec8c Brian Norris   2018-01-09  430  static int dw_mipi_dsi_write(struct dw_mipi_dsi *dsi,
ad95dc86e67ec8c Brian Norris   2018-01-09  431  			     const struct mipi_dsi_packet *packet)
46fc51546d44061 Philippe CORNU 2017-07-17  432  {
ad95dc86e67ec8c Brian Norris   2018-01-09  433  	const u8 *tx_buf = packet->payload;
ad95dc86e67ec8c Brian Norris   2018-01-09  434  	int len = packet->payload_length, pld_data_bytes = sizeof(u32), ret;
fd2cb71bbc383ed Brian Norris   2018-01-09  435  	__le32 word;
46fc51546d44061 Philippe CORNU 2017-07-17  436  	u32 val;
46fc51546d44061 Philippe CORNU 2017-07-17  437  
ad95dc86e67ec8c Brian Norris   2018-01-09  438  	while (len) {
46fc51546d44061 Philippe CORNU 2017-07-17  439  		if (len < pld_data_bytes) {
fd2cb71bbc383ed Brian Norris   2018-01-09  440  			word = 0;
fd2cb71bbc383ed Brian Norris   2018-01-09 @441  			memcpy(&word, tx_buf, len);
fd2cb71bbc383ed Brian Norris   2018-01-09  442  			dsi_write(dsi, DSI_GEN_PLD_DATA, le32_to_cpu(word));
46fc51546d44061 Philippe CORNU 2017-07-17  443  			len = 0;
46fc51546d44061 Philippe CORNU 2017-07-17  444  		} else {
fd2cb71bbc383ed Brian Norris   2018-01-09  445  			memcpy(&word, tx_buf, pld_data_bytes);
fd2cb71bbc383ed Brian Norris   2018-01-09  446  			dsi_write(dsi, DSI_GEN_PLD_DATA, le32_to_cpu(word));
46fc51546d44061 Philippe CORNU 2017-07-17  447  			tx_buf += pld_data_bytes;
46fc51546d44061 Philippe CORNU 2017-07-17  448  			len -= pld_data_bytes;
46fc51546d44061 Philippe CORNU 2017-07-17  449  		}
46fc51546d44061 Philippe CORNU 2017-07-17  450  
46fc51546d44061 Philippe CORNU 2017-07-17  451  		ret = readl_poll_timeout(dsi->base + DSI_CMD_PKT_STATUS,
46fc51546d44061 Philippe CORNU 2017-07-17  452  					 val, !(val & GEN_PLD_W_FULL), 1000,
46fc51546d44061 Philippe CORNU 2017-07-17  453  					 CMD_PKT_STATUS_TIMEOUT_US);
669b710e5e30328 Philippe CORNU 2018-02-04  454  		if (ret) {
46fc51546d44061 Philippe CORNU 2017-07-17  455  			dev_err(dsi->dev,
46fc51546d44061 Philippe CORNU 2017-07-17  456  				"failed to get available write payload FIFO\n");
46fc51546d44061 Philippe CORNU 2017-07-17  457  			return ret;
46fc51546d44061 Philippe CORNU 2017-07-17  458  		}
46fc51546d44061 Philippe CORNU 2017-07-17  459  	}
46fc51546d44061 Philippe CORNU 2017-07-17  460  
fd2cb71bbc383ed Brian Norris   2018-01-09  461  	word = 0;
fd2cb71bbc383ed Brian Norris   2018-01-09  462  	memcpy(&word, packet->header, sizeof(packet->header));
fd2cb71bbc383ed Brian Norris   2018-01-09  463  	return dw_mipi_dsi_gen_pkt_hdr_write(dsi, le32_to_cpu(word));
46fc51546d44061 Philippe CORNU 2017-07-17  464  }
46fc51546d44061 Philippe CORNU 2017-07-17  465  

:::::: The code at line 441 was first introduced by commit
:::::: fd2cb71bbc383edbfe73ce3770569c7259cfb939 drm/bridge/synopsys: dsi: handle endianness correctly in dw_mipi_dsi_write()

:::::: TO: Brian Norris <briannorris@chromium.org>
:::::: CC: Archit Taneja <architt@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
