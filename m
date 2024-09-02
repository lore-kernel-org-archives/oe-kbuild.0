Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0F421A2646;
	Mon,  2 Sep 2024 16:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725293746; cv=none; b=cp/4mj4gfyD3Bo+zTR7i35tpBAU+8rqR2FRRTXq2zu8wordon+ZdYXEkpOa7URnhn0ZroR1143faJlJgMdEU4S/vJ/+Pco9tGr89BtDvTWcfJ7mP+sHLwj4yVgzER7HMtwcCEm6Izb4EVLaWi8a3gCoSKUqosxlZ7EtbzcXH57A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725293746; c=relaxed/simple;
	bh=UvIJZ7bYERYqwsuwrbSpVj2YegamCtPJzXRVn+BwiYc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=D8XI5zZ2RQ4jALyGHzuS0Y8w9xmieJTtRCHSwLKzIlYNVOuxpayJGOloBlSS9rP1nYS8OvZ5j+d+G7XXjKcer0tDk8tUWO9uXNXmcwLb+PPOB7b0z9fpVmJKR8FjNZxgmkN/QaTknj3E5a55Z4KgkxdDLP9uuVAwAh2BnwOOpAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iXHFFdlb; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iXHFFdlb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725293743; x=1756829743;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=UvIJZ7bYERYqwsuwrbSpVj2YegamCtPJzXRVn+BwiYc=;
  b=iXHFFdlbCIm7fHksb1kfk+4QZz4ijWLPJBLXIcDmLsnL1oDsWSf9yi2G
   2HYdvRUuqmEolZqYxGVUZEA8+vgFjRL0kVc1dX+5rQrUMjVBphOvyu+ex
   w58pzO3mIZYqjG0DNqekdJ2SsHyHv2DakSLw7/kZnjxjTBUkw58QdoRJb
   LjuhHc5hmvPtx/AmxPs0zQNPHou4gllapOnoMdshhvQW5I539ftzayNo2
   uYeclX9/yCzSkhc8FMQYl2wx6TZixH0ubez7D7w+WZEQqDvvemmRQ64DG
   9vs6dgt2OLdoFXedIhgSW0I1539x6N9fsl4EDwQgYtJXsTuP/lmINtR64
   Q==;
X-CSE-ConnectionGUID: bt7+nd2SRaOwY38QQch/zg==
X-CSE-MsgGUID: 0nl+5nDnReC6Ny5wRwiRLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11183"; a="23447614"
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="23447614"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 09:15:43 -0700
X-CSE-ConnectionGUID: 1v07Ku3xQw2N05n5BqR9iw==
X-CSE-MsgGUID: xUo9z+pJQsG0uufZgZZaMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,195,1719903600"; 
   d="scan'208";a="102098298"
Received: from ltuz-desk.ger.corp.intel.com (HELO localhost) ([10.245.246.4])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2024 09:15:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: kernel test robot <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>,
 oe-kbuild-all@lists.linux.dev, Linux Memory Management List
 <linux-mm@kvack.org>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [linux-next:master 6570/8400] drivers/gpu/drm/tegra/output.c:42
 tegra_output_connector_get_modes() error: uninitialized symbol 'drm_edid'.
In-Reply-To: <ZtXLyXxew7z6H2bD@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <ZtXLyXxew7z6H2bD@stanley.mountain>
Date: Mon, 02 Sep 2024 19:15:27 +0300
Message-ID: <87y14at4kg.fsf@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, 02 Sep 2024, kernel test robot <dan.carpenter@linaro.org> wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
> head:   ecc768a84f0b8e631986f9ade3118fa37852fef0
> commit: 98365ca74cbfae16b793b62a7ecabb5be8d77785 [6570/8400] drm/tegra: convert to struct drm_edid
> config: nios2-randconfig-r072-20240902 (https://download.01.org/0day-ci/archive/20240902/202409022236.7pEcEksT-lkp@intel.com/config)
> compiler: nios2-linux-gcc (GCC) 14.1.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <error27@gmail.com>
> | Closes: https://lore.kernel.org/r/202409022236.7pEcEksT-lkp@intel.com/
>
> smatch warnings:
> drivers/gpu/drm/tegra/output.c:42 tegra_output_connector_get_modes() error: uninitialized symbol 'drm_edid'.
>
> vim +/drm_edid +42 drivers/gpu/drm/tegra/output.c
>
> 132085d84fca65 Thierry Reding 2014-11-28  21  int tegra_output_connector_get_modes(struct drm_connector *connector)
> d8f4a9eda00678 Thierry Reding 2012-11-15  22  {
> d8f4a9eda00678 Thierry Reding 2012-11-15  23  	struct tegra_output *output = connector_to_output(connector);
> 98365ca74cbfae Jani Nikula    2024-08-22  24  	const struct drm_edid *drm_edid;
>
> There used to be an = NULL here.
>
> d8f4a9eda00678 Thierry Reding 2012-11-15  25  	int err = 0;
> d8f4a9eda00678 Thierry Reding 2012-11-15  26  
> acde541324dcfe Thierry Reding 2014-01-13  27  	/*
> acde541324dcfe Thierry Reding 2014-01-13  28  	 * If the panel provides one or more modes, use them exclusively and
> acde541324dcfe Thierry Reding 2014-01-13  29  	 * ignore any other means of obtaining a mode.
> acde541324dcfe Thierry Reding 2014-01-13  30  	 */
> 9be7d864cf0763 Thierry Reding 2013-08-30  31  	if (output->panel) {
> 06c4a9c2ae606a Sam Ravnborg   2019-12-07  32  		err = drm_panel_get_modes(output->panel, connector);
> 9be7d864cf0763 Thierry Reding 2013-08-30  33  		if (err > 0)
> 9be7d864cf0763 Thierry Reding 2013-08-30  34  			return err;
> 9be7d864cf0763 Thierry Reding 2013-08-30  35  	}
> 9be7d864cf0763 Thierry Reding 2013-08-30  36  
> 98365ca74cbfae Jani Nikula    2024-08-22  37  	if (output->drm_edid)
> 98365ca74cbfae Jani Nikula    2024-08-22  38  		drm_edid = drm_edid_dup(output->drm_edid);
> d8f4a9eda00678 Thierry Reding 2012-11-15  39  	else if (output->ddc)
> 98365ca74cbfae Jani Nikula    2024-08-22  40  		drm_edid = drm_edid_read_ddc(connector, output->ddc);
>
> I mean presumably either ->drm_edid or ->ddc is true, but you can see why the
> checker complains.

Yeah, my bad. Fix at [1].

BR,
Jani.

[1] https://lore.kernel.org/r/20240902161317.2437148-1-jani.nikula@intel.com

>
> d8f4a9eda00678 Thierry Reding 2012-11-15  41  
> 98365ca74cbfae Jani Nikula    2024-08-22 @42  	drm_edid_connector_update(connector, drm_edid);
> 98365ca74cbfae Jani Nikula    2024-08-22  43  	cec_notifier_set_phys_addr(output->cec,
> 98365ca74cbfae Jani Nikula    2024-08-22  44  				   connector->display_info.source_physical_address);
> d8f4a9eda00678 Thierry Reding 2012-11-15  45  
> 98365ca74cbfae Jani Nikula    2024-08-22  46  	err = drm_edid_connector_add_modes(connector);
> 98365ca74cbfae Jani Nikula    2024-08-22  47  	drm_edid_free(drm_edid);
> d8f4a9eda00678 Thierry Reding 2012-11-15  48  
> d8f4a9eda00678 Thierry Reding 2012-11-15  49  	return err;
> d8f4a9eda00678 Thierry Reding 2012-11-15  50  }

-- 
Jani Nikula, Intel
