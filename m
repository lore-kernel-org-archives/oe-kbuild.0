Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D0E581E
	for <oe-kbuild@lists.linux.dev>; Sat, 23 Dec 2023 02:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BSvS2fMS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1703299698; x=1734835698;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lOkopxpzm3eYpFVzreDoeQfMAT6JDlVsVza27KHQWm4=;
  b=BSvS2fMS3B6qbpzRY3pQwp/TrMtU7WtsTD6HyiAuF9zCYM4Gi+cY/qWN
   9J6ehSDzddKZNn8d3G6TvyjnW310mMxJgWBNEglZFUVEJB47s6FQ9SoSZ
   8dqO0TAvcxwGrtFpwKEsAWuo74/UAwMPScjJ8xjaurmDUKjmSffy/xRhy
   wM9z/RrFqBJXzpjHthnMxsCI4F/sH1IfXB1LAiCveCkrguh7fW+SRSKll
   2215PZ/8LNT9v92s7Gj+CGA0dLSPgFYGcWGloNDCV68x+KtP86INlKz2o
   mQaHz3io2HHW+UxojJw5+suqDo6MIfLRqhgy9y267jyVJTrk9QWt/sWak
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="400004979"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="400004979"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2023 18:48:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10932"; a="777244381"
X-IronPort-AV: E=Sophos;i="6.04,298,1695711600"; 
   d="scan'208";a="777244381"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 22 Dec 2023 18:48:08 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rGs3M-000ABd-1x;
	Sat, 23 Dec 2023 02:48:06 +0000
Date: Sat, 23 Dec 2023 10:47:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: scripts/kernel-doc: drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:81:
 warning: Excess struct member 'boxes' description in 'vmw_surface_dirty'
Message-ID: <202312231052.57lAGsNB-lkp@intel.com>
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
:::::: Manual check reason: "kernel-doc warning due to __counted_by"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: "Christian König" <christian.koenig@amd.com>
CC: Zack Rusin <zackr@vmware.com>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c0f65a7c112b3cfa691cead54bcf24d6cc2182b5
commit: 45744668746b0bcb36d58a73c2cab603090da9ac drm/vmwgfx: Annotate struct vmw_surface_dirty with __counted_by
date:   3 months ago
:::::: branch date: 5 hours ago
:::::: commit date: 3 months ago
config: x86_64-rhel-8.3-func (https://download.01.org/0day-ci/archive/20231223/202312231052.57lAGsNB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231223/202312231052.57lAGsNB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202312231052.57lAGsNB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   scripts/kernel-doc: drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:55: warning: Excess struct member 'base' description in 'vmw_user_surface'
   scripts/kernel-doc: drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:55: warning: Excess struct member 'base' description in 'vmw_user_surface'
>> scripts/kernel-doc: drivers/gpu/drm/vmwgfx/vmwgfx_surface.c:81: warning: Excess struct member 'boxes' description in 'vmw_surface_dirty'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
