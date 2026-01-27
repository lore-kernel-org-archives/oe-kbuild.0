Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5872935D61C
	for <oe-kbuild@lists.linux.dev>; Tue, 27 Jan 2026 15:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769527177; cv=none; b=sDF8LLaAu3HBrZ6v2EI0lmbiPs2YFJ7ceebfmniyYLgps8Qlxe+9YsBt1CBa6Z8GFQiQ0ocYHrVvn8Jq+6hssIOV1OIdMMwR2t09ANyAh9wrkaqSLJAwGjR4QHPxXnotVf2Cg0WIkP4zkrdDKd2zggeMbj9JFUKkVk8GeVTz0QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769527177; c=relaxed/simple;
	bh=22YtfTZLnH4CjGtNWFyfvJbrZoMj/hafsWAJ3dXkeiA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mNYj9kEAj9J2izIwwN3CZJQoOxIgVO3dd69dktMtUFbqnZmGkptAby0hls0Ga/apUK8LSk9F2yndZADh0IPgSlGcJm2RB2Uzcrmd2LkWOckRNMpDMOHSwvZH1AES+F4rO9YzSElAg6d1fT7u8UKcEkpuJZpIuxgUKbwzBevzN3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ERcfTkYR; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ERcfTkYR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769527175; x=1801063175;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=22YtfTZLnH4CjGtNWFyfvJbrZoMj/hafsWAJ3dXkeiA=;
  b=ERcfTkYRFrhoIiq2JaON5kGRvtoZKnRHFFQ3fNxZo4nGQLoUYVMXcGHG
   UrUnlD4xUvM4rAH2LM9zYJrBibAj7N6L/5YxKsiuMyqi2OZr63deYZ9LH
   1oKoDNMXF92dMyYnT9yQXgpir3Rid/qyo92GAt1Ne7jd6RDLuPetFPYh8
   wQ7zDhM+ILyOeytO9Ghti4IwvUQIy5tauc7PqqLRSxCjIypQhHhGiKmrc
   9yRomBv1jSqGFg5rhInvbzuJ2HQCaFbc1FfobuQMd68BOaoVp1LWD51uq
   9oyiXyf4vQV6US0SULHeYFHSyQxN8jvE51NSTMXn1lTFAuPRWsC0Qdtbd
   g==;
X-CSE-ConnectionGUID: 7P45UcjfRYaYVYejV4smZQ==
X-CSE-MsgGUID: meOjJuVDSi+tUs9DuJWO3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11684"; a="96191103"
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="96191103"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 07:19:35 -0800
X-CSE-ConnectionGUID: 1mtqxoP/RqeejFzGNEPNrQ==
X-CSE-MsgGUID: 3bXMqYg5T2eD/2cegeSKHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,257,1763452800"; 
   d="scan'208";a="207244814"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Jan 2026 07:19:34 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vkkqp-00000000Yb6-0PkT;
	Tue, 27 Jan 2026 15:19:31 +0000
Date: Tue, 27 Jan 2026 23:18:59 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH V2 2/5] accel/amd_vpci: Add new driver for AMD Versal PCI
 accelerator
Message-ID: <202601272339.48MtVeg5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/accel/amd_vpci/versal-pci-main.c:278:1: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20260126192732.1507084-3-yidong.zhang@amd.com>
References: <20260126192732.1507084-3-yidong.zhang@amd.com>
TO: David Zhang <yidong.zhang@amd.com>
TO: yidong.zhang@amd.com
TO: ogabbay@kernel.org
TO: quic_jhugo@quicinc.com
TO: maciej.falkowski@linux.intel.com
TO: dri-devel@lists.freedesktop.org
CC: linux-kernel@vger.kernel.org
CC: sonal.santan@amd.com
CC: mario.limonciello@amd.com
CC: lizhi.hou@amd.com
CC: DMG Karthik <Karthik.DMG@amd.com>
CC: Nishad Saraf <nishads@amd.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on drm-misc/drm-misc-next]
[also build test WARNING on drm-tip/drm-tip linus/master v6.19-rc7 next-20260126]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Zhang/accel-amd_vpci-Add-documentation-for-AMD-Versal-PCI-accelerator-management/20260127-033132
base:   https://gitlab.freedesktop.org/drm/misc/kernel.git drm-misc-next
patch link:    https://lore.kernel.org/r/20260126192732.1507084-3-yidong.zhang%40amd.com
patch subject: [PATCH V2 2/5] accel/amd_vpci: Add new driver for AMD Versal PCI accelerator
:::::: branch date: 20 hours ago
:::::: commit date: 20 hours ago
config: powerpc-randconfig-r123-20260127 (https://download.01.org/0day-ci/archive/20260127/202601272339.48MtVeg5-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260127/202601272339.48MtVeg5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601272339.48MtVeg5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/accel/amd_vpci/versal-pci-main.c:278:1: sparse: sparse: bad integer constant expression
   drivers/accel/amd_vpci/versal-pci-main.c:278:1: sparse: sparse: static assertion failed: "MODULE_INFO(description, ...) contains embedded NUL byte"
   drivers/accel/amd_vpci/versal-pci-main.c:279:1: sparse: sparse: bad integer constant expression
   drivers/accel/amd_vpci/versal-pci-main.c:279:1: sparse: sparse: static assertion failed: "MODULE_INFO(author, ...) contains embedded NUL byte"
   drivers/accel/amd_vpci/versal-pci-main.c:280:1: sparse: sparse: bad integer constant expression
   drivers/accel/amd_vpci/versal-pci-main.c:280:1: sparse: sparse: static assertion failed: "MODULE_INFO(file, ...) contains embedded NUL byte"
   drivers/accel/amd_vpci/versal-pci-main.c:280:1: sparse: sparse: bad integer constant expression
   drivers/accel/amd_vpci/versal-pci-main.c:280:1: sparse: sparse: static assertion failed: "MODULE_INFO(license, ...) contains embedded NUL byte"

vim +278 drivers/accel/amd_vpci/versal-pci-main.c

10fa40cba777b2b David Zhang 2026-01-26  277  
10fa40cba777b2b David Zhang 2026-01-26 @278  MODULE_DESCRIPTION("AMD Versal PCIe Management Driver");

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
