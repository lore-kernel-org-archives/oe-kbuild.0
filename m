Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792874866;
	b=C/y7pZ5w9P1DDQ4BLHqxDssKqYizIwcYBlHVXy3L9RSL8+Dmx+B5cHaV5w++IXqPituo
	 ApXbFF4TK33aM3SYWQ2HTPeuww+76lUyMZK9hxNAQukzvoPZ0h0eGR56VGgZrAMgxktl7
	 HFhFJpwTPKKHbZGSkNecE8qUNpk9HrXA+rzpKTiV7eJE9GVEx28jvyIY6IyQ9PZiHlL0a
	 v23dOkHclRs2cuV+Yr6uW3kk6apCb5lVbRaH9F0BjWEedkGd7bXHlHreSx25YidAvqjR6
	 516yMXJMgay+/NKnA/T2Y6kpXJQgj3obb3EBYPBi5YvdmMrJQEl3qvQSZH0+tPIYYZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792874866;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=X3WcpNlTEhTetNlpEV65ConrIOzzrEb5oeg47kyf9u4=;
	b=VgM9KQoTfxORcV+O8uSMMn35PzsWr0eRlv66EUBUVQgmRuU7d40iyF32eklN8I9jANp+
	 07B/qCbS/FuxonAVCe+aUXzv0ldlwDt654HR8BTBoijlieNQ+AQm8nBX/oOZAcvu2ll34
	 GG2EUlBjpflqixasU3n2icuxTxV4f/CnePmxcfWOivA1sA7pAipLdWkHAdQq9TLz/xOht
	 vJo++yYBzOaY9JxGSLB4PbK8e3gPbMMc9n3X4ocB5s0Gr4HCUT6gDgBGnlGyG9W6gAHNK
	 TgXaTcXDBiAOEevstOoT0P9+oQOoN/cTVgdzldqBoGPg6jFXih6j5JdRIr1LlCIWh+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I9IoBCWe;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010AF606A31A
	for <oe-kbuild@lists.linux.dev>; Sat, 24 Oct 2026 20:47:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 010AF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=I9IoBCWe
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792874865; x=1824410865;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zjuh0+UWX3TQQ4TR1/9yWDZnxC/pNuxlKj5KBeIj/xY=;
  b=I9IoBCWe+01wyMxncACcxnCwskUtjUoJv74Wh5UuDwzEPhT2NpS+2RFI
   Gxom65zJPk5ASITz+7mMJlZpzgCXZFqSYSonM2M4TxxgV20aBaX+taXVT
   RHJ4kzAQI5Opu+II04c1GIf5ZYpLhEaVF9zgHQefXQqwMVPoTHEVqqtpb
   448g3C/lHDFj9I0xkyyYPkkvWGdwThqe0goJLDoc4c1WOCzbUSLhhXOmF
   eLZzPZN7r9t7Qw97AnENyfbOaNOc1eQAZyfr4Yhijl7YXky+gu09XSRK2
   aFwlEo+uNT0O2DRWHKSz1cZuysAWgrxf6X7S5+3mpkavZTiXI+F5PxAao
   w==;
X-CSE-ConnectionGUID: dkYqTYrtTWqHOrfo/6pIyg==
X-CSE-MsgGUID: JJuQVJKwSR+ZYbxsOoqhuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11945"; a="1620929"
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="1620929"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Oct 2026 13:47:44 -0700
X-CSE-ConnectionGUID: Ry6Qftn+RtK50XbhazgJvA==
X-CSE-MsgGUID: ltEDPcxQSgywNEefUjnXwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,176,1787036400"; 
   d="scan'208";a="3802043"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 24 Oct 2026 13:47:43 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKieT-00000000UF4-0SKh;
	Sat, 24 Oct 2026 20:47:41 +0000
Date: Sun, 25 Oct 2026 04:47:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v2 1/3] Move struct cpu_feature to <linux/cpufeature.h>
Message-ID: <202610250424.sRkI58av-lkp@intel.com>
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Post: <mailto:oe-kbuild@lists.linux.dev>
List-Help: <mailto:oe-kbuild+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "linux-review patch is more than 7 days old, verify it wasn't already superseded"
:::::: 

BCC: lkp@intel.com
CC: llvm@lists.linux.dev
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <bc9fbf5784f6788e10c749a05d56c42bdb68f3d9.1792144769.git.u.kleine-koenig@baylibre.com>
References: <bc9fbf5784f6788e10c749a05d56c42bdb68f3d9.1792144769.git.u.kleine-koenig@baylibre.com>
TO: "Uwe Kleine-König (The Capable Hub)" <u.kleine-koenig@baylibre.com>
TO: Nathan Chancellor <nathan@kernel.org>
CC: Tianrui Zhao <zhaotianrui@loongson.cn>
CC: Bibo Mao <maobibo@loongson.cn>
CC: Huacai Chen <chenhuacai@kernel.org>
CC: WANG Xuerui <kernel@xen0n.name>
CC: Nicolas Schier <nsc@kernel.org>
CC: Armin Wolf <W_Armin@gmx.de>
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Takashi Sakamoto <o-takashi@sakamocchi.jp>
CC: Heiner Kallweit <hkallweit1@gmail.com>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Raag Jadav <raag.jadav@intel.com>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: Jose Javier Rodriguez Barbarin <dev-josejavier.rodriguez@duagon.com>
CC: Andy Shevchenko <andriy.shevchenko@intel.com>
CC: Ingo Molnar <mingo@kernel.org>
CC: Josh Poimboeuf <jpoimboe@kernel.org>
CC: "Ilpo Järvinen" <ilpo.jarvinen@linux.intel.com>
CC: Hasan Basbunar <basbunarhasan@gmail.com>
CC: kvm@vger.kernel.org
CC: loongarch@lists.linux.dev
CC: linux-kernel@vger.kernel.org
CC: linux-kbuild@vger.kernel.org

Hi Uwe,

kernel test robot noticed the following build errors:

[auto build test ERROR on 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907]

url:    https://github.com/intel-lab-lkp/linux/commits/Uwe-Kleine-K-nig-The-Capable-Hub/Move-struct-cpu_feature-to-linux-cpufeature-h/20261016-120912
base:   24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
patch link:    https://lore.kernel.org/r/bc9fbf5784f6788e10c749a05d56c42bdb68f3d9.1792144769.git.u.kleine-koenig%40baylibre.com
patch subject: [PATCH v2 1/3] Move struct cpu_feature to <linux/cpufeature.h>
:::::: branch date: 8 days ago
:::::: commit date: 8 days ago
config: s390-defconfig (https://download.01.org/0day-ci/archive/20261025/202610250424.sRkI58av-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261025/202610250424.sRkI58av-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202610250424.sRkI58av-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/s390/crypto/pkey_cca.c:22:45: error: array has incomplete element type 'struct ap_device_id'
      22 | static struct ap_device_id pkey_cca_card_ids[] = {
         |                                             ^
   drivers/s390/crypto/ap_bus.h:158:9: note: forward declaration of 'struct ap_device_id'
     158 |         struct ap_device_id *ids;
         |                ^
   1 error generated.
--
>> drivers/s390/crypto/pkey_ep11.c:23:46: error: array has incomplete element type 'struct ap_device_id'
      23 | static struct ap_device_id pkey_ep11_card_ids[] = {
         |                                              ^
   drivers/s390/crypto/ap_bus.h:158:9: note: forward declaration of 'struct ap_device_id'
     158 |         struct ap_device_id *ids;
         |                ^
   1 error generated.


vim +22 drivers/s390/crypto/pkey_cca.c

8fcc231ce3bea1 Harald Freudenberger 2024-08-22  20  
8fcc231ce3bea1 Harald Freudenberger 2024-08-22  21  #if IS_MODULE(CONFIG_PKEY_CCA)
8fcc231ce3bea1 Harald Freudenberger 2024-08-22 @22  static struct ap_device_id pkey_cca_card_ids[] = {
8fcc231ce3bea1 Harald Freudenberger 2024-08-22  23  	{ .dev_type = AP_DEVICE_TYPE_CEX4 },
8fcc231ce3bea1 Harald Freudenberger 2024-08-22  24  	{ .dev_type = AP_DEVICE_TYPE_CEX5 },
8fcc231ce3bea1 Harald Freudenberger 2024-08-22  25  	{ .dev_type = AP_DEVICE_TYPE_CEX6 },
8fcc231ce3bea1 Harald Freudenberger 2024-08-22  26  	{ .dev_type = AP_DEVICE_TYPE_CEX7 },
8fcc231ce3bea1 Harald Freudenberger 2024-08-22  27  	{ .dev_type = AP_DEVICE_TYPE_CEX8 },
8fcc231ce3bea1 Harald Freudenberger 2024-08-22  28  	{ /* end of list */ },
8fcc231ce3bea1 Harald Freudenberger 2024-08-22  29  };
8fcc231ce3bea1 Harald Freudenberger 2024-08-22  30  MODULE_DEVICE_TABLE(ap, pkey_cca_card_ids);
8fcc231ce3bea1 Harald Freudenberger 2024-08-22  31  #endif
8fcc231ce3bea1 Harald Freudenberger 2024-08-22  32  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
