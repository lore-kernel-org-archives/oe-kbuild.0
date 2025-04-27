Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62E524A35
	for <oe-kbuild@lists.linux.dev>; Sun, 27 Apr 2025 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745766598; cv=none; b=RxjVlAWxRVDAf4+4URRMMGwK8uRloDbrfE5rCvDlfrcQpzNQVuY19m5sunkAJiQuhPVq9bhMn3hA6R5eHEB0/UMtq9+AHUhN0D7Hvy9fmd9PevtwAj9JEgdwr6e3U7ABwtUfvm+iDFVsXd5ZHySF+jhgQN1sWZHFWszzP7j4YTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745766598; c=relaxed/simple;
	bh=pgk5ZIV+4Fia87HOg1lWcMnlmnPQEvKaEdEeLHK39Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cCEjrsLqo2vqyi2z8kjKnP9i1+1J/PW6JBxGod5YI1iPBTuZL+mIdkne37SwK42p+oHzEu0W5Irv7KOJKRMs6pVvt1tFpEE34OA02M50aAaz9fAAl6T/vxDKyMzJv7uWdWIF4vfXN0XddzfN53JhQv63OiZGbRwliN3kyOeioz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4HY6sas; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4HY6sas"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745766594; x=1777302594;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pgk5ZIV+4Fia87HOg1lWcMnlmnPQEvKaEdEeLHK39Ig=;
  b=B4HY6sasgmnQn1wo8Ic/HN+SRE05UY+TnJAtHI4es16GZsBXffivpYVx
   C1cZSUKIAWHgQc/y6Ht2po1ufHpMuVuvINoaZLBnQXRxOiCYnVkbWzUu3
   meJDo4acyX4YjEpT74jcD0Rnf+DLew+8aPjif4ic/m+8wXZoAOqphpRac
   AVAXi6DeyE8qNj7jFO5fjm0FWHUvlf6eoMbHk35vLmIVH1GRRsBHi89bU
   obVla/m+IjyE3kpg4gtrclFm9wvLjyRPAjYNkR81DL25j+MfMx/+o+AfM
   hR+2VkTnJb4JfRSIsRICriYFZO98W+1G1Z5RqlDtybd+Eta7Fi1zNOFgd
   A==;
X-CSE-ConnectionGUID: pw7nGAHLSMu29LzMgRykMw==
X-CSE-MsgGUID: vr1pCHcnQz29hVmlfi8ZUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11416"; a="34977659"
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="34977659"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2025 08:09:54 -0700
X-CSE-ConnectionGUID: Gn+4bIotRMmiLA65Jl28lA==
X-CSE-MsgGUID: eUjbf3qATVW77cijAVGFGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,244,1739865600"; 
   d="scan'208";a="133616335"
Received: from lkp-server01.sh.intel.com (HELO 050dd05385d1) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 27 Apr 2025 08:09:52 -0700
Received: from kbuild by 050dd05385d1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u93de-0006Lp-07;
	Sun, 27 Apr 2025 15:09:50 +0000
Date: Sun, 27 Apr 2025 23:09:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH] kbuild: distributed build support for Clang ThinLTO
Message-ID: <202504272258.B50WCW9W-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20250420010214.1963979-1-xur@google.com>
References: <20250420010214.1963979-1-xur@google.com>
TO: xur@google.com
TO: Masahiro Yamada <masahiroy@kernel.org>
TO: Nathan Chancellor <nathan@kernel.org>
TO: Nicolas Schier <nicolas.schier@linux.dev>
TO: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
TO: Bill Wendling <morbo@google.com>
TO: Justin Stitt <justinstitt@google.com>
TO: Miguel Ojeda <ojeda@kernel.org>
TO: Thomas Gleixner <tglx@linutronix.de>
TO: Alice Ryhl <aliceryhl@google.com>
TO: Sami Tolvanen <samitolvanen@google.com>
TO: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
TO: Rafael Aquini <aquini@redhat.com>
TO: Michael Ellerman <mpe@ellerman.id.au>
TO: Stafford Horne <shorne@gmail.com>
TO: Christophe Leroy <christophe.leroy@csgroup.eu>
TO: Rong Xu <xur@google.com>
TO: Teresa Johnson <tejohnson@google.com>
CC: linux-kernel@vger.kernel.org
CC: linux-kbuild@vger.kernel.org
CC: llvm@lists.linux.dev

Hi,

kernel test robot noticed the following build errors:

[auto build test ERROR on masahiroy-kbuild/for-next]
[also build test ERROR on masahiroy-kbuild/fixes linus/master v6.15-rc3 nex=
t-20250424]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/xur-google-com/kbuil=
d-distributed-build-support-for-Clang-ThinLTO/20250420-090244
base:   https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbu=
ild.git for-next
patch link:    https://lore.kernel.org/r/20250420010214.1963979-1-xur%40goo=
gle.com
patch subject: [PATCH] kbuild: distributed build support for Clang ThinLTO
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: um-randconfig-r071-20250427 (https://download.01.org/0day-ci/archiv=
e/20250427/202504272258.B50WCW9W-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20250427/202504272258.B50WCW9W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202504272258.B50WCW9W-lkp@intel.com/

All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace.
   Stack dump:
   0.	Running pass 'Function Pass Manager' on module 'net/vmw_vsock/virtio_=
transport_common.o'.
   1.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@virtio_transport_reset_no_sock'
    #0 0x000056084a6f2f8b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (lld+0x7dbf8b)
    #1 0x000056084a6f091b SignalHandler(int) Signals.cpp:0:0
    #2 0x00007f21dd500050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
    #3 0x000056084caddbf2 (anonymous namespace)::PEI::runOnMachineFunction(=
llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #4 0x000056084c9c2f15 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
    #5 0x000056084e24b8b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (lld+0x43348b9)
    #6 0x000056084e24b9ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
lld+0x43349ec)
    #7 0x000056084e24c318 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (lld+0x4335318)
    #8 0x000056084c77f27c codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
    #9 0x000056084c78078a llvm::lto::thinBackend(llvm::lto::Config const&, =
unsigned int, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFile=
Stream, std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::=
Twine const&)>, llvm::Module&, llvm::ModuleSummaryIndex const&, llvm::Strin=
gMap<std::unordered_set<unsigned long, std::hash<unsigned long>, std::equal=
_to<unsigned long>, std::allocator<unsigned long>>, llvm::MallocAllocator> =
const&, llvm::DenseMap<unsigned long, llvm::GlobalValueSummary*, llvm::Dens=
eMapInfo<unsigned long, void>, llvm::detail::DenseMapPair<unsigned long, ll=
vm::GlobalValueSummary*>> const&, llvm::MapVector<llvm::StringRef, llvm::Bi=
tcodeModule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapIn=
fo<llvm::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsi=
gned int>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModul=
e>, 0u>>*, std::vector<unsigned char, std::allocator<unsigned char>> const&=
) (lld+0x286978a)
   #10 0x000056084c770d2d std::_Function_handler<void (), std::_Bind<(anony=
mous namespace)::InProcessThinBackend::start(unsigned int, llvm::BitcodeMod=
ule, llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsigned l=
ong>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, llvm::M=
allocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::DenseMapInfo<=
llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::GlobalValue::=
LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<unsigned l=
ong const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::MapVector<llvm:=
:StringRef, llvm::BitcodeModule, llvm::DenseMap<llvm::StringRef, unsigned i=
nt, llvm::DenseMapInfo<llvm::StringRef, void>, llvm::detail::DenseMapPair<l=
lvm::StringRef, unsigned int>>, llvm::SmallVector<std::pair<llvm::StringRef=
, llvm::BitcodeModule>, 0u>>&)::'lambda'(llvm::BitcodeModule, llvm::ModuleS=
ummaryIndex&, llvm::StringMap<std::unordered_set<unsigned long, std::hash<u=
nsigned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>=
, llvm::MallocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::Dens=
eMapInfo<llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::Glob=
alValue::LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<u=
nsigned long const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::DenseM=
ap<unsigned long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned lo=
ng, void>, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSumma=
ry*>> const&, llvm::MapVector<llvm::StringRef, llvm::BitcodeModule, llvm::D=
enseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llvm::StringRef, =
void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned int>>, llvm::Sm=
allVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u>>&) (llvm::Bi=
tcodeModule, std::reference_wrapper<llvm::ModuleSummaryIndex>, std::referen=
ce_wrapper<llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsi=
gned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, l=
lvm::MallocAllocator> const>, std::reference_wrapper<llvm::DenseSet<llvm::V=
alueInfo, llvm::DenseMapInfo<llvm::ValueInfo, void>> const>, std::reference=
_wrapper<std::map<unsigned long, llvm::GlobalValue::LinkageTypes, std::less=
<unsigned long>, std::allocator<std::pair<unsigned long const, llvm::Global=
Value::LinkageTypes>>> const>, std::reference_wrapper<llvm::DenseMap<unsign=
ed long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned long, void>=
, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSummary*>> con=
st>, std::reference_wrapper<llvm::MapVector<llvm::StringRef, llvm::BitcodeM=
odule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llv=
m::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned i=
nt>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u=
>>>)>>::_M_invoke(std::_Any_data const&) LTO.cpp:0:0
   #11 0x000056084aa7a32b std::_Function_handler<void (), llvm::ThreadPool:=
:createTaskAndFuture(std::function<void ()>)::'lambda'()>::_M_invoke(std::_=
Any_data const&) (lld+0xb6332b)
   #12 0x000056084e3a4a9b llvm::ThreadPool::processTasks(llvm::ThreadPoolTa=
skGroup*) (lld+0x448da9b)
   #13 0x000056084e3a53cc void* llvm::thread::ThreadProxy<std::tuple<llvm::=
ThreadPool::grow(int)::'lambda'()>>(void*) ThreadPool.cpp:0:0
   #14 0x00007f21dd54d1c4 (/lib/x86_64-linux-gnu/libc.so.6+0x891c4)
   #15 0x00007f21dd5ccac0 clone (/lib/x86_64-linux-gnu/libc.so.6+0x108ac0)
>> /bin/bash: line 1: 3165322 Segmentation fault      ld.lld -m elf_x86_64 =
-mllvm -import-instr-limit=3D5 --compress-debug-sections=3Dzlib -z noexecst=
ack -r -o net/vmw_vsock/vmw_vsock_virtio_transport_common.o @net/vmw_vsock/=
vmw_vsock_virtio_transport_common.mod
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace.
   Stack dump:
   0.	Running pass 'Function Pass Manager' on module 'drivers/media/dvb-fro=
ntends/mt352.o'.
   1.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@mt352_init'
    #0 0x000055d8592e2f8b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (lld+0x7dbf8b)
    #1 0x000055d8592e091b SignalHandler(int) Signals.cpp:0:0
    #2 0x00007fa5bca01050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
    #3 0x000055d85b6cdbf2 (anonymous namespace)::PEI::runOnMachineFunction(=
llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #4 0x000055d85b5b2f15 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
    #5 0x000055d85ce3b8b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (lld+0x43348b9)
    #6 0x000055d85ce3b9ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
lld+0x43349ec)
    #7 0x000055d85ce3c318 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (lld+0x4335318)
    #8 0x000055d85b36f27c codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
    #9 0x000055d85b37078a llvm::lto::thinBackend(llvm::lto::Config const&, =
unsigned int, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFile=
Stream, std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::=
Twine const&)>, llvm::Module&, llvm::ModuleSummaryIndex const&, llvm::Strin=
gMap<std::unordered_set<unsigned long, std::hash<unsigned long>, std::equal=
_to<unsigned long>, std::allocator<unsigned long>>, llvm::MallocAllocator> =
const&, llvm::DenseMap<unsigned long, llvm::GlobalValueSummary*, llvm::Dens=
eMapInfo<unsigned long, void>, llvm::detail::DenseMapPair<unsigned long, ll=
vm::GlobalValueSummary*>> const&, llvm::MapVector<llvm::StringRef, llvm::Bi=
tcodeModule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapIn=
fo<llvm::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsi=
gned int>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModul=
e>, 0u>>*, std::vector<unsigned char, std::allocator<unsigned char>> const&=
) (lld+0x286978a)
   #10 0x000055d85b360d2d std::_Function_handler<void (), std::_Bind<(anony=
mous namespace)::InProcessThinBackend::start(unsigned int, llvm::BitcodeMod=
ule, llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsigned l=
ong>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, llvm::M=
allocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::DenseMapInfo<=
llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::GlobalValue::=
LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<unsigned l=
ong const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::MapVector<llvm:=
:StringRef, llvm::BitcodeModule, llvm::DenseMap<llvm::StringRef, unsigned i=
nt, llvm::DenseMapInfo<llvm::StringRef, void>, llvm::detail::DenseMapPair<l=
lvm::StringRef, unsigned int>>, llvm::SmallVector<std::pair<llvm::StringRef=
, llvm::BitcodeModule>, 0u>>&)::'lambda'(llvm::BitcodeModule, llvm::ModuleS=
ummaryIndex&, llvm::StringMap<std::unordered_set<unsigned long, std::hash<u=
nsigned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>=
, llvm::MallocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::Dens=
eMapInfo<llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::Glob=
alValue::LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<u=
nsigned long const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::DenseM=
ap<unsigned long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned lo=
ng, void>, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSumma=
ry*>> const&, llvm::MapVector<llvm::StringRef, llvm::BitcodeModule, llvm::D=
enseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llvm::StringRef, =
void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned int>>, llvm::Sm=
allVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u>>&) (llvm::Bi=
tcodeModule, std::reference_wrapper<llvm::ModuleSummaryIndex>, std::referen=
ce_wrapper<llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsi=
gned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, l=
lvm::MallocAllocator> const>, std::reference_wrapper<llvm::DenseSet<llvm::V=
alueInfo, llvm::DenseMapInfo<llvm::ValueInfo, void>> const>, std::reference=
_wrapper<std::map<unsigned long, llvm::GlobalValue::LinkageTypes, std::less=
<unsigned long>, std::allocator<std::pair<unsigned long const, llvm::Global=
Value::LinkageTypes>>> const>, std::reference_wrapper<llvm::DenseMap<unsign=
ed long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned long, void>=
, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSummary*>> con=
st>, std::reference_wrapper<llvm::MapVector<llvm::StringRef, llvm::BitcodeM=
odule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llv=
m::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned i=
nt>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u=
>>>)>>::_M_invoke(std::_Any_data const&) LTO.cpp:0:0
   #11 0x000055d85966a32b std::_Function_handler<void (), llvm::ThreadPool:=
:createTaskAndFuture(std::function<void ()>)::'lambda'()>::_M_invoke(std::_=
Any_data const&) (lld+0xb6332b)
   #12 0x000055d85cf94a9b llvm::ThreadPool::processTasks(llvm::ThreadPoolTa=
skGroup*) (lld+0x448da9b)
   #13 0x000055d85cf953cc void* llvm::thread::ThreadProxy<std::tuple<llvm::=
ThreadPool::grow(int)::'lambda'()>>(void*) ThreadPool.cpp:0:0
   #14 0x00007fa5bca4e1c4 (/lib/x86_64-linux-gnu/libc.so.6+0x891c4)
   #15 0x00007fa5bcacdac0 clone (/lib/x86_64-linux-gnu/libc.so.6+0x108ac0)
>> /bin/bash: line 1: 3197906 Segmentation fault      ld.lld -m elf_x86_64 =
-mllvm -import-instr-limit=3D5 --compress-debug-sections=3Dzlib -z noexecst=
ack -r -o drivers/media/dvb-frontends/.tmp_mt352.o drivers/media/dvb-fronte=
nds/mt352.o
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace.
   Stack dump:
   0.	Running pass 'Function Pass Manager' on module 'drivers/net/wireless/=
ti/wlcore/event.o'.
   1.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@wl1271_event_handle'
    #0 0x00005642fb777f8b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (lld+0x7dbf8b)
    #1 0x00005642fb77591b SignalHandler(int) Signals.cpp:0:0
    #2 0x00007fa0935cd050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
    #3 0x00005642fdb62bf2 (anonymous namespace)::PEI::runOnMachineFunction(=
llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #4 0x00005642fda47f15 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
    #5 0x00005642ff2d08b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (lld+0x43348b9)
    #6 0x00005642ff2d09ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
lld+0x43349ec)
    #7 0x00005642ff2d1318 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (lld+0x4335318)
    #8 0x00005642fd80427c codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
    #9 0x00005642fd80578a llvm::lto::thinBackend(llvm::lto::Config const&, =
unsigned int, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFile=
Stream, std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::=
Twine const&)>, llvm::Module&, llvm::ModuleSummaryIndex const&, llvm::Strin=
gMap<std::unordered_set<unsigned long, std::hash<unsigned long>, std::equal=
_to<unsigned long>, std::allocator<unsigned long>>, llvm::MallocAllocator> =
const&, llvm::DenseMap<unsigned long, llvm::GlobalValueSummary*, llvm::Dens=
eMapInfo<unsigned long, void>, llvm::detail::DenseMapPair<unsigned long, ll=
vm::GlobalValueSummary*>> const&, llvm::MapVector<llvm::StringRef, llvm::Bi=
tcodeModule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapIn=
fo<llvm::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsi=
gned int>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModul=
e>, 0u>>*, std::vector<unsigned char, std::allocator<unsigned char>> const&=
) (lld+0x286978a)
   #10 0x00005642fd7f5d2d std::_Function_handler<void (), std::_Bind<(anony=
mous namespace)::InProcessThinBackend::start(unsigned int, llvm::BitcodeMod=
ule, llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsigned l=
ong>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, llvm::M=
allocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::DenseMapInfo<=
llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::GlobalValue::=
LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<unsigned l=
ong const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::MapVector<llvm:=
:StringRef, llvm::BitcodeModule, llvm::DenseMap<llvm::StringRef, unsigned i=
nt, llvm::DenseMapInfo<llvm::StringRef, void>, llvm::detail::DenseMapPair<l=
lvm::StringRef, unsigned int>>, llvm::SmallVector<std::pair<llvm::StringRef=
, llvm::BitcodeModule>, 0u>>&)::'lambda'(llvm::BitcodeModule, llvm::ModuleS=
ummaryIndex&, llvm::StringMap<std::unordered_set<unsigned long, std::hash<u=
nsigned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>=
, llvm::MallocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::Dens=
eMapInfo<llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::Glob=
alValue::LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<u=
nsigned long const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::DenseM=
ap<unsigned long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned lo=
ng, void>, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSumma=
ry*>> const&, llvm::MapVector<llvm::StringRef, llvm::BitcodeModule, llvm::D=
enseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llvm::StringRef, =
void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned int>>, llvm::Sm=
allVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u>>&) (llvm::Bi=
tcodeModule, std::reference_wrapper<llvm::ModuleSummaryIndex>, std::referen=
ce_wrapper<llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsi=
gned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, l=
lvm::MallocAllocator> const>, std::reference_wrapper<llvm::DenseSet<llvm::V=
alueInfo, llvm::DenseMapInfo<llvm::ValueInfo, void>> const>, std::reference=
_wrapper<std::map<unsigned long, llvm::GlobalValue::LinkageTypes, std::less=
<unsigned long>, std::allocator<std::pair<unsigned long const, llvm::Global=
Value::LinkageTypes>>> const>, std::reference_wrapper<llvm::DenseMap<unsign=
ed long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned long, void>=
, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSummary*>> con=
st>, std::reference_wrapper<llvm::MapVector<llvm::StringRef, llvm::BitcodeM=
odule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llv=
m::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned i=
nt>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u=
>>>)>>::_M_invoke(std::_Any_data const&) LTO.cpp:0:0
   #11 0x00005642fbaff32b std::_Function_handler<void (), llvm::ThreadPool:=
:createTaskAndFuture(std::function<void ()>)::'lambda'()>::_M_invoke(std::_=
Any_data const&) (lld+0xb6332b)
   #12 0x00005642ff429a9b llvm::ThreadPool::processTasks(llvm::ThreadPoolTa=
skGroup*) (lld+0x448da9b)
   #13 0x00005642ff42a3cc void* llvm::thread::ThreadProxy<std::tuple<llvm::=
ThreadPool::grow(int)::'lambda'()>>(void*) ThreadPool.cpp:0:0
   #14 0x00007fa09361a1c4 (/lib/x86_64-linux-gnu/libc.so.6+0x891c4)
   #15 0x00007fa093699ac0 clone (/lib/x86_64-linux-gnu/libc.so.6+0x108ac0)
>> /bin/bash: line 1: 3184204 Segmentation fault      ld.lld -m elf_x86_64 =
-mllvm -import-instr-limit=3D5 --compress-debug-sections=3Dzlib -z noexecst=
ack -r -o drivers/net/wireless/ti/wlcore/wlcore.o @drivers/net/wireless/ti/=
wlcore/wlcore.mod
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace.
   Stack dump:
   0.	Running pass 'Function Pass Manager' on module 'drivers/net/wireless/=
virtual/mac80211_hwsim.o'.
   1.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@remove_vqs'
    #0 0x000055ee073b2f8b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (lld+0x7dbf8b)
    #1 0x000055ee073b091b SignalHandler(int) Signals.cpp:0:0
    #2 0x00007f74b5dbe050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
    #3 0x000055ee0979dbf2 (anonymous namespace)::PEI::runOnMachineFunction(=
llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #4 0x000055ee09682f15 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
    #5 0x000055ee0af0b8b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (lld+0x43348b9)
    #6 0x000055ee0af0b9ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
lld+0x43349ec)
    #7 0x000055ee0af0c318 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (lld+0x4335318)
    #8 0x000055ee0943f27c codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
    #9 0x000055ee0944078a llvm::lto::thinBackend(llvm::lto::Config const&, =
unsigned int, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFile=
Stream, std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::=
Twine const&)>, llvm::Module&, llvm::ModuleSummaryIndex const&, llvm::Strin=
gMap<std::unordered_set<unsigned long, std::hash<unsigned long>, std::equal=
_to<unsigned long>, std::allocator<unsigned long>>, llvm::MallocAllocator> =
const&, llvm::DenseMap<unsigned long, llvm::GlobalValueSummary*, llvm::Dens=
eMapInfo<unsigned long, void>, llvm::detail::DenseMapPair<unsigned long, ll=
vm::GlobalValueSummary*>> const&, llvm::MapVector<llvm::StringRef, llvm::Bi=
tcodeModule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapIn=
fo<llvm::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsi=
gned int>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModul=
e>, 0u>>*, std::vector<unsigned char, std::allocator<unsigned char>> const&=
) (lld+0x286978a)
   #10 0x000055ee09430d2d std::_Function_handler<void (), std::_Bind<(anony=
mous namespace)::InProcessThinBackend::start(unsigned int, llvm::BitcodeMod=
ule, llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsigned l=
ong>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, llvm::M=
allocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::DenseMapInfo<=
llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::GlobalValue::=
LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<unsigned l=
ong const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::MapVector<llvm:=
:StringRef, llvm::BitcodeModule, llvm::DenseMap<llvm::StringRef, unsigned i=
nt, llvm::DenseMapInfo<llvm::StringRef, void>, llvm::detail::DenseMapPair<l=
lvm::StringRef, unsigned int>>, llvm::SmallVector<std::pair<llvm::StringRef=
, llvm::BitcodeModule>, 0u>>&)::'lambda'(llvm::BitcodeModule, llvm::ModuleS=
ummaryIndex&, llvm::StringMap<std::unordered_set<unsigned long, std::hash<u=
nsigned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>=
, llvm::MallocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::Dens=
eMapInfo<llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::Glob=
alValue::LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<u=
nsigned long const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::DenseM=
ap<unsigned long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned lo=
ng, void>, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSumma=
ry*>> const&, llvm::MapVector<llvm::StringRef, llvm::BitcodeModule, llvm::D=
enseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llvm::StringRef, =
void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned int>>, llvm::Sm=
allVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u>>&) (llvm::Bi=
tcodeModule, std::reference_wrapper<llvm::ModuleSummaryIndex>, std::referen=
ce_wrapper<llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsi=
gned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, l=
lvm::MallocAllocator> const>, std::reference_wrapper<llvm::DenseSet<llvm::V=
alueInfo, llvm::DenseMapInfo<llvm::ValueInfo, void>> const>, std::reference=
_wrapper<std::map<unsigned long, llvm::GlobalValue::LinkageTypes, std::less=
<unsigned long>, std::allocator<std::pair<unsigned long const, llvm::Global=
Value::LinkageTypes>>> const>, std::reference_wrapper<llvm::DenseMap<unsign=
ed long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned long, void>=
, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSummary*>> con=
st>, std::reference_wrapper<llvm::MapVector<llvm::StringRef, llvm::BitcodeM=
odule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llv=
m::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned i=
nt>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u=
>>>)>>::_M_invoke(std::_Any_data const&) LTO.cpp:0:0
   #11 0x000055ee0773a32b std::_Function_handler<void (), llvm::ThreadPool:=
:createTaskAndFuture(std::function<void ()>)::'lambda'()>::_M_invoke(std::_=
Any_data const&) (lld+0xb6332b)
   #12 0x000055ee0b064a9b llvm::ThreadPool::processTasks(llvm::ThreadPoolTa=
skGroup*) (lld+0x448da9b)
   #13 0x000055ee0b0653cc void* llvm::thread::ThreadProxy<std::tuple<llvm::=
ThreadPool::grow(int)::'lambda'()>>(void*) ThreadPool.cpp:0:0
   #14 0x00007f74b5e0b1c4 (/lib/x86_64-linux-gnu/libc.so.6+0x891c4)
   #15 0x00007f74b5e8aac0 clone (/lib/x86_64-linux-gnu/libc.so.6+0x108ac0)
>> /bin/bash: line 1: 3178217 Segmentation fault      ld.lld -m elf_x86_64 =
-mllvm -import-instr-limit=3D5 --compress-debug-sections=3Dzlib -z noexecst=
ack -r -o drivers/net/wireless/virtual/.tmp_mac80211_hwsim.o drivers/net/wi=
reless/virtual/mac80211_hwsim.o
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace.
   Stack dump:
   0.	Running pass 'Function Pass Manager' on module 'drivers/net/wireless/=
ti/wl18xx/main.o'.
   1.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@wl18xx_plt_init'
    #0 0x000055865d410f8b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (lld+0x7dbf8b)
    #1 0x000055865d40e91b SignalHandler(int) Signals.cpp:0:0
    #2 0x00007f23bd0cd050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
    #3 0x000055865f7fbbf2 (anonymous namespace)::PEI::runOnMachineFunction(=
llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #4 0x000055865f6e0f15 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
    #5 0x0000558660f698b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (lld+0x43348b9)
    #6 0x0000558660f699ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
lld+0x43349ec)
    #7 0x0000558660f6a318 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (lld+0x4335318)
    #8 0x000055865f49d27c codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
    #9 0x000055865f49e78a llvm::lto::thinBackend(llvm::lto::Config const&, =
unsigned int, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFile=
Stream, std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::=
Twine const&)>, llvm::Module&, llvm::ModuleSummaryIndex const&, llvm::Strin=
gMap<std::unordered_set<unsigned long, std::hash<unsigned long>, std::equal=
_to<unsigned long>, std::allocator<unsigned long>>, llvm::MallocAllocator> =
const&, llvm::DenseMap<unsigned long, llvm::GlobalValueSummary*, llvm::Dens=
eMapInfo<unsigned long, void>, llvm::detail::DenseMapPair<unsigned long, ll=
vm::GlobalValueSummary*>> const&, llvm::MapVector<llvm::StringRef, llvm::Bi=
tcodeModule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapIn=
fo<llvm::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsi=
gned int>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModul=
e>, 0u>>*, std::vector<unsigned char, std::allocator<unsigned char>> const&=
) (lld+0x286978a)
   #10 0x000055865f48ed2d std::_Function_handler<void (), std::_Bind<(anony=
mous namespace)::InProcessThinBackend::start(unsigned int, llvm::BitcodeMod=
ule, llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsigned l=
ong>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, llvm::M=
allocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::DenseMapInfo<=
llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::GlobalValue::=
LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<unsigned l=
ong const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::MapVector<llvm:=
:StringRef, llvm::BitcodeModule, llvm::DenseMap<llvm::StringRef, unsigned i=
nt, llvm::DenseMapInfo<llvm::StringRef, void>, llvm::detail::DenseMapPair<l=
lvm::StringRef, unsigned int>>, llvm::SmallVector<std::pair<llvm::StringRef=
, llvm::BitcodeModule>, 0u>>&)::'lambda'(llvm::BitcodeModule, llvm::ModuleS=
ummaryIndex&, llvm::StringMap<std::unordered_set<unsigned long, std::hash<u=
nsigned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>=
, llvm::MallocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::Dens=
eMapInfo<llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::Glob=
alValue::LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<u=
nsigned long const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::DenseM=
ap<unsigned long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned lo=
ng, void>, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSumma=
ry*>> const&, llvm::MapVector<llvm::StringRef, llvm::BitcodeModule, llvm::D=
enseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llvm::StringRef, =
void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned int>>, llvm::Sm=
allVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u>>&) (llvm::Bi=
tcodeModule, std::reference_wrapper<llvm::ModuleSummaryIndex>, std::referen=
ce_wrapper<llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsi=
gned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, l=
lvm::MallocAllocator> const>, std::reference_wrapper<llvm::DenseSet<llvm::V=
alueInfo, llvm::DenseMapInfo<llvm::ValueInfo, void>> const>, std::reference=
_wrapper<std::map<unsigned long, llvm::GlobalValue::LinkageTypes, std::less=
<unsigned long>, std::allocator<std::pair<unsigned long const, llvm::Global=
Value::LinkageTypes>>> const>, std::reference_wrapper<llvm::DenseMap<unsign=
ed long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned long, void>=
, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSummary*>> con=
st>, std::reference_wrapper<llvm::MapVector<llvm::StringRef, llvm::BitcodeM=
odule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llv=
m::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned i=
nt>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u=
>>>)>>::_M_invoke(std::_Any_data const&) LTO.cpp:0:0
   #11 0x000055865d79832b std::_Function_handler<void (), llvm::ThreadPool:=
:createTaskAndFuture(std::function<void ()>)::'lambda'()>::_M_invoke(std::_=
Any_data const&) (lld+0xb6332b)
   #12 0x00005586610c2a9b llvm::ThreadPool::processTasks(llvm::ThreadPoolTa=
skGroup*) (lld+0x448da9b)
   #13 0x00005586610c33cc void* llvm::thread::ThreadProxy<std::tuple<llvm::=
ThreadPool::grow(int)::'lambda'()>>(void*) ThreadPool.cpp:0:0
   #14 0x00007f23bd11a1c4 (/lib/x86_64-linux-gnu/libc.so.6+0x891c4)
   #15 0x00007f23bd199ac0 clone (/lib/x86_64-linux-gnu/libc.so.6+0x108ac0)
>> /bin/bash: line 1: 3183376 Segmentation fault      ld.lld -m elf_x86_64 =
-mllvm -import-instr-limit=3D5 --compress-debug-sections=3Dzlib -z noexecst=
ack -r -o drivers/net/wireless/ti/wl18xx/wl18xx.o @drivers/net/wireless/ti/=
wl18xx/wl18xx.mod
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace.
   Stack dump:
   0.	Running pass 'Function Pass Manager' on module 'drivers/crypto/aspeed=
/aspeed-acry.o'.
   1.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@aspeed_acry_done_task'
    #0 0x000055644060ff8b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (lld+0x7dbf8b)
    #1 0x000055644060d91b SignalHandler(int) Signals.cpp:0:0
    #2 0x00007fe0b83ec050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
    #3 0x00005564429fabf2 (anonymous namespace)::PEI::runOnMachineFunction(=
llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #4 0x00005564428dff15 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
    #5 0x00005564441688b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (lld+0x43348b9)
    #6 0x00005564441689ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
lld+0x43349ec)
    #7 0x0000556444169318 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (lld+0x4335318)
    #8 0x000055644269c27c codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
    #9 0x000055644269d78a llvm::lto::thinBackend(llvm::lto::Config const&, =
unsigned int, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFile=
Stream, std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::=
Twine const&)>, llvm::Module&, llvm::ModuleSummaryIndex const&, llvm::Strin=
gMap<std::unordered_set<unsigned long, std::hash<unsigned long>, std::equal=
_to<unsigned long>, std::allocator<unsigned long>>, llvm::MallocAllocator> =
const&, llvm::DenseMap<unsigned long, llvm::GlobalValueSummary*, llvm::Dens=
eMapInfo<unsigned long, void>, llvm::detail::DenseMapPair<unsigned long, ll=
vm::GlobalValueSummary*>> const&, llvm::MapVector<llvm::StringRef, llvm::Bi=
tcodeModule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapIn=
fo<llvm::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsi=
gned int>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModul=
e>, 0u>>*, std::vector<unsigned char, std::allocator<unsigned char>> const&=
) (lld+0x286978a)
   #10 0x000055644268dd2d std::_Function_handler<void (), std::_Bind<(anony=
mous namespace)::InProcessThinBackend::start(unsigned int, llvm::BitcodeMod=
ule, llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsigned l=
ong>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, llvm::M=
allocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::DenseMapInfo<=
llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::GlobalValue::=
LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<unsigned l=
ong const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::MapVector<llvm:=
:StringRef, llvm::BitcodeModule, llvm::DenseMap<llvm::StringRef, unsigned i=
nt, llvm::DenseMapInfo<llvm::StringRef, void>, llvm::detail::DenseMapPair<l=
lvm::StringRef, unsigned int>>, llvm::SmallVector<std::pair<llvm::StringRef=
, llvm::BitcodeModule>, 0u>>&)::'lambda'(llvm::BitcodeModule, llvm::ModuleS=
ummaryIndex&, llvm::StringMap<std::unordered_set<unsigned long, std::hash<u=
nsigned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>=
, llvm::MallocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::Dens=
eMapInfo<llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::Glob=
alValue::LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<u=
nsigned long const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::DenseM=
ap<unsigned long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned lo=
ng, void>, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSumma=
ry*>> const&, llvm::MapVector<llvm::StringRef, llvm::BitcodeModule, llvm::D=
enseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llvm::StringRef, =
void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned int>>, llvm::Sm=
allVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u>>&) (llvm::Bi=
tcodeModule, std::reference_wrapper<llvm::ModuleSummaryIndex>, std::referen=
ce_wrapper<llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsi=
gned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, l=
lvm::MallocAllocator> const>, std::reference_wrapper<llvm::DenseSet<llvm::V=
alueInfo, llvm::DenseMapInfo<llvm::ValueInfo, void>> const>, std::reference=
_wrapper<std::map<unsigned long, llvm::GlobalValue::LinkageTypes, std::less=
<unsigned long>, std::allocator<std::pair<unsigned long const, llvm::Global=
Value::LinkageTypes>>> const>, std::reference_wrapper<llvm::DenseMap<unsign=
ed long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned long, void>=
, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSummary*>> con=
st>, std::reference_wrapper<llvm::MapVector<llvm::StringRef, llvm::BitcodeM=
odule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llv=
m::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned i=
nt>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u=
>>>)>>::_M_invoke(std::_Any_data const&) LTO.cpp:0:0
   #11 0x000055644099732b std::_Function_handler<void (), llvm::ThreadPool:=
:createTaskAndFuture(std::function<void ()>)::'lambda'()>::_M_invoke(std::_=
Any_data const&) (lld+0xb6332b)
   #12 0x00005564442c1a9b llvm::ThreadPool::processTasks(llvm::ThreadPoolTa=
skGroup*) (lld+0x448da9b)
   #13 0x00005564442c23cc void* llvm::thread::ThreadProxy<std::tuple<llvm::=
ThreadPool::grow(int)::'lambda'()>>(void*) ThreadPool.cpp:0:0
   #14 0x00007fe0b84391c4 (/lib/x86_64-linux-gnu/libc.so.6+0x891c4)
   #15 0x00007fe0b84b8ac0 clone (/lib/x86_64-linux-gnu/libc.so.6+0x108ac0)
>> /bin/bash: line 1: 3197822 Segmentation fault      ld.lld -m elf_x86_64 =
-mllvm -import-instr-limit=3D5 --compress-debug-sections=3Dzlib -z noexecst=
ack -r -o drivers/crypto/aspeed/.tmp_aspeed-acry.o drivers/crypto/aspeed/as=
peed-acry.o
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace.
   Stack dump:
   0.	Running pass 'Function Pass Manager' on module 'drivers/crypto/aspeed=
/aspeed-hace.o'.
   1.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@aspeed_hace_hash_done_task'
    #0 0x000055ad09a69f8b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (lld+0x7dbf8b)
    #1 0x000055ad09a6791b SignalHandler(int) Signals.cpp:0:0
    #2 0x00007f9909e34050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
    #3 0x000055ad0be54bf2 (anonymous namespace)::PEI::runOnMachineFunction(=
llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #4 0x000055ad0bd39f15 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
    #5 0x000055ad0d5c28b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (lld+0x43348b9)
    #6 0x000055ad0d5c29ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
lld+0x43349ec)
    #7 0x000055ad0d5c3318 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (lld+0x4335318)
    #8 0x000055ad0baf627c codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
    #9 0x000055ad0baf778a llvm::lto::thinBackend(llvm::lto::Config const&, =
unsigned int, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFile=
Stream, std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::=
Twine const&)>, llvm::Module&, llvm::ModuleSummaryIndex const&, llvm::Strin=
gMap<std::unordered_set<unsigned long, std::hash<unsigned long>, std::equal=
_to<unsigned long>, std::allocator<unsigned long>>, llvm::MallocAllocator> =
const&, llvm::DenseMap<unsigned long, llvm::GlobalValueSummary*, llvm::Dens=
eMapInfo<unsigned long, void>, llvm::detail::DenseMapPair<unsigned long, ll=
vm::GlobalValueSummary*>> const&, llvm::MapVector<llvm::StringRef, llvm::Bi=
tcodeModule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapIn=
fo<llvm::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsi=
gned int>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModul=
e>, 0u>>*, std::vector<unsigned char, std::allocator<unsigned char>> const&=
) (lld+0x286978a)
   #10 0x000055ad0bae7d2d std::_Function_handler<void (), std::_Bind<(anony=
mous namespace)::InProcessThinBackend::start(unsigned int, llvm::BitcodeMod=
ule, llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsigned l=
ong>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, llvm::M=
allocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::DenseMapInfo<=
llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::GlobalValue::=
LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<unsigned l=
ong const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::MapVector<llvm:=
:StringRef, llvm::BitcodeModule, llvm::DenseMap<llvm::StringRef, unsigned i=
nt, llvm::DenseMapInfo<llvm::StringRef, void>, llvm::detail::DenseMapPair<l=
lvm::StringRef, unsigned int>>, llvm::SmallVector<std::pair<llvm::StringRef=
, llvm::BitcodeModule>, 0u>>&)::'lambda'(llvm::BitcodeModule, llvm::ModuleS=
ummaryIndex&, llvm::StringMap<std::unordered_set<unsigned long, std::hash<u=
nsigned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>=
, llvm::MallocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::Dens=
eMapInfo<llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::Glob=
alValue::LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<u=
nsigned long const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::DenseM=
ap<unsigned long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned lo=
ng, void>, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSumma=
ry*>> const&, llvm::MapVector<llvm::StringRef, llvm::BitcodeModule, llvm::D=
enseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llvm::StringRef, =
void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned int>>, llvm::Sm=
allVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u>>&) (llvm::Bi=
tcodeModule, std::reference_wrapper<llvm::ModuleSummaryIndex>, std::referen=
ce_wrapper<llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsi=
gned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, l=
lvm::MallocAllocator> const>, std::reference_wrapper<llvm::DenseSet<llvm::V=
alueInfo, llvm::DenseMapInfo<llvm::ValueInfo, void>> const>, std::reference=
_wrapper<std::map<unsigned long, llvm::GlobalValue::LinkageTypes, std::less=
<unsigned long>, std::allocator<std::pair<unsigned long const, llvm::Global=
Value::LinkageTypes>>> const>, std::reference_wrapper<llvm::DenseMap<unsign=
ed long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned long, void>=
, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSummary*>> con=
st>, std::reference_wrapper<llvm::MapVector<llvm::StringRef, llvm::BitcodeM=
odule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llv=
m::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned i=
nt>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u=
>>>)>>::_M_invoke(std::_Any_data const&) LTO.cpp:0:0
   #11 0x000055ad09df132b std::_Function_handler<void (), llvm::ThreadPool:=
:createTaskAndFuture(std::function<void ()>)::'lambda'()>::_M_invoke(std::_=
Any_data const&) (lld+0xb6332b)
   #12 0x000055ad0d71ba9b llvm::ThreadPool::processTasks(llvm::ThreadPoolTa=
skGroup*) (lld+0x448da9b)
   #13 0x000055ad0d71c3cc void* llvm::thread::ThreadProxy<std::tuple<llvm::=
ThreadPool::grow(int)::'lambda'()>>(void*) ThreadPool.cpp:0:0
   #14 0x00007f9909e811c4 (/lib/x86_64-linux-gnu/libc.so.6+0x891c4)
   #15 0x00007f9909f00ac0 clone (/lib/x86_64-linux-gnu/libc.so.6+0x108ac0)
>> /bin/bash: line 1: 3197928 Segmentation fault      ld.lld -m elf_x86_64 =
-mllvm -import-instr-limit=3D5 --compress-debug-sections=3Dzlib -z noexecst=
ack -r -o drivers/crypto/aspeed/aspeed_crypto.o @drivers/crypto/aspeed/aspe=
ed_crypto.mod
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace.
   Stack dump:
   0.	Running pass 'Function Pass Manager' on module 'drivers/vfio/platform=
/vfio_platform_common.o'.
   1.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@vfio_platform_call_reset'
    #0 0x00005634ff27ff8b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (lld+0x7dbf8b)
    #1 0x00005634ff27d91b SignalHandler(int) Signals.cpp:0:0
    #2 0x00007f2580241050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
    #3 0x000056350166abf2 (anonymous namespace)::PEI::runOnMachineFunction(=
llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #4 0x000056350154ff15 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
    #5 0x0000563502dd88b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (lld+0x43348b9)
    #6 0x0000563502dd89ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
lld+0x43349ec)
    #7 0x0000563502dd9318 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (lld+0x4335318)
    #8 0x000056350130c27c codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
    #9 0x000056350130d78a llvm::lto::thinBackend(llvm::lto::Config const&, =
unsigned int, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFile=
Stream, std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::=
Twine const&)>, llvm::Module&, llvm::ModuleSummaryIndex const&, llvm::Strin=
gMap<std::unordered_set<unsigned long, std::hash<unsigned long>, std::equal=
_to<unsigned long>, std::allocator<unsigned long>>, llvm::MallocAllocator> =
const&, llvm::DenseMap<unsigned long, llvm::GlobalValueSummary*, llvm::Dens=
eMapInfo<unsigned long, void>, llvm::detail::DenseMapPair<unsigned long, ll=
vm::GlobalValueSummary*>> const&, llvm::MapVector<llvm::StringRef, llvm::Bi=
tcodeModule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapIn=
fo<llvm::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsi=
gned int>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModul=
e>, 0u>>*, std::vector<unsigned char, std::allocator<unsigned char>> const&=
) (lld+0x286978a)
   #10 0x00005635012fdd2d std::_Function_handler<void (), std::_Bind<(anony=
mous namespace)::InProcessThinBackend::start(unsigned int, llvm::BitcodeMod=
ule, llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsigned l=
ong>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, llvm::M=
allocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::DenseMapInfo<=
llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::GlobalValue::=
LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<unsigned l=
ong const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::MapVector<llvm:=
:StringRef, llvm::BitcodeModule, llvm::DenseMap<llvm::StringRef, unsigned i=
nt, llvm::DenseMapInfo<llvm::StringRef, void>, llvm::detail::DenseMapPair<l=
lvm::StringRef, unsigned int>>, llvm::SmallVector<std::pair<llvm::StringRef=
, llvm::BitcodeModule>, 0u>>&)::'lambda'(llvm::BitcodeModule, llvm::ModuleS=
ummaryIndex&, llvm::StringMap<std::unordered_set<unsigned long, std::hash<u=
nsigned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>=
, llvm::MallocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::Dens=
eMapInfo<llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::Glob=
alValue::LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<u=
nsigned long const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::DenseM=
ap<unsigned long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned lo=
ng, void>, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSumma=
ry*>> const&, llvm::MapVector<llvm::StringRef, llvm::BitcodeModule, llvm::D=
enseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llvm::StringRef, =
void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned int>>, llvm::Sm=
allVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u>>&) (llvm::Bi=
tcodeModule, std::reference_wrapper<llvm::ModuleSummaryIndex>, std::referen=
ce_wrapper<llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsi=
gned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, l=
lvm::MallocAllocator> const>, std::reference_wrapper<llvm::DenseSet<llvm::V=
alueInfo, llvm::DenseMapInfo<llvm::ValueInfo, void>> const>, std::reference=
_wrapper<std::map<unsigned long, llvm::GlobalValue::LinkageTypes, std::less=
<unsigned long>, std::allocator<std::pair<unsigned long const, llvm::Global=
Value::LinkageTypes>>> const>, std::reference_wrapper<llvm::DenseMap<unsign=
ed long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned long, void>=
, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSummary*>> con=
st>, std::reference_wrapper<llvm::MapVector<llvm::StringRef, llvm::BitcodeM=
odule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llv=
m::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned i=
nt>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u=
>>>)>>::_M_invoke(std::_Any_data const&) LTO.cpp:0:0
   #11 0x00005634ff60732b std::_Function_handler<void (), llvm::ThreadPool:=
:createTaskAndFuture(std::function<void ()>)::'lambda'()>::_M_invoke(std::_=
Any_data const&) (lld+0xb6332b)
   #12 0x0000563502f31a9b llvm::ThreadPool::processTasks(llvm::ThreadPoolTa=
skGroup*) (lld+0x448da9b)
   #13 0x0000563502f323cc void* llvm::thread::ThreadProxy<std::tuple<llvm::=
ThreadPool::grow(int)::'lambda'()>>(void*) ThreadPool.cpp:0:0
   #14 0x00007f258028e1c4 (/lib/x86_64-linux-gnu/libc.so.6+0x891c4)
   #15 0x00007f258030dac0 clone (/lib/x86_64-linux-gnu/libc.so.6+0x108ac0)
>> /bin/bash: line 1: 3199604 Segmentation fault      ld.lld -m elf_x86_64 =
-mllvm -import-instr-limit=3D5 --compress-debug-sections=3Dzlib -z noexecst=
ack -r -o drivers/vfio/platform/vfio-platform-base.o @drivers/vfio/platform=
/vfio-platform-base.mod
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace.
   Stack dump:
   0.	Running pass 'Function Pass Manager' on module 'drivers/fpga/intel-m1=
0-bmc-sec-update.o'.
   1.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@m10bmc_sec_cleanup'
    #0 0x000055c206ca9f8b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (lld+0x7dbf8b)
    #1 0x000055c206ca791b SignalHandler(int) Signals.cpp:0:0
    #2 0x00007fe01c68b050 (/lib/x86_64-linux-gnu/libc.so.6+0x3c050)
    #3 0x000055c209094bf2 (anonymous namespace)::PEI::runOnMachineFunction(=
llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #4 0x000055c208f79f15 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
    #5 0x000055c20a8028b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (lld+0x43348b9)
    #6 0x000055c20a8029ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
lld+0x43349ec)
    #7 0x000055c20a803318 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (lld+0x4335318)
    #8 0x000055c208d3627c codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
    #9 0x000055c208d3778a llvm::lto::thinBackend(llvm::lto::Config const&, =
unsigned int, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFile=
Stream, std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::=
Twine const&)>, llvm::Module&, llvm::ModuleSummaryIndex const&, llvm::Strin=
gMap<std::unordered_set<unsigned long, std::hash<unsigned long>, std::equal=
_to<unsigned long>, std::allocator<unsigned long>>, llvm::MallocAllocator> =
const&, llvm::DenseMap<unsigned long, llvm::GlobalValueSummary*, llvm::Dens=
eMapInfo<unsigned long, void>, llvm::detail::DenseMapPair<unsigned long, ll=
vm::GlobalValueSummary*>> const&, llvm::MapVector<llvm::StringRef, llvm::Bi=
tcodeModule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapIn=
fo<llvm::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsi=
gned int>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModul=
e>, 0u>>*, std::vector<unsigned char, std::allocator<unsigned char>> const&=
) (lld+0x286978a)
   #10 0x000055c208d27d2d std::_Function_handler<void (), std::_Bind<(anony=
mous namespace)::InProcessThinBackend::start(unsigned int, llvm::BitcodeMod=
ule, llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsigned l=
ong>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, llvm::M=
allocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::DenseMapInfo<=
llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::GlobalValue::=
LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<unsigned l=
ong const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::MapVector<llvm:=
:StringRef, llvm::BitcodeModule, llvm::DenseMap<llvm::StringRef, unsigned i=
nt, llvm::DenseMapInfo<llvm::StringRef, void>, llvm::detail::DenseMapPair<l=
lvm::StringRef, unsigned int>>, llvm::SmallVector<std::pair<llvm::StringRef=
, llvm::BitcodeModule>, 0u>>&)::'lambda'(llvm::BitcodeModule, llvm::ModuleS=
ummaryIndex&, llvm::StringMap<std::unordered_set<unsigned long, std::hash<u=
nsigned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>=
, llvm::MallocAllocator> const&, llvm::DenseSet<llvm::ValueInfo, llvm::Dens=
eMapInfo<llvm::ValueInfo, void>> const&, std::map<unsigned long, llvm::Glob=
alValue::LinkageTypes, std::less<unsigned long>, std::allocator<std::pair<u=
nsigned long const, llvm::GlobalValue::LinkageTypes>>> const&, llvm::DenseM=
ap<unsigned long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned lo=
ng, void>, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSumma=
ry*>> const&, llvm::MapVector<llvm::StringRef, llvm::BitcodeModule, llvm::D=
enseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llvm::StringRef, =
void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned int>>, llvm::Sm=
allVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u>>&) (llvm::Bi=
tcodeModule, std::reference_wrapper<llvm::ModuleSummaryIndex>, std::referen=
ce_wrapper<llvm::StringMap<std::unordered_set<unsigned long, std::hash<unsi=
gned long>, std::equal_to<unsigned long>, std::allocator<unsigned long>>, l=
lvm::MallocAllocator> const>, std::reference_wrapper<llvm::DenseSet<llvm::V=
alueInfo, llvm::DenseMapInfo<llvm::ValueInfo, void>> const>, std::reference=
_wrapper<std::map<unsigned long, llvm::GlobalValue::LinkageTypes, std::less=
<unsigned long>, std::allocator<std::pair<unsigned long const, llvm::Global=
Value::LinkageTypes>>> const>, std::reference_wrapper<llvm::DenseMap<unsign=
ed long, llvm::GlobalValueSummary*, llvm::DenseMapInfo<unsigned long, void>=
, llvm::detail::DenseMapPair<unsigned long, llvm::GlobalValueSummary*>> con=
st>, std::reference_wrapper<llvm::MapVector<llvm::StringRef, llvm::BitcodeM=
odule, llvm::DenseMap<llvm::StringRef, unsigned int, llvm::DenseMapInfo<llv=
m::StringRef, void>, llvm::detail::DenseMapPair<llvm::StringRef, unsigned i=
nt>>, llvm::SmallVector<std::pair<llvm::StringRef, llvm::BitcodeModule>, 0u=
>>>)>>::_M_invoke(std::_Any_data const&) LTO.cpp:0:0
   #11 0x000055c20703132b std::_Function_handler<void (), llvm::ThreadPool:=
:createTaskAndFuture(std::function<void ()>)::'lambda'()>::_M_invoke(std::_=
Any_data const&) (lld+0xb6332b)
   #12 0x000055c20a95ba9b llvm::ThreadPool::processTasks(llvm::ThreadPoolTa=
skGroup*) (lld+0x448da9b)
   #13 0x000055c20a95c3cc void* llvm::thread::ThreadProxy<std::tuple<llvm::=
ThreadPool::grow(int)::'lambda'()>>(void*) ThreadPool.cpp:0:0
   #14 0x00007fe01c6d81c4 (/lib/x86_64-linux-gnu/libc.so.6+0x891c4)
   #15 0x00007fe01c757ac0 clone (/lib/x86_64-linux-gnu/libc.so.6+0x108ac0)
>> /bin/bash: line 1: 3202671 Segmentation fault      ld.lld -m elf_x86_64 =
-mllvm -import-instr-limit=3D5 --compress-debug-sections=3Dzlib -z noexecst=
ack -r -o drivers/fpga/.tmp_intel-m10-bmc-sec-update.o drivers/fpga/intel-m=
10-bmc-sec-update.o

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
