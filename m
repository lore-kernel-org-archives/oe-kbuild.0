Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9101F20EC
	for <oe-kbuild@lists.linux.dev>; Sun, 26 Feb 2023 12:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677414479; x=1708950479;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p4uxMfxqKiz5R7c7pAkmHVn8jj6s0I6tZS4WxExsNGw=;
  b=eDoLMTkBF80uQVZ/rZUns8WBZ3oe1TC6b+v4OOdnfjThKH9E/YHljFQP
   H1tuk1l8fUk8wmI1uKsvxNfHOBv5kxiEHmrQ1fqcjvfGfVOm6G8W4gzhx
   Zjxuzo8yfj0wSLJ/REyxTjnADGfdk9kaTv8TSY3dirxF1ADN1JMwSISwq
   Tj7JjzpRWtf6pfHz8jj+sPMcVerhczZBj1n8iA3HEF/4IMrYgxWWQx2xK
   rHpJGFnpUrf3pRY6nua642apDYlQEeOE5U2chxHKQnq3d0XwvvTcmy2Uo
   OxfqXvd+KUN72BI0aKD34DbIFt+q9azI1FwF/JQS6dVuMYuEofZhh+b18
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="333749275"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="333749275"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2023 04:27:58 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="762328956"
X-IronPort-AV: E=Sophos;i="5.97,329,1669104000"; 
   d="scan'208";a="762328956"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 26 Feb 2023 04:27:57 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pWG8D-0003kB-04;
	Sun, 26 Feb 2023 12:27:57 +0000
Date: Sun, 26 Feb 2023 20:27:37 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/earlycon.c:178 efi_earlycon_write() error:
 potentially dereferencing uninitialized 's'.
Message-ID: <202302262047.z95WyxLH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Ard Biesheuvel <ardb@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2fcd07b7ccd5fd10b2120d298363e4e6c53ccf9c
commit: b7a1cd243839cc1459fbc83a7a62e3b57f29f497 efi/earlycon: Replace open coded strnchrnul()
date:   7 weeks ago
:::::: branch date: 8 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230226/202302262047.z95WyxLH-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302262047.z95WyxLH-lkp@intel.com/

smatch warnings:
drivers/firmware/efi/earlycon.c:178 efi_earlycon_write() error: potentially dereferencing uninitialized 's'.

vim +/s +178 drivers/firmware/efi/earlycon.c

69c1f396f25b80 Ard Biesheuvel  2019-02-02  134  
69c1f396f25b80 Ard Biesheuvel  2019-02-02  135  static void
69c1f396f25b80 Ard Biesheuvel  2019-02-02  136  efi_earlycon_write(struct console *con, const char *str, unsigned int num)
69c1f396f25b80 Ard Biesheuvel  2019-02-02  137  {
69c1f396f25b80 Ard Biesheuvel  2019-02-02  138  	struct screen_info *si;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  139  	unsigned int len;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  140  	const char *s;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  141  	void *dst;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  142  
69c1f396f25b80 Ard Biesheuvel  2019-02-02  143  	si = &screen_info;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  144  	len = si->lfb_linelength;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  145  
69c1f396f25b80 Ard Biesheuvel  2019-02-02  146  	while (num) {
b7a1cd243839cc Andy Shevchenko 2022-12-09  147  		unsigned int linemax = (si->lfb_width - efi_x) / font->width;
b7a1cd243839cc Andy Shevchenko 2022-12-09  148  		unsigned int h, count;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  149  
b7a1cd243839cc Andy Shevchenko 2022-12-09  150  		count = strnchrnul(str, num, '\n') - str;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  151  		if (count > linemax)
69c1f396f25b80 Ard Biesheuvel  2019-02-02  152  			count = linemax;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  153  
69c1f396f25b80 Ard Biesheuvel  2019-02-02  154  		for (h = 0; h < font->height; h++) {
69c1f396f25b80 Ard Biesheuvel  2019-02-02  155  			unsigned int n, x;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  156  
69c1f396f25b80 Ard Biesheuvel  2019-02-02  157  			dst = efi_earlycon_map((efi_y + h) * len, len);
69c1f396f25b80 Ard Biesheuvel  2019-02-02  158  			if (!dst)
69c1f396f25b80 Ard Biesheuvel  2019-02-02  159  				return;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  160  
69c1f396f25b80 Ard Biesheuvel  2019-02-02  161  			s = str;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  162  			n = count;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  163  			x = efi_x;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  164  
69c1f396f25b80 Ard Biesheuvel  2019-02-02  165  			while (n-- > 0) {
69c1f396f25b80 Ard Biesheuvel  2019-02-02  166  				efi_earlycon_write_char(dst + x*4, *s, h);
69c1f396f25b80 Ard Biesheuvel  2019-02-02  167  				x += font->width;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  168  				s++;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  169  			}
69c1f396f25b80 Ard Biesheuvel  2019-02-02  170  
69c1f396f25b80 Ard Biesheuvel  2019-02-02  171  			efi_earlycon_unmap(dst, len);
69c1f396f25b80 Ard Biesheuvel  2019-02-02  172  		}
69c1f396f25b80 Ard Biesheuvel  2019-02-02  173  
69c1f396f25b80 Ard Biesheuvel  2019-02-02  174  		num -= count;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  175  		efi_x += count * font->width;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  176  		str += count;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  177  
69c1f396f25b80 Ard Biesheuvel  2019-02-02 @178  		if (num > 0 && *s == '\n') {
69c1f396f25b80 Ard Biesheuvel  2019-02-02  179  			efi_x = 0;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  180  			efi_y += font->height;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  181  			str++;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  182  			num--;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  183  		}
69c1f396f25b80 Ard Biesheuvel  2019-02-02  184  
69c1f396f25b80 Ard Biesheuvel  2019-02-02  185  		if (efi_x + font->width > si->lfb_width) {
69c1f396f25b80 Ard Biesheuvel  2019-02-02  186  			efi_x = 0;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  187  			efi_y += font->height;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  188  		}
69c1f396f25b80 Ard Biesheuvel  2019-02-02  189  
69c1f396f25b80 Ard Biesheuvel  2019-02-02  190  		if (efi_y + font->height > si->lfb_height) {
69c1f396f25b80 Ard Biesheuvel  2019-02-02  191  			u32 i;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  192  
69c1f396f25b80 Ard Biesheuvel  2019-02-02  193  			efi_y -= font->height;
69c1f396f25b80 Ard Biesheuvel  2019-02-02  194  			efi_earlycon_scroll_up();
69c1f396f25b80 Ard Biesheuvel  2019-02-02  195  
69c1f396f25b80 Ard Biesheuvel  2019-02-02  196  			for (i = 0; i < font->height; i++)
69c1f396f25b80 Ard Biesheuvel  2019-02-02  197  				efi_earlycon_clear_scanline(efi_y + i);
69c1f396f25b80 Ard Biesheuvel  2019-02-02  198  		}
69c1f396f25b80 Ard Biesheuvel  2019-02-02  199  	}
69c1f396f25b80 Ard Biesheuvel  2019-02-02  200  }
69c1f396f25b80 Ard Biesheuvel  2019-02-02  201  

:::::: The code at line 178 was first introduced by commit
:::::: 69c1f396f25b805aeff08f06d2e992c315ee5b1e efi/x86: Convert x86 EFI earlyprintk into generic earlycon implementation

:::::: TO: Ard Biesheuvel <ard.biesheuvel@linaro.org>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
