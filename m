Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63D636EB7C
	for <oe-kbuild@lists.linux.dev>; Sat, 25 Jan 2025 19:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737832720; cv=none; b=TgqUbCRbrM7jquKrmaonZ6zyGr47Vrspn0yxbscqT1sO7SDjR5OQv2/JjkMf/DuCs7YD21kw4SrI5oHVBz4eVelWyUGHNGvghls33PE86wkTLmPa7aNcwq/pJaZTtdcN7SoaVcitNVldpm0/M+wR9RWsky41Frjh4tKC1InZ8fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737832720; c=relaxed/simple;
	bh=PDzKbxPO/e85Ts3rHpmoofB8vYFxNpDdpLYpsCEHBBQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VyK8jPN0Xl+fx59ThPxOmGnPp4ZUpJ2PXW8cQuI9geowpq7JSXlaaZJvy89GPAxstPochzXUtI3+uTZsG3T9K5IqmHRcJ3UyXZqOIN57MfIsepArlpDnkihSCcelW2QOekrid0XAcyMA7Wb6lyBuZdn5Pkl00ZxnI+Im5bbh6q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i+zPPhnz; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i+zPPhnz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737832718; x=1769368718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PDzKbxPO/e85Ts3rHpmoofB8vYFxNpDdpLYpsCEHBBQ=;
  b=i+zPPhnzKvbOawAL9vysUjz/crZj5HZOBxQXrvl/Gjf0PoXNOEg3KnhG
   8abQlEDseNcI7l541ufb/ClYFudPBW9oKk7AfD+t6D8/AeAw3qHvekIDA
   ZXkIUt4T02Qse5sJIjfoNP2gnirlp2jJNxQC5tZBL+LE8dFz3cZ7VZZsa
   lb386gQAHHLOdzC+FZbj2ZT+3EKYXlWJoinzRUCMEVl0bTVq9VoQasVFQ
   5QPxZcpeP2FCqWRlDcZTUN4N7vr+obwdvnE8PABmfyXgXU4zSHTMSGKRv
   5EHJYTkree6H7g3WC9kdGLVjtT2DtdctYUVqWF9hI9FVXshF/n9vBshy3
   g==;
X-CSE-ConnectionGUID: C3GzGXtBQMa2lIv0SU9wtg==
X-CSE-MsgGUID: +nej3TmeQeqjGoKXSWRIqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="38373882"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="38373882"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 11:18:37 -0800
X-CSE-ConnectionGUID: 5Hf1ZnkYRp+0XXXamE14XA==
X-CSE-MsgGUID: S08U2vYXTmunT5abntYDMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107913059"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 25 Jan 2025 11:18:36 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tblft-000e91-2c;
	Sat, 25 Jan 2025 19:18:33 +0000
Date: Sun, 26 Jan 2025 03:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [rafael-pm:bleeding-edge 27/39] drivers/cpufreq/cpufreq.c:1580:4-25:
 opportunity for str_enable_disable(policy -> boost_enabled)
Message-ID: <202501260303.uN2uzbdv-lkp@intel.com>
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
CC: linux-acpi@vger.kernel.org
CC: devel@acpica.org
CC: linux-pm@vger.kernel.org
TO: Lifeng Zheng <zhenglifeng1@huawei.com>
CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git bleeding-edge
head:   d0fb2a5dea57ea2b654c2e6665a5d101af0b111e
commit: dd016f379ebc2d43a9405742d1a6066577509bd7 [27/39] cpufreq: Introduce a more generic way to set default per-policy boost flag
:::::: branch date: 30 hours ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r061-20250125 (https://download.01.org/0day-ci/archive/20250126/202501260303.uN2uzbdv-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202501260303.uN2uzbdv-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/cpufreq/cpufreq.c:1580:4-25: opportunity for str_enable_disable(policy -> boost_enabled)

vim +1580 drivers/cpufreq/cpufreq.c

e9698cc5d2749c Srivatsa S. Bhat   2013-07-30  1358  
0b275352872b26 Rafael J. Wysocki  2015-07-29  1359  static int cpufreq_online(unsigned int cpu)
^1da177e4c3f41 Linus Torvalds     2005-04-16  1360  {
7f0c020ab6ecb5 Viresh Kumar       2015-01-02  1361  	struct cpufreq_policy *policy;
194d99c7e3ce54 Rafael J. Wysocki  2015-07-29  1362  	bool new_policy;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1363  	unsigned long flags;
0b275352872b26 Rafael J. Wysocki  2015-07-29  1364  	unsigned int j;
0b275352872b26 Rafael J. Wysocki  2015-07-29  1365  	int ret;
87549141d516ae Viresh Kumar       2015-06-10  1366  
0b275352872b26 Rafael J. Wysocki  2015-07-29  1367  	pr_debug("%s: bringing CPU%u online\n", __func__, cpu);
6eed9404ab3c4b Viresh Kumar       2013-08-06  1368  
bb29ae152e3b9d Viresh Kumar       2015-02-19  1369  	/* Check if this CPU already has a policy to manage it */
9104bb26c740cd Viresh Kumar       2015-05-12  1370  	policy = per_cpu(cpufreq_cpu_data, cpu);
11ce707e6c2aea Rafael J. Wysocki  2015-07-27  1371  	if (policy) {
9104bb26c740cd Viresh Kumar       2015-05-12  1372  		WARN_ON(!cpumask_test_cpu(cpu, policy->related_cpus));
11ce707e6c2aea Rafael J. Wysocki  2015-07-27  1373  		if (!policy_is_inactive(policy))
d9612a495b0bc9 Rafael J. Wysocki  2015-07-27  1374  			return cpufreq_add_policy_cpu(policy, cpu);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1375  
11ce707e6c2aea Rafael J. Wysocki  2015-07-27  1376  		/* This is the only online CPU for the policy.  Start over. */
194d99c7e3ce54 Rafael J. Wysocki  2015-07-29  1377  		new_policy = false;
11ce707e6c2aea Rafael J. Wysocki  2015-07-27  1378  		down_write(&policy->rwsem);
11ce707e6c2aea Rafael J. Wysocki  2015-07-27  1379  		policy->cpu = cpu;
11ce707e6c2aea Rafael J. Wysocki  2015-07-27  1380  		policy->governor = NULL;
11ce707e6c2aea Rafael J. Wysocki  2015-07-27  1381  	} else {
194d99c7e3ce54 Rafael J. Wysocki  2015-07-29  1382  		new_policy = true;
a34e63b14486e9 Rafael J. Wysocki  2015-07-27  1383  		policy = cpufreq_policy_alloc(cpu);
059019a3c3353b Dave Jones         2009-07-08  1384  		if (!policy)
d4d854d6c7706e Rafael J. Wysocki  2015-07-27  1385  			return -ENOMEM;
514ff1bcd98d7f Schspa Shi         2022-05-16  1386  		down_write(&policy->rwsem);
72368d122c7479 Rafael J. Wysocki  2013-12-27  1387  	}
0d66b91ebff498 Srivatsa S. Bhat   2013-09-12  1388  
91a12e91dc3913 Viresh Kumar       2019-02-12  1389  	if (!new_policy && cpufreq_driver->online) {
68315f1a5f1333 Pierre Gondois     2022-07-04  1390  		/* Recover policy->cpus using related_cpus */
68315f1a5f1333 Pierre Gondois     2022-07-04  1391  		cpumask_copy(policy->cpus, policy->related_cpus);
68315f1a5f1333 Pierre Gondois     2022-07-04  1392  
91a12e91dc3913 Viresh Kumar       2019-02-12  1393  		ret = cpufreq_driver->online(policy);
91a12e91dc3913 Viresh Kumar       2019-02-12  1394  		if (ret) {
91a12e91dc3913 Viresh Kumar       2019-02-12  1395  			pr_debug("%s: %d: initialization failed\n", __func__,
91a12e91dc3913 Viresh Kumar       2019-02-12  1396  				 __LINE__);
91a12e91dc3913 Viresh Kumar       2019-02-12  1397  			goto out_exit_policy;
91a12e91dc3913 Viresh Kumar       2019-02-12  1398  		}
91a12e91dc3913 Viresh Kumar       2019-02-12  1399  	} else {
835481d9bcd657 Rusty Russell      2009-01-04  1400  		cpumask_copy(policy->cpus, cpumask_of(cpu));
^1da177e4c3f41 Linus Torvalds     2005-04-16  1401  
91a12e91dc3913 Viresh Kumar       2019-02-12  1402  		/*
91a12e91dc3913 Viresh Kumar       2019-02-12  1403  		 * Call driver. From then on the cpufreq must be able
91a12e91dc3913 Viresh Kumar       2019-02-12  1404  		 * to accept all calls to ->verify and ->setpolicy for this CPU.
^1da177e4c3f41 Linus Torvalds     2005-04-16  1405  		 */
1c3d85dd4e21a4 Rafael J. Wysocki  2013-04-29  1406  		ret = cpufreq_driver->init(policy);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1407  		if (ret) {
91a12e91dc3913 Viresh Kumar       2019-02-12  1408  			pr_debug("%s: %d: initialization failed\n", __func__,
91a12e91dc3913 Viresh Kumar       2019-02-12  1409  				 __LINE__);
8101f99703048c Viresh Kumar       2015-07-08  1410  			goto out_free_policy;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1411  		}
643ae6e81dd65b Viresh Kumar       2013-01-12  1412  
3b7180573c250e Rafael J. Wysocki  2021-06-22  1413  		/*
3b7180573c250e Rafael J. Wysocki  2021-06-22  1414  		 * The initialization has succeeded and the policy is online.
3b7180573c250e Rafael J. Wysocki  2021-06-22  1415  		 * If there is a problem with its frequency table, take it
3b7180573c250e Rafael J. Wysocki  2021-06-22  1416  		 * offline and drop it.
3b7180573c250e Rafael J. Wysocki  2021-06-22  1417  		 */
d417e0691ac00d Viresh Kumar       2018-02-22  1418  		ret = cpufreq_table_validate_and_sort(policy);
d417e0691ac00d Viresh Kumar       2018-02-22  1419  		if (ret)
3b7180573c250e Rafael J. Wysocki  2021-06-22  1420  			goto out_offline_policy;
d417e0691ac00d Viresh Kumar       2018-02-22  1421  
4d1f3a5bcb489c Rafael J. Wysocki  2015-07-27  1422  		/* related_cpus should at least include policy->cpus. */
0998a03a3a4d35 Viresh Kumar       2015-10-15  1423  		cpumask_copy(policy->related_cpus, policy->cpus);
4d1f3a5bcb489c Rafael J. Wysocki  2015-07-27  1424  	}
559ed40752dc63 Rafael J. Wysocki  2015-07-26  1425  
5a7e56a5d29071 Viresh Kumar       2014-03-04  1426  	/*
5a7e56a5d29071 Viresh Kumar       2014-03-04  1427  	 * affected cpus must always be the one, which are online. We aren't
5a7e56a5d29071 Viresh Kumar       2014-03-04  1428  	 * managing offline cpus here.
5a7e56a5d29071 Viresh Kumar       2014-03-04  1429  	 */
5a7e56a5d29071 Viresh Kumar       2014-03-04  1430  	cpumask_and(policy->cpus, policy->cpus, cpu_online_mask);
5a7e56a5d29071 Viresh Kumar       2014-03-04  1431  
194d99c7e3ce54 Rafael J. Wysocki  2015-07-29  1432  	if (new_policy) {
2f0ba790df5172 Rafael J. Wysocki  2017-03-27  1433  		for_each_cpu(j, policy->related_cpus) {
652ed95d5fa607 Viresh Kumar       2014-01-09  1434  			per_cpu(cpufreq_cpu_data, j) = policy;
2c1b5a84669d24 Xiongfeng Wang     2021-11-29  1435  			add_cpu_dev_symlink(policy, j, get_cpu_device(j));
2f0ba790df5172 Rafael J. Wysocki  2017-03-27  1436  		}
18c49926c4bf49 Viresh Kumar       2019-07-05  1437  
18c49926c4bf49 Viresh Kumar       2019-07-05  1438  		policy->min_freq_req = kzalloc(2 * sizeof(*policy->min_freq_req),
18c49926c4bf49 Viresh Kumar       2019-07-05  1439  					       GFP_KERNEL);
b96f038432362a Wang ShaoBo        2020-11-26  1440  		if (!policy->min_freq_req) {
b96f038432362a Wang ShaoBo        2020-11-26  1441  			ret = -ENOMEM;
18c49926c4bf49 Viresh Kumar       2019-07-05  1442  			goto out_destroy_policy;
b96f038432362a Wang ShaoBo        2020-11-26  1443  		}
18c49926c4bf49 Viresh Kumar       2019-07-05  1444  
3000ce3c52f8b8 Rafael J. Wysocki  2019-10-16  1445  		ret = freq_qos_add_request(&policy->constraints,
3000ce3c52f8b8 Rafael J. Wysocki  2019-10-16  1446  					   policy->min_freq_req, FREQ_QOS_MIN,
521223d8b3ec07 Rafael J. Wysocki  2021-12-16  1447  					   FREQ_QOS_MIN_DEFAULT_VALUE);
18c49926c4bf49 Viresh Kumar       2019-07-05  1448  		if (ret < 0) {
18c49926c4bf49 Viresh Kumar       2019-07-05  1449  			/*
3000ce3c52f8b8 Rafael J. Wysocki  2019-10-16  1450  			 * So we don't call freq_qos_remove_request() for an
18c49926c4bf49 Viresh Kumar       2019-07-05  1451  			 * uninitialized request.
18c49926c4bf49 Viresh Kumar       2019-07-05  1452  			 */
18c49926c4bf49 Viresh Kumar       2019-07-05  1453  			kfree(policy->min_freq_req);
18c49926c4bf49 Viresh Kumar       2019-07-05  1454  			policy->min_freq_req = NULL;
18c49926c4bf49 Viresh Kumar       2019-07-05  1455  			goto out_destroy_policy;
18c49926c4bf49 Viresh Kumar       2019-07-05  1456  		}
18c49926c4bf49 Viresh Kumar       2019-07-05  1457  
18c49926c4bf49 Viresh Kumar       2019-07-05  1458  		/*
18c49926c4bf49 Viresh Kumar       2019-07-05  1459  		 * This must be initialized right here to avoid calling
3000ce3c52f8b8 Rafael J. Wysocki  2019-10-16  1460  		 * freq_qos_remove_request() on uninitialized request in case
18c49926c4bf49 Viresh Kumar       2019-07-05  1461  		 * of errors.
18c49926c4bf49 Viresh Kumar       2019-07-05  1462  		 */
18c49926c4bf49 Viresh Kumar       2019-07-05  1463  		policy->max_freq_req = policy->min_freq_req + 1;
18c49926c4bf49 Viresh Kumar       2019-07-05  1464  
3000ce3c52f8b8 Rafael J. Wysocki  2019-10-16  1465  		ret = freq_qos_add_request(&policy->constraints,
3000ce3c52f8b8 Rafael J. Wysocki  2019-10-16  1466  					   policy->max_freq_req, FREQ_QOS_MAX,
521223d8b3ec07 Rafael J. Wysocki  2021-12-16  1467  					   FREQ_QOS_MAX_DEFAULT_VALUE);
18c49926c4bf49 Viresh Kumar       2019-07-05  1468  		if (ret < 0) {
18c49926c4bf49 Viresh Kumar       2019-07-05  1469  			policy->max_freq_req = NULL;
18c49926c4bf49 Viresh Kumar       2019-07-05  1470  			goto out_destroy_policy;
18c49926c4bf49 Viresh Kumar       2019-07-05  1471  		}
6a1490367c44f9 Viresh Kumar       2019-07-23  1472  
6a1490367c44f9 Viresh Kumar       2019-07-23  1473  		blocking_notifier_call_chain(&cpufreq_policy_notifier_list,
6a1490367c44f9 Viresh Kumar       2019-07-23  1474  				CPUFREQ_CREATE_POLICY, policy);
1608f023051048 Lifeng Zheng       2025-01-17  1475  	} else {
1608f023051048 Lifeng Zheng       2025-01-17  1476  		ret = freq_qos_update_request(policy->max_freq_req, policy->max);
1608f023051048 Lifeng Zheng       2025-01-17  1477  		if (ret < 0)
1608f023051048 Lifeng Zheng       2025-01-17  1478  			goto out_destroy_policy;
988bed09d35a85 Viresh Kumar       2015-05-08  1479  	}
652ed95d5fa607 Viresh Kumar       2014-01-09  1480  
5ddc6d4e30f4e8 Viresh Kumar       2019-06-20  1481  	if (cpufreq_driver->get && has_target()) {
da60ce9f2faca8 Viresh Kumar       2013-10-03  1482  		policy->cur = cpufreq_driver->get(policy->cpu);
da60ce9f2faca8 Viresh Kumar       2013-10-03  1483  		if (!policy->cur) {
b96f038432362a Wang ShaoBo        2020-11-26  1484  			ret = -EIO;
da60ce9f2faca8 Viresh Kumar       2013-10-03  1485  			pr_err("%s: ->get() failed\n", __func__);
d417e0691ac00d Viresh Kumar       2018-02-22  1486  			goto out_destroy_policy;
da60ce9f2faca8 Viresh Kumar       2013-10-03  1487  		}
da60ce9f2faca8 Viresh Kumar       2013-10-03  1488  	}
da60ce9f2faca8 Viresh Kumar       2013-10-03  1489  
d3916691c90dfc Viresh Kumar       2013-12-03  1490  	/*
d3916691c90dfc Viresh Kumar       2013-12-03  1491  	 * Sometimes boot loaders set CPU frequency to a value outside of
d3916691c90dfc Viresh Kumar       2013-12-03  1492  	 * frequency table present with cpufreq core. In such cases CPU might be
d3916691c90dfc Viresh Kumar       2013-12-03  1493  	 * unstable if it has to run on that frequency for long duration of time
d3916691c90dfc Viresh Kumar       2013-12-03  1494  	 * and so its better to set it to a frequency which is specified in
d3916691c90dfc Viresh Kumar       2013-12-03  1495  	 * freq-table. This also makes cpufreq stats inconsistent as
d3916691c90dfc Viresh Kumar       2013-12-03  1496  	 * cpufreq-stats would fail to register because current frequency of CPU
d3916691c90dfc Viresh Kumar       2013-12-03  1497  	 * isn't found in freq-table.
d3916691c90dfc Viresh Kumar       2013-12-03  1498  	 *
d3916691c90dfc Viresh Kumar       2013-12-03  1499  	 * Because we don't want this change to effect boot process badly, we go
d3916691c90dfc Viresh Kumar       2013-12-03  1500  	 * for the next freq which is >= policy->cur ('cur' must be set by now,
d3916691c90dfc Viresh Kumar       2013-12-03  1501  	 * otherwise we will end up setting freq to lowest of the table as 'cur'
d3916691c90dfc Viresh Kumar       2013-12-03  1502  	 * is initialized to zero).
d3916691c90dfc Viresh Kumar       2013-12-03  1503  	 *
d3916691c90dfc Viresh Kumar       2013-12-03  1504  	 * We are passing target-freq as "policy->cur - 1" otherwise
d3916691c90dfc Viresh Kumar       2013-12-03  1505  	 * __cpufreq_driver_target() would simply fail, as policy->cur will be
d3916691c90dfc Viresh Kumar       2013-12-03  1506  	 * equal to target-freq.
d3916691c90dfc Viresh Kumar       2013-12-03  1507  	 */
d3916691c90dfc Viresh Kumar       2013-12-03  1508  	if ((cpufreq_driver->flags & CPUFREQ_NEED_INITIAL_FREQ_CHECK)
d3916691c90dfc Viresh Kumar       2013-12-03  1509  	    && has_target()) {
97148d0ae5303b Viresh Kumar       2020-10-13  1510  		unsigned int old_freq = policy->cur;
97148d0ae5303b Viresh Kumar       2020-10-13  1511  
d3916691c90dfc Viresh Kumar       2013-12-03  1512  		/* Are we running at unknown frequency ? */
97148d0ae5303b Viresh Kumar       2020-10-13  1513  		ret = cpufreq_frequency_table_get_index(policy, old_freq);
d3916691c90dfc Viresh Kumar       2013-12-03  1514  		if (ret == -EINVAL) {
97148d0ae5303b Viresh Kumar       2020-10-13  1515  			ret = __cpufreq_driver_target(policy, old_freq - 1,
d3916691c90dfc Viresh Kumar       2013-12-03  1516  						      CPUFREQ_RELATION_L);
d3916691c90dfc Viresh Kumar       2013-12-03  1517  
d3916691c90dfc Viresh Kumar       2013-12-03  1518  			/*
d3916691c90dfc Viresh Kumar       2013-12-03  1519  			 * Reaching here after boot in a few seconds may not
d3916691c90dfc Viresh Kumar       2013-12-03  1520  			 * mean that system will remain stable at "unknown"
d3916691c90dfc Viresh Kumar       2013-12-03  1521  			 * frequency for longer duration. Hence, a BUG_ON().
d3916691c90dfc Viresh Kumar       2013-12-03  1522  			 */
d3916691c90dfc Viresh Kumar       2013-12-03  1523  			BUG_ON(ret);
8d5459f1a7f083 Marcin Juszkiewicz 2024-09-09  1524  			pr_info("%s: CPU%d: Running at unlisted initial frequency: %u kHz, changing to: %u kHz\n",
97148d0ae5303b Viresh Kumar       2020-10-13  1525  				__func__, policy->cpu, old_freq, policy->cur);
d3916691c90dfc Viresh Kumar       2013-12-03  1526  		}
d3916691c90dfc Viresh Kumar       2013-12-03  1527  	}
d3916691c90dfc Viresh Kumar       2013-12-03  1528  
194d99c7e3ce54 Rafael J. Wysocki  2015-07-29  1529  	if (new_policy) {
d9612a495b0bc9 Rafael J. Wysocki  2015-07-27  1530  		ret = cpufreq_add_dev_interface(policy);
19d6f7ec3eb165 Dave Jones         2009-07-08  1531  		if (ret)
d417e0691ac00d Viresh Kumar       2018-02-22  1532  			goto out_destroy_policy;
1aefc75b2449eb Rafael J. Wysocki  2016-05-31  1533  
1aefc75b2449eb Rafael J. Wysocki  2016-05-31  1534  		cpufreq_stats_create_table(policy);
c88a1f8b96e738 Lukasz Majewski    2013-08-06  1535  
c88a1f8b96e738 Lukasz Majewski    2013-08-06  1536  		write_lock_irqsave(&cpufreq_driver_lock, flags);
c88a1f8b96e738 Lukasz Majewski    2013-08-06  1537  		list_add(&policy->policy_list, &cpufreq_policy_list);
c88a1f8b96e738 Lukasz Majewski    2013-08-06  1538  		write_unlock_irqrestore(&cpufreq_driver_lock, flags);
c17495b01b72b5 Viresh Kumar       2021-08-10  1539  
c17495b01b72b5 Viresh Kumar       2021-08-10  1540  		/*
c17495b01b72b5 Viresh Kumar       2021-08-10  1541  		 * Register with the energy model before
ebeeee390b6a34 Rafael J. Wysocki  2024-12-12  1542  		 * em_rebuild_sched_domains() is called, which will result
c17495b01b72b5 Viresh Kumar       2021-08-10  1543  		 * in rebuilding of the sched domains, which should only be done
c17495b01b72b5 Viresh Kumar       2021-08-10  1544  		 * once the energy model is properly initialized for the policy
c17495b01b72b5 Viresh Kumar       2021-08-10  1545  		 * first.
c17495b01b72b5 Viresh Kumar       2021-08-10  1546  		 *
c17495b01b72b5 Viresh Kumar       2021-08-10  1547  		 * Also, this should be called before the policy is registered
c17495b01b72b5 Viresh Kumar       2021-08-10  1548  		 * with cooling framework.
c17495b01b72b5 Viresh Kumar       2021-08-10  1549  		 */
c17495b01b72b5 Viresh Kumar       2021-08-10  1550  		if (cpufreq_driver->register_em)
c17495b01b72b5 Viresh Kumar       2021-08-10  1551  			cpufreq_driver->register_em(policy);
988bed09d35a85 Viresh Kumar       2015-05-08  1552  	}
8ff69732d484ea Dave Jones         2006-03-05  1553  
7f0fa40f5a587c Viresh Kumar       2015-07-08  1554  	ret = cpufreq_init_policy(policy);
7f0fa40f5a587c Viresh Kumar       2015-07-08  1555  	if (ret) {
7f0fa40f5a587c Viresh Kumar       2015-07-08  1556  		pr_err("%s: Failed to initialize policy for cpu: %d (%d)\n",
7f0fa40f5a587c Viresh Kumar       2015-07-08  1557  		       __func__, cpu, ret);
d417e0691ac00d Viresh Kumar       2018-02-22  1558  		goto out_destroy_policy;
08fd8c1cf0a99a Viresh Kumar       2013-12-24  1559  	}
e18f1682bce701 Srivatsa S. Bhat   2013-07-30  1560  
4e97b631f24c92 Viresh Kumar       2014-03-04  1561  	up_write(&policy->rwsem);
08fd8c1cf0a99a Viresh Kumar       2013-12-24  1562  
038c5b3e412b0b Greg Kroah-Hartman 2007-12-17  1563  	kobject_uevent(&policy->kobj, KOBJ_ADD);
7c45cf31b3ab9b Viresh Kumar       2014-11-27  1564  
4f774c4a65bf39 Bjorn Andersson    2022-01-27  1565  	/* Callback for handling stuff after policy is ready */
4f774c4a65bf39 Bjorn Andersson    2022-01-27  1566  	if (cpufreq_driver->ready)
4f774c4a65bf39 Bjorn Andersson    2022-01-27  1567  		cpufreq_driver->ready(policy);
4f774c4a65bf39 Bjorn Andersson    2022-01-27  1568  
c4d61a529db788 Viresh Kumar       2024-02-29  1569  	/* Register cpufreq cooling only for a new policy */
c4d61a529db788 Viresh Kumar       2024-02-29  1570  	if (new_policy && cpufreq_thermal_control_enabled(cpufreq_driver))
5c238a8b599f1a Amit Kucheria      2019-01-30  1571  		policy->cdev = of_cpufreq_cooling_register(policy);
5c238a8b599f1a Amit Kucheria      2019-01-30  1572  
dd016f379ebc2d Lifeng Zheng       2025-01-17  1573  	/* Let the per-policy boost flag mirror the cpufreq_driver boost during init */
dd016f379ebc2d Lifeng Zheng       2025-01-17  1574  	if (policy->boost_enabled != cpufreq_boost_enabled()) {
dd016f379ebc2d Lifeng Zheng       2025-01-17  1575  		policy->boost_enabled = cpufreq_boost_enabled();
dd016f379ebc2d Lifeng Zheng       2025-01-17  1576  		ret = cpufreq_driver->set_boost(policy, policy->boost_enabled);
dd016f379ebc2d Lifeng Zheng       2025-01-17  1577  		if (ret) {
dd016f379ebc2d Lifeng Zheng       2025-01-17  1578  			/* If the set_boost fails, the online operation is not affected */
dd016f379ebc2d Lifeng Zheng       2025-01-17  1579  			pr_info("%s: CPU%d: Cannot %s BOOST\n", __func__, policy->cpu,
dd016f379ebc2d Lifeng Zheng       2025-01-17 @1580  				policy->boost_enabled ? "enable" : "disable");
dd016f379ebc2d Lifeng Zheng       2025-01-17  1581  			policy->boost_enabled = !policy->boost_enabled;
dd016f379ebc2d Lifeng Zheng       2025-01-17  1582  		}
dd016f379ebc2d Lifeng Zheng       2025-01-17  1583  	}
dd016f379ebc2d Lifeng Zheng       2025-01-17  1584  
2d06d8c49afdcc Dominik Brodowski  2011-03-27  1585  	pr_debug("initialization complete\n");
^1da177e4c3f41 Linus Torvalds     2005-04-16  1586  
^1da177e4c3f41 Linus Torvalds     2005-04-16  1587  	return 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1588  
d417e0691ac00d Viresh Kumar       2018-02-22  1589  out_destroy_policy:
b24b6478e65f14 Viresh Kumar       2018-02-22  1590  	for_each_cpu(j, policy->real_cpus)
5c84c1b84bd80a Viresh Kumar       2022-05-11  1591  		remove_cpu_dev_symlink(policy, j, get_cpu_device(j));
b24b6478e65f14 Viresh Kumar       2018-02-22  1592  
3b7180573c250e Rafael J. Wysocki  2021-06-22  1593  out_offline_policy:
3b7180573c250e Rafael J. Wysocki  2021-06-22  1594  	if (cpufreq_driver->offline)
3b7180573c250e Rafael J. Wysocki  2021-06-22  1595  		cpufreq_driver->offline(policy);
3b7180573c250e Rafael J. Wysocki  2021-06-22  1596  
d417e0691ac00d Viresh Kumar       2018-02-22  1597  out_exit_policy:
da60ce9f2faca8 Viresh Kumar       2013-10-03  1598  	if (cpufreq_driver->exit)
da60ce9f2faca8 Viresh Kumar       2013-10-03  1599  		cpufreq_driver->exit(policy);
2f0ba790df5172 Rafael J. Wysocki  2017-03-27  1600  
8101f99703048c Viresh Kumar       2015-07-08  1601  out_free_policy:
a2f6a7ac60e234 Viresh Kumar       2022-07-07  1602  	cpumask_clear(policy->cpus);
514ff1bcd98d7f Schspa Shi         2022-05-16  1603  	up_write(&policy->rwsem);
514ff1bcd98d7f Schspa Shi         2022-05-16  1604  
f9f41e3ef99ac9 Viresh Kumar       2017-01-05  1605  	cpufreq_policy_free(policy);
^1da177e4c3f41 Linus Torvalds     2005-04-16  1606  	return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  1607  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  1608  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
