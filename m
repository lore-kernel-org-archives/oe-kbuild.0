Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 873E3568FBF
	for <oe-kbuild@lists.linux.dev>; Wed, 23 Sep 2026 19:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790192036; cv=none; b=ADz8NoAqgFY0c5qXVY0HJrTSw4ELlOP5a/hk8nonwWgHTPrOO/fU2ByYqWkj13s/WPVfwS0NTIlix7H4j7R8S1F/V6tQnh5hXWTtW8PtcWYKnwsjTQhjOP3EUo79dxEcL5R/suIp9PHBKmwps+nZ/+CVDglJodneTyuq6QntvgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790192036; c=relaxed/simple;
	bh=HSRJU3Itzwzbv3EimNMfhUcK4aFZ6Wg44r1N1jfDnZs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=vBLC/TFD1dnoWK/mxmMab3fF7b9S2NdJX6VvH7ePOX+M+YCwrqeTJGk3i6XzKkfBgkv39tIpOLWVKO9S+9AtPfdm9GZQv7+quV8y0rfN212VMjVNlL0DIl144HTiaL1CByLsK2JQArUi1RCYxm+mSlsrNWTACuGWs3FvvjoVDiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W1eBzXAu; arc=none smtp.client-ip=192.198.163.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W1eBzXAu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790192034; x=1821728034;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=HSRJU3Itzwzbv3EimNMfhUcK4aFZ6Wg44r1N1jfDnZs=;
  b=W1eBzXAuQhzZX6LrbTUBcFEGE3JN7oQd/Kbc5TRuFIMC78WoyZz4OLAT
   IchrDiYgGF+5qOh7NNhybuMcsIppO0lyLvarQEF5AAftj4CgOegCype6O
   VBqEqHG9mWONHlZtqbP1YpcOu9k0h3ECM0da8ThTU55Hzk6qNJuPW8rN6
   xGL3DoMa8fP8xhOdV6/D1tUPA2iHvuBl9uwZCR46HhIV9WFeabimSvpRn
   1XcopK3PpDAfTIQmNQQASTkjS2mSjpdR2CDd636+zTjO8LrNvFeKBdfp/
   iBhaTr5hHUpzjXVL1vkiLcPR00cR2xFhJA9URFudcNghyzixT4KjJTHa/
   g==;
X-CSE-ConnectionGUID: OfQ0qBdGReqcg+0zSif1Tw==
X-CSE-MsgGUID: 4I8goRaHRlCn5cANtLaPPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="1440558"
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="1440558"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa114.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2026 12:33:53 -0700
X-CSE-ConnectionGUID: mgccVj89StO9ukyM79ftHw==
X-CSE-MsgGUID: SHWLrcZhRZ+XbVCQCcVI9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,119,1787036400"; 
   d="scan'208";a="5003349"
Received: from igk-lkp-server01.igk.intel.com (HELO 1bbc298b9a73) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 23 Sep 2026 12:33:51 -0700
Received: from kbuild by 1bbc298b9a73 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9Siz-000000000n9-3t6J;
	Wed, 23 Sep 2026 19:33:49 +0000
Date: Wed, 23 Sep 2026 21:33:20 +0200
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:m10 40/44]
 drivers/mtd/chips/cfi_cmdset_0002.c:2428:(.xiptext+0xa0b): dangerous
 relocation: windowed longcall crosses 1GB boundary; return may fail:
 ddebug_increment_call_count
Message-ID: <202609232114.jEnQSymN-lkp@intel.com>
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
:::::: Manual check reason: "xtensa: dangerous relocation"
::::::=20

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: Jim Cromie <jim.cromie@gmail.com>
TO: "=C5=81ukasz Bartosik" <ukaszb@chromium.org>

tree:   https://github.com/jimc/linux.git m10
head:   f95e4f1e4ce035c9b5f8da68c66d83f2452d92d5
commit: 34511c853d872a498b760316900068f07ba5150f [40/44] dyndbg: add +c fla=
g to count advantage of classmaps for DRM
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: xtensa-randconfig-2001-20260923 (https://download.01.org/0day-ci/ar=
chive/20260923/202609232114.jEnQSymN-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 8.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260923/202609232114.jEnQSymN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202609232114.jEnQSymN-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/chips/cfi_probe.c:102:(.xiptext+0x51a): dangerous relocation=
: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:108:(.xiptext+0x536): dangerous relocation=
: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:114:(.xiptext+0x54d): dangerous relocation=
: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_o=
ff
   drivers/mtd/chips/cfi_probe.c:116:(.xiptext+0x57c): dangerous relocation=
: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:143:(.xiptext+0x60c): dangerous relocation=
: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:144:(.xiptext+0x61e): dangerous relocation=
: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:155:(.xiptext+0x64d): dangerous relocation=
: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:156:(.xiptext+0x65f): dangerous relocation=
: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_probe.c:170:(.xiptext+0x6b4): dangerous relocation=
: windowed longcall crosses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.c:172:(.xiptext+0x6d0): dangerous relocation=
: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `get_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:888:(.text+0xeb8): dangerous relocat=
ion: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4=
c)
   drivers/mtd/chips/cfi_cmdset_0002.c:927:(.text+0xf80): dangerous relocat=
ion: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0x4=
c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0002.c:1458:(.text+0x1947): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1466:(.text+0x1972): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x2c4)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2627:(.text+0x1a67): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x960)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   drivers/mtd/chips/cfi_cmdset_0002.c:642:(.text+0x1cc7): dangerous reloca=
tion: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:2188:(.text+0x20f3): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2205:(.text+0x2132): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x4c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_panic_write_oneword=
':
   drivers/mtd/chips/cfi_cmdset_0002.c:2269:(.text+0x2332): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2275:(.text+0x2343): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x4c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   drivers/mtd/chips/cfi_cmdset_0002.c:1404:(.text+0x28d6): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x104c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0002.c:1516:(.text+0x2a12): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mod=
e_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1518:(.text+0x2a88): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: cfi_qry_mod=
e_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words=
':
   drivers/mtd/chips/cfi_cmdset_0002.c:1858:(.text+0x35d7): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x104c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1882:(.text+0x36a7): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x104c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1925:(.text+0x3818): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x104c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_buffe=
rs':
   drivers/mtd/chips/cfi_cmdset_0002.c:2137:(.text+0x395c): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x1504)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready':
   drivers/mtd/chips/cfi_cmdset_0002.c:839:(.xiptext+0x78): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: cfi_build_c=
md
   drivers/mtd/chips/cfi_cmdset_0002.c:844:(.xiptext+0x93): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_ge=
n_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:860:(.xiptext+0x138): dangerous relo=
cation: windowed longcall crosses 1GB boundary; return may fail: __stack_ch=
k_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset':
   drivers/mtd/chips/cfi_cmdset_0002.c:2004:(.xiptext+0x1a0): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2006:(.xiptext+0x1b4): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2008:(.xiptext+0x1ca): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable':
   drivers/mtd/chips/cfi_cmdset_0002.c:1035:(.xiptext+0x22a): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build=
_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1040:(.xiptext+0x251): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: trace_har=
dirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1041:(.xiptext+0x262): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: __stack_c=
hk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1061:(.xiptext+0x2e2): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build=
_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1080:(.xiptext+0x34a): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build=
_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1098:(.xiptext+0x3ca): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build=
_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1119:(.xiptext+0x423): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: __trace_s=
et_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1120:(.xiptext+0x43b): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_=
queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1121:(.xiptext+0x443): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unl=
ock
   drivers/mtd/chips/cfi_cmdset_0002.c:1122:(.xiptext+0x449): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1123:(.xiptext+0x454): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: remove_wa=
it_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1124:(.xiptext+0x45e): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_loc=
k_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1127:(.xiptext+0x47b): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: trace_har=
dirqs_off
   drivers/mtd/chips/cfi_cmdset_0002.c:1130:(.xiptext+0x487): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x=
c48)
   drivers/mtd/chips/cfi_cmdset_0002.c:1102:(.xiptext+0x534): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build=
_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1105:(.xiptext+0x55d): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: trace_har=
dirqs_on
   drivers/mtd/chips/cfi_cmdset_0002.c:1106:(.xiptext+0x56e): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unl=
ock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `_cond_resched':
   include/linux/sched.h:2162:(.xiptext+0x574): dangerous relocation: windo=
wed longcall crosses 1GB boundary; return may fail: __cond_resched
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   drivers/mtd/chips/cfi_cmdset_0002.c:1116:(.xiptext+0x57e): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_loc=
k_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1146:(.xiptext+0x5bf): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: __stack_c=
hk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `usecs_to_jiffies':
   include/linux/jiffies.h:619:(.xiptext+0x63b): dangerous relocation: wind=
owed longcall crosses 1GB boundary; return may fail: __usecs_to_jiffies
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   drivers/mtd/chips/cfi_cmdset_0002.c:1957:(.xiptext+0x672): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: __trace_s=
et_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1958:(.xiptext+0x68e): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_=
queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1959:(.xiptext+0x69b): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unl=
ock
   drivers/mtd/chips/cfi_cmdset_0002.c:1960:(.xiptext+0x6a1): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1961:(.xiptext+0x6ac): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: remove_wa=
it_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1963:(.xiptext+0x6be): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_loc=
k_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1973:(.xiptext+0x6e6): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1980:(.xiptext+0x704): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x=
9e4)
   drivers/mtd/chips/cfi_cmdset_0002.c:1990:(.xiptext+0x72e): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: __stack_c=
hk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start=
':
   drivers/mtd/chips/cfi_cmdset_0002.c:1721:(.xiptext+0x762): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_loc=
k_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1723:(.xiptext+0x770): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x=
e48)
   drivers/mtd/chips/cfi_cmdset_0002.c:1725:(.xiptext+0x77e): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unl=
ock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `otp_enter':
   drivers/mtd/chips/cfi_cmdset_0002.c:1280:(.xiptext+0x7a0): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1282:(.xiptext+0x7b4): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1284:(.xiptext+0x7ca): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `otp_exit':
   drivers/mtd/chips/cfi_cmdset_0002.c:1295:(.xiptext+0x837): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1297:(.xiptext+0x84b): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1299:(.xiptext+0x860): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1301:(.xiptext+0x874): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   drivers/mtd/chips/cfi_cmdset_0002.c:1744:(.xiptext+0x89e): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x=
d4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:1746:(.xiptext+0x8a7): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unl=
ock
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   drivers/mtd/chips/cfi_cmdset_0002.c:2421:(.xiptext+0x9de): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_loc=
k_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2422:(.xiptext+0x9ec): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x=
e48)
>> drivers/mtd/chips/cfi_cmdset_0002.c:2428:(.xiptext+0xa0b): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: ddebug_in=
crement_call_count
   drivers/mtd/chips/cfi_cmdset_0002.c:2428:(.xiptext+0xa22): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic=
_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:2428:(.xiptext+0xa2e): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   drivers/mtd/chips/cfi_cmdset_0002.c:2433:(.xiptext+0xa50): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x=
1a04)
   drivers/mtd/chips/cfi_cmdset_0002.c:2436:(.xiptext+0xa70): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2437:(.xiptext+0xa86): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2438:(.xiptext+0xa9f): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2439:(.xiptext+0xab6): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2440:(.xiptext+0xacc): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2441:(.xiptext+0xae6): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2457:(.xiptext+0xb3a): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: __trace_s=
et_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:2458:(.xiptext+0xb54): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_=
queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2459:(.xiptext+0xb5c): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unl=
ock
   drivers/mtd/chips/cfi_cmdset_0002.c:2460:(.xiptext+0xb62): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2461:(.xiptext+0xb6e): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: remove_wa=
it_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2462:(.xiptext+0xb7a): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_loc=
k_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2473:(.xiptext+0xbb2): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x=
9e4)
   drivers/mtd/chips/cfi_cmdset_0002.c:2479:(.xiptext+0xbd2): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:2491:(.xiptext+0xbf6): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build=
_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2503:(.xiptext+0xc4b): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x=
d4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2504:(.xiptext+0xc53): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unl=
ock
   drivers/mtd/chips/cfi_cmdset_0002.c:2507:(.xiptext+0xc66): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: __stack_c=
hk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   drivers/mtd/chips/cfi_cmdset_0002.c:1662:(.xiptext+0xd20): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1663:(.xiptext+0xd37): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1664:(.xiptext+0xd4f): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_send_=
gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1679:(.xiptext+0xdaa): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: __trace_s=
et_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:1680:(.xiptext+0xdc7): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: add_wait_=
queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1681:(.xiptext+0xdd2): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_unl=
ock
   drivers/mtd/chips/cfi_cmdset_0002.c:1682:(.xiptext+0xdd8): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:1683:(.xiptext+0xde3): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: remove_wa=
it_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:1685:(.xiptext+0xdf2): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: mutex_loc=
k_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:1696:(.xiptext+0xe24): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:1697:(.xiptext+0xe2e): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x=
1a04)
   drivers/mtd/chips/cfi_cmdset_0002.c:1703:(.xiptext+0xe4c): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x=
9e4)
   drivers/mtd/chips/cfi_cmdset_0002.c:1713:(.xiptext+0xe76): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: __stack_c=
hk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry=
':
   drivers/mtd/chips/cfi_cmdset_0002.c:1767:(.xiptext+0xf23): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: ddebug_in=
crement_call_count
   drivers/mtd/chips/cfi_cmdset_0002.c:1767:(.xiptext+0xf3c): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: __dynamic=
_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:1767:(.xiptext+0xf48): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: dump_stack
   drivers/mtd/chips/cfi_cmdset_0002.c:1773:(.xiptext+0xf6f): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: (.text+0x=
1a04)
   drivers/mtd/chips/cfi_cmdset_0002.c:1779:(.xiptext+0xf98): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: cfi_build=
_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:1788:(.xiptext+0xfee): dangerous rel=
ocation: windowed longcall crosses 1GB boundary; return may fail: __stack_c=
hk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   drivers/mtd/chips/cfi_cmdset_0002.c:1798:(.xiptext+0x106b): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: ddebug_i=
ncrement_call_count
   drivers/mtd/chips/cfi_cmdset_0002.c:1798:(.xiptext+0x1087): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: __dynami=
c_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:1798:(.xiptext+0x1096): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: dump_sta=
ck
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   drivers/mtd/chips/cfi_cmdset_0002.c:2521:(.xiptext+0x11e2): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: mutex_lo=
ck_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2522:(.xiptext+0x11f0): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: (.text+0=
xe48)
   drivers/mtd/chips/cfi_cmdset_0002.c:2524:(.xiptext+0x11fe): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: mutex_un=
lock
   drivers/mtd/chips/cfi_cmdset_0002.c:2528:(.xiptext+0x121b): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: ddebug_i=
ncrement_call_count
   drivers/mtd/chips/cfi_cmdset_0002.c:2528:(.xiptext+0x1236): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: __dynami=
c_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:2528:(.xiptext+0x1245): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: dump_sta=
ck
   drivers/mtd/chips/cfi_cmdset_0002.c:2533:(.xiptext+0x126b): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: (.text+0=
x1a04)
   drivers/mtd/chips/cfi_cmdset_0002.c:2536:(.xiptext+0x1290): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: cfi_send=
_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2537:(.xiptext+0x12a8): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: cfi_send=
_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2538:(.xiptext+0x12c0): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: cfi_send=
_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2539:(.xiptext+0x12d8): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: cfi_send=
_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2540:(.xiptext+0x12ee): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: cfi_send=
_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2557:(.xiptext+0x1347): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: __trace_=
set_current_state
   drivers/mtd/chips/cfi_cmdset_0002.c:2558:(.xiptext+0x1363): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: add_wait=
_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2559:(.xiptext+0x136b): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: mutex_un=
lock
   drivers/mtd/chips/cfi_cmdset_0002.c:2560:(.xiptext+0x1371): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.c:2561:(.xiptext+0x137e): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: remove_w=
ait_queue
   drivers/mtd/chips/cfi_cmdset_0002.c:2562:(.xiptext+0x138a): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: mutex_lo=
ck_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2573:(.xiptext+0x13c2): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: (.text+0=
x9e4)
   drivers/mtd/chips/cfi_cmdset_0002.c:2579:(.xiptext+0x13dc): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.c:2591:(.xiptext+0x13ff): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: cfi_buil=
d_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2603:(.xiptext+0x1454): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: (.text+0=
xd4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2604:(.xiptext+0x145c): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: mutex_un=
lock
   drivers/mtd/chips/cfi_cmdset_0002.c:2606:(.xiptext+0x1472): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: __stack_=
chk_fail
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2030:(.xiptext+0x1528): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: mutex_lo=
ck_nested
   drivers/mtd/chips/cfi_cmdset_0002.c:2031:(.xiptext+0x1536): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: (.text+0=
xe48)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_load':
   include/linux/mtd/map.h:338:(.xiptext+0x15a3): dangerous relocation: win=
dowed longcall crosses 1GB boundary; return may fail: memcpy
   include/linux/mtd/map.h:338:(.xiptext+0x15ac): dangerous relocation: win=
dowed longcall crosses 1GB boundary; return may fail: (.text.unlikely+0x78)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2039:(.xiptext+0x15d7): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: ddebug_i=
ncrement_call_count
   drivers/mtd/chips/cfi_cmdset_0002.c:2039:(.xiptext+0x15ef): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: __dynami=
c_pr_debug
   drivers/mtd/chips/cfi_cmdset_0002.c:2039:(.xiptext+0x15fb): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: dump_sta=
ck
   drivers/mtd/chips/cfi_cmdset_0002.c:2044:(.xiptext+0x161e): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: (.text+0=
x1a04)
   drivers/mtd/chips/cfi_cmdset_0002.c:2046:(.xiptext+0x163a): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: cfi_send=
_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2047:(.xiptext+0x1652): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: cfi_send=
_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2050:(.xiptext+0x1660): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: cfi_buil=
d_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2056:(.xiptext+0x1697): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: cfi_buil=
d_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_load':
   include/linux/mtd/map.h:338:(.xiptext+0x172e): dangerous relocation: win=
dowed longcall crosses 1GB boundary; return may fail: memcpy
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   drivers/mtd/chips/cfi_cmdset_0002.c:2071:(.xiptext+0x1780): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: cfi_buil=
d_cmd
   drivers/mtd/chips/cfi_cmdset_0002.c:2086:(.xiptext+0x17eb): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: (.text+0=
xd4c)
   drivers/mtd/chips/cfi_cmdset_0002.c:2087:(.xiptext+0x17f3): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: mutex_un=
lock
   drivers/mtd/chips/cfi_cmdset_0002.c:2090:(.xiptext+0x1806): dangerous re=
location: windowed longcall crosses 1GB boundary; return may fail: __stack_=
chk_fail
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_otp_walk':
   drivers/mtd/chips/cfi_cmdset_0001.c:2391:(.text+0x1a2e): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x55c)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_lock':
   drivers/mtd/chips/cfi_cmdset_0001.c:2309:(.text+0x1e92): dangerous reloc=
ation: windowed longcall crosses 1GB boundary; return may fail: (.xiptext+0=
x680)
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `read_pri_intelext':
   drivers/mtd/chips/cfi_cmdset_0001.c:401:(.text+0x217e): dangerous reloca=
tion: windowed longcall crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `do_otp_write':

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PM_GENERIC_DOMAINS_OF
   Depends on [n]: PM_GENERIC_DOMAINS [=3Dy] && OF [=3Dn]
   Selected by [y]:
   - COMMON_CLK_MT8173_MFGTOP [=3Dy] && COMMON_CLK [=3Dy] && (ARCH_MEDIATEK=
 || COMPILE_TEST [=3Dy]) && COMMON_CLK_MT8173 [=3Dy] && PM [=3Dy]


vim +2428 drivers/mtd/chips/cfi_cmdset_0002.c

30ec5a2cb17d78 Ira W. Snyder      2012-01-06  2403 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  2404 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  2405  /*
^1da177e4c3f41 Linus Torvalds     2005-04-16  2406   * Handle devices with =
one erase region, that only implement
^1da177e4c3f41 Linus Torvalds     2005-04-16  2407   * the chip erase comma=
nd.
^1da177e4c3f41 Linus Torvalds     2005-04-16  2408   */
02b15e343aeefb Todd Poynor        2005-06-07  2409  static int __xipram do_=
erase_chip(struct map_info *map, struct flchip *chip)
^1da177e4c3f41 Linus Torvalds     2005-04-16  2410  {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2411  	struct cfi_private *cf=
i =3D map->fldrv_priv;
2416a2e7be9b27 Colin Ian King     2024-02-15  2412  	unsigned long timeo;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2413  	unsigned long int adr;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2414  	DECLARE_WAITQUEUE(wait=
, current);
ea4f51356fd986 Sergei Shtylyov    2019-10-03  2415  	int ret;
45f75b8a919a42 Tokunori Ikegami   2018-05-30  2416  	int retry_cnt =3D 0;
083084df578a8b Tokunori Ikegami   2022-03-24  2417  	map_word datum =3D map=
_word_ff(map);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2418 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  2419  	adr =3D cfi->addr_unlo=
ck1;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2420 =20
c4e773764cead9 Stefani Seibold    2010-04-18  2421  	mutex_lock(&chip->mute=
x);
8a9485ff09088c Tokunori Ikegami   2019-08-22  2422  	ret =3D get_chip(map, =
chip, adr, FL_ERASING);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2423  	if (ret) {
c4e773764cead9 Stefani Seibold    2010-04-18  2424  		mutex_unlock(&chip->m=
utex);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2425  		return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2426  	}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2427 =20
289c05222172b5 Brian Norris       2011-07-19 @2428  	pr_debug("MTD %s(): ER=
ASE 0x%.8lx\n",
^1da177e4c3f41 Linus Torvalds     2005-04-16  2429  	       __func__, chip-=
>start);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2430 =20
02b15e343aeefb Todd Poynor        2005-06-07  2431  	XIP_INVAL_CACHED_RANGE=
(map, adr, map->size);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2432  	ENABLE_VPP(map);
02b15e343aeefb Todd Poynor        2005-06-07  2433  	xip_disable(map, chip,=
 adr);
02b15e343aeefb Todd Poynor        2005-06-07  2434 =20
45f75b8a919a42 Tokunori Ikegami   2018-05-30  2435   retry:
^1da177e4c3f41 Linus Torvalds     2005-04-16  2436  	cfi_send_gen_cmd(0xAA,=
 cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2437  	cfi_send_gen_cmd(0x55,=
 cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2438  	cfi_send_gen_cmd(0x80,=
 cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2439  	cfi_send_gen_cmd(0xAA,=
 cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2440  	cfi_send_gen_cmd(0x55,=
 cfi->addr_unlock2, chip->start, map, cfi, cfi->device_type, NULL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2441  	cfi_send_gen_cmd(0x10,=
 cfi->addr_unlock1, chip->start, map, cfi, cfi->device_type, NULL);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2442 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  2443  	chip->state =3D FL_ERA=
SING;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2444  	chip->erase_suspended =
=3D 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2445  	chip->in_progress_bloc=
k_addr =3D adr;
7b70eb14392a7c Joakim Tjernlund   2018-03-01  2446  	chip->in_progress_bloc=
k_mask =3D ~(map->size - 1);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2447 =20
02b15e343aeefb Todd Poynor        2005-06-07  2448  	INVALIDATE_CACHE_UDELA=
Y(map, chip,
02b15e343aeefb Todd Poynor        2005-06-07  2449  				adr, map->size,
02b15e343aeefb Todd Poynor        2005-06-07  2450  				chip->erase_time*50=
0);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2451 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  2452  	timeo =3D jiffies + (H=
Z*20);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2453 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  2454  	for (;;) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2455  		if (chip->state !=3D =
FL_ERASING) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2456  			/* Someone's suspend=
ed the erase. Sleep */
^1da177e4c3f41 Linus Torvalds     2005-04-16  2457  			set_current_state(TA=
SK_UNINTERRUPTIBLE);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2458  			add_wait_queue(&chip=
->wq, &wait);
c4e773764cead9 Stefani Seibold    2010-04-18  2459  			mutex_unlock(&chip->=
mutex);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2460  			schedule();
^1da177e4c3f41 Linus Torvalds     2005-04-16  2461  			remove_wait_queue(&c=
hip->wq, &wait);
c4e773764cead9 Stefani Seibold    2010-04-18  2462  			mutex_lock(&chip->mu=
tex);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2463  			continue;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2464  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2465  		if (chip->erase_suspe=
nded) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2466  			/* This erase was su=
spended and resumed.
^1da177e4c3f41 Linus Torvalds     2005-04-16  2467  			   Adjust the timeou=
t */
^1da177e4c3f41 Linus Torvalds     2005-04-16  2468  			timeo =3D jiffies + =
(HZ*20); /* FIXME */
^1da177e4c3f41 Linus Torvalds     2005-04-16  2469  			chip->erase_suspende=
d =3D 0;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2470  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2471 =20
083084df578a8b Tokunori Ikegami   2022-03-24  2472  		if (chip_ready(map, c=
hip, adr, &datum)) {
c15995695ea971 Sergei Shtylyov    2019-10-31  2473  			if (cfi_check_err_st=
atus(map, chip, adr))
c15995695ea971 Sergei Shtylyov    2019-10-31  2474  				ret =3D -EIO;
fb4a90bfcd6d86 Eric W. Biedermann 2005-05-20  2475  			break;
c15995695ea971 Sergei Shtylyov    2019-10-31  2476  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2477 =20
fb4a90bfcd6d86 Eric W. Biedermann 2005-05-20  2478  		if (time_after(jiffie=
s, timeo)) {
fb4a90bfcd6d86 Eric W. Biedermann 2005-05-20  2479  			printk(KERN_WARNING =
"MTD %s(): software timeout\n",
fb4a90bfcd6d86 Eric W. Biedermann 2005-05-20  2480  			       __func__);
79ca484b613041 Tokunori Ikegami   2018-05-30  2481  			ret =3D -EIO;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2482  			break;
fb4a90bfcd6d86 Eric W. Biedermann 2005-05-20  2483  		}
^1da177e4c3f41 Linus Torvalds     2005-04-16  2484 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  2485  		/* Latency issues. Dr=
op the lock, wait a while and retry */
02b15e343aeefb Todd Poynor        2005-06-07  2486  		UDELAY(map, chip, adr=
, 1000000/HZ);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2487  	}
fb4a90bfcd6d86 Eric W. Biedermann 2005-05-20  2488  	/* Did we succeed? */
79ca484b613041 Tokunori Ikegami   2018-05-30  2489  	if (ret) {
^1da177e4c3f41 Linus Torvalds     2005-04-16  2490  		/* reset on all failu=
res. */
^1da177e4c3f41 Linus Torvalds     2005-04-16  2491  		map_write(map, CMD(0x=
F0), chip->start);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2492  		/* FIXME - should hav=
e reset delay before continuing */
^1da177e4c3f41 Linus Torvalds     2005-04-16  2493 =20
79ca484b613041 Tokunori Ikegami   2018-05-30  2494  		if (++retry_cnt <=3D =
MAX_RETRIES) {
79ca484b613041 Tokunori Ikegami   2018-05-30  2495  			ret =3D 0;
45f75b8a919a42 Tokunori Ikegami   2018-05-30  2496  			goto retry;
79ca484b613041 Tokunori Ikegami   2018-05-30  2497  		}
fb4a90bfcd6d86 Eric W. Biedermann 2005-05-20  2498  	}
fb4a90bfcd6d86 Eric W. Biedermann 2005-05-20  2499 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  2500  	chip->state =3D FL_REA=
DY;
02b15e343aeefb Todd Poynor        2005-06-07  2501  	xip_enable(map, chip, =
adr);
e7d9377e0440c2 Paul Parsons       2012-03-07  2502  	DISABLE_VPP(map);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2503  	put_chip(map, chip, ad=
r);
c4e773764cead9 Stefani Seibold    2010-04-18  2504  	mutex_unlock(&chip->mu=
tex);
^1da177e4c3f41 Linus Torvalds     2005-04-16  2505 =20
^1da177e4c3f41 Linus Torvalds     2005-04-16  2506  	return ret;
^1da177e4c3f41 Linus Torvalds     2005-04-16  2507  }
^1da177e4c3f41 Linus Torvalds     2005-04-16  2508 =20

:::::: The code at line 2428 was first introduced by commit
:::::: 289c05222172b51401dbbb017115655f241d94ab mtd: replace DEBUG() with p=
r_debug()

:::::: TO: Brian Norris <computersforpeace@gmail.com>
:::::: CC: Artem Bityutskiy <artem.bityutskiy@intel.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
