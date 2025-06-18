Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C7519DFA2
	for <oe-kbuild@lists.linux.dev>; Wed, 18 Jun 2025 07:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750231100; cv=none; b=RiUk31B0Cm2jRINej9PTEmDkp/AJzQIxWF/CMzmjoaPO2RDs8uug9k0DkL4AHX4piqIA933WAiXmhiEaBkrooQs1xxNsyHnbadggvcMGV7HjV2uyZnRuLGcMgM4LOnWsfnLkJvysTXosIi2XTMyG3HqJwvviKbOCshHbUMlX8T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750231100; c=relaxed/simple;
	bh=VbzXOz91XNv38fKL9zGaJB0dFBRUtOcNSRV/sahf1Lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C/g8pUePP0AAWMwLgrocAB1j8GcQ0szOtObVCy83EVkf8Uwr++1d/qBMtgDOHV/GZY6vjsuFzBG+wWsM9SoiO5Iqc44BjBbPqDyXA0xv+Q8VAvmb46tkBnS6sL/h6r2ffX8n0Y8cKIRoVUx9XjIEwGtIvHDEgstFGL+PQCqiwUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ayCjrhPg; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ayCjrhPg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750231099; x=1781767099;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VbzXOz91XNv38fKL9zGaJB0dFBRUtOcNSRV/sahf1Lw=;
  b=ayCjrhPgcjCAGJRtx0EbfFyFNPu2K9sbC5pFdFJFpjRBW2bDtFVY+Xh1
   nXxNfsZeInQq4AkxsYYPH0Or5mwisgthZ1wvAqU0rpab9M5RvMA4VCUCr
   Gq3k8R+yKhr6THtgvM0zHBHY7LBDvwb3vFa/+EsYXfJih4wzs7WqaeAHe
   UESUxqtCYgUI1iMz9HPWoGkMhkoCIBsMWq0aOiMTyc0B353UL/uk4bGW6
   AWW2XJQCH3vM1EhzjCRAmDjaQpTAfvfd3TWOPNsfBC7D4Mw4bYc+uds9E
   aipgUo1xEno4Tm8mRbQviH6fQEhZFprQw45IgjeJcP5XKuvh3hqRHmC0Q
   Q==;
X-CSE-ConnectionGUID: tmEPHsw6TsG2rQONCCF6tA==
X-CSE-MsgGUID: E6iJY3nNT0q4ZQOMpHHH5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="52523431"
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="52523431"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2025 00:18:12 -0700
X-CSE-ConnectionGUID: AplHvrpCRmyKTgDq3aCM1Q==
X-CSE-MsgGUID: NulZGI9kQA2aKOYdW98fFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,245,1744095600"; 
   d="scan'208";a="153214994"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Jun 2025 00:18:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRn3g-000JVK-2L;
	Wed, 18 Jun 2025 07:18:08 +0000
Date: Wed, 18 Jun 2025 15:17:17 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V3 19/19] virtio_ring: add in order support
Message-ID: <202506181549.sXYT8j1M-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "loongarch: unreachable instruction"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250616082518.10411-20-jasowang@redhat.com>
References: <20250616082518.10411-20-jasowang@redhat.com>
TO: Jason Wang <jasowang@redhat.com>

Hi Jason,

kernel test robot noticed the following build warnings:

[auto build test WARNING on mst-vhost/linux-next]
[also build test WARNING on linus/master v6.16-rc2 next-20250618]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Wang/virtio_ring-rename-virtqueue_reinit_xxx-to-virtqueue_reset_xxx/20250616-163418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux-next
patch link:    https://lore.kernel.org/r/20250616082518.10411-20-jasowang%40redhat.com
patch subject: [PATCH V3 19/19] virtio_ring: add in order support
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: loongarch-randconfig-r072-20250618 (https://download.01.org/0day-ci/archive/20250618/202506181549.sXYT8j1M-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250618/202506181549.sXYT8j1M-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506181549.sXYT8j1M-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/virtio/virtio_ring.o: warning: objtool: detach_buf_split_in_order+0xfc: unreachable instruction
   drivers/virtio/virtio_ring.o: warning: objtool: virtqueue_add_packed_in_order+0x8c: unreachable instruction
   drivers/virtio/virtio_ring.o: warning: objtool: virtqueue_add_packed+0x90: unreachable instruction
   drivers/virtio/virtio_ring.o: warning: objtool: virtqueue_add_split+0x88: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
