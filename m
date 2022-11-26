Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EC47EB1C;
	Sat, 26 Nov 2022 08:22:34 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t1so4974544wmi.4;
        Sat, 26 Nov 2022 00:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AX4uPstLPmapboAHG/8EhnSKAVJr6kDq0EfeIFDmmEY=;
        b=kAYwmTeXqxdjk7aewb+BC/Yu/CGb5n3JxUzDkPkVwMPGFFDe3M0wxTPeanVdm0QtLw
         983138jitAdwLnP6+lot0Gzli+OOZ8RZGxK69a8HE7QLKv3tlRrYUdsdNlXNUgPMFFbd
         5Q0tYFghULa+ZyO2emGfPHs94J/Y3ExJKdoQq9mNG4DjL9xyQQT9fI+N8Z/EkXDTFzog
         A0DOEI7n+G4tYFQYqOpb3b3jsJyLuQiYmeGmmHg+lgDMf5Q61/47/xVK+XsX8gEga5cH
         8BCZxhhk48tngRiTV0wXL4MDAm6TcPrCCQkOK/9ShZVSx1boefeO5zURXEJdQ2ClFbcf
         CYyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AX4uPstLPmapboAHG/8EhnSKAVJr6kDq0EfeIFDmmEY=;
        b=cRvQTvoB8jsiWLXHtP/CKsRxw3tL8xyCWoE/ardKA9p9kl+hIci81lPe3/jKTZPzgL
         uYJgOB6mrKcG6cFf0iIqyYaVRvWdSntBXUGOi8OV/DV7LDn4r+BlV6QFUMhO8mTh3+bV
         QNemWdZTG1gLnE1WbjtUBIYmwuAZaBps2ex03as8zCoOFhRWuWc5YSSdz5ppFuaf7DZ4
         fHIi8DJwWsgRf594WC8rJg/2mVIH1U2ZLaCAsW8nzE4A0T2bGCf6Fsz2W66WmRzF+HB3
         c+Ia62gjmsgd6ePBTRk/XhA+hN/C13HE3kkc5DKsnAK3iGSpsGG3jteDcTGfV422Ohbu
         8PSQ==
X-Gm-Message-State: ANoB5pnyozpkZQD6NszHXNr2k5DtchXGZszeQnw5aAnhwCQLowoihgBL
	wLr6Lfu+YuRCH98rvcQOSuNc0CgCs2U=
X-Google-Smtp-Source: AA0mqf66MeMZ7HVhxLVNHsJylNLbP/7dLqx7YO0TqNYhly1PFknOnRtCg6re2kvU8C3JTyH9+mJjNQ==
X-Received: by 2002:a05:600c:4e47:b0:3cf:5657:4717 with SMTP id e7-20020a05600c4e4700b003cf56574717mr34357225wmq.87.1669450951991;
        Sat, 26 Nov 2022 00:22:31 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id u17-20020a05600c19d100b003c6f8d30e40sm12691416wmq.31.2022.11.26.00.22.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 00:22:31 -0800 (PST)
Date: Sat, 26 Nov 2022 11:22:26 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev,
	Alexander Antonov <alexander.antonov@linux.intel.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Peter Zijlstra <peterz@infradead.org>,
	Kan Liang <kan.liang@linux.intel.com>
Subject: [peterz-queue:perf/core 16/25]
 arch/x86/events/intel/uncore_snbep.c:4345 skx_upi_topology_cb() error:
 uninitialized symbol 'ret'.
Message-ID: <202211261622.DVSer6Ok-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20221126082226.zDd6PqOJ80VhCS11Vy0mpFaEycYHcRTCHuJlPF8kfBo@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git perf/core
head:   415db869ef56751c4ab72f0f58cd7224213bb357
commit: c1c1942b49ea5cb87680ea3019231b65480129c0 [16/25] perf/x86/intel/uncore: Enable UPI topology discovery for Skylake Server
config: x86_64-randconfig-m001
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>

smatch warnings:
arch/x86/events/intel/uncore_snbep.c:4345 skx_upi_topology_cb() error: uninitialized symbol 'ret'.

vim +/ret +4345 arch/x86/events/intel/uncore_snbep.c

c1c1942b49ea5c Alexander Antonov 2022-11-17  4323  static int skx_upi_topology_cb(struct intel_uncore_type *type, int segment,
c1c1942b49ea5c Alexander Antonov 2022-11-17  4324  				int die, u64 cpu_bus_msr)
c1c1942b49ea5c Alexander Antonov 2022-11-17  4325  {
c1c1942b49ea5c Alexander Antonov 2022-11-17  4326  	int idx, ret;
c1c1942b49ea5c Alexander Antonov 2022-11-17  4327  	struct intel_uncore_topology *upi;
c1c1942b49ea5c Alexander Antonov 2022-11-17  4328  	unsigned int devfn;
c1c1942b49ea5c Alexander Antonov 2022-11-17  4329  	struct pci_dev *dev = NULL;
c1c1942b49ea5c Alexander Antonov 2022-11-17  4330  	u8 bus = cpu_bus_msr >> (3 * BUS_NUM_STRIDE);
c1c1942b49ea5c Alexander Antonov 2022-11-17  4331  
c1c1942b49ea5c Alexander Antonov 2022-11-17  4332  	for (idx = 0; idx < type->num_boxes; idx++) {
c1c1942b49ea5c Alexander Antonov 2022-11-17  4333  		upi = &type->topology[die][idx];
c1c1942b49ea5c Alexander Antonov 2022-11-17  4334  		devfn = PCI_DEVFN(SKX_UPI_REGS_ADDR_DEVICE_LINK0 + idx,
c1c1942b49ea5c Alexander Antonov 2022-11-17  4335  				  SKX_UPI_REGS_ADDR_FUNCTION);
c1c1942b49ea5c Alexander Antonov 2022-11-17  4336  		dev = pci_get_domain_bus_and_slot(segment, bus, devfn);
c1c1942b49ea5c Alexander Antonov 2022-11-17  4337  		if (dev) {

This code assumes we will always find at least one device.

c1c1942b49ea5c Alexander Antonov 2022-11-17  4338  			ret = upi_fill_topology(dev, upi, idx);
c1c1942b49ea5c Alexander Antonov 2022-11-17  4339  			if (ret)
c1c1942b49ea5c Alexander Antonov 2022-11-17  4340  				break;
c1c1942b49ea5c Alexander Antonov 2022-11-17  4341  		}
c1c1942b49ea5c Alexander Antonov 2022-11-17  4342  	}
c1c1942b49ea5c Alexander Antonov 2022-11-17  4343  
c1c1942b49ea5c Alexander Antonov 2022-11-17  4344  	pci_dev_put(dev);
c1c1942b49ea5c Alexander Antonov 2022-11-17 @4345  	return ret;
c1c1942b49ea5c Alexander Antonov 2022-11-17  4346  }

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp

