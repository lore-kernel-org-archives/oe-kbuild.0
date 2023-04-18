Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 069AA15B8;
	Tue, 18 Apr 2023 04:25:48 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id gw13so14861459wmb.3;
        Mon, 17 Apr 2023 21:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681791947; x=1684383947;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WW5WrNueTiO3CW+MM6qDR8C8PYaeglvNUKKUr72PzWI=;
        b=WNWsheRGFXizRXYPuBut24JfvzwGDLyViqZw1gpo0ah2mmBzP978cjaWCj4wpzKN8I
         6dhpJfv3NDfv2AEEDWp1iAdneQtSIEHgFVx6w2lluEiv2pT4RjE9/8xHIJmq+OWke87X
         eJna+K4XnSs0a/p5Pj4ilqRW7gIr6/BqlpkrUNpEGOm8HEQyWht4PVqMwsH+bAqsCTim
         dNELlOrubEhUUQa/hyqmjtsHsR8kGhwxgmCrwhAVHZ1b14EZ4z9vLmayGfBNgNtgc0Mx
         Cs/wOev/ubukLXLucQcwtRLR6kOplIFtXZHrRJFkK6UjZgQY0QJRH4k0fGnK4u3rf4mI
         G3Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681791947; x=1684383947;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WW5WrNueTiO3CW+MM6qDR8C8PYaeglvNUKKUr72PzWI=;
        b=XU/NWGCsuAk8wE5VcxPhPPnwZhLmzR8ZeBoU/HquCT+tj0HZp8neIBwh63o7P/MDR5
         dHsUvgzvJK5AtwBvq6HbnDwaTvrOYQMZbIVlMKhqapyPMFmjsVCJ7MuSLpOye9wuyMbd
         jHVYyGGtJYVpf4PslcYAmeN2I3Ul2e7/jyHXUhdt7tS42ri7WKv8fy/iZLcDUefKWJyz
         U8jXI4H7H6iluSZooezkOKu25R5FKHDytE+BJw6YN3arX+/Ja3xeIdwnq0e/oV4yb8Bu
         7eIJuMOqhQG/5jp20692/IL1ef8qZjWfvu58JhXvkDJ3ajYfAt6z45hEN4RRROGPgnEh
         wH2g==
X-Gm-Message-State: AAQBX9cUHHrn3CEym8gUQwdYd5FOw7FyjT/plsZv78h9eHzslwfR6XES
	xWpBG2bFr9+M63gOkBhJdNrez9xvna+U2QxM
X-Google-Smtp-Source: AKy350aOmgzs3ZLCHUrSSw7oajzxhMJpYK3jJ683N49aXr0gyL/ER/h/x1JkCKeIFg7SpTmmV1wzuQ==
X-Received: by 2002:a7b:c848:0:b0:3f1:7368:ccc6 with SMTP id c8-20020a7bc848000000b003f17368ccc6mr3920483wml.25.1681791946666;
        Mon, 17 Apr 2023 21:25:46 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id 26-20020a05600c021a00b003f17848673fsm1210492wmi.27.2023.04.17.21.25.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Apr 2023 21:25:46 -0700 (PDT)
Date: Tue, 18 Apr 2023 07:25:41 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Xiubo Li <xiubli@redhat.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	ceph-devel@vger.kernel.org
Subject: [ceph-client:testing 77/77] fs/ceph/mds_client.c:1957
 wake_up_session_cb() error: potentially dereferencing uninitialized 'cap'.
Message-ID: <1a89b8e8-f52c-4005-a4ad-85935679f275@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/ceph/ceph-client.git testing
head:   3fef7c3fd10c5f078e0f6ec8c683f2d1e14eb05d
commit: 3fef7c3fd10c5f078e0f6ec8c683f2d1e14eb05d [77/77] ceph: fix potential use-after-free bug when trimming caps
config: i386-randconfig-m021-20230417 (https://download.01.org/0day-ci/archive/20230418/202304180424.Dok2kyeU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202304180424.Dok2kyeU-lkp@intel.com/

New smatch warnings:
fs/ceph/mds_client.c:1957 wake_up_session_cb() error: potentially dereferencing uninitialized 'cap'.

Old smatch warnings:
fs/ceph/mds_client.c:219 parse_reply_info_in() warn: missing unwind goto?

vim +/cap +1957 fs/ceph/mds_client.c

3fef7c3fd10c5f Xiubo Li    2023-04-14  1945  static int wake_up_session_cb(struct inode *inode, struct rb_node *ci_node, void *arg)
2f2dc053404feb Sage Weil   2009-10-06  1946  {
0dc2570fab222a Sage Weil   2009-11-20  1947  	struct ceph_inode_info *ci = ceph_inode(inode);
d2f8bb27c87945 Yan, Zheng  2018-12-10  1948  	unsigned long ev = (unsigned long)arg;
3fef7c3fd10c5f Xiubo Li    2023-04-14  1949  	struct ceph_cap *cap;
0dc2570fab222a Sage Weil   2009-11-20  1950  
d2f8bb27c87945 Yan, Zheng  2018-12-10  1951  	if (ev == RECONNECT) {
be655596b3de58 Sage Weil   2011-11-30  1952  		spin_lock(&ci->i_ceph_lock);
0dc2570fab222a Sage Weil   2009-11-20  1953  		ci->i_wanted_max_size = 0;
0dc2570fab222a Sage Weil   2009-11-20  1954  		ci->i_requested_max_size = 0;
be655596b3de58 Sage Weil   2011-11-30  1955  		spin_unlock(&ci->i_ceph_lock);
d2f8bb27c87945 Yan, Zheng  2018-12-10  1956  	} else if (ev == RENEWCAPS) {
52d60f8e18b855 Jeff Layton 2021-06-04 @1957  		if (cap->cap_gen < atomic_read(&cap->session->s_cap_gen)) {
                                                            ^^^^^^^^^^^^               ^^^^^^^^^^^^^

d2f8bb27c87945 Yan, Zheng  2018-12-10  1958  			/* mds did not re-issue stale cap */
d2f8bb27c87945 Yan, Zheng  2018-12-10  1959  			spin_lock(&ci->i_ceph_lock);
3fef7c3fd10c5f Xiubo Li    2023-04-14  1960  			cap = rb_entry(ci_node, struct ceph_cap, ci_node);
                                                                ^^^^^^^^^^^^^^
Initialized too late.

3fef7c3fd10c5f Xiubo Li    2023-04-14  1961  			if (cap)
d2f8bb27c87945 Yan, Zheng  2018-12-10  1962  				cap->issued = cap->implemented = CEPH_CAP_PIN;
d2f8bb27c87945 Yan, Zheng  2018-12-10  1963  			spin_unlock(&ci->i_ceph_lock);
d2f8bb27c87945 Yan, Zheng  2018-12-10  1964  		}
d2f8bb27c87945 Yan, Zheng  2018-12-10  1965  	} else if (ev == FORCE_RO) {
0dc2570fab222a Sage Weil   2009-11-20  1966  	}
e536030934aebf Yan, Zheng  2016-05-19  1967  	wake_up_all(&ci->i_cap_wq);
2f2dc053404feb Sage Weil   2009-10-06  1968  	return 0;
2f2dc053404feb Sage Weil   2009-10-06  1969  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

