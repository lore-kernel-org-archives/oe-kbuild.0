Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26758EAF7
	for <oe-kbuild@lists.linux.dev>; Thu, 15 Jun 2023 19:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1686859015; x=1718395015;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QK0TOBsdXm08WZtc0dJZhPdZgTWkV/CZxFMQUTQhLjs=;
  b=jf8P5uhBcr7w8xAqncIaHG++K4LRzHRU7b1JbwpvcFqCDdTyyiQqdkwl
   wNY0JSZJSTMbxZh98mm+hxgD1MUV6/c1iA0g8H2/sFw9mzBXzswCnzTff
   E+9+8dTPrpWR/UDfmjtjUHkIJyHV8gJot91gDru3JCoNHof0wei/UNoy/
   tUlQODXGKtFMSU7AaGw2J3lL7CmL8dJJ4u+AOhsnd3rEFqtU8YLJvwgv+
   k5Bn9uSwuTW900AmA2k22dm2rr/hEiry1mY7E85CN17CRg/uAiSYuQQc+
   dMqDLW9kx0AXmzgzk7/3365v6hRuZe41QVugWHdfbqujsV1paAIxqP1tU
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="362443450"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="362443450"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 12:56:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10742"; a="782615953"
X-IronPort-AV: E=Sophos;i="6.00,245,1681196400"; 
   d="scan'208";a="782615953"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 15 Jun 2023 12:56:48 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q9t5M-0000L6-06;
	Thu, 15 Jun 2023 19:56:48 +0000
Date: Fri, 16 Jun 2023 03:56:04 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 9802/10326] drivers/opp/core.c:2710
 dev_pm_opp_xlate_performance_state() warn: variable dereferenced before
 check 'src_table' (see line 2698)
Message-ID: <202306160347.AahnsjDj-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Viresh Kumar <viresh.kumar@linaro.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   925294c9aa184801cc0a451b69a18dd0fe7d847d
commit: 5437756c65c79f9520886bc54321d39c022c8638 [9802/10326] OPP: pstate is only valid for genpd OPP tables
:::::: branch date: 15 hours ago
:::::: commit date: 33 hours ago
config: i386-randconfig-m021-20230614 (https://download.01.org/0day-ci/archive/20230616/202306160347.AahnsjDj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306160347.AahnsjDj-lkp@intel.com/

smatch warnings:
drivers/opp/core.c:2710 dev_pm_opp_xlate_performance_state() warn: variable dereferenced before check 'src_table' (see line 2698)

vim +/src_table +2710 drivers/opp/core.c

7d8658ef65a4f8 Saravana Kannan 2021-02-04  2675  
c8a59103e22b19 Viresh Kumar    2018-11-02  2676  /**
c8a59103e22b19 Viresh Kumar    2018-11-02  2677   * dev_pm_opp_xlate_performance_state() - Find required OPP's pstate for src_table.
c8a59103e22b19 Viresh Kumar    2018-11-02  2678   * @src_table: OPP table which has dst_table as one of its required OPP table.
c8a59103e22b19 Viresh Kumar    2018-11-02  2679   * @dst_table: Required OPP table of the src_table.
c8a59103e22b19 Viresh Kumar    2018-11-02  2680   * @pstate: Current performance state of the src_table.
c8a59103e22b19 Viresh Kumar    2018-11-02  2681   *
c8a59103e22b19 Viresh Kumar    2018-11-02  2682   * This Returns pstate of the OPP (present in @dst_table) pointed out by the
c8a59103e22b19 Viresh Kumar    2018-11-02  2683   * "required-opps" property of the OPP (present in @src_table) which has
c8a59103e22b19 Viresh Kumar    2018-11-02  2684   * performance state set to @pstate.
c8a59103e22b19 Viresh Kumar    2018-11-02  2685   *
c8a59103e22b19 Viresh Kumar    2018-11-02  2686   * Return: Zero or positive performance state on success, otherwise negative
c8a59103e22b19 Viresh Kumar    2018-11-02  2687   * value on errors.
c8a59103e22b19 Viresh Kumar    2018-11-02  2688   */
c8a59103e22b19 Viresh Kumar    2018-11-02  2689  int dev_pm_opp_xlate_performance_state(struct opp_table *src_table,
c8a59103e22b19 Viresh Kumar    2018-11-02  2690  				       struct opp_table *dst_table,
c8a59103e22b19 Viresh Kumar    2018-11-02  2691  				       unsigned int pstate)
c8a59103e22b19 Viresh Kumar    2018-11-02  2692  {
c8a59103e22b19 Viresh Kumar    2018-11-02  2693  	struct dev_pm_opp *opp;
c8a59103e22b19 Viresh Kumar    2018-11-02  2694  	int dest_pstate = -EINVAL;
c8a59103e22b19 Viresh Kumar    2018-11-02  2695  	int i;
c8a59103e22b19 Viresh Kumar    2018-11-02  2696  
5437756c65c79f Viresh Kumar    2023-06-14  2697  	/* Both OPP tables must belong to genpds */
5437756c65c79f Viresh Kumar    2023-06-14 @2698  	if (unlikely(!src_table->is_genpd || !dst_table->is_genpd)) {
5437756c65c79f Viresh Kumar    2023-06-14  2699  		pr_err("%s: Performance state is only valid for genpds.\n", __func__);
5437756c65c79f Viresh Kumar    2023-06-14  2700  		return -EINVAL;
5437756c65c79f Viresh Kumar    2023-06-14  2701  	}
5437756c65c79f Viresh Kumar    2023-06-14  2702  
c8a59103e22b19 Viresh Kumar    2018-11-02  2703  	/*
c8a59103e22b19 Viresh Kumar    2018-11-02  2704  	 * Normally the src_table will have the "required_opps" property set to
c8a59103e22b19 Viresh Kumar    2018-11-02  2705  	 * point to one of the OPPs in the dst_table, but in some cases the
c8a59103e22b19 Viresh Kumar    2018-11-02  2706  	 * genpd and its master have one to one mapping of performance states
c8a59103e22b19 Viresh Kumar    2018-11-02  2707  	 * and so none of them have the "required-opps" property set. Return the
c8a59103e22b19 Viresh Kumar    2018-11-02  2708  	 * pstate of the src_table as it is in such cases.
c8a59103e22b19 Viresh Kumar    2018-11-02  2709  	 */
f2f4d2b86f432f Dmitry Osipenko 2021-01-18 @2710  	if (!src_table || !src_table->required_opp_count)
c8a59103e22b19 Viresh Kumar    2018-11-02  2711  		return pstate;
c8a59103e22b19 Viresh Kumar    2018-11-02  2712  
7eba0c7641b000 Viresh Kumar    2019-11-25  2713  	/* required-opps not fully initialized yet */
7eba0c7641b000 Viresh Kumar    2019-11-25  2714  	if (lazy_linking_pending(src_table))
7eba0c7641b000 Viresh Kumar    2019-11-25  2715  		return -EBUSY;
7eba0c7641b000 Viresh Kumar    2019-11-25  2716  
c8a59103e22b19 Viresh Kumar    2018-11-02  2717  	for (i = 0; i < src_table->required_opp_count; i++) {
c8a59103e22b19 Viresh Kumar    2018-11-02  2718  		if (src_table->required_opp_tables[i]->np == dst_table->np)
c8a59103e22b19 Viresh Kumar    2018-11-02  2719  			break;
c8a59103e22b19 Viresh Kumar    2018-11-02  2720  	}
c8a59103e22b19 Viresh Kumar    2018-11-02  2721  
c8a59103e22b19 Viresh Kumar    2018-11-02  2722  	if (unlikely(i == src_table->required_opp_count)) {
c8a59103e22b19 Viresh Kumar    2018-11-02  2723  		pr_err("%s: Couldn't find matching OPP table (%p: %p)\n",
c8a59103e22b19 Viresh Kumar    2018-11-02  2724  		       __func__, src_table, dst_table);
c8a59103e22b19 Viresh Kumar    2018-11-02  2725  		return -EINVAL;
c8a59103e22b19 Viresh Kumar    2018-11-02  2726  	}
c8a59103e22b19 Viresh Kumar    2018-11-02  2727  
c8a59103e22b19 Viresh Kumar    2018-11-02  2728  	mutex_lock(&src_table->lock);
c8a59103e22b19 Viresh Kumar    2018-11-02  2729  
c8a59103e22b19 Viresh Kumar    2018-11-02  2730  	list_for_each_entry(opp, &src_table->opp_list, node) {
c8a59103e22b19 Viresh Kumar    2018-11-02  2731  		if (opp->pstate == pstate) {
c8a59103e22b19 Viresh Kumar    2018-11-02  2732  			dest_pstate = opp->required_opps[i]->pstate;
c8a59103e22b19 Viresh Kumar    2018-11-02  2733  			goto unlock;
c8a59103e22b19 Viresh Kumar    2018-11-02  2734  		}
c8a59103e22b19 Viresh Kumar    2018-11-02  2735  	}
c8a59103e22b19 Viresh Kumar    2018-11-02  2736  
c8a59103e22b19 Viresh Kumar    2018-11-02  2737  	pr_err("%s: Couldn't find matching OPP (%p: %p)\n", __func__, src_table,
c8a59103e22b19 Viresh Kumar    2018-11-02  2738  	       dst_table);
c8a59103e22b19 Viresh Kumar    2018-11-02  2739  
c8a59103e22b19 Viresh Kumar    2018-11-02  2740  unlock:
c8a59103e22b19 Viresh Kumar    2018-11-02  2741  	mutex_unlock(&src_table->lock);
c8a59103e22b19 Viresh Kumar    2018-11-02  2742  
c8a59103e22b19 Viresh Kumar    2018-11-02  2743  	return dest_pstate;
c8a59103e22b19 Viresh Kumar    2018-11-02  2744  }
c8a59103e22b19 Viresh Kumar    2018-11-02  2745  

:::::: The code at line 2710 was first introduced by commit
:::::: f2f4d2b86f432fecfd76afa5f4f60f47833121b5 opp: Handle missing OPP table in dev_pm_opp_xlate_performance_state()

:::::: TO: Dmitry Osipenko <digetx@gmail.com>
:::::: CC: Viresh Kumar <viresh.kumar@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
