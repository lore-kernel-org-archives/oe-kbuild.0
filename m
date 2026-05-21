Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBCB1364049
	for <oe-kbuild@lists.linux.dev>; Thu, 21 May 2026 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779353698; cv=none; b=J7uGNQYDPUpR2rN6hlflfb71XeDFm4OMJrO3dySb+tgmj5ilMsrkh2Irtyb2CiTrUThOM4L9DAXC+e9RGpQ13Sy26NkWqtw7LKu6MVeCOYCaxK8JG5WYf8gQ5ZFyWTu4dV83PbhqE/I3OUbfviW1p5ngPsjXvz8oe3GiWK25p7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779353698; c=relaxed/simple;
	bh=s/OC/2JdXYHcRlJuayBxU7BsGfTmOM0qyiYMBLBB7jY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RxRI1f0cTQwsBb05ctRQh8xddDLkAMKn35obkAd1NrzggbMrFVQIhbh7TpbfbWEki+8EpEZGkOj8iPQlrgWX4z0jX/Wv6qv+05t/xTvXuQZHeYuOJsAHR6oi9++uVc9wlhu0HIMl66G8c4XcHeOGm1hjXalKMwIbld0zNhulShw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c3zUhW6H; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c3zUhW6H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779353696; x=1810889696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s/OC/2JdXYHcRlJuayBxU7BsGfTmOM0qyiYMBLBB7jY=;
  b=c3zUhW6H5aySZ5psi1gCXCjH4em908q68Y4I0Rw4QHuQpkhfca2VernM
   ViJAwjtS8Md4a9WzjV7HTXh813e67NjPZhg5epQ7goU1LJzaF4Xzj/QBO
   eP4MhLzy6RuEiueOuaynNfQePrGnjMqocobM5Htu6RFOgnFGi1jMsUOQe
   b9XrSlrL0JSUGroPBETYqfMqKTjVcvfi6rtfPuYhw/pOwGbrVQRmgj2UZ
   /TYh8CFK/GhCaximP2ZJwnRJaUfQKfhcPhF34ssNOvE3QTLA0G2QRFjAg
   GjPrpyloOJEUzWruv07vpdilaGsb3C1g3ZZAXVIpI/sAf20n21q+H6U3h
   A==;
X-CSE-ConnectionGUID: ZejfBAehQzSLP4UhCgnv9g==
X-CSE-MsgGUID: wP3UHOlGQP27zvz7gaUCuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="79417159"
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="79417159"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2026 01:54:55 -0700
X-CSE-ConnectionGUID: tDbGpKwCTb62xkXi1riiLA==
X-CSE-MsgGUID: MWqjvy0KRqaYQhhf4k5fug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,246,1770624000"; 
   d="scan'208";a="245505964"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 21 May 2026 01:54:54 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPzB6-00000000ApF-1wNI;
	Thu, 21 May 2026 08:54:52 +0000
Date: Thu, 21 May 2026 10:54:06 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: misc: add YAML binding for qemu,pvpanic-mmio
Message-ID: <202605211029.DrMbgYuS-lkp@intel.com>
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
In-Reply-To: <20260520164846.637522-1-rohanmithari09@gmail.com>
References: <20260520164846.637522-1-rohanmithari09@gmail.com>
TO: Rohan Mithari <rohanmithari09@gmail.com>
TO: robh@kernel.org
CC: krzk+dt@kernel.org
CC: conor+dt@kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: peng.hao2@zte.com.cn
CC: Rohan Mithari <rohanmithari09@gmail.com>

Hi Rohan,

kernel test robot noticed the following build warnings:

[auto build test WARNING on robh/for-next]
[also build test WARNING on linus/master v6.16-rc1 next-20260520]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rohan-Mithari/dt-bindings-misc-add-YAML-binding-for-qemu-pvpanic-mmio/20260521-005645
base:   https://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git for-next
patch link:    https://lore.kernel.org/r/20260520164846.637522-1-rohanmithari09%40gmail.com
patch subject: [PATCH] dt-bindings: misc: add YAML binding for qemu,pvpanic-mmio
:::::: branch date: 16 hours ago
:::::: commit date: 16 hours ago
config: microblaze-randconfig-2051-20260521 (https://download.01.org/0day-ci/archive/20260521/202605211029.DrMbgYuS-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
dtschema: 2026.5.dev9+gdf9ad30c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260521/202605211029.DrMbgYuS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202605211029.DrMbgYuS-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> Documentation/devicetree/bindings/misc/qemu,pvpanic-mmio.yaml:33:7: [error] no new line character at the end of file (new-line-at-end-of-file)

vim +33 Documentation/devicetree/bindings/misc/qemu,pvpanic-mmio.yaml

21820284a8628e9 Rohan Mithari 2026-05-20  27  
21820284a8628e9 Rohan Mithari 2026-05-20  28  examples:
21820284a8628e9 Rohan Mithari 2026-05-20  29    - |
21820284a8628e9 Rohan Mithari 2026-05-20  30      pvpanic@9060000 {
21820284a8628e9 Rohan Mithari 2026-05-20  31        compatible = "qemu,pvpanic-mmio";
21820284a8628e9 Rohan Mithari 2026-05-20  32        reg = <0x0 0x9060000 0x0 0x2>;
21820284a8628e9 Rohan Mithari 2026-05-20 @33      };

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
