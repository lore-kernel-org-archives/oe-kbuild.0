Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793811367;
	b=qx45J3aZSmGryAE1jJaU/91uwWtoq5IYITEaCnaC+QWZzAxUg0qFrzQzxJqx7v+x5vwl
	 1zjRKIy3hpQKSLQDjbDNKpiNXDlqfZWMbFIKWym+BkGwrsU4vxw68PlJYSuMYmj+6l3BX
	 jh6xwQevjLJexOsGa3vRpjtx2vGnmBQK/kmun56isORYJB87KHIGPVhVUg18feVzLqjkw
	 pf3JTwIhWJiygCiL7Od8JggaSENROiK+ziggQm8Ze4zYoMBekTexv+Z/dvVbqHHTSJPge
	 hoIzAtC9KiF3PJpWZyuz6aeJTTEMMAJQMHI18LQ6z3o9g15ygRksyBpxfDHwQW35fWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793811367;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=3vohvEzGwtLidgZHsBYiwYjGeNYKL+lMJpyxk7keZbw=;
	b=uFyIiGIlXRcVo+LfSO8lk49QG4cr5gIlabkrV2kDD/IWX7oeH3ffjvovtW4TW5Bj955m
	 q3xIbkXgU0KEbnkfQ9F3J7eGDb5XDxn+0wQND2HjYaMlEBm3YOxqPgl9wNYrR4qGXJmzG
	 kJTi0d+CrGQw9cYzRGKJ1Y9ob2o9lTs+p9KQ2K6P2cA7+NCzhQvw5wRkAtSgE19K+8Q2H
	 zi2OnHjyb2u5xHrbIjM9HJ4BlM46xMkg9Ma6+x7cdApE9j0GVv2DLnMi46Gnr6jUjaJx1
	 7ozYi/Y3Kh0U8Z52PMtoXfEzO1QL0WR85ZIyWCRoaL68tASOigTWKX/0yOAK9qJaWdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fTT4eXIw;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CD96606A31B
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Nov 2026 16:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CD96606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fTT4eXIw
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793811367; x=1825347367;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=2Rrm7PBRbogeUdNE0/gGhIJZnNnZ1Ch0JKzeZaQZhok=;
  b=fTT4eXIwQChxc5gk0esQSmjAhNbbsGD+oDIgO+oL0Nss2EPDOzZNIHV2
   x7dOi255vquqXEpZ0geSSMhKM8Ny8L9TALtWLE2yKwG8Mq2xp2EL6vnYS
   XYaPR6B8y6C6/BQA3ABtXwdbhZBnam9erb20908mvvvkdrOEUhfpN1ImK
   /aooyDFPTjSiBmfht3e9LLf5VAei5wPKIvLn/oA+1VuQ8QiPSXgw6dpeX
   xf+XkZqHDNtBjPOh6EnW9ZNJutnOEZDMEjXHi6uR9szARGboi0IpFWzV4
   G5BfnqgFOl/4BTZeIadApLm1w9nkrKvwpX0JOccQ682PleoDDfaMvCiYp
   Q==;
X-CSE-ConnectionGUID: qjELrhqxTheQdmHYrM4Wug==
X-CSE-MsgGUID: KL90+4JnSK6t07OoU59Awg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2589116"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2589116"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 08:56:04 -0800
X-CSE-ConnectionGUID: EDuwml9fRgiJ8JSXyfcQRg==
X-CSE-MsgGUID: s2QsPB9KTeCHGl9VMGLx/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6594872"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 04 Nov 2026 08:56:03 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOeHJ-00000000kiN-1zG0;
	Wed, 04 Nov 2026 16:56:01 +0000
Date: Thu, 5 Nov 2026 00:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 12/16] accel/thames: Install memory mappings populated
 and dirty
Message-ID: <202611050038.6yfWgymQ-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261023-thames-v3-12-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-12-3ab40aa17157@tomeuvizoso.net>
TO: Tomeu Vizoso <tomeu.vizoso@gmail.com>
TO: Nishanth Menon <nm@ti.com>
TO: "Andrew F. Davis" <afd@ti.com>
TO: Randolph Sapp <rs@ti.com>
TO: Jonathan Humphreys <j-humphreys@ti.com>
TO: Andrei Aldea <a-aldea@ti.com>
TO: Chirag Shilwant <c-shilwant@ti.com>
TO: Vignesh Raghavendra <vigneshr@ti.com>
TO: Beleswar Padhi <b-padhi@ti.com>
TO: Tero Kristo <kristo@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Oded Gabbay <ogabbay@kernel.org>
TO: Jonathan Corbet <corbet@lwn.net>
TO: Sumit Semwal <sumit.semwal@linaro.org>
TO: "Christian König" <christian.koenig@amd.com>
TO: Robert Nelson <robertcnelson@gmail.com>
TO: David Airlie <airlied@gmail.com>
TO: Simona Vetter <simona@ffwll.ch>
TO: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
TO: Maxime Ripard <mripard@kernel.org>
TO: Thomas Zimmermann <tzimmermann@suse.de>
TO: Jani Nikula <jani.nikula@linux.intel.com>
TO: Tvrtko Ursulin <tursulin@ursulin.net>
TO: Markus Elfring <Markus.Elfring@web.de>
TO: Bjorn Andersson <andersson@kernel.org>
TO: Mathieu Poirier <mathieu.poirier@linaro.org>
TO: Suman Anna <s-anna@ti.com>
TO: Kees Cook <kees@kernel.org>
TO: "Gustavo A. R. Silva" <gustavoars@kernel.org>

Hi Tomeu,

kernel test robot noticed the following build errors:

[auto build test ERROR on 1ecab8b0bad393750c60cc3819ce9c256595463c]

url:    https://github.com/intel-lab-lkp/linux/commits/Tomeu-Vizoso/dt-bindings-remoteproc-k3-dsp-Add-the-L2-auxiliary-and-DRU-regions/20261023-083926
base:   1ecab8b0bad393750c60cc3819ce9c256595463c
patch link:    https://lore.kernel.org/r/20261023-thames-v3-12-3ab40aa17157%40tomeuvizoso.net
patch subject: [PATCH v3 12/16] accel/thames: Install memory mappings populated and dirty
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20261105/202611050038.6yfWgymQ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 186e70f4e6a1521991d2340d3d49b23b1beff11f)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261105/202611050038.6yfWgymQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611050038.6yfWgymQ-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: drivers/accel/thames/thames.ko: symbol 'mio_wb_bit_mask' undefined!

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
