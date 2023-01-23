Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F27C624
	for <oe-kbuild@lists.linux.dev>; Mon, 23 Jan 2023 02:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1674439611; x=1705975611;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=q/BmX/Lp0r211EZTBquuzr0IvryqrmAL1MhHtfOJVyo=;
  b=OAFcr9EMJtKkiIBVtArsv7nKpjzasDQZ3Gth95sxO8grcccI2W/VS89K
   65HC+t5CKNQY6EPWaHbjpPFSAZsNPlqLVxwsX+E+D4oqJa7PECBExxop5
   poQtqmpXB0gcOR/iBk7vvgGMUG93lINKXLNDQ/OA+rJE4XY4ypkykboYY
   /TR5SdhG7Tc4Kg2tfkvKOYxy/+Z1xBNAr65854d1oXxPMXy2oeqldFAE/
   He4OgTNVB+9OR4uxIUqpkt8zIiQ4lJM7GS3WCp5hPjFg1/uu0Bn58jw15
   icBfTROHOoRdauty1CqzmM7IvEY6cnNvBeYG2I87YjZ9s9BVt3g+5QoV+
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="327225350"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="327225350"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jan 2023 18:06:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10598"; a="661481341"
X-IronPort-AV: E=Sophos;i="5.97,238,1669104000"; 
   d="scan'208";a="661481341"
Received: from lkp-server01.sh.intel.com (HELO 5646d64e7320) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 22 Jan 2023 18:06:49 -0800
Received: from kbuild by 5646d64e7320 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pJmET-0005ME-0Y;
	Mon, 23 Jan 2023 02:06:49 +0000
Date: Mon, 23 Jan 2023 10:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/staging/rtl8712/rtl871x_cmd.c:670:27: sparse: sparse:
 incorrect type in assignment (different base types)
Message-ID: <202301231007.Svo7IH9s-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "drivers/staging/rtl8712/rtl871x_cmd.c: fbc_errors <130> is not larger than parent_errors <131>"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Justin Stitt <jstitt007@gmail.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
CC: Nathan Chancellor <nathan@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2475bf0250dee99b477e0c56d7dc9d7ac3f04117
commit: d30dfd490f7dc4cb6a7c11a647bd1ff7a22139e7 include/uapi/linux/swab.h: move explicit cast outside ternary
date:   7 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 7 months ago
config: sparc-randconfig-s051-20230123 (https://download.01.org/0day-ci/archive/20230123/202301231007.Svo7IH9s-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 12.1.0
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
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=sparc SHELL=/bin/bash drivers/staging/rtl8712/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
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
--
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

vim +670 drivers/staging/rtl8712/rtl871x_cmd.c

2865d42c78a912 Larry Finger        2010-08-20  651  
2865d42c78a912 Larry Finger        2010-08-20  652  void r8712_createbss_cmd_callback(struct _adapter *padapter,
2865d42c78a912 Larry Finger        2010-08-20  653  				  struct cmd_obj *pcmd)
2865d42c78a912 Larry Finger        2010-08-20  654  {
2865d42c78a912 Larry Finger        2010-08-20  655  	unsigned long irqL;
2865d42c78a912 Larry Finger        2010-08-20  656  	struct sta_info *psta = NULL;
2865d42c78a912 Larry Finger        2010-08-20  657  	struct wlan_network *pwlan = NULL;
2865d42c78a912 Larry Finger        2010-08-20  658  	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
44367877c6c504 Joshua Clayton      2015-08-05  659  	struct wlan_bssid_ex *pnetwork = (struct wlan_bssid_ex *)pcmd->parmbuf;
2865d42c78a912 Larry Finger        2010-08-20  660  	struct wlan_network *tgt_network = &(pmlmepriv->cur_network);
2865d42c78a912 Larry Finger        2010-08-20  661  
34a2c5fe5b33fd Gulsah Kose         2014-03-12  662  	if (pcmd->res != H2C_SUCCESS)
c703c750cc247c Vaishali Thakkar    2015-02-27  663  		mod_timer(&pmlmepriv->assoc_timer,
c703c750cc247c Vaishali Thakkar    2015-02-27  664  			  jiffies + msecs_to_jiffies(1));
39a6e7376af08b Sudip Mukherjee     2015-05-15  665  	del_timer(&pmlmepriv->assoc_timer);
2865d42c78a912 Larry Finger        2010-08-20  666  #ifdef __BIG_ENDIAN
2865d42c78a912 Larry Finger        2010-08-20  667  	/* endian_convert */
2865d42c78a912 Larry Finger        2010-08-20  668  	pnetwork->Length = le32_to_cpu(pnetwork->Length);
2865d42c78a912 Larry Finger        2010-08-20  669  	pnetwork->Ssid.SsidLength = le32_to_cpu(pnetwork->Ssid.SsidLength);
2865d42c78a912 Larry Finger        2010-08-20 @670  	pnetwork->Privacy = le32_to_cpu(pnetwork->Privacy);
2865d42c78a912 Larry Finger        2010-08-20  671  	pnetwork->Rssi = le32_to_cpu(pnetwork->Rssi);
2865d42c78a912 Larry Finger        2010-08-20  672  	pnetwork->NetworkTypeInUse = le32_to_cpu(pnetwork->NetworkTypeInUse);
b78559b60518eb Martin Homuth       2017-12-19  673  	pnetwork->Configuration.ATIMWindow =
b78559b60518eb Martin Homuth       2017-12-19  674  		le32_to_cpu(pnetwork->Configuration.ATIMWindow);
b78559b60518eb Martin Homuth       2017-12-19  675  	pnetwork->Configuration.DSConfig =
b78559b60518eb Martin Homuth       2017-12-19  676  		le32_to_cpu(pnetwork->Configuration.DSConfig);
b78559b60518eb Martin Homuth       2017-12-19  677  	pnetwork->Configuration.FHConfig.DwellTime =
b78559b60518eb Martin Homuth       2017-12-19  678  		le32_to_cpu(pnetwork->Configuration.FHConfig.DwellTime);
b78559b60518eb Martin Homuth       2017-12-19  679  	pnetwork->Configuration.FHConfig.HopPattern =
b78559b60518eb Martin Homuth       2017-12-19  680  		le32_to_cpu(pnetwork->Configuration.FHConfig.HopPattern);
b78559b60518eb Martin Homuth       2017-12-19  681  	pnetwork->Configuration.FHConfig.HopSet =
b78559b60518eb Martin Homuth       2017-12-19  682  		le32_to_cpu(pnetwork->Configuration.FHConfig.HopSet);
b78559b60518eb Martin Homuth       2017-12-19  683  	pnetwork->Configuration.FHConfig.Length =
b78559b60518eb Martin Homuth       2017-12-19  684  		le32_to_cpu(pnetwork->Configuration.FHConfig.Length);
b78559b60518eb Martin Homuth       2017-12-19  685  	pnetwork->Configuration.Length =
b78559b60518eb Martin Homuth       2017-12-19  686  		le32_to_cpu(pnetwork->Configuration.Length);
b78559b60518eb Martin Homuth       2017-12-19  687  	pnetwork->InfrastructureMode =
b78559b60518eb Martin Homuth       2017-12-19  688  		le32_to_cpu(pnetwork->InfrastructureMode);
2865d42c78a912 Larry Finger        2010-08-20  689  	pnetwork->IELength = le32_to_cpu(pnetwork->IELength);
2865d42c78a912 Larry Finger        2010-08-20  690  #endif
2865d42c78a912 Larry Finger        2010-08-20  691  	spin_lock_irqsave(&pmlmepriv->lock, irqL);
2865d42c78a912 Larry Finger        2010-08-20  692  	if ((pmlmepriv->fw_state) & WIFI_AP_STATE) {
2865d42c78a912 Larry Finger        2010-08-20  693  		psta = r8712_get_stainfo(&padapter->stapriv,
2865d42c78a912 Larry Finger        2010-08-20  694  					 pnetwork->MacAddress);
2865d42c78a912 Larry Finger        2010-08-20  695  		if (!psta) {
2865d42c78a912 Larry Finger        2010-08-20  696  			psta = r8712_alloc_stainfo(&padapter->stapriv,
2865d42c78a912 Larry Finger        2010-08-20  697  						   pnetwork->MacAddress);
11975c56b6d130 Sandhya Bankar      2016-09-20  698  			if (!psta)
2865d42c78a912 Larry Finger        2010-08-20  699  				goto createbss_cmd_fail;
2865d42c78a912 Larry Finger        2010-08-20  700  		}
2865d42c78a912 Larry Finger        2010-08-20  701  		r8712_indicate_connect(padapter);
2865d42c78a912 Larry Finger        2010-08-20  702  	} else {
2865d42c78a912 Larry Finger        2010-08-20  703  		pwlan = _r8712_alloc_network(pmlmepriv);
11975c56b6d130 Sandhya Bankar      2016-09-20  704  		if (!pwlan) {
2865d42c78a912 Larry Finger        2010-08-20  705  			pwlan = r8712_get_oldest_wlan_network(
2865d42c78a912 Larry Finger        2010-08-20  706  				&pmlmepriv->scanned_queue);
11975c56b6d130 Sandhya Bankar      2016-09-20  707  			if (!pwlan)
2865d42c78a912 Larry Finger        2010-08-20  708  				goto createbss_cmd_fail;
2865d42c78a912 Larry Finger        2010-08-20  709  			pwlan->last_scanned = jiffies;
a7e585918ecd5a Liam Ryan           2017-09-12  710  		} else {
fdfbf7890dcac9 James A Shackleford 2014-06-24  711  			list_add_tail(&(pwlan->list),
2865d42c78a912 Larry Finger        2010-08-20  712  					 &pmlmepriv->scanned_queue.queue);
a7e585918ecd5a Liam Ryan           2017-09-12  713  		}
986fc8e7410d65 Joshua Clayton      2015-08-05  714  		pnetwork->Length = r8712_get_wlan_bssid_ex_sz(pnetwork);
2865d42c78a912 Larry Finger        2010-08-20  715  		memcpy(&(pwlan->network), pnetwork, pnetwork->Length);
2865d42c78a912 Larry Finger        2010-08-20  716  		pwlan->fixed = true;
2865d42c78a912 Larry Finger        2010-08-20  717  		memcpy(&tgt_network->network, pnetwork,
986fc8e7410d65 Joshua Clayton      2015-08-05  718  			(r8712_get_wlan_bssid_ex_sz(pnetwork)));
2865d42c78a912 Larry Finger        2010-08-20  719  		if (pmlmepriv->fw_state & _FW_UNDER_LINKING)
2865d42c78a912 Larry Finger        2010-08-20  720  			pmlmepriv->fw_state ^= _FW_UNDER_LINKING;
8292b4de4ee67a Louie Lu            2016-09-02  721  		/*
8292b4de4ee67a Louie Lu            2016-09-02  722  		 * we will set _FW_LINKED when there is one more sat to
8292b4de4ee67a Louie Lu            2016-09-02  723  		 * join us (stassoc_event_callback)
8292b4de4ee67a Louie Lu            2016-09-02  724  		 */
2865d42c78a912 Larry Finger        2010-08-20  725  	}
2865d42c78a912 Larry Finger        2010-08-20  726  createbss_cmd_fail:
2865d42c78a912 Larry Finger        2010-08-20  727  	spin_unlock_irqrestore(&pmlmepriv->lock, irqL);
2865d42c78a912 Larry Finger        2010-08-20  728  	r8712_free_cmd_obj(pcmd);
2865d42c78a912 Larry Finger        2010-08-20  729  }
2865d42c78a912 Larry Finger        2010-08-20  730  

:::::: The code at line 670 was first introduced by commit
:::::: 2865d42c78a9121caad52cb02d1fbb7f5cdbc4ef staging: r8712u: Add the new driver to the mainline kernel

:::::: TO: Larry Finger <Larry.Finger@lwfinger.net>
:::::: CC: Larry Finger <Larry.Finger@lwfinger.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
