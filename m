Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB21733D2;
	Mon,  3 Apr 2023 11:21:02 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id cn12so115912004edb.4;
        Mon, 03 Apr 2023 04:21:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680520861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pSGbPNvPB+JspcMZAM7knRh0d6tq6zqNpiPGf74AOAk=;
        b=GSRqITYHxQvX4a+vFTAh0mGJOK8s75BHXaBTK7FjohiEENwEwJqpv8RnAt+DKFC4B0
         PqYcfmzIduKRaEguCAIwu782Mn0U2Qmil6Rm2zwZiijMpb9zvKEBbzNeMQcS4KFhw/4B
         v4nDpR9kcOl1pRePVbJm5lXI4c5DcEFfZL/z0R0lxAwKwvDiEUw0ns31TeUfu+gtrVuM
         ZLrSCh/GlaGIt47LB3SCWmzqHaK+cn7Q76Eg8Oi1g09acL1Jd5j5ct71GBwbe3V0hi5P
         PpToOZeh7QkcVUK9z7gxx4fiXZ7k6gcEZ6scoKIwMfcuPibX6J4Cl+OpD/JcGZmj7T1U
         Lr9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680520861;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pSGbPNvPB+JspcMZAM7knRh0d6tq6zqNpiPGf74AOAk=;
        b=jai27Ui6/L4LXGTCL/FxIqUrfCmjzSenqhrr1VQmQ/7uuGd92blbqva2JrRR3Bm2sR
         /JmPYFhxPUPjEjb9RWMvls7oEoGwVMEhZzTLb8mJ6Wggcd5+kaKGkZ3FpIpbLj30kw09
         bAuvW7d2JlyxBbGb16aOx0S9uW6KMQke4maZYrFhr0Z1xd2U/DpvGfyCHbY3Rh2tOCDH
         gkGm74FDwfS5E4adZzEmq/tBXMgREuMcWIiu056Tu01+xXSvP2tgiYSPpKgEsCRWX/eS
         SPJMG3IunlYJ2M0317hW+xGswANz+7MNw0FwkvP27CUhdChQoekESBjQN2fp8mMdIaLG
         lS4g==
X-Gm-Message-State: AAQBX9cpczYYP9+QGAJdDphE38nU1Wj+ZVB88ja/ZALm3kr58mEz2ZDn
	tHtbH2naIckM8SatxqN7aR0=
X-Google-Smtp-Source: AKy350Y758ypGm4nbge2JI3sswU+UqJX9IukkLLnBaBtKLA2khnktn53Px0p8a/quttJT+79zP8qbg==
X-Received: by 2002:a17:906:1cc5:b0:931:42d2:a77f with SMTP id i5-20020a1709061cc500b0093142d2a77fmr34597474ejh.15.1680520860851;
        Mon, 03 Apr 2023 04:21:00 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id kx6-20020a170907774600b009310d4dece9sm4402997ejc.62.2023.04.03.04.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Apr 2023 04:21:00 -0700 (PDT)
Date: Mon, 3 Apr 2023 14:20:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: Joseph Qi <joseph.qi@linux.alibaba.com>, lkp@intel.com,
	oe-kbuild-all@lists.linux.dev
Cc: oe-kbuild@lists.linux.dev,
	Heming Zhao via Ocfs2-devel <ocfs2-devel@oss.oracle.com>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: Re: fs/ocfs2/super.c:1809 ocfs2_mount_volume() warn: missing error
 code 'status'
Message-ID: <1e7d7076-ddd6-41b3-b824-673986c35477@kili.mountain>
References: <9e1d6835-34fc-49cd-869e-d99d9b546d17@kili.mountain>
 <4154b815-3be4-53de-1bc0-ca87ecb925a4@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4154b815-3be4-53de-1bc0-ca87ecb925a4@linux.alibaba.com>

Sorry, the kbuild bot is not supposed to send duplicate warnings.  I
don't know why it was sent again...

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7b50567bdcad8925ca1e075feb7171c12015afd1
commit: 0737e01de9c411e4db87dcedf4a9789d41b1c5c1 ocfs2: ocfs2_mount_volume does cleanup job before return error
date:   11 months ago
:::::: branch date: 15 hours ago
       ^^^^^^^^^^^^^^^^^^^^^^^^^
Something happened on Apr 1.

:::::: commit date: 11 months ago
config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230401/202304012244.gX4H4rBO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

regards,
dan carpenter

On Mon, Apr 03, 2023 at 07:07:37PM +0800, Joseph Qi wrote:
> Hi,
> IIRC, we've discussed this before.
> Success return is expected in case of 'hard readonly'.
> So this a false positive report.
> 
> Thanks,
> Joseph
> 
> On 4/3/23 2:14 PM, Dan Carpenter wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > head:   7b50567bdcad8925ca1e075feb7171c12015afd1
> > commit: 0737e01de9c411e4db87dcedf4a9789d41b1c5c1 ocfs2: ocfs2_mount_volume does cleanup job before return error
> > config: arm64-randconfig-m041-20230329 (https://download.01.org/0day-ci/archive/20230401/202304012244.gX4H4rBO-lkp@intel.com/config)
> > compiler: aarch64-linux-gcc (GCC) 12.1.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Link: https://lore.kernel.org/r/202304012244.gX4H4rBO-lkp@intel.com/
> > 
> > smatch warnings:
> > fs/ocfs2/super.c:1809 ocfs2_mount_volume() warn: missing error code 'status'
> > 
> > vim +/status +1809 fs/ocfs2/super.c
> > 
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1803  static int ocfs2_mount_volume(struct super_block *sb)
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1804  {
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1805  	int status = 0;
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1806  	struct ocfs2_super *osb = OCFS2_SB(sb);
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1807  
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1808  	if (ocfs2_is_hard_readonly(osb))
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29 @1809  		goto out;
> > 
> > Hard to tell if this should be an error path or not...  Canonical
> > problem with do nothing gotos.
> > 
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1810  
> > 5500ab4ed3b8f0 Gang He                     2019-03-05  1811  	mutex_init(&osb->obs_trim_fs_mutex);
> > 5500ab4ed3b8f0 Gang He                     2019-03-05  1812  
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1813  	status = ocfs2_dlm_init(osb);
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1814  	if (status < 0) {
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1815  		mlog_errno(status);
> > a52370b3b182f7 Gang He                     2018-01-31  1816  		if (status == -EBADR && ocfs2_userspace_stack(osb))
> > a52370b3b182f7 Gang He                     2018-01-31  1817  			mlog(ML_ERROR, "couldn't mount because cluster name on"
> > a52370b3b182f7 Gang He                     2018-01-31  1818  			" disk does not match the running cluster name.\n");
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1819  		goto out;
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1820  	}
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1821  
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1822  	status = ocfs2_super_lock(osb, 1);
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1823  	if (status < 0) {
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1824  		mlog_errno(status);
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1825  		goto out_dlm;
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1826  	}
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1827  
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1828  	/* This will load up the node map and add ourselves to it. */
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1829  	status = ocfs2_find_slot(osb);
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1830  	if (status < 0) {
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1831  		mlog_errno(status);
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1832  		goto out_super_lock;
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1833  	}
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1834  
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1835  	/* load all node-local system inodes */
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1836  	status = ocfs2_init_local_system_inodes(osb);
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1837  	if (status < 0) {
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1838  		mlog_errno(status);
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1839  		goto out_super_lock;
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1840  	}
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1841  
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1842  	status = ocfs2_check_volume(osb);
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1843  	if (status < 0) {
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1844  		mlog_errno(status);
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1845  		goto out_system_inodes;
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1846  	}
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1847  
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1848  	status = ocfs2_truncate_log_init(osb);
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1849  	if (status < 0) {
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1850  		mlog_errno(status);
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1851  		goto out_system_inodes;
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1852  	}
> > c271c5c22b0a7c Sunil Mushran               2006-12-05  1853  
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1854  	ocfs2_super_unlock(osb, 1);
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1855  	return 0;
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1856  
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1857  out_system_inodes:
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1858  	if (osb->local_alloc_state == OCFS2_LA_ENABLED)
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1859  		ocfs2_shutdown_local_alloc(osb);
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1860  	ocfs2_release_system_inodes(osb);
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1861  	/* before journal shutdown, we should release slot_info */
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1862  	ocfs2_free_slot_info(osb);
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1863  	ocfs2_journal_shutdown(osb);
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1864  out_super_lock:
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1865  	ocfs2_super_unlock(osb, 1);
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1866  out_dlm:
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1867  	ocfs2_dlm_shutdown(osb, 0);
> > 0737e01de9c411 Heming Zhao via Ocfs2-devel 2022-04-29  1868  out:
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1869  	return status;
> > ccd979bdbce9fb Mark Fasheh                 2005-12-15  1870  }
> > 
