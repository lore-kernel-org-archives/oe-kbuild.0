Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3867C;
	Mon, 23 Jan 2023 12:04:17 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id t5so10593376wrq.1;
        Mon, 23 Jan 2023 04:04:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dc6Iu0o4fP6ivasC7UZeOSkzWU+HqKmeQgzRy86uQ1M=;
        b=O6/IZ8T6juXFBxwlihCeu4uCoPmkh1n/nuFQJdZ3eSMX1cv738HyzZycJsj1SCDhfj
         tTnQqGg5PV9EHiw8P/mXED9EBlVfpktM79yV8rqgCuqmoYVH61pDCuQW5JmbUBLcemCC
         ZVf0hqvt8sZrWq0d6XzWygUXcrCJnVOHdXJ9kvSAL9aZJxq1EsOCR1r/E0VT6jc288VG
         dYm9v2vD/l7wqJ10Pn7D8CqqCAKupkSI01P6MxjiaClBIYYu8URNzhUR/yhb7Erv+6je
         2qbuMqMEnH9Et9NimYfzg2Pl3D5PPaafG1A8Z/VCU3lfVOazcTt9rfF/St1B4FWH85u4
         YxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dc6Iu0o4fP6ivasC7UZeOSkzWU+HqKmeQgzRy86uQ1M=;
        b=0kdQoe6Jm+3ORQgz71tP0th13y+h7hx4T0k5Hk6S/oJ1PcHYnL9O+c4Y9LRwBU/SRv
         80zw8zVvxbLAuL7r7FKa/XW4E3c5rNnTgKPy3F0gtrlFHjF8JFJGSiwnuvtytXqPwGns
         X8PaKDvs8KRbfgsa96zLrvu8DYQcdYQ3wcwOtV6YU/PGWAvuwNhJF9A5IubtslhZD9Xx
         y8WvyeDZKkT9VcUHY3zwigC3jIEN5uYLmS4IOyUmrHJxWumFXh+Ppo6kfdbKHWAUtH8z
         WWfplMLe3Swl/Es17haC+Q+drDczMx0CbGm5J7XpoU5VspztZR80euqZxmulqtxVH0e6
         3OlA==
X-Gm-Message-State: AFqh2krQlxigmM34G7I5Ugh2ywhr2BolRGgsClK7IROQxZQHUxSYFOR2
	dmlM6SwSWSawYsDFbK3f/Pza2JOqLbw=
X-Google-Smtp-Source: AMrXdXva0tO72U7N+MHJLM3e3EW5ga5Hn9KbpUyoOKMqbwKALgpgNVk3x7EdNBa1FSdW/V9ve8Xsyg==
X-Received: by 2002:a5d:4c4e:0:b0:2bb:4b40:2d1a with SMTP id n14-20020a5d4c4e000000b002bb4b402d1amr21946328wrt.56.1674475455949;
        Mon, 23 Jan 2023 04:04:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id b13-20020a05600003cd00b002be07cbefb2sm22510868wrg.18.2023.01.23.04.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 04:04:15 -0800 (PST)
Date: Mon, 23 Jan 2023 15:04:12 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Ajay Kaher <akaher@vmware.com>,
	rostedt@goodmis.org, mhiramat@kernel.org
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	chinglinyu@google.com, namit@vmware.com, srivatsab@vmware.com,
	srivatsa@csail.mit.edu, amakhalov@vmware.com,
	vsirnapalli@vmware.com, tkundu@vmware.com, er.ajay.kaher@gmail.com,
	Ajay Kaher <akaher@vmware.com>
Subject: Re: [PATCH 2/8] eventfs: adding eventfs dir add functions
Message-ID: <Y853vPCsTZXEiPgV@kadam>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1674407228-49109-2-git-send-email-akaher@vmware.com>

Hi Ajay,

https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Ajay-Kaher/eventfs-adding-eventfs-dir-add-functions/20230123-010956
patch link:    https://lore.kernel.org/r/1674407228-49109-2-git-send-email-akaher%40vmware.com
patch subject: [PATCH 2/8] eventfs: adding eventfs dir add functions
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/20230123/202301231023.0ix6JmVM-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
fs/tracefs/event_inode.c:114 eventfs_add_subsystem_dir() error: dereferencing freed memory 'ef'

vim +/ef +114 fs/tracefs/event_inode.c

db5e58a9349f39 Ajay Kaher 2023-01-22   87  struct eventfs_file *eventfs_add_subsystem_dir(const char *name, struct dentry *parent)
db5e58a9349f39 Ajay Kaher 2023-01-22   88  {
db5e58a9349f39 Ajay Kaher 2023-01-22   89  	struct eventfs_file *ef;
db5e58a9349f39 Ajay Kaher 2023-01-22   90  	struct tracefs_inode *ti_parent;
db5e58a9349f39 Ajay Kaher 2023-01-22   91  	struct eventfs_inode *ei_parent;
db5e58a9349f39 Ajay Kaher 2023-01-22   92  
db5e58a9349f39 Ajay Kaher 2023-01-22   93  	if (!parent)
db5e58a9349f39 Ajay Kaher 2023-01-22   94  		return ERR_PTR(-EINVAL);
db5e58a9349f39 Ajay Kaher 2023-01-22   95  
db5e58a9349f39 Ajay Kaher 2023-01-22   96  	ti_parent = get_tracefs(parent->d_inode);
db5e58a9349f39 Ajay Kaher 2023-01-22   97  	ei_parent = ti_parent->private;
db5e58a9349f39 Ajay Kaher 2023-01-22   98  
db5e58a9349f39 Ajay Kaher 2023-01-22   99  	ef = kzalloc(sizeof(*ef), GFP_KERNEL);
db5e58a9349f39 Ajay Kaher 2023-01-22  100  	if (!ef)
db5e58a9349f39 Ajay Kaher 2023-01-22  101  		return ERR_PTR(-ENOMEM);
db5e58a9349f39 Ajay Kaher 2023-01-22  102  
db5e58a9349f39 Ajay Kaher 2023-01-22  103  	ef->ei = kzalloc(sizeof(*ef->ei), GFP_KERNEL);
db5e58a9349f39 Ajay Kaher 2023-01-22  104  	if (!ef->ei) {
db5e58a9349f39 Ajay Kaher 2023-01-22  105  		kfree(ef);
db5e58a9349f39 Ajay Kaher 2023-01-22  106  		return ERR_PTR(-ENOMEM);
db5e58a9349f39 Ajay Kaher 2023-01-22  107  	}
db5e58a9349f39 Ajay Kaher 2023-01-22  108  
db5e58a9349f39 Ajay Kaher 2023-01-22  109  	INIT_LIST_HEAD(&ef->ei->e_top_files);
db5e58a9349f39 Ajay Kaher 2023-01-22  110  
db5e58a9349f39 Ajay Kaher 2023-01-22  111  	ef->name = kstrdup(name, GFP_KERNEL);
db5e58a9349f39 Ajay Kaher 2023-01-22  112  	if (!ef->name) {
db5e58a9349f39 Ajay Kaher 2023-01-22  113  		kfree(ef);
db5e58a9349f39 Ajay Kaher 2023-01-22 @114  		kfree(ef->ei);

kfree(ef->ei); first to avoid a use after free.

db5e58a9349f39 Ajay Kaher 2023-01-22  115  		return ERR_PTR(-ENOMEM);
db5e58a9349f39 Ajay Kaher 2023-01-22  116  	}
db5e58a9349f39 Ajay Kaher 2023-01-22  117  
db5e58a9349f39 Ajay Kaher 2023-01-22  118  	ef->mode = S_IFDIR | S_IRWXU | S_IRUGO | S_IXUGO;
db5e58a9349f39 Ajay Kaher 2023-01-22  119  	ef->iop = &eventfs_root_dir_inode_operations;
db5e58a9349f39 Ajay Kaher 2023-01-22  120  	ef->fop =  &eventfs_file_operations;
db5e58a9349f39 Ajay Kaher 2023-01-22  121  	ef->dentry = NULL;
db5e58a9349f39 Ajay Kaher 2023-01-22  122  	ef->created = false;
db5e58a9349f39 Ajay Kaher 2023-01-22  123  	ef->d_parent = parent;
db5e58a9349f39 Ajay Kaher 2023-01-22  124  
db5e58a9349f39 Ajay Kaher 2023-01-22  125  	list_add_tail(&ef->list, &ei_parent->e_top_files);
db5e58a9349f39 Ajay Kaher 2023-01-22  126  	return ef;
db5e58a9349f39 Ajay Kaher 2023-01-22  127  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

