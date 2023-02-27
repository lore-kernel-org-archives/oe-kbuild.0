Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48AD628;
	Mon, 27 Feb 2023 04:25:22 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id k37so3435533wms.0;
        Sun, 26 Feb 2023 20:25:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WKY+nM73n92PPNk57uTNynvXNt+CICVYCNxlZP1mrDg=;
        b=LmtQWJBHze3Ia9GRyyQvObT5COCtGlIGbDHu4nrcLEWds3cgWjt54fAM6XPL2HNGrH
         SIAF2DU6TLGPrpGEfUgwz7SdolMaLJ+Fu3+moyUSsy73hK8mBSBUJbzAZTFIAgCxBLQB
         2hp+9ZKBn080PrOhSYpDAf7odWHoHOM8ohp6GMftzAXNo3zP77ChH7FwnlUtjqSPns6q
         CvQ5ey+g75CO/gr42zA+vGvOLN8Z943WfsHnUKvnZIlJ1x9oX0FmWTjs41/I+UNK4wyn
         3BIJ+NZ4dLcCYHORGLH3MJjMi7PoN48i4sqIDyKVsKaNJ0IQ8pV9zNBoeNu+X/T0MFSD
         mGnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WKY+nM73n92PPNk57uTNynvXNt+CICVYCNxlZP1mrDg=;
        b=Eq8riI4OIWDJ2KTZDBpMjgPeClBnMBsHpm/EDi/pSjL5Z31eg6QKV5xhb3niBm+o63
         vvvepxnSpVCNy5bsvOyzREe7FOCHYTDNRrQpbxsK1uToCD1G8eFHBOJ6eTnhaFs29kuy
         Gmu+wmRim58kubl5o2TA+a5w5jTy2NmCP3Q8Lu3P12kAK5QHDUSIXT3NpPjIMuoF86Pb
         3FchZkgPl4xFUXl6LZQCmls11Qg4coOz71/W3B4og1UfLXG68ps4ZQhqjbEJ/KlRoA8w
         WO5AlNLjwDFkhcexQgBQmZh4PXHKs1QJ3yIoce4Pk/KKUAhFE13ZoC82HWPX4lCUdT4L
         /ZRQ==
X-Gm-Message-State: AO0yUKUUC6s7GNmakrWlS6ErWic/v8CybhGGz8kJfjzEud9dB8cBCmJr
	aDBaTJ3ZSmnb8AOoBNq169rqH/Ss/ZA=
X-Google-Smtp-Source: AK7set9oWKWHoPK378Dz39H2oIP6OLjKI/lm5WT5tSFlk4qAGO0cK8EJfXNPz67Cf15Re5mQAZrXHg==
X-Received: by 2002:a05:600c:1e1f:b0:3ea:fca4:8c48 with SMTP id ay31-20020a05600c1e1f00b003eafca48c48mr7590460wmb.23.1677471920607;
        Sun, 26 Feb 2023 20:25:20 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id p13-20020a1c544d000000b003e208cec49bsm17688381wmi.3.2023.02.26.20.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 20:25:19 -0800 (PST)
Date: Mon, 27 Feb 2023 07:25:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: oe-kbuild@lists.linux.dev, Rashmica Gupta <rashmica.g@gmail.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, Michael Ellerman <mpe@ellerman.id.au>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Madhavan Srinivasan <maddy@linux.vnet.ibm.com>
Subject: arch/powerpc/perf/mpc7450-pmu.c:422 init_mpc7450_pmu() warn: masked
 condition '((pvr >> 16) & 65535) != 2147483648' is always true.
Message-ID: <202302260657.7dM9Uwev-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Message-ID: <20230227042516.-VZojSSJh45L7NGrOeoNirUEyJGJySgDkrYKa_I_-e4@z>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   116b41162f8b267987ea9a73eb7e73eaa7c2cce5
commit: ec3eb9d941a98f4c0dac263110729680a734279b powerpc/perf: Use PVR rather than oprofile field to determine CPU version
config: powerpc-randconfig-m031-20230226 (https://download.01.org/0day-ci/archive/20230226/202302260657.7dM9Uwev-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Link: https://lore.kernel.org/r/202302260657.7dM9Uwev-lkp@intel.com/

smatch warnings:
arch/powerpc/perf/mpc7450-pmu.c:422 init_mpc7450_pmu() warn: masked condition '((pvr >> 16) & 65535) != 2147483648' is always true.

vim +422 arch/powerpc/perf/mpc7450-pmu.c

77c2342a578c11 arch/powerpc/kernel/mpc7450-pmu.c Dmitry Baryshkov 2011-06-29  418  static int __init init_mpc7450_pmu(void)
7325927e5a20bf arch/powerpc/kernel/mpc7450-pmu.c Paul Mackerras   2009-06-17  419  {
ec3eb9d941a98f arch/powerpc/perf/mpc7450-pmu.c   Rashmica Gupta   2022-07-07  420  	unsigned int pvr = mfspr(SPRN_PVR);
ec3eb9d941a98f arch/powerpc/perf/mpc7450-pmu.c   Rashmica Gupta   2022-07-07  421  
ec3eb9d941a98f arch/powerpc/perf/mpc7450-pmu.c   Rashmica Gupta   2022-07-07 @422  	if (PVR_VER(pvr) != PVR_7450)
                                                                                            ^^^^^^^^^^^^^^^^^^^^^^^^
Impossible.  Unclear what was intended.

7325927e5a20bf arch/powerpc/kernel/mpc7450-pmu.c Paul Mackerras   2009-06-17  423  		return -ENODEV;
7325927e5a20bf arch/powerpc/kernel/mpc7450-pmu.c Paul Mackerras   2009-06-17  424  
7325927e5a20bf arch/powerpc/kernel/mpc7450-pmu.c Paul Mackerras   2009-06-17  425  	return register_power_pmu(&mpc7450_pmu);
7325927e5a20bf arch/powerpc/kernel/mpc7450-pmu.c Paul Mackerras   2009-06-17  426  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests

