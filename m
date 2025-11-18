Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E4B33002B5
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Nov 2025 22:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763503886; cv=none; b=aM8eZEoJcOahNb2AecqWEwY9muuHToQl5+e6fBZiOpP9Mr/k1brx2pjh2fd6tFA8SK1NTSHecgYquWZkTdLFRuSLSs+VdwL1+Rp/a/sojRgolMuDTKFVQHV2vYHQzgQ9IVFFw62M7gPjgO/lVNZ8WBShJrsFMSmTtT33JffJI/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763503886; c=relaxed/simple;
	bh=cAvDmAI0QoE/OMzqEgcO++w1Bp71vvm0gf8Or4fnjWs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Rkaxq6RIjUQDBQD6GsxR9jRIAAQ4ysHdxSxBs5tDUZ5BGlI8U0UxmOXbFU+PklG197BAIauL0OVe13Feyx/m/DYbyQLdR5zQYvNfrT6vk9bCow7eY5a9vkKLZvvFPZlF99SOJNsRh47Rnb5Qw5ISO5qyFbuWPJpOkQpRsw5oT9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WowJsVl9; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WowJsVl9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763503884; x=1795039884;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cAvDmAI0QoE/OMzqEgcO++w1Bp71vvm0gf8Or4fnjWs=;
  b=WowJsVl9nHQEskXIb8Bp7YyYiOXXxf/SrB1pN8rVxdW5Nf4vman95ncF
   fAtnwNAaxmiT9uVSjImoVU4Zh7FyuMkVlwO/6vzblLEENrkK1J/1p8a0B
   cvl8D7jh2NTLclQfEdr3VdupwIeNYopi39iGDIa565r2qubgfRBTV9hPk
   NYCea4QtiD5m5k+dhqDMKhZ8y7BeC2Bpo/GTLrEpT4oc1cvtaLD80mFvC
   AhCOj7FgEehWBsFfSsTKkLdDm/6LreX7qzTNq0oRW+pTH32Y34eIOgLXa
   Vrx19zSVrOfjbTD5/KPoaXQoCARBfUJEX9isZ+wOL/D4c3edAQOUCk68n
   Q==;
X-CSE-ConnectionGUID: kqmsvb0XTmOfK22NXd1O2g==
X-CSE-MsgGUID: YaTT5ZzNQ06D0LwGLbtMxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11617"; a="76219359"
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="76219359"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2025 14:11:23 -0800
X-CSE-ConnectionGUID: AjT8bbpURZqt8+OddyxhZw==
X-CSE-MsgGUID: 27TkiY+bQy+8lmybZcIdGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,314,1754982000"; 
   d="scan'208";a="190908860"
Received: from lkp-server01.sh.intel.com (HELO adf6d29aa8d9) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 18 Nov 2025 14:11:23 -0800
Received: from kbuild by adf6d29aa8d9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vLTux-0002ED-1i;
	Tue, 18 Nov 2025 22:11:19 +0000
Date: Wed, 19 Nov 2025 06:10:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: crypto/rsa-pkcs1pad.o: warning: objtool: sg_set_buf+0x5c:
 unreachable instruction
Message-ID: <202511190633.Y65mlBvL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Huacai Chen <chenhuacai@loongson.cn>

Hi Huacai,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8b690556d8fe074b4f9835075050fba3fb180e93
commit: 4103cfe9dcb88010ae4911d3ff417457d1b6a720 LoongArch: Increase ARCH_DMA_MINALIGN up to 16
date:   8 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 8 months ago
config: loongarch-randconfig-r071-20251118 (https://download.01.org/0day-ci/archive/20251119/202511190633.Y65mlBvL-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251119/202511190633.Y65mlBvL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202511190633.Y65mlBvL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> crypto/rsa-pkcs1pad.o: warning: objtool: sg_set_buf+0x5c: unreachable instruction
   crypto/rsa-pkcs1pad.o: warning: objtool: sg_set_buf+0x74: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
