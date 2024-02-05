Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 887762C688;
	Mon,  5 Feb 2024 14:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707143695; cv=none; b=lMO22/YmTfJYdqyjO3z/Pmeqvq5ue31Rk20XsiTyTueLNcpwHqkEByT3CzcRR1MjVaeIDGSwIsrtakzHt5utXIYw23+xlidZf+T4vL2HuiGtLHOHMpBIoTL7VWApvBgdS1G/FgNm3wJSUtuzT9dViO6nvqWeiSIZ71Vu9PRiyI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707143695; c=relaxed/simple;
	bh=JqLu76La2hcnkxdTS1M5xTrl6xVJmtzm1hZjkfBktuY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WfZnyvpuF1FoWulvYZc/WEMgH8CSP4YrBYRqcxP8Obscd2g+ODYE7inHR66m18TSPIOASp5TJEHjPYaFDFBR1PC55mVafhF/5uAHdwMjnaNLnSE9XHgNYvWxCZCA5kzUKh/Lx+RKs+j4VoYkGNEwjqikHSypplb/gKA0/DyA0C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DlwNGX3O; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DlwNGX3O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707143693; x=1738679693;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=JqLu76La2hcnkxdTS1M5xTrl6xVJmtzm1hZjkfBktuY=;
  b=DlwNGX3OcWmhEijeCBWkf1lZpkQDJ5DIStz0pXQOdeWsAXuM+nhkUh2U
   gXoq66FmrrrTaQNF2n6zOCxtHEE8vCTkNBsNwyVVkmdfoGtDIwxiwoJnw
   Tm21bZL7RQLh1FSMthI8raafzjhhkziXtxAoyIDDGTGm+Y0BOSuftxCck
   pNUp8VCAoRFJJaeXkbK0Oly8kWcArkUWlN7i4dzPxjm6txUi2NsPRNi6g
   rGyTWvfyxaKigziZ3Pc3aIRakBK8CaQQxQbUV0o1N4TRQvJnhv6CYtOzU
   hBnHps3Zwo5VADsUMUepGBefjwhKPIwrpuXSIfu32nCqkRRmfIg+uf/0w
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10974"; a="437334"
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="437334"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 06:34:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,245,1701158400"; 
   d="scan'208";a="23974999"
Received: from ckuuniff-mobl.amr.corp.intel.com (HELO [10.212.98.15]) ([10.212.98.15])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2024 06:34:52 -0800
Message-ID: <f84fee13-945d-4e87-b55b-7c84c546c757@linux.intel.com>
Date: Mon, 5 Feb 2024 08:34:51 -0600
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [plbossart-sound:fix/sdw-jd 6/12] drivers/soundwire/intel.c:448
 intel_link_power_up() warn: inconsistent returns 'sdw->link_res->shim_lock'.
To: Dan Carpenter <dan.carpenter@linaro.org>, oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
References: <17a8ab24-989d-438f-a219-8931a27565b6@moroto.mountain>
Content-Language: en-US
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
In-Reply-To: <17a8ab24-989d-438f-a219-8931a27565b6@moroto.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



> smatch warnings:
> drivers/soundwire/intel.c:448 intel_link_power_up() warn: inconsistent returns 'sdw->link_res->shim_lock'.

> bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  368  	if (prop->mclk_freq % 6000000) {
> bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  369  		if (prop->mclk_freq % 2400000) {
> bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  370  			if (lcap_mlcs) {
> bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  371  				syncprd = SDW_SHIM_SYNC_SYNCPRD_VAL_24_576;
> bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  372  				clock_source = SDW_SHIM_MLCS_CARDINAL_CLK;
> bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  373  			} else {
> bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  374  				dev_err(sdw->cdns.dev, "%s: invalid clock configuration, mclk %d lcap_mlcs %d\n",
> bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  375  					__func__, prop->mclk_freq, lcap_mlcs);
> bb96c1f7a330ea Pierre-Louis Bossart 2023-09-19  376  				return -EINVAL;
> 
> Needs to unlock before returning

Nice catch, thanks for the report.
Fixed in https://github.com/thesofproject/linux/pull/4806
-Pierre
