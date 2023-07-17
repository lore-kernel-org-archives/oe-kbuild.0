Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 039B579D0
	for <oe-kbuild@lists.linux.dev>; Mon, 17 Jul 2023 06:19:21 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-307d20548adso4030310f8f.0
        for <oe-kbuild@lists.linux.dev>; Sun, 16 Jul 2023 23:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689574759; x=1692166759;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RPGZ2oFzdCjeZEXWABnDj5o51xk1l7c9EWg2MoZVhBo=;
        b=KbVMCw4eZumDj8uS4pGyXeO1pN1pC/TOkwAjkdg16r6dDi5gYqKBWtbAAwaor8qrDv
         FTrzekR69n9IWLCv17iLW/CQK6ZCdb4k00kM/qZ6F4cqaySXjATzkes28ASNvLq93Ffm
         EgD9t4RadPaz5GUVk11vqc+WK1AeCbim7FEG9BVC7hLyKdsjsei2o2yanGfVl+GKUA9b
         tcW19qaVy8vPPhpFE4SXN0yLauqQi2wJ3Bzsp4QAZSTCY3wzr18nu7nXA51kRqVzZprf
         Sb2iuC+kZW1X8P71zu8P1RecBw8GSnehSwpU3UTnEs689BOr935OcLJwYF+6TE/P+0ql
         vInw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689574759; x=1692166759;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RPGZ2oFzdCjeZEXWABnDj5o51xk1l7c9EWg2MoZVhBo=;
        b=bQwrrAd1/iAutWXLvswfmy0pZtlLBX1mogUOAfo2ieU1bKUFBIDsvn3pXiHvLyG/R7
         bVUMKKPHnGgA49okaBPkzOMhWiDiwv2nd7J8zsqIIPDAs3zJE2O8w1rQe+Q8W1FLjav+
         iqPjcj5YXmTbGemth9gR+phNW0ztBTzfgSITMfTvIeEsqulVhxWEjIA4lE6A4zrUb95B
         CWVdcORv6i7TrDkUbu1lz5K+QAW53a8oQeHblKaSOa8LDPauoJB0sVj080frnQPC171d
         qanNLsq+72d97xLjVHv9uyg0/pUtqiWyroN2JBozEj2U3fs+EsrI1QtjyN2UxXCe1qo1
         idaQ==
X-Gm-Message-State: ABy/qLYVB8Mn6XcA99uqBA2R52zmQWwm/xd+ZzMpHSiwBzyCHdTvPZ16
	qw6zQVsbPeYLZ6ExPU4VLfCRQE2jeN+y9rrTc8o=
X-Google-Smtp-Source: APBJJlEwzxfZPZQnlgj2t6YDoY1vXUeGlIg0q0nJkudeXu3F3ski6q2NHsKiTEBJry8zvpwiTGgVDg==
X-Received: by 2002:a5d:4564:0:b0:306:46c4:d313 with SMTP id a4-20020a5d4564000000b0030646c4d313mr8870156wrc.28.1689574758809;
        Sun, 16 Jul 2023 23:19:18 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y3-20020a056000108300b003141f96ed36sm18185081wrw.0.2023.07.16.23.19.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 23:19:17 -0700 (PDT)
Date: Mon, 17 Jul 2023 09:19:14 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Sasha Levin <sashal@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [sashal-stable:pending-6.1 476/494] block/blk-cgroup.c:1258
 blkcg_css_alloc() error: uninitialized symbol 'ret'.
Message-ID: <3c5bfa7d-04f3-4322-890a-2bad1175bfdd@kadam.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable.git pending-6.1
head:   8ed10e3be3d7f6905f1a98b67b823e83668664e3
commit: f73586085d021950507a5d20f7288a9f092589f0 [476/494] blk-cgroup: Optimize blkcg_rstat_flush()
config: x86_64-randconfig-m001-20230713 (https://download.01.org/0day-ci/archive/20230715/202307151941.rN09QKcs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230715/202307151941.rN09QKcs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202307151941.rN09QKcs-lkp@intel.com/

smatch warnings:
block/blk-cgroup.c:1258 blkcg_css_alloc() error: uninitialized symbol 'ret'.

vim +/ret +1258 block/blk-cgroup.c

eb95419b023aba Tejun Heo        2013-08-08  1189  static struct cgroup_subsys_state *
eb95419b023aba Tejun Heo        2013-08-08  1190  blkcg_css_alloc(struct cgroup_subsys_state *parent_css)
31e4c28d95e64f Vivek Goyal      2009-12-03  1191  {
3c798398e393e5 Tejun Heo        2012-04-16  1192  	struct blkcg *blkcg;
e48453c386f39c Arianna Avanzini 2015-06-05  1193  	struct cgroup_subsys_state *ret;
e48453c386f39c Arianna Avanzini 2015-06-05  1194  	int i;
31e4c28d95e64f Vivek Goyal      2009-12-03  1195  
7876f930d0e78a Tejun Heo        2015-07-09  1196  	mutex_lock(&blkcg_pol_mutex);
7876f930d0e78a Tejun Heo        2015-07-09  1197  
eb95419b023aba Tejun Heo        2013-08-08  1198  	if (!parent_css) {
3c798398e393e5 Tejun Heo        2012-04-16  1199  		blkcg = &blkcg_root;
bc915e61cde25d Tejun Heo        2015-08-18  1200  	} else {
31e4c28d95e64f Vivek Goyal      2009-12-03  1201  		blkcg = kzalloc(sizeof(*blkcg), GFP_KERNEL);
e48453c386f39c Arianna Avanzini 2015-06-05  1202  		if (!blkcg) {
e48453c386f39c Arianna Avanzini 2015-06-05  1203  			ret = ERR_PTR(-ENOMEM);
4c18c9e962eb02 weiping zhang    2017-08-25  1204  			goto unlock;
e48453c386f39c Arianna Avanzini 2015-06-05  1205  		}
bc915e61cde25d Tejun Heo        2015-08-18  1206  	}
e48453c386f39c Arianna Avanzini 2015-06-05  1207  
f73586085d0219 Waiman Long      2022-11-04  1208  	if (init_blkcg_llists(blkcg))
f73586085d0219 Waiman Long      2022-11-04  1209  		goto free_blkcg;

"ret" not initialized.

f73586085d0219 Waiman Long      2022-11-04  1210  
e48453c386f39c Arianna Avanzini 2015-06-05  1211  	for (i = 0; i < BLKCG_MAX_POLS ; i++) {
e48453c386f39c Arianna Avanzini 2015-06-05  1212  		struct blkcg_policy *pol = blkcg_policy[i];
e48453c386f39c Arianna Avanzini 2015-06-05  1213  		struct blkcg_policy_data *cpd;
e48453c386f39c Arianna Avanzini 2015-06-05  1214  
e48453c386f39c Arianna Avanzini 2015-06-05  1215  		/*
e48453c386f39c Arianna Avanzini 2015-06-05  1216  		 * If the policy hasn't been attached yet, wait for it
e48453c386f39c Arianna Avanzini 2015-06-05  1217  		 * to be attached before doing anything else. Otherwise,
e48453c386f39c Arianna Avanzini 2015-06-05  1218  		 * check if the policy requires any specific per-cgroup
e48453c386f39c Arianna Avanzini 2015-06-05  1219  		 * data: if it does, allocate and initialize it.
e48453c386f39c Arianna Avanzini 2015-06-05  1220  		 */
e4a9bde9589fdc Tejun Heo        2015-08-18  1221  		if (!pol || !pol->cpd_alloc_fn)
e48453c386f39c Arianna Avanzini 2015-06-05  1222  			continue;
e48453c386f39c Arianna Avanzini 2015-06-05  1223  
e4a9bde9589fdc Tejun Heo        2015-08-18  1224  		cpd = pol->cpd_alloc_fn(GFP_KERNEL);
e48453c386f39c Arianna Avanzini 2015-06-05  1225  		if (!cpd) {
e48453c386f39c Arianna Avanzini 2015-06-05  1226  			ret = ERR_PTR(-ENOMEM);
e48453c386f39c Arianna Avanzini 2015-06-05  1227  			goto free_pd_blkcg;
e48453c386f39c Arianna Avanzini 2015-06-05  1228  		}
814376483e7d85 Tejun Heo        2015-08-18  1229  		blkcg->cpd[i] = cpd;
814376483e7d85 Tejun Heo        2015-08-18  1230  		cpd->blkcg = blkcg;
e48453c386f39c Arianna Avanzini 2015-06-05  1231  		cpd->plid = i;
e4a9bde9589fdc Tejun Heo        2015-08-18  1232  		if (pol->cpd_init_fn)
814376483e7d85 Tejun Heo        2015-08-18  1233  			pol->cpd_init_fn(cpd);
e48453c386f39c Arianna Avanzini 2015-06-05  1234  	}
31e4c28d95e64f Vivek Goyal      2009-12-03  1235  
31e4c28d95e64f Vivek Goyal      2009-12-03  1236  	spin_lock_init(&blkcg->lock);
d866dbf6178713 Tejun Heo        2019-07-24  1237  	refcount_set(&blkcg->online_pin, 1);
e00f4f4d0ff7e1 Tejun Heo        2016-11-21  1238  	INIT_RADIX_TREE(&blkcg->blkg_tree, GFP_NOWAIT | __GFP_NOWARN);
31e4c28d95e64f Vivek Goyal      2009-12-03  1239  	INIT_HLIST_HEAD(&blkcg->blkg_list);
52ebea749aaed1 Tejun Heo        2015-05-22  1240  #ifdef CONFIG_CGROUP_WRITEBACK
52ebea749aaed1 Tejun Heo        2015-05-22  1241  	INIT_LIST_HEAD(&blkcg->cgwb_list);
52ebea749aaed1 Tejun Heo        2015-05-22  1242  #endif
7876f930d0e78a Tejun Heo        2015-07-09  1243  	list_add_tail(&blkcg->all_blkcgs_node, &all_blkcgs);
7876f930d0e78a Tejun Heo        2015-07-09  1244  
7876f930d0e78a Tejun Heo        2015-07-09  1245  	mutex_unlock(&blkcg_pol_mutex);
31e4c28d95e64f Vivek Goyal      2009-12-03  1246  	return &blkcg->css;
e48453c386f39c Arianna Avanzini 2015-06-05  1247  
e48453c386f39c Arianna Avanzini 2015-06-05  1248  free_pd_blkcg:
e48453c386f39c Arianna Avanzini 2015-06-05  1249  	for (i--; i >= 0; i--)
e4a9bde9589fdc Tejun Heo        2015-08-18  1250  		if (blkcg->cpd[i])
e4a9bde9589fdc Tejun Heo        2015-08-18  1251  			blkcg_policy[i]->cpd_free_fn(blkcg->cpd[i]);
f73586085d0219 Waiman Long      2022-11-04  1252  	free_percpu(blkcg->lhead);
f73586085d0219 Waiman Long      2022-11-04  1253  free_blkcg:
4c18c9e962eb02 weiping zhang    2017-08-25  1254  	if (blkcg != &blkcg_root)
e48453c386f39c Arianna Avanzini 2015-06-05  1255  		kfree(blkcg);
4c18c9e962eb02 weiping zhang    2017-08-25  1256  unlock:
7876f930d0e78a Tejun Heo        2015-07-09  1257  	mutex_unlock(&blkcg_pol_mutex);
e48453c386f39c Arianna Avanzini 2015-06-05 @1258  	return ret;
31e4c28d95e64f Vivek Goyal      2009-12-03  1259  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

