Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33D5933D1
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Feb 2023 13:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676296041; x=1707832041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=icaElnWcGGD8HBQ11CBMetIDHaJI7/610E/PlfA5k94=;
  b=glC6sIzmRgUN9aABQvuNazeM1NsTJzF9wrnvGuGGAzNxBwtzkrTrJ1Wf
   siQfN4PKP1pyqqLWapxcHhcqHTIuEYHsDabtFsVzVM/hafx9QIs1NyT5h
   04uwbjXcChbzUjz4lXgbmE4wMYlrBXKBzRbHFYWSSUZRPnVbq/HzqW0nQ
   LaGgdvxOsdraxoN3BMioDHNXrn3GIYod87E0GvwnK7Ofb7uN7rpo4b1oJ
   B5vjFUqj9oxaiVM14SGd4tjduI62/3dE5yA2e5/gRYNrZ6maakGrzfdvH
   Ta+vVgblx8QAvavAp3SZQwrifcIj4L6o04cAC04N1UPs+5+SZ5RPOfwva
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="314533258"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="314533258"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 05:47:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="997698256"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="997698256"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 13 Feb 2023 05:47:19 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRZAs-0007lN-0S;
	Mon, 13 Feb 2023 13:47:18 +0000
Date: Mon, 13 Feb 2023 21:46:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 10/12] net: pcs: add driver for MediaTek SGMII PCS
Message-ID: <202302132149.ZXpi5GIN-lkp@intel.com>
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
In-Reply-To: <ea7658198d2a1480746882a7e31adf0f37793086.1676128247.git.daniel@makrotopia.org>
References: <ea7658198d2a1480746882a7e31adf0f37793086.1676128247.git.daniel@makrotopia.org>
TO: Daniel Golle <daniel@makrotopia.org>

Hi Daniel,

I love your patch! Perhaps something to improve:

[auto build test WARNING on 6ba8a227fd19d19779005fb66ad7562608e1df83]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Golle/net-ethernet-mtk_eth_soc-add-support-for-MT7981-SoC/20230212-000942
base:   6ba8a227fd19d19779005fb66ad7562608e1df83
patch link:    https://lore.kernel.org/r/ea7658198d2a1480746882a7e31adf0f37793086.1676128247.git.daniel%40makrotopia.org
patch subject: [PATCH v5 10/12] net: pcs: add driver for MediaTek SGMII PCS
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/r/202302132149.ZXpi5GIN-lkp@intel.com/

includecheck warnings: (new ones prefixed by >>)
>> drivers/net/pcs/pcs-mtk-lynxi.c: linux/phylink.h is included more than once.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
