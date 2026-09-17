Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DA543935C
	for <oe-kbuild@lists.linux.dev>; Thu, 17 Sep 2026 21:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789680628; cv=none; b=ZEtgXdOT68T7w1myqu/+8z9MiQunzsszNnbL4Z2CjZw3gs9CbDEbfbEoRWNEXmqidTgB1UspUjHKwpt1lMY5+Jrih+2u7Az7BaR9I+3E9JBD437Wj9dgEGeg1JHWZna4YfqZk0GnUdDKhPn+yBaYm16WLYpvdXfZbwoSSWBBfN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789680628; c=relaxed/simple;
	bh=pQWVebf0C49HzRUyEAd6phqUQSkNN3YGRu9R8cZGEoo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=hqwqdMpkg90Cb6q6MuuV3gh6OtLg3b95wEpTrrSFbpP2r5UJSVz55QhcIeTCj3gtN0cJpkYm65AyO+9h/0MxvsdyqXsTJpfTRJbq6PzgmlzrUfgFE6lDfynrK7moFDJdTYzpZuICFy7yOezzVjejTGoWg77xnSTZHgejSGvNrLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ELCeLA1E; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ELCeLA1E"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789680624; x=1821216624;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=pQWVebf0C49HzRUyEAd6phqUQSkNN3YGRu9R8cZGEoo=;
  b=ELCeLA1EYTQDM798xB6HEjKKOMwK4TO1xPwNWLAHKpIwIFRVA3/SYS3N
   gUGBUlCJe/+lvwoLMeqqRGbnq71lZC2+aI2FB9ROXNrEixNL1DcJyuE+q
   i8sUKL4CX0C0nN8ZKtVzJFfcdni7mJ4FYlcQFz2DVA87jrnM5470R2iXd
   VdQpJgAwC48eTHRrzuERvA9/DHRqEAuEYRCMlDLxW93h7dvv9wKHo97UE
   OdTqBP8AtGKEwxr0jbxqSBffGJf+26/ZFIOcz+w6GYY0yOCRtvUTrBWWu
   tZyQPVJ0nBihc9sqFtx2dPu6EdEawC0+JisjWkb1SPCylH7B4PgR0M7Aq
   Q==;
X-CSE-ConnectionGUID: 9rMuXU2cQTiOGE3SFpr+UQ==
X-CSE-MsgGUID: BwNrk69bRKO/Tiy8hXWLoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="90014850"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="90014850"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2026 14:30:22 -0700
X-CSE-ConnectionGUID: WPrlVChyQVS8bWzXH68BPQ==
X-CSE-MsgGUID: 8c5V/rTWSIuNPpXnXXso8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; 
   d="scan'208";a="2458914"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 17 Sep 2026 14:30:21 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7JgQ-000000008Xd-43iY;
	Thu, 17 Sep 2026 21:30:18 +0000
Date: Fri, 18 Sep 2026 05:29:49 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: include/asm-generic/bitsperlong.h:23:2: sparse: sparse:
 Inconsistent word size. Check asm/bitsperlong.h
Message-ID: <202609180533.3hqSSVRb-lkp@intel.com>
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
:::::: Manual check reason: "low confidence static check warning: include/a=
sm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent word size. Chec=
k asm/bitsperlong.h"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: "Thomas Wei=C3=9Fschuh" <thomas.weissschuh@linutronix.de>
CC: Thomas Gleixner <tglx@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9b87fdc9af2fbfcdb5c24a64139685ef80f6573f
commit: 62357a5888ea6ef81f718eee20ad962a1101fb96 asm-generic/bitsperlong.h:=
 Add sanity checks for __BITS_PER_LONG
date:   6 months ago
:::::: branch date: 2 days ago
:::::: commit date: 6 months ago
config: x86_64-randconfig-r1308-20260917 (https://download.01.org/0day-ci/a=
rchive/20260918/202609180533.3hqSSVRb-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e98466=
48fd6183ee6d8cbdb4502213fcf902a211)
rustc: rustc 1.96.0 (ac68faa20 2026-05-25)
sparse: v0.6.5-rc1
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260918/202609180533.3hqSSVRb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Fixes: 62357a5888ea ("asm-generic/bitsperlong.h: Add sanity checks for __=
BITS_PER_LONG")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609180533.3hqSSVRb-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/x86/realmode/rm/regs.c: note: in included file (through arch/x86/in=
clude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/=
asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-bios.c: note: in included file (through arch/=
x86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, in=
clude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-vesa.c: note: in included file (through arch/=
x86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, in=
clude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-mode.c: note: in included file (through arch/=
x86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, in=
clude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/realmode/rm/wakemain.c: note: in included file (through arch/x8=
6/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, incl=
ude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/realmode/rm/video-vga.c: note: in included file (through arch/x=
86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, inc=
lude/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/video-mode.c: note: in included file (through arch/x86/inc=
lude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/a=
sm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/cpuflags.c: note: in included file (through arch/x86/inclu=
de/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm=
-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/printf.c: note: in included file (through arch/x86/include=
/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-g=
eneric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/video-vga.c: note: in included file (through arch/x86/incl=
ude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/as=
m-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/regs.c: note: in included file (through arch/x86/include/u=
api/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gen=
eric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/video-vesa.c: note: in included file (through arch/x86/inc=
lude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/a=
sm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/cpucheck.c: note: in included file (through arch/x86/inclu=
de/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm=
-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/pm.c: note: in included file (through arch/x86/include/uap=
i/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gener=
ic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/version.c: note: in included file (through arch/x86/includ=
e/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-=
generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/early_serial_console.c: note: in included file (through ar=
ch/x86/include/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h,=
 include/asm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/tty.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/memory.c: note: in included file (through arch/x86/include=
/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-g=
eneric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/string.c: note: in included file (through arch/x86/include=
/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-g=
eneric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/cmdline.c: note: in included file (through arch/x86/includ=
e/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-=
generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/video-bios.c: note: in included file (through arch/x86/inc=
lude/uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/a=
sm-generic/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/main.c: note: in included file (through arch/x86/include/u=
api/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gen=
eric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/a20.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/video.c: note: in included file (through arch/x86/include/=
uapi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-ge=
neric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/edd.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"
--
   arch/x86/boot/cpu.c: note: in included file (through arch/x86/include/ua=
pi/asm/bitsperlong.h, include/uapi/asm-generic/int-ll64.h, include/asm-gene=
ric/int-ll64.h, ...):
>> include/asm-generic/bitsperlong.h:23:2: sparse: sparse: Inconsistent wor=
d size. Check asm/bitsperlong.h
   include/asm-generic/bitsperlong.h:27:33: sparse: sparse: static assertio=
n failed: "Inconsistent word size. Check asm/bitsperlong.h"

vim +23 include/asm-generic/bitsperlong.h

c31ae4bb4a9fa46 Arnd Bergmann    2009-05-13  21 =20
62357a5888ea6ef Thomas Wei=C3=9Fschuh 2026-03-02  22  #if __CHAR_BIT__ * __=
SIZEOF_LONG__ !=3D __BITS_PER_LONG
62357a5888ea6ef Thomas Wei=C3=9Fschuh 2026-03-02 @23  #error Inconsistent w=
ord size. Check asm/bitsperlong.h
62357a5888ea6ef Thomas Wei=C3=9Fschuh 2026-03-02  24  #endif
62357a5888ea6ef Thomas Wei=C3=9Fschuh 2026-03-02  25 =20

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
