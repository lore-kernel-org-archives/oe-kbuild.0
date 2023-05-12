Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E8C628
	for <oe-kbuild@lists.linux.dev>; Fri, 12 May 2023 00:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683850113; x=1715386113;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=536rWX3L5vD3J7U/sScmeZzFgiqYz2WQHaJDGoWliyw=;
  b=M9OnqWRQD1FHtkolbxCwJK2xkgsMJqysyUoMGPL/cF8uyFK2IBJcZ8Rt
   jQW3NtjXe90fmZ7P+9w1TJbqIytHNxbl6Via48WeIKUdBz2QdHYX4VWq0
   IpMvzv66qF+FjSZyKTefKIddranoVZ3jREGpN9zBBNqpHfl691WYekK8O
   w/hs/1HTDaw3ybX5xaNpRxKle5U2fayyxSCLBcIfT2YG55ITRn/+5xP/c
   SoN8KYwGn3lZtJIJTy5BJ28NjZfCdG+5gggi4yHR9ki75DDVY1HEMnxsV
   PpIU5fMaU9VimBUOzLe28iEg/sb96PyTZoNHT2y+1IgduItfD16ZnEWFM
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="350694255"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="350694255"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2023 17:08:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="702951827"
X-IronPort-AV: E=Sophos;i="5.99,268,1677571200"; 
   d="scan'208";a="702951827"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 11 May 2023 17:08:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pxGKj-0004KA-2o;
	Fri, 12 May 2023 00:08:29 +0000
Date: Fri, 12 May 2023 08:07:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] usb: dwc3: Modify runtime pm ops to handle bus
 suspend
Message-ID: <202305120709.tCFYCtsd-lkp@intel.com>
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
In-Reply-To: <1683827311-1462-3-git-send-email-quic_eserrao@quicinc.com>
References: <1683827311-1462-3-git-send-email-quic_eserrao@quicinc.com>
TO: Elson Roy Serrao <quic_eserrao@quicinc.com>
TO: gregkh@linuxfoundation.org
TO: Thinh.Nguyen@synopsys.com
CC: linux-kernel@vger.kernel.org
CC: linux-usb@vger.kernel.org
CC: quic_wcheng@quicinc.com
CC: quic_jackp@quicinc.com
CC: Elson Roy Serrao <quic_eserrao@quicinc.com>

Hi Elson,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next usb/usb-linus linus/master v6.4-rc1 next-20230511]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Elson-Roy-Serrao/usb-function-u_ether-Handle-rx-requests-during-suspend-resume/20230512-015036
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/1683827311-1462-3-git-send-email-quic_eserrao%40quicinc.com
patch subject: [PATCH 2/2] usb: dwc3: Modify runtime pm ops to handle bus suspend
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230512/202305120709.tCFYCtsd-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202305120709.tCFYCtsd-lkp@intel.com/

New smatch warnings:
drivers/usb/dwc3/gadget.c:2409 dwc3_gadget_wakeup() warn: pm_runtime_get_sync() also returns 1 on success
drivers/usb/dwc3/gadget.c:2437 dwc3_gadget_func_wakeup() warn: pm_runtime_get_sync() also returns 1 on success

Old smatch warnings:
drivers/usb/dwc3/gadget.c:1648 __dwc3_gadget_kick_transfer() warn: missing error code? 'ret'
drivers/usb/dwc3/gadget.c:2744 dwc3_gadget_pullup() warn: pm_runtime_get_sync() also returns 1 on success

vim +2409 drivers/usb/dwc3/gadget.c

218ef7b647e336 Felipe Balbi     2016-04-04  2391  
218ef7b647e336 Felipe Balbi     2016-04-04  2392  static int dwc3_gadget_wakeup(struct usb_gadget *g)
218ef7b647e336 Felipe Balbi     2016-04-04  2393  {
218ef7b647e336 Felipe Balbi     2016-04-04  2394  	struct dwc3		*dwc = gadget_to_dwc(g);
218ef7b647e336 Felipe Balbi     2016-04-04  2395  	unsigned long		flags;
218ef7b647e336 Felipe Balbi     2016-04-04  2396  	int			ret;
218ef7b647e336 Felipe Balbi     2016-04-04  2397  
047161686b813a Elson Roy Serrao 2023-03-24  2398  	if (!dwc->wakeup_configured) {
047161686b813a Elson Roy Serrao 2023-03-24  2399  		dev_err(dwc->dev, "remote wakeup not configured\n");
047161686b813a Elson Roy Serrao 2023-03-24  2400  		return -EINVAL;
047161686b813a Elson Roy Serrao 2023-03-24  2401  	}
047161686b813a Elson Roy Serrao 2023-03-24  2402  
047161686b813a Elson Roy Serrao 2023-03-24  2403  	if (!dwc->gadget->wakeup_armed) {
047161686b813a Elson Roy Serrao 2023-03-24  2404  		dev_err(dwc->dev, "not armed for remote wakeup\n");
047161686b813a Elson Roy Serrao 2023-03-24  2405  		return -EINVAL;
047161686b813a Elson Roy Serrao 2023-03-24  2406  	}
047161686b813a Elson Roy Serrao 2023-03-24  2407  
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2408  	ret = pm_runtime_get_sync(dwc->dev);
0660b8a88d4d6a Elson Roy Serrao 2023-05-11 @2409  	if (ret) {
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2410  		pm_runtime_put(dwc->dev);
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2411  		return ret;
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2412  	}
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2413  
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2414  	spin_lock_irqsave(&dwc->lock, flags);
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2415  	ret = __dwc3_gadget_wakeup(dwc, true);
72246da40f3719 Felipe Balbi     2011-08-19  2416  	spin_unlock_irqrestore(&dwc->lock, flags);
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2417  	pm_runtime_put_noidle(dwc->dev);
72246da40f3719 Felipe Balbi     2011-08-19  2418  
72246da40f3719 Felipe Balbi     2011-08-19  2419  	return ret;
72246da40f3719 Felipe Balbi     2011-08-19  2420  }
72246da40f3719 Felipe Balbi     2011-08-19  2421  
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2422  static void dwc3_resume_gadget(struct dwc3 *dwc);
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2423  
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2424  static int dwc3_gadget_func_wakeup(struct usb_gadget *g, int intf_id)
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2425  {
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2426  	struct  dwc3		*dwc = gadget_to_dwc(g);
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2427  	unsigned long		flags;
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2428  	int			ret;
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2429  	int			link_state;
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2430  
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2431  	if (!dwc->wakeup_configured) {
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2432  		dev_err(dwc->dev, "remote wakeup not configured\n");
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2433  		return -EINVAL;
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2434  	}
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2435  
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2436  	ret = pm_runtime_get_sync(dwc->dev);
0660b8a88d4d6a Elson Roy Serrao 2023-05-11 @2437  	if (ret) {
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2438  		pm_runtime_put(dwc->dev);
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2439  		return ret;
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2440  	}
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2441  
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2442  	spin_lock_irqsave(&dwc->lock, flags);
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2443  	/*
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2444  	 * If the link is in U3, signal for remote wakeup and wait for the
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2445  	 * link to transition to U0 before sending device notification.
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2446  	 */
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2447  	link_state = dwc3_gadget_get_link_state(dwc);
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2448  	if (link_state == DWC3_LINK_STATE_U3) {
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2449  		ret = __dwc3_gadget_wakeup(dwc, false);
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2450  		if (ret) {
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2451  			spin_unlock_irqrestore(&dwc->lock, flags);
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2452  			pm_runtime_put_noidle(dwc->dev);
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2453  			return -EINVAL;
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2454  		}
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2455  		dwc3_resume_gadget(dwc);
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2456  		dwc->link_state = DWC3_LINK_STATE_U0;
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2457  	}
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2458  
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2459  	ret = dwc3_send_gadget_generic_command(dwc, DWC3_DGCMD_DEV_NOTIFICATION,
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2460  					       DWC3_DGCMDPAR_DN_FUNC_WAKE |
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2461  					       DWC3_DGCMDPAR_INTF_SEL(intf_id));
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2462  	if (ret)
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2463  		dev_err(dwc->dev, "function remote wakeup failed, ret:%d\n", ret);
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2464  
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2465  	spin_unlock_irqrestore(&dwc->lock, flags);
0660b8a88d4d6a Elson Roy Serrao 2023-05-11  2466  	pm_runtime_put_noidle(dwc->dev);
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2467  
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2468  	return ret;
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2469  }
92c08a84b53e5d Elson Roy Serrao 2023-03-24  2470  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
