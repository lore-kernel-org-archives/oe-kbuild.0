Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F35A1A315C
	for <oe-kbuild@lists.linux.dev>; Sat, 19 Jul 2025 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752936030; cv=none; b=eCc+qBDiIcpA+iKKYcVBHGbjlSOoh9p1k2uOsFu5HEWqagPo5pcaT8graf/qdW3wOx/9xgw7oJf0YPCUzE4KICesk2oKtxt2guhrxnvDDfGub7aqxfCLIkwOKA0qqQbWl9oe7IpM41DY8iH+H5Uy2CCL8M3X0DXI0n+otAJy+Uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752936030; c=relaxed/simple;
	bh=WWCGIXJgloKG/3wIP+n4CxYBeThruxoFy9QSLw+Rhi4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kBZh7PwfdqzeznrI4V7SsBTT1wA88BQiWyRVmr98to61mxJCUpfeLbzdR335vXH0fuFzxOqRIXVcRMrpRjX/zDh5eoKtGPDUh1KlDpqV+8Cu4/07JM0IfI2y+6/MKHI1jnj4XalwhF5xS6mlmQpA2X3peHlGetbrZGqL3gh8aAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QIcgt/eC; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QIcgt/eC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752936027; x=1784472027;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WWCGIXJgloKG/3wIP+n4CxYBeThruxoFy9QSLw+Rhi4=;
  b=QIcgt/eCqR6Wx8xp8FdbBz4tGDVXnkEmBozpYCQ/CgbOKPjblk4zPm8X
   +VAelLr6hpWOOrTdZBKhaKcms+K2ChSiKISwoe5q3wLfVZ9T8jiMsuN8b
   RCLiiU0EhgmlFIKFOQN/Ag9ZkKsTFqWrrbEg4jGRUJ3kMRCDQRSuu8y9t
   3UUZrTrEL72v0ZZ1vHLzhWk3ZOsFEYJx7FfW96cmZEJON4capZ8CtihKU
   1a/aIgapCjMjIw3kQi+7aXxy76fjrl7CAjiqVg9Ll9R5GyAtvN0+FtJxl
   RculkTPi8PMuK2/iOVX8RM5/UQiy+HLscSiCFeSZJybji15EGt0LvnuZb
   w==;
X-CSE-ConnectionGUID: Sg8Pd76xQiGdvO+n/XEflA==
X-CSE-MsgGUID: fRjeDc5eSqWCw2CVHHJnRw==
X-IronPort-AV: E=McAfee;i="6800,10657,11497"; a="80654541"
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="80654541"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jul 2025 07:40:26 -0700
X-CSE-ConnectionGUID: 96I/8y8fTSGeCVHQlCDwuQ==
X-CSE-MsgGUID: dIj0yMjXQC+YK0AP2g5CNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,324,1744095600"; 
   d="scan'208";a="162750388"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 19 Jul 2025 07:40:26 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ud8jg-000FYd-1H;
	Sat, 19 Jul 2025 14:40:24 +0000
Date: Sat, 19 Jul 2025 22:39:41 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] dt-bindings: serial: 8250: spacemit: set clocks property
 as required
Message-ID: <202507192254.DRwKZ1xf-lkp@intel.com>
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
In-Reply-To: <20250718-01-k1-uart-binding-v1-1-a92e1e14c836@gentoo.org>
References: <20250718-01-k1-uart-binding-v1-1-a92e1e14c836@gentoo.org>
TO: Yixun Lan <dlan@gentoo.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Lubomir Rintel <lkundrak@v3.sk>
TO: devicetree@vger.kernel.org
TO: Alex Elder <elder@riscstar.com>
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: spacemit@lists.linux.dev
CC: Yixun Lan <dlan@gentoo.org>

Hi Yixun,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Yixun-Lan/dt-bindings-serial-8250-spacemit-set-clocks-property-as-required/20250718-230545
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/20250718-01-k1-uart-binding-v1-1-a92e1e14c836%40gentoo.org
patch subject: [PATCH] dt-bindings: serial: 8250: spacemit: set clocks property as required
:::::: branch date: 23 hours ago
:::::: commit date: 23 hours ago
config: riscv-randconfig-052-20250719 (https://download.01.org/0day-ci/archive/20250719/202507192254.DRwKZ1xf-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.3.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250719/202507192254.DRwKZ1xf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202507192254.DRwKZ1xf-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: serial@f0612000 (spacemit,k1-uart): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: serial@f0612000 (spacemit,k1-uart): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
--
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: serial@f0612000 (spacemit,k1-uart): 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: serial@f0612000 (spacemit,k1-uart): 'clock-names' is a required property
   	from schema $id: http://devicetree.org/schemas/serial/8250.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
