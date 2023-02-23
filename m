Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D3015CA;
	Thu, 23 Feb 2023 04:04:41 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id j19-20020a05600c1c1300b003e9b564fae9so2710075wms.2;
        Wed, 22 Feb 2023 20:04:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Y8To/H78yTZd9LcMUadl3BIzH4V/slxywotjiMrN3r4=;
        b=o1HfscIQJCjgVCd5hYUh26OcPHizZ5M2fUPOAzI2VhcOC/xLKjGGbFhBjD6r4NN691
         ksofcihZiLa/50yf+G3ytaKA22JrL4aVoiS0d6xvhYkTKkunv0nKyfxAe9ITNAL4uiw4
         0E7ktlJk7Eq/eN7Q5oejnu/sNlw7qq5RtfdlP6YNJYPTqtA7dA1Yp9jybYGUwgaT2BMR
         rer5IJhQGfkn+Dnd25z6rfEakUF1uhPIfF1TPZoguC9KaEfDtr69TIQgkPpNKZgHLdtH
         /YUZPS5Zgcfa7Q66RpJE+DMrWarAQGm7sewJSdCio3cmTmgBa+IgToVgr8g82OunuKzy
         Ei9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8To/H78yTZd9LcMUadl3BIzH4V/slxywotjiMrN3r4=;
        b=5Bf83bY9VmO2kIjOgmZ3iKZc5oQ1/5fjq4XDN3fThbxHSpDOUUZTmGmIzMs7N4SspE
         Rv3iNl2sNzricEpIofDh8j6OILgKNst7H0U7TlkX+tXR8Is1pcya1XxtH8CL63swwiUg
         F7h7W7bwlu7KHJWBt91Ph+Y7SLVgfbb67X9dFYc664TjShsGOMiPnn1X6W7hrm3w80ky
         HrO2ue58JK7BJ2c5hE19uSjf7VyfSlzivHO/NPEPeyGYzE+ZawJvZfDGTIgrFmBp9IIa
         pfvzYUrXB1i/2dZJr2/nIR39LntumnjJEQmge492r7zgR0f9r70wueqQ5DXzE0SmdyXO
         porQ==
X-Gm-Message-State: AO0yUKVt7wJYCOpar3hTjrfwIb2e3ujix+VYLwSmf2Y1VcI4ENzSunEE
	PisMBWkc2dj145kBiqEVT2E=
X-Google-Smtp-Source: AK7set8lUfwhlzbXCtwlmrIXwAi6xDALa5tCJgndDsO1par4fyPiz+VkoSeL+uaFG8HiH9ECUi9obw==
X-Received: by 2002:a05:600c:2ad6:b0:3e8:fade:3795 with SMTP id t22-20020a05600c2ad600b003e8fade3795mr3343342wme.17.1677125079485;
        Wed, 22 Feb 2023 20:04:39 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id k17-20020a7bc411000000b003dfee43863fsm8986413wmi.26.2023.02.22.20.04.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 20:04:38 -0800 (PST)
Date: Thu, 23 Feb 2023 07:04:35 +0300
From: Dan Carpenter <error27@gmail.com>
To: Kemeng Shi <shikemeng@huaweicloud.com>
Cc: oe-kbuild@lists.linux.dev, tytso@mit.edu, adilger.kernel@dilger.ca,
	lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-ext4@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 7/7] ext4: improve inode table blocks counting in
 ext4_num_overhead_clusters
Message-ID: <Y/bl05WBDNT8FPoi@kadam>
References: <202302222219.u328sqfs-lkp@intel.com>
 <1802222f-9c10-9ea3-93fb-6fce086e201a@huaweicloud.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1802222f-9c10-9ea3-93fb-6fce086e201a@huaweicloud.com>

On Thu, Feb 23, 2023 at 09:31:54AM +0800, Kemeng Shi wrote:
> 
> 
> on 2/22/2023 11:13 PM, Dan Carpenter wrote:
> > Hi Kemeng,
> > 
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:    https://github.com/intel-lab-lkp/linux/commits/Kemeng-Shi/ext4-properly-handle-error-of-ext4_init_block_bitmap-in-ext4_read_block_bitmap_nowait/20230221-115830
> > base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
> > patch link:    https://lore.kernel.org/r/20230221115919.1918161-8-shikemeng%40huaweicloud.com
> > patch subject: [PATCH 7/7] ext4: improve inode table blocks counting in ext4_num_overhead_clusters
> > config: riscv-randconfig-m031-20230219 (https://download.01.org/0day-ci/archive/20230222/202302222219.u328sqfs-lkp@intel.com/config)
> > compiler: riscv32-linux-gcc (GCC) 12.1.0
> > 
> > If you fix the issue, kindly add following tag where applicable
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <error27@gmail.com>
> > | Link: https://lore.kernel.org/r/202302222219.u328sqfs-lkp@intel.com/
> > 
> > New smatch warnings:
> > fs/ext4/balloc.c:153 ext4_num_overhead_clusters() error: uninitialized symbol 'block_cluster'.
> > 
> > vim +/block_cluster +153 fs/ext4/balloc.c
> [...]
> > d5b8f31007a937 Theodore Ts'o     2011-09-09  128  	/*
> > 2b59a2fd93873a Kemeng Shi        2023-02-21  129  	 * For the allocation bitmaps, we first need to check to see
> > 2b59a2fd93873a Kemeng Shi        2023-02-21  130  	 * if the block is in the block group.  If it is, then check
> > 2b59a2fd93873a Kemeng Shi        2023-02-21  131  	 * to see if the cluster is already accounted for in the clusters
> > 2b59a2fd93873a Kemeng Shi        2023-02-21  132  	 * used for the base metadata cluster and inode tables cluster.
> > d5b8f31007a937 Theodore Ts'o     2011-09-09  133  	 * Normally all of these blocks are contiguous, so the special
> > d5b8f31007a937 Theodore Ts'o     2011-09-09  134  	 * case handling shouldn't be necessary except for *very*
> > d5b8f31007a937 Theodore Ts'o     2011-09-09  135  	 * unusual file system layouts.
> > d5b8f31007a937 Theodore Ts'o     2011-09-09  136  	 */
> > d5b8f31007a937 Theodore Ts'o     2011-09-09  137  	if (ext4_block_in_group(sb, ext4_block_bitmap(sb, gdp), block_group)) {
> > b0dd6b70f0fda1 Theodore Ts'o     2012-06-07  138  		block_cluster = EXT4_B2C(sbi,
> > b0dd6b70f0fda1 Theodore Ts'o     2012-06-07  139  					 ext4_block_bitmap(sb, gdp) - start);
> > 2b59a2fd93873a Kemeng Shi        2023-02-21  140  		if (block_cluster >= base_clusters &&
> > 2b59a2fd93873a Kemeng Shi        2023-02-21  141  		    (block_cluster < itbl_cluster_start ||
> > 2b59a2fd93873a Kemeng Shi        2023-02-21  142  		    block_cluster > itbl_cluster_end))
> > d5b8f31007a937 Theodore Ts'o     2011-09-09  143  			num_clusters++;
> > d5b8f31007a937 Theodore Ts'o     2011-09-09  144  	}
> > d5b8f31007a937 Theodore Ts'o     2011-09-09  145  
> > d5b8f31007a937 Theodore Ts'o     2011-09-09  146  	if (ext4_block_in_group(sb, ext4_inode_bitmap(sb, gdp), block_group)) {
> > 
> > These two conditions are exactly the same so I don't see why they can't
> > be combined into one condition.  I have read the comment, but I guess I
> > don't understand ext4 well enough to really understand it.
> These two conditions check two kinds of bitmap block: *block* bitmap block
> and *inode* bitmap block.

Ah right.  When I was reviewing this code, I copy and pasted the if
conditions so they were exactly lined up with each other and I still
didn't see the block vs inode difference until you pointed it out.  :P

Thanks!

regards,
dan carpenter

