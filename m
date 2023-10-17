Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068CC10E9
	for <oe-kbuild@lists.linux.dev>; Tue, 17 Oct 2023 01:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MbYhJTiG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697504491; x=1729040491;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=iRdn7jIkWvOyjWWIh0uIa33SieZNkqQUv+mm41wnFSU=;
  b=MbYhJTiGbFYgXDl7Z7GiOFxRpxsbqworoS/1Ky+E6qbir4Hq9KNCcqDk
   /UsF1j0jQb2sw7iF2hGuFCpod4M6XE3m1TCvIG/IdGFgUHeqr95qy5gBE
   bzZaj6CghzaThKCEEOXAAqdx4OHRP5tQjyKrUbsD0sn2bYr3dXsDS76c+
   vy/UoZRN1fpko3/35+UWPIgPq3gysLbBONJsRRZHuqOe332DzCXnryyEL
   /TqeCqKZNm+WSN+mcBJNiJtlOOFr5ZoQp9EjwvgC0Oc7IM+R5NB/YJQXU
   32sVNINS54VtyIAp8xYpX7Jzz9dIsqcWf4n73mo47WRIYT6lA7PyxuFOH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="7239127"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="7239127"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 18:01:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="879628366"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="879628366"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 16 Oct 2023 18:01:19 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qsYSS-0008nd-1l;
	Tue, 17 Oct 2023 01:01:16 +0000
Date: Tue, 17 Oct 2023 09:01:00 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com
Subject: [linux-next:master 10253/11192]
 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: sparse: sparse: too
 long token expansion
Message-ID: <202310170837.PatMKfBi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

:::::: 
:::::: Manual check reason: "low confidence static check first_new_problem: drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: sparse: sparse: too long token expansion"
:::::: 

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: David Laight <David.Laight@ACULAB.COM>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4d0515b235dec789578d135a5db586b25c5870cb
commit: 8c4eff8c0106706bfe559cbd9c7c00e7cdf2f025 [10253/11192] minmax: allow min()/max()/clamp() if the arguments have the same signedness.
:::::: branch date: 20 hours ago
:::::: commit date: 10 days ago
config: i386-randconfig-062-20231017 (https://download.01.org/0day-ci/archive/20231017/202310170837.PatMKfBi-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310170837.PatMKfBi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/r/202310170837.PatMKfBi-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c:468:30: sparse: sparse: too long token expansion
--
>> drivers/media/pci/solo6x10/solo6x10-core.c:362:24: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-core.c:362:24: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-core.c:362:24: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-core.c:362:24: sparse: sparse: too long token expansion
--
>> drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-p2m.c:309:13: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-p2m.c:310:17: sparse: sparse: too long token expansion
--
>> drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: sparse: sparse: too long token expansion
>> drivers/media/pci/solo6x10/solo6x10-enc.c:245:18: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: sparse: sparse: too long token expansion
   drivers/media/pci/solo6x10/solo6x10-enc.c:270:24: sparse: sparse: too long token expansion

vim +468 drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c

4a61ad3c4a2c8b drivers/staging/media/solo6x10/solo6x10-v4l2-enc.c Krzysztof Hałasa        2013-09-12  448  
382c31a94330a9 drivers/staging/media/solo6x10/v4l2-enc.c          Hans Verkuil            2013-03-15  449  static int solo_fill_jpeg(struct solo_enc_dev *solo_enc,
4a61ad3c4a2c8b drivers/staging/media/solo6x10/solo6x10-v4l2-enc.c Krzysztof Hałasa        2013-09-12  450  			  struct vb2_buffer *vb, const vop_header *vh)
c55564fdf79379 drivers/staging/solo6x10/solo6010-v4l2-enc.c       Krzysztof Hałasa        2011-02-11  451  {
2d7007153f0c9b drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     Junghak Sung            2015-09-22  452  	struct vb2_v4l2_buffer *vbuf = to_vb2_v4l2_buffer(vb);
dcae5dacbce518 drivers/staging/media/solo6x10/v4l2-enc.c          Hans Verkuil            2013-03-25  453  	struct solo_dev *solo_dev = solo_enc->solo_dev;
2d7007153f0c9b drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     Junghak Sung            2015-09-22  454  	struct sg_table *sgt = vb2_dma_sg_plane_desc(vb, 0);
dcae5dacbce518 drivers/staging/media/solo6x10/v4l2-enc.c          Hans Verkuil            2013-03-25  455  	int frame_size;
c55564fdf79379 drivers/staging/solo6x10/solo6010-v4l2-enc.c       Krzysztof Hałasa        2011-02-11  456  
2d7007153f0c9b drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     Junghak Sung            2015-09-22  457  	vbuf->flags |= V4L2_BUF_FLAG_KEYFRAME;
c55564fdf79379 drivers/staging/solo6x10/solo6010-v4l2-enc.c       Krzysztof Hałasa        2011-02-11  458  
4a61ad3c4a2c8b drivers/staging/media/solo6x10/solo6x10-v4l2-enc.c Krzysztof Hałasa        2013-09-12  459  	if (vb2_plane_size(vb, 0) < vop_jpeg_size(vh) + solo_enc->jpeg_len)
dcae5dacbce518 drivers/staging/media/solo6x10/v4l2-enc.c          Hans Verkuil            2013-03-25  460  		return -EIO;
c55564fdf79379 drivers/staging/solo6x10/solo6010-v4l2-enc.c       Krzysztof Hałasa        2011-02-11  461  
0cb6dfd710b008 drivers/staging/media/solo6x10/solo6x10-v4l2-enc.c Andreea-Cristina Bernat 2014-03-16  462  	frame_size = ALIGN(vop_jpeg_size(vh) + solo_enc->jpeg_len, DMA_ALIGN);
4a61ad3c4a2c8b drivers/staging/media/solo6x10/solo6x10-v4l2-enc.c Krzysztof Hałasa        2013-09-12  463  	vb2_set_plane_payload(vb, 0, vop_jpeg_size(vh) + solo_enc->jpeg_len);
c55564fdf79379 drivers/staging/solo6x10/solo6010-v4l2-enc.c       Krzysztof Hałasa        2011-02-11  464  
2d7007153f0c9b drivers/media/pci/solo6x10/solo6x10-v4l2-enc.c     Junghak Sung            2015-09-22  465  	return solo_send_desc(solo_enc, solo_enc->jpeg_len, sgt,
4a61ad3c4a2c8b drivers/staging/media/solo6x10/solo6x10-v4l2-enc.c Krzysztof Hałasa        2013-09-12  466  			     vop_jpeg_offset(vh) - SOLO_JPEG_EXT_ADDR(solo_dev),
dcae5dacbce518 drivers/staging/media/solo6x10/v4l2-enc.c          Hans Verkuil            2013-03-25  467  			     frame_size, SOLO_JPEG_EXT_ADDR(solo_dev),
dcae5dacbce518 drivers/staging/media/solo6x10/v4l2-enc.c          Hans Verkuil            2013-03-25 @468  			     SOLO_JPEG_EXT_SIZE(solo_dev));
908113d8ebd26f drivers/staging/solo6x10/solo6010-v4l2-enc.c       Krzysztof Hałasa        2011-02-11  469  }
908113d8ebd26f drivers/staging/solo6x10/solo6010-v4l2-enc.c       Krzysztof Hałasa        2011-02-11  470  

:::::: The code at line 468 was first introduced by commit
:::::: dcae5dacbce518513abf7776cb450b7bd95d722b [media] solo6x10: sync to latest code from Bluecherry's git repo

:::::: TO: Hans Verkuil <hans.verkuil@cisco.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
