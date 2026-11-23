Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.21
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795398447;
	b=sVyUQGOamzOeJqR8AP7ss4eApzUruymEgupXeU9JxfnY/av9WtzXaTo0xvBeot5PT8i3
	 SGCUgdqWufOgl/AZBD3mmTvQvchFWrMzouoFhiPlva0RcdBcMXm4rb45d5glHSMToYW12
	 hkeJRhSVhrjfd5L/qLEH2wFGpGc3iYJLibM86EPS9NFXADCNdHHL+zfFb7geYS7g6OYiw
	 fVQsPk6GTSOes/4U1FGFWUC07KuhbunWv8oX7TBjA+gbuRGpCkZRO2NnVyLfr/CGNj0tQ
	 9h6AKXqwryr3CC9BdXw6M/MAJ6pL0chl5WjZo3LRi3r7w3ypMo/SGRlI82Jut8JNXkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795398447;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=WreJ1wk5PM7rG2mj/2/kzMmWPJIGu34GCPkMZSXBvk8=;
	b=VawoDFyQK9eNJ514qWMS+6tEubV9jBPne6y0fHv8ekj4w7hBnB42jjYvRfgt6fVrAaPl
	 SSXN7ynz/THRTmtkCh2GCILAR0yL4fMAWf78ItNLR+fhKFjNjpxiDoBDh+Lp593DgBrmS
	 8Geq+U9FC73kPAwkSGUzkp5o6d9laQoTrQnIyf51sCQfxEuHqTK18CqAXAkX5r8tPgcmo
	 nudG+afT0HQWZpvcBGHNH8bBZrNeG+n7OunZ6HTfwUuFA+x930mX6+2ouzfk07jOV3vX+
	 OMiix986hr30igZtaKVPOE0PFotT+6eQKJ2b73htAuk7CMjDmpHqsTj67Q3UsTEpicw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P2f7OhtW;
	arc=none smtp.remote-ip=198.175.65.21
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF4B6606A31A
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Nov 2026 01:47:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DF4B6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P2f7OhtW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795398447; x=1826934447;
  h=date:from:to:cc:subject:message-id;
  bh=z4k8w0oKN7ZzUsjuQZOWkGwyFLaLOi5T+m+dCXwMRBs=;
  b=P2f7OhtWXZvKcndP+mT9Zrxq9SJNOspHiNfB5r3xLjRyHduNWC/McyYC
   1fwVrJDk+3x1QQ10yps+9DmxlYBkE+9A4i65VB7DGDUt7zrId2wdlaGuW
   r4kdCxobjU422vM3rA0akyoyTmmsS59R83vBlFFBPQkPHjwKsnM3i75Vw
   Lkto7POLog0OyoslgIkdz7IxBUmMiSCbeoa86N+q7rYrle8jxcaFMz9tn
   eEVoEnoaVtS+OUeq+r0B3WsNRzYApNvxkzKnHLIDWD4RQDBuH41ernx/y
   kXPs87tjDetuewbLq2FiNAzTV1bKacUpO6So8qY8N8I3vT5ngkDf5Lc75
   Q==;
X-CSE-ConnectionGUID: tG6aAswPToqtlH5vcfEqcA==
X-CSE-MsgGUID: fUA8l5iBSheKChjTSFcp8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4281933"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4281933"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 17:47:26 -0800
X-CSE-ConnectionGUID: PZ6MU2V6Q5OcSdtZqRmC5g==
X-CSE-MsgGUID: utBHs6cVQxOJpVcEsLkAhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="10951927"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 22 Nov 2026 17:47:24 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVJ9N-000000004gw-1j9u;
	Mon, 23 Nov 2026 01:47:21 +0000
Date: Mon, 23 Nov 2026 02:46:28 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: fs/overlayfs/util.o: warning: objtool:
 ovl_path_open_realfile+0x68: unreachable instruction
Message-ID: <20261123024127.NM3ZaKhj-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b6a9fa34ce4187cb69d3c588a4bbffc31ce5db8f
commit: 323899b4ed233d5b6e2fc160c16fbf39cf0317da ovl: inherit FMODE_NONOTIFY when opening directory realfiles
date:   3 weeks ago
:::::: branch date: 3 hours ago
:::::: commit date: 3 weeks ago
config: loongarch-randconfig-r2301-20261121 (https://download.01.org/0day-ci/archive/20261123/20261123024127.NM3ZaKhj-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261123/20261123024127.NM3ZaKhj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 323899b4ed23 ("ovl: inherit FMODE_NONOTIFY when opening directory realfiles")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/20261123024127.NM3ZaKhj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Assembler messages:
   {standard input}:1022: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:1880: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2179: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2184: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2185: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2418: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2420: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2421: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2514: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2516: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2517: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2582: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:2689: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:3147: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:3364: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:3367: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
   {standard input}:3368: Warning: Right shift of negative numbers may be changed from arithmetic right shift to logical right shift!
>> fs/overlayfs/util.o: warning: objtool: ovl_path_open_realfile+0x68: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
