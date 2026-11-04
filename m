Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793786401;
	b=MNh8X/AkqRu80NqE59pFc/ocXYZG8nkNwJi/VZOw8nJWvJdjuF5CREjkKisynCQdgSfp
	 O19SFBeemZUKBs9J8qtTbWqVp36IxKmAYAAJoRAuBGwX/8SKeLlAGSQMyuk3+vCAIhqKR
	 CwDFcjcS9bGbf6k0a0yYIDxJAKeUGI1GrO6Px3+w8TJRN07sWInx2rjdCBR6HjKVgysTX
	 ZsG3qbwnyELWonzK7AaNCWdTU3fatPr9+GU3AHQtksILduzE2dhsDkojG+X1I1V42Oxr0
	 rY92Cmlzt61Q4Vdsi91R6YpntUyvnJOP52WgXVZexERD5ugqmSGbag+0EppHJovWOGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793786401;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding;
	bh=3XVdew1sthCrv+LteahkhM4FaarcTuBwwtvnLMxdIAI=;
	b=YHdlTaWdKRXNgcbOpbiDxMOudoD65/c5FkoOufkzh1/F3B/zPWAs/a3K5+awHVP7FLdH
	 xKuTPjtv20TmCbDvBomVsWC/Gt7BzjRl052FIqn9IT5sIqQ8InIP8H/VfQogR3hK59I/Q
	 tev64yWZrneS6cpkOqtfARScDKo2elNM3fLQ1c8MzDr61+tKyKXv+iDdOnWu47zq//Nri
	 cDOsOVToFLdNqNVNz8aZmHIDlgfVanO4i7uyYoEgw+qnSxeAxI/8hdz0xitAKWa7BlHHX
	 vEbzymq9fPj33BZWLHTzkiTb5LHZ6USsuJpqijqoOkTB6zYRiEeOtFntIZcH2Hef9qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=llDxqdg7;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1833F606A328
	for <oe-kbuild@lists.linux.dev>; Wed,  4 Nov 2026 09:59:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1833F606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=llDxqdg7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793786400; x=1825322400;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=D5AJaJUSzRUKsSrmur33VBZFnNwvXRSdcarLiLTOo8c=;
  b=llDxqdg7BsuSzyUb5WckbigFT3EV0GQV3H+rbX/fvMLa16H2+x8DAKeq
   /S6TxPOdppqtA0qA2fNGwDeTcy/sHFc0N41/mtGTokmV8/IXbqhmuDS7F
   WSH32WYjiAMP2Yum2SzVvueORCi6tAnmtm18EA5h3DtFgiv82K45wftv5
   HmeKny0IWNALu7+7Qw9HVezfJfJ7MejIQBHSL7pM9VLe7DTcnXUkaLzgm
   0XoNjce8i8PKlfeEFtA6lxNN/iYeJhNviQU6VPFlovTYw/QsyPM7ICwRL
   K6MeaGADWRgrMicRNGdNm4lQUFHObvJtWEMsePrw9jkrIZLUpPNYoZoHX
   A==;
X-CSE-ConnectionGUID: dNu6lDhOR/me7woXsO3u2A==
X-CSE-MsgGUID: U4rsrxPMRrq+6pimqsDquA==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2569932"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2569932"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 01:59:59 -0800
X-CSE-ConnectionGUID: lxF/19CcRGmdAYD49fyrWQ==
X-CSE-MsgGUID: pbKB7u54QBG/G8pDeNwX2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="8548122"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 04 Nov 2026 01:59:58 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xOXme-00000000kCF-2CJD;
	Wed, 04 Nov 2026 09:59:56 +0000
Date: Wed, 4 Nov 2026 17:59:06 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH v1 1/1] iio: light: opt4001: Re-use generic struct
 s32_fract
Message-ID: <202611041701.VQtOdR6b-lkp@intel.com>
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
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <20261023090802.1957593-1-andriy.shevchenko@linux.intel.com>
References: <20261023090802.1957593-1-andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
TO: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
TO: Nikhil Gautam <nikhilgtr@gmail.com>
TO: linux-iio@vger.kernel.org
TO: linux-kernel@vger.kernel.org
CC: David Lechner <dlechner@baylibre.com>
CC: "Nuno Sá" <nuno.sa@analog.com>
CC: Jesper X Nilsson <jesper.x.nilsson@axis.com>

Hi Andy,

kernel test robot noticed the following build errors:

[auto build test ERROR on jic23-iio/togreg]
[also build test ERROR on linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andy-Shevchenko/iio-light-opt4001-Re-use-generic-struct-s32_fract/20261023-110802
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jic23/iio.git togreg
patch link:    https://lore.kernel.org/r/20261023090802.1957593-1-andriy.shevchenko%40linux.intel.com
patch subject: [PATCH v1 1/1] iio: light: opt4001: Re-use generic struct s32_fract
:::::: branch date: 12 days ago
:::::: commit date: 12 days ago
config: sh-allyesconfig (https://download.01.org/0day-ci/archive/20261104/202611041701.VQtOdR6b-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261104/202611041701.VQtOdR6b-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202611041701.VQtOdR6b-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iio/light/opt4001.c:90:9: error: expected expression before ',' token
      90 |         ,ratio = { .numerator = 4375, .denominator = 10000000 },
         |         ^
   drivers/iio/light/opt4001.c:95:9: error: expected expression before ',' token
      95 |         ,ratio = { .numerator = 3125, .denominator = 10000000 },
         |         ^


vim +90 drivers/iio/light/opt4001.c

9a9608418292bb8 Stefan Windfeldt-Prytz 2023-04-26  88  
9a9608418292bb8 Stefan Windfeldt-Prytz 2023-04-26  89  static const struct opt4001_chip_info opt4001_sot_5x3_info = {
5cbb86a31163ae0 Andy Shevchenko        2026-10-23 @90  	,ratio = { .numerator = 4375, .denominator = 10000000 },
9a9608418292bb8 Stefan Windfeldt-Prytz 2023-04-26  91  	.name = "opt4001-sot-5x3"
9a9608418292bb8 Stefan Windfeldt-Prytz 2023-04-26  92  };
9a9608418292bb8 Stefan Windfeldt-Prytz 2023-04-26  93  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
