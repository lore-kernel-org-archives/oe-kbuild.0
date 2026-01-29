Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA0293596E3
	for <oe-kbuild@lists.linux.dev>; Thu, 29 Jan 2026 02:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769654649; cv=none; b=sgsbvz2kqQCtYOcJW6Wi+Yg2OaiRMA6a+MjCTSZkHFEh6cNYp3GX7Y9e4YJ0cpY3mpxN4IvsVNmDyU+dK8y0Su+3zAEZOvFQFn6uSGVeb59o6c8Vc2qJCstwCi0kQDEWUqGUpAEIoHdsZY9EkEJF674k84Cep0VPhgG45ExjO5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769654649; c=relaxed/simple;
	bh=13LJhM+JQh9VwKaqfpDvoOnwNJNg3MKLBS2fWIgViD4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iJ0ZvQ2BvWNVFmgPlydn9V1MEQnPAnLzkcEyjKtqMOL701AXlom8VqR/zsbFw/pNlyu5k6Cr50+0hd9uTKpoK5POFt9F4Z7twArSwLqUPOgka9DFTk295dLIbSL7fDYnNQ/z0EkysqLn+5qjL6nyedJXD6eJ812hnVDGjvYNWOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dT8/CrBK; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dT8/CrBK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769654635; x=1801190635;
  h=date:from:to:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=13LJhM+JQh9VwKaqfpDvoOnwNJNg3MKLBS2fWIgViD4=;
  b=dT8/CrBK0Ijjj5t4MamsL+W8EAEgRlQbbrXriHRNFZpNc+ceicSWJ6Bh
   9YqOv2DAPD1t3U5wTwrfTp389LBgy8F2pogHNZ11YN7ZpbTQlgqD66c1G
   OFM85M57Yp99CqUobM4gQno9iw2oE05Ss31lr8OF8UA0c0WgSPpV5CO0p
   CWL875kIa6J2Vg9iMPkxbmQv/sffV0kMC9Y5zZarWvx49pwZ0Vod5Gxjl
   /aAdmYIUIqeFiUkVVJZOnJ0QrHPeEzA0OF0Kpro3Y2L0Oqqkl6KqM3cKj
   Dgs5D/ibE4dztaHtnx5vPVlMkRj0uf6XwMadCe5Y0zjK3ZLo7OxQ0nljT
   g==;
X-CSE-ConnectionGUID: Y/KieUjNQiOgR+OtqpXKLQ==
X-CSE-MsgGUID: DNbF6uONSbSriw5P3XGAiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="74743805"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="74743805"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2026 18:43:52 -0800
X-CSE-ConnectionGUID: pZKAX4x9QWeU32mqMppnBg==
X-CSE-MsgGUID: thhX9o8hRG6ze8IyLM7LEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; 
   d="scan'208";a="208036848"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 28 Jan 2026 18:43:51 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vlI0b-000000002AP-1oPO
	for oe-kbuild@lists.linux.dev;
	Thu, 29 Jan 2026 02:43:49 +0000
Date: Thu, 29 Jan 2026 03:43:16 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Subject: Re: [PATCH] virtio_ring: Add READ_ONCE annotations for
 device-writable fields
Message-ID: <202601290346.ZWj0htFr-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "high confidence checkpatch report"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260128135947.455686-1-johannes.thumshirn@wdc.com>
References: <20260128135947.455686-1-johannes.thumshirn@wdc.com>
TO: Johannes Thumshirn <johannes.thumshirn@wdc.com>
TO: "Michael S. Tsirkin" <mst@redhat.com>
TO: Jason Wang <jasowang@redhat.com>
TO: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
TO: "Eugenio Pérez" <eperezma@redhat.com>
TO: virtualization@lists.linux.dev
TO: linux-kernel@vger.kernel.org

Hi Johannes,

kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Johannes-Thumshirn/virtio_ring-Add-READ_ONCE-annotations-for-device-writable-fields/20260128-220827
base:   linus/master
patch link:    https://lore.kernel.org/r/20260128135947.455686-1-johannes.thumshirn%40wdc.com
patch subject: [PATCH] virtio_ring: Add READ_ONCE annotations for device-writable fields
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
reproduce: (https://download.01.org/0day-ci/archive/20260129/202601290346.ZWj0htFr-lkp@intel.com/reproduce)

# many are suggestions rather than must-fix

ERROR:BAD_SIGN_OFF: Unrecognized email address: 'Kernel Concurrency Sanitizer (KCSAN)'
#21: 
Reported-by: Kernel Concurrency Sanitizer (KCSAN)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
