Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E3917A2E0
	for <oe-kbuild@lists.linux.dev>; Sat, 28 Jun 2025 00:48:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751071685; cv=none; b=iHuV5jKRdUzqXaa1HJ+NPuuqIUs25NlWJ3/GhGfFFZMMFes5g9/Ez5Gl2T1aN1/jBpiSL6vcZhw173SYOiJo9Nb3iV/sfrUoBpkFyXNjTFHGnzkicHJs3WQ2ajRoCWd4kz32FPxiiJuOquuUVFtccMmMh5F3+7lbmQ38XXGM7UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751071685; c=relaxed/simple;
	bh=91LNOC0eacxdf2JfhFm3ibEV4mZr+7R9fgrnNqKrIbE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KrQKxlEDUiqE4aUbNmO6NaycHTtN0CrAUjx+sHpKGsZplFPtuWbS42JCICxyYo9NNZFve1i6USYEtKbiHs5hF237d0y4IrxowzXwhUXvWBDOURe8DBVwoN93pwsjXdZPnAjOaOBpmK44+2J15finRSB4sUisae93MhRFb9pRzfw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ErH3N1jB; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ErH3N1jB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751071683; x=1782607683;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=91LNOC0eacxdf2JfhFm3ibEV4mZr+7R9fgrnNqKrIbE=;
  b=ErH3N1jBM42vqjUqQ9UUvCjsx1vRQJozdJu+3lysBKvbGCoSEu1IOIE5
   j7vesKjBnmhpuO7jJMVpNxOsg/ngqXG8yS5w8ZIyjnQer1cCL1BcOXIud
   c0xIfwmiWfJTkrrZQoWNit9TwjxWGo37Zo02iKYEmEPbC4VzhZa/VpbMk
   8oq2E40qEj+friccpLn425O6eRlc+lt8pQc2PApKjiN9a8eRhkgpRoder
   VfCeb7tZtfpmZvCF+YePsV7wEpOc78zseBbTdaP0SSoWY2QcYY/UbjHuH
   e/ROrdbStIDkYK4YDYpU/np0ihMWxEmjiMReIUJomn5zvECofD1IYj1WQ
   Q==;
X-CSE-ConnectionGUID: 0kjeTwNuRFerwQlCKTCHBA==
X-CSE-MsgGUID: uw7u4b/CRhG9mdDHsQifyg==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="70824174"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="70824174"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2025 17:48:02 -0700
X-CSE-ConnectionGUID: 8EDIYWXpSt20gD+Lh51XxA==
X-CSE-MsgGUID: plxyNSPsSI2LoJjzKzb6oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; 
   d="scan'208";a="158442875"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 27 Jun 2025 17:48:01 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uVJja-000Wdc-2R;
	Sat, 28 Jun 2025 00:47:58 +0000
Date: Sat, 28 Jun 2025 08:47:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 2/2] soc: qcom: pmic_glink: Add support for subsystem
 restart (SSR)
Message-ID: <202506280819.vRUvImej-lkp@intel.com>
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
In-Reply-To: <20250624225535.2013141-3-anjelique.melendez@oss.qualcomm.com>
References: <20250624225535.2013141-3-anjelique.melendez@oss.qualcomm.com>
TO: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
TO: andersson@kernel.org
TO: konradybcio@kernel.org
TO: robh@kernel.org
TO: krzk+dt@kernel.org
TO: conor+dt@kernel.org
CC: dmitry.baryshkov@oss.qualcomm.com
CC: linux-arm-msm@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Hi Anjelique,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc3 next-20250627]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Anjelique-Melendez/dt-bindings-soc-qcom-qcom-pmic-glink-Add-qcom-subsys-name-property/20250625-070209
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20250624225535.2013141-3-anjelique.melendez%40oss.qualcomm.com
patch subject: [PATCH 2/2] soc: qcom: pmic_glink: Add support for subsystem restart (SSR)
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: x86_64-randconfig-161-20250627 (https://download.01.org/0day-ci/archive/20250628/202506280819.vRUvImej-lkp@intel.com/config)
compiler: clang version 20.1.7 (https://github.com/llvm/llvm-project 6146a88f60492b520a36f8f8f3231e15f3cc6082)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202506280819.vRUvImej-lkp@intel.com/

smatch warnings:
drivers/soc/qcom/pmic_glink.c:360 pmic_glink_probe() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +360 drivers/soc/qcom/pmic_glink.c

58ef4ece1e41ac Bjorn Andersson    2023-01-31  300  
58ef4ece1e41ac Bjorn Andersson    2023-01-31  301  static int pmic_glink_probe(struct platform_device *pdev)
58ef4ece1e41ac Bjorn Andersson    2023-01-31  302  {
ff642773b6b5b8 Neil Armstrong     2023-03-21  303  	const unsigned long *match_data;
56e992f9beb5f6 Anjelique Melendez 2025-06-24  304  	const char *subsys_name = NULL;
58ef4ece1e41ac Bjorn Andersson    2023-01-31  305  	struct pdr_service *service;
58ef4ece1e41ac Bjorn Andersson    2023-01-31  306  	struct pmic_glink *pg;
58ef4ece1e41ac Bjorn Andersson    2023-01-31  307  	int ret;
58ef4ece1e41ac Bjorn Andersson    2023-01-31  308  
58ef4ece1e41ac Bjorn Andersson    2023-01-31  309  	pg = devm_kzalloc(&pdev->dev, sizeof(*pg), GFP_KERNEL);
58ef4ece1e41ac Bjorn Andersson    2023-01-31  310  	if (!pg)
58ef4ece1e41ac Bjorn Andersson    2023-01-31  311  		return -ENOMEM;
58ef4ece1e41ac Bjorn Andersson    2023-01-31  312  
58ef4ece1e41ac Bjorn Andersson    2023-01-31  313  	dev_set_drvdata(&pdev->dev, pg);
58ef4ece1e41ac Bjorn Andersson    2023-01-31  314  
58ef4ece1e41ac Bjorn Andersson    2023-01-31  315  	pg->dev = &pdev->dev;
58ef4ece1e41ac Bjorn Andersson    2023-01-31  316  
58ef4ece1e41ac Bjorn Andersson    2023-01-31  317  	INIT_LIST_HEAD(&pg->clients);
9329933699b32d Bjorn Andersson    2024-04-30  318  	spin_lock_init(&pg->client_lock);
58ef4ece1e41ac Bjorn Andersson    2023-01-31  319  	mutex_init(&pg->state_lock);
58ef4ece1e41ac Bjorn Andersson    2023-01-31  320  
ff642773b6b5b8 Neil Armstrong     2023-03-21  321  	match_data = (unsigned long *)of_device_get_match_data(&pdev->dev);
4db09e7b967b90 Dmitry Baryshkov   2023-10-25  322  	if (!match_data)
4db09e7b967b90 Dmitry Baryshkov   2023-10-25  323  		return -EINVAL;
4db09e7b967b90 Dmitry Baryshkov   2023-10-25  324  
ff642773b6b5b8 Neil Armstrong     2023-03-21  325  	pg->client_mask = *match_data;
ff642773b6b5b8 Neil Armstrong     2023-03-21  326  
f79ee78767ca60 Rob Clark          2024-02-17  327  	pg->pdr = pdr_handle_alloc(pmic_glink_pdr_callback, pg);
f79ee78767ca60 Rob Clark          2024-02-17  328  	if (IS_ERR(pg->pdr)) {
f79ee78767ca60 Rob Clark          2024-02-17  329  		ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->pdr),
f79ee78767ca60 Rob Clark          2024-02-17  330  				    "failed to initialize pdr\n");
f79ee78767ca60 Rob Clark          2024-02-17  331  		return ret;
f79ee78767ca60 Rob Clark          2024-02-17  332  	}
f79ee78767ca60 Rob Clark          2024-02-17  333  
ff642773b6b5b8 Neil Armstrong     2023-03-21  334  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI)) {
ff642773b6b5b8 Neil Armstrong     2023-03-21  335  		ret = pmic_glink_add_aux_device(pg, &pg->ucsi_aux, "ucsi");
58ef4ece1e41ac Bjorn Andersson    2023-01-31  336  		if (ret)
f79ee78767ca60 Rob Clark          2024-02-17  337  			goto out_release_pdr_handle;
ff642773b6b5b8 Neil Armstrong     2023-03-21  338  	}
ff642773b6b5b8 Neil Armstrong     2023-03-21  339  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE)) {
ff642773b6b5b8 Neil Armstrong     2023-03-21  340  		ret = pmic_glink_add_aux_device(pg, &pg->altmode_aux, "altmode");
ff642773b6b5b8 Neil Armstrong     2023-03-21  341  		if (ret)
ff642773b6b5b8 Neil Armstrong     2023-03-21  342  			goto out_release_ucsi_aux;
ff642773b6b5b8 Neil Armstrong     2023-03-21  343  	}
ff642773b6b5b8 Neil Armstrong     2023-03-21  344  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT)) {
58ef4ece1e41ac Bjorn Andersson    2023-01-31  345  		ret = pmic_glink_add_aux_device(pg, &pg->ps_aux, "power-supply");
58ef4ece1e41ac Bjorn Andersson    2023-01-31  346  		if (ret)
58ef4ece1e41ac Bjorn Andersson    2023-01-31  347  			goto out_release_altmode_aux;
ff642773b6b5b8 Neil Armstrong     2023-03-21  348  	}
58ef4ece1e41ac Bjorn Andersson    2023-01-31  349  
58ef4ece1e41ac Bjorn Andersson    2023-01-31  350  	service = pdr_add_lookup(pg->pdr, "tms/servreg", "msm/adsp/charger_pd");
58ef4ece1e41ac Bjorn Andersson    2023-01-31  351  	if (IS_ERR(service)) {
58ef4ece1e41ac Bjorn Andersson    2023-01-31  352  		ret = dev_err_probe(&pdev->dev, PTR_ERR(service),
58ef4ece1e41ac Bjorn Andersson    2023-01-31  353  				    "failed adding pdr lookup for charger_pd\n");
f79ee78767ca60 Rob Clark          2024-02-17  354  		goto out_release_aux_devices;
58ef4ece1e41ac Bjorn Andersson    2023-01-31  355  	}
58ef4ece1e41ac Bjorn Andersson    2023-01-31  356  
56e992f9beb5f6 Anjelique Melendez 2025-06-24  357  	if (device_property_present(&pdev->dev, "qcom,subsys-name")) {
56e992f9beb5f6 Anjelique Melendez 2025-06-24  358  		device_property_read_string(&pdev->dev, "qcom,subsys-name", &subsys_name);
56e992f9beb5f6 Anjelique Melendez 2025-06-24  359  		if (!subsys_name) {
56e992f9beb5f6 Anjelique Melendez 2025-06-24 @360  			ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->ssr_handle),
56e992f9beb5f6 Anjelique Melendez 2025-06-24  361  					"failed to read subsys_name string from dt\n");
56e992f9beb5f6 Anjelique Melendez 2025-06-24  362  			goto out_release_aux_devices;
56e992f9beb5f6 Anjelique Melendez 2025-06-24  363  		}
56e992f9beb5f6 Anjelique Melendez 2025-06-24  364  		pg->ssr_nb.notifier_call = pmic_glink_ssr_callback;
56e992f9beb5f6 Anjelique Melendez 2025-06-24  365  		pg->ssr_handle = qcom_register_ssr_notifier(subsys_name, &pg->ssr_nb);
56e992f9beb5f6 Anjelique Melendez 2025-06-24  366  		if (IS_ERR(pg->ssr_handle)) {
56e992f9beb5f6 Anjelique Melendez 2025-06-24  367  			ret = dev_err_probe(&pdev->dev, PTR_ERR(pg->ssr_handle),
56e992f9beb5f6 Anjelique Melendez 2025-06-24  368  					"failed adding ssr notifier\n");
56e992f9beb5f6 Anjelique Melendez 2025-06-24  369  			goto out_release_aux_devices;
56e992f9beb5f6 Anjelique Melendez 2025-06-24  370  		}
56e992f9beb5f6 Anjelique Melendez 2025-06-24  371  	}
56e992f9beb5f6 Anjelique Melendez 2025-06-24  372  
58ef4ece1e41ac Bjorn Andersson    2023-01-31  373  	mutex_lock(&__pmic_glink_lock);
58ef4ece1e41ac Bjorn Andersson    2023-01-31  374  	__pmic_glink = pg;
58ef4ece1e41ac Bjorn Andersson    2023-01-31  375  	mutex_unlock(&__pmic_glink_lock);
58ef4ece1e41ac Bjorn Andersson    2023-01-31  376  
58ef4ece1e41ac Bjorn Andersson    2023-01-31  377  	return 0;
58ef4ece1e41ac Bjorn Andersson    2023-01-31  378  
58ef4ece1e41ac Bjorn Andersson    2023-01-31  379  out_release_aux_devices:
ff642773b6b5b8 Neil Armstrong     2023-03-21  380  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_BATT))
58ef4ece1e41ac Bjorn Andersson    2023-01-31  381  		pmic_glink_del_aux_device(pg, &pg->ps_aux);
58ef4ece1e41ac Bjorn Andersson    2023-01-31  382  out_release_altmode_aux:
ff642773b6b5b8 Neil Armstrong     2023-03-21  383  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_ALTMODE))
58ef4ece1e41ac Bjorn Andersson    2023-01-31  384  		pmic_glink_del_aux_device(pg, &pg->altmode_aux);
ff642773b6b5b8 Neil Armstrong     2023-03-21  385  out_release_ucsi_aux:
ff642773b6b5b8 Neil Armstrong     2023-03-21  386  	if (pg->client_mask & BIT(PMIC_GLINK_CLIENT_UCSI))
ff642773b6b5b8 Neil Armstrong     2023-03-21  387  		pmic_glink_del_aux_device(pg, &pg->ucsi_aux);
f79ee78767ca60 Rob Clark          2024-02-17  388  out_release_pdr_handle:
f79ee78767ca60 Rob Clark          2024-02-17  389  	pdr_handle_release(pg->pdr);
58ef4ece1e41ac Bjorn Andersson    2023-01-31  390  
58ef4ece1e41ac Bjorn Andersson    2023-01-31  391  	return ret;
58ef4ece1e41ac Bjorn Andersson    2023-01-31  392  }
58ef4ece1e41ac Bjorn Andersson    2023-01-31  393  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
