Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035BC1C02
	for <oe-kbuild@lists.linux.dev>; Tue, 18 Apr 2023 15:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681831564; x=1713367564;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yU+mtEw9hF5OAcUkWP9h/w0iZ4hgHiBq3lmi0i53jBE=;
  b=SETHsl88HyNisJ+9WecJfdeHmo7Jhfzod/oZ47rTvOKpZva/CAuZ5Jwl
   Z96pbHhohj7hD3bGgnZpDPz/Q6QcFFBWnfn748bYeO/cebkkfDFHcePE6
   UamxkiIo2KZNp+mnrACq0hkaunit8RnZbnp8ZaWC1hBv/Tv1rDPhEiSYO
   /ilYs51ErIy52HPal5g8xWch32L+X/TuPSpnjl6s/RYWQZdNHixPMb39d
   3KiHaSqp2f03DvpnxN+/XnuG2jq+ZixRm5rWXYU86NiL9MolLPgEmIMru
   vPbDhk4rhxFL35F1AnKcAcf5Yr8Fp5OPU/2zKWvfTH6LBL/iIG7SFf5p/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="431488244"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="431488244"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Apr 2023 08:25:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10684"; a="815250417"
X-IronPort-AV: E=Sophos;i="5.99,207,1677571200"; 
   d="scan'208";a="815250417"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 18 Apr 2023 08:25:53 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ponDM-000dfz-0L;
	Tue, 18 Apr 2023 15:25:52 +0000
Date: Tue, 18 Apr 2023 23:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [hverkuil-media-tree:saa7146-clean 218/218]
 drivers/staging/media/av7110/av7110_v4l.c:616 av7110_vbi_reset() warn:
 ignoring unreachable code.
Message-ID: <202304182327.ZUETtPKO-lkp@intel.com>
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
TO: Hans Verkuil <hverkuil@xs4all.nl>

tree:   git://linuxtv.org/hverkuil/media_tree.git saa7146-clean
head:   2e2bb011da69df51b7792a197fd655c88e4eb0fd
commit: 2e2bb011da69df51b7792a197fd655c88e4eb0fd [218/218] staging: media: av7110: fix VBI output support
:::::: branch date: 6 days ago
:::::: commit date: 6 days ago
config: openrisc-randconfig-m031-20230416 (https://download.01.org/0day-ci/archive/20230418/202304182327.ZUETtPKO-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304182327.ZUETtPKO-lkp@intel.com/

smatch warnings:
drivers/staging/media/av7110/av7110_v4l.c:616 av7110_vbi_reset() warn: ignoring unreachable code.

vim +616 drivers/staging/media/av7110/av7110_v4l.c

^1da177e4c3f41 drivers/media/dvb/ttpci/av7110_v4l.c      Linus Torvalds  2005-04-16  609  
bec43661b1dc00 drivers/media/dvb/ttpci/av7110_v4l.c      Hans Verkuil    2008-12-30  610  static int av7110_vbi_reset(struct file *file)
5b0fa4fff17d94 drivers/media/dvb/ttpci/av7110_v4l.c      Oliver Endriss  2006-01-09  611  {
49f5c13b21823c drivers/staging/media/av7110/av7110_v4l.c Hans Verkuil    2023-03-01  612  	struct saa7146_dev *dev = video_drvdata(file);
5b0fa4fff17d94 drivers/media/dvb/ttpci/av7110_v4l.c      Oliver Endriss  2006-01-09  613  	struct av7110 *av7110 = (struct av7110*) dev->ext_priv;
5b0fa4fff17d94 drivers/media/dvb/ttpci/av7110_v4l.c      Oliver Endriss  2006-01-09  614  
2e2bb011da69df drivers/staging/media/av7110/av7110_v4l.c Hans Verkuil    2023-03-22  615  	return 0;
3ca7fc84e37c5c drivers/media/dvb/ttpci/av7110_v4l.c      Harvey Harrison 2008-04-08 @616  	dprintk(2, "%s\n", __func__);
5b0fa4fff17d94 drivers/media/dvb/ttpci/av7110_v4l.c      Oliver Endriss  2006-01-09  617  	av7110->wssMode = 0;
5b0fa4fff17d94 drivers/media/dvb/ttpci/av7110_v4l.c      Oliver Endriss  2006-01-09  618  	av7110->wssData = 0;
5b0fa4fff17d94 drivers/media/dvb/ttpci/av7110_v4l.c      Oliver Endriss  2006-01-09  619  	if (FW_VERSION(av7110->arm_app) < 0x2623)
5b0fa4fff17d94 drivers/media/dvb/ttpci/av7110_v4l.c      Oliver Endriss  2006-01-09  620  		return 0;
5b0fa4fff17d94 drivers/media/dvb/ttpci/av7110_v4l.c      Oliver Endriss  2006-01-09  621  	else
5b0fa4fff17d94 drivers/media/dvb/ttpci/av7110_v4l.c      Oliver Endriss  2006-01-09  622  		return av7110_fw_cmd(av7110, COMTYPE_ENCODER, SetWSSConfig, 1, 0);
5b0fa4fff17d94 drivers/media/dvb/ttpci/av7110_v4l.c      Oliver Endriss  2006-01-09  623  }
5b0fa4fff17d94 drivers/media/dvb/ttpci/av7110_v4l.c      Oliver Endriss  2006-01-09  624  

:::::: The code at line 616 was first introduced by commit
:::::: 3ca7fc84e37c5cf446fe4137f885f74e71373d7f V4L/DVB (7515): media/dvb/ttpci replace remaining __FUNCTION__ occurrences

:::::: TO: Harvey Harrison <harvey.harrison@gmail.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
