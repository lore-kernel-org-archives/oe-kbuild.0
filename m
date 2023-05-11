Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADDF8174FD
	for <oe-kbuild@lists.linux.dev>; Thu, 11 May 2023 11:09:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683803345; x=1715339345;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=FfserpPGBrTzLOwQL34dPVXgpPm3ZYw2dIoEi8fYHKw=;
  b=P/31NwTds8QtIa25G+YZQ6MJ0pf8SsHZAweFTJ8AqelWPt+0BYqhIcxp
   MvGKuCHCIZxvxgIfgTu5/gMOs57ijRof8ECfkbYLvFNo2RCO5MezxMMzz
   jPgyEWieZtgdYut9c5gc4g9WHQzIprCMpWU0oyQkNdwNXZ2yMgdJ5mfVP
   Hq4FkWdCOi0aWRqMALwciXpFSzfzbpf4vKGBnlAyJVTrVLa9o6EIvg+QS
   TBh4iY3q8q8Xsc1BrlD8s7mmjOUMwXsnEuEjG4lyyTKNbSvgHouvodZdh
   4UNOllS9UNpKyw63FbDCtnw3DDXUAq5w5jnud/KmUrWuZjTXGvuv/qGN0
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="330090056"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="330090056"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 04:09:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="699674570"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; 
   d="scan'208";a="699674570"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 11 May 2023 04:09:03 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1px4AQ-0003ym-2k;
	Thu, 11 May 2023 11:09:02 +0000
Date: Thu, 11 May 2023 19:08:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: {standard input}:510: Error: unrecognized opcode: `eieio'
Message-ID: <202305111908.FJR3xMzP-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check first_new_problem: {standard input}:510: Error: unrecognized opcode: `eieio'"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Pali Rohár" <pali@kernel.org>
CC: Michael Ellerman <mpe@ellerman.id.au>
CC: Christophe Leroy <christophe.leroy@csgroup.eu>

Hi Pali,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   80e62bc8487b049696e67ad133c503bf7f6806f7
commit: ff7c76f66d8bad4e694c264c789249e1d3a8205d powerpc/boot: Don't always pass -mcpu=powerpc when building 32-bit uImage
date:   3 months ago
:::::: branch date: 10 hours ago
:::::: commit date: 3 months ago
config: powerpc-randconfig-s042-20230509 (https://download.01.org/0day-ci/archive/20230511/202305111908.FJR3xMzP-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ff7c76f66d8bad4e694c264c789249e1d3a8205d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ff7c76f66d8bad4e694c264c789249e1d3a8205d
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305111908.FJR3xMzP-lkp@intel.com/

All errors (new ones prefixed by >>):

   {standard input}: Assembler messages:
>> {standard input}:510: Error: unrecognized opcode: `eieio'
   {standard input}:610: Error: unrecognized opcode: `eieio'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
