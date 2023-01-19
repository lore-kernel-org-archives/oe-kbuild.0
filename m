Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB28179
	for <oe-kbuild@lists.linux.dev>; Thu, 19 Jan 2023 06:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674111581; x=1705647581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=G4f4LN1ITdAyn3vtA+dsmEGeJp8EpT1FT1JT24n5AvU=;
  b=WTaGuLF/yBemwTdVK6D59WSt+assPjISLchPsbooStlElW3wiA1RllKu
   VNliIbqqh4CKMDpFbSvQzvkhllIA/J59flH0BExNo5qEejGpNN3zxeHJL
   M7+iMtynz3FNQs8WO0mPFfq/L1/cGtdnyN53eeorEnhh6FBi3urGHf7Sd
   IKOhv4FMNqSgtBv/E7npiv1+iMglWpGC8Km/1YFJPN56O313mKnfSOnZO
   G40LWtEbj4vvbDhqGT2X09g3zOHvotSSxagNt3uZHws3+vWgUixogF4+K
   EsGWq/85WD8Vhc+piIq7OJ4QTkhMOuPz0dPd5gmuby9oDkFNoU490oTRD
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="305588086"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="305588086"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jan 2023 22:59:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10594"; a="609966776"
X-IronPort-AV: E=Sophos;i="5.97,228,1669104000"; 
   d="scan'208";a="609966776"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 18 Jan 2023 22:59:38 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pIOtd-0001Dw-2y;
	Thu, 19 Jan 2023 06:59:37 +0000
Date: Thu, 19 Jan 2023 14:58:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/staging/rtl8712/rtl871x_mlme.c:457:27: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202301191438.tGZrxKwM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "drivers/staging/rtl8712/rtl871x_mlme.c: fbc_errors <102> is not larger than parent_errors <102>"
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Justin Stitt <jstitt007@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7287904c8771b77b9504f53623bb477065c19a58
commit: d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7 include/uapi/linux/swab.h: move explicit cast outside ternary
date:   7 months ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 months ago
config: openrisc-randconfig-s043-20230119 (https://download.01.org/0day-ci/archive/20230119/202301191438.tGZrxKwM-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=openrisc SHELL=/bin/bash drivers/net/wireless/realtek/rtl8xxxu/ drivers/staging/rtl8712/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
   drivers/staging/rtl8712/rtl871x_mlme.c:455:28: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:455:28: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:455:28: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:455:28: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:455:28: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:455:28: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:456:37: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:456:37: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:456:37: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:456:37: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:456:37: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:456:37: sparse: sparse: cast to restricted __le32
>> drivers/staging/rtl8712/rtl871x_mlme.c:457:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] Privacy @@     got unsigned int [usertype] @@
   drivers/staging/rtl8712/rtl871x_mlme.c:457:27: sparse:     expected restricted __le32 [usertype] Privacy
   drivers/staging/rtl8712/rtl871x_mlme.c:457:27: sparse:     got unsigned int [usertype]
   drivers/staging/rtl8712/rtl871x_mlme.c:458:26: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:458:26: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:458:26: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:458:26: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:458:26: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:458:26: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:459:38: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:459:38: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:459:38: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:459:38: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:459:38: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:459:38: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:461:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:461:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:461:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:461:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:461:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:461:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:463:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:463:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:463:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:463:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:463:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:463:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:465:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:465:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:465:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:465:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:465:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:465:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:467:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:467:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:467:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:467:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:467:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:467:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:469:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:469:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:469:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:469:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:469:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:469:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:471:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:471:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:471:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:471:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:471:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:471:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:473:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:473:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:473:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:473:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:473:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:473:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:475:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:475:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:475:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:475:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:475:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:475:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:477:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:477:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:477:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:477:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:477:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:477:18: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:478:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:478:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:478:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:478:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:478:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:478:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:673:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:673:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:673:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:673:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:673:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:673:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:674:34: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:674:34: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:674:34: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:674:34: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:674:34: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:674:34: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:675:36: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:675:36: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_mlme.c:675:36: sparse: sparse: too many warnings
--
   drivers/staging/rtl8712/rtl871x_cmd.c:438:29: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] Length @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:438:29: sparse:     expected unsigned int [usertype] Length
   drivers/staging/rtl8712/rtl871x_cmd.c:438:29: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:439:38: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] SsidLength @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:439:38: sparse:     expected unsigned int [usertype] SsidLength
   drivers/staging/rtl8712/rtl871x_cmd.c:439:38: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned int [usertype] val @@     got restricted __le32 [usertype] Privacy @@
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse:     expected unsigned int [usertype] val
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse:     got restricted __le32 [usertype] Privacy
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse: sparse: cast from restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse: sparse: cast from restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse: sparse: cast from restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:441:32: sparse: sparse: cast from restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:442:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected signed int [usertype] Rssi @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:442:27: sparse:     expected signed int [usertype] Rssi
   drivers/staging/rtl8712/rtl871x_cmd.c:442:27: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:443:39: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int enum NDIS_802_11_NETWORK_TYPE NetworkTypeInUse @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:443:39: sparse:     expected unsigned int enum NDIS_802_11_NETWORK_TYPE NetworkTypeInUse
   drivers/staging/rtl8712/rtl871x_cmd.c:443:39: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:445:47: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] ATIMWindow @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:445:47: sparse:     expected unsigned int [usertype] ATIMWindow
   drivers/staging/rtl8712/rtl871x_cmd.c:445:47: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:447:49: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] BeaconPeriod @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:447:49: sparse:     expected unsigned int [usertype] BeaconPeriod
   drivers/staging/rtl8712/rtl871x_cmd.c:447:49: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:449:45: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] DSConfig @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:449:45: sparse:     expected unsigned int [usertype] DSConfig
   drivers/staging/rtl8712/rtl871x_cmd.c:449:45: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:451:55: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] DwellTime @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:451:55: sparse:     expected unsigned int [usertype] DwellTime
   drivers/staging/rtl8712/rtl871x_cmd.c:451:55: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:453:56: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] HopPattern @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:453:56: sparse:     expected unsigned int [usertype] HopPattern
   drivers/staging/rtl8712/rtl871x_cmd.c:453:56: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:455:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] HopSet @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:455:52: sparse:     expected unsigned int [usertype] HopSet
   drivers/staging/rtl8712/rtl871x_cmd.c:455:52: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:457:52: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] Length @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:457:52: sparse:     expected unsigned int [usertype] Length
   drivers/staging/rtl8712/rtl871x_cmd.c:457:52: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:459:43: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] Length @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:459:43: sparse:     expected unsigned int [usertype] Length
   drivers/staging/rtl8712/rtl871x_cmd.c:459:43: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:461:41: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int enum NDIS_802_11_NETWORK_INFRASTRUCTURE InfrastructureMode @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:461:41: sparse:     expected unsigned int enum NDIS_802_11_NETWORK_INFRASTRUCTURE InfrastructureMode
   drivers/staging/rtl8712/rtl871x_cmd.c:461:41: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:463:31: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [usertype] IELength @@     got restricted __le32 [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:463:31: sparse:     expected unsigned int [usertype] IELength
   drivers/staging/rtl8712/rtl871x_cmd.c:463:31: sparse:     got restricted __le32 [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:668:28: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:668:28: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:668:28: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:668:28: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:668:28: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:668:28: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:669:37: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:669:37: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:669:37: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:669:37: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:669:37: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:669:37: sparse: sparse: cast to restricted __le32
>> drivers/staging/rtl8712/rtl871x_cmd.c:670:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected restricted __le32 [usertype] Privacy @@     got unsigned int [usertype] @@
   drivers/staging/rtl8712/rtl871x_cmd.c:670:27: sparse:     expected restricted __le32 [usertype] Privacy
   drivers/staging/rtl8712/rtl871x_cmd.c:670:27: sparse:     got unsigned int [usertype]
   drivers/staging/rtl8712/rtl871x_cmd.c:671:26: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:671:26: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:671:26: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:671:26: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:671:26: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:671:26: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:672:38: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:672:38: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:672:38: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:672:38: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:672:38: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:672:38: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:674:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:674:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:674:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:674:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:674:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:674:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:676:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:676:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:676:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:676:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:676:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:676:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:678:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:678:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:678:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:678:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:678:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:678:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:680:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:680:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:680:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:680:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:680:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:680:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:682:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:682:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:682:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:682:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:682:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:682:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:684:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:684:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:684:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:684:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:684:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:684:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:686:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:686:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:686:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:686:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:686:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:686:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:688:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:688:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:688:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:688:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:688:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:688:17: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:689:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:689:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:689:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:689:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:689:30: sparse: sparse: cast to restricted __le32
   drivers/staging/rtl8712/rtl871x_cmd.c:689:30: sparse: sparse: cast to restricted __le32

vim +457 drivers/staging/rtl8712/rtl871x_mlme.c

2865d42c78a912 Larry Finger        2010-08-20  444  
2865d42c78a912 Larry Finger        2010-08-20  445  void r8712_survey_event_callback(struct _adapter *adapter, u8 *pbuf)
2865d42c78a912 Larry Finger        2010-08-20  446  {
2865d42c78a912 Larry Finger        2010-08-20  447  	unsigned long flags;
2865d42c78a912 Larry Finger        2010-08-20  448  	u32 len;
44367877c6c504 Joshua Clayton      2015-08-05  449  	struct wlan_bssid_ex *pnetwork;
2865d42c78a912 Larry Finger        2010-08-20  450  	struct mlme_priv *pmlmepriv = &adapter->mlmepriv;
2865d42c78a912 Larry Finger        2010-08-20  451  
44367877c6c504 Joshua Clayton      2015-08-05  452  	pnetwork = (struct wlan_bssid_ex *)pbuf;
2865d42c78a912 Larry Finger        2010-08-20  453  #ifdef __BIG_ENDIAN
2865d42c78a912 Larry Finger        2010-08-20  454  	/* endian_convert */
2865d42c78a912 Larry Finger        2010-08-20  455  	pnetwork->Length = le32_to_cpu(pnetwork->Length);
2865d42c78a912 Larry Finger        2010-08-20  456  	pnetwork->Ssid.SsidLength = le32_to_cpu(pnetwork->Ssid.SsidLength);
2865d42c78a912 Larry Finger        2010-08-20 @457  	pnetwork->Privacy = le32_to_cpu(pnetwork->Privacy);
2865d42c78a912 Larry Finger        2010-08-20  458  	pnetwork->Rssi = le32_to_cpu(pnetwork->Rssi);
2865d42c78a912 Larry Finger        2010-08-20  459  	pnetwork->NetworkTypeInUse = le32_to_cpu(pnetwork->NetworkTypeInUse);
2865d42c78a912 Larry Finger        2010-08-20  460  	pnetwork->Configuration.ATIMWindow =
2865d42c78a912 Larry Finger        2010-08-20  461  		 le32_to_cpu(pnetwork->Configuration.ATIMWindow);
2865d42c78a912 Larry Finger        2010-08-20  462  	pnetwork->Configuration.BeaconPeriod =
2865d42c78a912 Larry Finger        2010-08-20  463  		 le32_to_cpu(pnetwork->Configuration.BeaconPeriod);
2865d42c78a912 Larry Finger        2010-08-20  464  	pnetwork->Configuration.DSConfig =
2865d42c78a912 Larry Finger        2010-08-20  465  		 le32_to_cpu(pnetwork->Configuration.DSConfig);
2865d42c78a912 Larry Finger        2010-08-20  466  	pnetwork->Configuration.FHConfig.DwellTime =
2865d42c78a912 Larry Finger        2010-08-20  467  		 le32_to_cpu(pnetwork->Configuration.FHConfig.DwellTime);
2865d42c78a912 Larry Finger        2010-08-20  468  	pnetwork->Configuration.FHConfig.HopPattern =
2865d42c78a912 Larry Finger        2010-08-20  469  		 le32_to_cpu(pnetwork->Configuration.FHConfig.HopPattern);
2865d42c78a912 Larry Finger        2010-08-20  470  	pnetwork->Configuration.FHConfig.HopSet =
2865d42c78a912 Larry Finger        2010-08-20  471  		 le32_to_cpu(pnetwork->Configuration.FHConfig.HopSet);
2865d42c78a912 Larry Finger        2010-08-20  472  	pnetwork->Configuration.FHConfig.Length =
2865d42c78a912 Larry Finger        2010-08-20  473  		 le32_to_cpu(pnetwork->Configuration.FHConfig.Length);
2865d42c78a912 Larry Finger        2010-08-20  474  	pnetwork->Configuration.Length =
2865d42c78a912 Larry Finger        2010-08-20  475  		 le32_to_cpu(pnetwork->Configuration.Length);
2865d42c78a912 Larry Finger        2010-08-20  476  	pnetwork->InfrastructureMode =
2865d42c78a912 Larry Finger        2010-08-20  477  		 le32_to_cpu(pnetwork->InfrastructureMode);
2865d42c78a912 Larry Finger        2010-08-20  478  	pnetwork->IELength = le32_to_cpu(pnetwork->IELength);
2865d42c78a912 Larry Finger        2010-08-20  479  #endif
986fc8e7410d65 Joshua Clayton      2015-08-05  480  	len = r8712_get_wlan_bssid_ex_sz(pnetwork);
2865d42c78a912 Larry Finger        2010-08-20  481  	if (len > sizeof(struct wlan_bssid_ex))
2865d42c78a912 Larry Finger        2010-08-20  482  		return;
2865d42c78a912 Larry Finger        2010-08-20  483  	spin_lock_irqsave(&pmlmepriv->lock2, flags);
2865d42c78a912 Larry Finger        2010-08-20  484  	/* update IBSS_network 's timestamp */
1ca96884b12dd2 Luis de Bethencourt 2015-10-19  485  	if (check_fwstate(pmlmepriv, WIFI_ADHOC_MASTER_STATE)) {
2865d42c78a912 Larry Finger        2010-08-20  486  		if (!memcmp(&(pmlmepriv->cur_network.network.MacAddress),
2865d42c78a912 Larry Finger        2010-08-20  487  		    pnetwork->MacAddress, ETH_ALEN)) {
2865d42c78a912 Larry Finger        2010-08-20  488  			struct wlan_network *ibss_wlan = NULL;
2865d42c78a912 Larry Finger        2010-08-20  489  
2865d42c78a912 Larry Finger        2010-08-20  490  			memcpy(pmlmepriv->cur_network.network.IEs,
2865d42c78a912 Larry Finger        2010-08-20  491  				pnetwork->IEs, 8);
2865d42c78a912 Larry Finger        2010-08-20  492  			ibss_wlan = r8712_find_network(
2865d42c78a912 Larry Finger        2010-08-20  493  						&pmlmepriv->scanned_queue,
2865d42c78a912 Larry Finger        2010-08-20  494  						pnetwork->MacAddress);
7c19c1e80d348a Julia Lawall        2011-10-29  495  			if (ibss_wlan) {
2865d42c78a912 Larry Finger        2010-08-20  496  				memcpy(ibss_wlan->network.IEs,
2865d42c78a912 Larry Finger        2010-08-20  497  					pnetwork->IEs, 8);
2865d42c78a912 Larry Finger        2010-08-20  498  				goto exit;
2865d42c78a912 Larry Finger        2010-08-20  499  			}
2865d42c78a912 Larry Finger        2010-08-20  500  		}
2865d42c78a912 Larry Finger        2010-08-20  501  	}
2865d42c78a912 Larry Finger        2010-08-20  502  	/* lock pmlmepriv->lock when you accessing network_q */
1ca96884b12dd2 Luis de Bethencourt 2015-10-19  503  	if (!check_fwstate(pmlmepriv, _FW_UNDER_LINKING)) {
168a2c10288d78 Luis de Bethencourt 2015-10-19  504  		if (pnetwork->Ssid.Ssid[0] != 0) {
2865d42c78a912 Larry Finger        2010-08-20  505  			rtl8711_add_network(adapter, pnetwork);
168a2c10288d78 Luis de Bethencourt 2015-10-19  506  		} else {
2865d42c78a912 Larry Finger        2010-08-20  507  			pnetwork->Ssid.SsidLength = 8;
2865d42c78a912 Larry Finger        2010-08-20  508  			memcpy(pnetwork->Ssid.Ssid, "<hidden>", 8);
2865d42c78a912 Larry Finger        2010-08-20  509  			rtl8711_add_network(adapter, pnetwork);
2865d42c78a912 Larry Finger        2010-08-20  510  		}
2865d42c78a912 Larry Finger        2010-08-20  511  	}
2865d42c78a912 Larry Finger        2010-08-20  512  exit:
2865d42c78a912 Larry Finger        2010-08-20  513  	spin_unlock_irqrestore(&pmlmepriv->lock2, flags);
2865d42c78a912 Larry Finger        2010-08-20  514  }
2865d42c78a912 Larry Finger        2010-08-20  515  

:::::: The code at line 457 was first introduced by commit
:::::: 2865d42c78a9121caad52cb02d1fbb7f5cdbc4ef staging: r8712u: Add the new driver to the mainline kernel

:::::: TO: Larry Finger <Larry.Finger@lwfinger.net>
:::::: CC: Larry Finger <Larry.Finger@lwfinger.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
