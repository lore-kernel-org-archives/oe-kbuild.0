Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA7D1842;
	Sat,  7 Jan 2023 08:42:59 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id l26so2547918wme.5;
        Sat, 07 Jan 2023 00:42:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PJ12B5tVQVeGyYDen27FQdHZHiBHGM0e2jeMEmTW0Bc=;
        b=h0aVc+xCZYcm8PSTVQG4gGd2wzqUO2heLHpsGNcAV+XOjO7CnE3EIhG4PsGolqufY5
         SASM4ijrNrlu+A0LY5SUM+1PqOnSU3epvF9dEDS2rAc+HADl3uYdr8BFRrkpMH38qs4Q
         gdFLtWicHRcOO2lmB4UkduICaG0Xxx8pHK4d68S3/xeHub3Zw0IBmhXR6clLRbbGMyuT
         SHBap9YRS7YgBhV576/hhnNs8lIHJR34mgZoNbUD98KUByMHiZznU3PptMst+V8/db/T
         Pk8+S39z6KbAA9Q2Lxa0B4BZ1ha84o6pPJknvzoLQclTUBhXilno704WyzL/tUqacE8F
         o7lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PJ12B5tVQVeGyYDen27FQdHZHiBHGM0e2jeMEmTW0Bc=;
        b=C55Wqnxk4CTjZwjbrau1FPQQfOlE7MNEgRTB89lDWGRAdABs+K2uodbC7J29PHs/pH
         fB1tQ4gvra1E0M0FY3OpmWuZ++1Ncx9CzQL456Uxnr/IuV2zZEm3ewr4HmdDydfkgu+b
         YO/24kfTyn6i6tXMSocAYVK0Zrla4ZKfwAQ3keRJnJlv7PIgfWTIBzvjUG4vLoBmgOg4
         mD6vzYW3348ibDI5PqknDZawjaCwgrrZ/M0DIlyB6BYPbHn1tHzdxbevAz059T35Qu3q
         Lo4slEZRB2ddWQCIBMBUPSJtuq67q8N8C9ot5HiFYLdqC99Ec9NXv5CG2X0YEbUP0hyi
         gCTw==
X-Gm-Message-State: AFqh2kqUvHtFZqmej+VflgSVz0cUcJ2Q6wyiiJGcdk6zHYuR1/VBUNN9
	CKphOvnTHUYtryefZnVG2TjjcSt0D+mmZwSg
X-Google-Smtp-Source: AMrXdXvHgSR4fUdv2mDs8yPnk3erGJqTyrf+NBA+AQPGq50vqeAyyv2VCw2aE2v4B9xfpraV6QGDcg==
X-Received: by 2002:a05:600c:a51:b0:3cf:6f4d:c259 with SMTP id c17-20020a05600c0a5100b003cf6f4dc259mr40205784wmq.39.1673080978075;
        Sat, 07 Jan 2023 00:42:58 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u8-20020a05600c19c800b003d9780466b0sm5041258wmq.31.2023.01.07.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Jan 2023 00:42:57 -0800 (PST)
Date: Sat, 7 Jan 2023 11:42:52 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Jiri Olsa <jolsa@kernel.org>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev
Subject: [jolsa-perf:bpf/tracing_multi_5 15/27] kernel/bpf/trampoline.c:1341
 check_multi_trampoline() warn: passing zero to 'PTR_ERR'
Message-ID: <202301071053.q6dvJmIi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230107084252.UOP-zeaYOiMqAeydAnDH63Vx_UmFjPlcO9yBKYsNYNQ@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jolsa/perf.git bpf/tracing_multi_5
head:   45ca925f42727b7feae7acd15e47534a1f9693b7
commit: 061bc4744b2f3826d77e1313f3bf63aab66b0ad3 [15/27] bpf: Make single trampolines aware of multi
config: i386-randconfig-m021
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
kernel/bpf/trampoline.c:1341 check_multi_trampoline() warn: passing zero to 'PTR_ERR'

vim +/PTR_ERR +1341 kernel/bpf/trampoline.c

061bc4744b2f38 Jiri Olsa 2023-01-06  1317  static int check_multi_trampoline(u64 key)
061bc4744b2f38 Jiri Olsa 2023-01-06  1318  {
061bc4744b2f38 Jiri Olsa 2023-01-06  1319  	struct btf_bitmap *bmap_tmp, *bmap_new;
061bc4744b2f38 Jiri Olsa 2023-01-06  1320  	struct bpf_trampoline *tr, *tr_new;
061bc4744b2f38 Jiri Olsa 2023-01-06  1321  	u32 obj_id, btf_id;
061bc4744b2f38 Jiri Olsa 2023-01-06  1322  	int err;
061bc4744b2f38 Jiri Olsa 2023-01-06  1323  
061bc4744b2f38 Jiri Olsa 2023-01-06  1324  	bpf_trampoline_unpack_key(key, &obj_id, &btf_id);
061bc4744b2f38 Jiri Olsa 2023-01-06  1325  	if (obj_id != btf_obj_id(btf_vmlinux))
061bc4744b2f38 Jiri Olsa 2023-01-06  1326  		return 0;
061bc4744b2f38 Jiri Olsa 2023-01-06  1327  
061bc4744b2f38 Jiri Olsa 2023-01-06  1328  	tr = in_multi_trampoline(btf_id);
061bc4744b2f38 Jiri Olsa 2023-01-06  1329  	if (!tr)
061bc4744b2f38 Jiri Olsa 2023-01-06  1330  		return 0;
061bc4744b2f38 Jiri Olsa 2023-01-06  1331  
061bc4744b2f38 Jiri Olsa 2023-01-06  1332  	bmap_new = btf_bitmap_funcs_id(btf_id);
061bc4744b2f38 Jiri Olsa 2023-01-06  1333  	bmap_tmp = btf_bitmap_funcs_alloc();
061bc4744b2f38 Jiri Olsa 2023-01-06  1334  	if (!bmap_new || !bmap_tmp) {
061bc4744b2f38 Jiri Olsa 2023-01-06  1335  		err = -ENOMEM;
061bc4744b2f38 Jiri Olsa 2023-01-06  1336  		goto out;
061bc4744b2f38 Jiri Olsa 2023-01-06  1337  	}
061bc4744b2f38 Jiri Olsa 2023-01-06  1338  
061bc4744b2f38 Jiri Olsa 2023-01-06  1339  	tr_new = trampoline_multi_split_trampoline(tr, bmap_new);
061bc4744b2f38 Jiri Olsa 2023-01-06  1340  	if (!tr_new) {
061bc4744b2f38 Jiri Olsa 2023-01-06 @1341  		err = PTR_ERR(tr_new);

Same.

061bc4744b2f38 Jiri Olsa 2023-01-06  1342  		goto out;
061bc4744b2f38 Jiri Olsa 2023-01-06  1343  	}
061bc4744b2f38 Jiri Olsa 2023-01-06  1344  
061bc4744b2f38 Jiri Olsa 2023-01-06  1345  	btf_bitmap_copy(bmap_tmp, tr->multi.bmap);
061bc4744b2f38 Jiri Olsa 2023-01-06  1346  	btf_bitmap_andnot(tr->multi.bmap, tr->multi.bmap, bmap_new);
061bc4744b2f38 Jiri Olsa 2023-01-06  1347  	err = trampoline_multi_reset_bmap(tr, NULL);
061bc4744b2f38 Jiri Olsa 2023-01-06  1348  	if (err) {
061bc4744b2f38 Jiri Olsa 2023-01-06  1349  		btf_bitmap_copy(tr->multi.bmap, bmap_tmp);
061bc4744b2f38 Jiri Olsa 2023-01-06  1350  		bpf_trampoline_free(tr_new);
061bc4744b2f38 Jiri Olsa 2023-01-06  1351  	}
061bc4744b2f38 Jiri Olsa 2023-01-06  1352  out:
061bc4744b2f38 Jiri Olsa 2023-01-06  1353  	btf_bitmap_free(bmap_new);
061bc4744b2f38 Jiri Olsa 2023-01-06  1354  	btf_bitmap_free(bmap_tmp);
061bc4744b2f38 Jiri Olsa 2023-01-06  1355  	return err;
061bc4744b2f38 Jiri Olsa 2023-01-06  1356  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

