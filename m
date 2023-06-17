Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 159A7EC8
	for <oe-kbuild@lists.linux.dev>; Sat, 17 Jun 2023 21:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687037994; x=1718573994;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m9uRY7NPDR3fxOmcxc8+IhVfYsdVYCR8NP+q+6GAw5Y=;
  b=gTAsG80VLdcvlHYzl1YWipwzZiWfmbK8LLTeNgKXTBp5DCRVHfVVZoe+
   BeaZNzSjrV206yqekRozSvyQNHm1gqKcslJ3HQAkRd05NbJDuwtWFTPQz
   el5qImyZv0+xmwazeEsK4VbUAHZOIRWr+CAXmDBh5afdykd4HMbj83B+T
   4x95x4vL1HtRma8zKaJHERfUI3S3mq/AEp4iaWzWXsj3wrbbBmM+aNz3E
   /5/VfjOeYshs6198NSy1WQkO3pIhQrF+IHTJ9FQYAyYVDw0WcHZNbXaZa
   ZK4roO9VFIT+cUKKJsNGsA1hQG8Z72JZpLIQa5/GwLDjYJsSEsPvPgCsq
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="425371848"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="425371848"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2023 14:39:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10744"; a="1043464800"
X-IronPort-AV: E=Sophos;i="6.00,251,1681196400"; 
   d="scan'208";a="1043464800"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 17 Jun 2023 14:39:51 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qAdeB-00037y-0S;
	Sat, 17 Jun 2023 21:39:51 +0000
Date: Sun, 18 Jun 2023 05:39:08 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [linux-next:master 6872/10546]
 drivers/staging/media/atomisp/pci/atomisp_fops.c:532 atomisp_open() warn:
 missing unwind goto?
Message-ID: <202306180511.XWN0Hr7F-lkp@intel.com>
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
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Hans de Goede <hdegoede@redhat.com>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media@vger.kernel.org
CC: Andy Shevchenko <andy.shevchenko@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f7efed9f38f886edb450041b82a6f15d663c98f8
commit: 347f2e56b94e1ed197daa6697b22af049a82157d [6872/10546] media: atomisp: Simplify atomisp_open() and atomisp_release()
:::::: branch date: 2 days ago
:::::: commit date: 8 days ago
config: i386-randconfig-m021-20230618 (https://download.01.org/0day-ci/archive/20230618/202306180511.XWN0Hr7F-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230618/202306180511.XWN0Hr7F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202306180511.XWN0Hr7F-lkp@intel.com/

smatch warnings:
drivers/staging/media/atomisp/pci/atomisp_fops.c:532 atomisp_open() warn: missing unwind goto?

vim +532 drivers/staging/media/atomisp/pci/atomisp_fops.c

ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  501  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  502  static int atomisp_open(struct file *file)
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  503  {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  504  	struct video_device *vdev = video_devdata(file);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  505  	struct atomisp_device *isp = video_get_drvdata(vdev);
af69562a28faa5 drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-08-28  506  	struct atomisp_video_pipe *pipe = atomisp_to_video_pipe(vdev);
af69562a28faa5 drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-08-28  507  	struct atomisp_sub_device *asd = pipe->asd;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  508  	int ret;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  509  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  510  	dev_dbg(isp->dev, "open device %s\n", vdev->name);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  511  
821e6f16125a0e drivers/staging/media/atomisp/pci/atomisp_fops.c          Mauro Carvalho Chehab 2021-11-05  512  	ret = v4l2_fh_open(file);
ba6856aab1a7ed drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-08-29  513  	if (ret)
821e6f16125a0e drivers/staging/media/atomisp/pci/atomisp_fops.c          Mauro Carvalho Chehab 2021-11-05  514  		return ret;
59a27d5c98f7f6 drivers/staging/media/atomisp/pci/atomisp_fops.c          Alan                  2017-11-06  515  
f10fc1790d5ecd drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-09-02  516  	mutex_lock(&isp->mutex);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  517  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  518  	asd->subdev.devnode = vdev;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  519  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  520  	if (!isp->input_cnt) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  521  		dev_err(isp->dev, "no camera attached\n");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  522  		ret = -EINVAL;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  523  		goto error;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  524  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  525  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  526  	/*
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  527  	 * atomisp does not allow multiple open
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  528  	 */
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  529  	if (pipe->users) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  530  		dev_dbg(isp->dev, "video node already opened\n");
f10fc1790d5ecd drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-09-02  531  		mutex_unlock(&isp->mutex);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19 @532  		return -EBUSY;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  533  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  534  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  535  	/* runtime power management, turn on ISP */
deb9119f807abd drivers/staging/media/atomisp/pci/atomisp_fops.c          Mauro Carvalho Chehab 2021-04-23  536  	ret = pm_runtime_resume_and_get(vdev->v4l2_dev->dev);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  537  	if (ret < 0) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  538  		dev_err(isp->dev, "Failed to power on device\n");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  539  		goto error;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  540  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  541  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  542  	atomisp_dev_init_struct(isp);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  543  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  544  	ret = v4l2_subdev_call(isp->flash, core, s_power, 1);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  545  	if (ret < 0 && ret != -ENODEV && ret != -ENOIOCTLCMD) {
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  546  		dev_err(isp->dev, "Failed to power-on flash\n");
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  547  		goto css_error;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  548  	}
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  549  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  550  	atomisp_subdev_init_struct(asd);
60ec70a71a9f99 drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-12-28  551  	/* Ensure that a mode is set */
60ec70a71a9f99 drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-12-28  552  	v4l2_ctrl_s_ctrl(asd->run_mode, pipe->default_run_mode);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  553  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  554  	pipe->users++;
f10fc1790d5ecd drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-09-02  555  	mutex_unlock(&isp->mutex);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  556  	return 0;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  557  
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  558  css_error:
deb9119f807abd drivers/staging/media/atomisp/pci/atomisp_fops.c          Mauro Carvalho Chehab 2021-04-23  559  	pm_runtime_put(vdev->v4l2_dev->dev);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  560  error:
f10fc1790d5ecd drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-09-02  561  	mutex_unlock(&isp->mutex);
5b9853ad1329be drivers/staging/media/atomisp/pci/atomisp_fops.c          Hans de Goede         2022-08-29  562  	v4l2_fh_release(file);
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  563  	return ret;
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  564  }
ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_fops.c Mauro Carvalho Chehab 2020-04-19  565  

:::::: The code at line 532 was first introduced by commit
:::::: ad85094b293e40e7a2f831b0311a389d952ebd5e Revert "media: staging: atomisp: Remove driver"

:::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
:::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
