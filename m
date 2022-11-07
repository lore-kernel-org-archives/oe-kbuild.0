Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55CA7F
	for <oe-kbuild@lists.linux.dev>; Mon,  7 Nov 2022 09:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1667815019; x=1699351019;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yPhCIwE6jKsuVCXeAN4XX4wks/TsrhP7+IkZSuTAB5U=;
  b=jjX4GxG6/FzFBiKkDN4FdxZmwiYPg4pAqEtljUxNJ2ciZFRUjdOgHQ3p
   rbqlQ24ts6VA5HmEN75usuorIRO5+/XI1XZqfKU0+YWjqkuXLBJ/JV3XB
   BAUpyekwX/zJS78mKT+67eEvvHYbeIBm2kBAKdPSZGWrQGDAzSw6qRuio
   hbMLJxG5TgkSuFPZC2+9RnAm8v364S8c89naplu/svjNPWumzulxrIqo6
   N3Rm0/8a4EvU+5djEe3+3UJi4doWmA9mbU9jCv4Rx7PCgM5uMZJaI6M+/
   mK+9riOaNWHk+weyTMkFtIUICGuy/HNSJH5N56OGqotBVzJ4K3EtahIr5
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="337090490"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="337090490"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2022 01:56:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10523"; a="704813976"
X-IronPort-AV: E=Sophos;i="5.96,143,1665471600"; 
   d="scan'208";a="704813976"
Received: from lkp-server01.sh.intel.com (HELO 462403710aa9) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 07 Nov 2022 01:56:38 -0800
Received: from kbuild by 462403710aa9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1oryrt-0000Wi-1x;
	Mon, 07 Nov 2022 09:56:37 +0000
Date: Mon, 7 Nov 2022 17:56:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/clk/clk-fixed-rate.c:89:7: warning: Redundant initialization
 for 'ret'. The initialized value is overwritten before it is read.
 [redundantInitialization]
Message-ID: <202211071728.PjrCbu7v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/clk/clk-fixed-rate.c:89:7: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Li Zhengyu <lizhengyu3@huawei.com>
CC: Stephen Boyd <sboyd@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   f0c4d9fc9cc9462659728d168387191387e903cc
commit: b69b0adc71637d436883c5ed9bfadbfbb7e02fda clk: fixed-rate: Remove redundant if statement
date:   6 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 6 months ago
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout b69b0adc71637d436883c5ed9bfadbfbb7e02fda
        cppcheck --quiet --enable=style,performance,portability --template=gcc FILE

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> drivers/clk/clk-fixed-rate.c:89:7: warning: Redundant initialization for 'ret'. The initialized value is overwritten before it is read. [redundantInitialization]
     ret = clk_hw_register(dev, hw);
         ^
   drivers/clk/clk-fixed-rate.c:62:10: note: ret is initialized
    int ret = -EINVAL;
            ^
   drivers/clk/clk-fixed-rate.c:89:7: note: ret is overwritten
     ret = clk_hw_register(dev, hw);
         ^

vim +/ret +89 drivers/clk/clk-fixed-rate.c

9d9f78ed9af0e4 Mike Turquette        2012-03-15   51  
2d34f09e79c9e9 Stephen Boyd          2019-08-30   52  struct clk_hw *__clk_hw_register_fixed_rate(struct device *dev,
2d34f09e79c9e9 Stephen Boyd          2019-08-30   53  		struct device_node *np, const char *name,
2d34f09e79c9e9 Stephen Boyd          2019-08-30   54  		const char *parent_name, const struct clk_hw *parent_hw,
2d34f09e79c9e9 Stephen Boyd          2019-08-30   55  		const struct clk_parent_data *parent_data, unsigned long flags,
2d34f09e79c9e9 Stephen Boyd          2019-08-30   56  		unsigned long fixed_rate, unsigned long fixed_accuracy,
2d34f09e79c9e9 Stephen Boyd          2019-08-30   57  		unsigned long clk_fixed_flags)
9d9f78ed9af0e4 Mike Turquette        2012-03-15   58  {
9d9f78ed9af0e4 Mike Turquette        2012-03-15   59  	struct clk_fixed_rate *fixed;
26ef56be9e0944 Stephen Boyd          2016-02-07   60  	struct clk_hw *hw;
cc819cf8d4760f Manivannan Sadhasivam 2019-11-15   61  	struct clk_init_data init = {};
2d34f09e79c9e9 Stephen Boyd          2019-08-30   62  	int ret = -EINVAL;
9d9f78ed9af0e4 Mike Turquette        2012-03-15   63  
27d545915fd49c Mike Turquette        2012-03-26   64  	/* allocate fixed-rate clock */
d122db7e866692 Stephen Boyd          2015-05-14   65  	fixed = kzalloc(sizeof(*fixed), GFP_KERNEL);
d122db7e866692 Stephen Boyd          2015-05-14   66  	if (!fixed)
9d9f78ed9af0e4 Mike Turquette        2012-03-15   67  		return ERR_PTR(-ENOMEM);
9d9f78ed9af0e4 Mike Turquette        2012-03-15   68  
0197b3ea0f66cd Saravana Kannan       2012-04-25   69  	init.name = name;
0197b3ea0f66cd Saravana Kannan       2012-04-25   70  	init.ops = &clk_fixed_rate_ops;
90b6c5c73c6904 Stephen Boyd          2019-04-25   71  	init.flags = flags;
2d34f09e79c9e9 Stephen Boyd          2019-08-30   72  	init.parent_names = parent_name ? &parent_name : NULL;
2d34f09e79c9e9 Stephen Boyd          2019-08-30   73  	init.parent_hws = parent_hw ? &parent_hw : NULL;
2d34f09e79c9e9 Stephen Boyd          2019-08-30   74  	init.parent_data = parent_data;
2d34f09e79c9e9 Stephen Boyd          2019-08-30   75  	if (parent_name || parent_hw || parent_data)
2d34f09e79c9e9 Stephen Boyd          2019-08-30   76  		init.num_parents = 1;
2d34f09e79c9e9 Stephen Boyd          2019-08-30   77  	else
2d34f09e79c9e9 Stephen Boyd          2019-08-30   78  		init.num_parents = 0;
0197b3ea0f66cd Saravana Kannan       2012-04-25   79  
9d9f78ed9af0e4 Mike Turquette        2012-03-15   80  	/* struct clk_fixed_rate assignments */
2d34f09e79c9e9 Stephen Boyd          2019-08-30   81  	fixed->flags = clk_fixed_flags;
9d9f78ed9af0e4 Mike Turquette        2012-03-15   82  	fixed->fixed_rate = fixed_rate;
0903ea60173fab Boris Brezillon       2013-12-21   83  	fixed->fixed_accuracy = fixed_accuracy;
0197b3ea0f66cd Saravana Kannan       2012-04-25   84  	fixed->hw.init = &init;
9d9f78ed9af0e4 Mike Turquette        2012-03-15   85  
27d545915fd49c Mike Turquette        2012-03-26   86  	/* register the clock */
26ef56be9e0944 Stephen Boyd          2016-02-07   87  	hw = &fixed->hw;
2d34f09e79c9e9 Stephen Boyd          2019-08-30   88  	if (dev || !np)
26ef56be9e0944 Stephen Boyd          2016-02-07  @89  		ret = clk_hw_register(dev, hw);
b69b0adc71637d Li Zhengyu            2022-05-09   90  	else
2d34f09e79c9e9 Stephen Boyd          2019-08-30   91  		ret = of_clk_hw_register(np, hw);
26ef56be9e0944 Stephen Boyd          2016-02-07   92  	if (ret) {
27d545915fd49c Mike Turquette        2012-03-26   93  		kfree(fixed);
26ef56be9e0944 Stephen Boyd          2016-02-07   94  		hw = ERR_PTR(ret);
26ef56be9e0944 Stephen Boyd          2016-02-07   95  	}
26ef56be9e0944 Stephen Boyd          2016-02-07   96  
26ef56be9e0944 Stephen Boyd          2016-02-07   97  	return hw;
26ef56be9e0944 Stephen Boyd          2016-02-07   98  }
2d34f09e79c9e9 Stephen Boyd          2019-08-30   99  EXPORT_SYMBOL_GPL(__clk_hw_register_fixed_rate);
26ef56be9e0944 Stephen Boyd          2016-02-07  100  

:::::: The code at line 89 was first introduced by commit
:::::: 26ef56be9e0944a9b136169eb47140f309ce745b clk: fixed-rate: Add hw based registration APIs

:::::: TO: Stephen Boyd <sboyd@codeaurora.org>
:::::: CC: Stephen Boyd <sboyd@codeaurora.org>

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
