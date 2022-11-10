Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C04E626;
	Thu, 10 Nov 2022 07:08:01 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id l39-20020a05600c1d2700b003cf93c8156dso513909wms.4;
        Wed, 09 Nov 2022 23:08:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=e/LTRFRXEyx8/WU63WF8jgZ3/L8lS60LosTSaOGyJno=;
        b=dT9bxPCbAjHsJ6L6IUjgJu33XX1b0PndvpH1XfJzPgQUMTLgI52/VoiEcJ2v0wMM4p
         XeEwj9I7wFzcy1xaf/m/JXsxSnXbV+F+X1JFSB33symPjM70dwWJgrDM9fbH+aQ3zKmg
         oJ6/W++lW2CMKDtcfdTfgrmZUX3vWzrrSW5T4pfC+BbcVuFk6Pky7+8iDnhAUtCWg6mK
         Yk36xZosWszBUj/ANbCANXicMqPMlMp3SiNW9TXV84D/7xELy89zk6wBMNQxBJhLETY5
         TEjedxbAaoo6J1sEMjF8FLvkRqGJ1/gq5uTF8qSt9HoUwCPmLgXPEa6qQxjjfVv81Bbj
         qkRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e/LTRFRXEyx8/WU63WF8jgZ3/L8lS60LosTSaOGyJno=;
        b=uY+38bbO5V84pkst2Wb1Q8D0tU/mVWG90P0epWVdLPv3+bpeLIPhqfwuyiLkOQR6Iz
         bLyofdkgGycdXa9E9R+fbQwRZi5140VQ9Yq3TgdHlqva90CPvmeGCt+OnPSkA3XhU31o
         jLHR8w6EQzAKyfixg+8n/YIWnNVruhajEA7eR4xRjGafmsVqcRNsMFPeVk35/bwxyrNn
         v8N1Z+JPumadvdIZJvqr11YWHV+CCOdF+NEkgURfbZ27ODoVadl71xC4G8H9K2raswTw
         dG3v1y6TSlNzJQbOxxHxE1YVHz84ixx4sSCFYQvH6AMlU7YVKmqIf1D4qwN3AY1vY9EV
         KFmg==
X-Gm-Message-State: ANoB5pkgrGSzKM8oexTTfsz3YPghksAz8r2/zRP19IR3f62rfrlBj1vK
	pHDF9WcO6I93vLUMYYE1JMzKMtsuR0h1Pg==
X-Google-Smtp-Source: AA0mqf4tvD1XJMFzFRq3Rk6eHaCtsabNMKxCKJtkdvgg0p4LJS9P3xYzTiMljDwdnoiaNRsd3971zw==
X-Received: by 2002:a05:600c:2942:b0:3cf:b1c1:336a with SMTP id n2-20020a05600c294200b003cfb1c1336amr10356587wmd.95.1668064079111;
        Wed, 09 Nov 2022 23:07:59 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i3-20020a05600011c300b0022cdeba3f83sm14799986wrx.84.2022.11.09.23.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 23:07:58 -0800 (PST)
Date: Thu, 10 Nov 2022 10:07:55 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, allison.henderson@oracle.com
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v5 24/26] xfs: Add parent pointer ioctl
Message-ID: <202211101335.In65kF9P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221107090156.299319-25-allison.henderson@oracle.com>
Message-ID: <20221110070755.HPlwSLTnkD5pjK0x46nKzO_VH59GjshJ2_s5t21TCiE@z>

Hi,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/allison-henderson-oracle-com/Parent-Pointers/20221107-170748
base:   https://git.kernel.org/pub/scm/fs/xfs/xfs-linux.git for-next
patch link:    https://lore.kernel.org/r/20221107090156.299319-25-allison.henderson%40oracle.com
patch subject: [PATCH v5 24/26] xfs: Add parent pointer ioctl
config: arc-randconfig-m041-20221107
compiler: arc-elf-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
fs/xfs/xfs_parent_utils.c:119 xfs_attr_get_parent_pointer() error: uninitialized symbol 'lock_mode'.

vim +/lock_mode +119 fs/xfs/xfs_parent_utils.c

5297ea33edfa17 Allison Henderson 2022-11-07   35  
5297ea33edfa17 Allison Henderson 2022-11-07   36  	struct xfs_attrlist		*alist;
5297ea33edfa17 Allison Henderson 2022-11-07   37  	struct xfs_attrlist_ent		*aent;
5297ea33edfa17 Allison Henderson 2022-11-07   38  	struct xfs_parent_ptr		*xpp;
5297ea33edfa17 Allison Henderson 2022-11-07   39  	struct xfs_parent_name_rec	*xpnr;
5297ea33edfa17 Allison Henderson 2022-11-07   40  	char				*namebuf;
5297ea33edfa17 Allison Henderson 2022-11-07   41  	unsigned int			namebuf_size;
5297ea33edfa17 Allison Henderson 2022-11-07   42  	int				name_len, i, error = 0;
5297ea33edfa17 Allison Henderson 2022-11-07   43  	unsigned int			lock_mode, flags = XFS_ATTR_PARENT;
5297ea33edfa17 Allison Henderson 2022-11-07   44  	struct xfs_attr_list_context	context;
5297ea33edfa17 Allison Henderson 2022-11-07   45  
5297ea33edfa17 Allison Henderson 2022-11-07   46  	/* Allocate a buffer to store the attribute names */
5297ea33edfa17 Allison Henderson 2022-11-07   47  	namebuf_size = sizeof(struct xfs_attrlist) +
5297ea33edfa17 Allison Henderson 2022-11-07   48  		       (ppi->pi_ptrs_size) * sizeof(struct xfs_attrlist_ent);
5297ea33edfa17 Allison Henderson 2022-11-07   49  	namebuf = kvzalloc(namebuf_size, GFP_KERNEL);
5297ea33edfa17 Allison Henderson 2022-11-07   50  	if (!namebuf)
5297ea33edfa17 Allison Henderson 2022-11-07   51  		return -ENOMEM;
5297ea33edfa17 Allison Henderson 2022-11-07   52  
5297ea33edfa17 Allison Henderson 2022-11-07   53  	memset(&context, 0, sizeof(struct xfs_attr_list_context));
5297ea33edfa17 Allison Henderson 2022-11-07   54  	error = xfs_ioc_attr_list_context_init(ip, namebuf, namebuf_size, 0,
5297ea33edfa17 Allison Henderson 2022-11-07   55  			&context);
5297ea33edfa17 Allison Henderson 2022-11-07   56  	if (error)
5297ea33edfa17 Allison Henderson 2022-11-07   57  		goto out_kfree;

lock_mode is uninitialized on this path.

5297ea33edfa17 Allison Henderson 2022-11-07   58  
5297ea33edfa17 Allison Henderson 2022-11-07   59  	/* Copy the cursor provided by caller */
5297ea33edfa17 Allison Henderson 2022-11-07   60  	memcpy(&context.cursor, &ppi->pi_cursor,
5297ea33edfa17 Allison Henderson 2022-11-07   61  		sizeof(struct xfs_attrlist_cursor));
5297ea33edfa17 Allison Henderson 2022-11-07   62  	context.attr_filter = XFS_ATTR_PARENT;
5297ea33edfa17 Allison Henderson 2022-11-07   63  
5297ea33edfa17 Allison Henderson 2022-11-07   64  	lock_mode = xfs_ilock_attr_map_shared(ip);
5297ea33edfa17 Allison Henderson 2022-11-07   65  
5297ea33edfa17 Allison Henderson 2022-11-07   66  	error = xfs_attr_list_ilocked(&context);
5297ea33edfa17 Allison Henderson 2022-11-07   67  	if (error)
5297ea33edfa17 Allison Henderson 2022-11-07   68  		goto out_kfree;
5297ea33edfa17 Allison Henderson 2022-11-07   69  
5297ea33edfa17 Allison Henderson 2022-11-07   70  	alist = (struct xfs_attrlist *)namebuf;
5297ea33edfa17 Allison Henderson 2022-11-07   71  	for (i = 0; i < alist->al_count; i++) {
5297ea33edfa17 Allison Henderson 2022-11-07   72  		struct xfs_da_args args = {
5297ea33edfa17 Allison Henderson 2022-11-07   73  			.geo = ip->i_mount->m_attr_geo,
5297ea33edfa17 Allison Henderson 2022-11-07   74  			.whichfork = XFS_ATTR_FORK,
5297ea33edfa17 Allison Henderson 2022-11-07   75  			.dp = ip,
5297ea33edfa17 Allison Henderson 2022-11-07   76  			.namelen = sizeof(struct xfs_parent_name_rec),
5297ea33edfa17 Allison Henderson 2022-11-07   77  			.attr_filter = flags,
5297ea33edfa17 Allison Henderson 2022-11-07   78  		};
5297ea33edfa17 Allison Henderson 2022-11-07   79  
5297ea33edfa17 Allison Henderson 2022-11-07   80  		xpp = xfs_ppinfo_to_pp(ppi, i);
5297ea33edfa17 Allison Henderson 2022-11-07   81  		memset(xpp, 0, sizeof(struct xfs_parent_ptr));
5297ea33edfa17 Allison Henderson 2022-11-07   82  		aent = (struct xfs_attrlist_ent *)
5297ea33edfa17 Allison Henderson 2022-11-07   83  			&namebuf[alist->al_offset[i]];
5297ea33edfa17 Allison Henderson 2022-11-07   84  		xpnr = (struct xfs_parent_name_rec *)(aent->a_name);
5297ea33edfa17 Allison Henderson 2022-11-07   85  
5297ea33edfa17 Allison Henderson 2022-11-07   86  		if (aent->a_valuelen > XFS_PPTR_MAXNAMELEN) {
5297ea33edfa17 Allison Henderson 2022-11-07   87  			error = -EFSCORRUPTED;
5297ea33edfa17 Allison Henderson 2022-11-07   88  			goto out_kfree;
5297ea33edfa17 Allison Henderson 2022-11-07   89  		}
5297ea33edfa17 Allison Henderson 2022-11-07   90  		name_len = aent->a_valuelen;
5297ea33edfa17 Allison Henderson 2022-11-07   91  
5297ea33edfa17 Allison Henderson 2022-11-07   92  		args.name = (char *)xpnr;
5297ea33edfa17 Allison Henderson 2022-11-07   93  		args.hashval = xfs_da_hashname(args.name, args.namelen),
5297ea33edfa17 Allison Henderson 2022-11-07   94  		args.value = (unsigned char *)(xpp->xpp_name);
5297ea33edfa17 Allison Henderson 2022-11-07   95  		args.valuelen = name_len;
5297ea33edfa17 Allison Henderson 2022-11-07   96  
5297ea33edfa17 Allison Henderson 2022-11-07   97  		error = xfs_attr_get_ilocked(&args);
5297ea33edfa17 Allison Henderson 2022-11-07   98  		error = (error == -EEXIST ? 0 : error);
5297ea33edfa17 Allison Henderson 2022-11-07   99  		if (error) {
5297ea33edfa17 Allison Henderson 2022-11-07  100  			error = -EFSCORRUPTED;
5297ea33edfa17 Allison Henderson 2022-11-07  101  			goto out_kfree;
5297ea33edfa17 Allison Henderson 2022-11-07  102  		}
5297ea33edfa17 Allison Henderson 2022-11-07  103  
5297ea33edfa17 Allison Henderson 2022-11-07  104  		xfs_init_parent_ptr(xpp, xpnr);
5297ea33edfa17 Allison Henderson 2022-11-07  105  		if (!xfs_verify_ino(args.dp->i_mount, xpp->xpp_ino)) {
5297ea33edfa17 Allison Henderson 2022-11-07  106  			error = -EFSCORRUPTED;
5297ea33edfa17 Allison Henderson 2022-11-07  107  			goto out_kfree;
5297ea33edfa17 Allison Henderson 2022-11-07  108  		}
5297ea33edfa17 Allison Henderson 2022-11-07  109  	}
5297ea33edfa17 Allison Henderson 2022-11-07  110  	ppi->pi_ptrs_used = alist->al_count;
5297ea33edfa17 Allison Henderson 2022-11-07  111  	if (!alist->al_more)
5297ea33edfa17 Allison Henderson 2022-11-07  112  		ppi->pi_flags |= XFS_PPTR_OFLAG_DONE;
5297ea33edfa17 Allison Henderson 2022-11-07  113  
5297ea33edfa17 Allison Henderson 2022-11-07  114  	/* Update the caller with the current cursor position */
5297ea33edfa17 Allison Henderson 2022-11-07  115  	memcpy(&ppi->pi_cursor, &context.cursor,
5297ea33edfa17 Allison Henderson 2022-11-07  116  			sizeof(struct xfs_attrlist_cursor));
5297ea33edfa17 Allison Henderson 2022-11-07  117  
5297ea33edfa17 Allison Henderson 2022-11-07  118  out_kfree:
5297ea33edfa17 Allison Henderson 2022-11-07 @119  	xfs_iunlock(ip, lock_mode);
5297ea33edfa17 Allison Henderson 2022-11-07  120  	kvfree(namebuf);
5297ea33edfa17 Allison Henderson 2022-11-07  121  
5297ea33edfa17 Allison Henderson 2022-11-07  122  	return error;
5297ea33edfa17 Allison Henderson 2022-11-07  123  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

