Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0447019916
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jun 2023 14:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686925193; x=1718461193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NBVEwvuWDroRbJ5ODOs5bDXh+gqDrGBB9Pe8OeK3o9g=;
  b=is/MG8td9JjLrfRgNC0xbVyPeiy3lklGQT5XEagmuoGdjx40XWaz+HYG
   xigYdVKU+9V9I9qVSNRmhjP2u7MWd8xw1uGPmCUvu9QJ3bowXMO1ZiYCS
   L3Y8vbcGGwOEPcRytu98uVHHQqNM4m5gyUObzi854lpvQm9f+kyDrBfH+
   XkqImZyvzVVqWb7SHukyqUwPaw55WmgztB1ry7LsNzhO32O3Lzk6Y4I4n
   7tdiSALTSS9lDYjwQmpdeqRWaEDglvDfywewiO1/jYPhiHhD7q+pRG8Uh
   7Llw+fn99eP/Easl/6jdaera6zRngEtzvgRYFeAXi6qKbqTPiTI0oMe3Z
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="387958429"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="387958429"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2023 07:19:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="1043106351"
X-IronPort-AV: E=Sophos;i="6.00,247,1681196400"; 
   d="scan'208";a="1043106351"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 16 Jun 2023 07:19:30 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAAIU-0001JU-0L;
	Fri, 16 Jun 2023 14:19:30 +0000
Date: Fri, 16 Jun 2023 22:18:51 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [iwlwifi-next:pending 76/94] net/mac80211/tdls.c:883:19-21: WARNING
 opportunity for max()
Message-ID: <202306162241.6e5To72X-lkp@intel.com>
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
TO: Mukesh Sisodiya <mukesh.sisodiya@intel.com>
CC: Gregory Greenman <gregory.greenman@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/iwlwifi-next.git pending
head:   88989d54671bfc739ed855f173058cb2682ce1cf
commit: ce1fc230b505767674d2b62a66efe3878c455309 [76/94] wifi: mac80211: handle TDLS negotiation with MLO
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago
config: powerpc-randconfig-c041-20230614 (https://download.01.org/0day-ci/archive/20230616/202306162241.6e5To72X-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230616/202306162241.6e5To72X-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306162241.6e5To72X-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> net/mac80211/tdls.c:883:19-21: WARNING opportunity for max()

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
