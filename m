Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BD135C692
	for <oe-kbuild@lists.linux.dev>; Sun, 18 Oct 2026 22:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792363000; cv=none; b=bMZXX60v50Bgnagu1iU2a1/gJPTrYRWl1+aJrb0Yp/KV/LSXlgEQg51/ArPj6mo5UkhOZT24leoYftHRHC0Hlyz3a99ZFlfG7VNSdeJnTjJboaQ7ejGcTj77Fg/o0fFNUrGRxf7/pr0v1cmNHTPRvB5NWA/TghhCbptyFKaOowo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792363000; c=relaxed/simple;
	bh=rgLtqksSVkv/YESfeU3KPoqSC8vUDBCOMVBB1sIf78Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=WD+tO6xnefdoreRpZ11BMMHjL0G1X45B4wr8T+HxfIrteejDT3Fq9367weGdOaMk7g4X03hc7+bRGSgC2Vef9FPUHtjKduU5XjTIQIVb4P/6DFRt5Sd16NiCQDdiXiMwuciOO/1Hz7FGOYlMJieJwEG4tOrQ5HPsFCwbLz+cxt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qn7BB7QJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qn7BB7QJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792362997; x=1823898997;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=rgLtqksSVkv/YESfeU3KPoqSC8vUDBCOMVBB1sIf78Y=;
  b=Qn7BB7QJvllzqYPIfcWYHnIbtTARfzJNNV7AUlLqDTsuvV7fEWtXKXis
   wdljXdVIm35kh35JGfavSQGmSfvIwmDmu8l+P+19iBE1BrGo+bCxQH06+
   yMy98oEwaIMCw4fgEDDP+JqItEIacTkSl6+WM8Tj1GGLpy83chUNTdYH6
   FaH9AhcKeG8PbHM43ubMUxQ1d1d/CAKcyar1hdaedfNxJlaHQ3i4abY3M
   rNjtTYoQnTXM3nSoGYJJ0bWFtu6hXkOhFmbzvnXaKjyKALEp3SGRMg5/c
   SQKniex2zVpmSEGBb9Fi9q7d2iQAO36ZZvh54ET3cUs19foTUrVbtgzmM
   A==;
X-CSE-ConnectionGUID: mxSU3GTnTxirgS2UtvTDzw==
X-CSE-MsgGUID: cav1ZobuRVSnidkMVcU5Qw==
X-IronPort-AV: E=McAfee;i="6800,10657,11939"; a="1034202"
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="1034202"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 15:36:37 -0700
X-CSE-ConnectionGUID: JeMlRUiBRES0ECctdbCIew==
X-CSE-MsgGUID: yiXXdI4lQImRlPx6ynQ8nw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,166,1787036400"; 
   d="scan'208";a="2492751"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 18 Oct 2026 15:36:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIZUX-000000005Jf-2MUm;
	Sun, 18 Oct 2026 22:36:33 +0000
Date: Mon, 19 Oct 2026 00:36:25 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [lubaolu-intel-iommu:cca/topics/cca-da-gmem-backend 50/59]
 include/uapi/linux/kvm.h:16:10: fatal error: 'asm/kvm.h' file not found
Message-ID: <202610190036.JvQREz5D-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

::::::=20
:::::: Manual check reason: "clang compiler bug"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Baolu Lu <baolu.lu@linux.intel.com>

tree:   https://github.com/LuBaolu/intel-iommu.git cca/topics/cca-da-gmem-b=
ackend
head:   6bdc5a1448b75f784490ac2061dc32ee4bd3b5a4
commit: 97be44a4a870c923a373ab6ab955385daf5e949e [50/59] vfio: Dispatch gue=
st_memfd provider operations through the filesystem
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: hexagon-randconfig-2001-20261018 (https://download.01.org/0day-ci/a=
rchive/20261019/202610190036.JvQREz5D-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 337=
446dacd2a713010f1c9856c21eb8d899b5613)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261019/202610190036.JvQREz5D-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610190036.JvQREz5D-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/vfio/vfio_main.c:20:
>> include/uapi/linux/kvm.h:16:10: fatal error: 'asm/kvm.h' file not found
      16 | #include <asm/kvm.h>
         |          ^~~~~~~~~~~
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,drivers/vfio/.vfio_main.o.d -nostdi=
nc -Iarch/hexagon/include -I./arch/hexagon/include/generated -Iinclude -I./=
include -Iarch/hexagon/include/uapi -I./arch/hexagon/include/generated/uapi=
 -Iinclude/uapi -I./include/generated/uapi -include include/linux/compiler-=
version.h -include include/linux/kconfig.h -include include/linux/compiler_=
types.h -D__KERNEL__ --target=3Dhexagon-linux-musl -fintegrated-as -Werror=
=3Dunknown-warning-option -Werror=3Dignored-optimization-argument -Werror=
=3Doption-ignored -Werror=3Dunused-command-line-argument -fmacro-prefix-map=
=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar -funsigned-char -fno-comm=
on -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fms-anonymous-structs -Wno-g=
nu -Wno-microsoft-anon-tag -G0 -fno-short-enums -mlong-calls -ffixed-r19 -D=
THREADINFO_REG=3Dr19 -D__linux__ -fno-delete-null-pointer-checks -O2 -fno-s=
tack-protector -fno-omit-frame-pointer -fno-optimize-sibling-calls -fexperi=
mental-late-parse-attributes -fdiagnostics-show-inlining-chain -fstrict-fle=
x-arrays=3D3 -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wal=
l -Wextra -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplici=
t-int -Werror=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-securit=
y -Wno-trigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing=
-declarations -Wmissing-prototypes -Wno-format-overflow-non-kprintf -Wno-fo=
rmat-truncation-non-kprintf -Wno-default-const-init-unsafe -Wno-type-limits=
 -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-initializa=
tion -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompatible-poin=
ter-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wmissing-i=
nclude-dirs -Wunused-const-variable -Wno-missing-field-initializers -Wno-sh=
ift-negative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-=
parameter -gsplit-dwarf -g -gdwarf-4 -fno-var-tracking -DRANDSTRUCT -frando=
mize-layout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnost=
ics -Wno-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-=
functions=3D64 -fdebug-info-for-profiling -mllvm -enable-fs-discriminator=
=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue -Idrivers/vfio -Idrivers/v=
fio -DKBUILD_MODFILE=3D\"drivers/vfio/vfio\" -DKBUILD_BASENAME=3D\"vfio_mai=
n\" -DKBUILD_MODNAME=3D\"vfio\" -D__KBUILD_MODNAME=3Dvfio -c -o drivers/vfi=
o/vfio_main.o drivers/vfio/vfio_main.c
   1.	include/uapi/linux/kvm.h:273:5: current parser token 'debug'
   2.	include/uapi/linux/kvm.h:224:1: parsing struct/union body 'kvm_run'
   3.	include/uapi/linux/kvm.h:245:2: parsing struct/union body 'kvm_run::u=
nion (unnamed at include/uapi/linux/kvm.h:245:2)'
   4.	include/uapi/linux/kvm.h:271:3: parsing struct/union body 'kvm_run::(=
unnamed union)::struct (unnamed at include/uapi/linux/kvm.h:271:3)'
    #0 0x000055de355d964a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-24+0x3a8e64a)
    #1 0x000055de355d7224 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
24+0x3a8c224)
    #2 0x000055de35505e80 CrashRecoverySignalHandler(int) CrashRecoveryCont=
ext.cpp:0:0
    #3 0x00007fc36550bdf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #4 0x000055de3919e625 clang::ASTContext::getASTRecordLayout(clang::Reco=
rdDecl const*) const (clang-24+0x7653625)
    #5 0x000055de38a11ec6 clang::ASTContext::getTypeInfoImpl(clang::Type co=
nst*) const (clang-24+0x6ec6ec6)
    #6 0x000055de38a129a2 clang::ASTContext::getTypeInfo(clang::Type const*=
) const (clang-24+0x6ec79a2)
    #7 0x000055de3919170d clang::randstruct::randomizeStructureLayout(clang=
::ASTContext const&, clang::RecordDecl*, llvm::SmallVectorImpl<clang::Decl*=
>&) (clang-24+0x764670d)
    #8 0x000055de37e9abfb clang::Sema::ActOnFields(clang::Scope*, clang::So=
urceLocation, clang::Decl*, llvm::ArrayRef<clang::Decl*>, clang::SourceLoca=
tion, clang::SourceLocation, clang::ParsedAttributesView const&) (clang-24+=
0x634fbfb)
    #9 0x000055de37ae0dc8 clang::Parser::ParseStructUnionBody(clang::Source=
Location, clang::TypeSpecifierType, clang::RecordDecl*) (clang-24+0x5f95dc8)
   #10 0x000055de37b078f4 clang::Parser::ParseClassSpecifier(clang::tok::To=
kenKind, clang::SourceLocation, clang::DeclSpec&, clang::Parser::ParsedTemp=
lateInfo&, clang::AccessSpecifier, bool, clang::Parser::DeclSpecContext, cl=
ang::ParsedAttributes&) (clang-24+0x5fbc8f4)
   #11 0x000055de37ad4a9e clang::Parser::ParseDeclarationSpecifiers(clang::=
DeclSpec&, clang::Parser::ParsedTemplateInfo&, clang::AccessSpecifier, clan=
g::Parser::DeclSpecContext, clang::LateParsedAttrList*, clang::ImplicitType=
nameContext) (clang-24+0x5f89a9e)
   #12 0x000055de37ad82b3 clang::Parser::ParseSpecifierQualifierList(clang:=
:DeclSpec&, clang::ImplicitTypenameContext, clang::AccessSpecifier, clang::=
Parser::DeclSpecContext) (clang-24+0x5f8d2b3)
   #13 0x000055de37adf448 clang::Parser::ParseStructDeclaration(clang::Pars=
ingDeclSpec&, llvm::function_ref<clang::Decl* (clang::ParsingFieldDeclarato=
r&)>, clang::LateParsedAttrList*) (clang-24+0x5f94448)
   #14 0x000055de37ae10f7 clang::Parser::ParseStructUnionBody(clang::Source=
Location, clang::TypeSpecifierType, clang::RecordDecl*) (clang-24+0x5f960f7)
   #15 0x000055de37b078f4 clang::Parser::ParseClassSpecifier(clang::tok::To=
kenKind, clang::SourceLocation, clang::DeclSpec&, clang::Parser::ParsedTemp=
lateInfo&, clang::AccessSpecifier, bool, clang::Parser::DeclSpecContext, cl=
ang::ParsedAttributes&) (clang-24+0x5fbc8f4)
   #16 0x000055de37ad4a9e clang::Parser::ParseDeclarationSpecifiers(clang::=
DeclSpec&, clang::Parser::ParsedTemplateInfo&, clang::AccessSpecifier, clan=
g::Parser::DeclSpecContext, clang::LateParsedAttrList*, clang::ImplicitType=
nameContext) (clang-24+0x5f89a9e)
   #17 0x000055de37ad82b3 clang::Parser::ParseSpecifierQualifierList(clang:=
:DeclSpec&, clang::ImplicitTypenameContext, clang::AccessSpecifier, clang::=
Parser::DeclSpecContext) (clang-24+0x5f8d2b3)
   #18 0x000055de37adf448 clang::Parser::ParseStructDeclaration(clang::Pars=
ingDeclSpec&, llvm::function_ref<clang::Decl* (clang::ParsingFieldDeclarato=
r&)>, clang::LateParsedAttrList*) (clang-24+0x5f94448)
   #19 0x000055de37ae10f7 clang::Parser::ParseStructUnionBody(clang::Source=
Location, clang::TypeSpecifierType, clang::RecordDecl*) (clang-24+0x5f960f7)
   #20 0x000055de37b078f4 clang::Parser::ParseClassSpecifier(clang::tok::To=
kenKind, clang::SourceLocation, clang::DeclSpec&, clang::Parser::ParsedTemp=
lateInfo&, clang::AccessSpecifier, bool, clang::Parser::DeclSpecContext, cl=
ang::ParsedAttributes&) (clang-24+0x5fbc8f4)
   #21 0x000055de37ad4a9e clang::Parser::ParseDeclarationSpecifiers(clang::=
DeclSpec&, clang::Parser::ParsedTemplateInfo&, clang::AccessSpecifier, clan=
g::Parser::DeclSpecContext, clang::LateParsedAttrList*, clang::ImplicitType=
nameContext) (clang-24+0x5f89a9e)
   #22 0x000055de37a882fc clang::Parser::ParseDeclOrFunctionDefInternal(cla=
ng::ParsedAttributes&, clang::ParsedAttributes&, clang::ParsingDeclSpec&, c=
lang::AccessSpecifier) (clang-24+0x5f3d2fc)
   #23 0x000055de37a88cf7 clang::Parser::ParseDeclarationOrFunctionDefiniti=
on(clang::ParsedAttributes&, clang::ParsedAttributes&, clang::ParsingDeclSp=
ec*, clang::AccessSpecifier) (clang-24+0x5f3dcf7)
   #24 0x000055de37a93e42 clang::Parser::ParseExternalDeclaration(clang::Pa=
rsedAttributes&, clang::ParsedAttributes&, clang::ParsingDeclSpec*) (clang-=
24+0x5f48e42)
   #25 0x000055de37a94c6d clang::Parser::ParseTopLevelDecl(clang::OpaquePtr=
<clang::DeclGroupRef>&, clang::Sema::ModuleImportState&) (clang-24+0x5f49c6=
d)
   #26 0x000055de37a72b79 clang::ParseAST(clang::Sema&, bool, bool) (clang-=
24+0x5f27b79)
   #27 0x000055de36318cde clang::FrontendAction::Execute() (clang-24+0x47cd=
cde)
   #28 0x000055de362a72ee clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-24+0x475c2ee)
   #29 0x000055de363e2297 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-24+0x4897297)
   #30 0x000055de323fb158 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-24+0x8b0158)
   #31 0x000055de323f2e43 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #32 0x000055de323f2e87 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #33 0x000055de36043759 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #34 0x000055de355061b3 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-24+0x39bb1b3)
   #35 0x000055de36044b8c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #36 0x000055de36002748 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-24+0x44b7748)
   #37 0x000055de36006eb2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-24+0x44bbeb2)
   #38 0x000055de3601707c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-24+0x44cc07c)
   #39 0x000055de323f7af2 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-24+0x8acaf2)
   #40 0x000055de32363e92 main (clang-24+0x818e92)
   #41 0x00007fc3654f5ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #42 0x00007fc3654f5d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #43 0x000055de323f28a1 _start (clang-24+0x8a78a1)
   clang: error: clang frontend command failed due to signal (use -v to see=
 invocation)
>> /bin/bash: line 1: 3035529 Segmentation fault      clang -Wp,-MMD,driver=
s/vfio/.vfio_main.o.d -nostdinc -Iarch/hexagon/include -I./arch/hexagon/inc=
lude/generated -Iinclude -I./include -Iarch/hexagon/include/uapi -I./arch/h=
exagon/include/generated/uapi -Iinclude/uapi -I./include/generated/uapi -in=
clude include/linux/compiler-version.h -include include/linux/kconfig.h -in=
clude include/linux/compiler_types.h -D__KERNEL__ --target=3Dhexagon-linux-=
musl -fintegrated-as -Werror=3Dunknown-warning-option -Werror=3Dignored-opt=
imization-argument -Werror=3Doption-ignored -Werror=3Dunused-command-line-a=
rgument -fmacro-prefix-map=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -fshort-wchar=
 -funsigned-char -fno-common -fno-PIE -fno-strict-aliasing -std=3Dgnu11 -fm=
s-anonymous-structs -Wno-gnu -Wno-microsoft-anon-tag -G0 -fno-short-enums -=
mlong-calls -ffixed-r19 -DTHREADINFO_REG=3Dr19 -D__linux__ -fno-delete-null=
-pointer-checks -O2 -fno-stack-protector -fno-omit-frame-pointer -fno-optim=
ize-sibling-calls -fexperimental-late-parse-attributes -fdiagnostics-show-i=
nlining-chain -fstrict-flex-arrays=3D3 -fno-strict-overflow -fno-stack-chec=
k -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-function-dec=
laration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Dstrict-prot=
otypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wno-address-=
of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno-format-ov=
erflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-in=
it-unsafe -Wno-type-limits -Wno-pointer-sign -Wcast-function-type -Wno-unte=
rminated-string-initialization -Wimplicit-fallthrough -Werror=3Ddate-time -=
Werror=3Dincompatible-pointer-types -Wenum-conversion -Wunused -Wmissing-fo=
rmat-attribute -Wmissing-include-dirs -Wunused-const-variable -Wno-missing-=
field-initializers -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno=
-sign-compare -Wno-unused-parameter -gsplit-dwarf -g -gdwarf-4 -fno-var-tra=
cking -DRANDSTRUCT -frandomize-layout-seed-file=3D./scripts/basic/randstruc=
t.seed -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsi=
gned-char -Wundef -falign-functions=3D64 -fdebug-info-for-profiling -mllvm =
-enable-fs-discriminator=3Dtrue -mllvm -improved-fs-discriminator=3Dtrue -I=
drivers/vfio -Idrivers/vfio -DKBUILD_MODFILE=3D'"drivers/vfio/vfio"' -DKBUI=
LD_BASENAME=3D'"vfio_main"' -DKBUILD_MODNAME=3D'"vfio"' -D__KBUILD_MODNAME=
=3Dvfio -c -o drivers/vfio/vfio_main.o drivers/vfio/vfio_main.c


vim +16 include/uapi/linux/kvm.h

6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  =
 4 =20
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  =
 5  /*
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  =
 6   * Userspace interface for /dev/kvm - kernel based virtual machine
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  =
 7   *
dea8caee7b6971 include/linux/kvm.h      Rusty Russell          2007-07-17  =
 8   * Note: you must update KVM_API_VERSION if you change this interface.
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  =
 9   */
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  =
10 =20
fb1070d18edb37 include/uapi/linux/kvm.h Joe Richey             2021-05-21  =
11  #include <linux/const.h>
00bfddaf7f68a6 include/linux/kvm.h      Jaswinder Singh Rajput 2009-01-15  =
12  #include <linux/types.h>
97646202bc3f19 include/linux/kvm.h      Christian Borntraeger  2008-03-12  =
13  #include <linux/compiler.h>
2619da73bb2f10 include/uapi/linux/kvm.h David Woodhouse        2026-03-05  =
14  #include <linux/stddef.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  =
15  #include <linux/ioctl.h>
f6a40e3bdf5fe0 include/linux/kvm.h      Jerone Young           2007-11-19 @=
16  #include <asm/kvm.h>
6aa8b732ca01c3 include/linux/kvm.h      Avi Kivity             2006-12-10  =
17 =20

:::::: The code at line 16 was first introduced by commit
:::::: f6a40e3bdf5fe0a7d7d7f2dbc5b10158fbdad968 KVM: Portability: Move kvm_=
memory_alias to asm/kvm.h

:::::: TO: Jerone Young <jyoung5@us.ibm.com>
:::::: CC: Avi Kivity <avi@qumranet.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
