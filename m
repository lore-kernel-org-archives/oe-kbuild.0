Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B973A1DB
	for <oe-kbuild@lists.linux.dev>; Fri, 24 Jul 2026 06:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784872890; cv=none; b=RR7JUow6wXuH7UXsTl3RnUaRwHXWojOH/unzy2poFsbiTSg5EC7q4TWdGzhSq+UvmZmLc3eRbqEBQebMC6fQTQ2RLqe36YxBZrGc4s7r+Czn8XgWXiq1+U255phASFXMukJfzKlJ2KDBgbp9pzFYRGHzlX7GJ1G0UdH5GG5OnMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784872890; c=relaxed/simple;
	bh=9p0N2TcdaOK62dlfM2BqNCCIqmPIoDq01NM3znPMhdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=CmwEkOFBGlSsQ7kBWg5gs4eu/RuScqWkJAO9VDEhGX+8/Yc+EHBeqhzcouzMd+BmfmJmQepIP5HsGAXqhfSDBFXSIjUpyN9H/vJy6pYSEshBAQvLUYLrBkt1cv+SI/gKUwrq82LXE7997BxkMfoFCXZ2gJHCU61JAgrPN4L/ZB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NT7LORpf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NT7LORpf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784872887; x=1816408887;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=9p0N2TcdaOK62dlfM2BqNCCIqmPIoDq01NM3znPMhdQ=;
  b=NT7LORpfKbJMEUDV1GA9xSJMRmNfAsFVtZmd82i/X9L4ysDHJKrQ2MvR
   D5SRDCTqZ6cETjuWoLizn/EITW1QJmL+Q1sGrUGh3eMarmH71YjhEuiUV
   xjPTjOkNaJGHtzMDAYv0ktL5mGScu/4hcdNXZOZG98HqpTTSoqY/HjIXR
   OS59UIOnS+hL0Q+Y+o3f7e+OYabfDuu1JQqSzzFGLfuZObQ19a95Cl5in
   kUukZG6XStPt8ChMGOnO6ofHG0kLNI6toISslhT47EmERVL07XNfJqWeX
   5unVb6YmHK4xh2k8gP1Z5gSph6YlpbQd1BFCftq6yum3P61qfp35fHSmg
   Q==;
X-CSE-ConnectionGUID: pQkSIjnhS2WvakjtPkFJVA==
X-CSE-MsgGUID: bhddv8bBR5iISyBx8s01sg==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="96683920"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="96683920"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2026 23:01:27 -0700
X-CSE-ConnectionGUID: 85eKaSMlRL+gT4bZkBfn7A==
X-CSE-MsgGUID: KwEap5BYTR2WOFuuzC0BcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; 
   d="scan'208";a="262933002"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Jul 2026 23:01:25 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wn8yI-00000000aXI-32Q7;
	Fri, 24 Jul 2026 06:01:22 +0000
Date: Fri, 24 Jul 2026 14:00:43 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [morimoto:sound-cleanup-2026-07-23 293/293] /bin/bash: line
 1: 3652547 Segmentation fault      ld.lld -m elf_i386 -mllvm
 -import-instr-limit=5 -z noexecstack -r -o
 drivers/media/platform/rockchip/rkisp1/rockchip-isp1.o
 @drivers/media/platform/rockchip/rkisp1/rockchip-isp1.mod
Message-ID: <202607241332.ugY7hQOZ-lkp@intel.com>
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
TO: Rong Xu <xur@google.com>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Masahiro Yamada <masahiroy@kernel.org>

Hi Rong,

First bad commit (maybe !=3D root cause):

tree:   https://github.com/morimoto/linux sound-cleanup-2026-07-23
head:   5173180a2e0ab04e84faceb578ac598501f8d053
commit: 9f2aee8f7d1842be08da860e45265d30dba0d1f7 [293/293] kbuild: distribu=
ted build support for Clang ThinLTO
:::::: branch date: 29 hours ago
:::::: commit date: 8 weeks ago
config: um-randconfig-r051-20260724 (https://download.01.org/0day-ci/archiv=
e/20260724/202607241332.ugY7hQOZ-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260724/202607241332.ugY7hQOZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 9f2aee8f7d18 ("kbuild: distributed build support for Clang ThinLTO=
")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202607241332.ugY7hQOZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace.
   Stack dump:
   0.	Running pass 'Function Pass Manager' on module 'drivers/media/platfor=
m/rockchip/rkisp1/rkisp1-capture.o'.
   1.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@rkisp1_mp_sp_stop'
    #0 0x0000557019c20f8b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (lld+0x7dbf8b)
    #1 0x0000557019c1e91b SignalHandler(int) Signals.cpp:0:0
    #2 0x00007f0168eebdf0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #3 0x000055701c00bbf2 (anonymous namespace)::PEI::runOnMachineFunction(=
llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #4 0x000055701bef0f15 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
    #5 0x000055701d7798b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (lld+0x43348b9)
    #6 0x000055701d7799ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
lld+0x43349ec)
    #7 0x000055701d77a318 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (lld+0x4335318)
    #8 0x000055701bcad27c codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
    #9 0x000055701bcae78a llvm::lto::thinBackend(llvm::lto::Config const&, =
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
   #10 0x000055701bc9ed2d std::_Function_handler<void (), std::_Bind<(anony=
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
   #11 0x0000557019fa832b std::_Function_handler<void (), llvm::ThreadPool:=
:createTaskAndFuture(std::function<void ()>)::'lambda'()>::_M_invoke(std::_=
Any_data const&) (lld+0xb6332b)
   #12 0x000055701d8d2a9b llvm::ThreadPool::processTasks(llvm::ThreadPoolTa=
skGroup*) (lld+0x448da9b)
   #13 0x000055701d8d33cc void* llvm::thread::ThreadProxy<std::tuple<llvm::=
ThreadPool::grow(int)::'lambda'()>>(void*) ThreadPool.cpp:0:0
   #14 0x00007f0168f3eb7b (/lib/x86_64-linux-gnu/libc.so.6+0x92b7b)
   #15 0x00007f0168fbc630 clone (/lib/x86_64-linux-gnu/libc.so.6+0x110630)
>> /bin/bash: line 1: 3652547 Segmentation fault      ld.lld -m elf_i386 -m=
llvm -import-instr-limit=3D5 -z noexecstack -r -o drivers/media/platform/ro=
ckchip/rkisp1/rockchip-isp1.o @drivers/media/platform/rockchip/rkisp1/rockc=
hip-isp1.mod
--
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace.
   Stack dump:
   0.	Running pass 'Function Pass Manager' on module 'drivers/media/platfor=
m/samsung/s3c-camif/camif-core.o'.
   1.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@s3c_camif_remove'
    #0 0x0000563d11775f8b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (lld+0x7dbf8b)
    #1 0x0000563d1177391b SignalHandler(int) Signals.cpp:0:0
    #2 0x00007fd28ed80df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #3 0x0000563d13b60bf2 (anonymous namespace)::PEI::runOnMachineFunction(=
llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #4 0x0000563d13a45f15 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
    #5 0x0000563d152ce8b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (lld+0x43348b9)
    #6 0x0000563d152ce9ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
lld+0x43349ec)
    #7 0x0000563d152cf318 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (lld+0x4335318)
    #8 0x0000563d1380227c codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
    #9 0x0000563d1380378a llvm::lto::thinBackend(llvm::lto::Config const&, =
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
   #10 0x0000563d137f3d2d std::_Function_handler<void (), std::_Bind<(anony=
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
   #11 0x0000563d11afd32b std::_Function_handler<void (), llvm::ThreadPool:=
:createTaskAndFuture(std::function<void ()>)::'lambda'()>::_M_invoke(std::_=
Any_data const&) (lld+0xb6332b)
   #12 0x0000563d15427a9b llvm::ThreadPool::processTasks(llvm::ThreadPoolTa=
skGroup*) (lld+0x448da9b)
   #13 0x0000563d154283cc void* llvm::thread::ThreadProxy<std::tuple<llvm::=
ThreadPool::grow(int)::'lambda'()>>(void*) ThreadPool.cpp:0:0
   #14 0x00007fd28edd3b7b (/lib/x86_64-linux-gnu/libc.so.6+0x92b7b)
   #15 0x00007fd28ee51630 clone (/lib/x86_64-linux-gnu/libc.so.6+0x110630)
>> /bin/bash: line 1: 3645835 Segmentation fault      ld.lld -m elf_i386 -m=
llvm -import-instr-limit=3D5 -z noexecstack -r -o drivers/media/platform/sa=
msung/s3c-camif/s3c-camif.o @drivers/media/platform/samsung/s3c-camif/s3c-c=
amif.mod

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
