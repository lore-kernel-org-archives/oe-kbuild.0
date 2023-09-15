Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3480E10A01
	for <oe-kbuild@lists.linux.dev>; Fri, 15 Sep 2023 15:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694791450; x=1726327450;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=fcfOOlDkkhUWcdQY3xvqLwsyThRxJaqMz9OumhzFbuE=;
  b=K7uUhOpHWqkzQIio2ov01j4KD540W5mBYb+4inDn1b5GvLRwctmaMjhQ
   moHRyno8J02N97h+rCuYmlf92lnz+QOa+LrvqlTZqN0QiWBCj1U3MR4wj
   D5Z/0EfbvQPEmbOofOHZYF1k02b5wcYuM9FMSMQEY5bZLgxECUdip6+v/
   nFF4PZ3EEARVKeJgWCAEmVKGbadzZOmPDkHCJRn2EierFYOLOn1iQM2CU
   37Z/eQJqN6ZTFSo7PEMkKc90Wv5F4WjOZNtVk7lv0XBvSvReXycFbwuzw
   hZv6aSCDNJnb3r4XfW12Il4ndCdj+ULKpHMQGxLtFfAE2/blzQSqMSzqj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="364321853"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="364321853"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 08:24:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="748245286"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="748245286"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 15 Sep 2023 08:24:08 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qhAft-00037B-2n;
	Fri, 15 Sep 2023 15:24:05 +0000
Date: Fri, 15 Sep 2023 23:23:21 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [Intel-wired-lan] [PATCH iwl-next 1/2] ethtool: Add forced speed
 to supported link modes maps
Message-ID: <202309152316.iTE6LtsJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "checkpatch"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20230915145522.586365-2-pawel.chmielewski@intel.com>
References: <20230915145522.586365-2-pawel.chmielewski@intel.com>
TO: Pawel Chmielewski <pawel.chmielewski@intel.com>
TO: intel-wired-lan@lists.osuosl.org
CC: netdev@vger.kernel.org
CC: aelior@marvell.com
CC: Paul Greenwalt <paul.greenwalt@intel.com>
CC: manishc@marvell.com
CC: andrew@lunn.ch

Hi Pawel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on tnguy-next-queue/dev-queue]

url:    https://github.com/intel-lab-lkp/linux/commits/Pawel-Chmielewski/ethtool-Add-forced-speed-to-supported-link-modes-maps/20230915-230015
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tnguy/next-queue.git dev-queue
patch link:    https://lore.kernel.org/r/20230915145522.586365-2-pawel.chmielewski%40intel.com
patch subject: [Intel-wired-lan] [PATCH iwl-next 1/2] ethtool: Add forced speed to supported link modes maps
:::::: branch date: 17 minutes ago
:::::: commit date: 17 minutes ago
reproduce: (https://download.01.org/0day-ci/archive/20230915/202309152316.iTE6LtsJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202309152316.iTE6LtsJ-lkp@intel.com/

# many are suggestions rather than must-fix

CHECK: Alignment should match open parenthesis
#123: net/ethtool/ioctl.c:3393:
+void ethtool_forced_speed_maps_init(struct ethtool_forced_speed_map *maps,
+				   u32 size)

WARNING: adding a line without newline at end of file
#135: net/ethtool/ioctl.c:3405:
+EXPORT_SYMBOL(ethtool_forced_speed_maps_init);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
