Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7566500973
	for <oe-kbuild@lists.linux.dev>; Fri,  9 Jan 2026 17:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767978509; cv=none; b=tEfmXZZHeoMTI5kh+tFymbRD6w37IHhXGaPOC+B19/gcbdxBjU9u6a/9BGzqlSGIPCxJPrAuXpqka2wQc9BErUyl1Zfvxurev7+cEG022PW9f6WaeI4efEgjbSRSMsfrevyG4EYjt9JEwO7uk56dGGNB6NAdOl0ghqf2x8SYaoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767978509; c=relaxed/simple;
	bh=MdlOtaxEFotYdfjDq5aRBNsYGImjkNku3cUBeLhtWG8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Lv9+NPJAbcHBTXJo5tKII3JuL8Dc4HmBx0vEqkuZkKZs/lw3PQd25rlszxErXxGb/iC4prhGoYKo2DeXoQC38B4z8Ii42jfMvDCHHRgkDbZvTScVpmyMXzI9IMaHG0VLx2dRPUL0peJmN5RZbAGQuerCfE7UIogRaH35ZVqiU9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OKzhlBcI; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OKzhlBcI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767978507; x=1799514507;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MdlOtaxEFotYdfjDq5aRBNsYGImjkNku3cUBeLhtWG8=;
  b=OKzhlBcIoNa62JyF+kWI/3z8Xs9uBsfHq2U5GQv5TbYS7W18rocAIYp6
   2wR6qZsj8qtdJOHI5QKKF1d4YdsHbCzTfM+gIYDG6fN6Qd/qs5BiGrSe3
   cPQfUxoD8KuU0DcSzD8mAegXheQapcGkQ/udV03AqASUwh2SiWttmKZWv
   cy6juoXnrI1N5y5v6APO41RgctkLVGRn/FF21ysVRSWNyVUcMdpZbvS0f
   XkF2pND7GnQ4JHeKCPoNRwDrpdHiVGF6v9E3ChJlbvQOac2PCV1ntnnCC
   q9Bf1JF99JwdaP+S1sSapEBBis55oR55Btf3xd7dxa6q32UoRzLwe51no
   A==;
X-CSE-ConnectionGUID: ujOzf4YoQG69hxMEEF70oA==
X-CSE-MsgGUID: 5aKKswCSRw+JNUlyn4/YAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11666"; a="94835577"
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="94835577"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2026 09:08:26 -0800
X-CSE-ConnectionGUID: mBok16DIRWKynTOyAGua/w==
X-CSE-MsgGUID: qyr/307RRpim4llk+PaZnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,214,1763452800"; 
   d="scan'208";a="203585622"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa008.jf.intel.com with ESMTP; 09 Jan 2026 09:08:25 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1veFyI-0000000026u-2VyD;
	Fri, 09 Jan 2026 17:08:22 +0000
Date: Fri, 9 Jan 2026 18:08:18 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v3 06/11] dt-bindings: riscv: Add B ISA extension
 description
Message-ID: <202601091844.pL7xMveF-lkp@intel.com>
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
In-Reply-To: <20260108-k3-basic-dt-v3-6-ed99eb4c3ad3@riscstar.com>
References: <20260108-k3-basic-dt-v3-6-ed99eb4c3ad3@riscstar.com>
TO: Guodong Xu <guodong@riscstar.com>
TO: Rob Herring <robh@kernel.org>
TO: Krzysztof Kozlowski <krzk@kernel.org>
TO: Conor Dooley <conor+dt@kernel.org>
TO: Paul Walmsley <pjw@kernel.org>
TO: Palmer Dabbelt <palmer@dabbelt.com>
TO: Albert Ou <aou@eecs.berkeley.edu>
TO: Alexandre Ghiti <alex@ghiti.fr>
TO: Yixun Lan <dlan@gentoo.org>
TO: Daniel Lezcano <daniel.lezcano@linaro.org>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Samuel Holland <samuel.holland@sifive.com>
TO: Anup Patel <anup@brainfault.org>
TO: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
TO: Jiri Slaby <jirislaby@kernel.org>
TO: Lubomir Rintel <lkundrak@v3.sk>
TO: Yangyu Chen <cyy@cyyself.name>
CC: Heinrich Schuchardt <xypron.glpk@gmx.de>
CC: Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
CC: Andrew Jones <ajones@ventanamicro.com>
CC: devicetree@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
CC: spacemit@lists.linux.dev
CC: linux-serial@vger.kernel.org
CC: Guodong Xu <guodong@riscstar.com>

Hi Guodong,

kernel test robot noticed the following build warnings:

[auto build test WARNING on 322fc12949d2658da8c6b2866fffcb1daa7da019]

url:    https://github.com/intel-lab-lkp/linux/commits/Guodong-Xu/dt-bindings-riscv-add-SpacemiT-X100-CPU-compatible/20260108-230401
base:   322fc12949d2658da8c6b2866fffcb1daa7da019
patch link:    https://lore.kernel.org/r/20260108-k3-basic-dt-v3-6-ed99eb4c3ad3%40riscstar.com
patch subject: [PATCH v3 06/11] dt-bindings: riscv: Add B ISA extension description
:::::: branch date: 26 hours ago
:::::: commit date: 26 hours ago
config: riscv-randconfig-2051-20260109 (https://download.01.org/0day-ci/archive/20260109/202601091844.pL7xMveF-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.12
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260109/202601091844.pL7xMveF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601091844.pL7xMveF-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: cpu@0 (nuclei,ux900): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'zba', 'zbb', 'zbc', 'zbkc', 'zbs', 'zicntr', 'zicsr', 'zifencei', 'zihintpause', 'zihpm'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: cpu@0 (nuclei,ux900): Unevaluated properties are not allowed ('riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/anlogic/dr1v90-mlkpai-fs01.dtb: cpu@0 (nuclei,ux900): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'zba', 'zbb', 'zbc', 'zbkc', 'zbs', 'zicntr', 'zicsr', 'zifencei', 'zihintpause', 'zihpm'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
--
>> arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dtb: cpu@0 (thead,c920): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt', 'zawrs', 'zba', 'zbb', 'zbc', 'zbs', 'zca', 'zcb', 'zcd', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'zicbom', 'zicbop', 'zicboz', 'ziccrse', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintntl', 'zihintpause', 'zihpm', 'zvfbfmin', 'zvfbfwma', 'zvfh', 'zvfhmin'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dtb: cpu@0 (thead,c920): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dtb: cpu@0 (thead,c920): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt', 'zawrs', 'zba', 'zbb', 'zbc', 'zbs', 'zca', 'zcb', 'zcd', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'zicbom', 'zicbop', 'zicboz', 'ziccrse', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintntl', 'zihintpause', 'zihpm', 'zvfbfmin', 'zvfbfwma', 'zvfh', 'zvfhmin'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dtb: cpu@1 (thead,c920): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt', 'zawrs', 'zba', 'zbb', 'zbc', 'zbs', 'zca', 'zcb', 'zcd', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'zicbom', 'zicbop', 'zicboz', 'ziccrse', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintntl', 'zihintpause', 'zihpm', 'zvfbfmin', 'zvfbfwma', 'zvfh', 'zvfhmin'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dtb: cpu@1 (thead,c920): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dtb: cpu@1 (thead,c920): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt', 'zawrs', 'zba', 'zbb', 'zbc', 'zbs', 'zca', 'zcb', 'zcd', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'zicbom', 'zicbop', 'zicboz', 'ziccrse', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintntl', 'zihintpause', 'zihpm', 'zvfbfmin', 'zvfbfwma', 'zvfh', 'zvfhmin'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dtb: cpu@2 (thead,c920): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt', 'zawrs', 'zba', 'zbb', 'zbc', 'zbs', 'zca', 'zcb', 'zcd', 'zfa', 'zfbfmin', 'zfh', 'zfhmin', 'zicbom', 'zicbop', 'zicboz', 'ziccrse', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintntl', 'zihintpause', 'zihpm', 'zvfbfmin', 'zvfbfwma', 'zvfh', 'zvfhmin'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/sophgo/sg2044-sophgo-srd3-10.dtb: cpu@2 (thead,c920): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
--
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: cpu@0 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: cpu@0 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: cpu@0 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: cpu@1 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: cpu@1 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: cpu@1 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: cpu@2 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dtb: cpu@2 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
--
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: cpu@0 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: cpu@0 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: cpu@0 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: cpu@1 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: cpu@1 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: cpu@1 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: cpu@2 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dtb: cpu@2 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
--
>> arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: cpu@0 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: cpu@0 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: cpu@0 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: cpu@1 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: cpu@1 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: cpu@1 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: cpu@2 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-musepi-pro.dtb: cpu@2 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
--
>> arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: cpu@0 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: cpu@0 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: cpu@0 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: cpu@1 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: cpu@1 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: cpu@1 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: cpu@2 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dtb: cpu@2 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
--
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: cpu@0 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: cpu@0 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
>> arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: cpu@0 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: cpu@1 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: cpu@1 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: cpu@1 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/extensions.yaml
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: cpu@2 (spacemit,x60): riscv,isa-extensions: ['i', 'm', 'a', 'f', 'd', 'c', 'v', 'zicbom', 'zicbop', 'zicboz', 'zicntr', 'zicond', 'zicsr', 'zifencei', 'zihintpause', 'zihpm', 'zfh', 'zba', 'zbb', 'zbc', 'zbs', 'zkt', 'zvfh', 'zvkt', 'sscofpmf', 'sstc', 'svinval', 'svnapot', 'svpbmt'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/riscv/cpus.yaml
   arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dtb: cpu@2 (spacemit,x60): Unevaluated properties are not allowed ('riscv,isa', 'riscv,isa-base', 'riscv,isa-extensions' were unexpected)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
