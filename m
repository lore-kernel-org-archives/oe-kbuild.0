Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9EEB3358BD
	for <oe-kbuild@lists.linux.dev>; Wed, 21 Jan 2026 04:37:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768970254; cv=none; b=KMAtdGX4jE4lLRbg431yizHKxQEo2v0IF4fHVCzDC0OZvEV/KvaNs12IaNqm+lZHsKiqArPxWYfaPpJuo9KkNRvBfN4fsdAc2RZyyckI5MU6rFoPNglPwkCR2CjdHqXUwabdwqtImccRcQwiEiONOIbaAGfV8vVQwQPULrp8cJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768970254; c=relaxed/simple;
	bh=1UxzBxYaO99OjQeoB78416EeKBg72XW/Ds0xoMKQcXE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=RbZ6iMYsuUKTRjFWutrZaR9Rqafq3YV/6WtJ00bdqLGcd9uK4uDj7SPG7As+bXorEXev+Ux/Ae3PbMUW9GBtQBUqKqMAmH914AuDobHEPe8pokCXU4ADRFfYCPRnxqG236edpUCcpsuLChNb4CGCuo61dsXVca+QHfNACyDC25s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TsAjEcjO; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TsAjEcjO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768970252; x=1800506252;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=1UxzBxYaO99OjQeoB78416EeKBg72XW/Ds0xoMKQcXE=;
  b=TsAjEcjOIOUzOHJuFnzIlwd3nj3rGv0vPjbvIfQuqRtKsURj8JpxL/vX
   pyGjkQfWn8pxH4Phi2qH6rJLDH0vYjV+PWXAS+vtBuUN+49xAFJRMwa5O
   3oL8/XFpH0Iy6eJWc0NbSBbHFs/PFQLPzpnbTKVjhVJhDwdjSCYVwCOFQ
   uvtaS5yDYt/GK+ggZm6aeqz/FMuWzPY5xjNFYnvDCpx+ZgJxaN5MH13tn
   4bdLGfjFmWa7L5UTnV6uah7JhxyHx6lDUCR1pEGFi4bSfy96nMFM2DqKB
   xTTKx0W8uErqrvwKuN39YTqqcHnDamx+hwGr1bG9wEnKZNruTLs7UOywT
   A==;
X-CSE-ConnectionGUID: PLsLJpFcRq698v1OfTnGpQ==
X-CSE-MsgGUID: X5QXjZUBSjWUGZds89XAaQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11677"; a="80818086"
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="80818086"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jan 2026 20:37:31 -0800
X-CSE-ConnectionGUID: EYLZi+EATrSJeTfx8HrMCg==
X-CSE-MsgGUID: xsmM8JtSQ4q/4JZqltS9VQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,242,1763452800"; 
   d="scan'208";a="210823903"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 20 Jan 2026 20:37:29 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1viPyB-00000000Pxj-0LRK;
	Wed, 21 Jan 2026 04:37:27 +0000
Date: Wed, 21 Jan 2026 12:36:28 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 2003/8302]
 arch/mips/include/asm/jump_label.h:42:11: error: unknown instruction, did you
 mean: b?
Message-ID: <202601211251.gfacfa2w-lkp@intel.com>
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
TO: Roman Gushchin <roman.gushchin@linux.dev>
CC: Alexei Starovoitov <ast@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   053966c344dbd346e71305f530e91ea77916189f
commit: 5c7db3239c9fbe3c62cb0d89b64959ea23af2de9 [2003/8302] mm: introduce =
bpf_get_root_mem_cgroup() BPF kfunc
:::::: branch date: 12 hours ago
:::::: commit date: 4 weeks ago
config: mips-randconfig-r112-20260121 (https://download.01.org/0day-ci/arch=
ive/20260121/202601211251.gfacfa2w-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8=
addffa70cee5b2acc5454712d9cf78ce45710)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260121/202601211251.gfacfa2w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202601211251.gfacfa2w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/bpf_memcontrol.c:8:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:12:
   In file included from include/linux/sched.h:49:
   In file included from include/linux/tracepoint-defs.h:12:
   In file included from include/linux/static_key.h:1:
   In file included from include/linux/jump_label.h:113:
>> arch/mips/include/asm/jump_label.h:42:11: error: unknown instruction, di=
d you mean: b?
      42 |         asm goto("1:\t" B_INSN " 2f\n\t"
         |                  ^
   <inline asm>:1:5: note: instantiated into assembly here
       1 |         1:      b32 2f
         |                 ^
   fatal error: error in backend: Cannot select: 0x56283579cfa0: i32 =3D tr=
uncate 0x56283579cd00
     0x56283579cd00: i64,ch =3D CopyFromReg 0x56283563a150, Register:i64 %16
   In function: bpf_get_mem_cgroup
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace, preprocessed source, and associated run=
 script.
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
er-checks -O2 -fno-stack-protector -pg -fstrict-flex-arrays=3D3 -fms-extens=
ions -fno-strict-overflow -fno-stack-check -fno-builtin-wcslen -Wall -Wextr=
a -Wundef -Werror=3Dimplicit-function-declaration -Werror=3Dimplicit-int -W=
error=3Dreturn-type -Werror=3Dstrict-prototypes -Wno-format-security -Wno-t=
rigraphs -Wno-frame-address -Wno-address-of-packed-member -Wmissing-declara=
tions -Wmissing-prototypes -Wno-gnu -Wno-microsoft-anon-tag -Wno-format-ove=
rflow-non-kprintf -Wno-format-truncation-non-kprintf -Wno-default-const-ini=
t-unsafe -Wno-pointer-sign -Wcast-function-type -Wno-unterminated-string-in=
itialization -Wimplicit-fallthrough -Werror=3Ddate-time -Werror=3Dincompati=
ble-pointer-types -Wenum-conversion -Wunused -Wmissing-format-attribute -Wm=
issing-include-dirs -Wunused-const-variable -Wno-missing-field-initializers=
 -Wno-type-limits -Wno-shift-negative-value -Wno-enum-enum-conversion -Wno-=
sign-compare -Wno-unused-parameter -g -gz=3Dzlib -DRANDSTRUCT -frandomize-l=
ayout-seed-file=3D./scripts/basic/randstruct.seed -fno-crash-diagnostics -W=
no-error=3Dreturn-type -Wreturn-type -funsigned-char -Wundef -falign-functi=
ons=3D64 -Imm -Imm -DKBUILD_MODFILE=3D\"mm/bpf_memcontrol\" -DKBUILD_BASENA=
ME=3D\"bpf_memcontrol\" -DKBUILD_MODNAME=3D\"bpf_memcontrol\" -D__KBUILD_MO=
DNAME=3Dbpf_memcontrol -c -o mm/bpf_memcontrol.o mm/bpf_memcontrol.c
   1.	<eof> parser at end of file
   2.	Code generation
   3.	Running pass 'Function Pass Manager' on module 'mm/bpf_memcontrol.c'.
   4.	Running pass 'MIPS DAG->DAG Pattern Instruction Selection' on functio=
n '@bpf_get_mem_cgroup'
    #0 0x000056282b80faab llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (clang-22+0x3fcfaab)
    #1 0x000056282b80d654 llvm::sys::CleanupOnSignal(unsigned long) (clang-=
22+0x3fcd654)
    #2 0x000056282b749332 llvm::CrashRecoveryContext::HandleExit(int) (clan=
g-22+0x3f09332)
    #3 0x000056282b8048ce llvm::sys::Process::Exit(int, bool) (clang-22+0x3=
fc48ce)
    #4 0x0000562828751467 LLVMErrorHandler(void*, char const*, bool) cc1_ma=
in.cpp:0:0
    #5 0x000056282b75317c llvm::report_fatal_error(llvm::Twine const&, bool=
) (clang-22+0x3f1317c)
    #6 0x000056282cc8c89d llvm::SelectionDAGISel::CannotYetSelect(llvm::SDN=
ode*) (clang-22+0x544c89d)
    #7 0x000056282cc8f8da llvm::SelectionDAGISel::SelectCodeCommon(llvm::SD=
Node*, unsigned char const*, unsigned int) (clang-22+0x544f8da)
    #8 0x000056282cc881b9 llvm::SelectionDAGISel::DoInstructionSelection() =
(clang-22+0x54481b9)
    #9 0x000056282cc955b5 llvm::SelectionDAGISel::CodeGenAndEmitDAG() (clan=
g-22+0x54555b5)
   #10 0x000056282cc980a7 llvm::SelectionDAGISel::SelectAllBasicBlocks(llvm=
::Function const&) (clang-22+0x54580a7)
   #11 0x000056282cc9a312 llvm::SelectionDAGISel::runOnMachineFunction(llvm=
::MachineFunction&) (clang-22+0x545a312)
   #12 0x000056282989d0ca llvm::MipsDAGToDAGISel::runOnMachineFunction(llvm=
::MachineFunction&) (clang-22+0x205d0ca)
   #13 0x000056282cc87d59 llvm::SelectionDAGISelLegacy::runOnMachineFunctio=
n(llvm::MachineFunction&) (clang-22+0x5447d59)
   #14 0x000056282ab3bb48 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (clang-22+0x32fbb48)
   #15 0x000056282b10b499 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (clang-22+0x38cb499)
   #16 0x000056282b10b63c llvm::FPPassManager::runOnModule(llvm::Module&) (=
clang-22+0x38cb63c)
   #17 0x000056282b10a912 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (clang-22+0x38ca912)
   #18 0x000056282bacb654 clang::emitBackendOutput(clang::CompilerInstance&=
, clang::CodeGenOptions&, llvm::StringRef, llvm::Module*, clang::BackendAct=
ion, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem>, std::unique_ptr<llvm:=
:raw_pwrite_stream, std::default_delete<llvm::raw_pwrite_stream>>, clang::B=
ackendConsumer*) (clang-22+0x428b654)
   #19 0x000056282c0fbc97 clang::BackendConsumer::HandleTranslationUnit(cla=
ng::ASTContext&) (clang-22+0x48bbc97)
   #20 0x000056282db22e1c clang::ParseAST(clang::Sema&, bool, bool) (clang-=
22+0x62e2e1c)
   #21 0x000056282c43423a clang::FrontendAction::Execute() (clang-22+0x4bf4=
23a)
   #22 0x000056282c3b1096 clang::CompilerInstance::ExecuteAction(clang::Fro=
ntendAction&) (clang-22+0x4b71096)
   #23 0x000056282c516ac7 clang::ExecuteCompilerInvocation(clang::CompilerI=
nstance*) (clang-22+0x4cd6ac7)
   #24 0x0000562828753aa5 cc1_main(llvm::ArrayRef<char const*>, char const*=
, void*) (clang-22+0xf13aa5)
   #25 0x000056282874b803 ExecuteCC1Tool(llvm::SmallVectorImpl<char const*>=
&, llvm::ToolContext const&, llvm::IntrusiveRefCntPtr<llvm::vfs::FileSystem=
>) driver.cpp:0:0
   #26 0x000056282874b843 int llvm::function_ref<int (llvm::SmallVectorImpl=
<char const*>&)>::callback_fn<clang_main(int, char**, llvm::ToolContext con=
st&)::'lambda'(llvm::SmallVectorImpl<char const*>&)>(long, llvm::SmallVecto=
rImpl<char const*>&) driver.cpp:0:0
   #27 0x000056282c178759 void llvm::function_ref<void ()>::callback_fn<cla=
ng::driver::CC1Command::Execute(llvm::ArrayRef<std::optional<llvm::StringRe=
f>>, std::__cxx11::basic_string<char, std::char_traits<char>, std::allocato=
r<char>>*, bool*) const::'lambda'()>(long) Job.cpp:0:0
   #28 0x000056282b749243 llvm::CrashRecoveryContext::RunSafely(llvm::funct=
ion_ref<void ()>) (clang-22+0x3f09243)
   #29 0x000056282c178e84 clang::driver::CC1Command::Execute(llvm::ArrayRef=
<std::optional<llvm::StringRef>>, std::__cxx11::basic_string<char, std::cha=
r_traits<char>, std::allocator<char>>*, bool*) const (.part.0) Job.cpp:0:0
   #30 0x000056282c139828 clang::driver::Compilation::ExecuteCommand(clang:=
:driver::Command const&, clang::driver::Command const*&, bool) const (clang=
-22+0x48f9828)
   #31 0x000056282c13a782 clang::driver::Compilation::ExecuteJobs(clang::dr=
iver::JobList const&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&, bool) const (clang-22+0x48fa782)
   #32 0x000056282c14ae2c clang::driver::Driver::ExecuteCompilation(clang::=
driver::Compilation&, llvm::SmallVectorImpl<std::pair<int, clang::driver::C=
ommand const*>>&) (clang-22+0x490ae2c)
   #33 0x0000562828750483 clang_main(int, char**, llvm::ToolContext const&)=
 (clang-22+0xf10483)
   #34 0x00005628285eec43 main (clang-22+0xdaec43)
   #35 0x00007fda2693fca8 (/lib/x86_64-linux-gnu/libc.so.6+0x29ca8)
   #36 0x00007fda2693fd65 __libc_start_main (/lib/x86_64-linux-gnu/libc.so.=
6+0x29d65)
   #37 0x000056282874b241 _start (clang-22+0xf0b241)
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

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
