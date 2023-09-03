Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F77EC3
	for <oe-kbuild@lists.linux.dev>; Sun,  3 Sep 2023 05:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693718206; x=1725254206;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ITabKsEWX/dgm680gM6MOzMmR2VIaLWkR4TY7aMo+IA=;
  b=kDShoYkJe0drpGhUu2NjEPv9VRc2veoSO9rk0ntP1sfSU+b5yLh/n4+O
   MR/Y3YJSf2qicLo3DdsYKIpmnk0C1rTh/Vtjh7SwwQIbjxxb+w+6CB4BY
   9vKI8HD08hnauu3Xt+Jdq1WhN5YQpuxKGUw+JQTvbBUP3nk/pv/kQervH
   7oec7z4Nhl3WeZex/bHS2U5zAQAwTZv3BNGYCdCIHPKZxMzgrwSDw/pat
   Yi0GrF8zls3HQ+mISLFVv4REmnUjHtELdL+JACwGSO7YKlBxA8jiwbR1a
   eHP3ddT2TIPw1LPyCNdOYUm9/Cg+H87khDBoGSYVTufuvTx2Jww3i/Wsz
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="380211348"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="380211348"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2023 22:16:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10821"; a="855192929"
X-IronPort-AV: E=Sophos;i="6.02,223,1688454000"; 
   d="scan'208";a="855192929"
Received: from lkp-server01.sh.intel.com (HELO 5d8055a4f6aa) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 02 Sep 2023 22:16:44 -0700
Received: from kbuild by 5d8055a4f6aa with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qcfTW-0002vL-0V;
	Sun, 03 Sep 2023 05:16:42 +0000
Date: Sun, 3 Sep 2023 13:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: [amir73il:fuse-backing-fd 11/14] fs/fuse/passthrough.c:23
 fuse_backing_free() error: we previously assumed 'fb' could be null (see
 line 21)
Message-ID: <202309031342.V3G49Lbc-lkp@intel.com>
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
TO: Amir Goldstein <amir73il@gmail.com>

tree:   https://github.com/amir73il/linux fuse-backing-fd
head:   563a1dbd5121cbe0239528370c886b990224403f
commit: c437debbc26ca8097efb08e5f279b4bd5c8376a3 [11/14] fuse: backing file id initialization and release
:::::: branch date: 19 hours ago
:::::: commit date: 19 hours ago
config: i386-randconfig-141-20230903 (https://download.01.org/0day-ci/archive/20230903/202309031342.V3G49Lbc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230903/202309031342.V3G49Lbc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202309031342.V3G49Lbc-lkp@intel.com/

smatch warnings:
fs/fuse/passthrough.c:23 fuse_backing_free() error: we previously assumed 'fb' could be null (see line 21)

vim +/fb +23 fs/fuse/passthrough.c

96e6d03cee90a5 Amir Goldstein 2023-05-20  18  
96e6d03cee90a5 Amir Goldstein 2023-05-20  19  static void fuse_backing_free(struct fuse_backing *fb)
96e6d03cee90a5 Amir Goldstein 2023-05-20  20  {
96e6d03cee90a5 Amir Goldstein 2023-05-20 @21  	if (fb && fb->file)
96e6d03cee90a5 Amir Goldstein 2023-05-20  22  		fput(fb->file);
c437debbc26ca8 Amir Goldstein 2023-09-02 @23  	if (fb->cred)
c437debbc26ca8 Amir Goldstein 2023-09-02  24  		put_cred(fb->cred);
c437debbc26ca8 Amir Goldstein 2023-09-02  25  	kfree_rcu(fb, rcu);
96e6d03cee90a5 Amir Goldstein 2023-05-20  26  }
96e6d03cee90a5 Amir Goldstein 2023-05-20  27  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
