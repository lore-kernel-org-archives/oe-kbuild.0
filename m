Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBBAA219E8
	for <oe-kbuild@lists.linux.dev>; Sat, 22 Nov 2025 13:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763817457; cv=none; b=YwlShDUdkNPvOwdEdHFTMyv4zCopcU2mwxUdRvLHIAiZMHVbU8YRrvznFk/W/uck0eMrUFAs3oUUIRpCynDCzGk1zt77fNrziy6lvqRRKuxZOTELSc0QsCZEKEwYVDf762VEnbZIryv12P1FcOEW3HQlmeapWi8XxzaXExvA3Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763817457; c=relaxed/simple;
	bh=uXaRwVzFlZj5ijAahZ0Yiqd9yt56MTVzjSiXPlUg4RY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OE2JwnfGV3QFfGD611xZGRT3i3/xZNrGiKyxtkjgiLKXjRKxp5xf9fkX+x6nBzcM3nlojmvsnGr1PqZ+SVheoy5d8aQjcQnLxJD9Jl/r2OgG4mAet1zIOXX4OxgnTy4Bhqoc8m6EkYg1KI1bzspUdjimXCCKBvJ3A1KOnukYPok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ijixslec; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ijixslec"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763817455; x=1795353455;
  h=date:from:to:subject:message-id:mime-version;
  bh=uXaRwVzFlZj5ijAahZ0Yiqd9yt56MTVzjSiXPlUg4RY=;
  b=ijixslecdVaPTcuTKnid0Y4g4QAYfzKuRLFen0gQYlVe9Z1AkU/r3MBg
   6JJbE1T3p+9vwdARkyvfzzf9psjsNOkts9CEKvvmxaAkreuT54C+J+Xjw
   7DbkJbfXbQYsH8weD0OsgfHBiFT0flbnNwk1vDciYOI+nMgZeotd+2fun
   rMo+PdDbqsqfNE7ZE7Av6v1kbqNLlvhw+EO3XbMmTR57B2bKIWTm6MuOo
   du5s5kOobjcMsLfO8Jio9RnTQTwbdASEPnfI6xFr/6nYLMYb+jgl9eii/
   K3tsUVThWUbEi/1fzbf28/SRXyDo5ddeU1+LJ2Nf11U7M0OjYFgkoNL76
   A==;
X-CSE-ConnectionGUID: ASYay3nNSCKLhofgPfuLeg==
X-CSE-MsgGUID: LxbJjcodTSGNmR/WvxSk2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11621"; a="69756173"
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="69756173"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2025 05:17:35 -0800
X-CSE-ConnectionGUID: B1Y3dxxDRGeKbh6JjuafYA==
X-CSE-MsgGUID: a/UC3+HUSeuqG2dj1aQcWA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,218,1758610800"; 
   d="scan'208";a="196086326"
Received: from igk-lkp-server01.igk.intel.com (HELO 9c39a92d400b) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 22 Nov 2025 05:17:34 -0800
Received: from kbuild by 9c39a92d400b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vMnUa-0000000029Z-1ack
	for oe-kbuild@lists.linux.dev;
	Sat, 22 Nov 2025 13:17:32 +0000
Date: Sat, 22 Nov 2025 14:17:13 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-jumbo 49/124] checkpatch:
 ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
Message-ID: <202511221402.ChSBKwNm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: Manual check reason: "checkpatch report for netdev code"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Frank Wunderlich <frank-w@public-files.de>

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-jumbo
head:   75dad9228908d3efbf1d989ac0a93cc0a7ef84de
commit: b72f729c7368bcc70da4f70e6fa92de24ee4fbac [49/124] WIP: net: dsa: add driver for MaxLinear 2.5G switches
:::::: branch date: 6 days ago
:::::: commit date: 11 days ago
reproduce: (https://download.01.org/0day-ci/archive/20251122/202511221402.ChSBKwNm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511221402.ChSBKwNm-lkp@intel.com/

# many are suggestions rather than must-fix

WARNING:REPEATED_WORD: Possible repeated word: 'port'
#273: FILE: drivers/net/dsa/mxl862xx/mxl862xx-api.h:189:
+ * @dest_logical_port_id: logical destination port port when bridging_bypass is set

ERROR:OPEN_BRACE: open brace '{' following struct go on the same line
#288: FILE: drivers/net/dsa/mxl862xx/mxl862xx-api.h:204:
+struct mxl862xx_ctp_port_config
+{

WARNING:BLOCK_COMMENT_STYLE: Block comments should align the * on each line
#400: FILE: drivers/net/dsa/mxl862xx/mxl862xx-api.h:316:
+ *	1 - enabled
+*/

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#2236: FILE: drivers/net/dsa/mxl862xx/mxl862xx.c:240:
+			return ret;;

WARNING:SPACING: space prohibited before semicolon
#2724: FILE: drivers/net/dsa/mxl862xx/mxl862xx.c:728:
+	priv->port_info[port].vlan.egress_vlan_block_info.final_filters_idx = vlan_cfg.entry_index ;

WARNING:ONE_SEMICOLON: Statements terminations use 1 semicolon
#5410: FILE: drivers/net/dsa/mxl862xx/mxl862xx.c:3414:
+			return ret;;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
