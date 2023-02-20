Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58E47E8
	for <oe-kbuild@lists.linux.dev>; Mon, 20 Feb 2023 02:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676861696; x=1708397696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DGn6h47Pp2u1rKb07pgO3QHltrb6n/kV0gsrk7Cc9Aw=;
  b=BhybXzKAIhm/62qz01pQr+Xjl6JJDhw0YOZPcPrI/nHuVS1arp2yv/C0
   ITmIkrGIuF6yXz1mQFk7JcOKLoSUEguTwwzK4dXVQYtnQvEL+2xeOPGjO
   I364cFKeNsMz7OAzWTDoFEWWWHCINV4r0SaVpiVtdkdRkdnpAEACVl6iu
   evPjvSygxgovOTTcUu2yEnkYN7JzOG0nYZVDMjz/69B0agD6DryNMN58c
   p+x1nr/UVDJO3QZmy4aHACUaZGbAYYF5W5foTsdtYylKDMeGJdOQHDDNC
   VJp1w0mBboCUOwoud2a5kF8diV67BSS+S9RnHI36EXRJNqQkdjeav/wgQ
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="333671627"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="333671627"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2023 18:54:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10626"; a="760013554"
X-IronPort-AV: E=Sophos;i="5.97,311,1669104000"; 
   d="scan'208";a="760013554"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 19 Feb 2023 18:54:54 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pTwKM-000DZl-06;
	Mon, 20 Feb 2023 02:54:54 +0000
Date: Mon, 20 Feb 2023 10:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: drivers/gpu/drm/i915/i915_user_extensions.c:54
 i915_user_extensions() warn: check for integer overflow 'next'
Message-ID: <202302201023.gS2DdNbh-lkp@intel.com>
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
TO: Kees Cook <keescook@chromium.org>
CC: "Gwan-gyeong Mun" <gwan-gyeong.mun@intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c9c3395d5e3dcc6daee66c6908354d47bf98cb0c
commit: 4b21d25bf519c9487935a664886956bb18f04f6d overflow: Introduce overflows_type() and castable_to_type()
date:   4 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 4 months ago
config: x86_64-randconfig-m001-20230213 (https://download.01.org/0day-ci/archive/20230220/202302201023.gS2DdNbh-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302201023.gS2DdNbh-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/i915/i915_user_extensions.c:54 i915_user_extensions() warn: check for integer overflow 'next'

vim +/next +54 drivers/gpu/drm/i915/i915_user_extensions.c

9d1305ef80b95d Chris Wilson 2019-03-22  15  
9d1305ef80b95d Chris Wilson 2019-03-22  16  int i915_user_extensions(struct i915_user_extension __user *ext,
9d1305ef80b95d Chris Wilson 2019-03-22  17  			 const i915_user_extension_fn *tbl,
9d1305ef80b95d Chris Wilson 2019-03-22  18  			 unsigned int count,
9d1305ef80b95d Chris Wilson 2019-03-22  19  			 void *data)
9d1305ef80b95d Chris Wilson 2019-03-22  20  {
9d1305ef80b95d Chris Wilson 2019-03-22  21  	unsigned int stackdepth = 512;
9d1305ef80b95d Chris Wilson 2019-03-22  22  
9d1305ef80b95d Chris Wilson 2019-03-22  23  	while (ext) {
9d1305ef80b95d Chris Wilson 2019-03-22  24  		int i, err;
9d1305ef80b95d Chris Wilson 2019-03-22  25  		u32 name;
9d1305ef80b95d Chris Wilson 2019-03-22  26  		u64 next;
9d1305ef80b95d Chris Wilson 2019-03-22  27  
9d1305ef80b95d Chris Wilson 2019-03-22  28  		if (!stackdepth--) /* recursion vs useful flexibility */
9d1305ef80b95d Chris Wilson 2019-03-22  29  			return -E2BIG;
9d1305ef80b95d Chris Wilson 2019-03-22  30  
9d1305ef80b95d Chris Wilson 2019-03-22  31  		err = check_user_mbz(&ext->flags);
9d1305ef80b95d Chris Wilson 2019-03-22  32  		if (err)
9d1305ef80b95d Chris Wilson 2019-03-22  33  			return err;
9d1305ef80b95d Chris Wilson 2019-03-22  34  
9d1305ef80b95d Chris Wilson 2019-03-22  35  		for (i = 0; i < ARRAY_SIZE(ext->rsvd); i++) {
9d1305ef80b95d Chris Wilson 2019-03-22  36  			err = check_user_mbz(&ext->rsvd[i]);
9d1305ef80b95d Chris Wilson 2019-03-22  37  			if (err)
9d1305ef80b95d Chris Wilson 2019-03-22  38  				return err;
9d1305ef80b95d Chris Wilson 2019-03-22  39  		}
9d1305ef80b95d Chris Wilson 2019-03-22  40  
9d1305ef80b95d Chris Wilson 2019-03-22  41  		if (get_user(name, &ext->name))
9d1305ef80b95d Chris Wilson 2019-03-22  42  			return -EFAULT;
9d1305ef80b95d Chris Wilson 2019-03-22  43  
9d1305ef80b95d Chris Wilson 2019-03-22  44  		err = -EINVAL;
9d1305ef80b95d Chris Wilson 2019-03-22  45  		if (name < count) {
9d1305ef80b95d Chris Wilson 2019-03-22  46  			name = array_index_nospec(name, count);
9d1305ef80b95d Chris Wilson 2019-03-22  47  			if (tbl[name])
9d1305ef80b95d Chris Wilson 2019-03-22  48  				err = tbl[name](ext, data);
9d1305ef80b95d Chris Wilson 2019-03-22  49  		}
9d1305ef80b95d Chris Wilson 2019-03-22  50  		if (err)
9d1305ef80b95d Chris Wilson 2019-03-22  51  			return err;
9d1305ef80b95d Chris Wilson 2019-03-22  52  
9d1305ef80b95d Chris Wilson 2019-03-22  53  		if (get_user(next, &ext->next_extension) ||
4b21d25bf519c9 Kees Cook    2022-10-24 @54  		    overflows_type(next, uintptr_t))

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
