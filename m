Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04B29A21
	for <oe-kbuild@lists.linux.dev>; Wed, 31 May 2023 02:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685501937; x=1717037937;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U59jNPpzYIzMt0cgINeYTDGEYNCs8IvcwqjPcnsUA2s=;
  b=fB1s3dFKvhNmEoa6M+fkWy767lGYIogoPtZ3g1pJGEE4EYsea2/Lidk+
   kUVO5T9w/0QskcLnAaDJyAWTt9A3pzjIt5kHsFRGhkU9iSVcXd75ngtTC
   en7XEYEEnZf1oYq7FNzLz2kMcIrAUEdXW4r6ASEe29to+oOjo9vvgYzNl
   Bnxoto9dgf0WTHtLHBIjrbIJVHHNVv/1PCduGD7qLPLpy+fjQlx4ej1X2
   phOKnrCyb+C0YdGjmSnF38c7gLdJ/ivsco/3PczBiiQgwcViQyZJWfqCP
   iATQ3k6sTyvG1O5+iEc8xkBT4y/z3GjbrXStj3saWDiY9xci82BJclHZQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="358377592"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="358377592"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 19:58:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10726"; a="851043406"
X-IronPort-AV: E=Sophos;i="6.00,205,1681196400"; 
   d="scan'208";a="851043406"
Received: from lkp-server01.sh.intel.com (HELO fb1ced2c09fb) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 30 May 2023 19:58:55 -0700
Received: from kbuild by fb1ced2c09fb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q4C35-00011l-0Z;
	Wed, 31 May 2023 02:58:55 +0000
Date: Wed, 31 May 2023 10:58:07 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH RFC v2] tpm: tpm_vtpm_proxy: do not reference kernel
 memory as user memory
Message-ID: <202305311050.cYKH2Hfq-lkp@intel.com>
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
In-Reply-To: <20230530020133.235765-1-jarkko@kernel.org>
References: <20230530020133.235765-1-jarkko@kernel.org>
TO: Jarkko Sakkinen <jarkko@kernel.org>

Hi Jarkko,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on char-misc/char-misc-testing]
[also build test WARNING on char-misc/char-misc-next char-misc/char-misc-linus linus/master v6.4-rc4 next-20230530]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jarkko-Sakkinen/tpm-tpm_vtpm_proxy-do-not-reference-kernel-memory-as-user-memory/20230530-100537
base:   char-misc/char-misc-testing
patch link:    https://lore.kernel.org/r/20230530020133.235765-1-jarkko%40kernel.org
patch subject: [PATCH RFC v2] tpm: tpm_vtpm_proxy: do not reference kernel memory as user memory
:::::: branch date: 25 hours ago
:::::: commit date: 25 hours ago
config: m68k-randconfig-m031-20230530 (https://download.01.org/0day-ci/archive/20230531/202305311050.cYKH2Hfq-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 12.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305311050.cYKH2Hfq-lkp@intel.com/

smatch warnings:
drivers/char/tpm/tpm_vtpm_proxy.c:83 __vtpm_proxy_read_unlocked() error: uninitialized symbol 'rc'.

vim +/rc +83 drivers/char/tpm/tpm_vtpm_proxy.c

6f99612e250041 Stefan Berger   2016-04-18  55  
6f99612e250041 Stefan Berger   2016-04-18  56  /*
6f99612e250041 Stefan Berger   2016-04-18  57   * Functions related to 'server side'
6f99612e250041 Stefan Berger   2016-04-18  58   */
6f99612e250041 Stefan Berger   2016-04-18  59  
919bd177830a95 Jarkko Sakkinen 2023-05-30  60  static ssize_t __vtpm_proxy_read_unlocked(struct proxy_dev *proxy_dev, char __user *buf,
919bd177830a95 Jarkko Sakkinen 2023-05-30  61  					  size_t count)
6f99612e250041 Stefan Berger   2016-04-18  62  {
6f99612e250041 Stefan Berger   2016-04-18  63  	size_t len;
919bd177830a95 Jarkko Sakkinen 2023-05-30  64  	int rc;
6f99612e250041 Stefan Berger   2016-04-18  65  
919bd177830a95 Jarkko Sakkinen 2023-05-30  66  	if (!(proxy_dev->state & STATE_OPENED_FLAG))
6f99612e250041 Stefan Berger   2016-04-18  67  		return -EPIPE;
6f99612e250041 Stefan Berger   2016-04-18  68  
6f99612e250041 Stefan Berger   2016-04-18  69  	len = proxy_dev->req_len;
6f99612e250041 Stefan Berger   2016-04-18  70  
e52432e1642309 Kees Cook       2022-01-19  71  	if (count < len || len > sizeof(proxy_dev->buffer)) {
6f99612e250041 Stefan Berger   2016-04-18  72  		pr_debug("Invalid size in recv: count=%zd, req_len=%zd\n",
6f99612e250041 Stefan Berger   2016-04-18  73  			 count, len);
6f99612e250041 Stefan Berger   2016-04-18  74  		return -EIO;
6f99612e250041 Stefan Berger   2016-04-18  75  	}
6f99612e250041 Stefan Berger   2016-04-18  76  
919bd177830a95 Jarkko Sakkinen 2023-05-30  77  	if (buf)
6f99612e250041 Stefan Berger   2016-04-18  78  		rc = copy_to_user(buf, proxy_dev->buffer, len);
919bd177830a95 Jarkko Sakkinen 2023-05-30  79  
6f99612e250041 Stefan Berger   2016-04-18  80  	memset(proxy_dev->buffer, 0, len);
6f99612e250041 Stefan Berger   2016-04-18  81  	proxy_dev->req_len = 0;
6f99612e250041 Stefan Berger   2016-04-18  82  
6f99612e250041 Stefan Berger   2016-04-18 @83  	if (!rc)
6f99612e250041 Stefan Berger   2016-04-18  84  		proxy_dev->state |= STATE_WAIT_RESPONSE_FLAG;
6f99612e250041 Stefan Berger   2016-04-18  85  
6f99612e250041 Stefan Berger   2016-04-18  86  	if (rc)
6f99612e250041 Stefan Berger   2016-04-18  87  		return -EFAULT;
6f99612e250041 Stefan Berger   2016-04-18  88  
6f99612e250041 Stefan Berger   2016-04-18  89  	return len;
6f99612e250041 Stefan Berger   2016-04-18  90  }
6f99612e250041 Stefan Berger   2016-04-18  91  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
