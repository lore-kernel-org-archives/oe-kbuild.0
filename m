Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0955E258CFB
	for <oe-kbuild@lists.linux.dev>; Wed, 26 Feb 2025 08:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740557519; cv=none; b=N/EDhGszcyLBYB0Hiw7uwyIniZk72F073W+1dx7D5wmYyeMIrZRnFaRQ0AzTPE+OJxyzfzQzWp2hBPZOgaM3elrwphzK9+sX9+qn4c3LdjrDN4xatlsuWAddlLj5T/JwbTU3EeAnHnUyBHW9aPT0IlctsY8cQGZkBka7V5Y4m68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740557519; c=relaxed/simple;
	bh=s+Bjwoi8YJrIqN97bYect5gD3M0uZEvCHwTZ97to1J0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=CPQjxm1/77+S7agT+sbO53+26lQWRQ4YLaKpW34T4aq+uNZOj6ouPXd5nOSualrSVpnzUaw2spDDL6CLKqXbENYM9hPKKWqRk0A1LxIy3ixFGQlM3cQOTmLNKaHmg68m6buNNNIJ5e/2u3pF7Hug0mS0vX3ocpMZlcfaXYHsI8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PyNPicHV; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PyNPicHV"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ab78e6edb99so921444966b.2
        for <oe-kbuild@lists.linux.dev>; Wed, 26 Feb 2025 00:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740557515; x=1741162315; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Pok0mIvLeITMrChGwDUbCNIfuZyPgW77IlN7F5j/3WM=;
        b=PyNPicHVHCLGOp0aaho1gBjAoTm/tAHHseDVjnelsTJcL61R/tlidZDslaTWIwOdi6
         c3AO93V/rB0N8/D5Cnd+rNYyJI3ZgOcbB82SR/K2qsnXL+ydoz/OqG7YgoR3tlLRQ04U
         prXaryRi49IselziiqaiMP2kWA2MmBMTmBEigmtlaOejXhROHlgOz6rTOw+dgoVNfrj2
         72FNesz17NLW6s2yM1rauxhUoTg0HVHXrhYmxkcbJgPtSODID9f4dAjC/pXiCLZ7ngGl
         RuHrm4qpR4zGOPN1gSCvfky6IMIkO31WTtaSkR4EQmOxjr51JtDjbs8gIa0yANeDUpfw
         H/YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740557515; x=1741162315;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pok0mIvLeITMrChGwDUbCNIfuZyPgW77IlN7F5j/3WM=;
        b=H4bYr6w8bJzvRHmbVCO9rf7Q69O28PntGwye6jIswxMhCPBW3Q2zk6RG/+036RGHcq
         MT+KWCSboQTTidLkUFCAkrIv7JLG6TqJ7JFQuXJdM1VPXCjwrg0WuoyL3bsZ09UlQ3wl
         YlgeckF0xCyv6Pz5jsbiofR0+LXJAtOwuHbYVtKZ4y7E5XUIlMkhdxQnaaNnpscgjh/W
         1abK9MZ0FTFdrBffwXYY+PpPdcZOAgmw7Z731mzTGBK1XlLufHwkx9HOuES04zCP0rG8
         cm7cFXKjVynv5BdW57Lp2ouKMZ8VzlvRzp5y8Q0BB3kr40Ty4eDVlaGn4Ao7Qr5FSYg0
         NLxQ==
X-Gm-Message-State: AOJu0YyXFks+j81VINxKe3wyGGjFjK+53wX3Di1Bjb0CNJn355AqllaZ
	i6eRXPzo1Wux2KF6EfOF0FOGmjFqEZSjNRSQWBlCrFTWVFngM66YXCDVYFUK0qmT/uSVQhUN8AW
	D
X-Gm-Gg: ASbGncvzzdUrIcZ1gRihaAsR0OcKSSI7DplFJUXD90QpbcqFyMWI8VwY0sR9HR46ah/
	04OhFo2U+8fKiqFKbltzYh9M0JR8uyoUNSt7Fmt7mOZUyiE9KUDA04auDaqU4xRSPe+LgjQQMk9
	8TZoxAeJAH19xvqJsqv43X5qApisfq4s1RU9DwSetj6CHY6yAZGYmV+mjIP270n7+vbB/fPABM5
	221BtIQUpPC9d6FKdoG8hm/bHFNfWF/7PJW0h8iAh7useNfKc0g13MWW6KCg/sVry2DIzov+Uu4
	btExUkLFTFko8TvL0+wzJwMMg3bvLig=
X-Google-Smtp-Source: AGHT+IGFjBlz6ALqfYLoGE9PxwjThSMXDCGpI9ssfGq+g0dABRHwtq/nG1O3LTVG+zq6GwCLFDOijA==
X-Received: by 2002:a17:907:7f0c:b0:abc:269d:d534 with SMTP id a640c23a62f3a-abeeef34ed6mr250207266b.40.1740557515475;
        Wed, 26 Feb 2025 00:11:55 -0800 (PST)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-abed1da1c2dsm284791366b.77.2025.02.26.00.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 00:11:54 -0800 (PST)
Date: Wed, 26 Feb 2025 11:11:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Animesh Manna <animesh.manna@intel.com>,
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev, jouni.hogander@intel.com,
	jani.nikula@intel.com, jeevan.b@intel.com,
	Animesh Manna <animesh.manna@intel.com>
Subject: Re: [PATCH v4 7/8] drm/i915/lobf: Add mutex for alpm update
Message-ID: <51d3816e-2201-4d02-a6a7-def3a4398e77@stanley.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250224080847.326350-8-animesh.manna@intel.com>

Hi Animesh,

kernel test robot noticed the following build warnings:

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Animesh-Manna/drm-i915-lobf-Add-lobf-enablement-in-post-plane-update/20250224-221647
base:   v6.14-rc4
patch link:    https://lore.kernel.org/r/20250224080847.326350-8-animesh.manna%40intel.com
patch subject: [PATCH v4 7/8] drm/i915/lobf: Add mutex for alpm update
config: i386-randconfig-141-20250225 (https://download.01.org/0day-ci/archive/20250226/202502261244.aUuaLdTn-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
| Closes: https://lore.kernel.org/r/202502261244.aUuaLdTn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/display/intel_alpm.c:548 intel_alpm_disable() warn: inconsistent returns '&intel_dp->alpm_parameters.lock'.

vim +548 drivers/gpu/drm/i915/display/intel_alpm.c

026d6557dc2749d Animesh Manna 2025-02-24  527  void intel_alpm_disable(struct intel_dp *intel_dp)
026d6557dc2749d Animesh Manna 2025-02-24  528  {
026d6557dc2749d Animesh Manna 2025-02-24  529  	struct intel_display *display = to_intel_display(intel_dp);
026d6557dc2749d Animesh Manna 2025-02-24  530  	enum transcoder cpu_transcoder = intel_dp->alpm_parameters.transcoder;
026d6557dc2749d Animesh Manna 2025-02-24  531  
026d6557dc2749d Animesh Manna 2025-02-24  532  	if (DISPLAY_VER(display) < 20)
026d6557dc2749d Animesh Manna 2025-02-24  533  		return;
026d6557dc2749d Animesh Manna 2025-02-24  534  
737b2873a48f3ab Animesh Manna 2025-02-24  535  	mutex_lock(&intel_dp->alpm_parameters.lock);
737b2873a48f3ab Animesh Manna 2025-02-24  536  
026d6557dc2749d Animesh Manna 2025-02-24  537  	if (!(intel_de_read(display, ALPM_CTL(display, cpu_transcoder)) & ALPM_CTL_ALPM_ENABLE))
026d6557dc2749d Animesh Manna 2025-02-24  538  		return;

mutex_unlock(&intel_dp->alpm_parameters.lock) before the return

026d6557dc2749d Animesh Manna 2025-02-24  539  
026d6557dc2749d Animesh Manna 2025-02-24  540  	intel_de_rmw(display, ALPM_CTL(display, cpu_transcoder),
026d6557dc2749d Animesh Manna 2025-02-24  541  		     ALPM_CTL_ALPM_ENABLE | ALPM_CTL_LOBF_ENABLE |
026d6557dc2749d Animesh Manna 2025-02-24  542  		     ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
026d6557dc2749d Animesh Manna 2025-02-24  543  
026d6557dc2749d Animesh Manna 2025-02-24  544  	intel_de_rmw(display,
026d6557dc2749d Animesh Manna 2025-02-24  545  		     PORT_ALPM_CTL(cpu_transcoder),
026d6557dc2749d Animesh Manna 2025-02-24  546  		     PORT_ALPM_CTL_ALPM_AUX_LESS_ENABLE, 0);
737b2873a48f3ab Animesh Manna 2025-02-24  547  
737b2873a48f3ab Animesh Manna 2025-02-24 @548  	mutex_unlock(&intel_dp->alpm_parameters.lock);
026d6557dc2749d Animesh Manna 2025-02-24  549  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

