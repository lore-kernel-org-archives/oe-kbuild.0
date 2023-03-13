Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF98A8838
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Mar 2023 19:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678737164; x=1710273164;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=coN6uq+iX6DzmEiSf4ymNSxGzwMN3wilp4qW+rHAWMo=;
  b=lnTYjrvLzAfoXklTnDJP5qZKcKY8DC2bSfsyVYKQZxYbwrhX9tTjM4wL
   vOZbFuTJA8xe5CpiiE7WMRPAdXuoEQOiS6YnZ8qFEWDBflgZ4AHMF1u9l
   HHwsiPtcGcIRRCrgjQhpEhRKIs5a9/Lt6TzMidWRW41hmfbdK7Oam3MNT
   mlJ3oMshu21Gf+Y225oTxSGezV31fztgXGKrT6LFnM5BdcHYtAGr6h6pR
   tsivFEfplnVyeaCAgOk4vcewmltYne/SIQZxeYR0uN/+ekAr1tlL6I8gS
   pkjfYvb4rvwTM3Ryl1Dn9qdhOjFw5bMw9rGz9B/9+XaLCONNs9ghBzSvb
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="423516825"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="423516825"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Mar 2023 12:52:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10648"; a="672033336"
X-IronPort-AV: E=Sophos;i="5.98,257,1673942400"; 
   d="scan'208";a="672033336"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 Mar 2023 12:52:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pboDq-00064W-0N;
	Mon, 13 Mar 2023 19:52:42 +0000
Date: Tue, 14 Mar 2023 03:51:57 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/vmwgfx/vmwgfx.o: warning: objtool:
 vmw_port_hb_in+0x24b: stack state mismatch: cfa1=5+16 cfa2=4+8
Message-ID: <202303140337.6YKPqljo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/gpu/drm/vmwgfx/vmwgfx.o: warning: objtool: vmw_port_hb_in+0x24b: stack state mismatch: cfa1=5+16 cfa2=4+8"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Masahiro Yamada <masahiroy@kernel.org>
CC: Nicolas Schier <nicolas@fjasle.eu>
CC: Sami Tolvanen <samitolvanen@google.com>

Hi Masahiro,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   eeac8ede17557680855031c6f305ece2378af326
commit: c25e1c55822f9b3b53ccbf88b85644317a525752 kbuild: do not create *.prelink.o for Clang LTO or IBT
date:   10 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-s021-20230313 (https://download.01.org/0day-ci/archive/20230314/202303140337.6YKPqljo-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=c25e1c55822f9b3b53ccbf88b85644317a525752
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c25e1c55822f9b3b53ccbf88b85644317a525752
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 olddefconfig
        make W=1 C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202303140337.6YKPqljo-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vmwgfx/vmwgfx.o: warning: objtool: vmw_port_hb_in+0x24b: stack state mismatch: cfa1=5+16 cfa2=4+8
>> drivers/gpu/drm/vmwgfx/vmwgfx.o: warning: objtool: vmw_port_hb_out+0x258: stack state mismatch: cfa1=5+16 cfa2=4+8


objdump-func vmlinux.o vmw_port_hb_in:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
