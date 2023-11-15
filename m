Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADD128E1F
	for <oe-kbuild@lists.linux.dev>; Wed, 15 Nov 2023 16:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S3SraXjT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700064292; x=1731600292;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tNtgbQc0iaZSpzxwWh3UFE9wyoCJDYCkIsVd8kt7ves=;
  b=S3SraXjTVxp1U5kFooIOJPNkX3D3bwYu1kQS3TDdzuQ9slrRsH9x3pQc
   a5c4DdgWxCUnbRDzUebHW4ms4dVw76WypycBORIw+3q9D8vkdtIVIv2XA
   mrW+3o6nq+oJp/c4O3yQlrd8ByEes+CTqKlT6o7G87iKfHQmbHa0LiIRL
   DX12lQPHMpXC9PGzhragGJtFaQhPiEQUBJ4WkX+TrXYn++M31HzDd++iG
   +8Pf9RX0n2E+dX41fV5cvB66aWpsKYktrHBPAegAyOgSw1nP+SHf3SKL0
   46pCjloPOKZ5M8zdBz/ZEP+zfbvHBeqeAtDdBYURIvyyqzMBmiAQqKBHg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="389752785"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="389752785"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Nov 2023 08:04:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10895"; a="1096483487"
X-IronPort-AV: E=Sophos;i="6.03,305,1694761200"; 
   d="scan'208";a="1096483487"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 15 Nov 2023 08:04:51 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r3INk-0000XA-36;
	Wed, 15 Nov 2023 16:04:48 +0000
Date: Thu, 16 Nov 2023 00:03:36 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: drivers/gpu/drm/loongson/lsdc_plane.c:268:42: sparse: sparse:
 self-comparison always evaluates to false
Message-ID: <202311152357.4KFS0M8f-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

:::::: 
:::::: Manual check reason: "low confidence static check warning: drivers/gpu/drm/loongson/lsdc_plane.c:268:42: sparse: sparse: self-comparison always evaluates to false"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Sui Jingfeng <suijingfeng@loongson.cn>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   c42d9eeef8e5ba9292eda36fd8e3c11f35ee065c
commit: f39db26c54281da6a785259498ca74b5e470476f drm: Add kms driver for loongson display controller
date:   4 months ago
:::::: branch date: 11 hours ago
:::::: commit date: 4 months ago
config: loongarch-randconfig-r111-20231115 (https://download.01.org/0day-ci/archive/20231115/202311152357.4KFS0M8f-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231115/202311152357.4KFS0M8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202311152357.4KFS0M8f-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/loongson/lsdc_plane.c:268:42: sparse: sparse: self-comparison always evaluates to false

vim +268 drivers/gpu/drm/loongson/lsdc_plane.c

f39db26c54281d Sui Jingfeng 2023-06-15  225  
f39db26c54281d Sui Jingfeng 2023-06-15  226  static void lsdc_cursor_plane_atomic_async_update(struct drm_plane *plane,
f39db26c54281d Sui Jingfeng 2023-06-15  227  						  struct drm_atomic_state *state)
f39db26c54281d Sui Jingfeng 2023-06-15  228  {
f39db26c54281d Sui Jingfeng 2023-06-15  229  	struct lsdc_cursor *cursor = to_lsdc_cursor(plane);
f39db26c54281d Sui Jingfeng 2023-06-15  230  	const struct lsdc_cursor_plane_ops *ops = cursor->ops;
f39db26c54281d Sui Jingfeng 2023-06-15  231  	struct drm_framebuffer *old_fb = plane->state->fb;
f39db26c54281d Sui Jingfeng 2023-06-15  232  	struct drm_framebuffer *new_fb;
f39db26c54281d Sui Jingfeng 2023-06-15  233  	struct drm_plane_state *new_state;
f39db26c54281d Sui Jingfeng 2023-06-15  234  
f39db26c54281d Sui Jingfeng 2023-06-15  235  	new_state = drm_atomic_get_new_plane_state(state, plane);
f39db26c54281d Sui Jingfeng 2023-06-15  236  
f39db26c54281d Sui Jingfeng 2023-06-15  237  	new_fb = plane->state->fb;
f39db26c54281d Sui Jingfeng 2023-06-15  238  
f39db26c54281d Sui Jingfeng 2023-06-15  239  	plane->state->crtc_x = new_state->crtc_x;
f39db26c54281d Sui Jingfeng 2023-06-15  240  	plane->state->crtc_y = new_state->crtc_y;
f39db26c54281d Sui Jingfeng 2023-06-15  241  	plane->state->crtc_h = new_state->crtc_h;
f39db26c54281d Sui Jingfeng 2023-06-15  242  	plane->state->crtc_w = new_state->crtc_w;
f39db26c54281d Sui Jingfeng 2023-06-15  243  	plane->state->src_x = new_state->src_x;
f39db26c54281d Sui Jingfeng 2023-06-15  244  	plane->state->src_y = new_state->src_y;
f39db26c54281d Sui Jingfeng 2023-06-15  245  	plane->state->src_h = new_state->src_h;
f39db26c54281d Sui Jingfeng 2023-06-15  246  	plane->state->src_w = new_state->src_w;
f39db26c54281d Sui Jingfeng 2023-06-15  247  	swap(plane->state->fb, new_state->fb);
f39db26c54281d Sui Jingfeng 2023-06-15  248  
f39db26c54281d Sui Jingfeng 2023-06-15  249  	if (new_state->visible) {
f39db26c54281d Sui Jingfeng 2023-06-15  250  		enum lsdc_cursor_size cursor_size;
f39db26c54281d Sui Jingfeng 2023-06-15  251  
f39db26c54281d Sui Jingfeng 2023-06-15  252  		switch (new_state->crtc_w) {
f39db26c54281d Sui Jingfeng 2023-06-15  253  		case 64:
f39db26c54281d Sui Jingfeng 2023-06-15  254  			cursor_size = CURSOR_SIZE_64X64;
f39db26c54281d Sui Jingfeng 2023-06-15  255  			break;
f39db26c54281d Sui Jingfeng 2023-06-15  256  		case 32:
f39db26c54281d Sui Jingfeng 2023-06-15  257  			cursor_size = CURSOR_SIZE_32X32;
f39db26c54281d Sui Jingfeng 2023-06-15  258  			break;
f39db26c54281d Sui Jingfeng 2023-06-15  259  		default:
f39db26c54281d Sui Jingfeng 2023-06-15  260  			cursor_size = CURSOR_SIZE_32X32;
f39db26c54281d Sui Jingfeng 2023-06-15  261  			break;
f39db26c54281d Sui Jingfeng 2023-06-15  262  		}
f39db26c54281d Sui Jingfeng 2023-06-15  263  
f39db26c54281d Sui Jingfeng 2023-06-15  264  		ops->update_position(cursor, new_state->crtc_x, new_state->crtc_y);
f39db26c54281d Sui Jingfeng 2023-06-15  265  
f39db26c54281d Sui Jingfeng 2023-06-15  266  		ops->update_cfg(cursor, cursor_size, CURSOR_FORMAT_ARGB8888);
f39db26c54281d Sui Jingfeng 2023-06-15  267  
f39db26c54281d Sui Jingfeng 2023-06-15 @268  		if (!old_fb || old_fb != new_fb)
f39db26c54281d Sui Jingfeng 2023-06-15  269  			ops->update_bo_addr(cursor, lsdc_fb_base_addr(new_fb));
f39db26c54281d Sui Jingfeng 2023-06-15  270  	}
f39db26c54281d Sui Jingfeng 2023-06-15  271  }
f39db26c54281d Sui Jingfeng 2023-06-15  272  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
