Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70B811875
	for <oe-kbuild@lists.linux.dev>; Sat, 13 May 2023 12:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683980592; x=1715516592;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J3y13il/pfbY1hFlWPN9L3UYkPtjB8JuT011Y+cUC9M=;
  b=jrl49QJ4MfKXxYOAwONhz5Dw83dnb4Ir/dRVUc3e9B0y0DvDwC9Vm0Mn
   4wLzhbiKXDaTFo1Y8Uo0Rkklx7I+vIevLHhzlezd/BJpJ/lYdDYlmZ3p2
   f/Wfdqo4Zx+XUuoVVmlKC2UlNzp+ihF4zgR+fcXxAFF+v1UmUb8m7pp8u
   PmvnsicDnllJSIQFwzw/SLrJFNRSt9j0P6R3yUsLVdqdxgk8RxynWMN2K
   PHDT0XMnu7H+p2QNEezWmAEOSb4Pbm+Ja5TW6rdhqX5X6wGrhkKsgzJx0
   6/XB8TeymoarUjQ3cFnJYvvBtfzOpVT8OKYTHAVK4fL0uFF4ebNuy2cpk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="335478701"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="335478701"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2023 05:23:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10708"; a="694525203"
X-IronPort-AV: E=Sophos;i="5.99,272,1677571200"; 
   d="scan'208";a="694525203"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 13 May 2023 05:23:10 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxoHF-0005UK-1r;
	Sat, 13 May 2023 12:23:09 +0000
Date: Sat, 13 May 2023 20:22:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jsarha:topic/chromeos-4.19-s0ix 3632/9999]
 sound/soc/soc-topology.c:790:26: sparse: sparse: incorrect type in
 assignment (different base types)
Message-ID: <202305132033.BI5EScAZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence bisect report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>
CC: "Ap, Kamal" <kamal.ap@intel.corp-partner.google.com>
CC: Ben Zhang <benzh@google.com>

tree:   https://github.com/jsarha/linux topic/chromeos-4.19-s0ix
head:   430bdaa0a8c38697780f45a148964d71951df11f
commit: f05fac60091358fb9805b6a6c6dc38a995361910 [3632/9999] FROMLIST: ASoC: SOF: Add Build support for SOF core and Intel drivers
:::::: branch date: 3 years, 7 months ago
:::::: commit date: 4 years, 1 month ago
config: alpha-randconfig-s032-20230509 (https://download.01.org/0day-ci/archive/20230513/202305132033.BI5EScAZ-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/jsarha/linux/commit/f05fac60091358fb9805b6a6c6dc38a995361910
        git remote add jsarha https://github.com/jsarha/linux
        git fetch --no-tags jsarha topic/chromeos-4.19-s0ix
        git checkout f05fac60091358fb9805b6a6c6dc38a995361910
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=alpha SHELL=/bin/bash sound/soc/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202305132033.BI5EScAZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   sound/soc/soc-topology.c:2556:45: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:200:28: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:201:39: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted __le32 [usertype] reg @@
   sound/soc/soc-topology.c:201:39: sparse:     expected int
   sound/soc/soc-topology.c:201:39: sparse:     got restricted __le32 [usertype] reg
   sound/soc/soc-topology.c:213:28: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:214:39: sparse: sparse: incorrect type in return expression (different base types) @@     expected int @@     got restricted __le32 [usertype] shift @@
   sound/soc/soc-topology.c:214:39: sparse:     expected int
   sound/soc/soc-topology.c:214:39: sparse:     got restricted __le32 [usertype] shift
   sound/soc/soc-topology.c:593:21: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:612:70: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:614:70: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:629:60: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:631:60: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:633:61: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:646:60: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:648:60: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:650:61: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:709:14: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int @@     got restricted __le32 [usertype] min @@
   sound/soc/soc-topology.c:709:14: sparse:     expected unsigned int
   sound/soc/soc-topology.c:709:14: sparse:     got restricted __le32 [usertype] min
   sound/soc/soc-topology.c:710:22: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:722:17: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:725:17: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:727:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:778:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:788:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] access @@     got restricted __le32 [usertype] access @@
   sound/soc/soc-topology.c:788:27: sparse:     expected unsigned int [addressable] [assigned] access
   sound/soc/soc-topology.c:788:27: sparse:     got restricted __le32 [usertype] access
>> sound/soc/soc-topology.c:790:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected int max @@     got restricted __le32 [usertype] max @@
   sound/soc/soc-topology.c:790:26: sparse:     expected int max
   sound/soc/soc-topology.c:790:26: sparse:     got restricted __le32 [usertype] max
   sound/soc/soc-topology.c:858:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:868:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] access @@     got restricted __le32 [usertype] access @@
   sound/soc/soc-topology.c:868:27: sparse:     expected unsigned int [addressable] [assigned] access
   sound/soc/soc-topology.c:868:27: sparse:     got restricted __le32 [usertype] access
   sound/soc/soc-topology.c:880:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected int max @@     got restricted __le32 [usertype] max @@
   sound/soc/soc-topology.c:880:25: sparse:     expected int max
   sound/soc/soc-topology.c:880:25: sparse:     got restricted __le32 [usertype] max
>> sound/soc/soc-topology.c:881:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected int min @@     got restricted __le32 [usertype] min @@
   sound/soc/soc-topology.c:881:25: sparse:     expected int min
   sound/soc/soc-topology.c:881:25: sparse:     got restricted __le32 [usertype] min
>> sound/soc/soc-topology.c:882:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int invert:1 @@     got restricted __le32 [usertype] invert @@
   sound/soc/soc-topology.c:882:28: sparse:     expected unsigned int invert:1
   sound/soc/soc-topology.c:882:28: sparse:     got restricted __le32 [usertype] invert
>> sound/soc/soc-topology.c:883:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected int platform_max @@     got restricted __le32 [usertype] platform_max @@
   sound/soc/soc-topology.c:883:34: sparse:     expected int platform_max
   sound/soc/soc-topology.c:883:34: sparse:     got restricted __le32 [usertype] platform_max
   sound/soc/soc-topology.c:933:27: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected unsigned long [usertype] n @@     got restricted __le32 [usertype] items @@
   sound/soc/soc-topology.c:933:27: sparse:     expected unsigned long [usertype] n
   sound/soc/soc-topology.c:933:27: sparse:     got restricted __le32 [usertype] items
   sound/soc/soc-topology.c:937:27: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:965:15: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:969:46: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:997:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1015:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] access @@     got restricted __le32 [usertype] access @@
   sound/soc/soc-topology.c:1015:27: sparse:     expected unsigned int [addressable] [assigned] access
   sound/soc/soc-topology.c:1015:27: sparse:     got restricted __le32 [usertype] access
>> sound/soc/soc-topology.c:1023:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int items @@     got restricted __le32 [usertype] items @@
   sound/soc/soc-topology.c:1023:27: sparse:     expected unsigned int items
   sound/soc/soc-topology.c:1023:27: sparse:     got restricted __le32 [usertype] items
>> sound/soc/soc-topology.c:1024:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int mask @@     got restricted __le32 [usertype] mask @@
   sound/soc/soc-topology.c:1024:26: sparse:     expected unsigned int mask
   sound/soc/soc-topology.c:1024:26: sparse:     got restricted __le32 [usertype] mask
   sound/soc/soc-topology.c:1030:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1030:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1030:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1030:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1030:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1103:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1103:45: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1110:28: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1114:32: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1127:60: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] size @@     got restricted __le32 [usertype] payload_size @@
   sound/soc/soc-topology.c:1127:60: sparse:     expected unsigned long [usertype] size
   sound/soc/soc-topology.c:1127:60: sparse:     got restricted __le32 [usertype] payload_size
   sound/soc/soc-topology.c:1134:59: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] size @@     got restricted __le32 [usertype] payload_size @@
   sound/soc/soc-topology.c:1134:59: sparse:     expected unsigned long [usertype] size
   sound/soc/soc-topology.c:1134:59: sparse:     got restricted __le32 [usertype] payload_size
   sound/soc/soc-topology.c:1137:60: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long [usertype] size @@     got restricted __le32 [usertype] payload_size @@
   sound/soc/soc-topology.c:1137:60: sparse:     expected unsigned long [usertype] size
   sound/soc/soc-topology.c:1137:60: sparse:     got restricted __le32 [usertype] payload_size
   sound/soc/soc-topology.c:1119:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1119:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1119:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1119:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1119:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1119:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1119:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1119:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1119:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1119:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1119:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1119:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1119:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1165:24: sparse: sparse: incorrect type in initializer (different base types) @@     expected int count @@     got restricted __le32 [usertype] count @@
   sound/soc/soc-topology.c:1165:24: sparse:     expected int count
   sound/soc/soc-topology.c:1165:24: sparse:     got restricted __le32 [usertype] count
   sound/soc/soc-topology.c:1169:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1169:45: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1175:27: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected unsigned long [usertype] bytes @@     got restricted __le32 [usertype] payload_size @@
   sound/soc/soc-topology.c:1175:27: sparse:     expected unsigned long [usertype] bytes
   sound/soc/soc-topology.c:1175:27: sparse:     got restricted __le32 [usertype] payload_size
   sound/soc/soc-topology.c:1285:33: sparse: sparse: restricted __le32 degrades to integer
>> sound/soc/soc-topology.c:1300:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int access @@     got restricted __le32 [usertype] access @@
   sound/soc/soc-topology.c:1300:30: sparse:     expected unsigned int access
   sound/soc/soc-topology.c:1300:30: sparse:     got restricted __le32 [usertype] access
   sound/soc/soc-topology.c:1312:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected int max @@     got restricted __le32 [usertype] max @@
   sound/soc/soc-topology.c:1312:25: sparse:     expected int max
   sound/soc/soc-topology.c:1312:25: sparse:     got restricted __le32 [usertype] max
   sound/soc/soc-topology.c:1313:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected int min @@     got restricted __le32 [usertype] min @@
   sound/soc/soc-topology.c:1313:25: sparse:     expected int min
   sound/soc/soc-topology.c:1313:25: sparse:     got restricted __le32 [usertype] min
   sound/soc/soc-topology.c:1314:28: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int invert:1 @@     got restricted __le32 [usertype] invert @@
   sound/soc/soc-topology.c:1314:28: sparse:     expected unsigned int invert:1
   sound/soc/soc-topology.c:1314:28: sparse:     got restricted __le32 [usertype] invert
   sound/soc/soc-topology.c:1315:34: sparse: sparse: incorrect type in assignment (different base types) @@     expected int platform_max @@     got restricted __le32 [usertype] platform_max @@
   sound/soc/soc-topology.c:1315:34: sparse:     expected int platform_max
   sound/soc/soc-topology.c:1315:34: sparse:     got restricted __le32 [usertype] platform_max
   sound/soc/soc-topology.c:1386:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int access @@     got restricted __le32 [usertype] access @@
   sound/soc/soc-topology.c:1386:30: sparse:     expected unsigned int access
   sound/soc/soc-topology.c:1386:30: sparse:     got restricted __le32 [usertype] access
   sound/soc/soc-topology.c:1395:27: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int items @@     got restricted __le32 [usertype] items @@
   sound/soc/soc-topology.c:1395:27: sparse:     expected unsigned int items
   sound/soc/soc-topology.c:1395:27: sparse:     got restricted __le32 [usertype] items
   sound/soc/soc-topology.c:1396:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int mask @@     got restricted __le32 [usertype] mask @@
   sound/soc/soc-topology.c:1396:26: sparse:     expected unsigned int mask
   sound/soc/soc-topology.c:1396:26: sparse:     got restricted __le32 [usertype] mask
   sound/soc/soc-topology.c:1399:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1399:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1399:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1399:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1399:36: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1442:41: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1455:35: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1493:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1506:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int access @@     got restricted __le32 [usertype] access @@
   sound/soc/soc-topology.c:1506:30: sparse:     expected unsigned int access
   sound/soc/soc-topology.c:1506:30: sparse:     got restricted __le32 [usertype] access
   sound/soc/soc-topology.c:1508:26: sparse: sparse: incorrect type in assignment (different base types) @@     expected int max @@     got restricted __le32 [usertype] max @@
   sound/soc/soc-topology.c:1508:26: sparse:     expected int max
   sound/soc/soc-topology.c:1508:26: sparse:     got restricted __le32 [usertype] max
   sound/soc/soc-topology.c:1565:38: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected int tplg_type @@     got restricted __le32 [usertype] id @@
   sound/soc/soc-topology.c:1565:38: sparse:     expected int tplg_type
   sound/soc/soc-topology.c:1565:38: sparse:     got restricted __le32 [usertype] id
   sound/soc/soc-topology.c:1578:22: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] [assigned] reg @@     got restricted __le32 [usertype] reg @@
   sound/soc/soc-topology.c:1578:22: sparse:     expected int [addressable] [assigned] reg
   sound/soc/soc-topology.c:1578:22: sparse:     got restricted __le32 [usertype] reg
   sound/soc/soc-topology.c:1579:24: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [addressable] [assigned] shift @@     got restricted __le32 [usertype] shift @@
   sound/soc/soc-topology.c:1579:24: sparse:     expected unsigned char [addressable] [assigned] shift
   sound/soc/soc-topology.c:1579:24: sparse:     got restricted __le32 [usertype] shift
   sound/soc/soc-topology.c:1580:23: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned int [addressable] [assigned] mask @@     got restricted __le32 [usertype] mask @@
   sound/soc/soc-topology.c:1580:23: sparse:     expected unsigned int [addressable] [assigned] mask
   sound/soc/soc-topology.c:1580:23: sparse:     got restricted __le32 [usertype] mask
   sound/soc/soc-topology.c:1581:25: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] [assigned] subseq @@     got restricted __le32 [usertype] subseq @@
   sound/soc/soc-topology.c:1581:25: sparse:     expected int [addressable] [assigned] subseq
   sound/soc/soc-topology.c:1581:25: sparse:     got restricted __le32 [usertype] subseq
   sound/soc/soc-topology.c:1584:33: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [addressable] [assigned] ignore_suspend:1 @@     got restricted __le32 [usertype] ignore_suspend @@
   sound/soc/soc-topology.c:1584:33: sparse:     expected unsigned char [addressable] [assigned] ignore_suspend:1
   sound/soc/soc-topology.c:1584:33: sparse:     got restricted __le32 [usertype] ignore_suspend
   sound/soc/soc-topology.c:1585:30: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short [addressable] [assigned] event_flags @@     got restricted __le16 [usertype] event_flags @@
   sound/soc/soc-topology.c:1585:30: sparse:     expected unsigned short [addressable] [assigned] event_flags
   sound/soc/soc-topology.c:1585:30: sparse:     got restricted __le16 [usertype] event_flags
   sound/soc/soc-topology.c:1589:67: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1608:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] [assigned] num_kcontrols @@     got restricted __le32 [usertype] num_kcontrols @@
   sound/soc/soc-topology.c:1608:40: sparse:     expected int [addressable] [assigned] num_kcontrols
   sound/soc/soc-topology.c:1608:40: sparse:     got restricted __le32 [usertype] num_kcontrols
   sound/soc/soc-topology.c:1623:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] [assigned] num_kcontrols @@     got restricted __le32 [usertype] num_kcontrols @@
   sound/soc/soc-topology.c:1623:40: sparse:     expected int [addressable] [assigned] num_kcontrols
   sound/soc/soc-topology.c:1623:40: sparse:     got restricted __le32 [usertype] num_kcontrols
   sound/soc/soc-topology.c:1634:40: sparse: sparse: incorrect type in assignment (different base types) @@     expected int [addressable] [assigned] num_kcontrols @@     got restricted __le32 [usertype] num_kcontrols @@
   sound/soc/soc-topology.c:1634:40: sparse:     expected int [addressable] [assigned] num_kcontrols
   sound/soc/soc-topology.c:1634:40: sparse:     got restricted __le32 [usertype] num_kcontrols
   sound/soc/soc-topology.c:1600:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1600:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1600:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1600:33: sparse: sparse: restricted __le32 degrades to integer
   sound/soc/soc-topology.c:1600:33: sparse: sparse: too many warnings

vim +790 sound/soc/soc-topology.c

8a9782346dccd8 Liam Girdwood 2015-05-29  695  
28a87eebcad401 Mengdong Lin  2015-08-05  696  
28a87eebcad401 Mengdong Lin  2015-08-05  697  static int soc_tplg_create_tlv_db_scale(struct soc_tplg *tplg,
28a87eebcad401 Mengdong Lin  2015-08-05  698  	struct snd_kcontrol_new *kc, struct snd_soc_tplg_tlv_dbscale *scale)
8a9782346dccd8 Liam Girdwood 2015-05-29  699  {
28a87eebcad401 Mengdong Lin  2015-08-05  700  	unsigned int item_len = 2 * sizeof(unsigned int);
28a87eebcad401 Mengdong Lin  2015-08-05  701  	unsigned int *p;
28a87eebcad401 Mengdong Lin  2015-08-05  702  
28a87eebcad401 Mengdong Lin  2015-08-05  703  	p = kzalloc(item_len + 2 * sizeof(unsigned int), GFP_KERNEL);
28a87eebcad401 Mengdong Lin  2015-08-05  704  	if (!p)
28a87eebcad401 Mengdong Lin  2015-08-05  705  		return -ENOMEM;
8a9782346dccd8 Liam Girdwood 2015-05-29  706  
28a87eebcad401 Mengdong Lin  2015-08-05  707  	p[0] = SNDRV_CTL_TLVT_DB_SCALE;
28a87eebcad401 Mengdong Lin  2015-08-05  708  	p[1] = item_len;
28a87eebcad401 Mengdong Lin  2015-08-05 @709  	p[2] = scale->min;
28a87eebcad401 Mengdong Lin  2015-08-05  710  	p[3] = (scale->step & TLV_DB_SCALE_MASK)
28a87eebcad401 Mengdong Lin  2015-08-05  711  			| (scale->mute ? TLV_DB_SCALE_MUTE : 0);
28a87eebcad401 Mengdong Lin  2015-08-05  712  
28a87eebcad401 Mengdong Lin  2015-08-05  713  	kc->tlv.p = (void *)p;
8a9782346dccd8 Liam Girdwood 2015-05-29  714  	return 0;
28a87eebcad401 Mengdong Lin  2015-08-05  715  }
8a9782346dccd8 Liam Girdwood 2015-05-29  716  
28a87eebcad401 Mengdong Lin  2015-08-05  717  static int soc_tplg_create_tlv(struct soc_tplg *tplg,
28a87eebcad401 Mengdong Lin  2015-08-05  718  	struct snd_kcontrol_new *kc, struct snd_soc_tplg_ctl_hdr *tc)
28a87eebcad401 Mengdong Lin  2015-08-05  719  {
28a87eebcad401 Mengdong Lin  2015-08-05  720  	struct snd_soc_tplg_ctl_tlv *tplg_tlv;
28a87eebcad401 Mengdong Lin  2015-08-05  721  
28a87eebcad401 Mengdong Lin  2015-08-05  722  	if (!(tc->access & SNDRV_CTL_ELEM_ACCESS_TLV_READWRITE))
28a87eebcad401 Mengdong Lin  2015-08-05  723  		return 0;
8a9782346dccd8 Liam Girdwood 2015-05-29  724  
1a3232d2f61d28 Mengdong Lin  2015-08-18  725  	if (!(tc->access & SNDRV_CTL_ELEM_ACCESS_TLV_CALLBACK)) {
28a87eebcad401 Mengdong Lin  2015-08-05  726  		tplg_tlv = &tc->tlv;
28a87eebcad401 Mengdong Lin  2015-08-05  727  		switch (tplg_tlv->type) {
28a87eebcad401 Mengdong Lin  2015-08-05  728  		case SNDRV_CTL_TLVT_DB_SCALE:
28a87eebcad401 Mengdong Lin  2015-08-05  729  			return soc_tplg_create_tlv_db_scale(tplg, kc,
28a87eebcad401 Mengdong Lin  2015-08-05  730  					&tplg_tlv->scale);
8a9782346dccd8 Liam Girdwood 2015-05-29  731  
28a87eebcad401 Mengdong Lin  2015-08-05  732  		/* TODO: add support for other TLV types */
28a87eebcad401 Mengdong Lin  2015-08-05  733  		default:
28a87eebcad401 Mengdong Lin  2015-08-05  734  			dev_dbg(tplg->dev, "Unsupported TLV type %d\n",
28a87eebcad401 Mengdong Lin  2015-08-05  735  					tplg_tlv->type);
28a87eebcad401 Mengdong Lin  2015-08-05  736  			return -EINVAL;
28a87eebcad401 Mengdong Lin  2015-08-05  737  		}
28a87eebcad401 Mengdong Lin  2015-08-05  738  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  739  
8a9782346dccd8 Liam Girdwood 2015-05-29  740  	return 0;
8a9782346dccd8 Liam Girdwood 2015-05-29  741  }
8a9782346dccd8 Liam Girdwood 2015-05-29  742  
8a9782346dccd8 Liam Girdwood 2015-05-29  743  static inline void soc_tplg_free_tlv(struct soc_tplg *tplg,
8a9782346dccd8 Liam Girdwood 2015-05-29  744  	struct snd_kcontrol_new *kc)
8a9782346dccd8 Liam Girdwood 2015-05-29  745  {
8a9782346dccd8 Liam Girdwood 2015-05-29  746  	kfree(kc->tlv.p);
8a9782346dccd8 Liam Girdwood 2015-05-29  747  }
8a9782346dccd8 Liam Girdwood 2015-05-29  748  
8a9782346dccd8 Liam Girdwood 2015-05-29  749  static int soc_tplg_dbytes_create(struct soc_tplg *tplg, unsigned int count,
8a9782346dccd8 Liam Girdwood 2015-05-29  750  	size_t size)
8a9782346dccd8 Liam Girdwood 2015-05-29  751  {
8a9782346dccd8 Liam Girdwood 2015-05-29  752  	struct snd_soc_tplg_bytes_control *be;
8a9782346dccd8 Liam Girdwood 2015-05-29  753  	struct soc_bytes_ext *sbe;
8a9782346dccd8 Liam Girdwood 2015-05-29  754  	struct snd_kcontrol_new kc;
8a9782346dccd8 Liam Girdwood 2015-05-29  755  	int i, err;
8a9782346dccd8 Liam Girdwood 2015-05-29  756  
8a9782346dccd8 Liam Girdwood 2015-05-29  757  	if (soc_tplg_check_elem_count(tplg,
8a9782346dccd8 Liam Girdwood 2015-05-29  758  		sizeof(struct snd_soc_tplg_bytes_control), count,
8a9782346dccd8 Liam Girdwood 2015-05-29  759  			size, "mixer bytes")) {
8a9782346dccd8 Liam Girdwood 2015-05-29  760  		dev_err(tplg->dev, "ASoC: Invalid count %d for byte control\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  761  			count);
8a9782346dccd8 Liam Girdwood 2015-05-29  762  		return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  763  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  764  
8a9782346dccd8 Liam Girdwood 2015-05-29  765  	for (i = 0; i < count; i++) {
8a9782346dccd8 Liam Girdwood 2015-05-29  766  		be = (struct snd_soc_tplg_bytes_control *)tplg->pos;
8a9782346dccd8 Liam Girdwood 2015-05-29  767  
8a9782346dccd8 Liam Girdwood 2015-05-29  768  		/* validate kcontrol */
8a9782346dccd8 Liam Girdwood 2015-05-29  769  		if (strnlen(be->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
8a9782346dccd8 Liam Girdwood 2015-05-29  770  			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
8a9782346dccd8 Liam Girdwood 2015-05-29  771  			return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  772  
8a9782346dccd8 Liam Girdwood 2015-05-29  773  		sbe = kzalloc(sizeof(*sbe), GFP_KERNEL);
8a9782346dccd8 Liam Girdwood 2015-05-29  774  		if (sbe == NULL)
8a9782346dccd8 Liam Girdwood 2015-05-29  775  			return -ENOMEM;
8a9782346dccd8 Liam Girdwood 2015-05-29  776  
8a9782346dccd8 Liam Girdwood 2015-05-29  777  		tplg->pos += (sizeof(struct snd_soc_tplg_bytes_control) +
8a9782346dccd8 Liam Girdwood 2015-05-29  778  			be->priv.size);
8a9782346dccd8 Liam Girdwood 2015-05-29  779  
8a9782346dccd8 Liam Girdwood 2015-05-29  780  		dev_dbg(tplg->dev,
8a9782346dccd8 Liam Girdwood 2015-05-29  781  			"ASoC: adding bytes kcontrol %s with access 0x%x\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  782  			be->hdr.name, be->hdr.access);
8a9782346dccd8 Liam Girdwood 2015-05-29  783  
8a9782346dccd8 Liam Girdwood 2015-05-29  784  		memset(&kc, 0, sizeof(kc));
8a9782346dccd8 Liam Girdwood 2015-05-29  785  		kc.name = be->hdr.name;
8a9782346dccd8 Liam Girdwood 2015-05-29  786  		kc.private_value = (long)sbe;
8a9782346dccd8 Liam Girdwood 2015-05-29  787  		kc.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
8a9782346dccd8 Liam Girdwood 2015-05-29  788  		kc.access = be->hdr.access;
8a9782346dccd8 Liam Girdwood 2015-05-29  789  
8a9782346dccd8 Liam Girdwood 2015-05-29 @790  		sbe->max = be->max;
8a9782346dccd8 Liam Girdwood 2015-05-29  791  		sbe->dobj.type = SND_SOC_DOBJ_BYTES;
8a9782346dccd8 Liam Girdwood 2015-05-29  792  		sbe->dobj.ops = tplg->ops;
8a9782346dccd8 Liam Girdwood 2015-05-29  793  		INIT_LIST_HEAD(&sbe->dobj.list);
8a9782346dccd8 Liam Girdwood 2015-05-29  794  
8a9782346dccd8 Liam Girdwood 2015-05-29  795  		/* map io handlers */
2b5cdb9156f761 Mengdong Lin  2015-08-18  796  		err = soc_tplg_kcontrol_bind_io(&be->hdr, &kc, tplg);
8a9782346dccd8 Liam Girdwood 2015-05-29  797  		if (err) {
8a9782346dccd8 Liam Girdwood 2015-05-29  798  			soc_control_err(tplg, &be->hdr, be->hdr.name);
8a9782346dccd8 Liam Girdwood 2015-05-29  799  			kfree(sbe);
8a9782346dccd8 Liam Girdwood 2015-05-29  800  			continue;
8a9782346dccd8 Liam Girdwood 2015-05-29  801  		}
8a9782346dccd8 Liam Girdwood 2015-05-29  802  
8a9782346dccd8 Liam Girdwood 2015-05-29  803  		/* pass control to driver for optional further init */
8a9782346dccd8 Liam Girdwood 2015-05-29  804  		err = soc_tplg_init_kcontrol(tplg, &kc,
8a9782346dccd8 Liam Girdwood 2015-05-29  805  			(struct snd_soc_tplg_ctl_hdr *)be);
8a9782346dccd8 Liam Girdwood 2015-05-29  806  		if (err < 0) {
8a9782346dccd8 Liam Girdwood 2015-05-29  807  			dev_err(tplg->dev, "ASoC: failed to init %s\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  808  				be->hdr.name);
8a9782346dccd8 Liam Girdwood 2015-05-29  809  			kfree(sbe);
8a9782346dccd8 Liam Girdwood 2015-05-29  810  			continue;
8a9782346dccd8 Liam Girdwood 2015-05-29  811  		}
8a9782346dccd8 Liam Girdwood 2015-05-29  812  
8a9782346dccd8 Liam Girdwood 2015-05-29  813  		/* register control here */
8a9782346dccd8 Liam Girdwood 2015-05-29  814  		err = soc_tplg_add_kcontrol(tplg, &kc,
8a9782346dccd8 Liam Girdwood 2015-05-29  815  			&sbe->dobj.control.kcontrol);
8a9782346dccd8 Liam Girdwood 2015-05-29  816  		if (err < 0) {
8a9782346dccd8 Liam Girdwood 2015-05-29  817  			dev_err(tplg->dev, "ASoC: failed to add %s\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  818  				be->hdr.name);
8a9782346dccd8 Liam Girdwood 2015-05-29  819  			kfree(sbe);
8a9782346dccd8 Liam Girdwood 2015-05-29  820  			continue;
8a9782346dccd8 Liam Girdwood 2015-05-29  821  		}
8a9782346dccd8 Liam Girdwood 2015-05-29  822  
8a9782346dccd8 Liam Girdwood 2015-05-29  823  		list_add(&sbe->dobj.list, &tplg->comp->dobj_list);
8a9782346dccd8 Liam Girdwood 2015-05-29  824  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  825  	return 0;
8a9782346dccd8 Liam Girdwood 2015-05-29  826  
8a9782346dccd8 Liam Girdwood 2015-05-29  827  }
8a9782346dccd8 Liam Girdwood 2015-05-29  828  
8a9782346dccd8 Liam Girdwood 2015-05-29  829  static int soc_tplg_dmixer_create(struct soc_tplg *tplg, unsigned int count,
8a9782346dccd8 Liam Girdwood 2015-05-29  830  	size_t size)
8a9782346dccd8 Liam Girdwood 2015-05-29  831  {
8a9782346dccd8 Liam Girdwood 2015-05-29  832  	struct snd_soc_tplg_mixer_control *mc;
8a9782346dccd8 Liam Girdwood 2015-05-29  833  	struct soc_mixer_control *sm;
8a9782346dccd8 Liam Girdwood 2015-05-29  834  	struct snd_kcontrol_new kc;
8a9782346dccd8 Liam Girdwood 2015-05-29  835  	int i, err;
8a9782346dccd8 Liam Girdwood 2015-05-29  836  
8a9782346dccd8 Liam Girdwood 2015-05-29  837  	if (soc_tplg_check_elem_count(tplg,
8a9782346dccd8 Liam Girdwood 2015-05-29  838  		sizeof(struct snd_soc_tplg_mixer_control),
8a9782346dccd8 Liam Girdwood 2015-05-29  839  		count, size, "mixers")) {
8a9782346dccd8 Liam Girdwood 2015-05-29  840  
8a9782346dccd8 Liam Girdwood 2015-05-29  841  		dev_err(tplg->dev, "ASoC: invalid count %d for controls\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  842  			count);
8a9782346dccd8 Liam Girdwood 2015-05-29  843  		return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  844  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  845  
8a9782346dccd8 Liam Girdwood 2015-05-29  846  	for (i = 0; i < count; i++) {
8a9782346dccd8 Liam Girdwood 2015-05-29  847  		mc = (struct snd_soc_tplg_mixer_control *)tplg->pos;
8a9782346dccd8 Liam Girdwood 2015-05-29  848  
8a9782346dccd8 Liam Girdwood 2015-05-29  849  		/* validate kcontrol */
8a9782346dccd8 Liam Girdwood 2015-05-29  850  		if (strnlen(mc->hdr.name, SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
8a9782346dccd8 Liam Girdwood 2015-05-29  851  			SNDRV_CTL_ELEM_ID_NAME_MAXLEN)
8a9782346dccd8 Liam Girdwood 2015-05-29  852  			return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  853  
8a9782346dccd8 Liam Girdwood 2015-05-29  854  		sm = kzalloc(sizeof(*sm), GFP_KERNEL);
8a9782346dccd8 Liam Girdwood 2015-05-29  855  		if (sm == NULL)
8a9782346dccd8 Liam Girdwood 2015-05-29  856  			return -ENOMEM;
8a9782346dccd8 Liam Girdwood 2015-05-29  857  		tplg->pos += (sizeof(struct snd_soc_tplg_mixer_control) +
8a9782346dccd8 Liam Girdwood 2015-05-29  858  			mc->priv.size);
8a9782346dccd8 Liam Girdwood 2015-05-29  859  
8a9782346dccd8 Liam Girdwood 2015-05-29  860  		dev_dbg(tplg->dev,
8a9782346dccd8 Liam Girdwood 2015-05-29  861  			"ASoC: adding mixer kcontrol %s with access 0x%x\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  862  			mc->hdr.name, mc->hdr.access);
8a9782346dccd8 Liam Girdwood 2015-05-29  863  
8a9782346dccd8 Liam Girdwood 2015-05-29  864  		memset(&kc, 0, sizeof(kc));
8a9782346dccd8 Liam Girdwood 2015-05-29  865  		kc.name = mc->hdr.name;
8a9782346dccd8 Liam Girdwood 2015-05-29  866  		kc.private_value = (long)sm;
8a9782346dccd8 Liam Girdwood 2015-05-29  867  		kc.iface = SNDRV_CTL_ELEM_IFACE_MIXER;
8a9782346dccd8 Liam Girdwood 2015-05-29 @868  		kc.access = mc->hdr.access;
8a9782346dccd8 Liam Girdwood 2015-05-29  869  
8a9782346dccd8 Liam Girdwood 2015-05-29  870  		/* we only support FL/FR channel mapping atm */
8a9782346dccd8 Liam Girdwood 2015-05-29  871  		sm->reg = tplc_chan_get_reg(tplg, mc->channel,
8a9782346dccd8 Liam Girdwood 2015-05-29  872  			SNDRV_CHMAP_FL);
8a9782346dccd8 Liam Girdwood 2015-05-29  873  		sm->rreg = tplc_chan_get_reg(tplg, mc->channel,
8a9782346dccd8 Liam Girdwood 2015-05-29  874  			SNDRV_CHMAP_FR);
8a9782346dccd8 Liam Girdwood 2015-05-29  875  		sm->shift = tplc_chan_get_shift(tplg, mc->channel,
8a9782346dccd8 Liam Girdwood 2015-05-29  876  			SNDRV_CHMAP_FL);
8a9782346dccd8 Liam Girdwood 2015-05-29  877  		sm->rshift = tplc_chan_get_shift(tplg, mc->channel,
8a9782346dccd8 Liam Girdwood 2015-05-29  878  			SNDRV_CHMAP_FR);
8a9782346dccd8 Liam Girdwood 2015-05-29  879  
8a9782346dccd8 Liam Girdwood 2015-05-29 @880  		sm->max = mc->max;
8a9782346dccd8 Liam Girdwood 2015-05-29 @881  		sm->min = mc->min;
8a9782346dccd8 Liam Girdwood 2015-05-29 @882  		sm->invert = mc->invert;
8a9782346dccd8 Liam Girdwood 2015-05-29 @883  		sm->platform_max = mc->platform_max;
8a9782346dccd8 Liam Girdwood 2015-05-29  884  		sm->dobj.index = tplg->index;
8a9782346dccd8 Liam Girdwood 2015-05-29  885  		sm->dobj.ops = tplg->ops;
8a9782346dccd8 Liam Girdwood 2015-05-29  886  		sm->dobj.type = SND_SOC_DOBJ_MIXER;
8a9782346dccd8 Liam Girdwood 2015-05-29  887  		INIT_LIST_HEAD(&sm->dobj.list);
8a9782346dccd8 Liam Girdwood 2015-05-29  888  
8a9782346dccd8 Liam Girdwood 2015-05-29  889  		/* map io handlers */
2b5cdb9156f761 Mengdong Lin  2015-08-18  890  		err = soc_tplg_kcontrol_bind_io(&mc->hdr, &kc, tplg);
8a9782346dccd8 Liam Girdwood 2015-05-29  891  		if (err) {
8a9782346dccd8 Liam Girdwood 2015-05-29  892  			soc_control_err(tplg, &mc->hdr, mc->hdr.name);
8a9782346dccd8 Liam Girdwood 2015-05-29  893  			kfree(sm);
8a9782346dccd8 Liam Girdwood 2015-05-29  894  			continue;
8a9782346dccd8 Liam Girdwood 2015-05-29  895  		}
8a9782346dccd8 Liam Girdwood 2015-05-29  896  
8a9782346dccd8 Liam Girdwood 2015-05-29  897  		/* pass control to driver for optional further init */
8a9782346dccd8 Liam Girdwood 2015-05-29  898  		err = soc_tplg_init_kcontrol(tplg, &kc,
8a9782346dccd8 Liam Girdwood 2015-05-29  899  			(struct snd_soc_tplg_ctl_hdr *) mc);
8a9782346dccd8 Liam Girdwood 2015-05-29  900  		if (err < 0) {
8a9782346dccd8 Liam Girdwood 2015-05-29  901  			dev_err(tplg->dev, "ASoC: failed to init %s\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  902  				mc->hdr.name);
8a9782346dccd8 Liam Girdwood 2015-05-29  903  			kfree(sm);
8a9782346dccd8 Liam Girdwood 2015-05-29  904  			continue;
8a9782346dccd8 Liam Girdwood 2015-05-29  905  		}
8a9782346dccd8 Liam Girdwood 2015-05-29  906  
8a9782346dccd8 Liam Girdwood 2015-05-29  907  		/* create any TLV data */
28a87eebcad401 Mengdong Lin  2015-08-05  908  		soc_tplg_create_tlv(tplg, &kc, &mc->hdr);
8a9782346dccd8 Liam Girdwood 2015-05-29  909  
8a9782346dccd8 Liam Girdwood 2015-05-29  910  		/* register control here */
8a9782346dccd8 Liam Girdwood 2015-05-29  911  		err = soc_tplg_add_kcontrol(tplg, &kc,
8a9782346dccd8 Liam Girdwood 2015-05-29  912  			&sm->dobj.control.kcontrol);
8a9782346dccd8 Liam Girdwood 2015-05-29  913  		if (err < 0) {
8a9782346dccd8 Liam Girdwood 2015-05-29  914  			dev_err(tplg->dev, "ASoC: failed to add %s\n",
8a9782346dccd8 Liam Girdwood 2015-05-29  915  				mc->hdr.name);
8a9782346dccd8 Liam Girdwood 2015-05-29  916  			soc_tplg_free_tlv(tplg, &kc);
8a9782346dccd8 Liam Girdwood 2015-05-29  917  			kfree(sm);
8a9782346dccd8 Liam Girdwood 2015-05-29  918  			continue;
8a9782346dccd8 Liam Girdwood 2015-05-29  919  		}
8a9782346dccd8 Liam Girdwood 2015-05-29  920  
8a9782346dccd8 Liam Girdwood 2015-05-29  921  		list_add(&sm->dobj.list, &tplg->comp->dobj_list);
8a9782346dccd8 Liam Girdwood 2015-05-29  922  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  923  
8a9782346dccd8 Liam Girdwood 2015-05-29  924  	return 0;
8a9782346dccd8 Liam Girdwood 2015-05-29  925  }
8a9782346dccd8 Liam Girdwood 2015-05-29  926  
8a9782346dccd8 Liam Girdwood 2015-05-29  927  static int soc_tplg_denum_create_texts(struct soc_enum *se,
8a9782346dccd8 Liam Girdwood 2015-05-29  928  	struct snd_soc_tplg_enum_control *ec)
8a9782346dccd8 Liam Girdwood 2015-05-29  929  {
8a9782346dccd8 Liam Girdwood 2015-05-29  930  	int i, ret;
8a9782346dccd8 Liam Girdwood 2015-05-29  931  
8a9782346dccd8 Liam Girdwood 2015-05-29  932  	se->dobj.control.dtexts =
6396bb221514d2 Kees Cook     2018-06-12 @933  		kcalloc(ec->items, sizeof(char *), GFP_KERNEL);
8a9782346dccd8 Liam Girdwood 2015-05-29  934  	if (se->dobj.control.dtexts == NULL)
8a9782346dccd8 Liam Girdwood 2015-05-29  935  		return -ENOMEM;
8a9782346dccd8 Liam Girdwood 2015-05-29  936  
8a9782346dccd8 Liam Girdwood 2015-05-29  937  	for (i = 0; i < ec->items; i++) {
8a9782346dccd8 Liam Girdwood 2015-05-29  938  
8a9782346dccd8 Liam Girdwood 2015-05-29  939  		if (strnlen(ec->texts[i], SNDRV_CTL_ELEM_ID_NAME_MAXLEN) ==
8a9782346dccd8 Liam Girdwood 2015-05-29  940  			SNDRV_CTL_ELEM_ID_NAME_MAXLEN) {
8a9782346dccd8 Liam Girdwood 2015-05-29  941  			ret = -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  942  			goto err;
8a9782346dccd8 Liam Girdwood 2015-05-29  943  		}
8a9782346dccd8 Liam Girdwood 2015-05-29  944  
8a9782346dccd8 Liam Girdwood 2015-05-29  945  		se->dobj.control.dtexts[i] = kstrdup(ec->texts[i], GFP_KERNEL);
8a9782346dccd8 Liam Girdwood 2015-05-29  946  		if (!se->dobj.control.dtexts[i]) {
8a9782346dccd8 Liam Girdwood 2015-05-29  947  			ret = -ENOMEM;
8a9782346dccd8 Liam Girdwood 2015-05-29  948  			goto err;
8a9782346dccd8 Liam Girdwood 2015-05-29  949  		}
8a9782346dccd8 Liam Girdwood 2015-05-29  950  	}
8a9782346dccd8 Liam Girdwood 2015-05-29  951  
b6e38b2944f115 Mousumi Jana  2017-04-11  952  	se->texts = (const char * const *)se->dobj.control.dtexts;
8a9782346dccd8 Liam Girdwood 2015-05-29  953  	return 0;
8a9782346dccd8 Liam Girdwood 2015-05-29  954  
8a9782346dccd8 Liam Girdwood 2015-05-29  955  err:
8a9782346dccd8 Liam Girdwood 2015-05-29  956  	for (--i; i >= 0; i--)
8a9782346dccd8 Liam Girdwood 2015-05-29  957  		kfree(se->dobj.control.dtexts[i]);
8a9782346dccd8 Liam Girdwood 2015-05-29  958  	kfree(se->dobj.control.dtexts);
8a9782346dccd8 Liam Girdwood 2015-05-29  959  	return ret;
8a9782346dccd8 Liam Girdwood 2015-05-29  960  }
8a9782346dccd8 Liam Girdwood 2015-05-29  961  
8a9782346dccd8 Liam Girdwood 2015-05-29  962  static int soc_tplg_denum_create_values(struct soc_enum *se,
8a9782346dccd8 Liam Girdwood 2015-05-29  963  	struct snd_soc_tplg_enum_control *ec)
8a9782346dccd8 Liam Girdwood 2015-05-29  964  {
8a9782346dccd8 Liam Girdwood 2015-05-29 @965  	if (ec->items > sizeof(*ec->values))
8a9782346dccd8 Liam Girdwood 2015-05-29  966  		return -EINVAL;
8a9782346dccd8 Liam Girdwood 2015-05-29  967  
376c0afe2f0047 Andrzej Hajda 2015-08-07  968  	se->dobj.control.dvalues = kmemdup(ec->values,
376c0afe2f0047 Andrzej Hajda 2015-08-07  969  					   ec->items * sizeof(u32),
376c0afe2f0047 Andrzej Hajda 2015-08-07  970  					   GFP_KERNEL);
8a9782346dccd8 Liam Girdwood 2015-05-29  971  	if (!se->dobj.control.dvalues)
8a9782346dccd8 Liam Girdwood 2015-05-29  972  		return -ENOMEM;
8a9782346dccd8 Liam Girdwood 2015-05-29  973  
8a9782346dccd8 Liam Girdwood 2015-05-29  974  	return 0;
8a9782346dccd8 Liam Girdwood 2015-05-29  975  }
8a9782346dccd8 Liam Girdwood 2015-05-29  976  

:::::: The code at line 790 was first introduced by commit
:::::: 8a9782346dccd82cf912552735bda619de4efd8c ASoC: topology: Add topology core

:::::: TO: Liam Girdwood <liam.r.girdwood@linux.intel.com>
:::::: CC: Mark Brown <broonie@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
