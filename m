Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D4CA23C4F4
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 04:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769661175; cv=none; b=nyYw1/sxGR1cEDUXudTjooW4K1lRYKxIWiXVtNC/sBoZ+dRF9RA+DoLsY+QPEkG9Op9M+bayQvdJxgXhSl/faj9Acljj8FUw5pN620Ej48zVfasHXmAhulKLcdRBR3LNeMdpnc8Sd/JPm5gyBKSgMIySej64vx7Rn0Np8W9Sx/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769661175; c=relaxed/simple;
	bh=Ddb8K/ooAWaRPiSA1x3HYDzI6nPuFilMhYQ4dazjl+A=;
	h=Date:From:To:Subject:Message-ID; b=Uw87FOIkzi+1f6QnQgy5N/ghdxkWQt7RSomSsMCanZjk0/E19H5RWWHgBG+XHi9QJQkFpRLQXmcb5DSKWHRqfTEG9pSAsAnYuhoeQYUMwh79I/GRe8g6ZDnwCxjsGoEAKpRDhIatoX2gAi5DlyFP+8jnDavHabIhaXHLMEyeoiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KV3v0hKr; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KV3v0hKr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769661173; x=1801197173;
  h=date:from:to:subject:message-id;
  bh=Ddb8K/ooAWaRPiSA1x3HYDzI6nPuFilMhYQ4dazjl+A=;
  b=KV3v0hKr0NiOh90LxW2IjFgQFn1B4wH32IPFrjKACtBRwh3Dz84Hn7Hd
   fPhokw2myXlxQYTzLEH5liMW7J9eSX44NLK/KtSdj7SDWURdU9rB/OD9H
   5J4KctFz2tIzqevLVwePSvkYBwUF5vZf8gBUYYfs3pu/vxl2ndN4iAKB8
   0MNXoayDGfW1Uf1antxHT7CW9SUc60F/2Y/4oV75p2rfc5nBNeStMMJ98
   zk/qfhGjkfmrHnxKObxrA298RbSpubyQgJ80ptT+Cv5RLLUzNHQTyjtRT
   URql2b7c6ecWU84O1joRB17lxNyRVesqKHp6sTXYTx7/Qsmh5KQWM520w
   A==;
X-CSE-ConnectionGUID: P/X2DsItQ32/6ssoWNIZSg==
X-CSE-MsgGUID: 47T49ZJOSZqspuaQ68Z4kA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70795652"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="70795652"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 20:32:53 -0800
X-CSE-ConnectionGUID: gh6A69HxRcCmyegSPo+lKw==
X-CSE-MsgGUID: 54o4ZkYGSKuz0wtS0KSb4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="207700010"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 28 Jan 2026 20:32:53 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlJi5-000000002B9-4B8T
	for oe-kbuild@lists.linux.dev;
	Thu, 29 Jan 2026 04:32:49 +0000
Date: Thu, 29 Jan 2026 05:32:20 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: [bcain:bcain/boot_qemu 9/39] checkpatch:
 WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
Message-ID: <202601290500.5WKba1Ha-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Brian Cain <brian.cain@oss.qualcomm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/bcain/linux.git bcain/boot_qemu
head:   64417972b86f5eb0d4a466436b1fb43da5692dd6
commit: d0ca0a1efebd3204a0a0c8b7df0db18e9bfd0a1e [9/39] hexagon: update boot and setup code
:::::: branch date: 26 hours ago
:::::: commit date: 2 days ago
reproduce: (https://download.01.org/0day-ci/archive/20260129/202601290500.5WKba1Ha-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#402: FILE: arch/hexagon/kernel/setup.c:202:
+		seq_printf(m, "\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#407: FILE: arch/hexagon/kernel/setup.c:207:
+	seq_printf(m, "model name\t\t: Hexagon Virtual Machine\n");

WARNING:PREFER_SEQ_PUTS: Prefer seq_puts to seq_printf
#409: FILE: arch/hexagon/kernel/setup.c:209:
+	seq_printf(m, "subsystem\t\t: MSS\n");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
