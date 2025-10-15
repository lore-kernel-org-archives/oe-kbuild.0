Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B647C280037
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Oct 2025 20:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760559452; cv=none; b=GcJfD3KpJ6pt+Cxtxy6n0mF4YFwaJe4PdWboONKg6kjHKTbcmjEPFWkHtpYDGUzgmm2BB9zwNnYN/V8JttVYg+tmKOHjNrmSS55T8U3wxUbLT/+ZB907irDokAVP3wivUqRWyWuZn8GGbU362VyEWd7FxqTnYAItJKNPlKhq67A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760559452; c=relaxed/simple;
	bh=CwVvC67VhKi2NHaOEzlhaLSl0MD/x+Q7pW6Ffx2gyfY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WHoymn/S+ZN3G/dV9/4CUdqSaO2zFwVX5UpGlry5c1b6AQkRBC1s7FxJJM2ZY1/T+E7B6V23+CYlTU4ak8pM/JvE93qOLEK9JOLqPwikAesTWL+JPn89euUCZSPSQbfuZM06NlDAIZ65GPZmDGvpIZS7DjtSXF3/U+n720AaQJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dy3fhXjA; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dy3fhXjA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760559451; x=1792095451;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=CwVvC67VhKi2NHaOEzlhaLSl0MD/x+Q7pW6Ffx2gyfY=;
  b=Dy3fhXjARX71Ng2jBsyDxbHTyvS7wucg5tvD8TzZTz8HQFCP0n2EORA9
   79EOccvOqC0eLPKFx7e1ObFzq/yPwMtGIm5fplyjKAGGexbFJZO8ucxRc
   ijzJ6E+JEtUGdt/Tof/jt8oAiz4UmV8gPOqouMxhyNsSnNVZhpjwVNV77
   YWHSpRYw82GdLY4Xhwdx9kv3vUZj6FGXI1PySpEgO9YlqVAhRNHfhqhLR
   nIsY+KHWwo9vJdbyIrCRW/hxmPfuJBjfkeVs+ww7ojV3QgF+4UqaM/fR1
   tEEM5i/0k1929fo12UcB0lgkYjOrcQVlFDToUihfgu9NeAvdHZza7wzGX
   w==;
X-CSE-ConnectionGUID: Kv2DIAFKSJ2IYGp/+w6cFA==
X-CSE-MsgGUID: x+LzZH/RQryseSIEz/GOIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="62895207"
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="62895207"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2025 13:17:30 -0700
X-CSE-ConnectionGUID: NWkqR0PoQmKhgvKV6rnhcg==
X-CSE-MsgGUID: 29rRmgZJTkuYVRMdvKgs7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,232,1754982000"; 
   d="scan'208";a="187555031"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 15 Oct 2025 13:17:28 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v97vs-0004CP-0C;
	Wed, 15 Oct 2025 20:17:17 +0000
Date: Thu, 16 Oct 2025 04:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [tglx-devel:rseq/cid 47/64] include/linux/mm_types.h:981:20: error:
 field has incomplete type 'struct mm_mm_cid'
Message-ID: <202510160444.X4AEhOQx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "clang compiler bug"
::::::=20

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
TO: Thomas Gleixner <tglx@linutronix.de>

Hi Thomas,

FYI, the error/warning was bisected to this commit, please ignore it if it'=
s irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git rseq=
/cid
head:   e196d67a03daa4beb27afc2961845664ac3ef3d5
commit: ca9070e3656a97ecc5cfbfd1dd101d98ddef2d36 [47/64] sched/mmcid: Use p=
roper data structures
:::::: branch date: 3 hours ago
:::::: commit date: 3 hours ago
config: x86_64-buildonly-randconfig-001-20251016 (https://download.01.org/0=
day-ci/archive/20251016/202510160444.X4AEhOQx-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f022=
7cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20251016/202510160444.X4AEhOQx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202510160444.X4AEhOQx-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:9:
   In file included from include/linux/crypto.h:18:
   In file included from include/linux/slab.h:16:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
>> include/linux/mm_types.h:981:20: error: field has incomplete type 'struc=
t mm_mm_cid'
     981 |                 struct mm_mm_cid mm_cid;
         |                                  ^
   include/linux/mm_types.h:981:10: note: forward declaration of 'struct mm=
_mm_cid'
     981 |                 struct mm_mm_cid mm_cid;
         |                        ^
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,arch/x86/kernel/.asm-offsets.s.d -n=
ostdinc -Iarch/x86/include -I./arch/x86/include/generated -Iinclude -I./inc=
lude -Iarch/x86/include/uapi -I./arch/x86/include/generated/uapi -Iinclude/=
uapi -I./include/generated/uapi -include include/linux/compiler-version.h -=
include include/linux/kconfig.h -include include/linux/compiler_types.h -D_=
_KERNEL__ --target=3Dx86_64-linux-gnu -fintegrated-as -Werror=3Dunknown-war=
ning-option -Werror=3Dignored-optimization-argument -Werror=3Doption-ignore=
d -Werror=3Dunused-command-line-argument -fmacro-prefix-map=3D=3D -Wundef -=
DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-char -fno-common =
-fno-PIE -fno-strict-aliasing -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-a=
vx -fcf-protection=3Dbranch -fno-jump-tables -m64 -falign-loops=3D1 -mno-80=
387 -mno-fp-ret-in-387 -mstack-alignment=3D8 -mskip-rax-setup -march=3Dx86-=
64 -mtune=3Dgeneric -mno-red-zone -mcmodel=3Dkernel -Wno-sign-compare -fno-=
asynchronous-unwind-tables -mharden-sls=3Dall -fno-delete-null-pointer-chec=
ks -O2 -fno-stack-protector -fomit-frame-pointer -fno-stack-clash-protectio=
n -falign-functions=3D16 -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno=
-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-f=
unction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3D=
strict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -W=
no-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wn=
o-gnu -Wno-format-overflow-non-kprintf -Wno-format-truncation-non-kprintf -=
Wno-pointer-sign -Wcast-function-type -Wimplicit-fallthrough -Werror=3Ddate=
-time -Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmis=
sing-format-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-m=
issing-field-initializers -Wno-type-limits -Wno-shift-negative-value -Wno-e=
num-enum-conversion -Wno-sign-compare -Wno-unused-parameter -DRANDSTRUCT -f=
randomize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-dia=
gnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -I.=
 -I. -DKBUILD_MODFILE=3D\"./asm-offsets\" -DKBUILD_BASENAME=3D\"asm_offsets=
\" -DKBUILD_MODNAME=3D\"asm_offsets\" -D__KBUILD_MODNAME=3Dkmod_asm_offsets=
 -fverbose-asm -S -o arch/x86/kernel/asm-offsets.s arch/x86/kernel/asm-offs=
ets.c
   1.	include/linux/mm_types.h:1176:22: current parser token ';'
   2.	include/linux/mm_types.h:930:1: parsing struct/union body 'mm_struct'
   3.	include/linux/mm_types.h:931:2: parsing struct/union body 'mm_struct:=
:struct (unnamed at include/linux/mm_types.h:931:2)'
    #0 0x000055f34252edfb llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-20+0x3d3edfb)
    #1 0x000055f34252cd94 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
20+0x3d3cd94)
    #2 0x000055f34247d1d8 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fe91eeffdf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055f345bc6e9e clang::ASTContext::getASTRecordLayout(clang::Reco=
rdDecl const*) const (clang-20+0x73d6e9e)
    #5 0x000055f345644e03 clang::ASTContext::getTypeInfoImpl(clang::Type co=
nst*) const (clang-20+0x6e54e03)
    #6 0x000055f34562f230 clang::ASTContext::getTypeInfo(clang::Type const*=
) const (clang-20+0x6e3f230)
    #7 0x000055f34562f230 clang::ASTContext::getTypeInfo(clang::Type const*=
) const (clang-20+0x6e3f230)
    #8 0x000055f345bb43bc clang::randstruct::randomizeStructureLayout(clang=
::ASTContext const&, clang::RecordDecl*, llvm::SmallVectorImpl<clang::Decl*=
>&) (clang-20+0x73c43bc)
    #9 0x000055f344b6987d clang::Sema::ActOnFields(clang::Scope*, clang::So=
urceLocation, clang::Decl*, llvm::ArrayRef<clang::Decl*>, clang::SourceLoca=
tion, clang::SourceLocation, clang::ParsedAttributesView const&) (clang-20+=
0x637987d)
   #10 0x000055f344850967 clang::Parser::ParseStructUnionBody(clang::Source=
Location, clang::TypeSpecifierType, clang::RecordDecl*) (clang-20+0x6060967)
   #11 0x000055f3448760f5 clang::Parser::ParseClassSpecifier(clang::tok::To=
kenKind, clang::SourceLocation, clang::DeclSpec&, clang::Parser::ParsedTemp=
lateInfo&, clang::AccessSpecifier, bool, clang::Parser::DeclSpecContext, cl=
ang::ParsedAttributes&) (clang-20+0x60860f5)
   #12 0x000055f344840384 clang::Parser::ParseDeclarationSpecifiers(clang::=
DeclSpec&, clang::Parser::ParsedTemplateInfo&, clang::AccessSpecifier, clan=
g::Parser::DeclSpecContext, clang::Parser::LateParsedAttrList*, clang::Impl=
icitTypenameContext) (clang-20+0x6050384)
   #13 0x000055f3448435a0 clang::Parser::ParseSpecifierQualifierList(clang:=
:DeclSpec&, clang::ImplicitTypenameContext, clang::AccessSpecifier, clang::=
Parser::DeclSpecContext) (clang-20+0x60535a0)
   #14 0x000055f34484ee9d clang::Parser::ParseStructDeclaration(clang::Pars=
ingDeclSpec&, llvm::function_ref<clang::Decl* (clang::ParsingFieldDeclarato=
r&)>, clang::Parser::LateParsedAttrList*) (clang-20+0x605ee9d)
   #15 0x000055f344850c75 clang::Parser::ParseStructUnionBody(clang::Source=
Location, clang::TypeSpecifierType, clang::RecordDecl*) (clang-20+0x6060c75)
   #16 0x000055f3448760f5 clang::Parser::ParseClassSpecifier(clang::tok::To=
kenKind, clang::SourceLocation, clang::DeclSpec&, clang::Parser::ParsedTemp=
lateInfo&, clang::AccessSpecifier, bool, clang::Parser::DeclSpecContext, cl=
ang::ParsedAttributes&) (clang-20+0x60860f5)
   #17 0x000055f344840384 clang::Parser::ParseDeclarationSpecifiers(clang::=
DeclSpec&, clang::Parser::ParsedTemplateInfo&, clang::AccessSpecifier, clan=
g::Parser::DeclSpecContext, clang::Parser::LateParsedAttrList*, clang::Impl=
icitTypenameContext) (clang-20+0x6050384)
   #18 0x000055f344802210 clang::Parser::ParseDeclOrFunctionDefInternal(cla=
ng::ParsedAttributes&, clang::ParsedAttributes&, clang::ParsingDeclSpec&, c=
lang::AccessSpecifier) (clang-20+0x6012210)
   #19 0x000055f3448030d3 clang::Parser::ParseDeclarationOrFunctionDefiniti=
on(clang::ParsedAttributes&, clang::ParsedAttributes&, clang::ParsingDeclSp=
ec*, clang::AccessSpecifier) (clang-20+0x60130d3)
   #20 0x000055f34480a491 clang::Parser::ParseExternalDeclaration(clang::Pa=
rsedAttributes&, clang::ParsedAttributes&, clang::ParsingDeclSpec*) (clang-=
20+0x601a491)
   #21 0x000055f34480bb65 clang::Parser::ParseTopLevelDecl(clang::OpaquePtr=
<clang::DeclGroupRef>&, clang::Sema::ModuleImportState&) (clang-20+0x601bb6=
5)
   #22 0x000055f3447fb6aa clang::ParseAST(clang::Sema&, bool, bool) (clang-=
20+0x600b6aa)
   #23 0x000055f343104fd1 clang::FrontendAction::Execute() (clang-20+0x4914=
fd1)
   #24 0x000055f34307a62b clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-20+0x488a62b)
   #25 0x000055f3431d2ae7 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-20+0x49e2ae7)
   #26 0x000055f33f83f0c0 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-20+0x104f0c0)
   #27 0x000055f33f837d1a ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&) driver.cpp:0:0
   #28 0x000055f342e6b959 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #29 0x000055f34247d5a3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-20+0x3c8d5a3)
   #30 0x000055f342e6bce9 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #31 0x000055f342e3031c clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-20+0x464031c)
   #32 0x000055f342e31319 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-20+0x4641319)
   #33 0x000055f342e4403c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-20+0x465403c)
   #34 0x000055f33f83c01e clang_main(int, char**, llvm::ToolContext const&)=
 (clang-20+0x104c01e)
   #35 0x000055f33f708503 main (clang-20+0xf18503)
   #36 0x00007fe91eee9ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #37 0x00007fe91eee9d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #38 0x000055f33f837511 _start (clang-20+0x1047511)
   clang: error: clang frontend command failed with exit code 139 (use -v t=
o see invocation)
   make[3]: *** [scripts/Makefile.build:182: arch/x86/kernel/asm-offsets.s]=
 Error 139 shuffle=3D395054426
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1282: prepare0] Error 2 shuffle=3D395054426
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3D395054426
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3D395054426
   make: Target 'prepare' not remade because of errors.


vim +981 include/linux/mm_types.h

227a4aadc75ba2 Mathieu Desnoyers 2019-09-19  968 =20
b279ddc3382426 Vegard Nossum     2017-02-27  969  		/**
b279ddc3382426 Vegard Nossum     2017-02-27  970  		 * @mm_users: The numbe=
r of users including userspace.
b279ddc3382426 Vegard Nossum     2017-02-27  971  		 *
c1a2f7f0c06454 Rik van Riel      2018-07-16  972  		 * Use mmget()/mmget_no=
t_zero()/mmput() to modify. When this
c1a2f7f0c06454 Rik van Riel      2018-07-16  973  		 * drops to 0 (i.e. whe=
n the task exits and there are no other
c1a2f7f0c06454 Rik van Riel      2018-07-16  974  		 * temporary reference =
holders), we also release a reference on
c1a2f7f0c06454 Rik van Riel      2018-07-16  975  		 * @mm_count (which may=
 then free the &struct mm_struct if
c1a2f7f0c06454 Rik van Riel      2018-07-16  976  		 * @mm_count also drops=
 to 0).
b279ddc3382426 Vegard Nossum     2017-02-27  977  		 */
b279ddc3382426 Vegard Nossum     2017-02-27  978  		atomic_t mm_users;
b279ddc3382426 Vegard Nossum     2017-02-27  979 =20
ca9070e3656a97 Thomas Gleixner   2025-10-03  980  		/* MM CID related stora=
ge */
ca9070e3656a97 Thomas Gleixner   2025-10-03 @981  		struct mm_mm_cid mm_cid;
ca9070e3656a97 Thomas Gleixner   2025-10-03  982 =20

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
