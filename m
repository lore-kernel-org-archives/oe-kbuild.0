Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794412810;
	b=gat0EU97Dz8iBrUy8XfbPVtLvjVBrSidZbYTjxueVqNhgPhQ2hoXulRDElrQfJRIT/LG
	 UtHuXIfAr3pTFxtFX5XZians4MJQqUgQynzNejB14uujvOndqrTbU6AXAf986iMTRPXQb
	 KJOl54usluh8CBAq93iufw6ayqKNx2xveVNbJ8pirzLpyKHv38Z1blpa5xCHgX9HIJhoH
	 AWm40ONqA2xSJVgC28V9UUPgiONYdYqBXyqhYCkTMiKlrIsT47vtFfmKgdWcxZDDsvYFN
	 S/GXUzFhj+4gOzW2yK9AiXVdcaIMsbRereuES6isYrP0seMIjTlghvOmBZCO7XilEdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794412810;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=7gFEClu6Z8VyExs2lKVxz/E5ZWMyikK3NkVVPNtjbco=;
	b=zDwfLBjI5t/TihCrpmi+6cKdJqKvHcJItOkYY3Ua8mXgB3a4RpOFcZKKdud8pT0cav79
	 364ATpNo6D1Wddh6nl4lqBLTpPMwN26e3gwzGa4lXElYhTwWFl8ZSntpFhrr9YQ9xExur
	 LXOa1OLKPkRcSMG0Orfj0pFXTEXdQX3JvA2tXlzCYpW0nd42IvXBySPVmiEUTdqTNo5ua
	 WW/+HiivSMtjMOHPiXTzdVAHcXRXtLDMvUSiLpVXptlRC5piIjS8MdrsXPwTi3n0lCnbv
	 4OKgE39oQDzZ4Duz6JHcDPsnax3yhIm5uniMBX6sGGY3C0HLRH5EiHT/Zgj3EbubKDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b="Ofr4Pdn/";
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B05606A32A
	for <oe-kbuild@lists.linux.dev>; Wed, 11 Nov 2026 16:00:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84B05606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Ofr4Pdn/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794412808; x=1825948808;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OzXgMI3cwv04DHKd6zK+/rqqr0EakssyM7ZmpX1jeGc=;
  b=Ofr4Pdn/pV5Zx7LkR+PWcbs7Y4DbwYYjzs+8Xu4E9QcNmOCUR7f4zmEn
   RcYax3JQ+EArMOmeVxYPlaVvV1E2D8Qyp3OasfnVC/JIXu+YyniOpoQUv
   ZBJ5DjCYgrj34V9NAN6xVlX6sqMkDvXORg9VhUlrHBW7xuo6om806c6v+
   F1HqZGzFVJPibZMtsAZ4gl4x2s+2/29rJYNrJOfBjzauWQEDV+2ahRylk
   c0CtAmjv6i2LdAR4w/HQ5mq0rrMN6gftI2AVoTy7RSzgpZVAZAcl9SIUb
   Cmoz76lOhkBfRi1N2eiExjMC/eTXOI6UlnacjsrigmxS9DI8cGi75oxnM
   w==;
X-CSE-ConnectionGUID: JSTBd7ckQHixYb4smG4ZJA==
X-CSE-MsgGUID: SFWWMIZmQCCTuW3Xe+VJ6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3229885"
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="3229885"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2026 08:00:08 -0800
X-CSE-ConnectionGUID: jXZarcTRSiKN04wOStYHkQ==
X-CSE-MsgGUID: 2cGRRr4nR3+SYs4Unoy52A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,208,1787036400"; 
   d="scan'208";a="8488232"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 11 Nov 2026 08:00:07 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRAk1-00000000z9q-0sDo;
	Wed, 11 Nov 2026 16:00:05 +0000
Date: Wed, 11 Nov 2026 23:59:10 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] PCI/VGA: Fix boot device detection after framebuffer
 relocation
Message-ID: <202611112305.j7RhAOKu-lkp@intel.com>
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
[also build test ERROR on pci/for-linus linus/master v7.4-rc2 next-20261110]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/wuqianhai-loongson-cn/PCI-VGA-Fix-boot-device-detection-after-framebuffer-relocation/20261028-174634
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pci/pci.git next
patch link:    https://lore.kernel.org/r/20261028094634.766723-1-wuqianhai%40loongson.cn
patch subject: [PATCH] PCI/VGA: Fix boot device detection after framebuffer relocation
:::::: branch date: 27 hours ago
:::::: commit date: 27 hours ago
config: xtensa-common_defconfig (https://download.01.org/0day-ci/archive/20261111/202611112305.j7RhAOKu-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261111/202611112305.j7RhAOKu-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611112305.j7RhAOKu-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: drivers/pci/vgaarb.o:(.init.literal+0x14): undefined reference to `screen_info_apply_fixups'
   xtensa-linux-ld: drivers/pci/vgaarb.o: in function `vga_arb_device_init':
   vgaarb.c:(.init.text+0x3): undefined reference to `screen_info_apply_fixups'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
