Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF668826
	for <oe-kbuild@lists.linux.dev>; Sat,  4 Nov 2023 06:45:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GZlF+hxv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699080357; x=1730616357;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tQ8grSSRYm2L7EzAM0+YCT+Joo5DVRUn/X8Mf2l87fE=;
  b=GZlF+hxvC4jxxB3qVisA5STVxkBMRTXW1zP+qxunuCP39rUKzKwrEBey
   R+bUZCWlJn9GFYHX+y5C/d7lWOX8T6np9oGGz4FzJORABVQHXoO1M0Ulj
   JOZA3n+xETuaS/KNYmqYC2g/bZFLOCAqwA1wkSS0HmgqtUMrpPAjQUilr
   CUGBZA1JVltD9Ynqy8ZqDIvnVCl5oExCJWTdWxx7LbiTwakY2YXc71knp
   PUghNRPWitfugcXAXRuAt1wYkCMgjVYu8s+8mXdBlIF6ARVqDB0P3u02j
   RP0PhG3/0v1/UnvJSu/WYBpgg+Vdr2vAt4QinvC6bVq9IUwI630eXyGVf
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="388890174"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="388890174"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 23:45:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="761826611"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="761826611"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Nov 2023 23:45:55 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzAPp-0003Zg-1o;
	Sat, 04 Nov 2023 06:45:53 +0000
Date: Sat, 4 Nov 2023 14:44:42 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/firmware/efi/earlycon.c:178 efi_earlycon_write() error:
 potentially dereferencing uninitialized 's'.
Message-ID: <202311041422.GVJSFjzN-lkp@intel.com>
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
head:   90b0c2b2edd1adff742c621e246562fbefa11b70
commit: b7a1cd243839cc1459fbc83a7a62e3b57f29f497 efi/earlycon: Replace open coded strnchrnul()
date:   10 months ago
:::::: branch date: 82 minutes ago
:::::: commit date: 10 months ago
config: x86_64-randconfig-161-20231102 (https://download.01.org/0day-ci/archive/20231104/202311041422.GVJSFjzN-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20231104/202311041422.GVJSFjzN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202311041422.GVJSFjzN-lkp@intel.com/

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
https://github.com/intel/lkp-tests/wiki
