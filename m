Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926EB1D2B2
	for <oe-kbuild@lists.linux.dev>; Tue, 23 May 2023 07:15:29 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-3f6042d605dso14768275e9.2
        for <oe-kbuild@lists.linux.dev>; Tue, 23 May 2023 00:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684826127; x=1687418127;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FXrW1oBRVjU/KZt7i1c4n1rhq+4IqQV5f4pk46Oq+VU=;
        b=Pwo9UR+cYHa8VH6ytPHMlr9pPB44YX2jMmryb1fjZGfN8Qd0WrddtILB/f64vJU/bM
         oQBeuKK1Dlc1nEYhLyYEA4uIPMd4FOUaCPohSNckg/JZmPCYU7N/BCP2jmPjp4HOh1ID
         Qtj+gpTJ69VUpjnNx8Gvh9Tae1b1GiJ0uqge/cvPeX9lJeKh927yhbECkko8hwrYZhik
         Sze795r9JaEyVU9/f0ezF+o6JLSVrilNd0N7l8wi8/BooGJGSzzT7MlqhgU8iiEDycWr
         KAmErxX/L4/Bf7hOe9npGjal41zxtRnkc1uK8HGxk0qAcM9IbLpbi64xXjZke5J8moPo
         jM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684826127; x=1687418127;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FXrW1oBRVjU/KZt7i1c4n1rhq+4IqQV5f4pk46Oq+VU=;
        b=kiq02J7Yi+uylY/P7pQWryDAetoh6TdseQUk/UANZc4sPKwn38Pu4m/VIJcYsovxvK
         2jiuCsOknGKXp9yz8mS4wARYUZ5SBZ8zlUxCXoO1rS7dg/SWcIsfDJOYl1FlrfTy7UCu
         tTTmxNswWX5iU7s02CL62x9G0ZD5XxPAWj8U/mg/UPH6MezY6JPAQEPEmfLkOBIVRgkS
         7ptRN2OdPK4W9XtOJwEg6HMHaM8SRZeJHKhKADaKKDdND6KmqiKEwZcmEvoCv2bFy+R1
         Gd0OGEYwylcTthNCzYSo4pqNRAWfuwP4C3ecgcKBxTmc0bHRD/vgE+vPnoc6MxCG9MQV
         uo9A==
X-Gm-Message-State: AC+VfDz3GSjD2+97ygSDgr/ZFtWGl9Xx5/v6ESx+BCxv1O/zYJecGXIB
	7saP+V6wy2zOwdpFjx4jtlva9rgNVdtO5stFNUc=
X-Google-Smtp-Source: ACHHUZ4GEzAMXj5PslgEoS9QUahSftayXrmO0XVYD1zQ8vkMtz0fQhcfYoeHV39wbQ9kB+KR5LQxzw==
X-Received: by 2002:a1c:6a04:0:b0:3f6:c8c:7048 with SMTP id f4-20020a1c6a04000000b003f60c8c7048mr561488wmc.20.1684826126816;
        Tue, 23 May 2023 00:15:26 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id y21-20020a7bcd95000000b003f4e8530696sm10591879wmj.46.2023.05.23.00.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 00:15:24 -0700 (PDT)
Date: Tue, 23 May 2023 10:15:21 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: oe-kbuild@lists.linux.dev, Lijo Lazar <lijo.lazar@amd.com>
Cc: lkp@intel.com, oe-kbuild-all@lists.linux.dev,
	Alex Deucher <alexander.deucher@amd.com>,
	Hawking Zhang <Hawking.Zhang@amd.com>
Subject: [linux-next:master 2827/4223]
 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c:65 amdgpu_xcp_run_transition()
 error: buffer overflow 'xcp_mgr->xcp' 8 <= 8
Message-ID: <8509f4ca-1b61-4384-87c0-ff455648aa84@kili.mountain>
Precedence: bulk
X-Mailing-List: oe-kbuild@lists.linux.dev
List-Id: <oe-kbuild.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   9f258af06b6268be8e960f63c3f66e88bdbbbdb0
commit: 156bf3df0c082ce3feadb27d0306537345c2f42a [2827/4223] drm/amdgpu: Add initial version of XCP routines
config: s390-randconfig-m031-20230522 (https://download.01.org/0day-ci/archive/20230523/202305231453.I0bXngYn-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Dan Carpenter <error27@gmail.com>
| Closes: https://lore.kernel.org/r/202305231453.I0bXngYn-lkp@intel.com/

smatch warnings:
drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c:65 amdgpu_xcp_run_transition() error: buffer overflow 'xcp_mgr->xcp' 8 <= 8

vim +65 drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c

156bf3df0c082c Lijo Lazar 2022-09-16  58  static int amdgpu_xcp_run_transition(struct amdgpu_xcp_mgr *xcp_mgr, int xcp_id,
156bf3df0c082c Lijo Lazar 2022-09-16  59  				     int state)
156bf3df0c082c Lijo Lazar 2022-09-16  60  {
156bf3df0c082c Lijo Lazar 2022-09-16  61  	struct amdgpu_xcp_ip *xcp_ip;
156bf3df0c082c Lijo Lazar 2022-09-16  62  	struct amdgpu_xcp *xcp;
156bf3df0c082c Lijo Lazar 2022-09-16  63  	int i, ret;
156bf3df0c082c Lijo Lazar 2022-09-16  64  
156bf3df0c082c Lijo Lazar 2022-09-16 @65  	if (xcp_id > MAX_XCP || !xcp_mgr->xcp[xcp_id].valid)
                                                    ^^^^^^^^^^^^^^^^
Presumably this should be >= instead of >.

156bf3df0c082c Lijo Lazar 2022-09-16  66  		return -EINVAL;
156bf3df0c082c Lijo Lazar 2022-09-16  67  
156bf3df0c082c Lijo Lazar 2022-09-16  68  	xcp = &xcp_mgr->xcp[xcp_id];
156bf3df0c082c Lijo Lazar 2022-09-16  69  	for (i = 0; i < AMDGPU_XCP_MAX_BLOCKS; ++i) {
156bf3df0c082c Lijo Lazar 2022-09-16  70  		xcp_ip = &xcp->ip[i];
156bf3df0c082c Lijo Lazar 2022-09-16  71  		ret = __amdgpu_xcp_run(xcp_mgr, xcp_ip, state);
156bf3df0c082c Lijo Lazar 2022-09-16  72  		if (ret)
156bf3df0c082c Lijo Lazar 2022-09-16  73  			break;
156bf3df0c082c Lijo Lazar 2022-09-16  74  	}
156bf3df0c082c Lijo Lazar 2022-09-16  75  
156bf3df0c082c Lijo Lazar 2022-09-16  76  	return ret;
156bf3df0c082c Lijo Lazar 2022-09-16  77  }

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki

