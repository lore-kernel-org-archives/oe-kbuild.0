Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC68313C9C7
	for <oe-kbuild@lists.linux.dev>; Mon,  2 Sep 2024 14:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725286207; cv=none; b=cMaJYh+COiTUsfRGfxH6ZnWJgZuqeW0mNBDXAfBbHlH4MjRLg8mnIF2RJB//4JzT+QITnWbEhFmYAZAcPwbHNO5CRbuZ6HubtjyRaZ13noPfwBXkckXZZ3vv09rCSCi+Cy0YkojVCon3pGqtes5CeF4Cql1V3ZEjMrOqIJpNkDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725286207; c=relaxed/simple;
	bh=tsuPrPdvAGyKmRj2bIzbnwMDMGjmes+3HzJaSvWkwW8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z0wPF6Y7KMegSeX12bScmBZ2q2XtE+91JSj0gmqp3rKkDQr/CGmneHuJOFh1tLEGBZJoov/9yDWB+ANOcWqwuB8hF9GbiTcFHFqm3nnUxb8xmTMxmV8Sr6iWuOoIkLB7Mpgp/ZFDtNcp1GAXb56tS0vuzUmpxQY7FjSvkMWI28o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QbCdZgcK; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QbCdZgcK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725286206; x=1756822206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tsuPrPdvAGyKmRj2bIzbnwMDMGjmes+3HzJaSvWkwW8=;
  b=QbCdZgcKPrNMJ5B6HaTtUfz+Fb7DjkJmUA88kthMbipnlHZy4PrgPJ6z
   BvGa1W+9NmjYhiBVwt2kitd5rI5Z9TG8oIf5W1/eBpcaPE41UpBpCuZnX
   t8FmZH5KE+gxVVi8XNc2boCiPoeceJOn9TxDTwMc/l80Lj5R1FPGEYtpT
   1FQf60xcyp+KrLjJYjMLjv8ikTBx2gYTIwTxCvEJhOXxXt+VtRukKJDRj
   sJhg8CTrvfnKYauTzBRGfSdVrKNdNWuAdIoC09mFIp4X8tJPci72Uj3rp
   0cniRswxjNG8pSxLqF94jQTyB3i7q4rpnvM4tinMl/Xg8cCKD9cknpP+f
   g==;
X-CSE-ConnectionGUID: z4OXRqbHQPSRq0UokezWnQ==
X-CSE-MsgGUID: +ccyCMzgRk22PwlsLeuxUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="35237918"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="35237918"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 07:10:05 -0700
X-CSE-ConnectionGUID: NjQDHt5ES4CUD3Ct1AmX7A==
X-CSE-MsgGUID: Td6qxRGWTJ2+3VzsVXZ04w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="64815220"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 02 Sep 2024 07:10:04 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sl7kn-0005by-37;
	Mon, 02 Sep 2024 14:10:01 +0000
Date: Mon, 2 Sep 2024 22:09:58 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6570/8400] drivers/gpu/drm/tegra/output.c:42
 tegra_output_connector_get_modes() error: uninitialized symbol 'drm_edid'.
Message-ID: <202409022236.7pEcEksT-lkp@intel.com>
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
TO: Jani Nikula <jani.nikula@intel.com>
CC: Daniel Vetter <daniel.vetter@ffwll.ch>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ecc768a84f0b8e631986f9ade3118fa37852fef0
commit: 98365ca74cbfae16b793b62a7ecabb5be8d77785 [6570/8400] drm/tegra: convert to struct drm_edid
:::::: branch date: 7 hours ago
:::::: commit date: 4 days ago
config: nios2-randconfig-r072-20240902 (https://download.01.org/0day-ci/archive/20240902/202409022236.7pEcEksT-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202409022236.7pEcEksT-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/tegra/output.c:42 tegra_output_connector_get_modes() error: uninitialized symbol 'drm_edid'.

vim +/drm_edid +42 drivers/gpu/drm/tegra/output.c

fb83be8873909b Hans Verkuil   2017-09-11  20  
132085d84fca65 Thierry Reding 2014-11-28  21  int tegra_output_connector_get_modes(struct drm_connector *connector)
d8f4a9eda00678 Thierry Reding 2012-11-15  22  {
d8f4a9eda00678 Thierry Reding 2012-11-15  23  	struct tegra_output *output = connector_to_output(connector);
98365ca74cbfae Jani Nikula    2024-08-22  24  	const struct drm_edid *drm_edid;
d8f4a9eda00678 Thierry Reding 2012-11-15  25  	int err = 0;
d8f4a9eda00678 Thierry Reding 2012-11-15  26  
acde541324dcfe Thierry Reding 2014-01-13  27  	/*
acde541324dcfe Thierry Reding 2014-01-13  28  	 * If the panel provides one or more modes, use them exclusively and
acde541324dcfe Thierry Reding 2014-01-13  29  	 * ignore any other means of obtaining a mode.
acde541324dcfe Thierry Reding 2014-01-13  30  	 */
9be7d864cf0763 Thierry Reding 2013-08-30  31  	if (output->panel) {
06c4a9c2ae606a Sam Ravnborg   2019-12-07  32  		err = drm_panel_get_modes(output->panel, connector);
9be7d864cf0763 Thierry Reding 2013-08-30  33  		if (err > 0)
9be7d864cf0763 Thierry Reding 2013-08-30  34  			return err;
9be7d864cf0763 Thierry Reding 2013-08-30  35  	}
9be7d864cf0763 Thierry Reding 2013-08-30  36  
98365ca74cbfae Jani Nikula    2024-08-22  37  	if (output->drm_edid)
98365ca74cbfae Jani Nikula    2024-08-22  38  		drm_edid = drm_edid_dup(output->drm_edid);
d8f4a9eda00678 Thierry Reding 2012-11-15  39  	else if (output->ddc)
98365ca74cbfae Jani Nikula    2024-08-22  40  		drm_edid = drm_edid_read_ddc(connector, output->ddc);
d8f4a9eda00678 Thierry Reding 2012-11-15  41  
98365ca74cbfae Jani Nikula    2024-08-22 @42  	drm_edid_connector_update(connector, drm_edid);
98365ca74cbfae Jani Nikula    2024-08-22  43  	cec_notifier_set_phys_addr(output->cec,
98365ca74cbfae Jani Nikula    2024-08-22  44  				   connector->display_info.source_physical_address);
d8f4a9eda00678 Thierry Reding 2012-11-15  45  
98365ca74cbfae Jani Nikula    2024-08-22  46  	err = drm_edid_connector_add_modes(connector);
98365ca74cbfae Jani Nikula    2024-08-22  47  	drm_edid_free(drm_edid);
d8f4a9eda00678 Thierry Reding 2012-11-15  48  
d8f4a9eda00678 Thierry Reding 2012-11-15  49  	return err;
d8f4a9eda00678 Thierry Reding 2012-11-15  50  }
d8f4a9eda00678 Thierry Reding 2012-11-15  51  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
