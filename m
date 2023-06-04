Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F64B256E
	for <oe-kbuild@lists.linux.dev>; Sun,  4 Jun 2023 11:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685876675; x=1717412675;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=pJ2zIdRpMNBNwiu2c2zqWmyFVd2DOgVyxC9daF3eIL0=;
  b=PdBIl39+RJznnOCnHXLCqp7VHAsdFiloJp5tG8Wp4YedJou5mRF99QR1
   0w6DWwIcTrOiVJeZQ4c8RSqrKzS2r9ioEILBUA4ulyCPaT+qjrMWs2YjP
   oAJB5pWT/OdAvEv16z+ODNSEh3SvRXyfSK/HaTTZrjZ4PdwRZAJ6ZveEN
   BUMPggRF0ML2yVHfQTXZqQ4MLSEHzhKjTlWSvMzpmD5qVDZSMUrumOloh
   BU89MY8VWHQSootTR2UCcrOV7KUsCz1OVzx8eATOl/sDnddWFjFRlJr1h
   25q9O8t8cwHV9RJlVXwISnYA6CuSxIxtyYKO5o57oVl12DLQH/CHisSWs
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="336533103"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="336533103"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2023 04:04:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10730"; a="702461155"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; 
   d="scan'208";a="702461155"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 04 Jun 2023 04:04:33 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5lXE-0002cp-1i;
	Sun, 04 Jun 2023 11:04:32 +0000
Date: Sun, 4 Jun 2023 19:04:30 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>,
	Elena Reshetova <elena.reshetova@intel.com>
Subject: fs/smb/client/connect.c:2614:6-25: WARNING: atomic_dec_and_test
 variation before object free at line 2622.
Message-ID: <202306041936.Gx8jFfyu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Steve French <stfrench@microsoft.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e5282a7d8f6b604f2bb6a06457734b8cf1e2f8f2
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d smb: move client and server files to common directory fs/smb
date:   11 days ago
:::::: branch date: 17 hours ago
:::::: commit date: 11 days ago
config: i386-randconfig-c001-20230604 (https://download.01.org/0day-ci/archive/20230604/202306041936.Gx8jFfyu-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306041936.Gx8jFfyu-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/client/connect.c:2614:6-25: WARNING: atomic_dec_and_test variation before object free at line 2622.
--
>> fs/smb/client/cifsfs.c:1186:6-12: ERROR: allocation function on line 1173 returns NULL not ERR_PTR on failure
--
>> fs/smb/client/cifsacl.c:190:23-24: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
