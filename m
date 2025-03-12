Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78372033A
	for <oe-kbuild@lists.linux.dev>; Wed, 12 Mar 2025 17:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741799651; cv=none; b=L8ux85kY6Nc8RZ2sNfcSRPqf12v0edRzPozTrXW50ZvQVpfovIp3rSxzSqQJnCqp40djFJyQM1Ur55Ff4TPH4dgQd963WF7r3zJKNtOoqGfptDbqGKLIoo6whM2Lkf3psItR8ZNwETsLyPJeLrG1SURlfC7Pa8uH8DsboPqFHfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741799651; c=relaxed/simple;
	bh=4+ElN4qYdFXiYAtNf5ns0NAbEQ6F2o8I2LFe8u8PubA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nuws9Wu+YQW8TvP6yY7gSlMv/ApuUaMXIxKI0vQr8a122q4cCkqwRYsfD69WLggac7FJIzLGWbgK699zi9Nv+qd07AkQpRk0muMkiukhV1M9auks1iq1qNvr1PzOuudRSDaBn+5fHr3lOac/AdaIPIqC9GCfT96u+0rf7uHsn/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iI/u0HWr; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iI/u0HWr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741799650; x=1773335650;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=4+ElN4qYdFXiYAtNf5ns0NAbEQ6F2o8I2LFe8u8PubA=;
  b=iI/u0HWr+XfKXc4gVE3wPFmz3nbDjEuJUYcWE1sx/gN8+bJyZTU4b1Uv
   /JBTe+/Fruhp8hmbUGYS2+0exREp2F6LNG4G2hPN1CmVpzXNLOceNLoEW
   gqm2d7ADBFwejIi/LAAWgJcR3ws1WPnS69w+LWMppi5A8ZJc6zoxcOCEK
   T4Ghmg5qEx25D1lx+kX5RB3nFlo/QmZYFO8aKRlZV2HQapPD6uwVTglDX
   EHFV+hYjACKFuFkP2YvLXtP9ZytTDqcbJbgfTHpUc96MnNmlkTP+JK/TI
   RhcRi1LN8nBEHNn4cRMsuJlWVmkGqzoEwKWiUhgEi+hZ0mIf8zYQw54fl
   A==;
X-CSE-ConnectionGUID: bJ6aukVsTJeyaIHJuxHvvQ==
X-CSE-MsgGUID: s/Hb+PnBTEuf7Pe0n+DP0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11371"; a="68250948"
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="68250948"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2025 10:14:09 -0700
X-CSE-ConnectionGUID: VizE4qVnQV2GN0PSy4HlBg==
X-CSE-MsgGUID: B01WhNxKR+ex62eZ0x6i5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,242,1736841600"; 
   d="scan'208";a="143895380"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 12 Mar 2025 10:14:08 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tsPeg-0008lN-0C;
	Wed, 12 Mar 2025 17:14:06 +0000
Date: Thu, 13 Mar 2025 01:13:31 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [masahiroy-kbuild:kbuild 15/20] error: Unrecognized option:
 'remap-path-prefix'
Message-ID: <202503130111.NH87la6s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "only suspicious fbc files changed"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kbuild@vger.kernel.org
TO: "Thomas Weiﬂschuh" <linux@weissschuh.net>
CC: Masahiro Yamada <masahiroy@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git kbuild
head:   bc5431693696b3f928b0b7acf8d7a120127db7a4
commit: 6b5747d07138f8109b1a150830f1d138de146ac2 [15/20] kbuild, rust: use -fremap-path-prefix to make paths relative
:::::: branch date: 24 hours ago
:::::: commit date: 30 hours ago
config: x86_64-buildonly-randconfig-004-20250312 (https://download.01.org/0day-ci/archive/20250313/202503130111.NH87la6s-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250313/202503130111.NH87la6s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202503130111.NH87la6s-lkp@intel.com/

All errors (new ones prefixed by >>):

>> error: Unrecognized option: 'remap-path-prefix'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
