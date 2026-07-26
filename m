Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0614233993
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Jul 2026 03:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785035250; cv=none; b=OwM+umdGmXfpOFjZaPqY1o+RZAje6n31caOuhZv30zG4tYvK9HLZVSeN+WNmQq168WO+Le2oH/lcAHKHQeo+0mp6B3xGlGSdxAEJocQ419f/xTcXayCG/VqqpvjJsbylZIpSfPmWs4p5t+TaUD52LJK4rV5VG9SRPQS8X07K5PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785035250; c=relaxed/simple;
	bh=m40d1sattDmiQnWULF8t4LoC6SdAckqepxx+/0RLBWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=XyTvrmKzbJ/AszcRb847EFOk5GkfSlkIgeQhQKBJZNvjvrhNMTlMrmlphj6F9ZCzvQpRqSUbRayCD0nXzaCrlVtNvAKEURtxz78a4TP2QdNQcpGv/oGYj+6sMpL5Br1XTQ0WTC1DL21dzaDoLqLSuvGOK73MwVW6gCfkDLAlv4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GnSob0R0; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GnSob0R0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785035247; x=1816571247;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=m40d1sattDmiQnWULF8t4LoC6SdAckqepxx+/0RLBWQ=;
  b=GnSob0R0W9+2BmxkCKgUrtOYa34Dph18I7Yi96eoBm2tb2dRJa01VNrV
   Yn2lx6Ypvg5AgOsoz1sl8GhimJufN6H/El2rRi7/MDHZOPGEAcqpP6BKx
   r4P0Zvnc84T1smstx+oRE8x456vDjPw07ZwSNYaiH6suvXPDOuOUoUOd7
   CSWT8y2t5ysR1ydh7YWdSnhY5vgoWnfP4Ks4JjN2Zy+UIrGqJrHDvSsI4
   q5FRQaoXAV5ObWcQwyxx1NClUfYtzek8HCe2Yjb+gOD/djSrX4ChuyR3t
   vrF+GTYT+3spOVT3aKGfhiZOHFS4NPiY7lf/veeL+QY4oFOl5Z6jwkQKb
   A==;
X-CSE-ConnectionGUID: Ov5b8H/iS36AMdr4vowfkg==
X-CSE-MsgGUID: ffErCGXORr2bxOrxNwMMYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11856"; a="85691058"
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="85691058"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2026 20:07:26 -0700
X-CSE-ConnectionGUID: m2n3t7wBTEaq82L5pW2kgg==
X-CSE-MsgGUID: aZTc3SToSUeOOmYdQQM0wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,185,1779174000"; 
   d="scan'208";a="261019922"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 25 Jul 2026 20:07:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wnpD1-00000000cFD-06HI;
	Sun, 26 Jul 2026 03:07:23 +0000
Date: Sun, 26 Jul 2026 11:06:44 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: arch/mips/include/asm/jump_label.h:42:11: error: unknown
 instruction, did you mean: b?
Message-ID: <202607261055.TruGRfdo-lkp@intel.com>
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
CC: linux-kernel@vger.kernel.org
TO: Roman Gushchin <roman.gushchin@linux.dev>
CC: Alexei Starovoitov <ast@kernel.org>

Hi Roman,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0ce37745d4bfbc493f718169c3974898ffec8ee7
commit: 5c7db3239c9fbe3c62cb0d89b64959ea23af2de9 mm: introduce bpf_get_root=
_mem_cgroup() BPF kfunc
date:   7 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 7 months ago
config: mips-randconfig-r113-20260725 (https://download.01.org/0day-ci/arch=
ive/20260726/202607261055.TruGRfdo-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 890=
b11e09e45e9d8b29f2f94f22052be3934e757)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260726/202607261055.TruGRfdo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 5c7db3239c9f ("mm: introduce bpf_get_root_mem_cgroup() BPF kfunc")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607261055.TruGRfdo-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/bpf_memcontrol.c:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:12:
   In file included from include/linux/sched.h:12:
   In file included from ./arch/mips/include/generated/asm/current.h:1:
   In file included from include/asm-generic/current.h:6:
   In file included from include/linux/thread_info.h:13:
   In file included from include/linux/bug.h:5:
   In file included from arch/mips/include/asm/bug.h:42:
   In file included from include/asm-generic/bug.h:31:
   In file included from include/linux/printk.h:621:
   In file included from include/linux/dynamic_debug.h:6:
   In file included from include/linux/jump_label.h:113:
>> arch/mips/include/asm/jump_label.h:42:11: error: unknown instruction, di=
d you mean: b?
      42 |         asm goto("1:\t" B_INSN " 2f\n\t"
         |                  ^
   <inline asm>:1:5: note: instantiated into assembly here
       1 |         1:      b32 2f
         |                 ^
   fatal error: error in backend: Cannot select: 0x563d74efed80: i32 =3D tr=
uncate 0x563d74eff1e0
     0x563d74eff1e0: i64,ch =3D CopyFromReg 0x563d76446010, Register:i64 %12
   In function: bpf_get_mem_cgroup
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace and dumped files.
   Stack dump:
   0.	Program arguments: clang -Wp,-MMD,mm/.bpf_memcontrol.o.d -nostdinc -I=
arch/mips/include -I./arch/mips/include/generated -Iinclude -I./include -Ia=
rch/mips/include/uapi -I./arch/mips/include/generated/uapi -Iinclude/uapi -=
I./include/generated/uapi -include include/linux/compiler-version.h -includ=
e include/linux/kconfig.h -include include/linux/compiler_types.h -D__KERNE=
L__ --target=3Dmipsel-linux-gnu -fintegrated-as -Werror=3Dunknown-warning-o=
ption -Werror=3Dignored-optimization-argument -Werror=3Doption-ignored -Wer=
ror=3Dunused-command-line-argument -DVMLINUX_LOAD_ADDRESS=3D0xffffffff80100=
000 -DLINKER_LOAD_ADDRESS=3D0x80100000 -DDATAOFFSET=3D0 -fmacro-prefix-map=
=3D=3D -Wundef -DKBUILD_EXTRA_WARN1 -std=3Dgnu11 -fshort-wchar -funsigned-c=
har -fno-common -fno-PIE -fno-strict-aliasing -mno-check-zero-division -mab=
i=3D32 -G 0 -mno-abicalls -fno-pic -pipe -msoft-float -Wa,-msoft-float -ffr=
eestanding -EL -fno-stack-check -march=3Dmips64 -Wa,--trap -mmicromips -DTO=
OLCHAIN_SUPPORTS_VIRT -Iarch/mips/include/asm/mach-generic -Iarch/mips/incl=
ude/asm/mach-generic -fno-asynchronous-unwind-tables -fno-delete-null-point=
er-checks -O2 -fstack-protector -fomit-frame-pointer -ftrivial-auto-var-ini=
t=3Dzero -fstrict-flex-arrays=3D3 -fms-extensions -fno-strict-overflow -fno=
-stack-check -fno-builtin-wcslen -Wall -Wextra -Wundef -Werror=3Dimplicit-f=
unction-declaration -Werror=3Dimplicit-int -Werror=3Dreturn-type -Werror=3Ds=
trict-prototypes -Wno-format-security -Wno-trigraphs -Wno-frame-address -Wn=
o-address-of-packed-member -Wmissing-declarations -Wmissing-prototypes -Wno=
-gnu -Wno-microsoft-anon-tag -Wno-format-overflow-non-kprintf -Wno-format-t=
runcation-non-kprintf -Wno-default-const-init-unsafe -Wno-pointer-sign -Wca=
st-function-type -Wno-unterminated-string-initialization -Wimplicit-fallthr=
ough -Werror=3Ddate-time -Werror=3Dincompatible-pointer-types -Wenum-conver=
sion -Wunused -Wmissing-format-attribute -Wmissing-include-dirs -Wunused-co=
nst-variable -Wno-missing-field-initializers -Wno-type-limits -Wno-shift-ne=
gative-value -Wno-enum-enum-conversion -Wno-sign-compare -Wno-unused-parame=
ter -fno-crash-diagnostics -Wno-error=3Dreturn-type -Wreturn-type -funsigne=
d-char -Wundef -falign-functions=3D64 -Imm -Imm -DKBUILD_MODFILE=3D\"mm/bpf=
_memcontrol\" -DKBUILD_BASENAME=3D\"bpf_memcontrol\" -DKBUILD_MODNAME=3D\"b=
pf_memcontrol\" -D__KBUILD_MODNAME=3Dbpf_memcontrol -c -o mm/bpf_memcontrol=
.o mm/bpf_memcontrol.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'mm/bpf_memcontrol.c'.
   4.	Running pass 'MIPS DAG->DAG Pattern Instruction Selection' on functio=
n '@bpf_get_mem_cgroup'
    #0 0x0000563d69d6f48a llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-24+0x38c748a)
    #1 0x0000563d69d6d064 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
24+0x38c5064)
    #2 0x0000563d69ca2d12 llvm::CrashRecoveryContext::HandleExit(int) (clan=
g-24+0x37fad12)
    #3 0x0000563d69d641ae llvm::sys::Process::Exit(int, bool) (clang-24+0x3=
8bc1ae)
    #4 0x0000563d66d830b7 LLVMErrorHandler(void*, char const*, bool) cc1_ma=
in.cpp:0:0
    #5 0x0000563d69cac53c llvm::report_fatal_error(llvm::Twine const&, bool=
) (clang-24+0x380453c)
    #6 0x0000563d6b2e4039 llvm::SelectionDAGISel::CannotYetSelect(llvm::SDN=
ode*) (clang-24+0x4e3c039)
    #7 0x0000563d6b2eae72 llvm::SelectionDAGISel::SelectCodeCommon(llvm::SD=
Node*, unsigned char const*, unsigned int, unsigned char const*) (clang-24+=
0x4e42e72)
    #8 0x0000563d6b2e2609 llvm::SelectionDAGISel::DoInstructionSelection() =
(clang-24+0x4e3a609)
    #9 0x0000563d6b2f2585 llvm::SelectionDAGISel::CodeGenAndEmitDAG() (clan=
g-24+0x4e4a585)
   #10 0x0000563d6b2f48a0 llvm::SelectionDAGISel::SelectAllBasicBlocks(llvm=
::Function const&) (clang-24+0x4e4c8a0)
   #11 0x0000563d6b2f630d llvm::SelectionDAGISel::runOnMachineFunction(llvm=
::MachineFunction&) (clang-24+0x4e4e30d)
   #12 0x0000563d67f0045a llvm::MipsDAGToDAGISel::runOnMachineFunction(llvm=
::MachineFunction&) (clang-24+0x1a5845a)
   #13 0x0000563d6b2f1819 llvm::SelectionDAGISelLegacy::runOnMachineFunctio=
n(llvm::MachineFunction&) (clang-24+0x4e49819)
   #14 0x0000563d691224f3 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-24+0x2c7a4f3)
   #15 0x0000563d69678bb9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-24+0x31d0bb9)
   #16 0x0000563d69678fec llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-24+0x31d0fec)
   #17 0x0000563d69679b8a (anonymous namespace)::MPPassManager::runOnModule=
(llvm::Module&) LegacyPassManager.cpp:0:0
   #18 0x0000563d6967a25c llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-24+0x31d225c)
   #19 0x0000563d6a120a6f (anonymous namespace)::EmitAssemblyHelper::TimeCo=
degenPasses(llvm::function_ref<void ()>) BackendUtil.cpp:0:0
   #20 0x0000563d6a131d7a (anonymous namespace)::EmitAssemblyHelper::emitAs=
sembly(clang::BackendAction, std::unique_ptr<llvm::raw_pwrite_stream, std::=
default_delete<llvm::raw_pwrite_stream>>, clang::BackendConsumer*) (.constp=
rop.0) BackendUtil.cpp:0:0
   #21 0x0000563d6a131f6f clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-24+0x3c89f6f)
   #22 0x0000563d6a76cec7 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-24+0x42c4ec7)
   #23 0x0000563d6c176fcc clang::ParseAST(clang::Sema&, bool, bool) (clang-=
24+0x5ccefcc)
   #24 0x0000563d6aacd41e clang::FrontendAction::Execute() (clang-24+0x4625=
41e)
   #25 0x0000563d6aa584ee clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-24+0x45b04ee)
   #26 0x0000563d6ab98247 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-24+0x46f0247)
   #27 0x0000563d66d85748 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-24+0x8dd748)
   #28 0x0000563d66d7d413 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #29 0x0000563d66d7d453 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #30 0x0000563d6a7eab09 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #31 0x0000563d69ca2c23 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-24+0x37fac23)
   #32 0x0000563d6a7ec08c clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #33 0x0000563d6a7a4898 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-24+0x42fc898)
   #34 0x0000563d6a7a90d2 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-24+0x43010d2)
   #35 0x0000563d6a7baedc clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-24+0x4312edc)
   #36 0x0000563d66d820d2 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-24+0x8da0d2)
   #37 0x0000563d66c9d279 main (clang-24+0x7f5279)
   #38 0x00007f9a949d2ca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #39 0x00007f9a949d2d65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #40 0x0000563d66d7ce71 _start (clang-24+0x8d4e71)
   clang: error: clang frontend command failed with exit code 70 (use -v to=
 see invocation)


vim +42 arch/mips/include/asm/jump_label.h

935c2dbec4d6d3 Maciej W. Rozycki 2014-11-17  39 =20
11276d5306b8e5 Peter Zijlstra    2015-07-24  40  static __always_inline boo=
l arch_static_branch(struct static_key *key, bool branch)
d430d3d7e646eb Jason Baron       2011-03-16  41  {
4356e9f841f7fb Linus Torvalds    2024-02-09 @42  	asm goto("1:\t" B_INSN " =
2f\n\t"
c838b580ca9dcf Paul Burton       2019-04-05  43  		"2:\t.insn\n\t"
d430d3d7e646eb Jason Baron       2011-03-16  44  		".pushsection __jump_tab=
le,  \"aw\"\n\t"
d430d3d7e646eb Jason Baron       2011-03-16  45  		WORD_INSN " 1b, %l[l_yes=
], %0\n\t"
d430d3d7e646eb Jason Baron       2011-03-16  46  		".popsection\n\t"
11276d5306b8e5 Peter Zijlstra    2015-07-24  47  		: :  "i" (&((char *)key)=
[branch]) : : l_yes);
11276d5306b8e5 Peter Zijlstra    2015-07-24  48 =20
11276d5306b8e5 Peter Zijlstra    2015-07-24  49  	return false;
11276d5306b8e5 Peter Zijlstra    2015-07-24  50  l_yes:
11276d5306b8e5 Peter Zijlstra    2015-07-24  51  	return true;
11276d5306b8e5 Peter Zijlstra    2015-07-24  52  }
11276d5306b8e5 Peter Zijlstra    2015-07-24  53 =20

:::::: The code at line 42 was first introduced by commit
:::::: 4356e9f841f7fbb945521cef3577ba394c65f3fc work around gcc bugs with '=
asm goto' with outputs

:::::: TO: Linus Torvalds <torvalds@linux-foundation.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
