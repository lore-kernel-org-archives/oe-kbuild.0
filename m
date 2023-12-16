Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B95CDF54
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Dec 2023 04:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UAtzMRmB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702701845; x=1734237845;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YME8G+Jq8iP0OZfmcV0xDDuNIflp5iDWIf3XMBvcsHc=;
  b=UAtzMRmBwdUsrlddsGZKMakXGUbeKnmF6V0IH51rK/CpH6HeheEOzRqW
   sX2gWwBc7951XCLWV5pxy0f6FUVOo14yIPUW+RMibrlZitp9q64yTEx7G
   73cUTGLcx5CkhjvA60cRyRDrp+cc0UIIYVMbFQFTHxs4+sQPnaz6ZBtet
   v86sdv2jEIoyr8exUwWMIB/77mJigkesqQAvdAdWb5GiT4qK7vKDtHtbi
   RkdDeET+qmL/0qpd8kYDn2+Cl1TNV0R9Ww4JhZ/ky7iGF6sSnKq7cPJ1p
   eR68GvDH8ra6PfWwtt5r77+OfEWri03Kq1suDf4+QBW7FJNma2yO8b5E7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="8779013"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="8779013"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Dec 2023 20:44:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10925"; a="803922687"
X-IronPort-AV: E=Sophos;i="6.04,280,1695711600"; 
   d="scan'208";a="803922687"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 15 Dec 2023 20:44:01 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rEMWt-0001AK-0T;
	Sat, 16 Dec 2023 04:43:59 +0000
Date: Sat, 16 Dec 2023 12:43:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v2 12/12] usb: typec: altmodes/displayport: add SOP'
 support
Message-ID: <202312161205.sNH5M6Pz-lkp@intel.com>
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
In-Reply-To: <20231214230850.379863-26-rdbabiera@google.com>
References: <20231214230850.379863-26-rdbabiera@google.com>
TO: RD Babiera <rdbabiera@google.com>
TO: rdbabiera@google.com
TO: heikki.krogerus@linux.intel.com
TO: linux@roeck-us.net
TO: gregkh@linuxfoundation.org
TO: linux-kernel@vger.kernel.org
TO: linux-usb@vger.kernel.org
CC: badhri@google.com
CC: bryan.odonoghue@linaro.org
CC: agross@kernel.org
CC: andersson@kernel.org
CC: konrad.dybcio@linaro.org

Hi RD,

kernel test robot noticed the following build warnings:

[auto build test WARNING on usb/usb-testing]
[also build test WARNING on usb/usb-next next-20231215]
[cannot apply to usb/usb-linus linus/master v6.7-rc5]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/RD-Babiera/usb-typec-altmodes-add-typec_cable_ops-to-typec_altmode/20231215-071339
base:   https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
patch link:    https://lore.kernel.org/r/20231214230850.379863-26-rdbabiera%40google.com
patch subject: [PATCH v2 12/12] usb: typec: altmodes/displayport: add SOP' support
:::::: branch date: 29 hours ago
:::::: commit date: 29 hours ago
config: riscv-randconfig-r081-20231216 (https://download.01.org/0day-ci/archive/20231216/202312161205.sNH5M6Pz-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202312161205.sNH5M6Pz-lkp@intel.com/

smatch warnings:
drivers/usb/typec/altmodes/displayport.c:317 dp_altmode_work() warn: inconsistent returns '&dp->lock'.

vim +317 drivers/usb/typec/altmodes/displayport.c

92483f2f3092f0 RD Babiera      2023-12-14  239  
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  240  static void dp_altmode_work(struct work_struct *work)
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  241  {
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  242  	struct dp_altmode *dp = container_of(work, struct dp_altmode, work);
4c93cad8cc78bd Kyle Tso        2021-02-05  243  	int svdm_version;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  244  	u32 header;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  245  	u32 vdo;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  246  	int ret;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  247  
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  248  	mutex_lock(&dp->lock);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  249  
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  250  	switch (dp->state) {
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  251  	case DP_STATE_ENTER:
8face9aa57c833 Heikki Krogerus 2019-12-30  252  		ret = typec_altmode_enter(dp->alt, NULL);
5789051fc57bb6 Heikki Krogerus 2020-09-28  253  		if (ret && ret != -EBUSY)
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  254  			dev_err(&dp->alt->dev, "failed to enter mode\n");
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  255  		break;
92483f2f3092f0 RD Babiera      2023-12-14  256  	case DP_STATE_ENTER_PRIME:
92483f2f3092f0 RD Babiera      2023-12-14  257  		ret = typec_cable_altmode_enter(dp->alt, TYPEC_PLUG_SOP_P, NULL);
92483f2f3092f0 RD Babiera      2023-12-14  258  		/*
92483f2f3092f0 RD Babiera      2023-12-14  259  		 * If we fail to enter Alt Mode on SOP', then we should drop the
92483f2f3092f0 RD Babiera      2023-12-14  260  		 * plug from the driver and attempt to run the driver without
92483f2f3092f0 RD Babiera      2023-12-14  261  		 * it.
92483f2f3092f0 RD Babiera      2023-12-14  262  		 */
92483f2f3092f0 RD Babiera      2023-12-14  263  		if (ret && ret != -EBUSY) {
92483f2f3092f0 RD Babiera      2023-12-14  264  			dev_err(&dp->alt->dev, "plug failed to enter mode\n");
92483f2f3092f0 RD Babiera      2023-12-14  265  			dp->state = DP_STATE_ENTER;
92483f2f3092f0 RD Babiera      2023-12-14  266  			goto disable_prime;
92483f2f3092f0 RD Babiera      2023-12-14  267  		}
92483f2f3092f0 RD Babiera      2023-12-14  268  		break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  269  	case DP_STATE_UPDATE:
4c93cad8cc78bd Kyle Tso        2021-02-05  270  		svdm_version = typec_altmode_get_svdm_version(dp->alt);
4c93cad8cc78bd Kyle Tso        2021-02-05  271  		if (svdm_version < 0)
4c93cad8cc78bd Kyle Tso        2021-02-05  272  			break;
4c93cad8cc78bd Kyle Tso        2021-02-05  273  		header = DP_HEADER(dp, svdm_version, DP_CMD_STATUS_UPDATE);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  274  		vdo = 1;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  275  		ret = typec_altmode_vdm(dp->alt, header, &vdo, 2);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  276  		if (ret)
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  277  			dev_err(&dp->alt->dev,
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  278  				"unable to send Status Update command (%d)\n",
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  279  				ret);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  280  		break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  281  	case DP_STATE_CONFIGURE:
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  282  		ret = dp_altmode_configure_vdm(dp, dp->data.conf);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  283  		if (ret)
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  284  			dev_err(&dp->alt->dev,
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  285  				"unable to send Configure command (%d)\n", ret);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  286  		break;
92483f2f3092f0 RD Babiera      2023-12-14  287  	case DP_STATE_CONFIGURE_PRIME:
92483f2f3092f0 RD Babiera      2023-12-14  288  		ret = dp_altmode_configure_vdm_cable(dp, dp->data_prime.conf);
92483f2f3092f0 RD Babiera      2023-12-14  289  		if (ret) {
92483f2f3092f0 RD Babiera      2023-12-14  290  			dev_err(&dp->plug_prime->dev,
92483f2f3092f0 RD Babiera      2023-12-14  291  				"unable to send Configure command (%d)\n",
92483f2f3092f0 RD Babiera      2023-12-14  292  				ret);
92483f2f3092f0 RD Babiera      2023-12-14  293  			dp->state = DP_STATE_CONFIGURE;
92483f2f3092f0 RD Babiera      2023-12-14  294  			goto disable_prime;
92483f2f3092f0 RD Babiera      2023-12-14  295  		}
92483f2f3092f0 RD Babiera      2023-12-14  296  		break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  297  	case DP_STATE_EXIT:
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  298  		if (typec_altmode_exit(dp->alt))
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  299  			dev_err(&dp->alt->dev, "Exit Mode Failed!\n");
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  300  		break;
92483f2f3092f0 RD Babiera      2023-12-14  301  	case DP_STATE_EXIT_PRIME:
92483f2f3092f0 RD Babiera      2023-12-14  302  		if (typec_cable_altmode_exit(dp->plug_prime, TYPEC_PLUG_SOP_P))
92483f2f3092f0 RD Babiera      2023-12-14  303  			dev_err(&dp->plug_prime->dev, "Exit Mode Failed!\n");
92483f2f3092f0 RD Babiera      2023-12-14  304  		break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  305  	default:
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  306  		break;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  307  	}
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  308  
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  309  	dp->state = DP_STATE_IDLE;
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  310  
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  311  	mutex_unlock(&dp->lock);
92483f2f3092f0 RD Babiera      2023-12-14  312  	return;
92483f2f3092f0 RD Babiera      2023-12-14  313  
92483f2f3092f0 RD Babiera      2023-12-14  314  disable_prime:
92483f2f3092f0 RD Babiera      2023-12-14  315  	typec_altmode_put_plug(dp->plug_prime);
92483f2f3092f0 RD Babiera      2023-12-14  316  	dp->plug_prime = NULL;
92483f2f3092f0 RD Babiera      2023-12-14 @317  	schedule_work(&dp->work);
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  318  }
0e3bb7d6894d9b Heikki Krogerus 2018-06-27  319  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
