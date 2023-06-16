Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADFC3FEC
	for <oe-kbuild@lists.linux.dev>; Fri, 16 Jun 2023 07:05:42 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f738f579ceso2326485e9.3
        for <oe-kbuild@lists.linux.dev>; Fri, 16 Jun 2023 00:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686899140; x=1689491140;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Z6EsF3jva2qg/vtP49sY4cqHTQzHY1XBBCrb4irVz4=;
        b=Ogu4lKPDLebaGhQxp0E96iwSUoK5Bh/3wFbZMlfU/q8KGzh9P/b01y8576OWhZ27av
         9hFGXnLWysopF0AYT75JO2vE+mTHpjWcBUn6uRhNCLReSxk8MK+heo20pAmVTu//dyN2
         CrJADpA0plrJY4AGRgijGIriUc65x/sCzfVYRietNyY7orMJWYsGLSHxqSzCh0RKwtvz
         +buZeEgXm+qqYZOJ84jH9SwVXR93bhg/Mh2zOlEvYYC6VuHxOM0my4dTM0TsuxQTjt1I
         flbGicJuFDC6sDYLE/I56YrJVlMqSYqjny6NeYv+4sIJ0alsKXoo9j7bIVYIv5X2jR/Z
         Q3MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686899140; x=1689491140;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Z6EsF3jva2qg/vtP49sY4cqHTQzHY1XBBCrb4irVz4=;
        b=blnRw8Ve6LLz2pWBTfO8AkZbieMPHFy7nKNMAtRg64rXqByFRJwXN2trILXl0PPdsR
         nDfqtxt1USAL+VuBqGgyAdxCuNcHDe4XllJbWVvtC5qOn/gOuHENayK1Laa7zBZD0w3s
         /GOBhynltjc1PLE0ixNwpyxFX51kD4S9GBkgAlnhW+DUvsilP8K/aRjf5dOXTqD9cylq
         LoD5/5Mr0/4y+1EDeQftW5PI7PfNwKEu8ilb+4YemlZylGVdqhvlqtFOP4xi6euz79mf
         eqFetOZCdNk85S6qr929lG15wIBALfPuRa2VKLrMtfb7jt1oKUd8t4ku5aKqihCI0vPs
         KDnQ==
X-Gm-Message-State: AC+VfDxsFMQsFb9PVcVcYR6m9kWYcwWVNLhQw/2IyO9c/manKHJjQBJR
	PRqDZZ/bsIT0Yl7wIu90PMJCZG0LTHnDvIr1VBM=
X-Google-Smtp-Source: ACHHUZ7XFVCvbPDlfKwIqpF+RcylUMaSduqxMTHbDQvCmW1mnoA/zKBe/rOtgNvBJXV2Q6zmc2xn3Q==
X-Received: by 2002:a05:600c:2295:b0:3f7:5e3:c1f2 with SMTP id 21-20020a05600c229500b003f705e3c1f2mr930834wmf.8.1686899139422;
        Fri, 16 Jun 2023 00:05:39 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s25-20020a1cf219000000b003f41bb52834sm1278730wmc.38.2023.06.16.00.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 00:05:37 -0700 (PDT)
Date: Fri, 16 Jun 2023 10:05:34 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Viresh Kumar <viresh.kumar@linaro.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9802/10326] drivers/opp/core.c:2710
 dev_pm_opp_xlate_performance_state() warn: variable dereferenced before
 check 'src_table' (see line 2698)
Message-ID: <50eb1321-f9ae-4f14-8586-9aa6dc61e6bd@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   925294c9aa184801cc0a451b69a18dd0fe7d847d
commit: 5437756c65c79f9520886bc54321d39c022c8638 [9802/10326] OPP: pstate is only valid for genpd OPP tables
config: i386-randconfig-m021-20230614 (https://download.01.org/0day-ci/archive/20230616/202306160347.AahnsjDj-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202306160347.AahnsjDj-lkp@intel.com/

smatch warnings:
drivers/opp/core.c:2710 dev_pm_opp_xlate_performance_state() warn: variable dereferenced before check 'src_table' (see line 2698)

vim +/src_table +2710 drivers/opp/core.c

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
                                                                      ^^^^^^^^^^^^^^^^^^^
Unchecked dereference

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
                                                             ^^^^^^^^^
Checked too late.

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

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

