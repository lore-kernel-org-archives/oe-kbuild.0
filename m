Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907B5111AF
	for <oe-kbuild@lists.linux.dev>; Mon,  3 Jul 2023 20:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688415566; x=1719951566;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=qG3WYTArhnsBH7NvJPB+GHgqgGW9WhBpUGv6LQPNe5U=;
  b=XVFgXJ+V3Q60l0mbMot8FcdljG6HVi++JUAt46vtbC4FGKaiyDVRxUKt
   1QJSI19koVs11FpcmHWAHx0K2dDVFVJyEH404geR3HS5y9qn8HKHVdnG6
   aVxougn4m3lNmEY2FWuzorhLRggWpkzO+NaK86P4UQ82r0CBqT47LbXqc
   Q9UvxiVcSBAF90lCD8wqMKT9JzT5uPpEeXJQ/4PE+JUEnItEyyJubpBr2
   VoKOKa3nIERKeF40zO+mWjbfETAeKdU0msYs35LOhwFFAkE5dd0rj1GLc
   bLqr/DQuWPM7Pqpcx8ROV7gv04g+XdJOFwUGLkjIVwN3zXk1zwBDp69kM
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="362999803"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="362999803"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 13:19:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="808697564"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="808697564"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Jul 2023 13:19:22 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGQ13-000HdT-1l;
	Mon, 03 Jul 2023 20:19:21 +0000
Date: Tue, 4 Jul 2023 04:19:19 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3 5/8] clk: sunxi-ng: nkm: Support finding closest rate
Message-ID: <202307040351.19rZm4kd-lkp@intel.com>
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
In-Reply-To: <20230702-pll-mipi_set_rate_parent-v3-5-46dcb8aa9cbc@oltmanns.dev>
References: <20230702-pll-mipi_set_rate_parent-v3-5-46dcb8aa9cbc@oltmanns.dev>
TO: Frank Oltmanns <frank@oltmanns.dev>
TO: Maxime Ripard <maxime@cerno.tech>
TO: Michael Turquette <mturquette@baylibre.com>
TO: Stephen Boyd <sboyd@kernel.org>
TO: "Chen-Yu Tsai" <wens@csie.org>
TO: Jernej Skrabec <jernej.skrabec@gmail.com>
TO: Samuel Holland <samuel@sholland.org>
TO: Andre Przywara <andre.przywara@arm.com>
TO: Roman Beranek <me@crly.cz>
CC: linux-clk@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-sunxi@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: Frank Oltmanns <frank@oltmanns.dev>

Hi Frank,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 6995e2de6891c724bfeb2db33d7b87775f913ad1]

url:    https://github.com/intel-lab-lkp/linux/commits/Frank-Oltmanns/clk-sunxi-ng-nkm-consider-alternative-parent-rates-when-determining-rate/20230703-015726
base:   6995e2de6891c724bfeb2db33d7b87775f913ad1
patch link:    https://lore.kernel.org/r/20230702-pll-mipi_set_rate_parent-v3-5-46dcb8aa9cbc%40oltmanns.dev
patch subject: [PATCH v3 5/8] clk: sunxi-ng: nkm: Support finding closest rate
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: riscv-randconfig-m031-20230703 (https://download.01.org/0day-ci/archive/20230704/202307040351.19rZm4kd-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230704/202307040351.19rZm4kd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202307040351.19rZm4kd-lkp@intel.com/

smatch warnings:
drivers/clk/sunxi-ng/ccu_nkm.c:46 ccu_nkm_find_best_with_parent_adj() error: uninitialized symbol 'tmp_diff'.
drivers/clk/sunxi-ng/ccu_nkm.c:93 ccu_nkm_find_best() error: uninitialized symbol 'tmp_diff'.

vim +/tmp_diff +46 drivers/clk/sunxi-ng/ccu_nkm.c

df6561e60244c0 Maxime Ripard  2016-06-29   19  
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   20  static unsigned long ccu_nkm_find_best_with_parent_adj(unsigned long *parent, unsigned long rate,
8e5b4aea92912f Frank Oltmanns 2023-07-02   21  						       struct _ccu_nkm *nkm, struct clk_hw *phw,
8e5b4aea92912f Frank Oltmanns 2023-07-02   22  						       unsigned long features)
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   23  {
8e5b4aea92912f Frank Oltmanns 2023-07-02   24  	unsigned long best_rate = 0, best_parent_rate = 0, tmp_parent = *parent;
8e5b4aea92912f Frank Oltmanns 2023-07-02   25  	unsigned long best_diff = ULONG_MAX;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   26  	unsigned long best_n = 0, best_k = 0, best_m = 0;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   27  	unsigned long _n, _k, _m;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   28  
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   29  	for (_k = nkm->min_k; _k <= nkm->max_k; _k++) {
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   30  		for (_n = nkm->min_n; _n <= nkm->max_n; _n++) {
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   31  			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   32  				unsigned long tmp_rate;
8e5b4aea92912f Frank Oltmanns 2023-07-02   33  				unsigned long tmp_diff;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   34  
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   35  				tmp_parent = clk_hw_round_rate(phw, rate * _m / (_n * _k));
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   36  
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   37  				tmp_rate = tmp_parent * _n * _k / _m;
8e5b4aea92912f Frank Oltmanns 2023-07-02   38  
8e5b4aea92912f Frank Oltmanns 2023-07-02   39  				if (features & CCU_FEATURE_CLOSEST_RATE) {
8e5b4aea92912f Frank Oltmanns 2023-07-02   40  					tmp_diff = rate > tmp_rate ?
8e5b4aea92912f Frank Oltmanns 2023-07-02   41  						   rate - tmp_rate :
8e5b4aea92912f Frank Oltmanns 2023-07-02   42  						   tmp_rate - rate;
8e5b4aea92912f Frank Oltmanns 2023-07-02   43  				} else {
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   44  					if (tmp_rate > rate)
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   45  						continue;
8e5b4aea92912f Frank Oltmanns 2023-07-02  @46  					tmp_diff = rate - tmp_diff;
8e5b4aea92912f Frank Oltmanns 2023-07-02   47  				}
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   48  
8e5b4aea92912f Frank Oltmanns 2023-07-02   49  				if (tmp_diff < best_diff) {
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   50  					best_rate = tmp_rate;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   51  					best_parent_rate = tmp_parent;
8e5b4aea92912f Frank Oltmanns 2023-07-02   52  					best_diff = tmp_diff;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   53  					best_n = _n;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   54  					best_k = _k;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   55  					best_m = _m;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   56  				}
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   57  			}
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   58  		}
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   59  	}
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   60  
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   61  	nkm->n = best_n;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   62  	nkm->k = best_k;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   63  	nkm->m = best_m;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   64  
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   65  	*parent = best_parent_rate;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   66  
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   67  	return best_rate;
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   68  }
8a97d9f6cbb457 Frank Oltmanns 2023-07-02   69  
657f477a89acb2 Samuel Holland 2022-12-31   70  static unsigned long ccu_nkm_find_best(unsigned long parent, unsigned long rate,
8e5b4aea92912f Frank Oltmanns 2023-07-02   71  				       struct _ccu_nkm *nkm, unsigned long features)
df6561e60244c0 Maxime Ripard  2016-06-29   72  {
df6561e60244c0 Maxime Ripard  2016-06-29   73  	unsigned long best_rate = 0;
8e5b4aea92912f Frank Oltmanns 2023-07-02   74  	unsigned long best_diff = ULONG_MAX;
df6561e60244c0 Maxime Ripard  2016-06-29   75  	unsigned long best_n = 0, best_k = 0, best_m = 0;
df6561e60244c0 Maxime Ripard  2016-06-29   76  	unsigned long _n, _k, _m;
df6561e60244c0 Maxime Ripard  2016-06-29   77  
6e0d50daa97f4b Maxime Ripard  2016-09-29   78  	for (_k = nkm->min_k; _k <= nkm->max_k; _k++) {
6e0d50daa97f4b Maxime Ripard  2016-09-29   79  		for (_n = nkm->min_n; _n <= nkm->max_n; _n++) {
6e0d50daa97f4b Maxime Ripard  2016-09-29   80  			for (_m = nkm->min_m; _m <= nkm->max_m; _m++) {
df6561e60244c0 Maxime Ripard  2016-06-29   81  				unsigned long tmp_rate;
8e5b4aea92912f Frank Oltmanns 2023-07-02   82  				unsigned long tmp_diff;
df6561e60244c0 Maxime Ripard  2016-06-29   83  
df6561e60244c0 Maxime Ripard  2016-06-29   84  				tmp_rate = parent * _n * _k / _m;
df6561e60244c0 Maxime Ripard  2016-06-29   85  
8e5b4aea92912f Frank Oltmanns 2023-07-02   86  				if (features & CCU_FEATURE_CLOSEST_RATE) {
8e5b4aea92912f Frank Oltmanns 2023-07-02   87  					tmp_diff = rate > tmp_rate ?
8e5b4aea92912f Frank Oltmanns 2023-07-02   88  						   rate - tmp_rate :
8e5b4aea92912f Frank Oltmanns 2023-07-02   89  						   tmp_rate - rate;
8e5b4aea92912f Frank Oltmanns 2023-07-02   90  				} else {
df6561e60244c0 Maxime Ripard  2016-06-29   91  					if (tmp_rate > rate)
df6561e60244c0 Maxime Ripard  2016-06-29   92  						continue;
8e5b4aea92912f Frank Oltmanns 2023-07-02  @93  					tmp_diff = rate - tmp_diff;
8e5b4aea92912f Frank Oltmanns 2023-07-02   94  				}
8e5b4aea92912f Frank Oltmanns 2023-07-02   95  
8e5b4aea92912f Frank Oltmanns 2023-07-02   96  				if (tmp_diff < best_diff) {
df6561e60244c0 Maxime Ripard  2016-06-29   97  					best_rate = tmp_rate;
8e5b4aea92912f Frank Oltmanns 2023-07-02   98  					best_diff = tmp_diff;
df6561e60244c0 Maxime Ripard  2016-06-29   99  					best_n = _n;
df6561e60244c0 Maxime Ripard  2016-06-29  100  					best_k = _k;
df6561e60244c0 Maxime Ripard  2016-06-29  101  					best_m = _m;
df6561e60244c0 Maxime Ripard  2016-06-29  102  				}
df6561e60244c0 Maxime Ripard  2016-06-29  103  			}
ee28648cb2b4d4 Maxime Ripard  2016-09-29  104  		}
ee28648cb2b4d4 Maxime Ripard  2016-09-29  105  	}
df6561e60244c0 Maxime Ripard  2016-06-29  106  
df6561e60244c0 Maxime Ripard  2016-06-29  107  	nkm->n = best_n;
df6561e60244c0 Maxime Ripard  2016-06-29  108  	nkm->k = best_k;
df6561e60244c0 Maxime Ripard  2016-06-29  109  	nkm->m = best_m;
657f477a89acb2 Samuel Holland 2022-12-31  110  
657f477a89acb2 Samuel Holland 2022-12-31  111  	return best_rate;
df6561e60244c0 Maxime Ripard  2016-06-29  112  }
df6561e60244c0 Maxime Ripard  2016-06-29  113  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
