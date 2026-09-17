Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DB34D6C4E
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Sep 2026 11:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789643843; cv=none; b=jOSdaruNzZsjcHK6NqgLOuo2QjcWM58Q04aWNhA3BvrMeIditS8EN1CDm2etsm4MlGWb0RROnVLI8Va0xZtOX924/ETFhXGCoGkbuvaOEFYnqMyE/DHG+SWQXUkfid3jReznXworIXsXo7S7TfSDkCtkgHwBKF2CcTfktjobWJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789643843; c=relaxed/simple;
	bh=8z/JaPgTVcyzKV2QUXkzrsB4g9WQNW9FpsjdSv1khhs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=BbquHXpCqcBbmXR5AhQqYW7PGKXcL0E818ktv3apUW0IOfEbkbIII0uNRVk2ANDOTNMUcQEj18xK8oha7Mqsx/XvQzUWen11SS7zaelhaC5rrZGr8GgUgp9NTymC2DuPIPVP9KVNpXg9HiFcyNo6P4L0XQmH1PcDKvdBaN6lPWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=acljkaqJ; arc=none smtp.client-ip=192.198.163.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="acljkaqJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789643837; x=1821179837;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8z/JaPgTVcyzKV2QUXkzrsB4g9WQNW9FpsjdSv1khhs=;
  b=acljkaqJ7mkWvER4jrMgsXYD3YMH3JlVU67U+SGqa6o1rMIUCVdIZ1gi
   DISkYzqAXwHO9RqhdFBiSL8vy/WUQLxVE8ALkPGCO9lokDgSkvD1DTyNo
   YjK0rytB6dbF3eSiXtQY/9ScOs+XMYDoTXt8ITLF7swBQGPZP5770y+3u
   6OJgRxw7Bk6K1LtLkC8EOQms/VXL8E6rFbxrJsrgHlQzI+9Nk8NUxSC8a
   hOh/qz47yzHWyiZ1IWccUBIHALMJprN9VBY+6Z1vyJgK+dSjMeZ4Btyf9
   Ttvx/Ld6Wl0WDWDDkdpKCvD1e1wF5VZo0Awz86HmQuiZhhF0xmU99E+b3
   g==;
X-CSE-ConnectionGUID: 9avPNz6hQ1ObYX7YdjGMUw==
X-CSE-MsgGUID: 5qAhtKLLQX+orsml+omYVQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="558936"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="558936"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa115.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 04:17:13 -0700
X-CSE-ConnectionGUID: 0alenjGzS0OjQPI9Vzdq5Q==
X-CSE-MsgGUID: WlTiFRIORcqvtHyiMtlXZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2124581"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 17 Sep 2026 04:17:13 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7A73-000000000Zk-40bG;
	Thu, 17 Sep 2026 11:17:10 +0000
Date: Thu, 17 Sep 2026 13:15:58 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 946980 Segmentation fault      ld.lld -m
 elf_x86_64 -mllvm -import-instr-limit=5 --mllvm=-enable-fs-discriminator=true
 --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
 -plugin-opt=-split-machine-functions -z noexecstack -r -o...
Message-ID: <202609171303.4devdrXr-lkp@intel.com>
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
TO: Rong Xu <xur@google.com>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Kees Cook <kees@kernel.org>

Hi Rong,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   238650ef6c7c7cca08e032527329424c9fbd70e5
commit: e88b2fe8b9993c9cae856019b1c31c14b63cad7a kconfig: Remove the archit=
ecture specific config for AutoFDO
date:   3 months ago
:::::: branch date: 19 hours ago
:::::: commit date: 3 months ago
config: um-randconfig-r2102-20260916 (https://download.01.org/0day-ci/archi=
ve/20260917/202609171303.4devdrXr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260917/202609171303.4devdrXr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: e88b2fe8b999 ("kconfig: Remove the architecture specific config fo=
r AutoFDO")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609171303.4devdrXr-lkp@intel.com/

All errors (new ones prefixed by >>):

   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace.
   Stack dump:
   0.	Running pass 'Function Pass Manager' on module 'net/llc/llc_c_ac.o'.
   1.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@llc_conn_set_p_flag'
    #0 0x0000555ee7090f8b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (lld+0x7dbf8b)
    #1 0x0000555ee708e91b SignalHandler(int) Signals.cpp:0:0
    #2 0x00007f98e5dc9df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #3 0x0000555ee947bbf2 (anonymous namespace)::PEI::runOnMachineFunction(=
llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #4 0x0000555ee9360f15 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
    #5 0x0000555eeabe98b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (lld+0x43348b9)
    #6 0x0000555eeabe99ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
lld+0x43349ec)
    #7 0x0000555eeabea318 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (lld+0x4335318)
    #8 0x0000555ee911d27c codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
    #9 0x0000555ee911e78a llvm::lto::thinBackend(llvm::lto::Config const&, =
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
   #10 0x0000555ee910ed2d std::_Function_handler<void (), std::_Bind<(anony=
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
   #11 0x0000555ee741832b std::_Function_handler<void (), llvm::ThreadPool:=
:createTaskAndFuture(std::function<void ()>)::'lambda'()>::_M_invoke(std::_=
Any_data const&) (lld+0xb6332b)
   #12 0x0000555eead42a9b llvm::ThreadPool::processTasks(llvm::ThreadPoolTa=
skGroup*) (lld+0x448da9b)
   #13 0x0000555eead433cc void* llvm::thread::ThreadProxy<std::tuple<llvm::=
ThreadPool::grow(int)::'lambda'()>>(void*) ThreadPool.cpp:0:0
   #14 0x00007f98e5e1cb7b (/lib/x86_64-linux-gnu/libc.so.6+0x92b7b)
   #15 0x00007f98e5e9a630 clone (/lib/x86_64-linux-gnu/libc.so.6+0x110630)
>> /bin/bash: line 1: 946980 Segmentation fault      ld.lld -m elf_x86_64 -=
mllvm -import-instr-limit=3D5 --mllvm=3D-enable-fs-discriminator=3Dtrue --m=
llvm=3D-improved-fs-discriminator=3Dtrue -plugin-opt=3Dthinlto -plugin-opt=
=3D-split-machine-functions -z noexecstack -r -o net/llc/llc2.o @net/llc/ll=
c2.mod

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
