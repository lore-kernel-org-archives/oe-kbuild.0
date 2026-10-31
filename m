Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793465852;
	b=3Sl++qX1J0t+NLqrZ6dssln6HEx8AT9URKF0nK2D+Te6SLwWwaODrCYpgrJ+TIdPbCqT
	 X7SzuA6cu47J5JsYghj5RTZNXUaZ9LPB6ievhfAbK2MdVVk0zJZsTfUHbB3RDFB4S3DLM
	 ZHuMRkNr3OstHWBiDZFxnYX937DInxinUPWXvhCrXUcYCVjpt7Iz3vUE+TpKWITUelknG
	 B2GVB69IINmH70m4q7600jH3r8bK8SvexMu2zy5JjHFTuYE6f3cannWFHbDD0LY1EWzBW
	 efKIiN0H5fthbjYYCMZ5/m/F2i1XRkmyy1TwAwZ4joJ/2D/5IYvDiDFJNDM5I4z4OFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793465852;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=9UeCFy2S1+538QEQUeINI011qgN2O60x33CQ0LjlJps=;
	b=XEiz/51MrQXUOrTDkpEHVWpVCpBIj9YEY5yPxnVZ4x+jDvdJkNUs4ppUEQd+tkTFEX+X
	 DEDk0wsC7/IpqSW7moTgnqkfpyS0oYHS4EkOLduFHECBvEQAqVDT/GUSZV1DWmmpgfXap
	 baIRQ4OXJ7QHZ/DWLqmts9e1Tw0I29objzrogfFGnCwGhSBC7sNmwVmYaO6D6/oUdYVfp
	 6uWMk7OcKlRYBpxAjUqLhFA+0Eqvj10ZpfQZO1N/pPOFQ+GnId/5Kc4rdtDihnGKNTSqX
	 6duvLUZ3uOEZuz6UNUT5ceahsoHK3iIx+Z1k5NnBTSlHAt36zUKbrvZcmrC4kQXgDIg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C7dP6gDR;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2153606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 31 Oct 2026 16:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2153606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=C7dP6gDR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793465850; x=1825001850;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=+lUmqwHymy0rTmKl+maB24dljmnRhh1wSzaD8iFbj20=;
  b=C7dP6gDRpEw5ZgI775fwI8VRgLRY10FRdIJjc+c7EcnoMV56v/9+xnOh
   zxcC9T1fuSnoGedkltDqpHzN5dKjTDLb8GY5ge8tTuTS15gdHSQYzwjpt
   ubfhzJtww8CsosuPjQFep724SzJIKCpMMvRi9w6jJDz/9CaWegfp+JTXO
   fBF8IidBzW8H0I0QHVjOKST+J9FGAu62V6Pl1ZApGooaT4NDP16c4HUNb
   H2TQeq9rU1vB/h6wNReyf2XTRK84wKVd5+/uvp+BLdTGQMjX8t6rScbo2
   dKN6DdHBPfE0jFjnx2U3i0MygQzumBxDeNQPN8zKeSpMuM791HCrInH0B
   A==;
X-CSE-ConnectionGUID: bxF94CC6RSKml9iZbY8QVQ==
X-CSE-MsgGUID: NbRwhvmRTty/S5eIWuqhGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11952"; a="2239629"
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="2239629"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2026 09:57:29 -0700
X-CSE-ConnectionGUID: 7cu4AoD6TsaWhx0XHZmMeQ==
X-CSE-MsgGUID: C8SI7blTRjC0F6OYBgzTsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,188,1787036400"; 
   d="scan'208";a="6036315"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 31 Oct 2026 09:57:27 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNCOT-0000000063b-1AzK;
	Sat, 31 Oct 2026 16:57:25 +0000
Date: Sat, 31 Oct 2026 17:56:51 +0100
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [jimc:dd-classmaps-v12-rc 39/43]
 cfi_cmdset_0002.c:(.xiptext+0x6ca): dangerous relocation: windowed longcall
 crosses 1GB boundary; return may fail: ddebug_increment_call_count
Message-ID: <202610311738.qmDXSHa0-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
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

tree:   https://github.com/jimc/linux.git dd-classmaps-v12-rc
head:   e6525fac6e53ecd991fc089758433c576ab95010
commit: 15beea509a3e68a9104c05510c002e272cfe1070 [39/43] dyndbg: add +c fla=
g to count pr_debug calls without printing
:::::: branch date: 3 weeks ago
:::::: commit date: 3 weeks ago
config: xtensa-randconfig-r2104-20261031 (https://download.01.org/0day-ci/a=
rchive/20261031/202610311738.qmDXSHa0-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 9.5.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20261031/202610311738.qmDXSHa0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610311738.qmDXSHa0-lkp@intel.com/

All errors (new ones prefixed by >>):

   cfi_probe.c:(.xiptext+0x3cc): dangerous relocation: windowed longcall cr=
osses 1GB boundary; return may fail: trace_hardirqs_on
   drivers/mtd/chips/cfi_probe.o: in function `cfi_probe_chip':
   cfi_probe.c:(.xiptext+0x439): dangerous relocation: windowed longcall cr=
osses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x44b): dangerous relocation: windowed longcall cr=
osses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x475): dangerous relocation: windowed longcall cr=
osses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x487): dangerous relocation: windowed longcall cr=
osses 1GB boundary; return may fail: _printk
   cfi_probe.c:(.xiptext+0x4da): dangerous relocation: windowed longcall cr=
osses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_probe.c:(.xiptext+0x4f6): dangerous relocation: windowed longcall cr=
osses 1GB boundary; return may fail: _printk
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_secsi_read':
   cfi_cmdset_0002.c:(.text+0xcbf): dangerous relocation: windowed longcall=
 crosses 1GB boundary; return may fail: (.xiptext+0x248)
   cfi_cmdset_0002.c:(.text+0xcf2): dangerous relocation: windowed longcall=
 crosses 1GB boundary; return may fail: (.xiptext+0x248)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `map_word_load.isra.0':
   cfi_cmdset_0002.c:(.text+0xe53): dangerous relocation: windowed longcall=
 crosses 1GB boundary; return may fail: (.xiptext+0x248)
   cfi_cmdset_0002.c:(.text+0xe6e): dangerous relocation: windowed longcall=
 crosses 1GB boundary; return may fail: (.xiptext+0x248)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_panic_write=
':
   cfi_cmdset_0002.c:(.text+0x1233): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_cmdset_0002':
   cfi_cmdset_0002.c:(.text+0x170f): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0x248)
   cfi_cmdset_0002.c:(.text+0x17bf): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0x248)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_destroy':
   cfi_cmdset_0002.c:(.text+0x1d13): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: cfi_qry_mode_on
   cfi_cmdset_0002.c:(.text+0x1d2b): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: cfi_qry_mode_off
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `fwh_xxlock_oneblock':
   cfi_cmdset_0002.c:(.text+0x20bc): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0x824)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_otp_walk.is=
ra.0':
   cfi_cmdset_0002.c:(.text+0x221e): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0x824)
   cfi_cmdset_0002.c:(.text+0x227b): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0x824)
   cfi_cmdset_0002.c:(.text+0x2376): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0x824)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_otp_write':
   cfi_cmdset_0002.c:(.text+0x25d0): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0x248)
   cfi_cmdset_0002.c:(.text+0x25fe): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0x2c)
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `cfi_amdstd_write_words=
':
   cfi_cmdset_0002.c:(.text+0x2696): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0x8b0)
   cfi_cmdset_0002.c:(.text+0x2778): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0xb70)
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0x32): dangerous relocatio=
n: windowed longcall crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o:(.xiptext+0x4f): dangerous relocatio=
n: windowed longcall crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_udelay':
   cfi_cmdset_0002.c:(.xiptext+0xa3): dangerous relocation: windowed longca=
ll crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xee): dangerous relocation: windowed longca=
ll crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x104): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x123): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x13f): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x147): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x14d): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x15b): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x163): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x17b): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: trace_hardirqs_off
   cfi_cmdset_0002.c:(.xiptext+0x192): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x82c)
   cfi_cmdset_0002.c:(.xiptext+0x1ff): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x218): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0002.c:(.xiptext+0x226): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x23a): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __stack_chk_fail
   cfi_cmdset_0002.c:(.xiptext+0x24e): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x264): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: .text
   cfi_cmdset_0002.c:(.xiptext+0x277): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_ready.isra.0':
   cfi_cmdset_0002.c:(.xiptext+0x292): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x2e6): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __stack_chk_fail
   cfi_cmdset_0002.c:(.xiptext+0x2f6): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x31e): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `chip_good':
   cfi_cmdset_0002.c:(.xiptext+0x336): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x34a): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x35f): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_reset.=
isra.0':
   cfi_cmdset_0002.c:(.xiptext+0x382): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x393): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __usecs_to_jiffies
   cfi_cmdset_0002.c:(.xiptext+0x3ae): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x3cf): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x3eb): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x3f6): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x3fc): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: schedule
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer_wait':
   cfi_cmdset_0002.c:(.xiptext+0x407): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x416): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x43e): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x45c): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0xb14)
   cfi_cmdset_0002.c:(.xiptext+0x486): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __stack_chk_fail
   cfi_cmdset_0002.c:(.xiptext+0x496): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x4b6): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x4d4): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: trace_hardirqs_on
   cfi_cmdset_0002.c:(.xiptext+0x4e4): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __stack_chk_fail
   cfi_cmdset_0002.c:(.xiptext+0x4fe): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x51e): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `xip_enable.isra.0':
   cfi_cmdset_0002.c:(.xiptext+0x532): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x547): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x57a): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0x59a): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0x5b6): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0x5c3): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x5c9): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0x5d4): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: remove_wait_queue
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_once':
   cfi_cmdset_0002.c:(.xiptext+0x5e3): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x612): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0x61e): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x15b8)
   cfi_cmdset_0002.c:(.xiptext+0x63c): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0xb14)
   cfi_cmdset_0002.c:(.xiptext+0x666): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __stack_chk_fail
   cfi_cmdset_0002.c:(.xiptext+0x68e): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _mcount
>> cfi_cmdset_0002.c:(.xiptext+0x6ca): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: ddebug_increment_call_count
   cfi_cmdset_0002.c:(.xiptext+0x6de): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x6ea): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0x70e): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x15b8)
   cfi_cmdset_0002.c:(.xiptext+0x737): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0x763): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __stack_chk_fail
   cfi_cmdset_0002.c:(.xiptext+0x77e): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_retry=
':
   cfi_cmdset_0002.c:(.xiptext+0x78a): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x798): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x16a0)
   cfi_cmdset_0002.c:(.xiptext+0x7a6): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x7bf): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x8f0)
   cfi_cmdset_0002.c:(.xiptext+0x7d6): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x7ec): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x940)
   cfi_cmdset_0002.c:(.xiptext+0x806): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x1614)
   cfi_cmdset_0002.c:(.xiptext+0x80f): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0x82a): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x847): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: ddebug_increment_call_count
   cfi_cmdset_0002.c:(.xiptext+0x85f): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x86b): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: dump_stack
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_start=
':
   cfi_cmdset_0002.c:(.xiptext+0x8b6): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0x8d4): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: memset
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword_done':
   cfi_cmdset_0002.c:(.xiptext+0x902): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0x910): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x16a0)
   cfi_cmdset_0002.c:(.xiptext+0x92f): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: ddebug_increment_call_count
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_oneword':
   cfi_cmdset_0002.c:(.xiptext+0x946): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0x952): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0x974): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x15b8)
   cfi_cmdset_0002.c:(.xiptext+0x990): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9a6): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9bb): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9d0): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9e4): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0x9fb): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_chip':
   cfi_cmdset_0002.c:(.xiptext+0xa4a): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0xa66): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xa6e): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xa74): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xa82): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xa8a): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xac2): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0xb14)
   cfi_cmdset_0002.c:(.xiptext+0xae2): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xb04): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xb42): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x1614)
   cfi_cmdset_0002.c:(.xiptext+0xb4a): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xb5a): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __stack_chk_fail
   cfi_cmdset_0002.c:(.xiptext+0xb76): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _mcount
   cfi_cmdset_0002.c:(.xiptext+0xb98): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xba6): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x16a0)
   cfi_cmdset_0002.c:(.xiptext+0xbba): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0xc00)
   cfi_cmdset_0002.c:(.xiptext+0xbd4): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: ddebug_increment_call_count
   cfi_cmdset_0002.c:(.xiptext+0xbee): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xbfa): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0xc1c): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x15b8)
   cfi_cmdset_0002.c:(.xiptext+0xc34): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc48): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc57): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc7b): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xc92): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0xc00)
   cfi_cmdset_0002.c:(.xiptext+0xcc4): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_build_cmd
   cfi_cmdset_0002.c:(.xiptext+0xd18): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x1614)
   cfi_cmdset_0002.c:(.xiptext+0xd20): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xd30): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __stack_chk_fail
   cfi_cmdset_0002.c:(.xiptext+0xd46): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _mcount
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_write_buffer':
   cfi_cmdset_0002.c:(.xiptext+0xd66): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: memset
   cfi_cmdset_0002.c:(.xiptext+0xd92): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xda2): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x16a0)
   cfi_cmdset_0002.c:(.xiptext+0xdc2): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: ddebug_increment_call_count
   cfi_cmdset_0002.c:(.xiptext+0xdda): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __dynamic_pr_debug
   cfi_cmdset_0002.c:(.xiptext+0xde6): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: dump_stack
   cfi_cmdset_0002.c:(.xiptext+0xe08): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x15b8)
   cfi_cmdset_0002.c:(.xiptext+0xe2a): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xe3e): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xe53): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xe68): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xe7c): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_send_gen_cmd
   cfi_cmdset_0002.c:(.xiptext+0xed6): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __trace_set_current_state
   cfi_cmdset_0002.c:(.xiptext+0xef2): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: add_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xefa): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xf00): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: schedule
   cfi_cmdset_0002.c:(.xiptext+0xf0e): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: remove_wait_queue
   cfi_cmdset_0002.c:(.xiptext+0xf16): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_lock
   cfi_cmdset_0002.c:(.xiptext+0xf4e): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0xb14)
   cfi_cmdset_0002.c:(.xiptext+0xf6e): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: _printk
   cfi_cmdset_0002.c:(.xiptext+0xf90): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: cfi_build_cmd
   drivers/mtd/chips/cfi_cmdset_0002.o: in function `do_erase_oneblock':
   cfi_cmdset_0002.c:(.xiptext+0xfca): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: (.text+0x1614)
   cfi_cmdset_0002.c:(.xiptext+0xfd2): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: mutex_unlock
   cfi_cmdset_0002.c:(.xiptext+0xfe2): dangerous relocation: windowed longc=
all crosses 1GB boundary; return may fail: __stack_chk_fail
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_intelext_setup':
   cfi_cmdset_0001.c:(.text+0x17e0): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: cfi_read_pri
   drivers/mtd/chips/cfi_cmdset_0001.o: in function `cfi_cmdset_0001':
   cfi_cmdset_0001.c:(.text+0x1bc0): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0x360)
   cfi_cmdset_0001.c:(.text+0x1cde): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0xbb0)
   cfi_cmdset_0001.c:(.text+0x1d7b): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0xbb0)
   cfi_cmdset_0001.c:(.text+0x1de3): dangerous relocation: windowed longcal=
l crosses 1GB boundary; return may fail: (.xiptext+0xbb0)

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
