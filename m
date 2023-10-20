Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B66E199AF
	for <oe-kbuild@lists.linux.dev>; Fri, 20 Oct 2023 11:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ODRDz22m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697802729; x=1729338729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=n6/HdENSjoflvF6yVRhx/7iX0ywhO4Danxrml3hZnYA=;
  b=ODRDz22mx5sqUPInUSiCwUJO6j0age9jfg6lnPGa72F5Hr0dzBAUOUes
   lavTIq/HnHnZ3TJdNGNXHsjhJNTQWQm/bcKoHiJ0RtteqLvvTyfpb73h5
   /8G0UZL3OZzTX9FoSyklzioM24Untj3pXGEjAOpxHYbBxXs1Gi+g4WKG7
   +5eHi5uRtVS/od3WPBpSeAtuRlLKxoLLNSnv+jCD+1Eesjk5vPUDbUJAq
   fj8f/qKHMdN/b3YMB6FRCI7vXSzSSqQW6jBHaTa12aY8KJ17DNayZ7VOo
   UjHCBbhOGL3mWJx+MyfvI3fgwEs4cHFQAh0HXs8byfGiIHIpd6bbbSllF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="385358915"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="385358915"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 04:52:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="823227293"
X-IronPort-AV: E=Sophos;i="6.03,238,1694761200"; 
   d="scan'208";a="823227293"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 20 Oct 2023 04:52:07 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qto2v-0003Ty-0S;
	Fri, 20 Oct 2023 11:52:05 +0000
Date: Fri, 20 Oct 2023 19:51:11 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 3/5] i3c: slave: add svc slave controller support
Message-ID: <202310201945.nRKjcul0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "git am base is a link in commit message"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231018215809.3477437-4-Frank.Li@nxp.com>
References: <20231018215809.3477437-4-Frank.Li@nxp.com>
TO: Frank Li <Frank.Li@nxp.com>
TO: miquel.raynal@bootlin.com
TO: conor.culhane@silvaco.com
TO: alexandre.belloni@bootlin.com
TO: robh+dt@kernel.org
TO: krzysztof.kozlowski+dt@linaro.org
TO: conor+dt@kernel.org
TO: corbet@lwn.net
TO: joe@perches.com
TO: Frank.Li@nxp.com
TO: linux-i3c@lists.infradead.org
TO: devicetree@vger.kernel.org
TO: linux-kernel@vger.kernel.org
TO: linux-doc@vger.kernel.org
CC: gregkh@linuxfoundation.org
CC: imx@lists.linux.dev
CC: jirislaby@kernel.org
CC: linux-serial@vger.kernel.org

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Li/i3c-add-slave-mode-support/20231019-055940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20231018215809.3477437-4-Frank.Li%40nxp.com
patch subject: [PATCH 3/5] i3c: slave: add svc slave controller support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20231020/202310201945.nRKjcul0-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310201945.nRKjcul0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310201945.nRKjcul0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/i3c/slave/svc-i3c-slave.c:211:39: warning: no previous prototype for 'svc_i3c_get_features' [-Wmissing-prototypes]
     211 | const struct i3c_slave_ctrl_features *svc_i3c_get_features(struct i3c_slave_ctrl *ctrl)
         |                                       ^~~~~~~~~~~~~~~~~~~~
>> drivers/i3c/slave/svc-i3c-slave.c:666:5: warning: no previous prototype for 'svc_i3c_fifo_status' [-Wmissing-prototypes]
     666 | int svc_i3c_fifo_status(struct i3c_slave_ctrl *ctrl, bool tx)
         |     ^~~~~~~~~~~~~~~~~~~


vim +/svc_i3c_get_features +211 drivers/i3c/slave/svc-i3c-slave.c

10d1fc84a07d32 Frank Li 2023-10-18  210  
10d1fc84a07d32 Frank Li 2023-10-18 @211  const struct i3c_slave_ctrl_features *svc_i3c_get_features(struct i3c_slave_ctrl *ctrl)
10d1fc84a07d32 Frank Li 2023-10-18  212  {
10d1fc84a07d32 Frank Li 2023-10-18  213  	struct svc_i3c_slave *svc;
10d1fc84a07d32 Frank Li 2023-10-18  214  
10d1fc84a07d32 Frank Li 2023-10-18  215  	svc = dev_get_drvdata(&ctrl->dev);
10d1fc84a07d32 Frank Li 2023-10-18  216  
10d1fc84a07d32 Frank Li 2023-10-18  217  	if (!svc)
10d1fc84a07d32 Frank Li 2023-10-18  218  		return NULL;
10d1fc84a07d32 Frank Li 2023-10-18  219  
10d1fc84a07d32 Frank Li 2023-10-18  220  	return &svc->features;
10d1fc84a07d32 Frank Li 2023-10-18  221  }
10d1fc84a07d32 Frank Li 2023-10-18  222  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
