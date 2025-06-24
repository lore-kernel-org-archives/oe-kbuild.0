Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E782C158C
	for <oe-kbuild@lists.linux.dev>; Tue, 24 Jun 2025 13:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750771798; cv=none; b=CjUbBAW+9YSyj7QgAu0kK0vwa1n8QaIj1HvqNIr18ANhPG5XBjqYvZuyT/bBQpoRc9Ex2SsKKkuM1UeJRmOK2Un7Eh9PwJ+tiUcKolr0Iorx8NcefylpXn1mhXfGFL9KUjzZtJIN3NGVhUFImIOWIeOyu5x2zNOBwmaBf4Beoms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750771798; c=relaxed/simple;
	bh=c4AcaY23rGJqNLnIqF2DXoQhTQw38wj0IvJqe7hwUpQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c2l4Uyb1Cn81iEP9zy4Ad5QYeLPGCsI8tfa5vFFXPEd5C9rDxOCHYrHg3SlgvTv5x0B0rZ4tyWvybXN1aifdNppX3nymSRWMJxO294dVU2S35Ftp/IbfwENCyTEHfBfXU5aoHq+nRppcFJxmiHZf8uveKq+L/H3bhsxbRbW5z4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eNtEqEBS; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eNtEqEBS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750771796; x=1782307796;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c4AcaY23rGJqNLnIqF2DXoQhTQw38wj0IvJqe7hwUpQ=;
  b=eNtEqEBSxFTsfkIav85GUmnrKa2Sfyg5/SatCGB+Upm3bu2oLg5IgC1q
   ykkuy7PanDTmfkKzbWTUJuTBrOwI8CEH1rjdJ2FaQz1hAAhaiqYxD+hYd
   3jnVAAfns1jhP7RX6cKe/tPHOAkiDBwVkyS0F3KpJ1Z2f9z0xXVt/S62V
   sSrPK9BXOtNLrf4zwEY10XRS7WwVM/zFGm0RTRHBpTwnoBjsqZC4hgUqo
   Ke65zbxR7UJmwAjFZfyZ8K08S2pqmXQVGTQQJSYZZQGWTU8w4Z9V2dVUH
   QbD9p2xe/Ud/8sG3KzLwRXploGwO9eSeAfeWuQ7fdPW7hInxLyVlbOz8B
   g==;
X-CSE-ConnectionGUID: ug1syyyGRbu/fFi+CSp91A==
X-CSE-MsgGUID: +SSXh9CUT8WqQhfKw1Txwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="64365916"
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="64365916"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jun 2025 06:28:22 -0700
X-CSE-ConnectionGUID: Iw25CZFUTu6zVFZ2RI12yg==
X-CSE-MsgGUID: I83DhEnFQR6d2iC6ZLqjhg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,261,1744095600"; 
   d="scan'208";a="152084453"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 24 Jun 2025 06:28:21 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uU3hC-000SA2-2p;
	Tue, 24 Jun 2025 13:28:18 +0000
Date: Tue, 24 Jun 2025 21:27:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH 11/11] ARM: dts: mediatek: add basic support for Lenovo
 A369i board
Message-ID: <202506242338.0yhy5VZa-lkp@intel.com>
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
In-Reply-To: <20250620-mt6572-v1-11-e2d47820f042@proton.me>
References: <20250620-mt6572-v1-11-e2d47820f042@proton.me>
TO: Max Shevchenko via B4 Relay <devnull+wctrl.proton.me@kernel.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Matthias Brugger <matthias.bgg@gmail.com>
TO: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Wim Van Sebroeck <wim@linux-watchdog.org>
TO: Guenter Roeck <linux@roeck-us.net>
TO: Sean Wang <sean.wang@mediatek.com>
TO: Russell King <linux@armlinux.org.uk>
CC: linux-kernel@vger.kernel.org
CC: linux-serial@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-arm-kernel@lists.infradead.org
CC: linux-mediatek@lists.infradead.org
CC: linux-watchdog@vger.kernel.org
CC: Max Shevchenko <wctrl@proton.me>

Hi Max,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 0ff41df1cb268fc69e703a08a57ee14ae967d0ca]

url:    https://github.com/intel-lab-lkp/linux/commits/Max-Shevchenko-via-B4-Relay/dt-bindings-serial-mediatek-uart-add-MT6572/20250620-234721
base:   0ff41df1cb268fc69e703a08a57ee14ae967d0ca
patch link:    https://lore.kernel.org/r/20250620-mt6572-v1-11-e2d47820f042%40proton.me
patch subject: [PATCH 11/11] ARM: dts: mediatek: add basic support for Lenovo A369i board
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: arm-randconfig-051-20250621 (https://download.01.org/0day-ci/archive/20250624/202506242338.0yhy5VZa-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250624/202506242338.0yhy5VZa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202506242338.0yhy5VZa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts:22.37-30.5: Warning (unit_address_vs_reg): /chosen/framebuffer@9fa00000: node has a unit name, but no reg or ranges property
>> arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts:33.9-36.4: Warning (unit_address_vs_reg): /memory: node has a reg or ranges property, but no unit name
>> arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts:17.9-31.4: Warning (avoid_unnecessary_addr_size): /chosen: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dtb: / (lenovo,a369i): memory: False schema does not allow {'device_type': ['memory'], 'reg': [[2147483648, 536870912]]}
   	from schema $id: http://devicetree.org/schemas/root-node.yaml#

vim +22 arch/arm/boot/dts/mediatek/mt6572-lenovo-a369i.dts

e710ca083692cb Max Shevchenko 2025-06-20   8  
e710ca083692cb Max Shevchenko 2025-06-20   9  / {
e710ca083692cb Max Shevchenko 2025-06-20  10  	model = "Lenovo A369i";
e710ca083692cb Max Shevchenko 2025-06-20  11  	compatible = "lenovo,a369i", "mediatek,mt6572";
e710ca083692cb Max Shevchenko 2025-06-20  12  
e710ca083692cb Max Shevchenko 2025-06-20  13  	aliases {
e710ca083692cb Max Shevchenko 2025-06-20  14  		serial0 = &uart0;
e710ca083692cb Max Shevchenko 2025-06-20  15  	};
e710ca083692cb Max Shevchenko 2025-06-20  16  
e710ca083692cb Max Shevchenko 2025-06-20 @17  	chosen {
e710ca083692cb Max Shevchenko 2025-06-20  18  		#address-cells = <1>;
e710ca083692cb Max Shevchenko 2025-06-20  19  		#size-cells = <1>;
e710ca083692cb Max Shevchenko 2025-06-20  20  		stdout-path = "serial0:921600n8";
e710ca083692cb Max Shevchenko 2025-06-20  21  
e710ca083692cb Max Shevchenko 2025-06-20 @22  		framebuffer: framebuffer@9fa00000 {
e710ca083692cb Max Shevchenko 2025-06-20  23  			compatible = "simple-framebuffer";
e710ca083692cb Max Shevchenko 2025-06-20  24  			memory-region = <&framebuffer_reserved>;
e710ca083692cb Max Shevchenko 2025-06-20  25  			width = <480>;
e710ca083692cb Max Shevchenko 2025-06-20  26  			height = <800>;
e710ca083692cb Max Shevchenko 2025-06-20  27  			stride = <(480 * 2)>;
e710ca083692cb Max Shevchenko 2025-06-20  28  			format = "r5g6b5";
e710ca083692cb Max Shevchenko 2025-06-20  29  			status = "okay";
e710ca083692cb Max Shevchenko 2025-06-20  30  		};
e710ca083692cb Max Shevchenko 2025-06-20  31  	};
e710ca083692cb Max Shevchenko 2025-06-20  32  
e710ca083692cb Max Shevchenko 2025-06-20 @33  	memory {
e710ca083692cb Max Shevchenko 2025-06-20  34  		device_type = "memory";
e710ca083692cb Max Shevchenko 2025-06-20  35  		reg = <0x80000000 0x20000000>;
e710ca083692cb Max Shevchenko 2025-06-20  36  	};
e710ca083692cb Max Shevchenko 2025-06-20  37  
e710ca083692cb Max Shevchenko 2025-06-20  38  	reserved-memory {
e710ca083692cb Max Shevchenko 2025-06-20  39  		#address-cells = <1>;
e710ca083692cb Max Shevchenko 2025-06-20  40  		#size-cells = <1>;
e710ca083692cb Max Shevchenko 2025-06-20  41  		ranges;
e710ca083692cb Max Shevchenko 2025-06-20  42  
e710ca083692cb Max Shevchenko 2025-06-20  43  		connsys@80000000 {
e710ca083692cb Max Shevchenko 2025-06-20  44  			reg = <0x80000000 0x100000>;
e710ca083692cb Max Shevchenko 2025-06-20  45  			no-map;
e710ca083692cb Max Shevchenko 2025-06-20  46  		};
e710ca083692cb Max Shevchenko 2025-06-20  47  
e710ca083692cb Max Shevchenko 2025-06-20  48  		framebuffer_reserved: framebuffer@9fa00000 {
e710ca083692cb Max Shevchenko 2025-06-20  49  			reg = <0x9fa00000 0x600000>;
e710ca083692cb Max Shevchenko 2025-06-20  50  			no-map;
e710ca083692cb Max Shevchenko 2025-06-20  51  		};
e710ca083692cb Max Shevchenko 2025-06-20  52  	};
e710ca083692cb Max Shevchenko 2025-06-20  53  };
e710ca083692cb Max Shevchenko 2025-06-20  54  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
