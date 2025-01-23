Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B68620B22
	for <oe-kbuild@lists.linux.dev>; Thu, 23 Jan 2025 15:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737645470; cv=none; b=fg1VRXKazFOuUvpMhEhSc9KO8nCawIiM7/Er+b7gm3ohdV57evXTjT6YnDyrdiNi7drMW66hKRAXbutIK4OJ/chLRYSEiQ/8Lvg8WfQj/vTOGuB0+hEETUYGTD9oQDEThu/86qgDx4sWmS6vqtXpPlJENSAmMOWa+yG4w27jjsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737645470; c=relaxed/simple;
	bh=8AmufEixuSV3iSm0/So0PgekalpwtILSl7eaNSYcnlU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IhACikcaVR8/QcIy/hgLRBAqDQeeoch6gpiQ+DBb8Bhs0ARdP2leWi5KPnkcXzwfVG9JJJ/g2GdP9IFIWZbVbYRSN5OBg9p449VwAXaqEQ66vdEUSADPxRxRHoi4gNURD7VPNYhaQpWFMZJisWPvLiCOOJj3KK/FMGmkJd5V0xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=czgWKCek; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="czgWKCek"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737645468; x=1769181468;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8AmufEixuSV3iSm0/So0PgekalpwtILSl7eaNSYcnlU=;
  b=czgWKCek6fT8iL4nV/d/VFA4gMmt6OwLUEMp6Gqtl1Nk6XaXrKU4yjve
   uNTWz33K8asNGzgkEy9W7vMNgpqXJEIkmQceAeKsj2uzh7qpfV/QF1WMM
   fM2CYOAEIf0q2pGF9y38UeFEQ7j9JkIxt5DJNygvwgNoJpS4XWUWYRApG
   rzK1PC16mzpGPdGetEWSIJG3qA/uR63i1OJz3wv7kqMcfbwapuQSzoDdq
   T/OFPqKHMHzTPbdfjBmjT8m/OR0XYjelktualuI+wmqk6FT9wNCcyNvLw
   rZIGTVj8uFR9qgUPLYYQYEvKzy3egl5YOVX0bM3HKTct6WZHjZ6YxKOtA
   g==;
X-CSE-ConnectionGUID: 3YNEc52QQJydsEAx0fddHQ==
X-CSE-MsgGUID: 2QJT/JYPSe+aS8EyIxPXtA==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="63496893"
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="63496893"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jan 2025 07:17:48 -0800
X-CSE-ConnectionGUID: pAYiopdJT2uKIMZhR+sz8Q==
X-CSE-MsgGUID: eyRU7N2OReacg8xTZKa/6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,228,1732608000"; 
   d="scan'208";a="108025860"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2025 07:17:46 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tayxk-000bLD-2h;
	Thu, 23 Jan 2025 15:17:44 +0000
Date: Thu, 23 Jan 2025 23:17:27 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v5 1/2] dt-bindings: iio: light: Add APDS9160 binding
Message-ID: <202501232301.K6RO2igz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "dtcheck: binding changes may go via different trees"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250122-apds9160-driver-v5-1-5393be10279a@dimonoff.com>
References: <20250122-apds9160-driver-v5-1-5393be10279a@dimonoff.com>
TO: "Mikael Gonella-Bolduc via B4 Relay" <devnull+mgonellabolduc.dimonoff.com@kernel.org>
TO: Jonathan Cameron <jic23@kernel.org>
TO: "Lars-Peter Clausen" <lars@metafoo.de>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nick Desaulniers <ndesaulniers@google.com>
TO: Bill Wendling <morbo@google.com>
TO: Justin Stitt <justinstitt@google.com>
CC: "Mikael Gonella-Bolduc" <m.gonella.bolduc@gmail.com>
CC: linux-iio@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: llvm@lists.linux.dev
CC: Hugo Villeneuve <hvilleneuve@dimonoff.com>
CC: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>, Matti Vaittinen <mazziesaccount@gmail.com>

Hi Mikael,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 5de07b8a24cf44cdb78adeab790704bf577c2c1d]

url:    https://github.com/intel-lab-lkp/linux/commits/Mikael-Gonella-Bolduc-via-B4-Relay/dt-bindings-iio-light-Add-APDS9160-binding/20250123-070158
base:   5de07b8a24cf44cdb78adeab790704bf577c2c1d
patch link:    https://lore.kernel.org/r/20250122-apds9160-driver-v5-1-5393be10279a%40dimonoff.com
patch subject: [PATCH v5 1/2] dt-bindings: iio: light: Add APDS9160 binding
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: csky-randconfig-051-20250123 (https://download.01.org/0day-ci/archive/20250123/202501232301.K6RO2igz-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 14.2.0
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250123/202501232301.K6RO2igz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202501232301.K6RO2igz-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/iio/light/brcm,apds9160.yaml: ps-cancellation-current-picoamp: missing type definition

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
