Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730C3631;
	Mon,  3 Apr 2023 06:14:33 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id i5so112927844eda.0;
        Sun, 02 Apr 2023 23:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680502471;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bVeCXy+GBi88X47vUp2kci/ua0r4Qmm4tGxxhSCn7+s=;
        b=C6OSI3+zC0WBr/2T+Mm/rvlpWMEnrlVbbcvMc+X7ZkMi3VQfvvnj+laGh3f0R6gwfP
         ZSsdnPJ2vREsj6jPyWbTmxd18ClFHkVhu+eNPcjN0M0aO9KxKDIKvqbQf4XwPd9kDNIQ
         wfvA+mFrRnX7RE2TiIiCI4j685Ftzv1nCPkriCttcK8eNn27YvKwUpm0Pe9odOMJWliw
         mN4yoafY5gAD8MybxYWwsTyhRsxOHJEurMjvxFZl18WPvLJBt8GrbwzJsakqeO65bMws
         5JBN0B+mPrDdXf0YwpmEKcdCtxjqn35dKyz10oSeEAQ+Tu+d2Ev9A1fNsqvULzuf9/Ex
         jo/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680502471;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bVeCXy+GBi88X47vUp2kci/ua0r4Qmm4tGxxhSCn7+s=;
        b=v5RzhHtsRqtU+7L2SKL7O4myQzvAGxYn4FzddN6Tu/pA8eYCQj5ttWvJynuR8x9L35
         IC5v9SFeSoWdFVYAC7Sb8Z6Uz1cAicUee9EKxIvVmYBp4i8doV3rSzVSRNkfQCnRF0Qz
         l5w0YWN4VKc+9Gazz6wdaUIHkUzVhgP/5UydGb+VchDXm+yneun+W19S6F+8OW31ufaT
         eTe8TNyY+2YOW4iBYfizelInVaglNn16S/gYv8OOxVt+gGhu7cSMWO0MFtYiyxwVl4uf
         jICqpTQ4oT0cx5sdA6HIQ8LBjevVcQXR40IHhbSGth1xf8IBNuT6qJ6jMce+2sXKEf7o
         baZg==
X-Gm-Message-State: AAQBX9cZTArMOmXuDCfgXLnhX7Xh283Waqnm30JsxAvGtmyHdihsVXQ5
	C1v/6yMIg/BRJvcM/YoM1hySTT//+gup6xZL
X-Google-Smtp-Source: AKy350ZP2GmTKzJfZURtI7SagiwJP+b8fzs406ux0ufhxpKxxCQtp2+4OeEsV7HPVccTDB3uys5Luw==
X-Received: by 2002:a17:907:3f15:b0:947:735b:fcbe with SMTP id hq21-20020a1709073f1500b00947735bfcbemr16186074ejc.19.1680502471396;
        Sun, 02 Apr 2023 23:14:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h8-20020a17090619c800b0092d16623eeasm4025286ejd.138.2023.04.02.23.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Apr 2023 23:14:31 -0700 (PDT)
Date: Mon, 3 Apr 2023 09:14:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Heming Zhao via Ocfs2-devel <ocfs2-devel@oss.oracle.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Joseph Qi <joseph.qi@linux.alibaba.com>
Subject: fs/ocfs2/super.c:1809 ocfs2_mount_volume() warn: missing error code
 'status'
Message-ID: <9e1d6835-34fc-49cd-869e-d99d9b546d17@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b50567bdcad8925ca1e075feb7171c12015afd1
commit: 0737e01de9c411e4db87dcedf4a9789d41b1c5c1 ocfs2: ocfs2_mount_volume does cleanup job before return error
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230401/202304012244.gX4H4rBO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304012244.gX4H4rBO-lkp@intel.com/

smatch warnings:
fs/ocfs2/super.c:1809 ocfs2_mount_volume() warn: missing error code 'status'

vim +/status +1809 fs/ocfs2/super.c

ccd979bdbce9fb Mark Fasheh                 2005-12-15  1803  static int ocfs2_mount_volume(struct super_block *sb)
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1804  {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1805  	int status = 0;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1806  	struct ocfs2_super *osb = OCFS2_SB(sb);
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1807  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1808  	if (ocfs2_is_hard_readonly(osb))
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29 @1809  		goto out;

Hard to tell if this should be an error path or not...  Canonical
problem with do nothing gotos.

ccd979bdbce9fb Mark Fasheh                 2005-12-15  1810  
5500ab4ed3b8f0 Gang He                     2019-03-05  1811  	mutex_init(&osb->obs_trim_fs_mutex);
5500ab4ed3b8f0 Gang He                     2019-03-05  1812  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1813  	status = ocfs2_dlm_init(osb);
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1814  	if (status < 0) {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1815  		mlog_errno(status);
a52370b3b182f7 Gang He                     2018-01-31  1816  		if (status == -EBADR && ocfs2_userspace_stack(osb))
a52370b3b182f7 Gang He                     2018-01-31  1817  			mlog(ML_ERROR, "couldn't mount because cluster name on"
a52370b3b182f7 Gang He                     2018-01-31  1818  			" disk does not match the running cluster name.\n");
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1819  		goto out;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1820  	}
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1821  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1822  	status = ocfs2_super_lock(osb, 1);
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1823  	if (status < 0) {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1824  		mlog_errno(status);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1825  		goto out_dlm;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1826  	}
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1827  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1828  	/* This will load up the node map and add ourselves to it. */
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1829  	status = ocfs2_find_slot(osb);
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1830  	if (status < 0) {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1831  		mlog_errno(status);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1832  		goto out_super_lock;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1833  	}
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1834  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1835  	/* load all node-local system inodes */
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1836  	status = ocfs2_init_local_system_inodes(osb);
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1837  	if (status < 0) {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1838  		mlog_errno(status);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1839  		goto out_super_lock;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1840  	}
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1841  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1842  	status = ocfs2_check_volume(osb);
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1843  	if (status < 0) {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1844  		mlog_errno(status);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1845  		goto out_system_inodes;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1846  	}
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1847  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1848  	status = ocfs2_truncate_log_init(osb);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1849  	if (status < 0) {
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1850  		mlog_errno(status);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1851  		goto out_system_inodes;
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1852  	}
c271c5c22b0a7c Sunil Mushran               2006-12-05  1853  
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1854  	ocfs2_super_unlock(osb, 1);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1855  	return 0;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1856  
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1857  out_system_inodes:
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1858  	if (osb->local_alloc_state == OCFS2_LA_ENABLED)
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1859  		ocfs2_shutdown_local_alloc(osb);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1860  	ocfs2_release_system_inodes(osb);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1861  	/* before journal shutdown, we should release slot_info */
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1862  	ocfs2_free_slot_info(osb);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1863  	ocfs2_journal_shutdown(osb);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1864  out_super_lock:
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1865  	ocfs2_super_unlock(osb, 1);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1866  out_dlm:
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1867  	ocfs2_dlm_shutdown(osb, 0);
0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1868  out:
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1869  	return status;
ccd979bdbce9fb Mark Fasheh                 2005-12-15  1870  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

