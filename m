Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 447FBD304
	for <oe-kbuild@lists.linux.dev>; Thu, 30 Mar 2023 23:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680217699; x=1711753699;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6UcpvM+bJrlhNvpuJ4+HZW4jW4qNi127zwbnXsRDco=;
  b=Oo/GYdl4ap9AP5iDPvil/Kgj8KG1rAzw8cK9xNZ6BT9o7KKjWLZzF361
   1qekQH+8D+gMxbU4zgfANCQndnhmzgdYBo9Fy6GarnKRA7HUKi0ZrGCd2
   om1f+EJgMxzIIM2jbClbbLTImlzskJeCWiqLK1MtAsWzdwkShgKN6n2Ii
   13NXVkkM2AlPgOpxGM9eRa2ydNP+0EZxjgEgJbxWQfo/Ng03BPF6CBGzG
   Y20pwxwOiprLYs/qPzpHkQZqZ/gSjn1E//bUUyPNM1CRFBryOCo9tFqSD
   SdABHE6oh3w3UhJYJYV2RFmwtoj7J6npsJYuFdhQEXFemmJY5a0f0DnJf
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="342953035"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="342953035"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2023 16:08:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="662211827"
X-IronPort-AV: E=Sophos;i="5.98,306,1673942400"; 
   d="scan'208";a="662211827"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 30 Mar 2023 16:08:15 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pi1NO-000LIQ-2H;
	Thu, 30 Mar 2023 23:08:14 +0000
Date: Fri, 31 Mar 2023 07:07:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/net/phy/microchip_t1.c:269 lan87xx_phy_init_cmd() error:
 uninitialized symbol 'ret'.
Message-ID: <202303310734.jQAIS2M7-lkp@intel.com>
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
TO: Rakesh Sankaranarayanan <rakesh.sankaranarayanan@microchip.com>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Andrew Lunn <andrew@lunn.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b2bc47e9b2011a183f9d3d3454a294a938082fb9
commit: d7bf56e0c591e189141430dc8bf4a1b4d0f117a2 net: phy: microchip: run phy initialization during each link update
date:   9 weeks ago
:::::: branch date: 2 hours ago
:::::: commit date: 9 weeks ago
config: parisc-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230331/202303310734.jQAIS2M7-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202303310734.jQAIS2M7-lkp@intel.com/

smatch warnings:
drivers/net/phy/microchip_t1.c:269 lan87xx_phy_init_cmd() error: uninitialized symbol 'ret'.

vim +/ret +269 drivers/net/phy/microchip_t1.c

26499499cae642 Yuiko Oshino            2021-11-01  247  
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  248  static int lan87xx_phy_init_cmd(struct phy_device *phydev,
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  249  				const struct access_ereg_val *cmd_seq, int cnt)
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  250  {
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  251  	int ret, i;
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  252  
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  253  	for (i = 0; i < cnt; i++) {
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  254  		if (cmd_seq[i].mode == PHYACC_ATTR_MODE_POLL &&
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  255  		    cmd_seq[i].bank == PHYACC_ATTR_BANK_SMI) {
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  256  			ret = access_smi_poll_timeout(phydev,
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  257  						      cmd_seq[i].offset,
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  258  						      cmd_seq[i].val,
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  259  						      cmd_seq[i].mask);
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  260  		} else {
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  261  			ret = access_ereg(phydev, cmd_seq[i].mode,
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  262  					  cmd_seq[i].bank, cmd_seq[i].offset,
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  263  					  cmd_seq[i].val);
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  264  		}
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  265  		if (ret < 0)
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  266  			return ret;
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  267  	}
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  268  
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20 @269  	return ret;
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  270  }
d7bf56e0c591e1 Rakesh Sankaranarayanan 2023-01-20  271  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
