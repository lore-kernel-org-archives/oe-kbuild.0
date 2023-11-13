Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F20BA15ACF
	for <oe-kbuild@lists.linux.dev>; Mon, 13 Nov 2023 08:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d42WtiBD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699863325; x=1731399325;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=z+XLU40gjvxe2RHIeC+ZhPHCRsGLkBRI2mgCi6EcS+g=;
  b=d42WtiBDJcXEHfLxW6/cmUK75Wr6aXEgMda8InCioEPx2XhJst63kpVc
   F2Jii2mMblLFByPHNjCmTMA22+Aex9XVo3P8LRZtWZpssHa2gHl+qjeef
   MdLAuAL4NIc5VtA32Y9NCo51PeHkyxSKAdzvXnVxNdKE49Pp3ZWHI0wLg
   fCLTmSJXmQIAm46CnUz77Hr6Ad9/tLSwAo4PWNkZRNTbqAQhVbIpNA3Is
   n8gRmDS7jatGh6rqojvRoZaBmjwEef1IbYCDDIPMG2d+cgV32anhBHcjD
   jvcbPSHhJa+MWkOrcEUGCBBO6stzKqCfnZkaTDNy6U91yrXa3t4oP0EiL
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10892"; a="390202140"
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="390202140"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2023 00:15:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,298,1694761200"; 
   d="scan'208";a="5592458"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 Nov 2023 00:15:24 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r2S6L-000BxO-2b;
	Mon, 13 Nov 2023 08:15:21 +0000
Date: Mon, 13 Nov 2023 16:14:34 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [RFC PATCH v2 18/19] heki: x86: Protect guest kernel memory
 using the KVM hypervisor
Message-ID: <202311131528.mJpddiq3-lkp@intel.com>
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
:::::: Manual check reason: "has kconfig file changed"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20231113022326.24388-19-mic@digikod.net>
References: <20231113022326.24388-19-mic@digikod.net>
TO: "Mickaël Salaün" <mic@digikod.net>

Hi Mickaël,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 881375a408c0f4ea451ff14545b59216d2923881]

url:    https://github.com/intel-lab-lkp/linux/commits/Micka-l-Sala-n/virt-Introduce-Hypervisor-Enforced-Kernel-Integrity-Heki/20231113-102847
base:   881375a408c0f4ea451ff14545b59216d2923881
patch link:    https://lore.kernel.org/r/20231113022326.24388-19-mic%40digikod.net
patch subject: [RFC PATCH v2 18/19] heki: x86: Protect guest kernel memory using the KVM hypervisor
:::::: branch date: 6 hours ago
:::::: commit date: 6 hours ago
config: riscv-randconfig-001-20231113 (attached as .config)
compiler: riscv64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231113/202311131528.mJpddiq3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311131528.mJpddiq3-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/riscv/Kconfig:833:error: recursive dependency detected!
   arch/riscv/Kconfig:833:	symbol XIP_KERNEL depends on SPARSEMEM
   mm/Kconfig:461:	symbol SPARSEMEM is selected by HEKI
   virt/heki/Kconfig:5:	symbol HEKI depends on JUMP_LABEL
   arch/Kconfig:66:	symbol JUMP_LABEL depends on HAVE_ARCH_JUMP_LABEL
   arch/Kconfig:441:	symbol HAVE_ARCH_JUMP_LABEL is selected by XIP_KERNEL
   For a resolution refer to Documentation/kbuild/kconfig-language.rst
   subsection "Kconfig recursive dependency limitations"


vim +833 arch/riscv/Kconfig

aef53f97b505ff Nick Kossifidis 2018-09-20  787  
d7071743db31b4 Atish Patra     2020-09-17  788  config EFI_STUB
d7071743db31b4 Atish Patra     2020-09-17  789  	bool
d7071743db31b4 Atish Patra     2020-09-17  790  
d7071743db31b4 Atish Patra     2020-09-17  791  config EFI
d7071743db31b4 Atish Patra     2020-09-17  792  	bool "UEFI runtime support"
44c922572952d8 Vitaly Wool     2021-04-13  793  	depends on OF && !XIP_KERNEL
5f365c133b83a5 Conor Dooley    2022-12-19  794  	depends on MMU
5f365c133b83a5 Conor Dooley    2022-12-19  795  	default y
a91a9ffbd3a55a Sunil V L       2023-05-15  796  	select ARCH_SUPPORTS_ACPI if 64BIT
d7071743db31b4 Atish Patra     2020-09-17  797  	select EFI_GENERIC_STUB
5f365c133b83a5 Conor Dooley    2022-12-19  798  	select EFI_PARAMS_FROM_FDT
b91540d52a08b6 Atish Patra     2020-09-17  799  	select EFI_RUNTIME_WRAPPERS
5f365c133b83a5 Conor Dooley    2022-12-19  800  	select EFI_STUB
5f365c133b83a5 Conor Dooley    2022-12-19  801  	select LIBFDT
d7071743db31b4 Atish Patra     2020-09-17  802  	select RISCV_ISA_C
5f365c133b83a5 Conor Dooley    2022-12-19  803  	select UCS2_STRING
d7071743db31b4 Atish Patra     2020-09-17  804  	help
d7071743db31b4 Atish Patra     2020-09-17  805  	  This option provides support for runtime services provided
d7071743db31b4 Atish Patra     2020-09-17  806  	  by UEFI firmware (such as non-volatile variables, realtime
d7071743db31b4 Atish Patra     2020-09-17  807  	  clock, and platform reset). A UEFI stub is also provided to
d7071743db31b4 Atish Patra     2020-09-17  808  	  allow the kernel to be booted as an EFI application. This
d7071743db31b4 Atish Patra     2020-09-17  809  	  is only useful on systems that have UEFI firmware.
d7071743db31b4 Atish Patra     2020-09-17  810  
fea2fed201ee56 Guo Ren         2020-12-17  811  config CC_HAVE_STACKPROTECTOR_TLS
fea2fed201ee56 Guo Ren         2020-12-17  812  	def_bool $(cc-option,-mstack-protector-guard=tls -mstack-protector-guard-reg=tp -mstack-protector-guard-offset=0)
fea2fed201ee56 Guo Ren         2020-12-17  813  
fea2fed201ee56 Guo Ren         2020-12-17  814  config STACKPROTECTOR_PER_TASK
fea2fed201ee56 Guo Ren         2020-12-17  815  	def_bool y
595b893e2087de Kees Cook       2022-05-03  816  	depends on !RANDSTRUCT
fea2fed201ee56 Guo Ren         2020-12-17  817  	depends on STACKPROTECTOR && CC_HAVE_STACKPROTECTOR_TLS
fea2fed201ee56 Guo Ren         2020-12-17  818  
867432bec1c6e7 Alexandre Ghiti 2021-07-21  819  config PHYS_RAM_BASE_FIXED
867432bec1c6e7 Alexandre Ghiti 2021-07-21  820  	bool "Explicitly specified physical RAM address"
44c1e84a38a031 Palmer Dabbelt  2022-05-21  821  	depends on NONPORTABLE
867432bec1c6e7 Alexandre Ghiti 2021-07-21  822  	default n
867432bec1c6e7 Alexandre Ghiti 2021-07-21  823  
44c922572952d8 Vitaly Wool     2021-04-13  824  config PHYS_RAM_BASE
44c922572952d8 Vitaly Wool     2021-04-13  825  	hex "Platform Physical RAM address"
867432bec1c6e7 Alexandre Ghiti 2021-07-21  826  	depends on PHYS_RAM_BASE_FIXED
44c922572952d8 Vitaly Wool     2021-04-13  827  	default "0x80000000"
44c922572952d8 Vitaly Wool     2021-04-13  828  	help
44c922572952d8 Vitaly Wool     2021-04-13  829  	  This is the physical address of RAM in the system. It has to be
44c922572952d8 Vitaly Wool     2021-04-13  830  	  explicitly specified to run early relocations of read-write data
44c922572952d8 Vitaly Wool     2021-04-13  831  	  from flash to RAM.
44c922572952d8 Vitaly Wool     2021-04-13  832  
44c922572952d8 Vitaly Wool     2021-04-13 @833  config XIP_KERNEL
44c922572952d8 Vitaly Wool     2021-04-13  834  	bool "Kernel Execute-In-Place from ROM"
44c1e84a38a031 Palmer Dabbelt  2022-05-21  835  	depends on MMU && SPARSEMEM && NONPORTABLE
44c922572952d8 Vitaly Wool     2021-04-13  836  	# This prevents XIP from being enabled by all{yes,mod}config, which
44c922572952d8 Vitaly Wool     2021-04-13  837  	# fail to build since XIP doesn't support large kernels.
44c922572952d8 Vitaly Wool     2021-04-13  838  	depends on !COMPILE_TEST
867432bec1c6e7 Alexandre Ghiti 2021-07-21  839  	select PHYS_RAM_BASE_FIXED
44c922572952d8 Vitaly Wool     2021-04-13  840  	help
44c922572952d8 Vitaly Wool     2021-04-13  841  	  Execute-In-Place allows the kernel to run from non-volatile storage
44c922572952d8 Vitaly Wool     2021-04-13  842  	  directly addressable by the CPU, such as NOR flash. This saves RAM
44c922572952d8 Vitaly Wool     2021-04-13  843  	  space since the text section of the kernel is not loaded from flash
44c922572952d8 Vitaly Wool     2021-04-13  844  	  to RAM.  Read-write sections, such as the data section and stack,
44c922572952d8 Vitaly Wool     2021-04-13  845  	  are still copied to RAM.  The XIP kernel is not compressed since
44c922572952d8 Vitaly Wool     2021-04-13  846  	  it has to run directly from flash, so it will take more space to
44c922572952d8 Vitaly Wool     2021-04-13  847  	  store it.  The flash address used to link the kernel object files,
44c922572952d8 Vitaly Wool     2021-04-13  848  	  and for storing it, is configuration dependent. Therefore, if you
44c922572952d8 Vitaly Wool     2021-04-13  849  	  say Y here, you must know the proper physical address where to
44c922572952d8 Vitaly Wool     2021-04-13  850  	  store the kernel image depending on your own flash memory usage.
44c922572952d8 Vitaly Wool     2021-04-13  851  
44c922572952d8 Vitaly Wool     2021-04-13  852  	  Also note that the make target becomes "make xipImage" rather than
44c922572952d8 Vitaly Wool     2021-04-13  853  	  "make zImage" or "make Image".  The final kernel binary to put in
44c922572952d8 Vitaly Wool     2021-04-13  854  	  ROM memory will be arch/riscv/boot/xipImage.
44c922572952d8 Vitaly Wool     2021-04-13  855  
44c922572952d8 Vitaly Wool     2021-04-13  856  	  SPARSEMEM is required because the kernel text and rodata that are
44c922572952d8 Vitaly Wool     2021-04-13  857  	  flash resident are not backed by memmap, then any attempt to get
44c922572952d8 Vitaly Wool     2021-04-13  858  	  a struct page on those regions will trigger a fault.
44c922572952d8 Vitaly Wool     2021-04-13  859  
44c922572952d8 Vitaly Wool     2021-04-13  860  	  If unsure, say N.
44c922572952d8 Vitaly Wool     2021-04-13  861  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
