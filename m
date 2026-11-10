Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341152;
	b=S8DS/O+1e1AxUXQvF0CupSyKuRO68N4iZUeikjA8J0+3bbDmd+SwgE4bT6WQ+L/KlCO3
	 itq0XwmsQ75+65BNkJPmMqwHFA0XDzC4a3tLoTnk6gY9872UrUfsMPOMQrCR+hb/DR4ot
	 s1gP7ZcJg6QbxJNU+Qqdnn1hBMa5q64FZj3icq8wFAKxTKUlcEyvV3hyGHH2zQZ83OxFj
	 J4CMqRotWU9GkA9Ds1xqu6cA38xoVZu5DIglQh+44JZ2rkz/dZ3lgmfxP7YBhnNrF3WZk
	 vUnIAIn75/xHx9YDhhOglBlzI+BHLjl3OxZwbFKQBltOU67i2wEOabrsQD+uRUkTSIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341152;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=tqudIgoOhasCIB9Z8fR5+GmfVXmsg0C35hnU1Eh9HjE=;
	b=yl2MV4cXEfVhIiGYCZk3yLWLxb1CBGTMfRfRe8sWDd5CqeiSU7Y4i/PB6C0XNltdpyu4
	 G7ODkA6TdMBnLP2+QV8dfditkUqMacQk3LP1EaWxCZ7D0TuETRAhFQ4QUOQxHotePX1x0
	 JRwKwOnK7cWLm7I9uoAj4RlnibVbpM4w6fD/2/NTXbER3/FlIRcDtZPMNA4FkoXukBype
	 E1Y7k42/BPRgbCc+Fm42jHpsv6E91Tu13SqFG2Ncyljw68EQAKIY0qa3sih7WP9aWA/Zf
	 mSmybjqlajIHGpMMT59/VV7J87iXd5t97AJmAeYYgLbq9SCFt3opWHS1JLaVFqQmflA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MPUPip7a;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FFBD606A31C
	for <oe-kbuild@lists.linux.dev>; Tue, 10 Nov 2026 20:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FFBD606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=MPUPip7a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794341152; x=1825877152;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+vk/mHy4EdXrTOIOBZJt2KNS7ytLWCW90KsQjGH3GFU=;
  b=MPUPip7a79X5k73DXiZQRbZ/wVLS5JThONQaGLG5FSIBcvlZX1S3o87y
   J/6GbeuGaBl2VgR6iZCznDOWZVTyprykikfJToqNLHT/OV0WKnFCqNV52
   4JCXkK62Cu296Tee9Y7fWY3/ztR1QjBT96A5rSnXIXOmX/JdjX1N3kwYS
   fZRsotRu6O0d/r7ziAUx/B1zyWKjbqJdUxZCP/NvcNX1YezuRyLtPABIl
   61qtrAxNIkhmRS1MLskF7XqQzjL/0mkY3rHLLYOh7SIVgZQGOb/X/2S4F
   /mfUZgUCMwy81GqvZKy7LAVu5D/aDXzmEisvwu2Ac6TSVDVGS1MWjFgG0
   g==;
X-CSE-ConnectionGUID: s92zq6icQK+FBmh7ygK4Lw==
X-CSE-MsgGUID: sn3tPD2hRXGnwSKxuoSxFQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="3005827"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="3005827"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 12:05:52 -0800
X-CSE-ConnectionGUID: 9V/TvJEQTkWaSykTrUhneg==
X-CSE-MsgGUID: zXl24j0fQN2u+Cu88flb4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="8109664"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2026 12:05:50 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQs6G-00000000xQp-0BkI;
	Tue, 10 Nov 2026 20:05:48 +0000
Date: Wed, 11 Nov 2026 04:05:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] PCI/VGA: Fix boot device detection after framebuffer
 relocation
Message-ID: <202611110347.EpCc8ug6-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261028094634.766723-1-wuqianhai@loongson.cn>
References: <20261028094634.766723-1-wuqianhai@loongson.cn>
TO: wuqianhai@loongson.cn
TO: bhelgaas@google.com
CC: wuqianhai <wuqianhai@loongson.cn>
CC: linux-pci@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: tzimmermann@suse.de
CC: javierm@redhat.com
CC: dri-devel@lists.freedesktop.org

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on pci/next]
[also build test ERROR on pci/for-linus linus/master v7.4-rc2 next-20261109]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wuqianhai-loongson-cn/PCI-VGA-Fix-boot-device-detection-after-framebuffer-relocation/20261028-174634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20261028094634.766723-1-wuqianhai%40loongson.cn
patch subject: [PATCH] PCI/VGA: Fix boot device detection after framebuffer relocation
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20261111/202611110347.EpCc8ug6-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611110347.EpCc8ug6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611110347.EpCc8ug6-lkp@intel.com/

All errors (new ones prefixed by >>):

   alpha-linux-ld: drivers/pci/vgaarb.o: in function `vga_arb_device_init':
   drivers/pci/vgaarb.c:1536:(.init.text+0x8): undefined reference to `screen_info_apply_fixups'
>> alpha-linux-ld: drivers/pci/vgaarb.c:1536:(.init.text+0x24): undefined reference to `screen_info_apply_fixups'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
