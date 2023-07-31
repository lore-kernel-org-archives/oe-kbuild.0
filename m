Received: from mgamail.intel.com (unknown [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612BA1D31E
	for <oe-kbuild@lists.linux.dev>; Mon, 31 Jul 2023 20:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690834864; x=1722370864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kMVBKhojHKEyCMtEvizdIEYS7aCc0OX+tEXJaToodtw=;
  b=izExBWzxgdIEgBQoKP7n8kFK2WWFI7o2ffyaycz2zokZDqrilUctfu4M
   77IZTlEJGIFUcSQjDfzN8iW8wL75Hn5lk+g8aOgw/CdEt4uLJoTZO/2mZ
   PmvS3duij6R+B7bnIvU6tbdDuzqScI5LycRVJoTpSr8HIjV8vSQ+T6zYv
   +LkfSRACdHg8ZRChFGcsn1vg512ZstQrjIh7mnwXxweWYe0140MPOn9Wd
   5xhpOtThqvL742Uv3441k1BS6hSDFOG65goM4QFeP9sRlBsRQ5JUo3ihM
   1Rgx1D0IV2bhdcmcL8dPr2aB6Ljtr47Srpe756AZfSQh+KmOT36Kc3jKt
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="372740684"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="372740684"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2023 13:21:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10788"; a="705559515"
X-IronPort-AV: E=Sophos;i="6.01,245,1684825200"; 
   d="scan'208";a="705559515"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 31 Jul 2023 13:21:03 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qQZNz-0005Lx-1D;
	Mon, 31 Jul 2023 20:21:00 +0000
Date: Tue, 1 Aug 2023 04:20:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: Re: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the
 arguments have the same signedness.
Message-ID: <202308010438.RokDrRta-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/platform/x86/asus-wmi.c:1035:28: sparse: sparse: bad integer constant expression"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
In-Reply-To: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
References: <a09512c8526b46759669d0b879144563@AcuMS.aculab.com>
TO: David Laight <David.Laight@ACULAB.COM>
TO: "'linux-kernel@vger.kernel.org'" <linux-kernel@vger.kernel.org>
TO: "'Andy Shevchenko'" <andriy.shevchenko@linux.intel.com>
TO: "'Andrew Morton'" <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "'Matthew Wilcox (Oracle)'" <willy@infradead.org>
TO: "'Christoph Hellwig'" <hch@infradead.org>
TO: "'Jason A. Donenfeld'" <Jason@zx2c4.com>

Hi David,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master]
[cannot apply to next-20230725]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/David-Laight/minmax-Allow-min-max-clamp-if-the-arguments-have-the-same-signedness/20230725-204940
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/a09512c8526b46759669d0b879144563%40AcuMS.aculab.com
patch subject: [PATCH next resend 2/5] minmax: Allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: i386-randconfig-i063-20230730 (https://download.01.org/0day-ci/archive/20230801/202308010438.RokDrRta-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230801/202308010438.RokDrRta-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202308010438.RokDrRta-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/platform/x86/asus-wmi.c:1035:28: sparse: sparse: bad integer constant expression
>> drivers/platform/x86/asus-wmi.c:1035:28: sparse: sparse: static assertion failed: "clamp() low limit (typeof(value))(0) greater than high limit (typeof(value))(max_level)"

vim +1035 drivers/platform/x86/asus-wmi.c

e9809c0b967065 Corentin Chary  2011-07-01  1026  
dbb3d78f61bade Chris Chiu      2018-06-20  1027  static void do_kbd_led_set(struct led_classdev *led_cdev, int value)
e9809c0b967065 Corentin Chary  2011-07-01  1028  {
e9809c0b967065 Corentin Chary  2011-07-01  1029  	struct asus_wmi *asus;
dbb3d78f61bade Chris Chiu      2018-06-20  1030  	int max_level;
e9809c0b967065 Corentin Chary  2011-07-01  1031  
e9809c0b967065 Corentin Chary  2011-07-01  1032  	asus = container_of(led_cdev, struct asus_wmi, kbd_led);
dbb3d78f61bade Chris Chiu      2018-06-20  1033  	max_level = asus->kbd_led.max_brightness;
e9809c0b967065 Corentin Chary  2011-07-01  1034  
2275752004ab21 Andy Shevchenko 2019-08-16 @1035  	asus->kbd_led_wk = clamp_val(value, 0, max_level);
9fe44fc98ce45f Jian-Hong Pan   2018-09-27  1036  	kbd_led_update(asus);
e9809c0b967065 Corentin Chary  2011-07-01  1037  }
e9809c0b967065 Corentin Chary  2011-07-01  1038  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
