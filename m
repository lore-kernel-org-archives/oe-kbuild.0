Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1998E1F09A5
	for <oe-kbuild@lists.linux.dev>; Sat,  8 Aug 2026 22:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786228286; cv=none; b=Fd2Z3A+iDGXUBNIdjtDHAnyi+0dzHqhetVesvZLL/o4KHAvEmn58dKixl2I0uqg7VMMdN8RUfNruRvpkVrU3QqeYLEe4u7LsQDybGTfc5Y25rP6uz2FCIu0KKdh98MD+jC6jhIYYOAYUt3foE2FlEhn4/K7lwZy5Z4IY3OBflak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786228286; c=relaxed/simple;
	bh=6wycvu4zMPKo0dp8jmK7/338oHZQ1IPJlOpneXVgGNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=j5bKr2KA8aofH5OkvIHmQw6NyVi/xP84+M/dAf4YWHVVLRChYiTOksCyh8i47jDw1ZBRpC/RNyBR0wy6pU1XiLici4zFDK5MGaz15Pp8+0VQldPrD34wHl23Qub0zeA+iXn63Tq5GUWyvrqIM66nAuOUA6feG+9EKTJPzmz1Y6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dapf6sZQ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dapf6sZQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786228284; x=1817764284;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6wycvu4zMPKo0dp8jmK7/338oHZQ1IPJlOpneXVgGNk=;
  b=Dapf6sZQ9tJcYrSOprNYLp7b3fjWIGIIanQCcVu+xzd4ExlHFlUk+Io6
   bSImWWJmswHZ0ByMBdZl/uxAMSeYjOFDs3K/JLeQUYpKMW1sw9OqDs/sg
   lNP2hF7iPuNwb/YWHmaUGyPKa3H7vELLB1JwseNfOyoyOfH4j3KyMkmMK
   n67P2kwM9JGZ3L1Az+GoTGQFu71WdWH8TUh6jvNSfjxOTASijPZfmpdLV
   Jw9ePuKs7SJf12Qk6wiSjgSfUVYyQVzfsebjHf69+QoSEWC64kFViWwKJ
   ZLn6YthI1FjsmdWNobmhU8lNTLTCgblyiVgSdbSkswT0w9rh4Ji0qjIG+
   A==;
X-CSE-ConnectionGUID: 2ao6rjwQRFiwUN0KBBI6PQ==
X-CSE-MsgGUID: MBJXJby9Rtynmlr791VVWA==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="89320343"
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="89320343"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 15:31:23 -0700
X-CSE-ConnectionGUID: VMhhhzl1RKSPPqyd0gfaKg==
X-CSE-MsgGUID: QXA5NmY1QJyC5OcMY+G04w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,212,1779174000"; 
   d="scan'208";a="258832058"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 08 Aug 2026 15:31:22 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wspZX-00000000KtV-49Rm;
	Sat, 08 Aug 2026 22:31:19 +0000
Date: Sun, 09 Aug 2026 06:30:55 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: /bin/bash: line 1: 496655 Segmentation fault      ld.lld -m
 elf_x86_64 -mllvm -import-instr-limit=5 --mllvm=-enable-fs-discriminator=true
 --mllvm=-improved-fs-discriminator=true -plugin-opt=thinlto
 -plugin-opt=-split-machine-functions -z noexecstack -r -o...
Message-ID: <202608090656.NQEMW00n-lkp@intel.com>
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
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Rong Xu <xur@google.com>
CC: Nathan Chancellor <nathan@kernel.org>
CC: Kees Cook <kees@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   bcc44b6785f216eb939226ade6e3910baa30516b
commit: e88b2fe8b9993c9cae856019b1c31c14b63cad7a kconfig: Remove the archit=
ecture specific config for AutoFDO
date:   9 weeks ago
:::::: branch date: 24 hours ago
:::::: commit date: 9 weeks ago
config: um-randconfig-002-20260809 (https://download.01.org/0day-ci/archive=
/20260809/202608090656.NQEMW00n-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 600970=
8b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260809/202608090656.NQEMW00n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: e88b2fe8b999 ("kconfig: Remove the architecture specific config fo=
r AutoFDO")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202608090656.NQEMW00n-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/rcu/rcutorture.c:25:
   In file included from include/linux/interrupt.h:11:
   In file included from include/linux/hardirq.h:11:
   In file included from arch/um/include/asm/hardirq.h:24:
   In file included from include/linux/irq.h:20:
   In file included from include/linux/io.h:12:
   In file included from arch/um/include/asm/io.h:24:
   include/asm-generic/io.h:1209:55: warning: performing pointer arithmetic=
 on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
    1209 |         return (port > MMIO_UPPER_LIMIT) ? NULL : PCI_IOBASE + p=
ort;
         |                                                   ~~~~~~~~~~ ^
   1 warning generated.
   PLEASE submit a bug report to https://github.com/llvm/llvm-project/issue=
s/ and include the crash backtrace.
   Stack dump:
   0.	Running pass 'Function Pass Manager' on module 'kernel/rcu/rcutorture=
.o'.
   1.	Running pass 'Prologue/Epilogue Insertion & Frame Finalization' on fu=
nction '@rcu_torture_cb'
    #0 0x0000559670c03f8b llvm::sys::PrintStackTrace(llvm::raw_ostream&, in=
t) (lld+0x7dbf8b)
    #1 0x0000559670c0191b SignalHandler(int) Signals.cpp:0:0
    #2 0x00007f7a86b71df0 (/lib/x86_64-linux-gnu/libc.so.6+0x3fdf0)
    #3 0x0000559672feebf2 (anonymous namespace)::PEI::runOnMachineFunction(=
llvm::MachineFunction&) PrologEpilogInserter.cpp:0:0
    #4 0x0000559672ed3f15 llvm::MachineFunctionPass::runOnFunction(llvm::Fu=
nction&) (.part.0) MachineFunctionPass.cpp:0:0
    #5 0x000055967475c8b9 llvm::FPPassManager::runOnFunction(llvm::Function=
&) (lld+0x43348b9)
    #6 0x000055967475c9ec llvm::FPPassManager::runOnModule(llvm::Module&) (=
lld+0x43349ec)
    #7 0x000055967475d318 llvm::legacy::PassManagerImpl::run(llvm::Module&)=
 (lld+0x4335318)
    #8 0x0000559672c9027c codegen(llvm::lto::Config const&, llvm::TargetMac=
hine*, std::function<llvm::Expected<std::unique_ptr<llvm::CachedFileStream,=
 std::default_delete<llvm::CachedFileStream>>> (unsigned int, llvm::Twine c=
onst&)>, unsigned int, llvm::Module&, llvm::ModuleSummaryIndex const&) LTOB=
ackend.cpp:0:0
    #9 0x0000559672c9178a llvm::lto::thinBackend(llvm::lto::Config const&, =
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
   #10 0x0000559672c81d2d std::_Function_handler<void (), std::_Bind<(anony=
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
   #11 0x0000559670f8b32b std::_Function_handler<void (), llvm::ThreadPool:=
:createTaskAndFuture(std::function<void ()>)::'lambda'()>::_M_invoke(std::_=
Any_data const&) (lld+0xb6332b)
   #12 0x00005596748b5a9b llvm::ThreadPool::processTasks(llvm::ThreadPoolTa=
skGroup*) (lld+0x448da9b)
   #13 0x00005596748b63cc void* llvm::thread::ThreadProxy<std::tuple<llvm::=
ThreadPool::grow(int)::'lambda'()>>(void*) ThreadPool.cpp:0:0
   #14 0x00007f7a86bc4b7b (/lib/x86_64-linux-gnu/libc.so.6+0x92b7b)
   #15 0x00007f7a86c42630 clone (/lib/x86_64-linux-gnu/libc.so.6+0x110630)
>> /bin/bash: line 1: 496655 Segmentation fault      ld.lld -m elf_x86_64 -=
mllvm -import-instr-limit=3D5 --mllvm=3D-enable-fs-discriminator=3Dtrue --m=
llvm=3D-improved-fs-discriminator=3Dtrue -plugin-opt=3Dthinlto -plugin-opt=
=3D-split-machine-functions -z noexecstack -r -o kernel/rcu/.tmp_rcutorture=
.o kernel/rcu/rcutorture.o

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
