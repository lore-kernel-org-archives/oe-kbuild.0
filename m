Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D02717F2
	for <oe-kbuild@lists.linux.dev>; Sat,  1 Jul 2023 04:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688184418; x=1719720418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HpDLRJU4c+83z54xSt3p1EFspfJux1/eXpzGNFBjUFg=;
  b=b13pjc2+lFclDM8jtvSVIAeThZs/y0N0EJzfhSTzu5mcUm/SqmdhsNpH
   EZUnrW08osb8e4wCvUl8KM3TjgTBxmLFf07EoUBImP7o1KeyqRrrHeEzR
   y+Ezgogjdr3akr502TaFy+yoE5H3/6bWWRIG+ApOJN0ifxVPVb488S1H5
   cYolOlhYZ1e+CKqFremRyKCwrH8BKCND7qoYHpJmVcg3k1o4x6u3PRtpA
   rRA6QPHDZ00SFxhiAVxQ49qpHbLukLIseYOhbF0BnRyKfsfXpzk72zNsE
   wqU8TrqqkhFkjDHs4lyLaxR17m/0dhAexvjlPkvQ8RuoEHnYEJxlHSdjI
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="347326658"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="347326658"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2023 21:06:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10757"; a="862493480"
X-IronPort-AV: E=Sophos;i="6.01,172,1684825200"; 
   d="scan'208";a="862493480"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 Jun 2023 21:06:56 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qFRst-000Ffb-2z;
	Sat, 01 Jul 2023 04:06:55 +0000
Date: Sat, 1 Jul 2023 12:06:32 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: fs/smb/client/smbdirect.c:1586:3-4: WARNING opportunity for min()
Message-ID: <202307011147.wuhqVgZl-lkp@intel.com>
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
head:   b25f62ccb490680a8cee755ac4528909395e0711
commit: 38c8a9a52082579090e34c033d439ed2cd1a462d smb: move client and server files to common directory fs/smb
date:   5 weeks ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 weeks ago
config: openrisc-randconfig-r053-20230629 (https://download.01.org/0day-ci/archive/20230701/202307011147.wuhqVgZl-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230701/202307011147.wuhqVgZl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202307011147.wuhqVgZl-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/smb/client/smbdirect.c:1586:3-4: WARNING opportunity for min()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
