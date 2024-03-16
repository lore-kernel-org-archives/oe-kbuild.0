Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A687717E9
	for <oe-kbuild@lists.linux.dev>; Sat, 16 Mar 2024 02:06:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710554796; cv=none; b=QFhCBfBqQnDF7T4xI6d2ho/wUPSBwg1L0HrI4m6HY7lb1EC77tbRzyhPvKJFhL9/UWdnD+cyV19El4R0N/krhUWvufGKHMs4DMFpXf1PPLpGuQFoPwAbsq6lecKcry4fajSDzb12N5qwnh4yY8ArQRk3VvcO+c0GnvlrhFdeoTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710554796; c=relaxed/simple;
	bh=+jea7D6g8YyQMDreM8Hy+/83SYMczRh2QHLUDgH7dho=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AY8fuITRhrEisLDuKIaRHP5rSSZfVAGPTzbA8i859wR16beIoC5smrcGTZcLUVWTi5AOQ+dhPKPkjrvLDLqt0kSEiVwzys2BDhDFMd+OkUUn7/exzyFciAd0bMECUWBBvG0FhqxTf24r/Iew6osVNHLJ5eqs3eWytUJ3i+hfwPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cAmd/sY7; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cAmd/sY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710554794; x=1742090794;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+jea7D6g8YyQMDreM8Hy+/83SYMczRh2QHLUDgH7dho=;
  b=cAmd/sY7yxXnp3PVSb3yWiQ1AOFMEnqzBnBAW3BPyZv9MNJgU2H0xHti
   F3GFIwpw9c5EBJBHr41c0wzMuPg3Fo8OUfnsMf8baWF9ljiWIOQyB9LpI
   Q+WTlxCIyZ/YbwIvuw0M0T6feweAdMfblc1RgV0yrBUOLn2WZnNYzF3qK
   RRbj0oGPKKxh6ZVWCsYjOVdtlhVQi92d+Wui7SEGgs44t/zlSwwtNS1XT
   gY3X1DOkIuN82MdjEpdg0l395P6GKHYmbf2MhcGi226MkYa8k74iNKkNc
   oqd65ts2a5ycEL2tKvSpWkvB8r3FCwoeXMBIpgcSMpnU7Egj/5EDngE/b
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,11014"; a="5382284"
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="5382284"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Mar 2024 19:06:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,129,1708416000"; 
   d="scan'208";a="35989210"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 15 Mar 2024 19:06:31 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rlJRN-000Eyf-0j;
	Sat, 16 Mar 2024 02:06:29 +0000
Date: Sat, 16 Mar 2024 10:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH 3/4] PM: EM: Add em_dev_update_chip_binning()
Message-ID: <202403160905.OfEMtk76-lkp@intel.com>
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
In-Reply-To: <20240314140421.3563571-4-lukasz.luba@arm.com>
References: <20240314140421.3563571-4-lukasz.luba@arm.com>
TO: Lukasz Luba <lukasz.luba@arm.com>
TO: linux-kernel@vger.kernel.org
TO: linux-pm@vger.kernel.org
CC: lukasz.luba@arm.com
CC: dietmar.eggemann@arm.com
CC: linux-arm-kernel@lists.infradead.org
CC: sboyd@kernel.org
CC: nm@ti.com
CC: linux-samsung-soc@vger.kernel.org
CC: daniel.lezcano@linaro.org
CC: rafael@kernel.org
CC: viresh.kumar@linaro.org
CC: krzysztof.kozlowski@linaro.org
CC: alim.akhtar@samsung.com
CC: m.szyprowski@samsung.com
CC: mhiramat@kernel.org

Hi Lukasz,

kernel test robot noticed the following build warnings:

[auto build test WARNING on rafael-pm/linux-next]
[also build test WARNING on linus/master next-20240315]
[cannot apply to krzk/for-next clk/clk-next soc/for-next rafael-pm/acpi-bus rafael-pm/devprop v6.8]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Lukasz-Luba/OPP-OF-Export-dev_opp_pm_calc_power-for-usage-from-EM/20240314-220719
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20240314140421.3563571-4-lukasz.luba%40arm.com
patch subject: [PATCH 3/4] PM: EM: Add em_dev_update_chip_binning()
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: powerpc64-randconfig-r071-20240315 (https://download.01.org/0day-ci/archive/20240316/202403160905.OfEMtk76-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 13.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202403160905.OfEMtk76-lkp@intel.com/

smatch warnings:
kernel/power/energy_model.c:824 em_dev_update_chip_binning() error: uninitialized symbol 'ret'.

vim +/ret +824 kernel/power/energy_model.c

3114fc30ea7e1fd Lukasz Luba 2024-03-14  800  
3114fc30ea7e1fd Lukasz Luba 2024-03-14  801  /**
3114fc30ea7e1fd Lukasz Luba 2024-03-14  802   * em_dev_update_chip_binning() - Update Energy Model with new values after
3114fc30ea7e1fd Lukasz Luba 2024-03-14  803   *			the new voltage information is present in the OPPs.
3114fc30ea7e1fd Lukasz Luba 2024-03-14  804   * @dev		: Device for which the Energy Model has to be updated.
3114fc30ea7e1fd Lukasz Luba 2024-03-14  805   *
3114fc30ea7e1fd Lukasz Luba 2024-03-14  806   * This function allows to update easily the EM with new values available in
3114fc30ea7e1fd Lukasz Luba 2024-03-14  807   * the OPP framework and DT. It can be used after the chip has been properly
3114fc30ea7e1fd Lukasz Luba 2024-03-14  808   * verified by device drivers and the voltages adjusted for the 'chip binning'.
3114fc30ea7e1fd Lukasz Luba 2024-03-14  809   * It uses the "dynamic-power-coefficient" DT property to calculate the power
3114fc30ea7e1fd Lukasz Luba 2024-03-14  810   * values for EM. For power calculation it uses the new adjusted voltage
3114fc30ea7e1fd Lukasz Luba 2024-03-14  811   * values known for OPPs, which might be changed after boot.
3114fc30ea7e1fd Lukasz Luba 2024-03-14  812   */
3114fc30ea7e1fd Lukasz Luba 2024-03-14  813  int em_dev_update_chip_binning(struct device *dev)
3114fc30ea7e1fd Lukasz Luba 2024-03-14  814  {
3114fc30ea7e1fd Lukasz Luba 2024-03-14  815  	struct em_perf_table __rcu *em_table;
3114fc30ea7e1fd Lukasz Luba 2024-03-14  816  	struct em_perf_domain *pd;
3114fc30ea7e1fd Lukasz Luba 2024-03-14  817  	int i, ret;
3114fc30ea7e1fd Lukasz Luba 2024-03-14  818  
3114fc30ea7e1fd Lukasz Luba 2024-03-14  819  	if (IS_ERR_OR_NULL(dev))
3114fc30ea7e1fd Lukasz Luba 2024-03-14  820  		return -EINVAL;
3114fc30ea7e1fd Lukasz Luba 2024-03-14  821  
3114fc30ea7e1fd Lukasz Luba 2024-03-14  822  	pd = em_pd_get(dev);
3114fc30ea7e1fd Lukasz Luba 2024-03-14  823  	if (!pd) {
3114fc30ea7e1fd Lukasz Luba 2024-03-14 @824  		dev_warn(dev, "Couldn't find Energy Model %d\n", ret);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
