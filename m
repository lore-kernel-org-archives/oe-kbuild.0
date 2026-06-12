Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 975083E8356
	for <oe-kbuild@lists.linux.dev>; Fri, 12 Jun 2026 16:22:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781281334; cv=none; b=fT6yJjYrURMog0luLtz2H5Lme7+31IMS3V1zlzUpQnGW93Dp9ttr/xGcK0SzMytHbu6yRREdFDeOHTO5x7anGBBrO29JSAK1VrD3p0ImW+kc5ch7ll6TvGqjl021LeNaJyuWaZTANg20eW+nIIBt5ivUpA+KGZ+5qGUMF8W35nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781281334; c=relaxed/simple;
	bh=e3q7grivfvK1bi7Jv7WN//UQPTxD3KnWmGOPBi1dEV8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JBskKKnJyAs6QI8+1nyOXyAMOnHPCOmfUhtxR8Spc7HbMvcjVjhN0c17rg7+GhuFxG5OfxcscwdTRyXcUh/Gtmcy5gvdCPTY4ECMNBxtI2Y66MoTcHPxqARfBrNPsJqZzWteR9NCenuOKEbSsL6wnMhLeA5KVuViMNx4eOIE/3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hqxMBXPy; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hqxMBXPy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781281328; x=1812817328;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=e3q7grivfvK1bi7Jv7WN//UQPTxD3KnWmGOPBi1dEV8=;
  b=hqxMBXPyLbQR6TNvSNIuQ4zXSVif4n6YKQDE9vlHDi0fF6A358ypfJqu
   oE2N4Utm59b6oDvnQuc0dr+e7Ruac0EGZ7qjxhXiVdWek0qrdVoqelCrA
   fUcyv0hIXeZ3n9Bd/kK1KqFuHvuO3NRU4VhZp4tkd81hHAYZrm8LE33es
   0H3pPJMVmMg9rKaaVwBxrbLWWWZhWzEXCJfaSP0IXQNt/O/RmlWtZ8PoK
   4QSpAbKXi5qk2bwDZSwIeESzpAb0Kk2iFnCN3bSCHMYByJS4c6BCngbmA
   WnMIPyHk0clVofHrya4YmK+efLEQAYcYc7Uj7oE1SIoNPf0JiEjPPV7rU
   A==;
X-CSE-ConnectionGUID: JfISvZBiQK+eF97UZzAU1g==
X-CSE-MsgGUID: T3EuDJ/lRuCQWfTkvcBTiw==
X-IronPort-AV: E=McAfee;i="6800,10657,11815"; a="81128168"
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="81128168"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jun 2026 09:22:03 -0700
X-CSE-ConnectionGUID: HIZbeZHsS/uppSHjOuk4/w==
X-CSE-MsgGUID: y8ObSjjGR7uYWd0Xiwv57w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,200,1774335600"; 
   d="scan'208";a="244434732"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jun 2026 09:22:01 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wY4dq-00000000P2d-41sa;
	Fri, 12 Jun 2026 16:21:58 +0000
Date: Sat, 13 Jun 2026 00:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [nsa:xlnx/fix/buf-mmap-multibuffer 26735/27391] /bin/bash:
 line 1: 2592437 Segmentation fault      clang
 =?us-ascii?Q?-Wp,-MMD,drivers/iio/adc/adrv902x/devices/adrv9025/public?=
 =?us-ascii?Q?/src/.adi=5Fadrv9025=5Futilities.o.d?= -nostdinc
 -Iarch/riscv/include -I./arch/riscv/include/generated -Iinclude -I./include
 -Iarch/riscv/include/u...
Message-ID: <202606130058.daENi31d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "clang compiler bug"
:::::: Manual check reason: "only suspicious fbc files changed"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: llvm@lists.linux.dev
BCC: lkp@intel.com

CC: Nuno Sa <noname.nuno@gmail.com>
TO: "Nuno S=C3=A1" <nuno.sa@analog.com>

Hi Nuno,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://github.com/nunojsa/linux xlnx/fix/buf-mmap-multibuffer
head:   a26a8baba71e866951f6abf4fc6c0504770c272e
commit: 2fb8201372bc76fcb156bbd539a0cff84d5dc778 [26735/27391] iio: adc: ad=
rv902x: fix out of tree build
:::::: branch date: 25 hours ago
:::::: commit date: 10 months ago
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/2026061=
3/202606130058.daENi31d-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 628=
47ab7593df144a5708406e6240ec5e8a3a101)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260613/202606130058.daENi31d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202606130058.daENi31d-lkp@intel.com/

All errors (new ones prefixed by >>):

   clang: warning: no such include directory: 'drivers/iio/adc/adrv902x/com=
mon/adi_libc/' [-Wmissing-include-dirs]
   In file included from drivers/iio/adc/adrv902x/devices/adrv9025/public/s=
rc/adi_adrv9025_utilities.c:16:
   In file included from drivers/iio/adc/adrv902x/devices/adrv9025/public/i=
nclude/adi_adrv9025_user.h:18:
   In file included from drivers/iio/adc/adrv902x/devices/adrv9025/public/i=
nclude/adi_adrv9025_types.h:23:
   In file included from drivers/iio/adc/adrv902x/common/adi_common.h:19:
   In file included from drivers/iio/adc/adrv902x/common/adi_hal/adi_common=
_hal.h:20:
   In file included from drivers/iio/adc/adrv902x/common/adi_logging/adi_co=
mmon_log.h:22:
   In file included from drivers/iio/adc/adrv902x/platforms/adi_platform.h:=
30:
   In file included from drivers/iio/adc/adrv902x/platforms/adi_platform_ty=
pes.h:25:
   In file included from include/linux/spi/spi.h:17:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2213:
   include/linux/vmstat.h:504:43: warning: arithmetic between different enu=
meration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-en=
um-conversion]
     504 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     505 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:511:43: warning: arithmetic between different enu=
meration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-en=
um-conversion]
     511 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     512 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:518:36: warning: arithmetic between different enu=
meration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-con=
version]
     518 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "n=
r_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:524:43: warning: arithmetic between different enu=
meration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-en=
um-conversion]
     524 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     525 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilit=
ies.c:834:20: warning: 'sscanf' may overflow; destination buffer in argumen=
t 3 has size 16, but the corresponding specifier may require size 17 [-Wfor=
tify-source]
     834 |                    headerStr1,
         |                    ^
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilit=
ies.c:835:20: warning: 'sscanf' may overflow; destination buffer in argumen=
t 4 has size 16, but the corresponding specifier may require size 17 [-Wfor=
tify-source]
     835 |                    headerStr2,
         |                    ^
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilit=
ies.c:836:20: warning: 'sscanf' may overflow; destination buffer in argumen=
t 5 has size 16, but the corresponding specifier may require size 17 [-Wfor=
tify-source]
     836 |                    headerStr3,
         |                    ^
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilit=
ies.c:837:20: warning: 'sscanf' may overflow; destination buffer in argumen=
t 6 has size 16, but the corresponding specifier may require size 17 [-Wfor=
tify-source]
     837 |                    headerStr4,
         |                    ^
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilit=
ies.c:838:20: warning: 'sscanf' may overflow; destination buffer in argumen=
t 7 has size 16, but the corresponding specifier may require size 17 [-Wfor=
tify-source]
     838 |                    headerStr5,
         |                    ^
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilit=
ies.c:839:20: warning: 'sscanf' may overflow; destination buffer in argumen=
t 8 has size 16, but the corresponding specifier may require size 17 [-Wfor=
tify-source]
     839 |                    headerStr6,
         |                    ^
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilit=
ies.c:840:20: warning: 'sscanf' may overflow; destination buffer in argumen=
t 9 has size 16, but the corresponding specifier may require size 17 [-Wfor=
tify-source]
     840 |                    headerStr7) !=3D NUM_COLUMNS)
         |                    ^
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilit=
ies.c:1138:20: warning: 'sscanf' may overflow; destination buffer in argume=
nt 3 has size 16, but the corresponding specifier may require size 17 [-Wfo=
rtify-source]
    1138 |                    headerStr1,
         |                    ^
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilit=
ies.c:1139:20: warning: 'sscanf' may overflow; destination buffer in argume=
nt 4 has size 16, but the corresponding specifier may require size 17 [-Wfo=
rtify-source]
    1139 |                    headerStr2,
         |                    ^
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilit=
ies.c:1140:20: warning: 'sscanf' may overflow; destination buffer in argume=
nt 5 has size 16, but the corresponding specifier may require size 17 [-Wfo=
rtify-source]
    1140 |                    headerStr3) !=3D NUM_COLUMNS)
         |                    ^
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilit=
ies.c:1293:9: warning: no previous prototype for function 'adi_adrv9025_Pre=
McsInit' [-Wmissing-prototypes]
    1293 | int32_t adi_adrv9025_PreMcsInit(adi_adrv9025_Device_t* device,
         |         ^
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilit=
ies.c:1293:1: note: declare 'static' if the function is not intended to be =
used outside of this translation unit
    1293 | int32_t adi_adrv9025_PreMcsInit(adi_adrv9025_Device_t* device,
         | ^
         | static=20
   drivers/iio/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilit=
ies.c:3412:9: warning: stack frame size (4464) exceeds limit (2048) in 'adi=
_adrv9025_RxGainTableChecksumCalculate' [-Wframe-larger-than]
    3412 | int32_t adi_adrv9025_RxGainTableChecksumCalculate(adi_adrv9025_D=
evice_t*    device,
         |         ^
>> PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/iio/adc/adrv902x/devices/ad=
rv9025/public/src/.adi_adrv9025_utilities.o.d -nostdinc -Iarch/riscv/includ=
e -I./arch/riscv/include/generated -Iinclude -I./include -Iarch/riscv/inclu=
de/uapi -I./arch/riscv/include/generated/uapi -Iinclude/uapi -I./include/ge=
nerated/uapi -include include/linux/compiler-version.h -include include/lin=
ux/kconfig.h -include include/linux/compiler_types.h -D__KERNEL__ --target=
=3Driscv64-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-option -Werr=
or=3Dignored-optimization-argument -Werror=3Doption-ignored -Werror=3Dunuse=
d-command-line-argument -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WAR=
N1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common -fno-PIE -fno-str=
ict-aliasing -fPIE -mabi=3Dlp64 -march=3Drv64imac -mno-save-restore -DCONFI=
G_PAGE_OFFSET=3D0xff60000000000000 -mcmodel=3Dmedany -fno-asynchronous-unwi=
nd-tables -fno-unwind-tables -mstrict-align -fno-delete-null-pointer-checks=
 -O2 -fstack-protector-strong -fno-omit-frame-pointer -fno-optimize-sibling=
-calls -ftrivial-auto-var-init=3Dpattern -fno-stack-clash-protection -fzero=
-call-used-regs=3Dused-gpr -fsanitize=3Dshadow-call-stack -fsanitize=3Dkcfi=
 -fsanitize-cfi-icall-experimental-normalize-integers -falign-functions=3D6=
4 -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-check -Wall -Wun=
def -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -Werror=
=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-trigra=
phs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declarations=
 -Wmissing-prototypes -Wframe-larger-than=3D2048 -Wno-gnu -Wvla -Wno-pointe=
r-sign -Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate-time -Wer=
ror=3Dincompatible-pointer-types -Wenum-conversion -Wextra -Wunused -Wmissi=
ng-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-mis=
sing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-sig=
n-compare -Wno-unused-parameter -DRANDSTRUCT -frandomize-layout-seed-file=
=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -Wno-error=3Dretu=
rn-type -Wreturn-type -funsigned-char -Wundef -falign-functions=3D64 -Idriv=
ers/iio/adc/adrv902x/devices/adrv9025/private/include/ -Idrivers/iio/adc/ad=
rv902x/devices/adrv9025/public/include/ -Idrivers/iio/adc/adrv902x/common/ =
-Idrivers/iio/adc/adrv902x/common/adi_hal/ -Idrivers/iio/adc/adrv902x/commo=
n/adi_error/ -Idrivers/iio/adc/adrv902x/common/adi_libc/ -Idrivers/iio/adc/=
adrv902x/common/adi_logging/ -Idrivers/iio/adc/adrv902x/platforms/ -DADRV90=
25_CHANNELID_CHECK=3D0 -DADI_COMMON_VERBOSE=3D1 -DADI_ADRV9025_RADIOCTRL_RA=
NGE_CHECK=3D1 -DADI_ADRV9025_ARM_VERBOSE=3D0 -Wno-error=3Dmissing-prototype=
s -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsanitize=3Dunreachable -fs=
anitize=3Dbool -fsanitize=3Denum -fsanitize-coverage=3Dtrace-pc -fsanitize-=
coverage=3Dtrace-cmp -Idrivers/iio/adc/adrv902x -Idrivers/iio/adc/adrv902x =
-DKBUILD_MODFILE=3D\"drivers/iio/adc/adrv902x/adrv9025_drv\" -DKBUILD_BASEN=
AME=3D\"adi_adrv9025_utilities\" -DKBUILD_MODNAME=3D\"adrv9025_drv\" -D__KB=
UILD_MODNAME=3Dkmod_adrv9025_drv -c -o drivers/iio/adc/adrv902x/devices/adr=
v9025/public/src/adi_adrv9025_utilities.o drivers/iio/adc/adrv902x/devices/=
adrv9025/public/src/adi_adrv9025_utilities.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'drivers/iio/adc/adrv9=
02x/devices/adrv9025/public/src/adi_adrv9025_utilities.c'.
   4.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@adi_adrv9025_TxAttenTableChecksumCalculate'
    #0 0x00005623af10f3fb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-23+0x3f5d3fb)
    #1 0x00005623af10cfc4 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
23+0x3f5afc4)
    #2 0x00005623af041260 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007f35334dfdf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x00005623ae607f97 (anonymous namespace)::PEIImpl::insertZeroCallUse=
dRegs(llvm::MachineFunction&) (.isra.0) PrologEpilogInserter.cpp:0:0
    #5 0x00005623ae60f1c8 (anonymous namespace)::PEIImpl::run(llvm::Machine=
Function&) (.constprop.0.isra.0) PrologEpilogInserter.cpp:0:0
    #6 0x00005623ae610154 (anonymous namespace)::PEILegacy::runOnMachineFun=
ction(llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #7 0x00005623ae4c9663 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-23+0x3317663)
    #8 0x00005623aea20269 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-23+0x386e269)
    #9 0x00005623aea2069c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-23+0x386e69c)
   #10 0x00005623aea2120a (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #11 0x00005623aea21e1c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-23+0x386fe1c)
   #12 0x00005623af4d4b0f clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-23+0x4322b0f)
   #13 0x00005623afb0d707 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-23+0x495b707)
   #14 0x00005623b14ae4dc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
23+0x62fc4dc)
   #15 0x00005623afe7fbde clang::FrontendAction::Execute() (clang-23+0x4ccd=
bde)
   #16 0x00005623afdf6c6e clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-23+0x4c44c6e)
   #17 0x00005623aff64887 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-23+0x4db2887)
   #18 0x00005623ac19c478 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-23+0xfea478)
   #19 0x00005623ac194173 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #20 0x00005623ac1941b3 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #21 0x00005623afb86ac9 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #22 0x00005623af0415c3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-23+0x3e8f5c3)
   #23 0x00005623afb871f4 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #24 0x00005623afb45428 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-23+0x4993428)
   #25 0x00005623afb46382 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-23+0x4994382)
   #26 0x00005623afb56b5c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-23+0x49a4b5c)
   #27 0x00005623ac198e76 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-23+0xfe6e76)
   #28 0x00005623ac02eed9 main (clang-23+0xe7ced9)
   #29 0x00007f35334c9ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #30 0x00007f35334c9d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #31 0x00005623ac193bb1 _start (clang-23+0xfe1bb1)
>> clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 2592437 Segmentation fault      clang -Wp,-MMD,driver=
s/iio/adc/adrv902x/devices/adrv9025/public/src/.adi_adrv9025_utilities.o.d =
-nostdinc -Iarch/riscv/include -I./arch/riscv/include/generated -Iinclude -=
I./include -Iarch/riscv/include/uapi -I./arch/riscv/include/generated/uapi =
-Iinclude/uapi -I./include/generated/uapi -include include/linux/compiler-v=
ersion.h -include include/linux/kconfig.h -include include/linux/compiler_t=
ypes.h -D__KERNEL__ --target=3Driscv64-linux-gnu -fintegrated-as -Werror=3Du=
nknown-warning-option -Werror=3Dignored-optimization-argument -Werror=3Dopt=
ion-ignored -Werror=3Dunused-command-line-argument -fmacro-prefix-map=3D=3D =
-Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fn=
o-common -fno-PIE -fno-strict-aliasing -fPIE -mabi=3Dlp64 -march=3Drv64imac=
 -mno-save-restore -DCONFIG_PAGE_OFFSET=3D0xff60000000000000 -mcmodel=3Dmed=
any -fno-asynchronous-unwind-tables -fno-unwind-tables -mstrict-align -fno-=
delete-null-pointer-checks -O2 -fstack-protector-strong -fno-omit-frame-poi=
nter -fno-optimize-sibling-calls -ftrivial-auto-var-init=3Dpattern -fno-sta=
ck-clash-protection -fzero-call-used-regs=3Dused-gpr -fsanitize=3Dshadow-ca=
ll-stack -fsanitize=3Dkcfi -fsanitize-cfi-icall-experimental-normalize-inte=
gers -falign-functions=3D64 -fstrict-flex-arrays=3D3 -fno-strict-overflow -=
fno-stack-check -Wall -Wundef -Werror=3Dimplicit-function-declaration -Werr=
or=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-fo=
rmat-security -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-memb=
er -Wmissing-declarations -Wmissing-prototypes -Wframe-larger-than=3D2048 -=
Wno-gnu -Wvla -Wno-pointer-sign -Wcast-function-type -Wimplicit-fallthrough=
 -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conversion=
 -Wextra -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunuse=
d-const-variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shif=
t-negative-value -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -fran=
domize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagno=
stics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falig=
n-functions=3D64 -Idrivers/iio/adc/adrv902x/devices/adrv9025/private/includ=
e/ -Idrivers/iio/adc/adrv902x/devices/adrv9025/public/include/ -Idrivers/ii=
o/adc/adrv902x/common/ -Idrivers/iio/adc/adrv902x/common/adi_hal/ -Idrivers=
/iio/adc/adrv902x/common/adi_error/ -Idrivers/iio/adc/adrv902x/common/adi_l=
ibc/ -Idrivers/iio/adc/adrv902x/common/adi_logging/ -Idrivers/iio/adc/adrv9=
02x/platforms/ -DADRV9025_CHANNELID_CHECK=3D0 -DADI_COMMON_VERBOSE=3D1 -DAD=
I_ADRV9025_RADIOCTRL_RANGE_CHECK=3D1 -DADI_ADRV9025_ARM_VERBOSE=3D0 -Wno-er=
ror=3Dmissing-prototypes -fsanitize=3Darray-bounds -fsanitize=3Dshift -fsan=
itize=3Dunreachable -fsanitize=3Dbool -fsanitize=3Denum -fsanitize-coverage=
=3Dtrace-pc -fsanitize-coverage=3Dtrace-cmp -Idrivers/iio/adc/adrv902x -Idr=
ivers/iio/adc/adrv902x -DKBUILD_MODFILE=3D'"drivers/iio/adc/adrv902x/adrv90=
25_drv"' -DKBUILD_BASENAME=3D'"adi_adrv9025_utilities"' -DKBUILD_MODNAME=3D'=
"adrv9025_drv"' -D__KBUILD_MODNAME=3Dkmod_adrv9025_drv -c -o drivers/iio/ad=
c/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilities.o drivers/iio=
/adc/adrv902x/devices/adrv9025/public/src/adi_adrv9025_utilities.c

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
